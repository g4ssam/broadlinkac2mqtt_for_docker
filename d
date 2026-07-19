[1mdiff --git a/config/config.go b/config/config.go[m
[1mindex 40267c7..a964917 100644[m
[1m--- a/config/config.go[m
[1m+++ b/config/config.go[m
[36m@@ -51,26 +51,26 @@[m [mfunc NewConfig(logger *slog.Logger) (*Config, error) {[m
 [m
 	files := [...]string{[m
 		"./config/config.yml",[m
[31m-		"/app/config/config.yml",[m
 	}[m
 [m
[31m-	for i := range files {[m
[31m-		if _, err := os.Stat(files[i]); err == nil {[m
[31m-			err := cleanenv.ReadConfig(files[i], cfg)[m
[31m-			if err != nil {[m
[31m-				logger.Error("failed to read config", slog.Any("err", err))[m
[31m-				return nil, err[m
[31m-			}[m
[32m+[m[32m    for i := range files {[m
[32m+[m[32m        if _, err := os.Stat(files[i]); err == nil {[m
 [m
[31m-			err = cleanenv.ReadEnv(cfg)[m
[31m-			if err != nil {[m
[31m-				logger.Error("failed to read env", slog.Any("err", err))[m
[31m-				return nil, err[m
[31m-			}[m
[32m+[m[32m            err := cleanenv.ReadConfig(files[i], cfg)[m
[32m+[m[32m            if err != nil {[m
[32m+[m[32m                logger.Error("failed to read config", slog.Any("err", err))[m
[32m+[m[32m                return nil, err[m
[32m+[m[32m            }[m
 [m
[31m-			return cfg, nil[m
[31m-		}[m
[31m-	}[m
[32m+[m[32m            err = cleanenv.ReadEnv(cfg)[m
[32m+[m[32m            if err != nil {[m
[32m+[m[32m                logger.Error("failed to read env", slog.Any("err", err))[m
[32m+[m[32m                return nil, err[m
[32m+[m[32m            }[m
[32m+[m
[32m+[m[32m            return cfg, nil[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
 [m
 	return nil, errors.New("config file is not found")[m
 }[m
\ No newline at end of file[m
