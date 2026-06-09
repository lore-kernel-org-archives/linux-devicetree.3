Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A08403E97
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005180; cv=none; b=uMs47av7ksYkJDqhI5Y065ufdKMJxBRZUtcDE1gj13a2ip9URyWiG8KKab+8JT/NvUeZ9SGemGf1/YOBRaZ+4/V0SrKHfs4wyZXtgcyQqwUqg8CarXkhrh6Nhu8zJIpFlDAsOdnWiwpo4IqTUkBr1hwW0QIHZ9gVjmcDgYyPElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005180; c=relaxed/simple;
	bh=TVTFqtNv3SDidQR0s+8WQhEyydhiZpPFphguBiX/dDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IV2KeikVB0X3XHGLoq7yA6y5SwQY0t2+tmK+P1cVjwmGIQbSUnNqNVEoS54/FV730fftVg5dDaOxCJROLWmx/DIq/hmM8oFgCGofEJr4rENTh4X56xWoMRetnW36nudJ2Z7e5Mbq5JzS9tweDASr0IoYZDnGoooWH0xSmgeJ/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYUqp0Az; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYUqp0Az"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf2247e38eso55941275ad.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005176; x=1781609976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXEOWHZ4dzNUaN8JMIKeeopADr/ohbLDpOo26m2Ui5M=;
        b=fYUqp0AzlkNTpn8WDSlre0+FEZHjb3lZ2rrvIASQ9BwdCx+nF6wHJNYQ33P1hjLWjv
         IxZ6Fg5iJ50JdX287VXvcNX0TKAMx2vUPs7J2orXcnx60eSL+X2ZdMi04pxxfYyYutsV
         5i/2nsNMSjr8AtbhErTSIAvPcyS3mIgNylNa0JswvsBd2KF7ZCWu0dVXG8y0vu3qPjV+
         eOQpTy6jl4MQw+iUTFEcrS5n4PpYh7gc/HmUGzCZd8uQTRSjX6anqSPXB7RpKugGU95N
         aAc3LIwWGmexLEAvTBAm23hmPSWwVuyX7kWmpjVFUM0/smKtg1f9iSLPOHZVvdt/kaoc
         kbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005176; x=1781609976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXEOWHZ4dzNUaN8JMIKeeopADr/ohbLDpOo26m2Ui5M=;
        b=nHoigZGrr2h9TeSOMI3yIOOyjbQ7IZ7YAow0G3h4/bmPDDfvEg3H+c6aQ8QiPPPvai
         8LnSFTage397wF5hsslDylyVE1Yr6LEGEm2PDUAP9jEJkliyjjzRna0mJ/8K15aQEf9H
         +ELe5E2Zrp/+t0aEQbmqVnSgWhC0SVq3cZ15hKetMPDXc4xWJtXIJijbcD1MrfJO2nrh
         qgfp/CVBELvibAj3/DM7f+1RB9bFILZOaKyGkIXrvVFUeaFWKPPSi+CE+2BUZTYLSTay
         NvM3H/tSRkn+3A4o+CsViaCVW9uoQR/fWWAZ2ARxCJ7BF3rZ+SPIk0pNJ8vFwtIo5Rd3
         u2YA==
X-Forwarded-Encrypted: i=1; AFNElJ+anp/O1aqjWV/VhO4baLaQ6SEYIrxKr7JHa3NHR3wfC7akh1BSJIwYyv9pMUk+wq8WcAyY8uP4k/zQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4kL3OC1BTPcu4xYTiE8YHy/3fju6TNkrMx4Oe9NyLbqslC9o
	ZK+L3Z24kQYn+it6xYmDMYXz9EDLz+CfThR/ljuyZe8nXvbSVfYWojsh
X-Gm-Gg: Acq92OFpqCcU4wuQLg3iBk7SqH6ZlKfFo7EKBj34M7xwfKleK60WXX33RhiQeSPfebc
	TZ99t9Cancn+oWqcdoJund7rUmFhHy/k3Hxrr2dR3hldDWe11VL9nzfouEhE1UHFFatHgmZZw0V
	05sYi07g39YbU8bPuy6Deyo1f9nisFzbeYtcMunYFmQ1roBI7V2gbjklvIWFHjk8RTL3mZxFemg
	OpQQ87SeTGY74AC1q1Ts1lUKo6zpsDQT2cdxRc7zsTQwex/CTny0EBFhHkP0hNOe5sBOpcSEeaH
	rg/H7pOLHlnpLFwmo/ig3V2CPw6ySSjjRP+Cz5WJMuPPI31UdQ0gjZ3Jf9CB5QScLeBvYDSS12M
	KsLfYlQ/ZQ5maoEYoSw5znV5S/2BHQ7RiB6nGiqT6b+8ce6Wrp+TiVlX7l9bX02I3eyzctWm8X0
	LfF8/+wn71ljI9vF58lPhA+TObTfrxPSiS7JVe5jJBoC27Tk8+J7SuBFY5TKuoKSYbooUW
