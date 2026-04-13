Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35560392C46
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065142; cv=none; b=aHNEag9AvcsYDFtChrkq0FrZQ/Qkc/HTa+61eA7fTA3jQpUbCEBw8tGwC7q6UfPYuMLmlIO+T02PKeLkHaL5Xh7VWTj8giNxTiNKM0fDhDXyxescjGJLwsp1OgPRQYp0+Z86iSBweCFaqlDApCouNIZHJynFlAVubcmbruRGj8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065142; c=relaxed/simple;
	bh=BQj/LtLtvJAa8qPvNururbfdiFEeQmxim48bMkau+Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d7QHj2VMQJNOLfo+wcbZ7TmdvxDoNq+tvagd0jdM161dsQTz0IIQlcgvP8YVXkZuN319s++4g2VN5t9FNL/6wE6fyOnmDdD0Lq4oFiVKupDSbUXtWzS0sgc8wLRh/p9fLEd+aZEUpWTDbKD1E2LmUHgDLJyNs7lbkv08hHymv28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dxy/9DDI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dxy/9DDI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so65203565e9.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065140; x=1776669940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=Dxy/9DDIGXJAJR6v/29a5mDLaRTrjrD9EcBfoFTbxau8z+v9R1dY9rNcTY48PzcnCQ
         TbhKU+pe3JukbEwIBkibrXBxc0ZHkrA2XTgHLeh/RIrw8Po37Othw7sIgHZL7h+1t3Cl
         5ZpOER+qdsLYP5CgHCk4I2pBQEfDLl+JqvBuFXP7ykUkaogupyS8PKyFT/3p/QUnH2ki
         9/l6WF9URXfu6q19rw/0QKU2Pw8rK4GQbxDUPNxTZR0SFcdv8wVVSENIFCDYNiXNZ64f
         mIHq/pNAF6x9frYgxqesMYJgfLTBN7aQ89f2nP8UOk3CXwXWJact+blfCGPvZCEsgg6P
         wUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065140; x=1776669940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=qkWMaTt5N74PlehrU0dLDbY3DqM4QOAXgcFYkyf2CXhDuDUQv+AgeCLLEWYSGCEHlx
         SuI+3LTCBHtGuI++xrMUNg2GPxjyfdex46tKZkjSd4s5a1UMi2EFY2FlrZV40MHkug36
         YNrFhmCCSNFmtH+elR/mfNvMv/4x95u2AIGYwGnRJFwM7jVPAURsJVEYAoI9Dx6CmgHU
         C8r7g4H/ofDi7oxXsalHUeOxsuqStxIS18jqrZOLn//kYCYJnGsSDvMbDPV1sUqidLiF
         JaRq+MZ5Plb714+TIE3DMvo9jqN9sLd/FU7VY5e/L43yuSCyf5KHda1oZ+4FQmu3r5hX
         HHbA==
X-Forwarded-Encrypted: i=1; AFNElJ8z3D9QyVzug7jsQghk/rR4MdrQ2945lKGLaLbDMwG9McuiYkbf4M4icnIu482iIzgEumpDt0elgIts@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDT/E7VfvNaXhxr37N7TnubzVacBF13HDesY551TEsVw2e71/
	A7KrsBwmavhv81R4lDpqdMWLARICYE7/c4DE8ghEJEQrJbdr5l+2MuBR
X-Gm-Gg: AeBDieshq83+mqN0bKE3kuQhi/7Q/0hXySN+0quPM13+D9iNhCKVeHf6QyANFH/h75j
	52yzF/SPBnFLlXj5xk5Nj0NdcGLE/ohrbnuvWHzEg3uAW3F3iAEF4+7lqCSiFXTVeR2mPH7JvhK
	WExT0gEup4pkmAJirK6kIPx29GhQrujMMFJheTbYohHmyv+kJ0A+ZHFN8D0wANp0VYpuVFbprzj
	zYfGv6IR3VRaG2LXIjDb58PVRHxZdZmsvdlw1ltD12jNbD43KvQPzhorNefxbqBSmchvla82tg0
	eDptSmPxe6fO/2AwpNZs7pJ1AgijshBaNv7/ljjlAHcN+vtBf79KIL+KJlAjzM51prbyJe0wuVG
	jJf4b6EV9ES90VpxTcTBMFeojOY+eIZDuz/7yMt9aAvcbc7Zet0dTSi8EoNDMJQ8jO7QeAAeXR1
	cmKtTMlgTwa+p7wrX2owYrhzP+d4OInTWC2DwwuhoFawxrpgV/NZtR7TcV8Tdw3tw5
X-Received: by 2002:a05:600c:8b30:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-488d6657928mr167657735e9.0.1776065139301;
        Mon, 13 Apr 2026 00:25:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd10b1dbsm220827305e9.2.2026.04.13.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:25:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 2/9] mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation
Date: Mon, 13 Apr 2026 09:24:44 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-2-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

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
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 455656f9842d..0dd06fc19b85 100644
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

