Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638162;
	b=JDbgnrIBCC64WHtHjN+rTawMuyv3IvC3Gn24//96GzP5nsRXbIfh99oInotzcFoAy7L8
	 vlN+Xk7abeYUM5bTJwVWlQmqGxtGxLPC15bVmlkGn7jt3yDV/JRPsYft1G2q9lSxPn8Ms
	 CAN4KtEsxhWAW3d/sNyEI9oY6cUM54hOFMfR5Z64X3nTjxtG0zAA5yoQ3++fYm8oQct03
	 /98yQ1Lhx6xPvJi8ybq/F7eEK28IVub/a/DDQGijOXwyyxtxxYcSlj+1IOvicXyxATACy
	 4xCAJqi5OhOJ0kgQXUQPG8ifmQg4M536hwgSO87ZSXwbZV7mi3Ngh1WCSDNRot383tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638162;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vLO+3to2ifdHl+Ks1bFGEuKH9kn1cjMkuQMwhtsS+Wc=;
	b=SNUpazQWyIuMjY870KbzifBhHJiVGrX58ph4CtNAhA2E0gxT/kOR2oI1ncIMmP8NdCjc
	 bvg7mMniKrFFNNYGmKPsDk60vDIGijjr+9hFEGacVT9rETcZWhpI6+XRK8Y+zZOohkNo8
	 67S/eV/I7afRODBG6YyROEx/erpH0ok07SbgJZ57V4tXtKVY65pbDzZm3BZTlv533/jSf
	 YkXIpRH3vYIMR4QBUXq0XbTqBwzfsddNpc3qaa5gHUR2AHvehHmB1f3o7i05ijJTZDyh0
	 LWQnWk5VVzGm9/07z+NHSTlkcSehl10N5GJw4T78XJRsF4FmHLIveP5FFqMQ+Ebcy6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD4606A688
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DD4606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4efdc8c20so38328927b3.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638161; x=1796242961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLO+3to2ifdHl+Ks1bFGEuKH9kn1cjMkuQMwhtsS+Wc=;
        b=QNyeMHlgOzPT6DDdX7/knek0S07ULq8Ts15aGb3kccpY/H7L/ddMj1ZI/3D8FYQhcZ
         OL/DJ3ozjqvuzfiFxMbLKKlfXj1pmrV3e57xil6GiZu3M28/obKjxqP8AThgL0RIHASA
         2Cf6vP9AbnCB9aPP7PrZw0nH9XbxEHsurkTNnuC4ynR9IB75hTAMMWZ8QHj3POKmJr8X
         i+4JXo8JtQ2k6NyR8/Cez8cjWpXC18LOQmPrBPdocQMSa9jKQR+4cMM9WNkhAySmL6O9
         jlGATYhFw2y/jg02tk+BbwNt0uGILTidkXuOCr6PwfeylXfnrpmqBwJD2+3vKoKlpNLX
         Lvzw==
X-Forwarded-Encrypted: i=1; AL+hErGQvhW3RYfwDSejPhBA742JL06z/Sp+V6yxN/2t26Gi+uDuqNLvvcrhAiZXuttpmm98cXo0EOAJWrUL@vger.kernel.org
X-Gm-Message-State: APuU4Z8RA3qoJbQFSFFeM2MCoaEgsmTr2Qzcbn9FYpBZoEywFooRovSP
	jCex9dVS2mv8/woCIoqiG42m92VGkOUjNs/XkPEAlHJfSjrwfZ4aokys
