Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093573ACEEB
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859909; cv=none; b=r2IJU08NkueIO/efphFWW6GrWlXUUeOTsWeNC0y06ivWzr+GQfzUiOCI9BwL75YrrGB5WaRgWIgdzXNR6Z56t4KK2t6vZXyTrYCN4J0qxtXWnn97jBJsOtuyWHQQgaCG/L3MPbJsC+7NLNLlicgTBWiGgqJDIf046IJFDF7rUXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859909; c=relaxed/simple;
	bh=qUA8SRWMHXak4DMGjiU5xSTobYDglxv6lNBrFgz1elQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUMm6JpBgTVYKmGkbIUXcm6JyStlENbuYPxFjL0PUw+E5o4/jHO7R3ndJl39z5ImyGmn62r/A80cy+DRNGynUEvWSIIdVLr4rRg1saOAA21l1K5/lTEuuYQnRO0P7V29fHl0Dfu/FQ5Ho6GNkv34FNfIaHLqG9vb1PmKpU16hFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNQ95Wne; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNQ95Wne"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so55854935e9.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859906; x=1775464706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=HNQ95WnedpGSm0dsrYuIiHdmuQCNr8KQAZGjunr+GGeChI2Ptk5qCY59hZxDtJ6Qvu
         6UqVmzXbTSQY7XRi0HABmYmWE79SL9/FzHk/zAk0xBiY1BnD5/6wI11TjqBtmY6xRBRB
         o8dtdPsdGaJ59A70DlVdTcUxEcliR/pmIQeSNaXK7Z7d/oWT5rwBoIvsnB61hpSx3HgJ
         4vFfXNpGH5m/lH4f/ceT7tc12AdBlPlUC+I+nLLnyizh+ljNg6jpbvmobMcmFUw9mWuO
         D79dSgusqDBhaccKQagzRZBy0qoUdBlipFfd6712+ztQFGDmyPfHCJTqCu+9JMeNHpsL
         Z1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859906; x=1775464706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AvVWaFSwZuIIuqOAIjURBh3MX19UZqagVH7905iJLbY=;
        b=Xq+WOTSP1vAx47cf06vgdPKqjmRdGV57cYP5ixWxZaaJ/mchq0oYhGuxwgLw0bgP++
         VSjWSZIMS3gWb6QJbKYO/OLAW5cQcj33qScX9qq9bFomv0/lfHZcO+NSNmh5jri6bCmu
         UuvaNwJVpYt14z5SyO2w4KLFl9a6XGNOkSYCJOnbGHzLtHrZmgGj/A9VYEP456CdWdug
         RJVYg7NdTNieHpi7WZlumUFN5IB0460IQsK42o3FeYqn973lcKbw29PUeAV0s9HOTaWp
         uAszukcUKRELgEjCtOTvzDepI7NQ57sgf7y7SN0oSCvXYiwxKq3KHQs0C9n+hWI0Y82Z
         NdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDwoEle8fphgmjx42myzPkoVG2DX4gUZFDqrPT0wUzhvmoX8TD65s2KGWXJp7+tSFbxKNhLHuJLLie@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLWfxk62+IRW1kvc1hc8xwz/0/5z3y6Ah/JVl/iYDfL5dU5E/
	TNN0xiJY7XLIs9YkfXdWbbbgtksTEg5HiqTJ9S+p84wWYljM/2ITGWPv
X-Gm-Gg: ATEYQzxWLtwuYH86TsDxIJTF3owAEc4pjA+ScusSBV3jOzaE5OzK3WM0fsNeLZUK1sg
	Zpkny/SQuIfFvdhzK9wLFyP5vXcINCE7+rrYE4Wef0Ss1lOg2Cwj5q//UjzUrwEYfAQI4iFtHAF
	HdlRarn2tKZcmHy71WaV2vpMgj6tskSjWs0PjDyPgkQxpjQGuF3yqJSAKmjBXLsHwkBQb8CE4r2
	EUbQ2wD9NTsLiNP61N0EStNAuUxxZMmAykT/yPXwieaWAK2goSz0CB9k1rL+eqRi70ljtKi5zOV
	wEdndWmJg+smQUKv7Zl6euXtRA12R6/hMWU63sg/4lIRhWQ99PnoDdjpwB6wizFMS3OjuqYyOdb
	sQU43BJwPmrKEZcFe43utSYeJn/vNj4OCP/8KDXQLkSuBYXD7jNAVxpKYebPy8i5JvoJw1newtS
	6MXhnRrYj7pAwWvfpAWkueQmTyWJ4U9zxS0Q3JlHCZtcSRd/UdiBNNcu5LdhnM21oUjURts4p+t
	NU=
X-Received: by 2002:a05:600c:1d0e:b0:485:a4de:f4f9 with SMTP id 5b1f17b1804b1-48727ee54bcmr204093705e9.27.1774859906374;
        Mon, 30 Mar 2026 01:38:26 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:25 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:03 +0200
Subject: [PATCH v5 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-orangepi-sd-card-uhs-v5-2-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
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

Ensure SD card pins receive clock signals by enabling pad clock
generation and overriding automatic clock gating. Required for all SD
operation modes.

The SDHC_GEN_PAD_CLK_ON setting in LEGACY_CTRL_REG is safe for both SD
and eMMC operation as both protocols use the same physical MMC interface
pins and require proper clock signal generation at the hardware level
for signal integrity and timing.

Additional SD-specific clock overrides (SDHC_OVRRD_CLK_OEN and
SDHC_FORCE_CLK_ON) are conditionally applied only for SD-only
controllers to handle removable card scenarios.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842df90c7a94a290aeec22157b378fc1..0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -21,6 +21,13 @@
 #include "sdhci.h"
 #include "sdhci-pltfm.h"
 
+#define SPACEMIT_SDHC_OP_EXT_REG	0x108
+#define  SDHC_OVRRD_CLK_OEN		BIT(11)
+#define  SDHC_FORCE_CLK_ON		BIT(12)
+
+#define SPACEMIT_SDHC_LEGACY_CTRL_REG	0x10C
+#define  SDHC_GEN_PAD_CLK_ON		BIT(6)
+
 #define SPACEMIT_SDHC_MMC_CTRL_REG	0x114
 #define  SDHC_MISC_INT_EN		BIT(1)
 #define  SDHC_MISC_INT			BIT(2)
@@ -101,6 +108,12 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 
 	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
 		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+
+	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
+		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
+				       SPACEMIT_SDHC_OP_EXT_REG);
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.53.0

