Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778372;
	b=LIzUuMMYcu7pWN/PtMuhAmOOmsugZD22hRjGJfcza+uvU8CHMezmGO44dCuW2p+xFzeI
	 2tCq2f+MJ+/dMY27Vps7dnIfKE5vxVPhPq6+drksTi958cmmjilOwvJY8LMl/80ERTNTz
	 12IhE2Hlu/s7OmxqR0buK09/uXmjrBEj5w0e0/aBESmOZPphoSEweplwPc+0WAhJ6niZk
	 7dx2scsedq4WU+2oVKMP9yL38R+JNPaqZZOQsCdxfxB5N9Z/9xkW02wP3vDGVwLgsIhTH
	 SAkokbjyOgP32w7nwaPnvJxkSUyKvZCN37nrSzeKg5smGgVKrdtT60jwOLoGOEB4fEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WkiQu/yXLk7Gnv6kxACf+5k/KFRhbQ3OUKruqKRLWhw=;
	b=gSArqnVUDDKCDFNAkAqX0/GVcd5+MnrBKB6OoFW4wU5sU+vKtFeg7FJanS8VN5UvMAdf
	 qR4Q445vg/mvlZM/HA82cjyNl057G6OQPwBI10zRF9OUaYVqwE2Gnrm1Chk+e8fntk6oK
	 +7TUk0qPCAd9STrLTEanFSMz0PynhELZ9TCZCzVdP+uCS4WQsQ/AYRYFDMw90pHFE1SoZ
	 B6KAOdYQQK+wPyRYn+ryj3kkU80UsVkfTIx6gADWaN8IY2oOx33jae1uuJQW/MClEACk6
	 RgwoMdemlH2UuPLT7gxdXiJBYvIKcPDHWLFEO3ihN7jYHvxoOlaCUBzFVvXp/2TbQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4HT7nWn;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E000560A2617
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E000560A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y4HT7nWn
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso723823f8f.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778370; x=1793383170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkiQu/yXLk7Gnv6kxACf+5k/KFRhbQ3OUKruqKRLWhw=;
        b=Y4HT7nWnZbyR81TXpjXltfD7lHrSeNfFoRs6oIMDkoU4872MTfW4z8CXPzoH/6Wnx3
         Cy/XG5stD7ons84pjJSAPPws5Ak0bo2o3ghh0KGs19aHFVG/WO7fDp5bwU47i3vFPcwl
         1oWDRo/18WCVd3FldUmOovqOmzT9cmDCBvwgOnF/Eczah/DWKerEyCU7MLbQH9Rka0mw
         EhLqr/d2VINXQZ8L8HxSeNIiRsknq12oth4uQC+bFTTEIZsD/Z2qWHCZnql9r8bgFaGB
         IhCDxnIuccKGg4MuNlfJtGuNZ7z1nJWBCphU5TWIeKLFETPnc1GiveSif8a1ZbqOpNKM
         MTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778370; x=1793383170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkiQu/yXLk7Gnv6kxACf+5k/KFRhbQ3OUKruqKRLWhw=;
        b=ZwowGW3Ccm6z0f8Ci/WWhjqQDp2C30E/ujdE06fIn5oRaCPjO5O+kTaKGRzZ7Gq/di
         hX+kuyd6q/E+G8iTCU2IxFjRQt91fq9/DsGfyL2itzwBhRuQfhvA3cc1pq1+F+Xwlz1v
         +Y1n9xdLZLEMNW7DARA2ViyFWla0tbl++2tNvMSLidnUz78wxSfHFXoRLWHG8AG7u4tl
         Ro8qgtd7pAdBse7Xci/ZCb4Ha6AmhIa0rLlxQf2YD0nd44pxzmrGGSsn9gWN0tgZ3IBi
         JyNvOJkjuwYFJh1SKMIS/pA+dqvaE9+0olawTAYEWES1N/U5PVC2wXuDhQROZaLea9i1
         4uRQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ1woSl80dipcobujeh2Typab+70Gh1Jjvkw1HBCe6oXVkjQXbNoSgcqyQVuVQKoW3olT91lotp3Dy@vger.kernel.org
X-Gm-Message-State: AFq9FYKmn63eqfptzBIxPpNhSucAYbH6hSFbFLMzPpi8pe3REO9IVU7W
	Wx2mr9M3YTsNYsDOPCPuL795AiNkLvXbrTGbkZzcD6JQid/7kR6ZWeCG
