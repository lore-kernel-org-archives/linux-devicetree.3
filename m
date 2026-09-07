Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161D646EC84
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787603; cv=none; b=BXu0/N6onrFl3lLBp8/BwunNiY89dLrl3hD6fYlElGAMF5nQ4CEkkRoJeKBffngpA5jYIOtowoOlF/4bhkAGeuC2gNg94yl7b1HQ3iq0KeUn0sIXIpnfFVqvqNsE1z5ULd+SMVr9kxtqsXjcsvpu/viDOmyNjGa+/Hyxlh7DzMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787603; c=relaxed/simple;
	bh=9bW10oDtwJZs/PWwTIIe6hHafffSVv0XlaaCvr6TyAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ievVDCVZ49luEShZXy4BwsB5QnEeGXibp6LPXqdZltf1a7VGv65sPpGiU/y7TdicGh4Goi9MF03CHZxVWGoohw1Tm0xHbAHfuB+GlsjFhFeh2v5x0YVA5HoYsV0hi6xrIZI+qKZ0l+B+VUQxa+JUbu+O0P50ATKYUvCxWblK8uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=skAQ8+Iu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="skAQ8+Iu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2055573c8cso435750966b.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787592; x=1789392392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ze692xwI5jsqaKUMaqkOILgz7h+mY9HSH9sWUthU9v4=;
        b=skAQ8+IuTKuSrtMfR9KmnbAz+azZwlO9R34ng+ZXaJklyMUR3J7LgWQo//p6ifjMD+
         GEPpmk38RxI8BCWDHxezes6ThDJBsq1enUuJ1f61JGdrFTVEud/1rkwjkcF+/DxYIcIp
         JjXtatGQNZfoMkSW1yFlC6wg8Y+hcxwm80ekjpI0E4s+cTqDH6k+Fqvwyc8r9QfbUrMl
         NuKVP1Pma3aORWkz/JrudwLVkIvD0t/gzzA+Niqmt/N73W18YTwtTTlhQ/7+m42Xt6D/
         /Slq0qBk/G6sNupPNBgtNzFNd8KEL0roBXPlmu9500GujXsR6NUeqmkdCaLXOJJl4jsS
         RTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787592; x=1789392392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ze692xwI5jsqaKUMaqkOILgz7h+mY9HSH9sWUthU9v4=;
        b=KK2xyanO2KFc4wx5rnb5ZTl5igpyoX3B0s+ZF96XRkaVEXIxiC3yg5Ci66zxvGRRrN
         JUkswjQse5IrMfMe831ewx6dIHuUerdmduTcTR9ABMFgH0GL4LoaeCRGDPTChqMwtMey
         TG5oFY6mifxQj0NVgcc2c+TCahMg025r/LMCa+nhTKCYPtA2SAqfEECcdTKc72IyDODM
         dhW0kY88n/dgUVcfmw1sP7K4+wxu+UleGcrB4nZ8Pq6ZVJfl6xTbOJgGkdpgp56nYQvf
         pf601OX0gS2Q7nZtfXBhbSf2IGFaJATepUucI/kR/PNA0HFwfp3dG4lx89rzr0iVM3vR
         lKjw==
X-Forwarded-Encrypted: i=1; AKwUvBzHA5f5rJ7186ffanlMAPSObCNzjUh5CWR90phPvjbOmH1aU6XAnU71mEPcSaj1WXAaAhVK/+gDvHJh@vger.kernel.org
X-Gm-Message-State: AFuF++kyI+tURv0D4/TlBpmJxAzXcWXXm486xpGuP6Df4ibyWQbXwBGc
	GQ5MwDrGxtFOLPhzCplSGaPdMK48VifhPKaUvrZRy5mnDf9icQ32rl5eLNl+Ci+4FDo=
X-Gm-Gg: AYBFou06/KOeyuCrd9Jx0OZSIWBH9mY6ENzYAj8yH4ljcSTUVG9GphTo/tu6rnoFH9p
	BdYyKkvB3PMY4bcx3Rotr3A0fQAvzHWjAD2GxaklF1kK36peP0cnDjYtNouApEtTUJxOhRfCVHp
	5BeNnfLI7E3Asb0lAoFzGx7ZOzESqCwJqeglN4ZVTee8fbM+Z10lFI/m7q2ec7RZ667PRObUxJ3
	Op+HViJ/G4TOCOtfoNNe/FMky11/7QBtACv2p4CQf/kMrsYd9KTIsGYs+Rtx6BSV9YqodLG7UT3
	86GfA3VOc+8SRVdB72JmauW+DCwn/ehIr0rD2IcaxSl6jUUgiqCrwQy8Ig9EWEcw/oW9hss8zgq
	0bsiwh98xIkczgytI28bh+t1ylbcj6v4NaNNxgCTogPQeYFU3lWbqiQVm2ggUKkcaLShJPKub2/
	Bn7SOh1Cl9rmNA9bfz7CUmGlITEOLmlioPlP7uvOPRmP/5HfaXUzLU0sL2xHl4lyYdNGlGdSUks
	PuXlVJvfHO+teyMIbc7pYOfnWJ/eCNdhBo/vNJBgpjvmlpyv2LMnEMi5NWdOOt/cYsTRJjkPT76
	5O7Bf12SgA7m8N7N6sgiaUfjCC7mZt1xCWFD3w==
