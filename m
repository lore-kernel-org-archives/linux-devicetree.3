Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212E3E1CF4
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244812; cv=none; b=pKxJrdj5hJAbQrNXrKrDOYPWQRR4dX6s3rFkf/pqnXLhtlk4vcRkgN1erHYlAm1lYt8xabGFpEwHl1c4yMxSdqOuDk9Hdaq+S3R9OIde1bbu7YaP2PIRm7Svas/RUVQXWvxxd8VTwBiYRJb+DRjBHD7UEf6DkPk3GJTLIPSPENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244812; c=relaxed/simple;
	bh=5gO6npexgo7th4yWru6p4t8YuaeWr0gCCknKoQ5U+NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NgOSQTPpeDP96zkrV7P4PNUI+uabPit+TWw8vGqdcA16Np2v3hFaKi/4TchTNziKhsHUNFGuIxos7DnyHzBcL4wkDV33uAu7udvGzxl5fKIz6aUumwORw5ApjSinrJOqILGbEAiS/pSQ7tTjqI3YiHLD5k2lpyTcxohmUNZYOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GCp7h3xs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GCp7h3xs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba545100a13so340998466b.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244809; x=1778849609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2w0ldg67Kx7W7htSiAB7dV1/ur2vkooDzTmdvNdijms=;
        b=GCp7h3xs3Abp3GlPrVOtpMD9a6ZmkRrHogQ9oLrE/VZy2wL4lA0Ypv4GiMTSBoeJ2O
         3VoMuvytHN3cRNxdeG5tMkD/EJwq4oWRgGlSF4+2avVCZAFTqCZ2IFi/HYBsCVUxhJiS
         /Y55EE9pnmQ0JkdyGa9Yrso/ea5heWMwLpSNyNr4nZWJUb8WNXpaSqhBRojmmpFCGOTl
         Vq6QbyfP6sJM1oL/p/jSgXpZ3RkcXz9aq1phwPc2Bo4HfibkjVgeG4EhnrNIvVwNQTlx
         u7irn7bhGTDh9C6V6rQdLwZevqjDZca7qiYz2+CisRo42T8I3hr+uOK1bWd8ACLdVwWp
         eTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244809; x=1778849609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2w0ldg67Kx7W7htSiAB7dV1/ur2vkooDzTmdvNdijms=;
        b=GgYuGs0GUdiBfIykqy6aaXDkZSilyoAuGncKLtBPF08R6WwuWHsXnI2mMq2BTW0Xhj
         hsjQvLzajfCWEqF3QrVR6p0zrADRurn7/JV83ClG8YxVgJXSuYDHZwGeD/lJ6oh0JsEu
         wfpvWHXumZZrFOv4HWYOo0H8lZ0PG3Pw6Z5KTHThSIZrT+G7l6eaP7TT55wERwpb5qj/
         4YuJvhJ9IKdrcToHWsV7L0MtGbaVAodvAKEXZkTzJpiVIHWs/1rMsbgcOJHsSCSjArwT
         FcHRiA6p2KlIRYduKUtPXSvvObUmxIBoi9gE/ikCLepcbp+Zs7fxg6+4yaNAtM7hIYyV
         6SiA==
X-Forwarded-Encrypted: i=1; AFNElJ/91Qd4kr10K1WRQ0yqHfiwfUmwtRrGit7ll+iDItZOD8Z73UgmLdlN4niArW1tsoIJnCd9pMZ3pg6d@vger.kernel.org
X-Gm-Message-State: AOJu0YyP79ObsfKWbU59l25hnloz4GYMnRDK0UVPlDo/UmkXqO0xqK++
	cha/rzc/ukG/7oFG5cJILBAmM5CVf0ZrIe0hrhZm0UxLMsRC0C4kf0fsMJfPLAEGnf8=
X-Gm-Gg: AeBDietwZQ/qw7JRZnbEu2QsxihihgA3BpI8R43ooQDx5XLqH0tu+ox5CmSpGiwHEK4
	QWps+Zu7J6Obij0HOLEagsvTCWxAMaa4FZbC89COOWG7wMI+4NvuHjR6N6YoSeqXf9Qp312ME/1
	LFPe1FIRVYg1uoV7x9lF5ocmfRrkhFtRg5EI/pfGpI+IQdOOEfIGPBnLZb+ArX2RE43xHq9mC4W
	K20kQhKhkZreMy9p2tNXEQyV77d4Hcms6A7VgqcGBv+KMOZnkjvbxv5NT/YIy+UuU0BC/NrM2bV
	Y0JyRVOBcNU0ElvVFZ1bIcuvxxuFy8lVsNffEYXHM/T67IFHT5JJDTIbgvqqkebfHlKqfS2yTSQ
	Tgnr0gStYO6WQfhZTvY7zZntZLK9AED98Bj5J6/jXMG89e4twyakFBiFGKCBAse2IduLynaCEEG
	onCvW8hX2ke8o12lQLe3QEGDn/x2HkteEXdppXckdNqz0RL7zbfqdvpVg4zBAln+sakidnRNYq3
	q7t3uvyMGRriqXOw8/b
