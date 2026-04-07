Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865283A63E0
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550369; cv=none; b=NG8B0KPVIVDmngqfGF+KTbh7g0Arg+mzdoRJbwdjfSiWct25a3Bjml7x5LJ5fcvpAAZQDXPZTr12IU1R8jF1VfjgPYQK9b9X2nRrs1Bj0KPG+ZOxItXeFhpCgvLN+tlKAKWrrU8ufOdLfptIS1UyEbbSKwVNZjpMfWLw/GgAuxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550369; c=relaxed/simple;
	bh=nRShNwlonydI3xmzkTMo8kbMpMRZ4r+QQYByxQWL2C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxizQrnG/kuMT297skl3xukMWEZX0stUAD2cOTumrFxCL10cmz5jRQWJLzi6sY8QOqE0EPQVoJXBjy5dXzdwIFu3Maz52brMkhxRC97y3rq3gUR5JG49uynH2CY3u3cxkJHO/031NRUQa1iD2t3KTxYVJEVDCDJc5nnLLKEQ8vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FisXem+9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FisXem+9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d03db7f87so2554519f8f.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550366; x=1776155166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+Em78pG4MczTisQO9YIrYNt9KPWDr1XLJMXM4SwDxc=;
        b=FisXem+9PrD0XNnljD8G7lgQjqAIMxB9oYK0JnmabQxuGIg0a7qakkRZlWBrGxk+Tr
         rHf5u/2yvCb4QJxxdf6MzY/RvvkE5xSU+da9VlIhzJmHoOFYT1lolkVg9UUGATIYwbEE
         I4kUU1X42+5a2yqAwGCi0UDse3cBUDNH1GIBwsJs+V0IkNXU1SYC8wK9qtjjnQI7HrSc
         06RW12Yfrkkn+kVko8FdoCRkF1gYx5kvp4z0q2Rzt+gIZV8Z84iZoK+PjCWzbKlr4FXW
         9TJEBzFlgFVWjRi5T0aAWWOS5lZzjNv57geITQCrwodqWomMj90/2iGhJrcZIaUQl2Rs
         ierA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550366; x=1776155166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+Em78pG4MczTisQO9YIrYNt9KPWDr1XLJMXM4SwDxc=;
        b=rYik57c5NP/3VYRFRjCmmU5SOajegFVZNG8ybboCcjFnSbNj7CLlk3RVEYvFxxJZ22
         WugrxrK8r5HqnHGzSuZH5zCReI4PRdyM7IAZkyY0yjUTgXWO5vmcIhDWQw+ptdMmc694
         Gru9TBZfoutAO5Wo3Rr+av2pI4xfXs5cgixlB6lb/wb0GZzNGeU7fMN7XwhhDvnDs9ku
         k7IDmMJRn9V5ftJfbDQY+cg3KgBSp/syhZgoOdNwyVNlmQ5qUFiLB2GxHuh/9rCcFTa4
         k+svd/0otLnRpmPdkB2NMZuOzch4OEGgj9+ch589Z6201jKABRvidcjpGf33dwdUMhAR
         usMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhkPeL8MAbTd85iDpLZE6BrE5oqbBsaBOtQrYl6X5Ffu4bFkJkOR6fX/WIdg+XFnOzpurorD6NhK8W@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7LvvqkiGzOvQpzWeattIUtIX7pfBXDUlJtB16jgoEusX5agP
	0vVENWlykeDEf4yDDG71r5ghIjDnRpH45cI5rvq4a8Bj/ltXAuyp0YsR
