Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8033A545B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550367; cv=none; b=dHmDEozqgSlpj9021uiWibSsccrWaD79nghYjOTuphBFOParXkXBr3ltiaFTQIjFObsl+ehDwhmGRe+cd3ZurScFLnGewyN6EmNKi2zX2uCYKFUJHdaQacXa88kH2+Uto3z8Viud1Pqyat47qIkRYeeH/irfWVLqgqaJTtDa0Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550367; c=relaxed/simple;
	bh=pYJvYi3wGayZHU9DE3xysB2ygNEcNECfzw4JJTA9oS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvIeMHX2jAQ63EB9hpni+eg6YJSTpJvVKQh2emnnxtyvh0+zozL8/RgHF0Z/CGfKHn2N/bjLdnVcxgK9Nd63daAfPZkCOU7ikUgmju41F5vcs90pUCOfCChRb+QR6qJDUzpHIPFVLmABEOBNc47N4n/XuoymtMTfe/N2j4srAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UosiLVRO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UosiLVRO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so4308124f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550364; x=1776155164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peA/baapFwTx+WaActDGaVNbab5ZZYgiEvN0ikh1DXM=;
        b=UosiLVRO0f/NtnSvQ3BS0HsaRY0kpZZtGQdEGUEzT1MqivhX++fFHNBDAm2JNhnRkV
         KF+xqA+rXUSuFQPpHxiPLxNY/MveA/idy46IDYReNUbdkFxzjaBtOzphVOhePToeofJJ
         ecKUxV76J/j+uwywMRMs3BUGfkLj5Iprb+cPFrhZBsGTGQC3GB3hCKMKTdU4F0wNRCnx
         N5eTumlAccWimGNYnIJRruehJQirfLSTnL/005zHyyekm1ilN0PcQ29gg0+sw1KP2/n9
         rBS8eBbdaWNoACF+MTJiPcBlIjC4gnzc4NRrhYB/gn9JKkk5KD6xBfMGCsVRayk1fhbZ
         ODjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550364; x=1776155164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=peA/baapFwTx+WaActDGaVNbab5ZZYgiEvN0ikh1DXM=;
        b=OkCm87VWX1aorRc/CjeAZHAUvoENQY36v7lt0tCjkYw/nS80/AmU9IDJg9luc5a+Kh
         hRS5RiY3A38rFKHZJ4coepiU+xhCCj3IpmmRFncskaKrvE9S+a7R72ZTozZRJe+7prEV
         pQ0CXSUuMgk0jK1hA1AUB6bZs1nyhSdH0Wv0cEEK57oj1gT44usGRtCWQK2+9eNuDM0Y
         Ecdzwrd9iA6t4c3rXAGYwrXlajhXrwfcP2UHWyhMLWdcJZ8dePlYuiUzoawJ1jV7SCvD
         ONb2k0U3h21tvSfzlb4ESSiEbQdOOZWXFc5Ji2CbSNauI99KTticyqHjg7CFG8xBAwwk
         MOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0ww7Gj/xMfFB1qjQGOmWsiJcBPn0pYRZ9/sCKAPDVvwSbFNewDlwgngRkI7BfNG3A84ahz797Svz8@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfm15u36WpcfIbNTIurvqVXHe/9VM3eiT7mVjlarn27X06Z+i
	t/2XuQ5dXN2iPZfW+Uv3XW3AKUOynVoxwCnx8wQ+yaIhHUzmoH1Ghw7f
X-Gm-Gg: AeBDievk69L6DBIA/LX3uxcnouDXk7wzGl5cU443+dGbv9qc1kawpWo/JLtlYM5qRyp
	blATtkmYGWgJVOX3WrBeQSS+hKwHKij3TANAbb2e6zdRA0TA2JsU1pXRmnxnO/cWeUHd/TIn6I0
	2gtkwxtTBVTZ1Pwfd3X91DiOpIn/1dxveyASNWCMt595QQwHGiP5+ElG8xInUm5dzgYx3wmj3iT
	LqfL9/6bc+dLfYj55BciSkCfz5Y/i02cjxX5vDz1WdhdYTXcKkaHa7YugCSizg6s6Bja6/q2Jwy
	ta3RxMBxipVOGo40MhS8qvILdziOE4Hvc1QUZmS1Mx5tE+OCaeg6i5UiTGqIUzbmu8/BdV2Rk4q
	AzoLFGYp9OBYm/IdXtHFNtxqxNltRee8wPR+AqIMgavDjmvhBjKL6+yo9QwVOJC83qSMLTcRpV9
	xKjQfchDP7YtahLgqioaPsdaGRMNGTLieoY95l6iBnN6sFWOfGDBklneI9bBu5OVm2
X-Received: by 2002:a05:6000:1446:b0:439:dfae:8083 with SMTP id ffacd0b85a97d-43d292dbc56mr23436623f8f.38.1775550363826;
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:03 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:22 +0200
Subject: [PATCH v6 2/9] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-orangepi-sd-card-uhs-v6-2-b5b8a1b2bfc8@gmail.com>
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

