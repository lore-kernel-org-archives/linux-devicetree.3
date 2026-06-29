Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31174508E4
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750414; cv=none; b=VjfkL1/s0yz+pGCcw74E/WbLjF0Uk7RWo64jp1eiu0MoCRgTeKrOVCGW1Wd73PHPrXn2ZHvrSNfscTFlBAqxAOyJDTH1zrI4g2/DJ8J9cz78sjuiJmMj1Krind3VCAsCd3B0rREiOTSYV5uRLICnhwBuIHv9C8B3UKEjKaI5nlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750414; c=relaxed/simple;
	bh=P0M80+dyBiRxJ3qOApePkB80zPAcMBvvg34YfSL9+0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFjfCzO/Ll5RiZzUR4ZSsBSqd1KzBfNVJR4fOK8Erem1yNTUGnFUwJ21i2mmTZoUjnS8nP4Pt3WiiMDNoJTe3DpYF9fiHtgevN/4BufA/SEXF9yb50d8o+ONboQwt086MD/X+qd/7QRzxOkMSKXM6xMImaRyeQJOMSgAuPRbtxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iu/xBF1y; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu/xBF1y"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd4cc208so3435077c88.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782750412; x=1783355212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byGtwtgi7pm6ZOuMJ3fH7+tgRzdrXvaDzEyMgIaZ2t4=;
        b=iu/xBF1yMNyMsJuGZ5hTxUjmYHTPZFTjCyxB3DoS9V4YL0uaJc0Eq5dUcJeJ0rbFeH
         MyTrt75d0YkpGbg5VL06Ic+wEZr4jMstNTinLJIruJOCWw0VF/IH9DXmAkVlGAGXLRi/
         2uI59vhhxWVe2twwz7Ry9Kr39TyTablCJpCsIytTmosJR5n9MNfEF62+FqT4B/dI17JZ
         riUl1fCG4jHfjol+kjnpxohx/cyIWzRSVxOQPhoKoGbGu+/80vdrzK4InGeGORRZvBVe
         ytgHaPhWOZzlveVEI7VCSL7WHyxo4Bw77e6HWL88qPKrSsw0k9NPEJ/gbMg/42pqYhpP
         UyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750412; x=1783355212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byGtwtgi7pm6ZOuMJ3fH7+tgRzdrXvaDzEyMgIaZ2t4=;
        b=XivpPPGE8BlQ/Ov+5KP+iWD3gXM6H1TzISbfDE47rNHmwCEOXa+kYEoF7ThaGAPXFf
         F0lWtKBlaLJ97Kiuu9bP6WBsI+UJmqn27UucWROqXeZ3rYRSr3hH9ZI4cN4ctYXbMDQv
         F7vkDkQ+0eVOY3NBm5r8PyBBCkYDjhbhm0gABj7NhWOiwXLgo2S6uGuIB9cjknWyd93g
         YdtRiSqBnK87g2z6MdA+kM3N8rs5vX0kGz5eUceuRFIHbMZY6G/YGOS5Uqy4ev7DyWPP
         xeXYTymVjapBhor77a0qaAQypjnZ/g2z+WoY+JsCMwQTajzANo7iUnzxIVtf3gW9oOn3
         JcMw==
X-Forwarded-Encrypted: i=1; AFNElJ/sYzfjAtcN1VWN+LRAKuU6qolaTTl1J17wCqrw2q6/yw2GM9O+YXzQ257+rvQjladXE6Ih3zKWpg0o@vger.kernel.org
X-Gm-Message-State: AOJu0YwOq38xSb93lzz8pZkAmHU9EgshUZzsD0B52ow4GICqb0VosiUe
	XLMBX0ofFTJYNCuwSJ27PT3HUAuW+7tlCJz1W67OZX7Nd0vqaxon/vpM