X-Received: by 2002:a17:907:3eaa:b0:c26:37fb:3461 with SMTP id a640c23a62f3a-c2637fb36b0mr464023066b.46.1788787592611;
        Mon, 07 Sep 2026 06:26:32 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:31 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/6] mmc: sdhci-of-at91: add option to keep clocks enabled
Date: Mon,  7 Sep 2026 15:25:30 +0200
Message-ID: <20260907132617.1198548-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sdhci_at91_set_clks_presets() both enables the controller clocks and
programs its capabilities and preset registers. This prevents callers from
restoring the registers without changing the clock enable counts.

Move clock enablement to callers and add a SoC data flag for controllers
that must keep their clocks enabled. Use it in the runtime PM paths while
keeping register restoration separate from clock enablement.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

 drivers/mmc/host/sdhci-of-at91.c | 39 +++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index 7c4ac65f247d..b7e2a89da348 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -38,6 +38,7 @@
 struct sdhci_at91_soc_data {
 	const struct sdhci_pltfm_data *pdata;
 	bool baseclk_is_generated_internally;
+	bool keep_clks_on;
 	unsigned int divider_for_baseclk;
 };
 
@@ -164,7 +165,7 @@ static const struct of_device_id sdhci_at91_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
 
-static int sdhci_at91_set_clks_presets(struct device *dev)
+static void sdhci_at91_set_clks_presets(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -174,7 +175,6 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	unsigned int			gck_rate, clk_base_rate;
 	unsigned int			preset_div;
 
-	clk_prepare_enable(priv->hclock);
 	caps0 = readl(host->ioaddr + SDHCI_CAPABILITIES);
 	caps1 = readl(host->ioaddr + SDHCI_CAPABILITIES_1);
 
@@ -222,11 +222,6 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
 	preset_div = DIV_ROUND_UP(gck_rate, 50000000) - 1;
 	writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
 	       host->ioaddr + SDHCI_PRESET_FOR_DDR50);
-
-	clk_prepare_enable(priv->mainck);
-	clk_prepare_enable(priv->gck);
-
-	return 0;
 }
 
 static int sdhci_at91_suspend(struct device *dev)
@@ -254,9 +249,11 @@ static int sdhci_at91_runtime_suspend(struct device *dev)
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
 		mmc_retune_needed(host->mmc);
 
-	clk_disable_unprepare(priv->gck);
-	clk_disable_unprepare(priv->hclock);
-	clk_disable_unprepare(priv->mainck);
+	if (!priv->soc_data->keep_clks_on) {
+		clk_disable_unprepare(priv->gck);
+		clk_disable_unprepare(priv->hclock);
+		clk_disable_unprepare(priv->mainck);
+	}
 
 	return 0;
 }
@@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct device *dev)
 	int ret;
 
 	if (priv->restore_needed) {
-		ret = sdhci_at91_set_clks_presets(dev);
-		if (ret)
-			return ret;
+		if (!priv->soc_data->keep_clks_on)
+			clk_prepare_enable(priv->hclock);
+
+		sdhci_at91_set_clks_presets(dev);
+
+		if (!priv->soc_data->keep_clks_on) {
+			clk_prepare_enable(priv->mainck);
+			clk_prepare_enable(priv->gck);
+		}
 
 		priv->restore_needed = false;
 		goto out;
 	}
 
+	if (priv->soc_data->keep_clks_on)
+		goto out;
+
 	ret = clk_prepare_enable(priv->mainck);
 	if (ret) {
 		dev_err(dev, "can't enable mainck\n");
@@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
 				     "failed to get multclk\n");
 
-	ret = sdhci_at91_set_clks_presets(&pdev->dev);
-	if (ret)
-		return ret;
+	clk_prepare_enable(priv->hclock);
+	sdhci_at91_set_clks_presets(&pdev->dev);
+	clk_prepare_enable(priv->mainck);
+	clk_prepare_enable(priv->gck);
 
 	priv->restore_needed = false;
 
-- 
2.55.0
