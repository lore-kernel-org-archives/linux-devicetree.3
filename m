Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E835CB6A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782624994; cv=none; b=i7Xem+8VWn0s8XeQ0BHZaj+nuwJLvWDbZOruTxLKbnX35vO9SEcZb5hFkFdWDYisekRVFFPTd03GX9XFiPY14lneb/8uk7XN27Pfp7H9p14ju/n2kXQHYHs0ntLIxbWJcJqPmHKdbySajBErbiHRDPPoM2w4EctMOAyH6QFC5VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782624994; c=relaxed/simple;
	bh=ANUkdLWe+7RcLhUKloW6tdEkCtqS2AXmrjadF/8l4DQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrnKb7mu5neZz0E2oOIbxeolhQyFRJMVR4WITbZJ7CFno8B9CP4jonUsASRe+b7ChKkwPw2ky7DEzIjxiWGjSV8uSrkl5ONfgJp1ujsdrWoGVAAmLdu5Vpf966tQV8YiQDzQbTb0Uj+pgpIlyCfp/D5iZCRVekmvx2MPEI2iOoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GInAjNgo; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GInAjNgo"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59ebf30a91dso1085722e0c.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 22:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782624992; x=1783229792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y2aGGvAdzTMZAt6XgZ667DmYPmid1iJw8FUP5rUeuY=;
        b=GInAjNgoavZ3/BXabGebPDNk78BfUQTvVD2Gw7+cKlPxmTeVngkf7r98cXOoTHijtW
         yMq7EJhGL+DYL9Pb3Kdd0YygPD8tJas0k+XbFhCUjMyOU52tpU/fBkaBDX8d0rg+vBrv
         TrNe+1Q5T7pGh1CANNdgydqQmuqU0IVBfOF6LIwzRnQFpiaXwYg/7gCS1SVy/5HZO9YQ
         tLNaIxTutkwdkOg2C5sYk7Xyn7MKeCKDyhInyKpjQ4P/B+Vzzl0kAlbSMkMrzcsxgDa5
         +miWEJtTFkvCRKVV07XGGESwlXH5MCF02pFrout3W82f0iIkYZVqpYDWzdhSjIBodwhx
         2Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782624992; x=1783229792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2y2aGGvAdzTMZAt6XgZ667DmYPmid1iJw8FUP5rUeuY=;
        b=FJm6sSJ4ZXAluchI5qTGOOc+nJPr2z1frk7eHrGvFxW0c7bqjKNXFhyCGxQjL6qWyE
         6+cpmjb3yyRsx6qql7KjjVHi4AKHGKixikkv27ykxMgqLkzWe1lIHtatTM6CjuI1m3Au
         BMSQMcqzItUAjUR1jlPbBNKHCtwGu3VYbWlk1PDSidMrrONLTivoXA6P6WYdSkw3TLUB
         Lg68e0IqdUbT47jQEfcRXhGZ2WeQ+VagZ3Sq6Ovc4D6y5hmsTgWjD+xj35vQfePkCnyo
         1+0a744La0C44b7Y/rp5x2o4EHANxKBx9PPCAqVkdStAjJUkqhyBO00739szlC/0vKkZ
         mHoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1gV1RWEqW/HsvtXJafNs5YN9dEgSNh1jrkrFhV4JVh3A5J7ek7wIEW7sAPyPVpbNHoa7HvQTvJT/o@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrk60QP1P+gggTAnZqQQ6aTN+Relv3rwrc+496wno3zD4hJWVr
	1MGt0O9rSWg8+yK/ffqvYvMNYuEtppnurFRI9nRbX2Uk4/JoSZikxD1A
X-Gm-Gg: AfdE7cn/2ioSTB1ALbI+J96iFlacIZKlqdj6wbs1q/rC794vOmUVVlrcbiXNgoUtS1j
	phyJs3ZW34WE9+dykzV55MbRS7eBxeUvCulSPW/CNOVmTVdqbtcXbNBH0G/cyux7/73TnHbh57o
	VXvGIKJW36+HMV/AQnfkffvy+GKeGXlgp7rq7u1EfarN6R77D2HdsJrMZZzKGin5XYAdEOhWfCY
	icmKchzJ08hvmDvUDaOgoNfgIbhsOGNvSvCWsfOYH0d9Nai3ht42r3HrFVaDVerY+DC2LYYoRxJ
	Ll4Kn/xHhNbZ0ft0w2BJfv094StkRG/nq5xtW+DBUy4zeHDUpt3Z+NtkRpzP2e0KJu2YsiLyliK
	xEVAFItf4E0LuOToU8vtUm8p2VNelpTf4iGj2c+K4mnCLLMj/E931CIV+6GRVkmr24jSp8C4vTp
	mpjCQ4hRs7GnILSTCY
X-Received: by 2002:a05:6122:e46e:b0:575:29ef:7df8 with SMTP id 71dfb90a1353d-5bd69d1f795mr5165207e0c.2.1782624992499;
        Sat, 27 Jun 2026 22:36:32 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bda2dd64c3sm229003e0c.1.2026.06.27.22.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:36:32 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 28 Jun 2026 00:36:04 -0500
Subject: [PATCH v2 3/7] iio: adc: ti-ads1262: Add channel filter support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-ads126x-v2-3-4b1b231325ba@gmail.com>
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
In-Reply-To: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4202; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ANUkdLWe+7RcLhUKloW6tdEkCtqS2AXmrjadF/8l4DQ=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkOm64zvNqW/qE8y33C3NzH6U/iDsqv+Fy6+veXA3zWy
 zP2S7GkdZSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmcCGcHEKwETuFTEyHG79VPz+qN1Bjhfd
 phPcbF7l/O4LzapelfLp/vWWeYfZNBj+O+x9M6/Q1+7HQyHP1WL3PXl5j0/tEl5a895ZS7psx+k
 iRgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Expose per-channel filter configuration through the filter_type
