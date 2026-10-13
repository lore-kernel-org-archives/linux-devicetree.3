Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885F49B466
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916364; cv=none; b=VlUyGXnZ4B2k9ibmnEnhhHaiI/mTYECeYUPbw1tO7pJrvWG2KjIKXaBZgNy5tzGHQ3HJ+ZCP6TzWl6LpvIuLlVKswYUKhN0QNENnUyw3qGCzQQ+56v1mSrXYOvzdtbHFxxEwCLGoIqcqKFLJW7tIgyqZ6orVBK+RJXsH3blKKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916364; c=relaxed/simple;
	bh=Bs86v3lbyxE6NRoXSABEXIQnXCClN1E6c4K13PIelMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glhwtj7prxgF4xNSkTm8p0DPUKwYQ7f0N/iPis5HG+mapKDyLP9yiMK5PP0ps6aX4q8GbqfKnxcuo/I4ZNm+f6wA6tTcr2Ri5Je+y3mAuuhRTTmXrP/UwKG4i5aSKXnDUUP7XbHSm3VL1XLDiE5A3OKPgFpU6K1/eNwibL3clIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkAT/UB+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkAT/UB+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16c399641so33098945e9.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916360; x=1792521160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MI+lWug+CF+zds+VngY+4+EE14MEntbx1ydEJnf/IQs=;
        b=DkAT/UB+UL0ZOYfjrVtVyP3cVry5UrQzsM3Ccxun3wvk0QcN/idEKA/WJLAo8Q0M4J
         wNJ4EcybqZn7MDrQ7RE+lJP6rF02fSQ+b/41fEB9Caq22/MwYSvCGZVPa0qkRkqY4tJU
         JB1tRPXRSirsaV4u0fVOLlV0QUkhEFTA2NMu3xiEwQ141Tlo2QpQ4M5l3Z3sKFAuM7co
         b3smR40djCuxj8Z0pgn3dphEUUya3Rz/n5RbT0a4el1NRV/kDoFG9bbtKYhiq0P1BZ9t
         Y2rr5A8syN+ZsN37DdpHYX2sKpaH1dwVx4EHyKxTBwX+BRwQlzmTh1ZFl8AE9o8aZwzG
         B57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916360; x=1792521160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MI+lWug+CF+zds+VngY+4+EE14MEntbx1ydEJnf/IQs=;
        b=kAhLgNr6ceVuK5OZsJG1h4YreMvCqShD+swrzYQOy3dpHv9GwmojCbf7I5yIROFpbp
         eSxWGAN7NOV855OI4MlbWGikqGmsbvnhgH3sdzjoXzzf2SEGlRnDwTaHWvUpQm8pdyby
         IiKbT6LYp2QLngh6nxfXrZV8olJP+c2j7g8sJ/seuxKHw9kLa59WZ8FZSoakNHXA9+Yq
         KgUFhW/zxKFJcKApTpvGZFuqRQNQkN0W8JZpa+q1JrLpS25WkDMBZmYXI8jlOkcIoGku
         fJsSYjvmUDl+lqUKrtf6UDRlhtuy/6OzgT1SH59hIbarGbHPtecD2mdWM8rRuMl9V9VI
         3ekQ==
X-Forwarded-Encrypted: i=1; AKwUvByaH4E8xDcmfaZXOo9G+Xm3IvOIb/BS24NpMb4m+m3UY50GsB6biRtSI/FYH4hcPCnk+pyADNDwLzfv@vger.kernel.org
X-Gm-Message-State: AFq9FYJRioiGwqxHn48eflWWHpKWBSOLwwaRGRcaypozalmYXe+xC2nX
	Z0ewFV0yCRBa5hEgyp1MWA5gcol1tkklBWWBBSfi2GlEIZjWP2oiBxrW
X-Gm-Gg: AYBFou0R219kyVAnuu0TKLBT2JfOcjhDfKlafsuDk1m81ZP/tmbjbhRmMqLBX5GKX2l
	B8A8jU0hRKTbqpYjLTrWmajARay0cflJ7cZ+dUo7BCZopk3vrq7XAJtsL0RJ9p1pYX0iggdoDBl
	rMuEFOYnpWNCOUBsVMy8lQeJVq+SjhXHoIvGPw4t5m2BTSjPu4gGWbB7dTAQaUGeTmdy3/hgwCS
	YzpTMTxu2j70YaS06W0ZO5HfUEdrc20uXbVmssPG3p6rcgC3pkkvK9psZLwRb9xJ9UhRyX5CzMR
	FUskdqJXF+g0oALOVhozngPYJwmXhKlirHtZyfb/mJPTbzQrOkOvuqj98tu5fdYGtdKB0+S6/3n
	GkuXIKf096+jp1HExtSUakQ8Q5z+byjpzaftU+l2QECRLKRAv8OiIjxA+uFjhmq6CbXpeal+Mp6
	w1KAUGFuRnPG7bJDn6YonkNdOY5tPUs2O9nDPRQAC4mDXbCafP4mSm2rAk4aDMGmvi72TjsVmjV
	leyiH6TbT1Ck1fflOGzeN+iWCF0sw==
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr285728915e9.16.1791916359916;
        Tue, 13 Oct 2026 11:32:39 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm548921305e9.9.2026.10.13.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:32:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
