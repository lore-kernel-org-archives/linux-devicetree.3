Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870015;
	b=jk+YBUFAqYut+7APZPU2jMiGiMXg2wY6jPbVpaNhZbK7I/DeRymUU56SKqP4piSfENIo
	 JrYGnEAvxGfc8JiuCDb2sFP5FEaJBLWE5XLE929dINkVa9fBRpI/NLl1zjanKezvU0aZx
	 QdFRaNrKleTA6LENfKHljH8gVkKLI6TQTJ5N83BwcvXfyeTeek4eKWl9GlxB5NJweULeW
	 3F/wFIVLBfYZDn1jbm7FgAhVvuGqmaxo7AJsqyreLtxlPNvxqaJRiPrix40NWTS4bWZEk
	 oVzQYpkxmSBZ9h32t9quvuF6BrdBiilMPluSmbozeratWExsCKqAX62X56bUQkvQ32A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=F6oW4ZmByrglAwdMR7r6p9kXbfexkyXhO5YlnrOYLBs=;
	b=JD50InbeeoJfVZL7yYiMlyS9K+ncWA1DEVIrbUjaAtQkfN7ui5NbFKWoDsdPZJZUzU3I
	 tq8bsQT6YHHMLcbmn1TOlcNoE7mhQ9VeqR0i8CkqHivsX5f3F1pg4UvaMr3PS4J4VKcMB
	 HYFCfvLkhG3u5wnCouOkDojyrjOlJ7qOC7vFkaISJ412pigsjGMtQ+Uc/kVfZOmBW0GMq
	 hZCflJLmKTOtFTVl1jMGh9Nw6+uUbmav+3Hqa6kosFgWw0Pp1yCf4ZIWSy+nJ0cUJZF8u
	 BqviA7ESqs8Q+PFYgab7jOtKkdnQ1kEPigzCTASdm7RoH9tNE+TFp+dsg0MoBO/opvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B41606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B41606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b315dd057bso24685237b3.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870014; x=1795474814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6oW4ZmByrglAwdMR7r6p9kXbfexkyXhO5YlnrOYLBs=;
        b=ni/u0EltAsxcZrsnRt9uG0qvqMIEruZEi4mZJW2Mvio+kScHKHqF1999qeCof+P/+2
         i9wI4gGCoPcAGltbpawIw3tmoTmMduhXfPQZee7Ac5iLkgBxNNaCeLRAAeQRfnnIWewR
         b8bQvLa5b9xG7uftuMdqz2zJ/KC8IVLYFJMPH16MZy1AX56bIPDOuhbG6r8RTb8XDtJD
         ZXaHijUkZZ/C2ffstdAO7jonQHfhq0qCZEZC70SK1f41kOqHFJn/Seg0EGq+TlnLF9qc
         FztbcTu1NMMMm8g2AM0kQX8RHtoq+Dvvcc2zOFvaAsvRXPrPTm45TJCgmv/uYK6lfNu+
         LzNg==
X-Forwarded-Encrypted: i=1; AL+hErF80PvK33Oo9xFUG0udBwtZk9FYFiBEMyeVNIoRiAJsULQ+cBgKGLSVDgK86JPFp+jT3PgSXnzYhf1w@vger.kernel.org
X-Gm-Message-State: APuU4Z8lP0H4uLXjAOapxxQkYcXLGF5/WezNyvZBu+WJcYA09h20L5OB
	Ol6XnCBC9pC3KmMXi3GedykZnKB8UfObnQI6awNMPYUAKwnrxNFJy56N
