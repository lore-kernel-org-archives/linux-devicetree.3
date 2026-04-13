Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1504D3A3E81
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067363; cv=none; b=aL7gNHG43EMmhycqjw2d4dkEi+mUZFvy7ww3kQA5/g9QKqLNZBeTgTdemf5LLWXl8dBFWzbQsIpDmCBYMg2F5pqliAUnOY2mJ5vUNhI/d7MezMc86ic8WWBMYRUSRBJVHdOS7ZaYOC4Kpmfng+UzXOIQZ+8Ss+ULSHtzZnyIHb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067363; c=relaxed/simple;
	bh=BQj/LtLtvJAa8qPvNururbfdiFEeQmxim48bMkau+Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPkL+8rF5QiKWX2BOI1Hp8u8gra7EYvQhyZVcL9gu2Hame8tvsnCLWJuQBQBCv20kXcllWP5AfK512blJQ6enACTtdUG3NBYHUKHcJVZ9nkRQm/kNT0s4Hu1CFd5BzB3/LVxv2Szi1o5QsjnB2AcVpQ/p5ghOi2eDp7EJ6cJwzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDxwhHPC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDxwhHPC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso4157275f8f.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067359; x=1776672159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=sDxwhHPC/kAaUPifrhWH+QNatj5I7JEzbeao/+4Tv37OLdp8MJgt6FPk8KfEY3XELl
         +dLTH+ec4tpG/x94DRRBIGmUAuGT6WcPB7Vh5PI3oUONYSEF6if+lB9sNWm3ehbUZdpI
         FJm3pwee9nL5lpUkClaXjWHVONFotu/xayjJ00POFgqAX3lI5zWvgL4JXSeUP0pAholT
         VCWEso+dQB9nTMsfFkdKJoi55NBL8HyR8i8Cl+0VxrV7Fh8ndvYyGb0gT8TBMdBYFDdC
         5KHxGxrJ647epSeainwOK8FAvW80cpPZR/vsIjCfX7xP41/KiJVcK+fZpbhT9zShgncL
         QtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067359; x=1776672159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ej5PuXGxv2ijMAzQ8gpPPur0ekJN7jy1Kje2MEZFQ7M=;
        b=XK9D9TTg+GfBPhWmBn5GBTkHN9s2hAt4enpp8b+kiD3ssOWJPFkJuSYZem9u9AGM0g
         tzKTXor+nYfmf92XUz84cQntQhnmwlwYQq4nOEG2cELu+hazx2DQsEOAXOFe4maCdyvl
         KvwjVcFIczE6E1FXnME+Yfv/yg4qAsX3QODTZ88QRT5av5dSwCC88AMy+coLM81UOnNJ
         IgNg8iymXMcOkKhPKElXdD0LOMd38CAxUUvcjAsg2r0AT/a3UC+YBTctiiaoJTk0MY2i
         82TyMPbXeu+Y9erW3+0SAcTenlgt3rwBbB7My2xnWi+4dHeOMZqnHIuPUjOXQFuyX+gJ
         s0QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EsjdU1m+NBlR+fh+wnLxTMxRcp7Veoz9GTQF2JF801DjTyGNm6bsUP8rYX2KuAuEu54RKb29hnNFY@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGoXO+a2TVkOe37D4ZfgbT7KO/QfZA4wuDd3Q/esn4DMDnbs7
	BZC79d+n2VLgMXdNM/5FNj2TZDM0yIrk+Hg1i6v0stPHj/xY9iBQ8rKd
X-Gm-Gg: AeBDietIrCTyPsntbrZSnyFlUNdVahHTxEcEjQX8v4VlH+jRdSX9zeZ//Alz2y2RGy5
	hrOoP4rR6gJIweHO/K9KerjRKgfvIyJPj934qFY/huym0HmdpbZ8Dik225SUdAohx5NA/TR76eE
	z+gz8q1Sd+tv+R+3QT9XxJ6LZQfkdSqT0cWSWfCjuYKGbyNNrcl0rvDaS7f9d/JmYEkVDLXErHl
	mBmQmr6TDjAknK4/y9f57ylepzRPG8X+6RjxGo8dS/r1l+JFZo0Cy2XgoZkHN0EJD9p5mnRt1Ez
	mUPoydH9Us+hgZlkgSmYH9StU92cv/h9DeTHTHRQu2yJACnG9WVbX4MqtpusPD/g9BprExwYEqr
	4efT+dwXllupNL0GDb297d6Qd7WYzhzxQ5v26ANROK4wUtaoo+k8s0leHLzpcX4cAfTQKyBMMMP
	a5F0IG5XE9e1bKW8xEYyyl1Hyjj7SUuFxFOrdkqEnhNElbfB23WWspoU1k2ok16pflPZlGP5zrh
	zA=
X-Received: by 2002:a5d:584b:0:b0:43d:7783:c677 with SMTP id ffacd0b85a97d-43d7783c827mr5141524f8f.42.1776067357834;
        Mon, 13 Apr 2026 01:02:37 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:11 +0200
Subject: [PATCH v8 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-orangepi-sd-card-uhs-v8-2-c21c40ec16d0@gmail.com>
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