X-Gm-Gg: AZFdTZcK91AnXO/Kb9oQB6azC71OS3lmxfweuK77J79J1uBpBb2fUbrY3YNdYYBs6+m
	982hyz2RsoN42pzzzmStiQjzjx+ZCCtAi+LbehFHIGwW/Qh4pvMBgJTvWX9sEKasp4yMsuH5Ik9
	xxEa4LNbrFDC2n14izYpb+Q+nwtg3xV4YW8/NmuUcxVlLXW+CSwv4Wd15EXf7ZGo5mycnIIlDti
	I0ybfVRePvrpYpZAOqC8i8xa+zTvSqmnWZu/Y4wIXbrmi8m7KAhFY5iIuRMpHTWDfl+Guj0Xrkf
	TDzuccJSbbIdnCdp8LtSRt+9GP9VznQD6ciezuV/fbgeAiEMjazqI5rbxbiXmocigT/RzQL81C9
	1YQX6rwbf5Zq5QCrVolIrkt6Sf0dwRPJgav3FQWymiyxSWzRT3EZYNws9DUvhhObJKFNdVEhXyX
	8ICVMAYccEFbIW4xg2L1jbuUWyKtCNfIb/Z4/z4SkGOZAqrAwXq0AFOh+81rHFiNAoHgZwm2BHc
	PsMe+b0jcDs0Bz7iL+zVOaP35IoYm0YAUpbNBgk5XCPgXQ1oy2Cu1+f4EzmTawErUlomZrUabxs
	tJhW4wgTtcapWS9Z7a/MuOAC6lAukZpdDB2W9DeLK4lUM/5BKzKYEqjkUZ5vVjCgtLceyt0aU6a
	yzgM1MNfJRcUr3t5LPpLJ7+t2PZtrkHUuSWzUeI0m47O2uWRX1BTDBu3D3BH4CXcvvMa5guytAP
	ak4FxwGtGu9hCXkukRv5bPVsu7
X-Received: by 2002:a05:690c:4a02:b0:8b4:c1ef:7a62 with SMTP id 00721157ae682-8b5204e0b7cmr75810357b3.49.1795638160836;
        Wed, 25 Nov 2026 12:22:40 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:40 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:33 -0500
Subject: [PATCH v2 6/6] iio: potentiometer: mcp4018: Add Analog Devices
 AD5246
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-iio-ad5246-v2-6-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The AD5246 is a 128-position digital rheostat with the same I2C
interface as the MCP4017/18/19: a single data byte writes the 7-bit
wiper and a single-byte read returns it, with no command byte. Add its
four resistance options.

Its resistance is D/128 of the end-to-end value, where the MCP401x's is
D/127. Name the driver for the MCP4018 and compatible parts.

The misc ad525x_dpot driver also knows the AD5246, by I2C id only and
through its own sysfs files. It can't provide an IIO channel, which a
consumer such as dpot-dac needs. The AD5272 is likewise in both drivers.

Tested on an AD5246 at 0x2e, described as adi,ad5246-010 with a
vdd-supply. It probes, out_resistance0_raw_available reads [0 1 127] and
out_resistance_scale reads 78.125000000. Raw writes of 0, 64, 100 and
127 read back the same value, and 128 is rejected. Writes through
iio_write_channel_raw() from an in-kernel consumer of the channel read
back as well (127, 38, 0 and 76).

Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/AD5246.pdf
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/Kconfig   | 10 ++++++----
 drivers/iio/potentiometer/mcp4018.c | 24 ++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/potentiometer/Kconfig b/drivers/iio/potentiometer/Kconfig
index e6a9a3c67845..05833455e82a 100644
--- a/drivers/iio/potentiometer/Kconfig
+++ b/drivers/iio/potentiometer/Kconfig
@@ -70,12 +70,14 @@ config MAX5487
 	  module will be called max5487.
 
 config MCP4018
-	tristate "Microchip MCP4017/18/19 Digital Potentiometer driver"
+	tristate "Microchip MCP4018 and compatible Digital Potentiometer driver"
 	depends on I2C
 	help
