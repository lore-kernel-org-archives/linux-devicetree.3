Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0253162B
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914998; cv=none; b=NEOPEeHCoEBqYC33wVEicXM1HYKpZPzl2oexwLpmK9s0tuMdJ0PQjPfbHaSkC173sE4uunuWnFQYMx5Ju61crvhND7oUobYPeCVN2lOzVIIMSpOCHz+3+v9DQ2tdpioeCSS1WUcT5Hp/hyoXByC3cQiI8dDmkfJGbhLZ8dtzODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914998; c=relaxed/simple;
	bh=wFz9qtE4/v6AkxRE3jysvHKfWx3fP77bQotrkPc2bDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s525ghLsn9JOwoLadG2b7epWywFVDSJHmXYNn97dP3QLpqLzuX/XAg8N6sS7H6//Cp+GHpJcBhIu7dkDDRuemKJvbgXybTyVCQP4GzmoV4HVYb3UYIUYIj6WIA6W22lSU3NtNqrCuZHvxf/D/WIbuLebyWN/hXlKPeKLoLTAtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTko+gwQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTko+gwQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1754115e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914993; x=1792519793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIN9I4fxO+jG+4Tem3JpMlKcKCKDmfxcYWPCA9fO/20=;
        b=oTko+gwQNdA4Wb3V1oj25l8OPKlZc+LbKzo6GTPE2ACXDdqNAiiQp7q4rdbwIP5D4M
         o+VhdYFeU+zUIaNR7X6xpoydLCMhF4ng9j3Go06HRO8JGwCjexdAI3iJ0VxmoTja00VF
         UWnHarfN8XnZTtQv5CQyO0Cj9yv24XVcva11N7AG1QG5ttBCat67zm6fV0HE1fIZdrAQ
         PzTpLFStQmQt9cZ+TxQQIra3RST0eMu23j31uN0u044NFvfWB7L7kOQ4ZoY3auHmZbzS
         T9+5OvwSvyf6ruwYb1T51dC7GvmU5agu8SEySNCdv9YB6SWud/bMxe9l0LF722REK3rW
         8QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914993; x=1792519793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIN9I4fxO+jG+4Tem3JpMlKcKCKDmfxcYWPCA9fO/20=;
        b=nFxaf3gHrpbVxy5TJGg9OnGn+FMnVEKIyUvD7JajdEIPKgIQNuAROJzh45AFqyv+uS
         NMBOv+n5/9ZzUfnrt7uoT1BKdhBYIE9CAiLReJVGNkz4iCx73Sk9uzuImHINLp+P4MuA
         LmExclBq5+uJDvx8jscYS9ZtX9OCgxuDBn8niSQ/D7Ky6BB0OuDmzyQV8CX34YQNUfHA
         A9CBdqO9DeQyCUF+3Yq1cegnl1r01mzlS/kiVvleT9FFTpzL+mZnU+LHW3fnLsczQA5T
         +KVZgABwdWCK+uJSTC1aZk16CxpV3B6769xxyMZo63FfU4osHR3T5kse/fdurZPsHN4H
         zYgw==
X-Forwarded-Encrypted: i=1; AKwUvBwgmUmGARt2XBtfVr4b2HcSYuEhdAeHbh0BQf4SMQ76aSONodVo6nTgZ6mMlMrAaMdB1LZFGU8+fVjZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKARsGXitIOHmGgmC28lX9xTCuOEXsk2IxYrwApmmzrEOVICEy0
	4tr8tilArGexvlfFSA5nrsIbiquxYHKpzQadkeDIKJk1htAG+GRMFCrf
X-Gm-Gg: AYBFou3LUImNBEL0ndwLT0SSRXLIVr+o/IM5Ak7rrL2UwSMuxkJyO7v1NwxipBzyPf6
	dzlvays2cyd42QRKGNDebmfa05lwe+zOYrsp1l4ATeEJh2I2lLzKP0bCIl1TUCLwwwT7bEIGltx
	cRJX0iRoDWhVyXOWUU2CbGLdfvw22gM4E4T5P7YdB3Fm5h6i7dT4OpAC5hLlxIN8x9xXD4Y4So8
	ByCyzTenoxtEPAohwzSGibamtyOloUxXkGn7JJcHG+w48yRgKQtjZHTC9ytt4q62a7s6lNY4fTB
	+DV9Orefk/ImJS/58CdNKZhabbhkrQeIvjuDIFJHJN9GDtKjOxDQEMi+cnLRUqNio+0rZl7kyFy
	TBUhYs1DDxYwJvm0zo0bjVCr9QvYaRfalWHneIRofTsM1QlpcmDNKYXkyCS2Xk4gveDciwXopon
	wP0fVFRU8OHStQ03B4AAQA3kpzCRVswFnP8/T+b+9pBMTiIpUCPVbiS81XgTOdbenUNTRL501aR
	aSOTl3cMTNfQop1488=
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr296577985e9.17.1791914992608;
        Tue, 13 Oct 2026 11:09:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Tue, 13 Oct 2026 21:09:33 +0300
Message-ID: <20261013180933.487013-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index 909c14ee60323..0bd430b90bc1b 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 
 struct aat2870_register {
@@ -309,6 +310,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 9b8eb8df220a7..6f19b19f694fd 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

