Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB0D3D5C05
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246122; cv=none; b=riKlLF2o1BDnBrUnxcw19e6uYe8LQIpkqc7+KgerpuAkliUOwPUvGWxdsQxJ2fB73QwW8lVTXwWtxRJ19ionlwQGRnzy0qHrIYQkf6tJCuKW/RDr29icQsxGiCELobmiZa1t4C0WiSDwB5AGqUYll2tYRjh00Z9RElbOr8iAgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246122; c=relaxed/simple;
	bh=pII4OTwkp162qIu0yEHs3obOJPTOvBpHUVWHByZST3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ad0rG429O2JDw7K1668UDKKJPhMPl7XDiojDqsFbn4F8Yorh65aEeCxsiEf7ji5SXIncTKRlNXiHvjQdyL4NBAwQDJ43Pm9nB30sYAUoOmhqFCzgPjecO7/DLvx3GxaBiVXiLb/leuE/htj9iANbaPvgeAvcovIPRy1FagMroyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqcS1vYB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqcS1vYB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so9901145e9.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246119; x=1792850919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2Dcg4q4de62PcVyE302T3A2E9kOAxLGWxlSec6cjn8=;
        b=fqcS1vYB0BlGoDe2aCfckhiHskMg7+rUaITOH1Vwm5sR8fWncq6u6Pz7c/gRauuE4O
         UDOg7eteRwFIBXmr0MXTMGrcx5oW/hBqxcjd9Nb3TbtYbA5QOtgWiD+8r30OdBb4R4Lz
         EVXolQyUmXe6s7CAglhD/k0tHF/tuk9RfK+TcpaY2f7e69FV6AlIT+B+I2HDZUHlS2ob
         c5BIMRL+5/+cLnmoTm7p16+aAbXtQaThFTGwr0QJMHAYKtdQnGgOA702nGbMx2KQnmpX
         R3GAeFFu7c+9/Q7nxJDz1z7NStKj7xrw7iSWcuVCRJHepbUyPY+mIIhbxDFtl1jvWEpT
         41Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246119; x=1792850919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2Dcg4q4de62PcVyE302T3A2E9kOAxLGWxlSec6cjn8=;
        b=FTu1O+zt/DDhg1+qPMkBFZtbnps7Z14IF4iWdow8M9CO9DeZGd14+8Q5KzNe1eq72i
         I9Mxg3EFtxhVbCukjaehUOHQHbBGwMtC3CPA8xS3OCXe0Ws4LMKBqpP1yTFjF7g1VlRU
         8jAEkHTGo8Ot3aIT4OrSo6HAOg9ALRrqog7BYdx9Unj5W64RWtzXBv4RMA1pkcbyxyvA
         u6czKtqBj5g+a/+PNvb7qRaB0EBud0dYd5Mqb1pBK6wdaUjh3qwx/b1EvUqG7Ra9d9xQ
         HCuO6ouNzKc1dZoQZV5xVdyP6KjmLYE0sKKrecti4v1A4xiItcQYxNIXmBozEVD8se25
         lb8g==
X-Forwarded-Encrypted: i=1; AKwUvBxQ5B5a93wOEx97WIj/GBxI+1sVbfaUOJgXlJGz2qovNdGDwaTaaMd441PipSplqwKS6ZSASyCas4XG@vger.kernel.org
X-Gm-Message-State: AFq9FYIwsqP1NT+m92apn+A4LRwQDyA/Geyycsv+bAKtfnRHeikECh2S
	16ugX9xC1EftshD0KCMqw/7OvGfZLH9KrmWciwLS/A1hDp6rWDf21MzSbbUMAuaT3oM=
X-Gm-Gg: AYBFou05jpzAU4DgW7S6HZmdgFfODTacEqywYjgrEO8HAkQQ82+NVQ5AlyjNY0PDWhE
	Y0mplAnazAciwgoZqESzrfpjimeOxP9R+c/D2JiutsstIiRPB2ZDyrTD7N09A/Fj9Rii7AqDXCu
	dUSviGZD7lJvXBRUHgol6p3xX2L+MyXcUwZc+Mzas22ppf1yEvaNd3/PesOCsL7mBxc6hufWoIo
	xx+/q71/7k/AhEQdBrpy6WhcHEUfXRk7zsP3n5swZkzEa2p29OGtAf8YX4/3yjq8Nqo/UtbcQ2Q
	M5o4uNCM6ikR8nN+NAvZVmb4eys2eyjltAO9A1UBiu0k3rjPrRl1FwIkLn++HTOVSHU02O75lsy
	ybcxOIiyKhV2TJvQOwZwVYQ35nMdVu5IeB90OBntGC/AG4Ndu9GbZGRnhTQkyuDRdfdd3UycuHg
	31BMD/NfI14CO4JVLts8jLjr91eNFzGjkMPVmF8fXVVT9bRxvjpMU3qNF/xXB22dL237bomkmcJ
	GHdM+NLmPgGVhnZhYvwRbE/jXJC4l69vK5s6W/W1IcIw27usfB1cvGiDnMVpGFlvSxGE1r8oAEw
	Bq0=
