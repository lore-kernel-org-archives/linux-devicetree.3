Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CFF49C4DB
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301491; cv=none; b=W9C85mnPNJfaUpl9Zg+DROKlFW6yQvbwTuIJpeKdxsvng3YsFqLg4mNcpAYeui197uS4lNFmQwTHaGSf3BMoNGnzXVWRasIJXnGxjCGlRcnUUYlmsjcH8cgvIol89vnrp4aMsl83ks1lgdXzJpIC5+c/geODtcRqg9BUU9Af2f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301491; c=relaxed/simple;
	bh=RKicG9inSH59LqDyHLo+alN4W8WXccEJ9xYX8pNYrPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6fsBJBjoIMvQnzebNlLZvzfUwLlsEel7MEDtt2unckAHuDpIAM2nHxPgEtDGQKAQxZWTY7h02Uk8Py8kgJAVR9qaMGFE1ijoQlOphhec8nfgOLcDmKosW70Wh/txe8RDzHeooiuVAKpR9D99WFPhRGOXoWdQAm7pcAP0uupE4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7Eq+qId; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Eq+qId"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso756813f8f.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301486; x=1791906286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84RUWE34pMwpWgLCCXAmF9nLWAHAulXiL4Hx2352KFY=;
        b=E7Eq+qIdeWd7XGM4ku8Dc5vUQr4RksFpj6mFIVUKq6WOhxhlCJGI09CEkCPcKTFP0u
         4v6RAkQctT8VVa0lI2/ZBxOhU8exSjBmDh+vzqZCnNQu0UW21O/IL60CCndGrzdsreMT
         OXHfiXs79ZmgCYeqWr+tQxZx0//qG3RaQhiJwSnJFkgc0uKx8JmJB2Mlr8o9rkg5Y0mB
         lLZvGPW/n3er34Dh9fnxSM3U7UF9FGzsM3pWlAsMu0+w+SmeMiYdgggoOm7B8AdZdqvC
         onYqSYiRtMrze0vkOK0k9QUwmdysA1yBimHgaSutvFFrOa3OkS1UcXKQlHptRMITE1AI
         twXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301486; x=1791906286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84RUWE34pMwpWgLCCXAmF9nLWAHAulXiL4Hx2352KFY=;
        b=01Jpl0QgnLar7QVPDPiP16sUhP/ai/+G3ZfPWwign2gcaa7ZjjtlY/k0YAmk5kTiuy
         NCddHPJyc4s0V+qjVRPuderhujX7yP6RhFM8RGO+pfEmGUGTqnJ/dmKoEBOhM/DhaKmh
         HHXrWgTCjBySM8pF8fSfQ+s/TC8MXG8FdJbsQrPPvaGywsg+g5FAOIM7tXWp/qzIKC6b
         Wv6GwZTlq0VS8mIODSnvQpYU1oSd3fqlk+6THNaI/BS3bq0eIEZXodp2UNmqd2HZJYSy
         S635bAHwy96FkCZ0VOs7jJX/xsvsc8FvL5S2wxNMsPncoh+9LvUeQsFxCsI0bFeUO8Cs
         c7+w==
X-Forwarded-Encrypted: i=1; AKwUvBwCL6caV5nXPdu1fMwKacW/sQboI+/qGhoN1E+cHmKJOSQ+sUxjPmXG5aELCWgEmsxj4HWelWFkkwRb@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ4lhw2FtztiAhtx6gRhXHMizEHfSJurOWhsO6m0WpQfiabaUv
	2hXgHyKaB1jEgoR3CE6eNzetVkByBB60NsWW1/aaRYZVzhdcN0gvsRie
X-Gm-Gg: AYBFou1fi1Z2hlzK4RudWQrRMDz6P34bA6M5Onn8UhW94xalpy+/RTvkhaEwy3Epab0
	SqNGN439aU20Th6WoKSTnJHnOLeQh2LogqF1nwMTeEfsBqWi6TzB5qRYXI9IUE/vnkdATcVQD0P
	5adG2JUZMCRvHPa/VEBLblLDuFHSUorwaoYSaCG65OX0SyCCoGQs1rAX5VjF80oZVXGgGxgQiK2
	NEwHknHcQ1TLL2oK/XhnQybsRfH9pFXUDtB0Bn20c6YVbQU5YQQ9Bbz1vRmXoAR0GIayITa0S+g
	g5X0DvoklQInC1Phyme1Ae4XSdwSetxh7GhzSKqe1HbHAwFIZ0vfoQUsiXvMfk2bE6avP32fMWH
	joiVfG3eCzDcDkxI1mwupTy/aFq/fQJ4bJ1lG9eswgqvJiTQKtR8k+Bug6yxtC9YLYQGGjzGssh
	YPCqzj4rHuKsCTAWOTuIyKQPmiCJA2v7eOmgtLzTvxasPV3f1KteD1rm4mPpUeMMovW7WBHdNLl
	IJRbj3LlYZrryed8Fs=
X-Received: by 2002:a05:6000:200e:b0:48b:68:592e with SMTP id ffacd0b85a97d-48c6d0f214fmr3093766f8f.4.1791301485534;
        Tue, 06 Oct 2026 08:44:45 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 3/7] regulator: lp872x: Fold driver header into driver file
