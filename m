Received: from r3-175.sinamail.sina.com.cn (r3-175.sinamail.sina.com.cn [202.108.3.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438A330676
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 03:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974399; cv=none; b=UjyKFGd+ylSWGopV+e4Jl5DMffamIYH28VEp1zmNYBisfbQFjEunITa/qWHaxgR9ivO2aSVvbhO1X//ydfbSuRY5botGCUtfBEfRX9o7/UXlSnRhwpNvWJfI+1xpYZ6q/hKTay+Z7u1SHq2Lm1WpT5qWzaYUW6CVO5zdkVEOVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974399; c=relaxed/simple;
	bh=CwYXaEZ5mYWjKiannuU7aFdrCvGXV/STtrSkWrNxwBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Vpn1MuxMaPiNzl6SRG2Vov407vGqQA2QUrQB4NbtQ7T4diGYIeEZJMOEp4GlmRmMKTnRnZ79u7ElcMPdSWTHUo9cfiryHb1v/IN7W9c+tYMFTuvbuzLeAYsjyt0Ts0gLbbw9685yzmxThWE2IjBCHz5w0inPOd4gIbiNE/uz/I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A278331000011AE; Tue, 9 Jun 2026 11:06:26 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 6CABE591AA8344539CCC0CAFFDC2085E
X-SMAIL-UIID: 6CABE591AA8344539CCC0CAFFDC2085E-20260609-110626
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 1/7] ASoC: codecs: ES8389: Modify volatile_register
Date: Tue,  9 Jun 2026 11:06:17 +0800
Message-Id: <20260609030623.17404-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609030623.17404-1-zhangyi@everest-semi.com>
References: <20260609030623.17404-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Mark some registers that are not volatile as false

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 449d9574b..9c8164916 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -50,10 +50,29 @@ static const char * const es8389_core_supplies[] = {
 static bool es8389_volatile_register(struct device *dev,
 			unsigned int reg)
 {
-	if ((reg  <= 0xff))
-		return true;
-	else
+	switch (reg) {
+	case ES8389_ADC_HPF1:
+	case ES8389_ADC_HPF2:
+	case ES8389_ADCL_VOL:
+	case ES8389_ADCR_VOL:
+	case ES8389_MIC1_GAIN:
+	case ES8389_MIC2_GAIN:
+	case ES8389_DACL_VOL:
+	case ES8389_DACR_VOL:
+	case ES8389_ALC_ON:
+	case ES8389_ALC_CTL:
+	case ES8389_ALC_TARGET:
+	case ES8389_ALC_GAIN:
+	case ES8389_ADC_MUTE:
+	case ES8389_OSR_VOL:
+	case ES8389_DAC_INV:
+	case ES8389_MIX_VOL:
+	case ES8389_DAC_MIX:
+	case ES8389_ADC_RESET:
 		return false;
+	default:
+		return true;
+	}
 }
 
 static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
-- 
2.17.1