X-Gm-Gg: AYBFou3SUkLsdZRDtEdEaxY+6T2ml6Ni7FFS3O/Vz0PyZsb2jPNYeaVt2ldNubNrf8n
	CHZOLI77yyYNGR48qc6K8/oW7GE5hGQVVWgUC6WPT6mAqp4yeyM77vLHyhWvLyk0m18uo6+PoHL
	+pQkZq0tAsahYwyqpsx/ONsTymCYhNI7DU2A0xhGsFVL6Y8Yes85ctVlY02n4iVgixEG5uaLCmB
	kJUQiwCbdoR91Dp1/bkiJqss6xTLRfLediF8ev0JztCw0k1JQfYP99i6NsJnRs9kNuSvVkeizAr
	ppmg+tDoJTTo1B7ITNRuXGXtR208zTrBo2V1e4+g1Xqd6ZXDmiD5zSv2lZPJPs5gEvB5BrtWqbP
	uN3CLfMvP2nqw7uAntXqgMI/lGkkoxSss1LjD4rXANLyLOpSJU9y0qdqBaaj9senkGC99r0lOU/
	8TqcvHPNrBU7bO1+XEBM8qDjai7xKQBB+WcBEDhhZkljo/tZhfvlBOXzjVFpoiZ1X4maY3ry6Jm
	TsbutxuJLdo+q21Iau7ohx2bRL9eI98Qdl1TJxbpHTwgs8/3lswLP0YHQ7g/KbZwLOHwVkQKzst
	Su66+LuU3ICpy6F5q+UMcn3/inGpQEAAE/FCgdqdw0W8oOBrzasmevcGxKlEnwr1Nb2TeqJUqgv
	xqk0PFXdk/ZOH2H5QYPRrdo+XypfQUIjTkdp8JkDYAIlC
X-Received: by 2002:a5d:6f07:0:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-48e385a6073mr5116724f8f.24.1792778369969;
        Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/8] iio: adc: rzt2h: Prepare for SoCs without sample state registers
Date: Fri, 23 Oct 2026 18:59:16 +0100
Message-ID: <20261023175919.160103-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for SoCs that use the same ADC IP without the
per-channel sample state registers present on RZ/T2H.

Add a feature flag for the sample state registers and make the sampling
frequency handling conditional on their presence. Allow each SoC to
provide its own sampling frequency calculation and configure the existing
RZ/T2H support to use the sample state registers and corresponding
calculation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 51a976f85ae7..94dad479abff 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -61,9 +61,13 @@
 #define RZT2H_ADC_STOP_CYCLES		2
 
 #define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
+#define RZT2H_ADC_FEATURE_SAMPLE_STATE	BIT(1)
+
+struct rzt2h_adc;
 
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
+	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
 	unsigned int num_channels;
 	u8 features;
 };
@@ -149,6 +153,9 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
 {
+	if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+		return;
+
 	writeb(sst, adc->base + RZT2H_ADSSTRn(ch));
 }
 
@@ -529,7 +536,7 @@ static int rzt2h_adc_read_raw(struct iio_dev *indio_dev,
 		*val2 = 12;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	case IIO_CHAN_INFO_SAMP_FREQ:
-		*val = rzt2h_adc_sst_to_freq(adc, adc->sst[chan->channel]);
+		*val = adc->chip_info->sst_to_freq(adc, adc->sst[chan->channel]);
 		return IIO_VAL_INT;
 	default:
 		return -EINVAL;
@@ -544,6 +551,8 @@ static int rzt2h_adc_write_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ: {
+		if (!(adc->chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE))
+			return -EINVAL;
 		if (val <= 0)
 			return -EINVAL;
 
@@ -733,9 +742,11 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	if (!adc->adclk_rate)
 		return dev_err_probe(dev, -EINVAL, "invalid adclk rate\n");
 
-	adc->samp_freq_avail[0] = rzt2h_adc_sst_to_freq(adc, RZT2H_ADC_SST_MAX);
-	adc->samp_freq_avail[1] = 1;
-	adc->samp_freq_avail[2] = rzt2h_adc_sst_to_freq(adc, RZT2H_ADC_SST_MIN);
+	if (chip_info->features & RZT2H_ADC_FEATURE_SAMPLE_STATE) {
+		adc->samp_freq_avail[0] = chip_info->sst_to_freq(adc, RZT2H_ADC_SST_MAX);
+		adc->samp_freq_avail[1] = 1;
+		adc->samp_freq_avail[2] = chip_info->sst_to_freq(adc, RZT2H_ADC_SST_MIN);
+	}
 
 	pm_runtime_set_autosuspend_delay(dev, 300);
 	pm_runtime_use_autosuspend(dev);
@@ -766,8 +777,9 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
+	.sst_to_freq = rzt2h_adc_sst_to_freq,
 	.num_channels = 16,
-	.features = RZT2H_ADC_FEATURE_CALIBRATION,
+	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
 
 static const struct of_device_id rzt2h_adc_match[] = {
-- 
2.55.0