X-Received: by 2002:a17:907:7205:b0:ba8:e7b5:1106 with SMTP id a640c23a62f3a-bc56e01b348mr733763566b.43.1778244808667;
        Fri, 08 May 2026 05:53:28 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:28 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Fri, 08 May 2026 14:53:15 +0200
Subject: [PATCH RFC 3/4] Input: gpio-keys - add regulator to gpio_keys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-gpiokeys-vdd-supply-v1-3-0bb32e8e6428@fairphone.com>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=3314;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=5gO6npexgo7th4yWru6p4t8YuaeWr0gCCknKoQ5U+NA=;
 b=4QSIAQbxI0W8K8el+9bhadM8rW5gb7l5/joZ0qCZtpqAOcIRMsdoI8SFaBNyEdgGwaME96pOn
 YqdAA1xDYrlDhX6GdCPyTLXG+iSpUO9IMK6q4SMf9HIrColb7icPAwN
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Allow gpio-keys to have vdd power suppy through regulators.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/input/keyboard/gpio_keys.c | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/gpio_keys.h          |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index e196174856796b391f14c31da9b2fee5ff742172..2199ce7455cfc763569e173d4d18da92507f38d3 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -28,6 +28,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/spinlock.h>
+#include <linux/regulator/consumer.h>
 #include <dt-bindings/input/gpio-keys.h>
 
 struct gpio_button_data {
@@ -729,6 +730,7 @@ static int gpio_keys_open(struct input_dev *input)
 	struct gpio_keys_drvdata *ddata = input_get_drvdata(input);
 	const struct gpio_keys_platform_data *pdata = ddata->pdata;
 	int error;
+	int i;
 
 	if (pdata->enable) {
 		error = pdata->enable(input->dev.parent);
@@ -736,19 +738,48 @@ static int gpio_keys_open(struct input_dev *input)
 			return error;
 	}
 
+	for (i = 0; i < pdata->nbuttons; i++) {
+		const struct gpio_keys_button *button = &pdata->buttons[i];
+
+		if (!button->regulator)
+			continue;
+		error = regulator_enable(button->regulator);
+		if (error)
+			goto reg_err;
+	}
+
 	/* Report current state of buttons that are connected to GPIOs */
 	gpio_keys_report_state(ddata);
 
 	return 0;
+
+reg_err:
+	for (--i; i >= 0; i--) {
+		const struct gpio_keys_button *button = &pdata->buttons[i];
+
+		if (!button->regulator)
+			continue;
+		regulator_disable(button->regulator);
+	}
+	return error;
 }
 
 static void gpio_keys_close(struct input_dev *input)
 {
 	struct gpio_keys_drvdata *ddata = input_get_drvdata(input);
 	const struct gpio_keys_platform_data *pdata = ddata->pdata;
+	int i;
 
 	if (pdata->disable)
 		pdata->disable(input->dev.parent);
+
+	for (i = 0; i < pdata->nbuttons; i++) {
+		const struct gpio_keys_button *button = &pdata->buttons[i];
+
+		if (!button->regulator)
+			continue;
+		regulator_disable(button->regulator);
+	}
 }
 
 /*
@@ -829,6 +860,16 @@ gpio_keys_get_devtree_pdata(struct device *dev)
 					 &button->debounce_interval))
 			button->debounce_interval = 5;
 
+		if (fwnode_property_present(child, "vdd-supply")) {
+			button->regulator = devm_fwnode_regulator_get_optional(dev, child, "vdd");
+			if (IS_ERR(button->regulator)) {
+				if (PTR_ERR(button->regulator) != -ENODEV)
+					return dev_err_ptr_probe(dev, PTR_ERR(button->regulator),
+								 "Failed to get regulator\n");
+				button->regulator = NULL;
+			}
+		}
+
 		button++;
 	}
 
diff --git a/include/linux/gpio_keys.h b/include/linux/gpio_keys.h
index 80fa930b04c6795eb7c6143a79655a6f918446eb..66e786ad7eba407dbea2545941f5b6e464a4f61c 100644
--- a/include/linux/gpio_keys.h
+++ b/include/linux/gpio_keys.h
@@ -3,6 +3,7 @@
 #define _GPIO_KEYS_H
 
 #include <linux/types.h>
+#include <linux/regulator/consumer.h>
 
 struct device;
 
@@ -36,6 +37,7 @@ struct gpio_keys_button {
 	int value;
 	unsigned int irq;
 	unsigned int wakeirq;
+	struct regulator *regulator;
 };
 
 /**

-- 
2.43.0