X-Received: by 2002:a05:600c:1c09:b0:4a1:df2f:ae8f with SMTP id 5b1f17b1804b1-4a1df2fb8abmr22004175e9.6.1792246118623;
        Sat, 17 Oct 2026 07:08:38 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::1046])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm84430745e9.4.2026.10.17.07.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:38 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 2/7] Input: edt-ft5x06 - move the controller bring-up into a helper
Date: Sat, 17 Oct 2026 16:07:50 +0200
Message-ID: <20261017140827.290666-3-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017140827.290666-1-lukapanio@gmail.com>
References: <20261017140827.290666-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the part of probe that takes the controller out of reset,
identifies it and registers the input device into a helper, so it
can also be run after the probe.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 154 ++++++++++++++-----------
 1 file changed, 86 insertions(+), 68 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 543cc62088c7..536d633d97a7 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1116,16 +1116,96 @@ static void edt_ft5x06_disable_regulators(void *arg)
 	regulator_disable(data->iovcc);
 }
 
+/*
+ * Take the controller out of reset, identify it and register the input
+ * device.
+ */
+static int edt_ft5x06_ts_init_hw(struct edt_ft5x06_ts_data *tsdata)
+{
+	struct device *dev = tsdata->dev;
+	struct input_dev *input = tsdata->input;
+	unsigned int val;
+	u32 report_rate;
+	int error;
+
+	if (tsdata->reset_gpio) {
+		usleep_range(5000, 6000);
+		gpiod_set_value_cansleep(tsdata->reset_gpio, 0);
+		msleep(300);
+	}
+
+	error = edt_ft5x06_ts_identify(tsdata);
+	if (error) {
+		dev_err(dev, "touchscreen probe failed\n");
+		return error;
+	}
+
+	/*
+	 * Dummy read access. EP0700MLP1 returns bogus data on the first
+	 * register read access and ignores writes.
+	 */
+	regmap_read(tsdata->regmap, 0x00, &val);
+
+	edt_ft5x06_ts_set_tdata_parameters(tsdata);
+	edt_ft5x06_ts_set_regs(tsdata);
+	edt_ft5x06_ts_get_defaults(dev, tsdata);
+	edt_ft5x06_ts_get_parameters(tsdata);
+
+	if (tsdata->reg_addr.reg_report_rate != NO_REGISTER &&
+	    !device_property_read_u32(dev, "report-rate-hz", &report_rate)) {
+		if (tsdata->version == EDT_M06)
+			tsdata->report_rate = clamp_val(report_rate, 30, 140);
+		else
+			tsdata->report_rate = clamp_val(report_rate, 1, 255);
+
+		if (report_rate != tsdata->report_rate)
+			dev_warn(dev,
+				 "report-rate %dHz is unsupported, use %dHz\n",
+				 report_rate, tsdata->report_rate);
+
+		if (tsdata->version == EDT_M06)
+			tsdata->report_rate /= 10;
+
+		regmap_write(tsdata->regmap, tsdata->reg_addr.reg_report_rate,
+			     tsdata->report_rate);
+	}
+
+	dev_dbg(dev, "Model \"%s\", Rev. \"%s\", %dx%d sensors\n",
+		tsdata->name, tsdata->fw_version, tsdata->num_x, tsdata->num_y);
+
+	input->name = tsdata->name;
+
+	input_set_abs_params(input, ABS_MT_POSITION_X,
+			     0, tsdata->num_x * 64 - 1, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y,
+			     0, tsdata->num_y * 64 - 1, 0, 0);
+
+	touchscreen_parse_properties(input, true, &tsdata->prop);
+
+	error = input_mt_init_slots(input, tsdata->max_support_points,
+				    INPUT_MT_DIRECT);
+	if (error) {
+		dev_err(dev, "Unable to init MT slots.\n");
+		return error;
+	}
+
+	error = input_register_device(input);
+	if (error)
+		return error;
+
+	edt_ft5x06_ts_prepare_debugfs(tsdata);
+
+	return 0;
+}
+
 int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
 		     const struct edt_ft5x06_chip_data *chip_data, u16 bustype,
 		     struct dentry *debugfs)
 {
 	struct edt_ft5x06_ts_data *tsdata;
-	unsigned int val;
 	struct input_dev *input;
 	unsigned long irq_flags;
 	int error;
-	u32 report_rate;
 
 	tsdata = devm_kzalloc(dev, sizeof(*tsdata), GFP_KERNEL);
 	if (!tsdata) {
@@ -1225,78 +1305,22 @@ int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
 		usleep_range(5000, 6000);
 	}
 
-	if (tsdata->reset_gpio) {
-		usleep_range(5000, 6000);
-		gpiod_set_value_cansleep(tsdata->reset_gpio, 0);
-		msleep(300);
-	}
-
 	input = devm_input_allocate_device(dev);
 	if (!input) {
 		dev_err(dev, "failed to allocate input device.\n");
 		return -ENOMEM;
 	}
 
+	input->id.bustype = bustype;
+
 	mutex_init(&tsdata->mutex);
 	tsdata->input = input;
 	tsdata->factory_mode = false;
 	dev_set_drvdata(dev, tsdata);
 
-	error = edt_ft5x06_ts_identify(tsdata);
-	if (error) {
-		dev_err(dev, "touchscreen probe failed\n");
-		return error;
-	}
-
-	/*
-	 * Dummy read access. EP0700MLP1 returns bogus data on the first
-	 * register read access and ignores writes.
-	 */
-	regmap_read(tsdata->regmap, 0x00, &val);
-
-	edt_ft5x06_ts_set_tdata_parameters(tsdata);
-	edt_ft5x06_ts_set_regs(tsdata);
-	edt_ft5x06_ts_get_defaults(dev, tsdata);
-	edt_ft5x06_ts_get_parameters(tsdata);
-
-	if (tsdata->reg_addr.reg_report_rate != NO_REGISTER &&
-	    !device_property_read_u32(dev, "report-rate-hz", &report_rate)) {
-		if (tsdata->version == EDT_M06)
-			tsdata->report_rate = clamp_val(report_rate, 30, 140);
-		else
-			tsdata->report_rate = clamp_val(report_rate, 1, 255);
-
-		if (report_rate != tsdata->report_rate)
-			dev_warn(dev,
-				 "report-rate %dHz is unsupported, use %dHz\n",
-				 report_rate, tsdata->report_rate);
-
-		if (tsdata->version == EDT_M06)
-			tsdata->report_rate /= 10;
-
-		regmap_write(tsdata->regmap, tsdata->reg_addr.reg_report_rate,
-			     tsdata->report_rate);
-	}
-
-	dev_dbg(dev, "Model \"%s\", Rev. \"%s\", %dx%d sensors\n",
-		tsdata->name, tsdata->fw_version, tsdata->num_x, tsdata->num_y);
-
-	input->name = tsdata->name;
-	input->id.bustype = bustype;
-
-	input_set_abs_params(input, ABS_MT_POSITION_X,
-			     0, tsdata->num_x * 64 - 1, 0, 0);
-	input_set_abs_params(input, ABS_MT_POSITION_Y,
-			     0, tsdata->num_y * 64 - 1, 0, 0);
-
-	touchscreen_parse_properties(input, true, &tsdata->prop);
-
-	error = input_mt_init_slots(input, tsdata->max_support_points,
-				    INPUT_MT_DIRECT);
-	if (error) {
-		dev_err(dev, "Unable to init MT slots.\n");
+	error = edt_ft5x06_ts_init_hw(tsdata);
+	if (error)
 		return error;
-	}
 
 	irq_flags = irq_get_trigger_type(irq);
 	if (irq_flags == IRQF_TRIGGER_NONE)
@@ -1310,12 +1334,6 @@ int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
 		return error;
 	}
 
-	error = input_register_device(input);
-	if (error)
-		return error;
-
-	edt_ft5x06_ts_prepare_debugfs(tsdata);
-
 	dev_dbg(dev,
 		"EDT FT5x06 initialized: IRQ %d, WAKE pin %d, Reset pin %d.\n",
 		irq,
-- 
2.55.0