Date: Tue,  6 Oct 2026 18:44:27 +0300
Message-ID: <20261006154431.318936-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006154431.318936-1-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove need in header file in preparation for pdata probing removal.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c       | 54 +++++++++++++++++++-
 include/linux/regulator/lp872x.h | 86 --------------------------------
 2 files changed, 53 insertions(+), 87 deletions(-)
 delete mode 100644 include/linux/regulator/lp872x.h

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 5b2faddd8110f..13dce4dcdbe14 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -12,10 +12,10 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
-#include <linux/regulator/lp872x.h>
 #include <linux/regulator/driver.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
+#include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
 /* Registers : LP8720/8725 shared */
@@ -92,11 +92,63 @@
 /* dump registers in regmap-debugfs */
 #define MAX_REGISTERS			0x0F
 
+#define LP872X_MAX_REGULATORS		9
+
+#define LP8720_ENABLE_DELAY		200
+#define LP8725_ENABLE_DELAY		30000
+
 enum lp872x_id {
 	LP8720,
 	LP8725,
 };
 
+enum lp872x_regulator_id {
+	LP8720_ID_BASE,
+	LP8720_ID_LDO1 = LP8720_ID_BASE,
+	LP8720_ID_LDO2,
+	LP8720_ID_LDO3,
+	LP8720_ID_LDO4,
+	LP8720_ID_LDO5,
+	LP8720_ID_BUCK,
+
+	LP8725_ID_BASE,
+	LP8725_ID_LDO1 = LP8725_ID_BASE,
+	LP8725_ID_LDO2,
+	LP8725_ID_LDO3,
+	LP8725_ID_LDO4,
+	LP8725_ID_LDO5,
+	LP8725_ID_LILO1,
+	LP8725_ID_LILO2,
+	LP8725_ID_BUCK1,
+	LP8725_ID_BUCK2,
+
+	LP872X_ID_MAX,
+};
+
+enum lp872x_dvs_sel {
+	SEL_V1,
+	SEL_V2,
+};
+
+struct lp872x_dvs {
+	struct gpio_desc *gpio;
+	enum lp872x_dvs_sel vsel;
+	enum gpiod_flags init_state;
+};
+
+struct lp872x_regulator_data {
+	enum lp872x_regulator_id id;
+	struct regulator_init_data *init_data;
+};
+
+struct lp872x_platform_data {
+	u8 general_config;
+	bool update_config;
+	struct lp872x_regulator_data regulator_data[LP872X_MAX_REGULATORS];
+	struct lp872x_dvs *dvs;
+	struct gpio_desc *enable_gpio;
+};
+
 struct lp872x {
 	struct regmap *regmap;
 	struct device *dev;
diff --git a/include/linux/regulator/lp872x.h b/include/linux/regulator/lp872x.h
deleted file mode 100644
index b62e45aa1dd36..0000000000000
--- a/include/linux/regulator/lp872x.h
+++ /dev/null
@@ -1,86 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2012 Texas Instruments
- *
- * Author: Milo(Woogyom) Kim <milo.kim@ti.com>
- */
-
-#ifndef __LP872X_REGULATOR_H__
-#define __LP872X_REGULATOR_H__
-
-#include <linux/regulator/machine.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/consumer.h>
-
-#define LP872X_MAX_REGULATORS		9
-
-#define LP8720_ENABLE_DELAY		200
-#define LP8725_ENABLE_DELAY		30000
-
-enum lp872x_regulator_id {
-	LP8720_ID_BASE,
-	LP8720_ID_LDO1 = LP8720_ID_BASE,
-	LP8720_ID_LDO2,
-	LP8720_ID_LDO3,
-	LP8720_ID_LDO4,
-	LP8720_ID_LDO5,
-	LP8720_ID_BUCK,
-
-	LP8725_ID_BASE,
-	LP8725_ID_LDO1 = LP8725_ID_BASE,
-	LP8725_ID_LDO2,
-	LP8725_ID_LDO3,
-	LP8725_ID_LDO4,
-	LP8725_ID_LDO5,
-	LP8725_ID_LILO1,
-	LP8725_ID_LILO2,
-	LP8725_ID_BUCK1,
-	LP8725_ID_BUCK2,
-
-	LP872X_ID_MAX,
-};
-
-enum lp872x_dvs_sel {
-	SEL_V1,
-	SEL_V2,
-};
-
-/**
- * lp872x_dvs
- * @gpio       : gpio descriptor for dvs control
- * @vsel       : dvs selector for buck v1 or buck v2 register
- * @init_state : initial dvs pin state
- */
-struct lp872x_dvs {
-	struct gpio_desc *gpio;
-	enum lp872x_dvs_sel vsel;
-	enum gpiod_flags init_state;
-};
-
-/**
- * lp872x_regdata
- * @id        : regulator id
- * @init_data : init data for each regulator
- */
-struct lp872x_regulator_data {
-	enum lp872x_regulator_id id;
-	struct regulator_init_data *init_data;
-};
-
-/**
- * lp872x_platform_data
- * @general_config    : the value of LP872X_GENERAL_CFG register
- * @update_config     : if LP872X_GENERAL_CFG register is updated, set true
- * @regulator_data    : platform regulator id and init data
- * @dvs               : dvs data for buck voltage control
- * @enable_gpio       : gpio descriptor for enable control
- */
-struct lp872x_platform_data {
-	u8 general_config;
-	bool update_config;
-	struct lp872x_regulator_data regulator_data[LP872X_MAX_REGULATORS];
-	struct lp872x_dvs *dvs;
-	struct gpio_desc *enable_gpio;
-};
-
-#endif
-- 
2.53.0

