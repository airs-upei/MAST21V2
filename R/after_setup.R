after_setup <- function(page_type = "record_midi_page",
                        setup_pages = TRUE,
                        data_collection_method = c("midi", "audio", "key_presses"),
                        get_p_id = TRUE,
                        language,
                        app_name,
                        opening_and_final_image,
                        musicassessr_state,
                        absolute_url = "https://musicog.ca/",
                        final_qualtrics_url = "") {

  data_collection_method <- match.arg(data_collection_method)


  stopifnot(
    page_type %in% c("record_midi_page", "record_audio_page", "record_key_presses_page"),
    is.scalar.logical(setup_pages),
    is.scalar.character(data_collection_method),
    is.scalar.logical(get_p_id)
  )

  # function() {
  psychTestR::make_test(
    psychTestR::join(
      psychTestR::new_timeline(
        psychTestR::join(



          musicassessr::musicassessr_init(),

          welcome_pg <- psychTestR::one_button_page(shiny::tags$div(shiny::tags$h2(paste("Welcome to the UPEI ", 	format(Sys.Date(), "%Y"), " Singing Test")),
                                                                    shiny::tags$img(src = opening_and_final_image, height = 200, width = 200))),




          upei_intro(musicassessr_state),

          musicassessr::setup_pages(input = "microphone", absolute_url = absolute_url, SNR_test = TRUE),
          #
          say_pd(dinosaur_instructions = "Please press the “record” button and read the sentence below out loud: ",
                 body_instructions = 'Although the next short test involves singing,
                                      we would like to start off by asking you to read out loud four short sentences all beginning with the phrase
                                      "The hungry purple dinosaur".  The sentences may sound silly, but together,
                                      they cover all the sounds of the English language.'),

          psychTestR::elt_save_results_to_disk(complete = FALSE),


          musicassessr::long_tone_trials(num_items = 6)

        ),

        dict  = musicassessr::dict(NULL),
        default_lang = language

      ), # end timeline (it's not needed from here onwards, and the SAA is embedded in UPEI_extra_questions, so to avoid nesting)



      mast_21(mast_inst = "You will now have another test of short singing examples.
                    There are 2 sets of 21 questions. The first 20 are very short.
                    Like the previous test, you will hear a melody and be asked to imitate.
                    Unlike the previous test, in which you sang along with the example, now you will listen and then sing: you will hear the example and then sing the imitation after it.
                    You will be asked to sing each of the two sets of 21 examples on a different syllable:  one set on /da/ (“Daah”) and the other on /du/ (“Dooo”).
                    The instructions before each set of 21 examples will let you know which syllable to use.
                    You will also be asked to sing “Happy birthday” on four occasions."),

      psyquest::GMS(),

      UPEI_extra_questions(with_compensation_question = FALSE),

      musicassessr::sing_happy_birthday_page(feedback = FALSE, label = "sing_hbd4", text = "Please sing Happy Birthday."),


      psychTestR::elt_save_results_to_disk(complete = TRUE),

      psychTestR::reactive_page(function(state, ... ) {
        p_id <- psychTestR::get_global('p_id', state)
        url <- paste0(final_qualtrics_url, p_id)
        if(grepl("http", final_qualtrics_url)) {
          psychTestR::final_page(shiny::tags$div(shiny::tags$p("Please click on the following link to go to the final test of this session: ",
                                                               shiny::tags$a(" click here", href = url, target = "_blank"), ".")))
        }

        else {
          psychTestR::final_page(shiny::tags$div(
            shiny::tags$p('Thank You!'),
            shiny::tags$p("You have completed the test.")))
        }

      })

    )
    ,
    opt = upei_test_options(musicassessr_state)
  )
  # }
}


after_setup_GMS <- function(page_type = "record_midi_page",
                        setup_pages = TRUE,
                        data_collection_method = c("midi", "audio", "key_presses"),
                        get_p_id = TRUE,
                        language,
                        app_name,
                        opening_and_final_image,
                        musicassessr_state,
                        absolute_url = "https://musicog.ca/",
                        final_qualtrics_url = "") {

  data_collection_method <- match.arg(data_collection_method)


  stopifnot(
    page_type %in% c("record_midi_page", "record_audio_page", "record_key_presses_page"),
    is.scalar.logical(setup_pages),
    is.scalar.character(data_collection_method),
    is.scalar.logical(get_p_id)
  )

  # function() {
  psychTestR::make_test(
    psychTestR::join(
      psychTestR::new_timeline(
        psychTestR::join(



          musicassessr::musicassessr_init(),

          welcome_pg <- psychTestR::one_button_page(shiny::tags$div(shiny::tags$h2(paste("Welcome to the UPEI ", 	format(Sys.Date(), "%Y"), " GMS Test")),
                                                                    shiny::tags$img(src = opening_and_final_image, height = 200, width = 200))),




          upei_intro(musicassessr_state),

          musicassessr::setup_pages(input = "microphone", absolute_url = absolute_url, SNR_test = TRUE),
          #

          psyquest::GMS()


        ),

        dict  = musicassessr::dict(NULL),
        default_lang = language
      )



    )
    ,
    opt = upei_test_options(musicassessr_state)
  )
  # }
}



after_setup_v2 <- function(page_type = "record_midi_page",
                        setup_pages = TRUE,
                        data_collection_method = c("midi", "audio", "key_presses"),
                        get_p_id = TRUE,
                        language,
                        app_name,
                        opening_and_final_image,
                        musicassessr_state,
                        absolute_url = "https://musicog.ca/",
                        final_qualtrics_url) {

  data_collection_method <- match.arg(data_collection_method)


  stopifnot(
    page_type %in% c("record_midi_page", "record_audio_page", "record_key_presses_page"),
    is.scalar.logical(setup_pages),
    is.scalar.character(data_collection_method),
    is.scalar.logical(get_p_id)
  )

  # function() {
  psychTestR::make_test(
    psychTestR::join(
      psychTestR::new_timeline(
        psychTestR::join(



          musicassessr::musicassessr_init(),

          welcome_pg <- psychTestR::one_button_page(shiny::tags$div(shiny::tags$h2(paste("Welcome to the Part 2 of the UPEI ", 	format(Sys.Date(), "%Y"), " Singing Test")),
                                                                    shiny::tags$img(src = opening_and_final_image, height = 200, width = 200))),



          upei_intro_part2(musicassessr_state),

          musicassessr::setup_pages(input = "microphone", absolute_url = absolute_url, SNR_test = TRUE),


          grandfather_passage(),

          voice_range_test(),

          phonation_duration()

        ),

        dict  = musicassessr::dict(NULL),
        default_lang = language

      ), # end timeline (it's not needed from here onwards, and the SAA is embedded in UPEI_extra_questions, so to avoid nesting)


      musicassessr::get_voice_range_page(with_examples = FALSE),


      make_up_an_ending("Make up an Ending", "Please make up an ending to the following short melody on the syllable “doo”.
                         Listen to the short melody. It will play twice.
                         Then sing the melody and make up an ending to it. It can be as long or as short as you like.",
                        "Please make up an ending to the following short melody on the syllable “doo”."),

      sing_favourite_song("Please sing your favourite song."),

      psychTestR::elt_save_results_to_disk(complete = TRUE),

      psychTestR::reactive_page(function(state, ... ) {
        p_id <- psychTestR::get_global('p_id', state)
        psychTestR::final_page(shiny::tags$div(
          shiny::tags$p('Thank You!'),
          shiny::tags$p("You have completed the test.")))
      })

    ),
    opt = upei_test_options(musicassessr_state)
  )
  # }
}

