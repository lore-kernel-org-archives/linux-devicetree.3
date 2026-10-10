Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C2425872
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615231; cv=none; b=JN2KMUyo6tKBZ09OaXZakoHPDJCh5uT4DxsXHuufFYNVWJhmx38qQq7XobCJOagOQmNlNjm0DDyKtt4kquiAf3D5cVyMPmzX3B9+82qJh03S96OuXCi3ie+qYo6TFDEu/N3byWdFO69mrFQJq0guEW3BIIIhZcJalGqURI4vUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615231; c=relaxed/simple;
	bh=sIgqBcy92ngOiMewZAaCH22tAL12+uHdabYjSOJhtGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DdpEmqehlzllQpb9TjQ7ZMIpRA78UGRGZ8IGcL0AgRScYamCvtgRQMQXE50GGHW9H0DbmBVh3xVlWo0wKzhWGtW+ELJ+4cyAZJWJgMoz3rbB8b7Y9Iw9TVja7tRgkACk/RXzWJ1s9piPbJ6JYmVXN6/VC1ImCEDux8mOcJICpKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+KS6Sui; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+KS6Sui"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1059897eec.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 23:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615229; x=1792220029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJv5U+ZgB9bZIRuuVM9HB1/eGBt53/LSCt16uoC/CA0=;
        b=a+KS6SuiHsVjT37bfGYh9QOed8D8y9zPtgJ0Cg4gqkowZ91e+RJfW9ZzK+qyqdPDg2
         xgoHh3RUxxeMJ5AG2myvoY6UJMbpiE00/XbGG4BHH282qaWxfX+gEfGZj/t5fZf3y9wu
         +jCi1pBZaHe/2VRYV1fTqjT5f+jZqpO26PlkHKe/kT4pwu1U2U3REpQLFFgvmLNVYbvT
         d1ByDksEzaEgRI+MnZyUw0cTM/LihnJrEp9m4amA8STL/Fs433dRSSsT91U34wFL9kYq
         MqSO8TCyq9PU1iA1eODv0kP/32CIHxC6R/w2jtwWri5LKu5MyNlQdQkIuWaxImiVwtiM
         hqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615229; x=1792220029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJv5U+ZgB9bZIRuuVM9HB1/eGBt53/LSCt16uoC/CA0=;
        b=dotbNrx9pepaJqOOPo2Ag24vNE3dlp/y2spFIeiyZkDGcisM8vbLCVmLA3Y6uXnppc
         7YZdhkRS+6t5u39WE1XbbYFYOxigmAUZ5hyTODDqinpUJewyRgfOqKG62HfNwY1psZ7W
         Nlm/1mIiKM4qwOBrMfARRIrivOjkM29ViIxs1pEwsq0mr1cSWAKYQhTABOj94jBsxLkx
         dCyDfAQKy6gCtTE50IStaBsI8V28WIAYurQlblVNdR6Bk+11aFX0w6WL3wPNKOE+0fbB
         cjWcDpJnD94A/mc7+gI80lbO6qDddiJ7wTj0SqMbvn5sr4l4VQi7zjqWVKDKHc6DUn/J
         Jt/A==
X-Forwarded-Encrypted: i=1; AKwUvByneg12kM+Efk80nObWtsGWyxq1u8RyJ7sT0xo02WAEkEFbYQeK0/9TB2FBXQRKVJYwXF9vLD/LEUr1@vger.kernel.org
X-Gm-Message-State: AFq9FYJzi607e+VnNHY1LsttBCAO70PNNcenCKPNGWXUxXb/nZRUwldz
	BkVQf2ohNhU4pbuyHyvcNvAq8iGhPW+OTEFIaAODuhf5OgB5DwkLr2Ah