attribute.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 65 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 6103cf5a2d1624a9..ece97a0c2b1304ad 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -146,6 +146,14 @@ enum {
 	ADS1262_RUNMODE_PULSE,
 };
 
+enum {
+	ADS1262_FILTER_SINC1,
+	ADS1262_FILTER_SINC2,
+	ADS1262_FILTER_SINC3,
+	ADS1262_FILTER_SINC4,
+	ADS1262_FILTER_FIR,
+};
+
 enum {
 	ADS1262_DR_2_5_SPS,
 	ADS1262_DR_5_SPS,
@@ -201,6 +209,7 @@ struct ads1262_chip_info {
 
 struct ads1262_channel {
 	u8 input[2];
+	u8 filter;
 	u8 gain;
 	u8 data_rate;
 	u8 reference[3];
@@ -441,7 +450,7 @@ static int ads1262_dev_read_by_cmd(struct ads1262 *st, u8 cmd, __be32 *val)
 static int ads1262_channel_enable(struct ads1262 *st,
 				  struct ads1262_channel *chan)
 {
-	u8 mode0, mode2, inpmux, refmux;
+	u8 mode0, mode1, mode2, inpmux, refmux;
 	int ret;
 
 	/* Avoid using guard() here to mitigate AB/BA deadlock warning */
@@ -449,6 +458,7 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	mode0 = FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
 		FIELD_PREP(ADS1262_MODE0_IDAC_CHOP_MASK, chan->idac_chop) |
 		FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal);
+	mode1 = FIELD_PREP(ADS1262_MODE1_FILTER_MASK, chan->filter);
 	mode2 = FIELD_PREP(ADS1262_MODE2_DR_MASK, chan->data_rate) |
 		FIELD_PREP(ADS1262_MODE2_GAIN_MASK, chan->gain) |
 		FIELD_PREP(ADS1262_MODE2_BYPASS_MASK, chan->pga_bypass);
@@ -465,6 +475,11 @@ static int ads1262_channel_enable(struct ads1262 *st,
 	if (ret)
 		return ret;
 
+	ret = regmap_update_bits(st->regmap, ADS1262_MODE1_REG,
+				 ADS1262_MODE1_FILTER_MASK, mode1);
+	if (ret)
+		return ret;
+
 	ret = regmap_update_bits(st->regmap, ADS1262_MODE2_REG,
 				 ADS1262_MODE2_DR_MASK |
 				 ADS1262_MODE2_GAIN_MASK |
@@ -682,6 +697,52 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int ads1262_get_filter_type(struct iio_dev *indio_dev,
+				   const struct iio_chan_spec *chan)
+{
+	struct ads1262 *st = iio_priv(indio_dev);
+	struct ads1262_channel *chan_data;
+
+	guard(mutex)(&st->chan_lock);
+
+	chan_data = &st->channels[chan->scan_index];
+	return chan_data->filter;
+}
+
+static int ads1262_set_filter_type(struct iio_dev *indio_dev,
+				   const struct iio_chan_spec *chan,
+				   unsigned int val)
+{
+	struct ads1262 *st = iio_priv(indio_dev);
+
+	guard(mutex)(&st->chan_lock);
+	st->channels[chan->scan_index].filter = val;
+
+	return 0;
+}
+
+static const char * const ads1262_filter_type_labels[] = {
+	[ADS1262_FILTER_SINC1] = "sinc1",
+	[ADS1262_FILTER_SINC2] = "sinc2",
+	[ADS1262_FILTER_SINC3] = "sinc3",
+	[ADS1262_FILTER_SINC4] = "sinc4",
+	[ADS1262_FILTER_FIR] = "fir",
+};
+
+static const struct iio_enum ads1262_filter_type_enum = {
+	.items = ads1262_filter_type_labels,
+	.num_items = ARRAY_SIZE(ads1262_filter_type_labels),
+	.get = ads1262_get_filter_type,
+	.set = ads1262_set_filter_type,
+};
+
+static const struct iio_chan_spec_ext_info ads1262_ext_info[] = {
+	IIO_ENUM("filter_type", IIO_SEPARATE, &ads1262_filter_type_enum),
+	IIO_ENUM_AVAILABLE("filter_type", IIO_SHARED_BY_TYPE,
+			   &ads1262_filter_type_enum),
+	{ }
+};
+
 static int ads1262_alloc_channels(struct ads1262 *st,
 				  struct iio_chan_spec **channels)
 {
@@ -718,6 +779,7 @@ static int ads1262_alloc_channels(struct ads1262 *st,
 				BIT(IIO_CHAN_INFO_SAMP_FREQ),
 			.indexed = true,
 			.differential = true,
+			.ext_info = ads1262_ext_info,
 		};
 	}
 
@@ -983,6 +1045,7 @@ static int ads1262_parse_channel_node(struct ads1262 *st,
 	int ret;
 
 	/* Write non-zero default configuration values */
+	chan->filter = ADS1262_FILTER_FIR;
 	chan->data_rate = ADS1262_DR_20_SPS;
 
 	ret = fwnode_property_read_u32_array(node, "diff-channels", pins, ARRAY_SIZE(pins));

-- 
2.54.0

