Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9335CBD6
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476372; cv=none; b=K3+JDhjLORshQ5zfF+quPy7NQ1TQ6Cmu8+SNYtzITGo71TxGeaAY7CkhL6oqyLc1EWaz6VZNpk8So4e78iafy7i4TEqplpR4ZJSfSMMdOf0jUvs0e1InMS9oRSMrT5MagLq1YWWA8vXUeNCOa7ZnVP4lwHyEri/QbNGUkZ7mgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476372; c=relaxed/simple;
	bh=C6Ad2AD0siK4x4/GE1JAh5GTw84tgnx8SmNQ9vLx5Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wy4NP35fSDDs8jvngzE61iToW+tESzDt8m9FQeJvg9EBlabSSg+1ZmFMEWl9ANmEbTCzpql/o1t3vSKin+oyMXDNPRRH76An0V7UoTW7KEAdvN+mlz40aqYKHy4M7cDJYbAyMn0rCeAFtBzN5ikbxE++RqycVo9yiO0prz00TxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso185400f8f.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476367; x=1789081167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/s6nvcJwx7Ifs5qcA8T+nQv2xmeJ2s33utca3H2YozM=;
        b=TzIIK1JJIlfLq+L3nNhxHF6pGlgmF6lla4u4bePfS9vAu33KmsJZNjuFDynXWo8x5N
         Dl3g7vI7341+ziEzNtFy97kK8WFWJmzlWbwBHXRjDq3I4x9MVIIBTlbHEqsxOxquvPYV
         qBNti6XaAmDu7wrQa7C3kEHdc2ARBYarz53VJFE8n8IMOvXJkaq9f7t/19dfrbp6vbaa
         EGrg+cFzef+LVqC4k7/xWtSNFKg/qemDTKgnf2FNRab25Vy5ZYXtV2Pm8keGq8CPDzQ2
         XcubcA7/X3l+ekHX3Ka7EygwTIaNT6I2qqc+Lwuygf4V7vYbP6szg/T2Q2b0aN0CJVbF
         5YBg==
X-Forwarded-Encrypted: i=1; AKwUvBzMcj1osHLCr3m9G6SRv9finMF7f7kY+AuyfLxpq+3GmxcA3sX7K9O4AWhVOIhYDoegEezRus6XpE10@vger.kernel.org
X-Gm-Message-State: AFuF++lhmo9SJZljbRcx2yQKuyQjeDQDFU/s6j6hYyupVlsdcT0Pqi0g
	FJ59zsZl5Q/2mGL9rQHfJmuUCi2rNYAabxnu5beZMUk+9ybpUcZRyM/L
X-Gm-Gg: AYBFou1q4A0hSajcbUJWbucmhrSIBI9LsbuqAqPZSiT3gitNJxNcc+HPSpROk2VtsWL
	4bGsBy953ECeWnB7FMCTVMAuXqsCMSF5mR+xGfUhZ2CfWziFP11jxV2U8ylxsH356izbSPP+g21
	0A4TBtiCVoX1jOjN0f1FDR/1DOALeFVykpzxHrfj2/YFMnaC2GyrP5PCP6e89kdDGfr0zODdY3m
	3lH8g21l0PU62KcGw6fdU5FiPnyDbFzHD3TNnxQ8TeH2Balos2LFtCumXkHJEi3YeXbWZVTXGp/
	1eN6EnuOwSGgoui+QEVTYTlZAnkZmj5f5pJuEEUgzFHHw/QRCllSKDJtiPUGjxfBCjuhwd7mVaY
	Fu/L3uDGz3il12ltcwG28hlsWtJLb+O/WQBdtfJ1vtjJC5GBx81pfVB/s/fFTQOI087kYzRWxN7
	JDG3htU/gyBOzFfx4ejgQpKHe4z6WtDQqwbxewni2/bucQKXsAdYwp+WyjPj7cUo7eBcRvgz4A/
	/3UG33lpCIXtJ9P1/uSDxZfMmlsEbvfBPqYNfs=
X-Received: by 2002:a05:6000:2505:b0:485:8ad5:f965 with SMTP id ffacd0b85a97d-4858ad5ff97mr104210f8f.2.1788476366934;
        Thu, 03 Sep 2026 15:59:26 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:26 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 2/4] mmc: meson-gx: enable the bus pipeline clock on T7
Date: Thu,  3 Sep 2026 23:59:19 +0100
Message-ID: <20260903225921.2290441-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the T7 SoC, the bus path between the SD/eMMC controllers and the
NIC_MATRIX fabric goes through a pipeline stage inserted by the hardware
design to help timing closure. The stage has its own gate clock and,
when that clock is disabled, a controller that starts a DMA transfer can
never complete it, hanging the storage devices and, from there, the
whole system.

Add a dedicated match data for the amlogic,t7-mmc compatible that makes
the driver claim and enable the "pipeline" clock for as long as the
device is bound.

The clock is deliberately not optional: the hardware cannot do DMA
without it, and failing the probe with a clear error is preferable to
booting and hitting an undiagnosable DMA hang later.

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..68566d7eccc7 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -52,6 +52,7 @@
 #define   CLK_RX_DELAY_MASK(h)		(h->data->rx_delay_mask)
 #define   CLK_ALWAYS_ON(h)		(h->data->always_on)
 #define   CLK_IRQ_SDIO_SLEEP(h)		(h->data->irq_sdio_sleep)
+#define   CLK_PIPELINE(h)		(h->data->has_pipeline_clk)
 
 #define SD_EMMC_DELAY 0x4
 #define SD_EMMC_ADJUST 0x8
@@ -139,6 +140,7 @@ struct meson_mmc_data {
 	unsigned int always_on;
 	unsigned int adjust;
 	unsigned int irq_sdio_sleep;
+	bool has_pipeline_clk;
 };
 
 struct sd_emmc_desc {
@@ -1204,6 +1206,15 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (IS_ERR(core_clk))
 		return PTR_ERR(core_clk);
 
+	if (CLK_PIPELINE(host)) {
+		struct clk *pipe_clk;
+
+		pipe_clk = devm_clk_get_enabled(&pdev->dev, "pipeline");
+		if (IS_ERR(pipe_clk))
+                      return dev_err_probe(&pdev->dev, PTR_ERR(pipe_clk),
+					   "missing pipeline clock\n");
+	}
+
 	ret = meson_mmc_clk_init(host);
 	if (ret)
 		return ret;
@@ -1322,12 +1333,22 @@ static const struct meson_mmc_data meson_axg_data = {
 	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
 };
 
+static const struct meson_mmc_data meson_t7_data = {
+	.tx_delay_mask	= CLK_V3_TX_DELAY_MASK,
+	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
+	.always_on	= CLK_V3_ALWAYS_ON,
+	.adjust		= SD_EMMC_V3_ADJUST,
+	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson_mmc_of_match[] = {
 	{ .compatible = "amlogic,meson-gx-mmc",		.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxbb-mmc", 	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxl-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxm-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-axg-mmc",	.data = &meson_axg_data },
+	{ .compatible = "amlogic,t7-mmc",		.data = &meson_t7_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, meson_mmc_of_match);
-- 
2.55.0

