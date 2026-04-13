Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C63A4F5A
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067366; cv=none; b=Bi6vxXmwVyZponMX+ZIgcAB6HdiyvTQ1ymNMz1xcMuwXOF8knoVOFJcypmzIhtA0DrUCWUR5Ga3Sn3VPq2nMFLR/pDOTobIzDi2Hr2XkoCO2TCsgIGmzj09ujgcJkaCKdA0MOS7yeReQnt4xGToPpBItIiANO+Vk1RsCIZ1Mlhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067366; c=relaxed/simple;
	bh=lQe/1C1yUclvn5uXddSpw2OgIhgzl5fVc6scliCgVzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WK6RVqECI78jv04q2uxUNT8s2xAjvSYGOQ9XlFl/3dgdCPuKw0GPqCkjWpnLG6ZIclRl8t1KBQE4CqbexRhnNUkBRWNc4LtrQrAW7msCjThMriCFIQxjrdvaFClniezpKHW62VEzpfN4ffP38zgOqjmz7dE8rpjVsaxDnUrniZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDuCQMsQ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDuCQMsQ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66f727d6849so6050585a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067362; x=1776672162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=gDuCQMsQmnJj8CzWbO7g55RRtzve5AdPf+OW5t0qy8lKtIH9RxdX7H6GTkvB2XeeKH
         RzS6s1mYS88TYFhbJ3LUy1JQ1mwZkDTewFQkojbm66YPFu/E8VZgbcTckbFnI/5dAZ92
         OrV7Jy8ucTZ1KdmZ5oOF0atftuwNzk8mgla8ESaCbZMmoPZJiC8dUM+twFrUEpJTzyBO
         QJN+wLP+38LhzYDqjYuakd8Q7MlMCK1UPz8qA36f7o4ZYeS6/4zM+dpMiWWCDTNtHuhk
         aK2yM75BIlmaYkdLnEL58UfpTmYj2+k/sHvFI157COAfkAKNCgJhvJZ2gJuaxeRF45iQ
         9XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067362; x=1776672162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=CEu8uZ4Upzb+zIkDhGnFuDGKf6UPq/oTEBZlDvQE0e8DUmsJbw6jtPzyh7S7bhWXYu
         BFoqvh6T3iu2ZsF4E68YU4KwCp85cJxsVKSnCLXXIL5c52qDMgMhFYNKkil5xpf3I8wE
         ldkpJV9sbwUWuUO4wzy9eh6nDWp/R58GHBirttwJgdHuc0mgJPq4jjKy8JbTqXHESLbT
         BxFHOwEX8HSS76augl0f9dEMTtlcXfefkECda85usynD0/HvVwq1AProbJ3FB6HrOBvv
         D9eKvRhHEAWjD/2UIGsTtZaUoJ1Q2kgiQl+oQBJrn3/GKO/rj/O5Wx33XXXQlpktNIUH
         KM5w==
X-Forwarded-Encrypted: i=1; AFNElJ9yEU4bDvRBRvhsW8Wxu5RqkgvSEOvOpB13T35HKlIezZjlDOIfU1DXS0CsLNJRn6fQ+EYvX+MWy5F5@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHrrDgl8j0C0NxnOP1uEXjIDEq52RKb1bNzugHT46yhxqPeGH
	LVhMhVGarYem52KlAA4d79zFfMugC4pqrFLRShUOgnqL/YpXgirpkRX2
X-Gm-Gg: AeBDieuEydnTLC9r+sc0QyJ9cPCNgf4WC7bfHADABF5rD5V4DLjAul+aSjmY8pF6FxE
	sQu2CbgnH2Wfwr25+i5OTE4W/pnh3dYi+/Z7RpZd4QSyEgdaJTfLladaxxueMHbuAG4niaPsd4v
	0bLfOSa1fkqNHl6YyImFmA9alCxVoxyV9eHvvj0TeZuky30VnHWZQ3RaHFVaQ1u9hBA9Vt9WUgv
	72Zhq/NaJsyz7HqYyHKkVmxpgARuymJniaYWBmaf5NGgqHz/VirzJq2BfZAENBKuf1Vn2afcK/E
	PU0dIF9/uvYo2FikewI//MiKgnZ3PZF27ipvvXXx4VPEUnAHgcfEC6zgIEUhLZPSdCEBz20wNDD
	6IezUhuubdm7ysvhC6Xjqs7uLA0etBeis/qVMNXmS304lNHTKKo3GRrTonVY+Y2cwl6XSFXp8iE
	kOzTUufGJ/MVdMSUAuvFY7CtcztiB5q9HApNWRa8CmzZyk2whbqu6X4PM1Al9P0cD3
X-Received: by 2002:a17:907:6b8e:b0:b9c:c40d:bd2d with SMTP id a640c23a62f3a-b9d7277c7ddmr642261866b.10.1776067359772;
        Mon, 13 Apr 2026 01:02:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:12 +0200
Subject: [PATCH v8 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-3-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3

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
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b85..d9144537032a 100644
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

