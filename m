Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C57F3BF680
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489674; cv=none; b=WvntyU889pM2OvpxTy+PKaWe1QmMkrTAJVGg6FiIiJhjPhOdkhYYUzBbs1Mlp0rLNZEBmVHLDfy1R/qGGaXhtsealjnQVlZSo082vC0VYtTFY2yTPG6hBoGMHgm7wH0OfSmE0hIFI3x38S0fAz/9SPEh5gO+BEds3lXj1V8XECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489674; c=relaxed/simple;
	bh=FZsgT/q6hf1B/ykkCHeWphCL5sPAC4d/euFpIhy8yzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5QByEHr+ek6SrZ5//u9qtbOGAedQ4SofulePtmNhMgBBXMeC9blwipRx9KnC8yrLZN0kBEP/nmOpzeGvAaNFyxUFc/vOr0hgYZFxrgDfZIYJG9ly8n0sOihf/sbO582xe2SyWPeKqeHMNCp1hjI73ADBOARtCXtccbA4tX87U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFbLwjKJ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFbLwjKJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d734223e4so2490849f8f.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489670; x=1779094470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGycZZ0oxVCkeN0xv1IJG1TkG4N0VwOrQ4cI2sdWgss=;
        b=IFbLwjKJB4PhJw9I/TruffBy/Zo6zVDcjJyM2LigSV/d1Zv5Y1pJugUFAYYXn9ADQT
         VXw4jw7N682Cfssoxtep9ZTaqevG3S4OxNy6oI/UkMO+1CdrhsoXDpptfWZlTdlwHOkk
         702v/jPezez7rnDc07Hi6BLvOI26uRYU1Jw4ZKiays0zFzlMeS1MNMewbp9EWlexUkEw
         TQM4WT5phjpC7ifjT2DP2KQVhClaQhUyR0wTIHlLUTghBOjj2CFKaaeCuPJxB/DvTwlR
         l1+G/495FbB2FX/4YfyXtfFGv456XbO/3OwufuI8HWZNqj3M/4bXET0yYyMhozeokEF2
         6O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489670; x=1779094470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rGycZZ0oxVCkeN0xv1IJG1TkG4N0VwOrQ4cI2sdWgss=;
        b=WM24xqjj3eKT16bK+gl1TltbQrZENk7Ye5ieVnGKPQcfWXCAQZVibTDT6KlKPonMdy
         MoScuqpqtIVGr77yF8MGTzxNtrnH8cBpEs3ZU/fnS2/NO9DHPQoOclGOlp2/7g2q4+Yk
         ywuWgQWWgrRfnWTwdV2clEu6RfDOmysIkFbpBLBnzbqV4+A2mWpfUlyLqIT49dUwTFJX
         BEleSjPFTlRnRjAuJ4rbiewTtVIWXbFug29yyBAF6puzNbTZ6Cie5fzcvTSSw4OS6G0h
         qSsGfhe3mztDR56UDUPMw7ZnNVaP7feE0ORpw2BazgZmh0K6LeMmP+JaRUK3RFoq7rDF
         jdiw==
X-Forwarded-Encrypted: i=1; AFNElJ+KSIjOAriMKg6HkYTSHaf8nNbXJ1W4xLrKQD7uHUxSflzmJAS5qTJ3DYoY0UVRSq1ZqPzjOlNhbILg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2dItLC8ho3XlVz2eO6GGbWNw4wf+7vFmTTif/VDEfh/P3dTN5
	kJCWhkdFKRQ4ATrFsDRBgegr5J0wiKGqVo5hO669jhgLqM/nqMbvm6u7
X-Gm-Gg: Acq92OG5RU2ZKZCsA9sWCUZrQ1nGkyVR5xfyU7bCgWZAhIBjmKLFXkDOYzPLpojHqhe
	fwu5iRiPwFN8yFL5Z+A8UyyX4YfdLFK28JQIqJbDRGajc5/wHekMLhf66UapjslZt9GWDqg1pVd
	5M67ETihd1eDEAlhxGeiZg54Hdf8K5mL7B0cLA2BUKsezKDk+5KebfBGDHDMCObHCku5XDg0S33
	N+BwFzuR5/bnQ12RYqFmLi24PvJV2DaWARxuJWAuwbHrL4J+B2z4niqrLcUvwq5NbuehGh7giJm
	SSaYpQB0uZPlLX/DoSiG/DFodMm1bZxTmTV2xWaFFjiyhmsv0qsh+/pJi4oucnSg9LMJltjMugU
	WmEuAt6K44Nh9Hj6eZUpfVZXJlaB18l7euwado1r5fC4LLm/NtQ11uLsGC8IcRsrseO2exEU6UX
	Jczmtf5ljze8EZCcWr9XyhHyHdu5jTP5SWgJqNXeTKWpuaX1gZlQRFmHg3nZ2+bj4iO1c3TufPp
	nRO
X-Received: by 2002:adf:fa45:0:b0:441:29cd:a18e with SMTP id ffacd0b85a97d-452ea07e223mr20899118f8f.23.1778489670340;
        Mon, 11 May 2026 01:54:30 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:29 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:53:57 +0200
Subject: [PATCH v9 2/8] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-orangepi-sd-card-uhs-v9-2-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
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
2.54.0

