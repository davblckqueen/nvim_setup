Vim�UnDo� >�^�2,�,���h�qPqE��xdHr�3��      9    vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })   	         
       
   
   
    fio    _�                            ����                                                                                                                                                                                                                                                                                                                                                             fh%     �      	   
          �         
    �         	    5��                          <                      �                         @               �       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        fh.    �                *local win = vim.api.nvim_get_current_win()       B-- Set the winhighlight option to make the left column transparent   Svim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal,SignColumn:Normal')5��                          a                      �                          �                      �                          �                      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        fhQ     �                   �             5��                          �                     �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        fhs     �                   vim.api5��                         �                     �                        �                     �                          �                     �                         �                     �                        �                    �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                        �                    �                        �                    �                        �                    �                        �                    �                        �                    �                     
   �             
       �              
       
   �      
       
       �              
          �      
              5�_�                       (    ����                                                                                                                                                                                                                                                                                                                               '          7       v���    fh�     �               )    vim.api.nvim_set_hl(0, "SignColumn", �             5��       )                  �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                               '          7       v���    fh�    �                 5��                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       fh�    �                $    -- Get the current window handle   .    local win = vim.api.nvim_get_current_win()       F    -- Set the winhighlight option to make the left column transparent   W    vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal,SignColumn:Normal')5��                          <       �               5�_�      	                 8    ����                                                                                                                                                                                                                                                                                                                               8                 v       fie     �      
       �      	       5��                          �               :       5�_�      
           	   	       ����                                                                                                                                                                                                                                                                                                                               8                 v       fil     �      
         9    vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })5��              
                 
               5�_�   	               
   	       ����                                                                                                                                                                                                                                                                                                                               8                 v       fin    �      
         /    vim.api.nvim_set_hl(0, "", { bg = "None" })5��                                              5��