X-Gm-Gg: AYBFou3rxP3qL3lt5jO4UfEPKklA1x2T08dQiAHacDUEZ7/r9ADHFVtrxNqoNREfgYr
	WaZSyvQkumbBY+vic4DB0PFpDTFZu7T74vklvPg22UxfvhpNKGqJGRlODF50pJpp2xhw358SJ9x
	6dPWFn+O69l9/H/eYxHZGTcYpremmMeUOqEa6tBbThkRU8/tMK8Z+n429MeEez+Di0eKOWAjlJF
	pYBGIwjbIYWh5Ilpso+AjplzJEMgqal91J2/id/PiDEyEhMuMtT+szJMnPYjaV1jGyzW1uC0Ixc
	2VMBtJlyg9QksKx496eI23Eq8nJdaBLs1J5Gu7nbH2GfEqnZc2rEWvm7GogrzCgqdAGdsL2wcFU
	Enz9JJ8P9iq3nwcyeG61KQyL8hPj3Ez6etLpC+M2v3yrQvA1G2/RPs7R15uthWjH9WixQvAtRNw
	xzusbd9ZRMWJzKjgCD7sACAJudycwgmtGiYypyHw0UYK1UZwP0AL22w+M5R8XK+htaB9k9OZGCK
	DuRDyvRGMSfHTcQZAk4hGvKkHP1twpu4Z6PUlVH4Pc5j2gqQJI=
X-Received: by 2002:a05:7300:e5c2:b0:355:cd68:6f03 with SMTP id 5a478bee46e88-355cd687760mr3776619eec.33.1791615228949;
        Fri, 09 Oct 2026 23:53:48 -0700 (PDT)