X-Gm-Gg: AfdE7cnFFBHw25saEtr/nQVr8lYNrEUMraWiPFqqiTNOwjZkRHNyHKZHjAWAwheINsK
	TV6g8jUHxtUkEMnMEn4RdKFTyE8wR7uFOH8lCEB/wVm9DU2Z9GztTJhUD7HaCHA4/JGz+MKEhfl
	2jTaDiqWzBpcAesZwo5WKyiRmJCW/p3pRzt6jeZy6cdnBhnvlw3lm8M8u9TDpTlzLFRIlYvn1J1
	44venfffzDAtrh5dLmouOi+yYCKwupwD80hvsDTcntRLCjjg38NZqUnr8qV51fTfQNgfZ0msyT9
	Q2+itvzMvvc0EeY/vEwtpgL8RXbe+CHaBH7iiaTCG/0wXr5b8SAkv7EBnPe00XtoTuL2VWHQOj6
	QY6hfm9hZ4GnNq84XpM3HnZibLBeiusKwLzv/qIzJubQJwORpczSI0gXaM2BNB+BXO8Hj2KOWFH
	2dMQQTCAKuXh3HW+4/lY0atgkU+nm4gU7DzmEhsLKW/nbwtw==
X-Received: by 2002:a05:7022:238b:b0:138:43a4:925b with SMTP id a92af1059eb24-13b2a52d100mr21534c88.20.1782750411902;
        Mon, 29 Jun 2026 09:26:51 -0700 (PDT)
Received: from Black-Pearl.localdomain ([49.207.62.174])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-139d912197bsm80851896c88.15.2026.06.29.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:26:50 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Mon, 29 Jun 2026 16:26:39 +0000
Subject: [PATCH v5 1/2] arm: dts: st: align MMC node names with established
 convention
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-st-mmc-v5-1-3cf0e639bff8@gmail.com>
References: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
In-Reply-To: <20260629-st-mmc-v5-0-3cf0e639bff8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.15.2

Rename sdhci@9060000 and sdhci@9080000 nodes to mmc@9060000 and
mmc@9080000 in stih407-family.dtsi and update all derived board files
atomically to prevent orphaned node overrides.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 4 ++--
 arch/arm/boot/dts/st/stih410-b2260.dts   | 4 ++--
 arch/arm/boot/dts/st/stih418-b2199.dts   | 4 ++--
 arch/arm/boot/dts/st/stih418.dtsi        | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3e6a0542e3ae..08acba209c56 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -596,7 +596,7 @@ spi@9542000 {
 			status = "disabled";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09060000 0x7ff>, <0x9061008 0x20>;
@@ -611,7 +611,7 @@ mmc0: sdhci@9060000 {
 			bus-width = <8>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			compatible = "st,sdhci-stih407", "st,sdhci";
 			status = "disabled";
 			reg = <0x09080000 0x7ff>;
diff --git a/arch/arm/boot/dts/st/stih410-b2260.dts b/arch/arm/boot/dts/st/stih410-b2260.dts
index 736b1e059b0a..44048a98648e 100644
--- a/arch/arm/boot/dts/st/stih410-b2260.dts
+++ b/arch/arm/boot/dts/st/stih410-b2260.dts
@@ -141,14 +141,14 @@ i2c3: i2c@9843000 {
 			status = "okay";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			pinctrl-0 = <&pinctrl_sd0>;
 			bus-width = <4>;
 			status = "okay";
 		};
 
 		/* high speed expansion connector */
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/stih418-b2199.dts b/arch/arm/boot/dts/st/stih418-b2199.dts
index 53ac6c2b7b7d..4ea174597365 100644
--- a/arch/arm/boot/dts/st/stih418-b2199.dts
+++ b/arch/arm/boot/dts/st/stih418-b2199.dts
@@ -82,11 +82,11 @@ i2c@9541000 {
 			st,i2c-min-sda-pulse-width-us = <5>;
 		};
 
-		mmc1: sdhci@9080000 {
+		mmc1: mmc@9080000 {
 			status = "okay";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			status = "okay";
 			max-frequency = <200000000>;
 			sd-uhs-sdr50;
diff --git a/arch/arm/boot/dts/st/stih418.dtsi b/arch/arm/boot/dts/st/stih418.dtsi
index 8fb8b3af5e49..1a5fbbedc8cd 100644
--- a/arch/arm/boot/dts/st/stih418.dtsi
+++ b/arch/arm/boot/dts/st/stih418.dtsi
@@ -136,7 +136,7 @@ ehci1: usb@9a83e00 {
 			phy-names = "usb";
 		};
 
-		mmc0: sdhci@9060000 {
+		mmc0: mmc@9060000 {
 			assigned-clocks = <&clk_s_c0_flexgen CLK_MMC_0>;
 			assigned-clock-parents = <&clk_s_c0_pll1 0>;
 			assigned-clock-rates = <200000000>;

-- 
2.54.0