X-Gm-Gg: AZFdTZdOVfu25GIrpCf6tgkBnRnuOMzbaA6icKw21w0JyHlpx/U6oKDyqabw8LP55uL
	jG7zsfrb0kuVkyy1A+qRGe8bIr1jB+J7sIahw6IlfCXY2hkRJ84jVfzdqG8DXmsnGE3c82epfKy
	Cja1MGRTS+ILduoMhJlrd2IQnuRICDPmZe2Ns8vWbqlhIGaFbXp6eJm4JiG4PmjpCgjcReL1Xre
	UXA3TuayQFTOtRy77ODOUQBvylZEVnbBTRFCRvzuRr+/1KKvJL+PcioV8C7rMP5agzJj8oKFz2N
	maau+gpa2+gIYPB+jfQ2fEku9yvCz2W96qW3LGbbLCPmD8IQ4vrhYD0RiL6qA5sDVnO8fDwy6YS
	SCxUvGx9umDsTgWWx7SM6NT+ik2kx8AU+yviBWD6JRbFoJaI2X8/9DC/1aR+9DTSl9xnBeCP9+9
	7ovuS7ENCwZfLwZWAsWHTR10x/iy3is/tce0S8IVpH/qWsykWJS8mRjBHQYG6Rd1n+XH5lsgnLP
	9adD46eeUOoFsTl+nzuU2fM9buzGBnRsNcXARv7YMG7elXNfyxXBAPAWZObFx7Fk9JMKj4iGApP
	iaUgjI3fbUWnOuDWhZoEgYnU6qpCntwV+ASrodeuBeBHVDNOp6UppG6c9iocJ5ftOqZ64MRrAYl
	83djjkShRcoWYTt/41edw9WgoLHVnmTc7ctk=
X-Received: by 2002:a05:690c:39c:b0:8a8:5c3d:903 with SMTP id 00721157ae682-8b4aa441b73mr65561507b3.62.1794870014054;
        Mon, 16 Nov 2026 15:00:14 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:13 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:54 -0500
Subject: [PATCH 5/5] iio: potentiometer: mcp4018: Add Analog Devices AD5246
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
Message-Id: <20261116-iio-ad5246-v1-5-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
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
D/127, so the scale divisor moves into the per-part config.

The misc ad525x_dpot driver also knows the AD5246, by I2C id only and
through its own sysfs files. It can't provide an IIO channel, which a
consumer such as dpot-dac needs. The AD5272 is likewise in both drivers.

Tested on an AD5246 at 0x2e that sets a fan's speed, described as
adi,ad5246-010 with a vdd-supply. It probes, out_resistance0_raw_available
reads [0 1 127] and out_resistance_scale reads 78.125000000. Raw writes
of 0, 64, 100 and 127 read back the same value, and 128 is rejected.
Writes through iio_write_channel_raw() from an in-kernel consumer of the
channel read back as well (127, 38, 0 and 76).

Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/AD5246.pdf
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/Kconfig   |  6 +++---
 drivers/iio/potentiometer/mcp4018.c | 33 +++++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/potentiometer/Kconfig b/drivers/iio/potentiometer/Kconfig
index e6a9a3c67845..7945c75f06da 100644
--- a/drivers/iio/potentiometer/Kconfig
+++ b/drivers/iio/potentiometer/Kconfig
@@ -70,12 +70,12 @@ config MAX5487
 	  module will be called max5487.
 
 config MCP4018
-	tristate "Microchip MCP4017/18/19 Digital Potentiometer driver"
+	tristate "Microchip MCP4017/18/19 and Analog Devices AD5246 Digital Potentiometer driver"
 	depends on I2C
 	help
 	  Say yes here to build support for the Microchip
-	  MCP4017, MCP4018, MCP4019
-	  digital potentiometer chips.
+	  MCP4017, MCP4018, MCP4019 digital potentiometer chips
+	  and the Analog Devices AD5246 digital rheostat.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called mcp4018.
diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index 0d80bdfdf243..1368d7cfa5b0 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -5,11 +5,13 @@
  * Author: Peter Rosin <peda@axentia.se>
  *
  * Datasheet: http://www.microchip.com/downloads/en/DeviceDoc/22147a.pdf
+ * Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/AD5246.pdf
  *
  * DEVID	#Wipers	#Positions	Resistor Opts (kOhm)
  * mcp4017	1	128		5, 10, 50, 100
  * mcp4018	1	128		5, 10, 50, 100
  * mcp4019	1	128		5, 10, 50, 100