Date: Tue, 13 Oct 2026 21:32:26 +0300
Message-ID: <20261013183226.513658-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013183226.513658-1-clamor95@gmail.com>
References: <20261013183226.513658-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 sound/soc/tegra/Kconfig        |  10 ++
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra_wm8994.c | 169 +++++++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index fdc954028d622..dd3b2d3d6c4c9 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -239,6 +239,16 @@ config SND_SOC_TEGRA_WM8962
 	  boards using the WM8962 codec. Currently, the supported boards are
 	  Microsoft Surface RT.
 
+config SND_SOC_TEGRA_WM8994
+	tristate "SoC Audio support for Tegra boards using a WM8994 codec"
+	depends on I2C && GPIOLIB && MFD_WM8994
+	select SND_SOC_TEGRA_MACHINE_DRV
+	select SND_SOC_WM8994
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the WM8994 codec. Currently, the supported boards are
+	  LG Optimus X2 P990 and Samsung Captivate Glide (SGH-i927).
+
 config SND_SOC_TEGRA_WM9712
 	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
 	depends on GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 1c18ef6971c09..b8f90149bfa63 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -43,10 +43,12 @@ obj-$(CONFIG_SND_SOC_TEGRA210_OPE) += snd-soc-tegra210-ope.o
 # Tegra machine Support
 snd-soc-tegra-wm8903-y := tegra_wm8903.o
 snd-soc-tegra-wm8962-y := tegra_wm8962.o
+snd-soc-tegra-wm8994-y := tegra_wm8994.o
 snd-soc-tegra-machine-y := tegra_asoc_machine.o
 snd-soc-tegra-audio-graph-card-y := tegra_audio_graph_card.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM8962) += snd-soc-tegra-wm8962.o
+obj-$(CONFIG_SND_SOC_TEGRA_WM8994) += snd-soc-tegra-wm8994.o
 obj-$(CONFIG_SND_SOC_TEGRA_MACHINE_DRV) += snd-soc-tegra-machine.o
 obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
diff --git a/sound/soc/tegra/tegra_wm8994.c b/sound/soc/tegra/tegra_wm8994.c
new file mode 100644
index 0000000000000..950fa6ad388f9
--- /dev/null
+++ b/sound/soc/tegra/tegra_wm8994.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 codec.
+ *
+ * Copyright (C) 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+ *
+ * Based on tegra_wm8994 code copyright/by:
+ *
+ * Author: Sumit Bhattacharya <sumitb@nvidia.com>
+ * Copyright (C) 2010-2011 - NVIDIA, Inc.
+ *
+ * Based on code copyright/by:
+ *
+ * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
+ *
+ * Copyright 2007 Wolfson Microelectronics PLC.
+ * Author: Graeme Gregory
+ *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+
+#include "../codecs/wm8994.h"
+
+#include "tegra_asoc_machine.h"
+
+static struct snd_soc_jack_pin tegra_wm8994_mic_jack_pins[] = {
+	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
+};
+
+static unsigned int tegra_wm8994_mclk_rate(unsigned int srate)
+{
+	unsigned int mclk;
+
+	switch (srate) {
+	case 8000:
+	case 16000:
+	case 24000:
+	case 32000:
+	case 48000:
+	case 64000:
+	case 96000:
+		mclk = 12288000;
+		break;
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		mclk = 11289600;
+		break;
+	default:
+		mclk = 12000000;
+		break;
+	}
+
+	return mclk;
+}
+
+static const struct snd_kcontrol_new tegra_wm8994_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
+	SOC_DAPM_PIN_SWITCH("FM Radio"),
+};
+
+static int tegra_wm8994_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
+	int err;
+
+	err = tegra_asoc_machine_init(rtd);
+	if (err)
+		return err;
+
+	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+		struct snd_soc_component *component = codec_dai->component;
+
+		err = snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
+						 SND_JACK_MICROPHONE,
+						 machine->mic_jack,
+						 tegra_wm8994_mic_jack_pins,
+						 ARRAY_SIZE(tegra_wm8994_mic_jack_pins));
+		if (err) {
+			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
+			return err;
+		}
+
+		wm8994_mic_detect(component, machine->mic_jack, 1);
+	}
+
+	return 0;
+}
+
+static int tegra_wm8994_remove(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link = &card->dai_link[0];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	wm8994_mic_detect(component, NULL, 0);
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEFS(wm8994_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm8994_dai = {
+	.name = "WM8994",
+	.stream_name = "WM8994 PCM",
+	.init = tegra_wm8994_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBC_CFC,
+	SND_SOC_DAILINK_REG(wm8994_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm8994 = {
+	.components = "codec:wm8994",
+	.dai_link = &tegra_wm8994_dai,
+	.num_links = 1,
+	.controls = tegra_wm8994_controls,
+	.num_controls = ARRAY_SIZE(tegra_wm8994_controls),
+	.remove = tegra_wm8994_remove,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm8994_data = {
+	.mclk_rate = tegra_wm8994_mclk_rate,
+	.mclk_id = WM8994_SYSCLK_MCLK1,
+	.card = &snd_soc_tegra_wm8994,
+	.add_common_dapm_widgets = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+static const struct of_device_id tegra_wm8994_of_match[] = {
+	{ .compatible = "nvidia,tegra-audio-wm8994", .data = &tegra_wm8994_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_wm8994_of_match);
+
+static struct platform_driver tegra_wm8994_driver = {
+	.driver = {
+		.name = "tegra-wm8994",
+		.of_match_table = tegra_wm8994_of_match,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = tegra_asoc_machine_probe,
+};
+module_platform_driver(tegra_wm8994_driver);
+
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Tegra+WM8994 machine ASoC driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

