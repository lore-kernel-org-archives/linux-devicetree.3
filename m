Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604748;
	b=e0g1ca7ENbtDQwI5H43FQgYhpSVw+pdlMQPX8wt0KwTIGGvVyLBrCYjQNymBQ/8CFuHl
	 JF1QuTNRDDRlnus7dQ1xTW48edfX0QLdSrVv0kd4LVB6Gh+44W2+GEE138uM5bcr5+1dx
	 FWGn3YMaNzDYyrxbvrrt2jQ/BD1xVJqAqx5F0QUnXQB2bSZ7HwPoRbIFs047w6+33UqJn
	 Xl2VIiqDnqXZWdeo6n/C6FDC53oWzmOqXQkrJrRPCBdLUHm1zQE89ItVw1pSxliv5ZA0Y
	 0rtrs+N/3RbVDg6vIayHMQWdmQBIDnAASuEsRN5q+Uf+8zqXphQ1mmLvZRiHslDXpOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
	b=J7Jt6eA8XwKrAbf8lUTQavYeI4+pCzfHVcQ1WWx2Gznsn6eCn1u4Ls8EGBSm/kZEhC73
	 cMm+kMXKSjHsp5saj7occzMcgeby7qtN7z1H4X4e0hPl7rtMzCh697oPFLf4Fq7CtyUdL
	 +Oki4lHTVTHFB8P85Y1MR3CI86PBpJHrM8Rf/OL0y2QnNZl5od1NFtdAFYj9EGlbbqlUW
	 wir/Mzn06el+HFlVtLHAOKf5f6du/0JWmO9E69zNk2CbR8JfH3j2GR8GzzZIPnyB7Lx/I
	 AK+nZSwi4ecpDcqHInw4nTe57G+bQ6AIrGumw0nKfA0iH9mrkt2GJduxIi5+xJiexKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTb6+TAN;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87297606A33E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87297606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTb6+TAN
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so27756215e9.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604747; x=1796209547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
        b=sTb6+TANK+dvAYUWFozbgumb8FQ7J4ZZhik5EqfemTwFdtzMiv5T2nYdXRLjKGsyi7
         BVHnhyqOAjbdOsHCFF9+olCr2ylSz1zZyAwpIKMpsZ/AgaEcEGh9Jt2PzK0ay9nrf1Ie
         KcwiRQaEulFzULW4WPYWy3cpQ5ToB2kitTJpufaU9wVi1xtie3FTSSdbRk/uz/KssBxg
         sFzp8P/XR7V86zWwF2RfPU+F86bHRBtSR3R+FbcrdNK3rU65Dhw6TgL87s8UD5Ws94lY
         9LYRFyN6+A3ci3BYX6J3oZeEVAkzQMAO/OXIuZeArCprqnWFGlHouwgcQ9vKKKhDy0G0
         Un8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604747; x=1796209547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eO7T4Km/2BDquVOPRZBMlkWE7nVyJddDBKELqXWeQ4=;
        b=dUyplANYMxtWDNBgowVY7Q0wL6ZFfSUj3Y9AYfG3qilstyQhgK96ClwBfnV/VA/2Qb
         eWfQHtsTcfaCyPzB2t4aBe0IMJASQW+LPOc1+3cZx0Pd6OZuJ58mbavsDUodbc+nwYcu
         Uozo2bbXtIa4b8D3vw7NPPDZiD2p+r2pFrqgHKULgvmh5bPuSDKcgF8vUkgx4VuVeZY2
         3eh19RwAMImIANoGg0CDjh/+ZMde6n+qkl+L8hoYw1WtrQ4lhKdp9FEzebI8fhd1BV11
         JwHmJOaCD8oKAz1XVDdXs/sN4DRV9zK6mvpoxo8sIM7CGO1Rtwu9jqODUMLkeX2dheze
         3Lpg==
X-Forwarded-Encrypted: i=1; AL+hErHv3cPk7OMl795RfEEjPrqOyIClJPslefGQ/DV3aBxy3fy5VoAnehGOBpZRnrpXntyiu0UxWl7M5Z6n@vger.kernel.org
X-Gm-Message-State: APuU4Z8URBcuqmpXM6QvbnQngbJhQs7D+UFQ9zf1yieL1RUGkIpZOW7E
	7z6XiPP3x+JyRI4usf5P18L6hH2dGhxJxBDf+GiWsmJV+rc8bCegNsFX
X-Gm-Gg: AZFdTZd/nMpUFucP8MDNvx1tlb5VSFfytGHY7UNbQdZzhAtv6/uBrxqAOnb7eSsl5vR
	/mS7xpG1K7v5Ua7yWuXzXfU1sULI8yoepwgR4VpE0CSAgzf7HXTrWOhif787u3EszhoiDdF7ics
	E9WF4PbLQgdKgqunbvVLwuwslRBOlCRka5w3cn5++UD7UNOxWwrSCi7c4IrhX+D24rRkdpI+HQq
	YwOLW2fOwH3qRiTbYPggxPQlMvsMSKQRTgMadT+B9vn3HgggZqMQ8FP2dmf0FCsXuZvghnWHBJx
	LHv6+W+8wOXJyKwOgq3LsrUzFcsU+Eiwxgw1aHEDlcs2d3aBXaYG7NUdjbGbvkzuXXYYKIo2/Gk
	AOqXc1e/R5d6Yi+ucPowlM8jX4jE6gQItElWx5OvomTSt5JKS06tTZ7FEva2pA+mZmQdTq1+pfZ
	31taLJbOKssTezR6a9ijnF937GSmcH1bJkrGdJVofjpNTsCEJsr9XxrcbcznkIfDyTmsPg3Fio5
	SkNTkG+J+AmccBtIBorwegdCr0OnzPE2o/sOPX5rhRkG2hkSY5qq0Iyy3BnGGRuW8qE2dEsGgYE
	ErI3gGFMdSi44Ljz5PiCe1ri6KPEniMvySQXmcLFNPvxX67Hg+uB6xKkS97U6Cg8
X-Received: by 2002:a05:600c:8b83:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb8880642cmr334773935e9.17.1795604746756;
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:46 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 25 Nov 2026 11:05:44 +0000
Subject: [PATCH v9 3/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function
 device nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-usb_rzg3l-v9-3-ea14d3ab8a53@bp.renesas.com>
References: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
In-Reply-To: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=2210;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Jh1Kyo5ZTMRj6dJgXKWzlKlzlSobHFJ8xV3AIFHgvak=;
 b=bHT+na2aEZLyXbW1MWwSkKw27tYSvY49RMc5kxmpOQqSlRJn6Cjk3JjA/OX9iLGM+BZuISbbQ
 /8bBQzDmxOOBBgyAun3tgbSo3N62yBczIoeAOBnPER8oEF8174HrhoZ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * No change.
v7->v8:
 * Replaced place holders.
v7:
 * Moved the patch from [1]
 * Collected the tag.
[1] https://lore.kernel.org/all/20260707145135.247565-3-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 35 +++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index b41a813b01b8..682301a38a71 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1518,8 +1518,41 @@ usb2_phy1: usb-phy@11e90200 {
 		};
 
 		hsusb0: usb@11e30000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
 			reg = <0 0x11e30000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P0_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2P0_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		hsusb1: usb@11eb0000 {
+			compatible = "renesas,usbhs-r9a08g046",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x11eb0000 0 0x10000>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2P1_EXR_CPUCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2P1_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		pcie: pcie@11e40000 {

-- 
2.43.0

