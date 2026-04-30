Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B98639D6C3
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533058; cv=none; b=a1wPPMkoZgeF5Gn63cpR381Sk3xv9J1OvflGnlORRtTZTh9izO4Kex/MuH3nGhBVJKIuM7PTwMDJOzWWXaaZswN0o7uQ8wUSmBHsVSt6C5k0eeXqVw3mSqTdCz6j4zCEBIm1yWWODKym9aqUfwwMOB8eHBBSkaBIs1Oe0ib+x6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533058; c=relaxed/simple;
	bh=1VUcOzChGoZs59Eb985aPOcVmtdrVUb87O94jKmVrkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFUv59U9RyKS/lsLvig3g7B75mL5NamRAXVdmb7mWgMvkhsVAUc+yvJNtdO1EZsdZN89Hkv8VTtGL+w6HZ6XFaQQqhDoG6mqnXAXyxM92APbAkQzXZNT+IYO7uezVLyowX0YdYIcEDX3wM1DJ5E0sOuLvyTsjOhyH6/V1t17uIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=M/gByBUC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="M/gByBUC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ad135063so4487765e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 00:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533054; x=1778137854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0UofC6McxXUSJGUwTpN0UC8iJG6TGK2vbhj55AcA2g=;
        b=M/gByBUC1v+YXk4rbv1YtUVGijZhpOqfc5aHzs0AqjLHWolUtEfKZ42r0a5gElIR+d
         OQd7Cm1yBKcUH0u0mH+iV3Lf/m7MJveF+YBIGIQ53DRttaHsRe5f9y4uKETpGwF5+M6u
         HqmAE2kKsjG3h4m3pVIj8V6ZOJrQHSZG6JrrSG8KnZCINXkbkprtStrkiY6jy/Egqj41
         Biyp+azZFlLtY50f4RZ3kTRIciSmhe81j2VAD+nTETY7wj6IUkc7fKlV1fRRhVp3dQHl
         zElPd2M0jJk1zLQnp9ocGsovBBaftjbyH0BG/DZECG2jwfoTFTcs/49m+b4mFF6+1ewV
         FUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533054; x=1778137854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D0UofC6McxXUSJGUwTpN0UC8iJG6TGK2vbhj55AcA2g=;
        b=D93vSO1LiWrypnfVII7LM1g4xK9yIbCf6jHOMqJEvz/ev5v0GyeWa7dEJUXsmxloVu
         qWjB9FesdMrmSRb/b7uCM3NeB7nAUEY9DGTaH8bECdbYxFOffY/fD1hGnvikjt5epor7
         QqFhN4nb32tnpdbKlvh30uW+nte9gi0I7l5OKrhmB8mLqxpNCHb8Nu7/3T5yswRLveda
         xIuQcapQJtJFTatWky9BjENM0/toqN6cSQx/JxYJqtmzyPSD4WB1uBZLROJQsJsIpP9J
         5aX+US3Ljkjphq8z9gJqr1wKCT4Fen4WKQCFozsutrK7d8K6P+0wWsYKgHM9WQxIEd7M
         8gLw==
X-Forwarded-Encrypted: i=1; AFNElJ98jMyDgGL85N54HeNuO+LwmY4kQ4bNevB+CwdiYNq8cs0uM0FwCgzVIgPIL2IBdYGduKQ1YVyfEZ1L@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwo+vrNt92ZMiunphpuTIXIHSWbbI+wPf074OO7AVVSYj3FSD
	xTkRC62Gk7WWyoZhi1X9/YLsuAbbB1mFeMg0ujtrHNN00691oW0OE86X2lgH1jhaNBo=
X-Gm-Gg: AeBDievOawkVWa3Z5/Jv55qnrMdb3XgAgaMXnUjHbmil6N20Tas26UzLfmx8YNPmy4u
	VzGAxX88blkc7j5AuG/GjYNJ/dDfx9hQvA1HRDgT5gWRGsB9TNRh5X4fSBrGmPGVZ8ryULGCEhF
	vsa/2Flzt01mtBD327SoLDWenIMkh4wgTURrTiieQoDn9ABaQPWic0vJGF2jyIxkjJ9Nh3rWoXo
	VeHLx1GWg6UUv+vIrYbSoIQNoypf9pKRjkhHto2bsRpsht/FWzK2J4hLIO1eBHaqiespvL/cevx
	NwRWkDt0RiFQRgEHnRJD/lDFskhYFpGlV/S4/n1PWGVMSFWHY9DMeBC1tRkoAV3oJldLz0hu8Aq
	lo7pSKvox+5MXQ8qNLShhfEvZ5uaAAOxzNtlGkqZRoGrYsgfY4AJbOmH+VTyqiI/wcC4PRXFXPJ
	dr9vh3XODX8y1uEE6YOGpNkNLSc/XzTsrQgvUhbKSZ1Fl74gBFRv4e+wRtqIeL4yT6ko5ppj12a
	HxtbPneBR/rWQA+NWk=
