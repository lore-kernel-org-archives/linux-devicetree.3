Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D62388392
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384496; cv=none; b=a2OS52kGnz1h38+hcHOl4V0bHORL0A7fH5eHdNVrCaCuNwDp3332GHdwsjCHjf05ixdVuOBxz41wyX19dPLfLlsQmFNHPKuAmOOK1/O+nkLDirLBV0BSpwHKRhoyLoeenKOgVOR25Teahjz+QogWrOVf5dJ9UWK0gD2a7YRFaIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384496; c=relaxed/simple;
	bh=85JpFHUCR3X4aSnnJhNaKIDBi3/5GXYIOqt+mp/9g2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onxVv4Dwhsu/cJZZENTFuZuqr5oElXi9S4d0gmBcRnDz2xt+LTPdf3f3xq/JbVUh4DsjA7daMnESN2yU1udsgENf+Nerfz644HuF7FktKGcapooqnbSIM3XZ7gww2xJVBWs2jz/CikzjMM7KPbg2OR/lmLszPajATcoiCJcKBVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzD2goIW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzD2goIW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4624c1409c9so1736225f8f.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384492; x=1782989292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=ZzD2goIWyVsx0p+c+8vPFrK6ygwSXJLlAtkoHSmXGNEWySXGv4uc9eyTxPXEFR3BEm
         H4lbWjovEFGa07umxQx+JBeG8i3FMUVkD9wVFODxtoOVlOjMCIyml/ZfPgIRuZageGhg
         aJqe6wI8tsyrH8AXL0lGwh+9BkCSTze8m8it2xdXu7duLb+UiDdYLPz0pmEe/YRPMOwg
         HD1BJWVsy6mc8IcA8/cozT9GxbC8poyNhd9HW1+01xFWYvr6Tx+sFFidIg5UAoYPvFWP
         e0ztlFzMINtGEaScwW0XABan8lYT1KSB6dfthajwgkqjozCD9GRO9hYiygOR+cArSGVf
         rUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384492; x=1782989292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGDKUwtGAyS+7+q7mgtQ02+mVANH5ixDJ+D4q6Iez1w=;
        b=NI3K64nA4NrlG9rU65ZA1izTPtP8s7jj3TNAmCYgWvwsv7RCfdm8Mf4ckJ9SaFETI5
         75yFNmef3u/TX9hCM9GmQ1A4jSKFuUVR3ZHBHow11wXHBgRgKjLa4aaTAYsiWj0mQKlx
         L7jGOcnmHfpgYr/hLB5BFxolQdXuIREpsNmUjyj0rU9A+7N8v1K9/ga+q+oUzCjiIAYm
         GarV+j2ACAX10GQ01hnir5vDevUbgvLtrvngi5UsUPITJ4iV5J6OsS1K+7HcckRaPYdX
         PlpwFjIZRRYw8LaD7ARpsfj9WbZ6O2PhvtbgJWbbeOU/kB0yzXT3WrxmNXCxnxUI3+eZ
         BBTw==
X-Forwarded-Encrypted: i=1; AHgh+RpHAtKFqSJwfqa5tkCSPAqqhzANkwhAAzI35nq4ygByeqji4ZVuzEpRYb+5CMBWuxbkaw2WwqAX58mU@vger.kernel.org
X-Gm-Message-State: AOJu0YwuR7ZzfG+FHQj1AlYAeoxCDYZRd9rc6ZwWsdm7UfprQrMwR2ZU
	xzi4MDkgJ1B2eZidBfJJXEXXR+wzt+FbGpDEDcvLFMPLOxIxeJGPAV00
X-Gm-Gg: AfdE7ckAzkraaS9rLR4/Ic4ddhkLe/yt8ue0tZBo4fjIYM0W4fYLdXr3TATpdUYJlN8
	aWI19jlb/i3l+bmxovWkJIhI6vePMGYlU/IuCH6NbtRPTXzQ70jt4Cf6aBCp/CIWWZ7oycnylBG
	aIUGdCqciVwdplWKUKOantHM4mgszeRMtgSBQZzcFpO8Go7tPdif13dnI4qeR7I2IV4q4cC6b+C
	yRoY1zqELfib+9nZIA3gLbA+fD+reeOEdhAflqIsQaEcRfMqczBL/RStlYK6SrHNBMd4yEIqU5k
	n7M2ViMHTwafZ6A6Zej/V8I0liRXSjwZ8IBEBjDGvbb/7sjzoVJp07/ZZ3nN1Jj7KojoiV99vTA
	9jc4T0unHT8vWtDf/GhKWOFVkui3OJh2D1F3qoRQ+9QpmVBrLd3XkETX2PnO6RU+1WonmBSmXWA
	G90k73eQ==
X-Received: by 2002:a5d:64cb:0:b0:46d:32:3340 with SMTP id ffacd0b85a97d-46dc16b9abbmr3055956f8f.36.1782384491908;
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:11 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 3/3] arm64: dts: mt8516/mt8167: Update pinctrl nodes for the new paris driver
Date: Thu, 25 Jun 2026 12:46:32 +0200
Message-ID: <20260625104742.113803-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the MediaTek mt8516-mt8167 SoCs descriptions to respect the
constraints of the Paris pinctrl driver.

In those SoCs the pinctrl has base address 0x10005000 for gpio settings
while 0x1000b000 is used for eint configuration.

This change also drops the no longer required syscfg_pctl syscon node
that was used before to access the gpio regmap, fixing the following
dtbs_check errors:

mt8167-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short
mt8516-pumpkin.dtb: syscfg-pctl@10005000 (syscon): compatible: ['syscon']
  is too short

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 15 ++++-----------
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 12 ++++--------
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..65da6c0538b1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,17 +95,6 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
-		pio: pinctrl@1000b000 {
-			compatible = "mediatek,mt8167-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8167-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
@@ -178,3 +167,7 @@ larb2: larb@16010000 {
 		};
 	};
 };
+
+&pio {
+	compatible = "mediatek,mt8167-pinctrl";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..63f36df4d1b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -231,17 +231,13 @@ keypad: keypad@10002000 {
 			status = "disabled";
 		};
 
-		syscfg_pctl: syscfg-pctl@10005000 {
-			compatible = "syscon";
-			reg = <0 0x10005000 0 0x1000>;
-		};
-
-		pio: pinctrl@1000b000 {
+		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8516-pinctrl";
-			reg = <0 0x1000b000 0 0x1000>;
-			mediatek,pctl-regmap = <&syscfg_pctl>;
+			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
+			reg-names = "base", "eint";
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 124>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.43.0

