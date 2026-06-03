Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E0034E75A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497228; cv=none; b=cDwCtwNDKOFqgpcxZAkhY+QGj8jDwNGn+qyFsYqCq/HnADk0GSYGqRuy02XdKu7q52TkMdC8amhJ2ce/OmooOD4A4wulXjmW9JkNDgR/5n6kuKKzhuuFUTuSDJKY9qrQmUCQ5P9n7u7Lp5O1szjCAV9yQz22bi3E8pt9+t6/S1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497228; c=relaxed/simple;
	bh=DYaktsBqOc25DaPSr846Lq7CCic5W7A90K1koGLeUdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MurjzC8DQT22qZPsdMGpA2K6GH33PGQjq8Ow9c7JRX2KaENyypwhN0VsjDN37lKAhDzIT9p6UBeBJqofGXry3jhPr0JLOD6fA6afaeCgldWRSmn06b2KzL8/U8mPbmKb2sC2wGvBDBGxisrbNXgdiTvlGJZb5KALycLiM4YlYSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6elcTAg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6elcTAg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso125801115e9.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497224; x=1781102024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhBI88HcMxiu/qVRbd3Bgg5S6TL2Bjx/bQArdCqGIeA=;
        b=c6elcTAgtmW2qCEz/5fF5QjKN6h8fUTlJjx8ETql1g6pvznAhcrHcNOVmnSNWNOrgO
         mHAxgsikJN6EGZdTrHCz38vCakUdnPA83hHw2yFxo3rMULg54KpVT2ADUUP3MnLXvFgL
         rurHwK9vkb0yBsdQDAZH5oMDp8zZBiyRJJA4Isf0CiwGYPZzoMqQ8vKGbL4vVh1xbmcH
         0sFocROk16hcVYKtYA5mhrStWZ1aJ0KWDB7SY919K6U6zf0mDvkZTylW2U/ONJufzoPg
         7Vrb11xSTV3Nb7P9Hr5p1xgr8yeRt1oZBo1mmn7crADROt5gcwAGtS0IlS++lNIP+PNQ
         JaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497224; x=1781102024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhBI88HcMxiu/qVRbd3Bgg5S6TL2Bjx/bQArdCqGIeA=;
        b=Y9glEDKDqKzvh8n1c+QAUPnnzAMfAwQjzDISPn6exH0zWzi2kv0+NnWWvNs7+cqYcV
         sBuN0sL1YR36jXj4uD0VvbB1Qih1hO2LmkXKdFRYWinmd0TeUTTQKCjQWn3mm6+wcd3E
         etOVG+9jghboK304attJAHjsma7lduM0QwlBpNHGpK/igEaBmGX2BtPLgCNmDmCQudPI
         C3LkW8kXrRDpwSILZXtAJQl5R5y2DPL8pY1xWQlny+gfoHH4S3XJrnOzvHEaNaZgb6kM
         Qm5WVSDoiZAt4kiG5AxdSEGRLwc/fTj3xFeQv0yhe2cy5milrat9PeKed6JR1CBoh3gv
         E1mA==
X-Forwarded-Encrypted: i=1; AFNElJ95XeS4oDxR3KkHmrjL83QW8omkQIheeoMictuEZDtbSJ91xb0ety+F8yLLlfLOOwzX/usdRYNS/nNR@vger.kernel.org
X-Gm-Message-State: AOJu0YxURJAcAgXiSSNxfmA7JpamGNwbNWgEjrhmPzuCwii//7Z3HmqN
	KGwWSCliJwmZzTlARwxTE1ynTCRyxfJ7i122x1qn7DWNoHH9sW/CA0hedJaSXw==
X-Gm-Gg: Acq92OHhIbokWn60Bk6ESRFx/OxM99OBfrPLeyNlDLR070tL/WaHOua7CNN/cyR+Ll7
	u71oyAEM3phnbiYBZIoeDqD8+iXl/UbKPltpMf2T7tHFgeg8ohA2CUjSy6wZjbb7TMK0IBhSMq6
	Lk3F/rHoDDt0RJac/mPhE5D7B2pVAkSwlluOtItHGDLGn9gCTBznMRXWOgwDd8ELWuRIAyCAyFV
	YpaDIv0NEdzdTPr1MSPI7sJNkx6PjLPR+nwKO+yode2tpkFtqcUuhbYHZyvjSkVwW7N0Okff+eK
	pg5NPVA3P4Lcb/Pgz0ACsE5jmCGwJD3OVTEbVozjIRL2T/bhqd51Ytpo8xf0eZ8D8u4cGE7ZteD
	m4xAUD1+3ljNrUSPYh1e6Z822OMWmyEDnp2SIHATkD4ZHdiZLhKoGSAfFD25JlPM0GY2e5L90d3
	Zq2NqCDxy0RuL8kqranytM/9PHxoGPJG48oVs1DLfBYsft/7+l6McAV9dtiFQ=
X-Received: by 2002:a05:600c:810c:b0:490:afc5:f95d with SMTP id 5b1f17b1804b1-490b5e82e89mr65586495e9.29.1780497224451;
        Wed, 03 Jun 2026 07:33:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm160147395e9.13.2026.06.03.07.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:33:44 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Add max-frequency for SDHI controllers
Date: Wed,  3 Jun 2026 15:33:36 +0100
Message-ID: <20260603143340.162457-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603143340.162457-1-biju.das.jz@bp.renesas.com>
References: <20260603143340.162457-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add max-frequency property of 200MHz to the sdhi0, sdhi1, and sdhi2
MMC controllers in the R9A09G047 SoC DTSI to define the maximum
supported bus frequency.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index b48da8534a3d..760099697278 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1265,6 +1265,7 @@ sdhi0: mmc@15c00000  {
 			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
 				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <200000000>;
 			resets = <&cpg 0xa7>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -1285,6 +1286,7 @@ sdhi1: mmc@15c10000 {
 			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
 				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <200000000>;
 			resets = <&cpg 0xa8>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -1305,6 +1307,7 @@ sdhi2: mmc@15c20000 {
 			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
 				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
 			clock-names = "core", "clkh", "cd", "aclk";
+			max-frequency = <200000000>;
 			resets = <&cpg 0xa9>;
 			power-domains = <&cpg>;
 			status = "disabled";
-- 
2.43.0

