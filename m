Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903867;
	b=s2rc6mxsvJhvNR7qrWWoVFO40knksG7cncaz/C1oZiFAswbZaBKExnGYQa/AunFziE+e
	 5uZTVyMErDKLcS1W9Ya1OmKAOcf8IVCluwyonwEYTQzKTA9DNttZ3dYmoqudge6+oF91E
	 20nLkvsl9w1IVX5HHyNkOVfIo0ioePqiG3dAQtPtu3o2azYgHhD7Do7ksb42D0dHchl35
	 LqZCNo0lrLSyq/Enfda+VKB7O3kbcBMW7beIXHTYC5BgYsJnLFv6RmoWFdgjH4KUfWlyl
	 fHplZnBsPxJxVuousjYglPFkWQU40djgRq7p8QHCDHw1X1zHnO0M8f+XT09L0wYhEPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LxaI5uY4Qt4PnmH4r73IhaYkI9KKxux57STKlfaXPiI=;
	b=xCg+0FCxfWhbGqudMkhDJRC3YLElSTJeFn8U0JUqfZ5iBkPIukkIb14A9eGu/FbEvCjk
	 m/QDE5EK3qpQsi+uIf0hUzlikhta4zBFUd/0tmPLRTurvz/IelhJLY47MG50ees6gNcXl
	 wUXjvs4myzxxcY/3CN42CUPjKPwrgRprJKiqflEFC+X8D8QVGzNAzcTOxtsZXe8VJzXZb
	 vbVmZNMd0rAnkIs6W12EDEvzHj/5vUD4ecz4z+usMufJrObI2R8kIK+EfY+giEhyRmMri
	 83jqvbocReVra4BMe3coRUjudZbux87qMNBIXark6F46CsdG7H7AQn6YHpguM57Qx6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=nTBhyNmU;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053E606A331
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A053E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=nTBhyNmU
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so3358202a12.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903865; x=1795508665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxaI5uY4Qt4PnmH4r73IhaYkI9KKxux57STKlfaXPiI=;
        b=nTBhyNmUa5BEoqc2nlcEE2caCO8zzZlWsMqiZhg+CUPKF2pNcTuJj70fg6gcEg+AlC
         PELJ/MDs4dOrr5Rb9zR5Vw0PgdK9Hz0L9CVyPvrVrFu77DUyWnUR/NokQ7Vo429i0rFv
         oYozS2QZ6o8VOzua9RXwMdqSWyevTL7WuaJkv50LmViR7OeqmvSx3qLB016DVs+HlFso
         Lcn+NF9hGra5dyi+IYksIN9NSJzTOoOyZEo/zYUYQBnPC9ySV+5YhTMC1YhQj5c6A1F8
         wae8WVTYK3inJ7MCl8ZJFvWc7h69CHsCMCjInfzyd41DJex/QkT8+2Nhq0TUfBsrOAqZ
         A/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903865; x=1795508665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxaI5uY4Qt4PnmH4r73IhaYkI9KKxux57STKlfaXPiI=;
        b=Sh+hAQFuj9PmMt83vbWmnBHabQHQ5WPDvfHxoSdXl6UcedBDsZcekoVPMkUVdVMDNp
         /Nf6NsgfkrwgPXchyagBjrxygygc9h1sozpL6pt09ZGPvR3b4e+tyU5ScwHd0NImAMEY
         vncNqtXJPhosQU4p4Cv0Odqfay2uN1njVo1VNH7V4z+UdAirIpQ2Si2A6Lk62rj8+J2Q
         XFX6imPtN+BLfVtlDA4KQwOv6SyMma219SxykyLWa0ZTANojwocN+rCOZN0XKVJ9vync
         xKwh1Pqu5G1KVt14fDGp7rtXEDycjABzFeqvB9CcX4JTJo1Qj/PhS9T8iAF1vLao46VR
         vyUA==
X-Forwarded-Encrypted: i=1; AL+hErGyb9DHZDOsoK6O5AbODbQxgiMN7JHS8xho4qxQY45O2TGCgVSjhdmFmwa8yRcS3bn2g4+1WvPiJ2lD@vger.kernel.org
X-Gm-Message-State: APuU4Z92S4PtCLG2WasA4tmOI85sUUYOvaOmmTy3qYpO5M5ToJogwm3h
	+rTIHBrDjbvVHDKNueS5ugRieK8jOC6EphCD8mMKYGJV25/TxuzI+GqhqBq4ipS5pXA=