X-Received: by 2002:a05:600c:628b:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48a84452792mr31287615e9.16.1777533053630;
        Thu, 30 Apr 2026 00:10:53 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:43 +0200
Subject: [PATCH v2 3/5] pinctrl: qcom: Add SM6350 LPASS LPI TLMM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-3-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=7602;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1VUcOzChGoZs59Eb985aPOcVmtdrVUb87O94jKmVrkU=;
 b=NOR70N9HENNOMf67HjUFcXrc6eHseNG2okNLHnUXiUGcZeS299hLbEmuV6zb/5YF1QPbZ6ska
 OdV+jHcLMYtBMHS6eD7k7MHyxkT8A57HprPvsdIWN+3gy+w1pO0wdAb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the pin controller block on SM6350 Low Power Island.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/Kconfig                    |   9 ++
 drivers/pinctrl/qcom/Makefile                   |   1 +
 drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c | 149 ++++++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 80af372a1147..ea7e10149e47 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -118,6 +118,15 @@ config PINCTRL_SM6115_LPASS_LPI
 	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
 	  (Low Power Island) found on the Qualcomm Technologies Inc SM6115 platform.
 
+config PINCTRL_SM6350_LPASS_LPI
+	tristate "Qualcomm Technologies Inc SM6350 LPASS LPI pin controller driver"
+	depends on ARM64 || COMPILE_TEST
+	depends on PINCTRL_LPASS_LPI
+	help
+	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	  Qualcomm Technologies Inc LPASS (Low Power Audio SubSystem) LPI
+	  (Low Power Island) found on the Qualcomm Technologies Inc SM6350 platform.
+
 config PINCTRL_SM8250_LPASS_LPI
 	tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 84bda3ada874..94e23a66ca3e 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_PINCTRL_SM6115) += pinctrl-sm6115.o
 obj-$(CONFIG_PINCTRL_SM6115_LPASS_LPI) += pinctrl-sm6115-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SM6125) += pinctrl-sm6125.o
 obj-$(CONFIG_PINCTRL_SM6350) += pinctrl-sm6350.o
+obj-$(CONFIG_PINCTRL_SM6350_LPASS_LPI) += pinctrl-sm6350-lpass-lpi.o
 obj-$(CONFIG_PINCTRL_SM6375) += pinctrl-sm6375.o
 obj-$(CONFIG_PINCTRL_SM7150) += pinctrl-sm7150.o
 obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
new file mode 100644
index 000000000000..4d06abcfedfd
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+enum lpass_lpi_functions {
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_qua_mi2s_data,
+	LPI_MUX_qua_mi2s_sclk,
+	LPI_MUX_qua_mi2s_ws,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const struct pinctrl_pin_desc sm6350_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+	PINCTRL_PIN(14, "gpio14"),
+};
+
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio14" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const i2s2_clk_groups[] = { "gpio10" };
+static const char * const i2s2_ws_groups[] = { "gpio11" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
+static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
+static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4", "gpio5" };
+static const char * const i2s1_clk_groups[] = { "gpio6" };
+static const char * const i2s1_ws_groups[] = { "gpio7" };
+static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_data_groups[] = { "gpio11" };
+static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+
+static const struct lpi_pingroup sm6350_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, _, qua_mi2s_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
+	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
+	LPI_PINGROUP_SLEW_SPARE_1(14, 0, swr_tx_data, _, _, _),
+};
+
+static const struct lpi_function sm6350_functions[] = {
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(qua_mi2s_data),
+	LPI_FUNCTION(qua_mi2s_sclk),
+	LPI_FUNCTION(qua_mi2s_ws),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(wsa_swr_data),
+};
+
+static const struct lpi_pinctrl_variant_data sm6350_lpi_data = {
+	.pins = sm6350_lpi_pins,
+	.npins = ARRAY_SIZE(sm6350_lpi_pins),
+	.groups = sm6350_groups,
+	.ngroups = ARRAY_SIZE(sm6350_groups),
+	.functions = sm6350_functions,
+	.nfunctions = ARRAY_SIZE(sm6350_functions),
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+	       .compatible = "qcom,sm6350-lpass-lpi-pinctrl",
+	       .data = &sm6350_lpi_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		   .name = "qcom-sm6350-lpass-lpi-pinctrl",
+		   .of_match_table = lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("Qualcomm SM6350 LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