+ * ad5246	1	128		5, 10, 50, 100
  */
 
 #include <linux/err.h>
@@ -23,6 +25,8 @@
 
 struct mcp4018_cfg {
 	int kohms;
+	/* Wiper position divisor: R = raw * kohms / div. */
+	int div;
 };
 
 enum mcp4018_type {
@@ -30,13 +34,22 @@ enum mcp4018_type {
 	MCP4018_103,
 	MCP4018_503,
 	MCP4018_104,
+	AD5246_005,
+	AD5246_010,
+	AD5246_050,
+	AD5246_100,
 };
 
 static const struct mcp4018_cfg mcp4018_cfg[] = {
-	[MCP4018_502] = { .kohms =   5, },
-	[MCP4018_103] = { .kohms =  10, },
-	[MCP4018_503] = { .kohms =  50, },
-	[MCP4018_104] = { .kohms = 100, },
+	[MCP4018_502] = { .kohms =   5, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_103] = { .kohms =  10, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_503] = { .kohms =  50, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_104] = { .kohms = 100, .div = MCP4018_WIPER_MAX, },
+	/* The AD5246's resistance is D / 128 of the end-to-end value. */
+	[AD5246_005] = { .kohms =   5, .div = 128, },
+	[AD5246_010] = { .kohms =  10, .div = 128, },
+	[AD5246_050] = { .kohms =  50, .div = 128, },
+	[AD5246_100] = { .kohms = 100, .div = 128, },
 };
 
 struct mcp4018_data {
@@ -72,7 +85,7 @@ static int mcp4018_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
 		*val = 1000 * data->cfg->kohms;
-		*val2 = MCP4018_WIPER_MAX;
+		*val2 = data->cfg->div;
 		return IIO_VAL_FRACTIONAL;
 	}
 
@@ -125,6 +138,10 @@ static const struct iio_info mcp4018_info = {
 }
 
 static const struct i2c_device_id mcp4018_id[] = {
+	MCP4018_ID_TABLE("ad5246-005", AD5246_005),
+	MCP4018_ID_TABLE("ad5246-010", AD5246_010),
+	MCP4018_ID_TABLE("ad5246-050", AD5246_050),
+	MCP4018_ID_TABLE("ad5246-100", AD5246_100),
 	MCP4018_ID_TABLE("mcp4017-502", MCP4018_502),
 	MCP4018_ID_TABLE("mcp4017-103", MCP4018_103),
 	MCP4018_ID_TABLE("mcp4017-503", MCP4018_503),
@@ -147,6 +164,10 @@ MODULE_DEVICE_TABLE(i2c, mcp4018_id);
 }
 
 static const struct of_device_id mcp4018_of_match[] = {
+	MCP4018_COMPATIBLE("adi,ad5246-005", AD5246_005),
+	MCP4018_COMPATIBLE("adi,ad5246-010", AD5246_010),
+	MCP4018_COMPATIBLE("adi,ad5246-050", AD5246_050),
+	MCP4018_COMPATIBLE("adi,ad5246-100", AD5246_100),
 	MCP4018_COMPATIBLE("microchip,mcp4017-502", MCP4018_502),
 	MCP4018_COMPATIBLE("microchip,mcp4017-103", MCP4018_103),
 	MCP4018_COMPATIBLE("microchip,mcp4017-503", MCP4018_503),
@@ -209,5 +230,5 @@ static struct i2c_driver mcp4018_driver = {
 module_i2c_driver(mcp4018_driver);
 
 MODULE_AUTHOR("Peter Rosin <peda@axentia.se>");
-MODULE_DESCRIPTION("MCP4018 digital potentiometer");
+MODULE_DESCRIPTION("MCP4018 and AD5246 digital potentiometer");
 MODULE_LICENSE("GPL v2");

-- 
Git-155)