X-Gm-Gg: AYBFou1USg0ymTpzI25p/hNybqo7l7ao6Lg/4He+VJVqxOBWQiOAcxW+jDvrvajHlhJ
	9wgOjmm6oeuRpi01qRc79NHriRuiYkYnb1GAN3UlqNnqi6FQsqU2jlKwaMnAYXYsa0R997SLth1
	Q4gTG41SOn0iS31CqHIXtgrMiCcd1ag2P8ruibBhWCqd1C7Rbvqc99lV3XvMHSzMznvXdT1ti8G
	AJDduy95y8X0cqWSeMaFg1Y1pH2XPhrsyawAqHfN4IUZBQzypRaG8tMcNczbc1OshnmUtzRqbFK
	5V/lwh4ZK6S5DWMbhx/C5M7VlvGUtVHbgRM8Tk4Dd0PrTiqPLgqNRWlVLjGajLx4oS3EDdvMc38
	pn7hq11rcYgHBAFaPX8z/mgDH5ezU07AC+7JUNtKDXlJ1LfbN9jGUeM/hKq6QHIEiX6rsmxPIYd
	95pRaoh5WTE68x6reDwsIrgaMyTXHlwlFP0cwclJN4/amFSfJ0Z2cFZ79e/Xx9tvXQbpkB7DkRb
	xHsFV3CCS//ufYES6xQ9SvL/RzEe4ad9mMUsl3ZWBjSNZFKWHtUirtIcKQ/K6sJguNx2YyExoJ4
	J+uzd4ueWKHIxVqQ06ZOXPOfJlgFv/Nrm6DRWYCM8/aglbs80To2PYWrvO8Ek/WxoZ+n7tgpE36
	RKOFTiA8eL/xbD2b31c8J3ieNTJtXgTRtcShujMlbeYU64YoP
X-Received: by 2002:a05:6402:a6d0:20b0:6b7:7785:e390 with SMTP id 4fb4d7f45d1cf-6b7c0c53c03mr6564860a12.39.1794903865178;
        Tue, 17 Nov 2026 00:24:25 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:24 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:11 +0100