X-Received: by 2002:a17:902:f60d:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c1e85e0896mr217831875ad.36.1781005176375;
        Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v6 08/11] ASoC: renesas: fsi: refactor clock initialization
Date: Tue,  9 Jun 2026 18:38:33 +0700
Message-ID: <20260609113836.45079-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() from set_fmt() to the probe path.
This ensures that clock resources are acquired only once during device
initialization, instead of being looked up repeatedly whenever set_fmt()
is called.
Together with the previous conversion to devm_clk_get_optional(), the
driver can now probe successfully even when optional clocks are absent.
The set_rate() callbacks continue to validate that all required clocks
are available before applying hardware-specific configuration.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
 - Improve probe and clock error handling.
Changes in v5:
 - Reorder the patches 
 - update the error handling path to ensure proper cleanup by Sashiko 
Changes in v4:
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.

 sound/soc/renesas/fsi.c | 67 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index e29be2bcf952..43bc77ebcca3 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -862,6 +862,11 @@ static int fsi_clk_set_rate_external(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = 0;
 
+	if (!xck || !ick) {
+		dev_err(dev, "xck clock or ick clock is missing\n");
+		return -EINVAL;
+	}
+
 	/* check clock rate */
 	xrate = clk_get_rate(xck);
 	if (xrate % rate) {
@@ -898,6 +903,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = -EINVAL;
 
+	if (!ick || !div) {
+		dev_err(dev, "ick clock or div clock is missing\n");
+		return -EINVAL;
+	}
+
 	if (!(12288000 % rate))
 		target = 12288000;
 	if (!(11289600 % rate))
@@ -970,35 +980,35 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
+static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
 {
 	struct fsi_clk *clock = &fsi->clock;
 	int is_porta = fsi_is_port_a(fsi);
+	int xck, ick, div;
+
+	if (fsi->clk_cpg) {
+		xck = 0; ick = 1; div = 1;
+		clock->set_rate = fsi_clk_set_rate_cpg;
+	} else {
+		xck = 1; ick = 1; div = 0;
+		clock->set_rate = fsi_clk_set_rate_external;
+	}
 
 	clock->xck	= NULL;
 	clock->ick	= NULL;
 	clock->div	= NULL;
 	clock->rate	= 0;
 	clock->count	= 0;
-	clock->set_rate	= set_rate;
 
 	clock->own = devm_clk_get(dev, NULL);
 	if (IS_ERR(clock->own))
-		return -EINVAL;
+		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
 	/* external clock */
 	if (xck) {
 		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->xck))
+			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
 		if (clock->xck == clock->own) {
 			dev_err(dev, "cpu doesn't support xck clock\n");
 			return -EINVAL;
@@ -1008,10 +1018,8 @@ static int fsi_clk_init(struct device *dev,
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
 		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->ick))
+			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
 		if (clock->ick == clock->own) {
 			dev_err(dev, "cpu doesn't support ick clock\n");
 			return -EINVAL;
@@ -1021,10 +1029,8 @@ static int fsi_clk_init(struct device *dev,
 	/* FSI-DIV */
 	if (div) {
 		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->div))
+			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
 		if (clock->div == clock->own) {
 			dev_err(dev, "cpu doesn't support div clock\n");
 			return -EINVAL;
@@ -1672,15 +1678,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	}
 
-	if (fsi_is_clk_master(fsi)) {
-		if (fsi->clk_cpg)
-			fsi_clk_init(dai->dev, fsi, 0, 1, 1,
-				     fsi_clk_set_rate_cpg);
-		else
-			fsi_clk_init(dai->dev, fsi, 1, 1, 0,
-				     fsi_clk_set_rate_external);
-	}
-
 	/* set format */
 	if (fsi_is_spdif(fsi))
 		ret = fsi_set_fmt_spdif(fsi);
@@ -1978,6 +1975,11 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret) {
+		dev_err(&pdev->dev, "FSIA clk init failed\n");
+		return ret;
+	}
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
@@ -1991,6 +1993,11 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret) {
+		dev_err(&pdev->dev, "FSIB clk init failed\n");
+		goto exit_fsia;
+	}
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
-- 
2.43.0

