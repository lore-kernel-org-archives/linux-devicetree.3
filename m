Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F838BF87
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261176; cv=none; b=pF3AkZD4BxEoRQM7fuuZMplmMiARGlgfeUDwYR/7GpqrP1MB/qfLqwrIzjdMvj8XVJ0TGqnw+DkyB4npr/nUJM8C/5sFfxyTyBerFXiKkH/0M4H3bYyuUSAG+pYdyP9hr06IdV5vVfnyBp4mtD4sQWur+8qSPTdUf2fuUxfp1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261176; c=relaxed/simple;
	bh=r8frD7Ih7/6TDrK7WkKP2nnBDnfc3SHl7IYdzA+pE1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJMgzVRlJRg34EC3b2aiMnLdYJlBoi4k27vBiP/lYwQwApR7JsAg6bC25pdP+F4e6FW6hDBoiiPFTV5KI7pQd7yAOdZqVphTZpc90YyXib6eHyDypnRZDy7fmy/QidaLrr7jTsGuwlKpkgjl2m7oi8vkFTUuI919FbPHvub1pzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbTbN+F/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbTbN+F/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso20594375e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261172; x=1774865972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BsT6JJye2hc6dEStRqlQwTUPLoIQwEfV/djOfhm19A=;
        b=RbTbN+F/ZIAI+HLqbx34mhkFVn8s7twmy49z5Qe6g9XC/brPkdqIGFL2GThnb3QOYp
         wsBWIZDz4LDae2kFALj78b5oC/tCXVxnKlaXr1/hNPCR8GAlNr81h2YYOw3lDvUQ7ROD
         eLHyP7C3pexM6SK24tLpnL/+/zdbpiXZr/honUBD4osKtJTtNcrXt2MqDm9krY2TL3Fc
         AU4eR5lLq1gyoUmbIAkeAXze19cSkhfXuUj1QIWZIb2/lqJewEWeKxJLoTPRw3i47I7L
         dW7V8Zv/I+tVX+DcQlgHCQgEtEmeR2wIhYHcHkbHeHfxg4b+DJMcHKSLI6B+kLQfEYHb
         oU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261172; x=1774865972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2BsT6JJye2hc6dEStRqlQwTUPLoIQwEfV/djOfhm19A=;
        b=M8YZ+TfXnhJka8tieiquWSh+87F2TnOkkkX2nURYXSoEUyKFUrIAbkEw5GfTggCmKJ
         Hd8XiFqkekUutScoJt+ujGv8oFIOANF7WnkYClWR/o8VKmrB2xrL0jO6dljTtwjz0ig4
         J13cgSKzKAUKelSUyWieP2dBf4Ikqbj9q8tMVJQ0K62HCRq60OH1rXT3F769VNiM3ioh
         MPBoICK0JpQcfeN/o+PVck/BYoInUVsSWycThPko4wRcn2yI1j+tsFauhZ46f4NvUP5Q
         msz2Cn0sEnDZJ7Fis0069ng6sSB8IGcqHdFS4qrzpscq6f9Ze/W1jfD3cJnTCEdx6Vz/
         1VBA==
X-Forwarded-Encrypted: i=1; AJvYcCXYZtJS8s7UWb+y3y1ukyIw5gng0RXthvKdHtp7LeOYWNsmbECe3kccPIteebFbtG5d10L5K0jK/ktW@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMaZiBjfU/ASgKSzPRAUZGseooO2542yzdYEOMi1W5L6gk9G+
	GhiMp3HkUtH8qMeCuzFXE5xIjIRmbMywq7nZFNYqdldiD5xBuB4CttUxvTsW7A==
X-Gm-Gg: ATEYQzynrojO/8SkBaWYf1uoEXSB8rdADj8r7FwOlzf9hSrHdmqUS1LRd0i+CoVSwEf
	3r/Uv6buN6oFlAuq8o/aLM3nWUH73J0DbXU3xazJk8EBwQBzenVJdz8yDKyFszL3eNdpKDDrsTb
	ilzQHg2RIli24h4oNJuznPpVJodk2Fz8nGaPFMlGmnaPAGJOcT/eajoodr6wknJw+b4o2SkALBL
	Jb6SQiEVVMkgZRksVi1TWrvX8Mr4a5ZfI2jiufaI3qYyXwyunVeY5XgL7X606gyWgg0G2w67XHU
	VDHWEiP7LRwXnpdK1JunvqcDTYhrB6pn5ATKVuie9SpkfQjt44A0ApD04AY0TEj6YUGw1DITerH
	EBzpVy/Wmc8IWp56p1vZs9LzkRei3Iu0OMpCeLmBzMWeUojMk3Wic8XLGRpUqeHAGMWvCso8srK
	tRJrsJkdufHzkbkzYjjySAmYdNB/n18lgYDcW9DddDiJbWuG9BLHasVntx2VWM2Mxj
X-Received: by 2002:a05:600c:45c5:b0:485:3b34:2f51 with SMTP id 5b1f17b1804b1-486febbc66bmr166065695e9.4.1774261172487;
        Mon, 23 Mar 2026 03:19:32 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:05 +0100
Subject: [PATCH v4 2/8] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
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
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..234e258af25996e7bbcd0b70366c7480bf62bee7 100644
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
+	sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "state_uhs");
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