-	  Say yes here to build support for the Microchip
-	  MCP4017, MCP4018, MCP4019
-	  digital potentiometer chips.
+	  Say yes here to build support for the following digital
+	  potentiometers and rheostats:
+
+	  - Analog Devices AD5246
+	  - Microchip MCP4017, MCP4018, MCP4019
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called mcp4018.
diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index 75a63a01acef..b593082db4bb 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -1,12 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Industrial I/O driver for Microchip digital potentiometers
+ * Industrial I/O driver for Microchip MCP4018 and compatible digital
+ * potentiometers
  * Copyright (c) 2018  Axentia Technologies AB
  * Author: Peter Rosin <peda@axentia.se>
  *
  * Datasheet: http://www.microchip.com/downloads/en/DeviceDoc/22147a.pdf
+ * Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/AD5246.pdf
  *
  * DEVID	#Wipers	#Positions	Resistor Opts (kOhm)
+ * ad5246	1	128		5, 10, 50, 100
  * mcp4017	1	128		5, 10, 50, 100
  * mcp4018	1	128		5, 10, 50, 100
  * mcp4019	1	128		5, 10, 50, 100
@@ -31,6 +34,10 @@ struct mcp4018_cfg {
 };
 
 enum mcp4018_type {
+	AD5246_005,
+	AD5246_010,
+	AD5246_050,
+	AD5246_100,
 	MCP4018_502,
 	MCP4018_103,
 	MCP4018_503,
@@ -38,6 +45,11 @@ enum mcp4018_type {
 };
 
 static const struct mcp4018_cfg mcp4018_cfg[] = {
+	/* The AD5246's resistance is D / 128 of the end-to-end value */
+	[AD5246_005] = { .kohms =   5, .div = 128, },
+	[AD5246_010] = { .kohms =  10, .div = 128, },
+	[AD5246_050] = { .kohms =  50, .div = 128, },
+	[AD5246_100] = { .kohms = 100, .div = 128, },
 	[MCP4018_502] = { .kohms =   5, .div = MCP4018_WIPER_MAX, },
 	[MCP4018_103] = { .kohms =  10, .div = MCP4018_WIPER_MAX, },
 	[MCP4018_503] = { .kohms =  50, .div = MCP4018_WIPER_MAX, },
@@ -130,6 +142,10 @@ static const struct iio_info mcp4018_info = {
 }
 
 static const struct i2c_device_id mcp4018_id[] = {
+	MCP4018_ID_TABLE("ad5246-005", AD5246_005),
+	MCP4018_ID_TABLE("ad5246-010", AD5246_010),
+	MCP4018_ID_TABLE("ad5246-050", AD5246_050),
+	MCP4018_ID_TABLE("ad5246-100", AD5246_100),
 	MCP4018_ID_TABLE("mcp4017-502", MCP4018_502),
 	MCP4018_ID_TABLE("mcp4017-103", MCP4018_103),
 	MCP4018_ID_TABLE("mcp4017-503", MCP4018_503),
@@ -152,6 +168,10 @@ MODULE_DEVICE_TABLE(i2c, mcp4018_id);
 }
 
 static const struct of_device_id mcp4018_of_match[] = {
+	MCP4018_COMPATIBLE("adi,ad5246-005", AD5246_005),
+	MCP4018_COMPATIBLE("adi,ad5246-010", AD5246_010),
+	MCP4018_COMPATIBLE("adi,ad5246-050", AD5246_050),
+	MCP4018_COMPATIBLE("adi,ad5246-100", AD5246_100),
 	MCP4018_COMPATIBLE("microchip,mcp4017-502", MCP4018_502),
 	MCP4018_COMPATIBLE("microchip,mcp4017-103", MCP4018_103),
 	MCP4018_COMPATIBLE("microchip,mcp4017-503", MCP4018_503),
@@ -214,5 +234,5 @@ static struct i2c_driver mcp4018_driver = {
 module_i2c_driver(mcp4018_driver);
 
 MODULE_AUTHOR("Peter Rosin <peda@axentia.se>");
-MODULE_DESCRIPTION("MCP4018 digital potentiometer");
+MODULE_DESCRIPTION("Microchip MCP4018 and compatible Digital Potentiometer driver");
 MODULE_LICENSE("GPL v2");

-- 
Git-155)

