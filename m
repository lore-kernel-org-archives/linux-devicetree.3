Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100781;
	b=ZWG6F5YziOn7xgipfaAbUTRtMqVGezDvQRZ+yGhpNANzADMQbDQsmf5xK/KpA43gGDJC
	 sTVkvul4Nc+EkWr/Tl6iGqMSasKIeww+gVr791n1XpnGuayYeSu6agDRiMA/6iovyzc8Z
	 VqARpt7FAp9fIaaTuiWiNwWOYCHHdp9clg8teLCw0qnI4pkeQ2WA9a/pJY7G+kzHvoro3
	 /Pv6ubqZfqFnXvFxG7aUu4BfoXDUXuVE9Ddp2vKApAHozlER9mkafKliUwMp7wgkCNWh8
	 fEmsKO9FXbylbQOouD1CzBHaZWMlqOvrE5+lCEcNSGiLdpZZh+yCqBTwwW8dOvm+wDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=h18coJ97y0JJrrUtX0OELiyJF+yAvIMvp05OTNtCshv5hrd4b+RvMNBZWdxHhBPporA/
	 QVjvz2HEwqk1Nd/Pew8NCU0oz+YRGog34dqFzvfDXvsUsRrsjoJBvhiio6Alnj46gictT
	 nbX7/T5adag1emSZ/tkQBkFhyZ7ahKIm68J9khu3wsukmZWfDxtjcm6OEDnK5kUbbGpv9
	 X6dTy4Z3bn2WzusmiM8TyBkQulGMbLlJHZFkXl2TKTp8lekP6ui0cEG2mil0YSNq8ahtC
	 Uk3IYt39gLvlLyrCKF4GUKDJ3T+OUDSKtB/4Kj8P5oKqWXl8USMH2N6OC8YhCF9T0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FysbPPrl;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C360A3837
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869C360A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FysbPPrl
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so5464766a12.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100779; x=1793705579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=FysbPPrl9egILZFnpaxPn0Dc65tbxh1CZJ81fu2H8XpNxGeN25sllD4wx+hX87H8OP
         0MfAMCr5e3RSZo2UvGvDtleAKoNkQeAzWPL+Aj9bbK7MgpNAC3vO5pgr/LcDb/EqUu6r
         hSB23AHtxKJImR+2G/y9WE1rOlPiE/4nUOLN51UCzPFPhbYlbh4aXcTgnSAKQ2US1/RN
         Q/Tgy6m4iLSNbLWOCCG714HDnmzYHmh4e4Os6NZYwaaGdvWcTdNoBsIgrHJK2Ka1uopL
         EdAjvZtITVYPop+c4b4f93tJMwv+l3bJgR51VcWOf8K2k28zZJw6LtLKOuxcfrZOjFwE
         5zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100779; x=1793705579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=fSBr0un6kUYpiKdUHs5L6wFq9a+0VJaoSFmpRIR4KG1C+hdwVdzI4C6N1a7aDQ30Po
         f+uAcQ3b22iXQdc1mlVN6S7vnNQZQfrya9bwH6lvwyB0v0E34WdpHUh1rG51pjWrhims
         YvU2PQzditzscQWrjwEtJVuJvZChvjvXgnSGb/GxE0unrq0z6L4h1RGIgi4PXLWrq/g1
         2KNrPiSHR042VoJxfggTMh6JYVkH63Oad5wUfCwH3KoJ9AFPf6XMjgfyrqwN3PXyec9J
         mYQ4baAV0GqQrM8aLqVbq8bMJsFUYKB+zEjmQTAUavc92tCB1AaIcn114vEbdXQp+I/X
         fnFA==
X-Forwarded-Encrypted: i=1; AKwUvBxYFEVgAby1sFNJofQKnwPzsXMxRd1eBNP1hQwlrKEONFO+SjVSgc8SXWdnqRNL8FYpARjtGebWerjw@vger.kernel.org
X-Gm-Message-State: AFq9FYKv6fAsMU8T5mI+XQfYPDf5qKKcV03L3Ro2BP3ZtdoqFDFsVawW
	3ktWqOYV20l0R5e1vZnCeK4QgKSyCM0Fo99GeN8jeJROORDhRLvuhhJY
X-Gm-Gg: AYBFou0jSNKlx2brtLJJjcPfrMBQqilLggLr94tjlfJCbKZNl1/M59RjjKOG5zVM1FF
	2wnAhkP/Zatk9rt73znF14uZlyD5fYIUJ5uo46cHjRU43WjMPx3ryIAj/XZtLKZQkhlcJSA8YHx
	aVevU8mX1pgdqRIwDkx9Z8WszY4mlJA74J4frxgVPsqGLkWk76PD8bo5Uarza6Pu9dGggmZ1ndU
	8fo+8g+LgCxOv2nKE6Xw2yrtYQql3nCQISH6ODi5OgmDNqZ6iGMYMQgB15Frc2B+Tt2+BmVTBhH
	rpN8uxF2qO+mdvNfE9kwIgkczT6O4D6lWK8BrH8Y3ZnFsDUqV6zFsSuTSpTPa1ILqIS+PEOi04Y
	FWI2CRCFezlf/9jc0YcgGJGgtNzs5aIEPCW2CtDlNaGkQ2QhrGN0qxGPTfo2rHxK6DjY8Nu3oiK
	Lpexr5HP5IYlmXMkgxFUbmfynFK8C9IXD8WXWiIJCHf5kKyUK624Xxn8s9n3zPmWfKSQjG20UAU
	Y6x86M/JqfNQskuTjy5dArnYEP0DHp6f9O9sSfS8XPQwLV7iPyiEw8zzNcgH3sQ5nlxWTHOiq2N
X-Received: by 2002:a17:907:6092:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c46bde9a0eamr971176066b.44.1793100778881;
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
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
Subject: [PATCH v5 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Tue, 27 Oct 2026 13:32:30 +0200
Message-ID: <20261027113230.47538-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
index 6b1040c65373f..657ccbb9a9dc5 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -308,6 +309,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
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