Subject: [PATCH v4 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
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
Message-Id: <20261117-bat-temp-adc-v4-1-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=4313;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iidYg1ApengXgpBRX/y8L8A1Ccs7ge5DzCxZFBc4ifo=;
 b=OXqeH5UusaY7rzg6vlI0anOhN1stHwSh6BCMbSMu0R8cuLLxS4RgGW7U9l8YXlIbAQAThR9WZ
 HLFmZmTZ/JyDa1Jo56d996TCbjpNtysUUaEQGqlHPSh/dYU8cM/Q/fN
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the BAT_THERM channels with millivolt as output, which can then be
used along with information regarding the NTC in the battery, to get the
actual battery temperature.

A static lookup table in the ADC driver won't work since different
devices have different Ohm and Beta values in their battery NTCs, for
example a NTC can be 10kOhm & B=3435K.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/iio/adc/qcom-spmi-adc5.c         |  6 ++++++
 drivers/iio/adc/qcom-vadc-common.c       | 16 ++++++++++++++++
 include/linux/iio/adc/qcom-vadc-common.h |  3 +++
 3 files changed, 25 insertions(+)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index d57ba8526e0c..24ac84580570 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -542,6 +542,12 @@ static const struct adc5_channels adc5_chans_pmic[ADC5_MAX_CHANNEL] = {
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_XO_THERM_100K_PU]	= ADC5_CHAN_TEMP("xo_therm", 0,
 					SCALE_HW_CALIB_XOTHERM)
+	[ADC5_BAT_THERM_30K_PU]	= ADC5_CHAN_VOLT("bat_therm_30k_pu", 0,
+					SCALE_HW_CALIB_THERM_VOLT)
+	[ADC5_BAT_THERM_100K_PU] = ADC5_CHAN_VOLT("bat_therm_100k_pu", 0,
+					SCALE_HW_CALIB_THERM_VOLT)
+	[ADC5_BAT_THERM_400K_PU] = ADC5_CHAN_VOLT("bat_therm_400k_pu", 0,
+					SCALE_HW_CALIB_THERM_VOLT)
 	[ADC5_BAT_ID_100K_PU]	= ADC5_CHAN_TEMP("bat_id", 0,
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_AMUX_THM1_100K_PU] = ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,
diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-vadc-common.c
index b03cf584b165..101b3c724f8d 100644
--- a/drivers/iio/adc/qcom-vadc-common.c
+++ b/drivers/iio/adc/qcom-vadc-common.c
@@ -309,6 +309,10 @@ static int qcom_vadc_scale_hw_calib_therm(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
 				u16 adc_code, int *result_mdec);
+static int qcom_vadc_scale_hw_calib_therm_volt(
+				const struct u32_fract *prescale,
+				const struct adc5_data *data,
+				u16 adc_code, int *result_mV);
 static int qcom_vadc7_scale_hw_calib_therm(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
@@ -333,6 +337,7 @@ static int qcom_vadc7_scale_hw_calib_die_temp(
 static const struct qcom_adc5_scale_type scale_adc5_fn[] = {
 	[SCALE_HW_CALIB_DEFAULT] = {qcom_vadc_scale_hw_calib_volt},
 	[SCALE_HW_CALIB_THERM_100K_PULLUP] = {qcom_vadc_scale_hw_calib_therm},
+	[SCALE_HW_CALIB_THERM_VOLT] = {qcom_vadc_scale_hw_calib_therm_volt},
 	[SCALE_HW_CALIB_XOTHERM] = {qcom_vadc_scale_hw_calib_therm},
 	[SCALE_HW_CALIB_THERM_100K_PU_PM7] = {
 					qcom_vadc7_scale_hw_calib_therm},
@@ -583,6 +588,17 @@ static int qcom_vadc_scale_hw_calib_therm(
 				 voltage, result_mdec);
 }
 
+static int qcom_vadc_scale_hw_calib_therm_volt(
+				const struct u32_fract *prescale,
+				const struct adc5_data *data,
+				u16 adc_code, int *result_mV)
+{
+	*result_mV = qcom_vadc_scale_code_voltage_factor(adc_code,
+				prescale, data, MICRO / MILLI);
+
+	return 0;
+}
+
 static int qcom_vadc_scale_hw_calib_die_temp(
 				const struct u32_fract *prescale,
 				const struct adc5_data *data,
diff --git a/include/linux/iio/adc/qcom-vadc-common.h b/include/linux/iio/adc/qcom-vadc-common.h
index 3bf4c49726a7..7586016ff14d 100644
--- a/include/linux/iio/adc/qcom-vadc-common.h
+++ b/include/linux/iio/adc/qcom-vadc-common.h
@@ -93,6 +93,8 @@ struct vadc_linear_graph {
  *	voltage (uV) with hardware applied offset/slope values to adc code.
  * @SCALE_HW_CALIB_THERM_100K_PULLUP: Returns temperature in millidegC using
  *	lookup table. The hardware applies offset/slope to adc code.
+ * @SCALE_HW_CALIB_THERM_VOLT: Returns voltage in mV of a temperature channel.
+ *	The hardware applies offset/slope to adc code.
  * @SCALE_HW_CALIB_XOTHERM: Returns XO thermistor voltage in millidegC using
  *	100k pullup. The hardware applies offset/slope to adc code.
  * @SCALE_HW_CALIB_THERM_100K_PU_PM7: Returns temperature in millidegC using
@@ -114,6 +116,7 @@ enum vadc_scale_fn_type {
 	SCALE_PMI_CHG_TEMP,
 	SCALE_HW_CALIB_DEFAULT,
 	SCALE_HW_CALIB_THERM_100K_PULLUP,
+	SCALE_HW_CALIB_THERM_VOLT,
 	SCALE_HW_CALIB_XOTHERM,
 	SCALE_HW_CALIB_THERM_100K_PU_PM7,
 	SCALE_HW_CALIB_PMIC_THERM,

-- 
2.56.1