X-Gm-Gg: AeBDieuXUXbVVv49j9YJLX1THwKyKisLJQW53ty+ShC7nKoRrbnaSzM2dYFwy8NRy68
	qmkYIV0dT204arTm7ubu6DHzwkfx8Jz9V8tD/XjKjYjbkVUsyUSlgcm9XHlD1RQNrWkoFamK2dc
	4kvSNJqVcJXKYI0AVuStn9qrw50AVixnEEDaOCzzqNtjpsd4bWGJyrAeY9hQmJSTi+MueDU4RSg
	EW/Bw9liy9g+EtWc2a6HIJyenYGdeQKOfyKmfwpiT3ByoTX3JIuaJP3pDFFom95IiUn2beBKebu
	U6uN7/vg2CIXWpdoTOyvrcX0QOxtkN5eLyVYIx29KvzddvsEupyMj9M98AST06XaZ6RLdooZXah
	hjZV8EUKzEpsaW+g1sQzcUZTW9cUwTc7jSVt1YP3Vjr7bRD/aLRRbdgZYN6ic6CQht+/yJRzCh8
	MPulhrWoN1Y7qPlfwwIpaWEbHh7WB/KlgjxBVDZiG4zrV7JzKE7ScrWViMSKyIXuD4
X-Received: by 2002:a5d:664e:0:b0:43d:4883:192b with SMTP id ffacd0b85a97d-43d48831945mr2963140f8f.41.1775550365599;
        Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:23 +0200
Subject: [PATCH v6 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-3-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2

Add voltage switching infrastructure for UHS-I modes by integrating both
regulator framework (for supply voltage control) and pinctrl state
switching (for pin drive strength optimization).

- Add regulator supply parsing and voltage switching callback
- Add optional pinctrl state switching between "default" (3.3V) and
  "state_uhs" (1.8V) configurations
- Enable coordinated voltage and pin configuration changes for UHS modes

This provides complete voltage switching support while maintaining
backward compatibility when pinctrl states are not defined.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..d9144537032a51a12d7480885f247f4c66583e59 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include "sdhci.h"
@@ -71,6 +72,9 @@
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_default;
+	struct pinctrl_state *pinctrl_uhs;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -219,6 +223,46 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
+						      struct mmc_ios *ios)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct pinctrl_state *state;
+	int ret;
+
+	ret = sdhci_start_signal_voltage_switch(mmc, ios);
+	if (ret)
+		return ret;
+
+	if (!sdhst->pinctrl)
+		return 0;
+
+	/* Select appropriate pinctrl state based on signal voltage */
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		state = sdhst->pinctrl_default;
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+		state = sdhst->pinctrl_uhs;
+		break;
+	default:
+		dev_warn(mmc_dev(mmc), "unsupported voltage %d\n", ios->signal_voltage);
+		return 0;
+	}
+
+	ret = pinctrl_select_state(sdhst->pinctrl, state);
+	if (ret) {
+		dev_warn(mmc_dev(mmc), "failed to select pinctrl state: %d\n", ret);
+		return 0;
+	}
+	dev_dbg(mmc_dev(mmc), "switched to %s pinctrl state\n",
+		ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
+
+	return 0;
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -252,6 +296,30 @@ static inline int spacemit_sdhci_get_resets(struct device *dev)
 	return 0;
 }
 
+static inline void spacemit_sdhci_get_pins(struct device *dev,
+					   struct sdhci_pltfm_host *pltfm_host)
+{
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+
+	sdhst->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(sdhst->pinctrl)) {
+		sdhst->pinctrl = NULL;
+		dev_dbg(dev, "pinctrl not available, voltage switching will work without it\n");
+		return;
+	}
+
+	sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");
+	if (IS_ERR(sdhst->pinctrl_default))
+		sdhst->pinctrl_default = NULL;
+
+	sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "uhs");
+	if (IS_ERR(sdhst->pinctrl_uhs))
+		sdhst->pinctrl_uhs = NULL;
+
+	dev_dbg(dev, "pinctrl setup: default=%p, uhs=%p\n",
+		sdhst->pinctrl_default, sdhst->pinctrl_uhs);
+}
+
 static const struct sdhci_ops spacemit_sdhci_ops = {
 	.get_max_clock		= spacemit_sdhci_clk_get_max_clock,
 	.reset			= spacemit_sdhci_reset,
@@ -324,6 +392,10 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	spacemit_sdhci_get_pins(dev, pltfm_host);
+
+	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
+
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0