Received: from [192.168.100.70] (host-200-61-172-117.iplanisp.com.ar. [200.61.172.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm13009650eec.20.2026.10.09.23.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:53:48 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 10 Oct 2026 03:52:46 -0300
Subject: [PATCH v5 07/10] iio: adc: ti-ads1262: support excitation currents
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-ads126x-v5-7-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
In-Reply-To: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6017; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=sIgqBcy92ngOiMewZAaCH22tAL12+uHdabYjSOJhtGE=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFknHzzb2fB87+ktDo++S9Z68CZ4aZe7L5ndxrb50rx3A
 pM4Mr/md5SyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEpqsyMly2cXL9ttvMLvn4
 3+WV/5tqfy5sUZqzuovbMYFFJOO+wn1GhmVJe+SnH5K8ud7YUunDoUMfGoMMFz3zMTlhsv6geuD
 6LbwA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Support the two IDAC excitation current sources. Each channel can route
its IDAC1/IDAC2 outputs to a pin via the "excitation-channels" property
and select a magnitude via "excitation-current-nanoamp".

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 90 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 938e26075302..49d4bf206be0 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -200,12 +200,15 @@ struct ads1262_chip_info {
 struct ads1262_channel {
 	u8 data_rate;
 	u8 filter;
+	u8 idac_mux[2];
+	u8 idac_mag[2];
 	u8 gain;
 	u8 ref_p;
 	u8 ref_n;
 	bool ref_reversal;
 	bool is_resistance;
 	bool input_chop;
+	bool idac_chop;
 	size_t num_scales;
 	int scales[ADS1262_GAIN_COUNT][2];
 };
@@ -307,6 +310,10 @@ static const struct iio_chan_spec ads1262_monitor_chan_specs[] = {
 #define ads1262_default_channel ((struct ads1262_channel) {	\
 	.data_rate = ADS1262_DR_20_SPS,				\
 	.filter = ADS1262_FILTER_FIR,				\
+	.idac_mux = {						\
+		ADS1262_IDACMUX_NO_CONN,			\
+		ADS1262_IDACMUX_NO_CONN				\
+	},							\
 })
 
 static const u32 ads1262_mod_decimator_a[] = {
@@ -365,6 +372,21 @@ static const char * const ads1262_ref_sources_neg[] = {
 	NULL
 };
 
+static const u32 ads1262_idac_mags_nA[] = {
+	0, 50000, 100000, 250000, 500000, 750000, 1000000, 1500000,	/* 0..7 */
+	2000000, 2500000, 3000000					/* 8..10 */
+};
+
+static int ads1262_find_one(const u32 *array, size_t num_elements, u32 val)
+{
+	for (unsigned int i = 0; i < num_elements; i++) {
+		if (val == array[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
+
 static int ads1262_find_two(const int (*array)[2], size_t num_elements, int val,
 			    int val2)
 {
@@ -514,8 +536,10 @@ static int ads1262_channel_enable(struct ads1262 *st,
 
 	ret = regmap_update_bits(st->regmap, ADS1262_MODE0_REG,
 				 ADS1262_MODE0_INPUT_CHOP_MASK |
+				 ADS1262_MODE0_IDAC_CHOP_MASK |
 				 ADS1262_MODE0_REFREV_MASK,
 				 FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
+				 FIELD_PREP(ADS1262_MODE0_IDAC_CHOP_MASK, chan->idac_chop) |
 				 FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal));
 	if (ret)
 		return ret;
@@ -536,6 +560,22 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	if (ret)
 		return ret;
 
+	ret = regmap_update_bits(st->regmap, ADS1262_IDACMUX_REG,
+				 ADS1262_IDACMUX_MUX1_MASK |
+				 ADS1262_IDACMUX_MUX2_MASK,
+				 FIELD_PREP(ADS1262_IDACMUX_MUX1_MASK, chan->idac_mux[0]) |
+				 FIELD_PREP(ADS1262_IDACMUX_MUX2_MASK, chan->idac_mux[1]));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(st->regmap, ADS1262_IDACMAG_REG,
+				 ADS1262_IDACMAG_MAG1_MASK |
+				 ADS1262_IDACMAG_MAG2_MASK,
+				 FIELD_PREP(ADS1262_IDACMAG_MAG1_MASK, chan->idac_mag[0]) |
+				 FIELD_PREP(ADS1262_IDACMAG_MAG2_MASK, chan->idac_mag[1]));
+	if (ret)
+		return ret;
+
 	return regmap_update_bits(st->regmap, ADS1262_REFMUX_REG,
 				  ADS1262_REFMUX_RMUXN_MASK |
 				  ADS1262_REFMUX_RMUXP_MASK,
@@ -570,7 +610,7 @@ static int ads1262_channel_read(struct iio_dev *indio_dev,
 	 * CONTINUOUS mode and briefly starting and stopping conversions to
 	 * achieve the same effect (Section 9.4.1.2).
 	 */
-	if (chan->input_chop)
+	if (chan->input_chop || chan->idac_chop)
 		runmode = ADS1262_RUNMODE_CONTINUOUS;
 	else
 		runmode = ADS1262_RUNMODE_PULSE;
@@ -1264,8 +1304,8 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 	struct device *dev = &st->spi->dev;
 	const char *sources[2];
 	char name[sizeof("ti,refpN-refnM-resistor-ohms")];
-	u32 pins[2];
-	int ret;
+	u32 pins[2], mags[2];
+	int count, ret;
 
 	if (fwnode_property_present(node, "single-channel")) {
 		ret = fwnode_property_read_u32(node, "single-channel", &pins[0]);
@@ -1332,7 +1372,51 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 		}
 	}
 
+	if (fwnode_property_present(node, "excitation-channels")) {
+		count = fwnode_property_count_u32(node, "excitation-channels");
+		if (count < 0)
+			return dev_err_probe(dev, count,
+					     "%pfwP: failed to count excitation-channels\n", node);
+
+		pins[0] = ADS1262_IDACMUX_NO_CONN;
+		pins[1] = ADS1262_IDACMUX_NO_CONN;
+		ret = fwnode_property_read_u32_array(node, "excitation-channels",
+						     pins, min(count, ARRAY_SIZE(pins)));
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: failed to read excitation-channels\n", node);
+		if (pins[0] > ADS1262_IDACMUX_NO_CONN || pins[1] > ADS1262_IDACMUX_NO_CONN)
+			return dev_err_probe(dev, -EINVAL,
+					     "%pfwP: excitation-channels not in range\n", node);
+		chan->idac_mux[0] = pins[0];
+		chan->idac_mux[1] = pins[1];
+
+		mags[0] = 0;
+		mags[1] = 0;
+		ret = fwnode_property_read_u32_array(node, "excitation-current-nanoamp",
+						     mags, min(count, ARRAY_SIZE(mags)));
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: failed to read excitation-current-nanoamp\n",
+					     node);
+
+		ret = ads1262_find_one(ads1262_idac_mags_nA,
+				       ARRAY_SIZE(ads1262_idac_mags_nA), mags[0]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: invalid excitation-current-nanoamp\n", node);
+		chan->idac_mag[0] = ret;
+
+		ret = ads1262_find_one(ads1262_idac_mags_nA,
+				       ARRAY_SIZE(ads1262_idac_mags_nA), mags[1]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "%pfwP: invalid excitation-current-nanoamp\n", node);
+		chan->idac_mag[1] = ret;
+	}
+
 	chan->input_chop = fwnode_property_read_bool(node, "input-chopping");
+	chan->idac_chop = fwnode_property_read_bool(node, "excitation-current-chopping");
 	chan->ref_reversal = fwnode_property_read_bool(node, "ti,reference-reversal");
 
 	return 0;

-- 
2.55.0

