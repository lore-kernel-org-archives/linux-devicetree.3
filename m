Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805319;
	b=YWeQWWF5oQ6/QAY1SzI+fZA1ZWpm5bTu5dEzQjZgBUhOU91To8r/xrxUcefn6YX3/UTU
	 yIgyhgE48C9N4pxsWOJsyfeCSfwy02KafE/1+80eewYvmyOmkpls9kvZy8uVFeCYkY16I
	 X9dhLqYTYk2M31m/UPY1EZe40CToNvFK15TyM3p8UW6Yvtqgi19C9+jAiCrK98dFqR644
	 qeEnb6vfU1RulWBzzfAu7ly6PuaPtm5n3px3NG1v7Z1TOnYbszy67TbcgWWpn5mjZ9edi
	 RuxrxFAcGwm83avuA3NVyYpzbQiYvnntu+MmVenn/xHE0ymsW5Irv1zlWaB1OTD1ZhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
	b=FSl3t0b9cebfnTlKkn984qII7yNcZq3rxlVMdYZW2LjRcIckykD8lSWGgxGR9zH7yfPc
	 AXm53U4Vwa9lhWoqvYW0ao9HlFpfEEBVe53+XveKWEJlxEKCrJDXooXxeZb2JZs+gTK4L
	 9pXs9GmuMchgr2lld7YfmusRGNY8O+dPVbG85lclyQU9M3s6Bdwnxx9rBii4f3FG0Gtjz
	 jQ+v93h2t8/AcLr+irmvcJNJ+Hh9B8+JJtVRpoOtSs0bD2OC2Th9Cw8azEPLi5I0d4qU+
	 aSIQPnQ1w5a1sX0Y7ykjq74oMexHL8dv1l1usV0Ad4+rFwW7snM7KD9/NjS8cTrVoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQR4rYHj;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4838C606D801
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4838C606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQR4rYHj
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20edd106so574222f8f.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805318; x=1794410118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
        b=eQR4rYHj73X7fzzSCfY6Vkl7vWu8lDHDACWqotIGF/PbUoGrpqfjLQvrlixhH33p+M
         8IzO+5MOfFq1Zlpp1qp7bNsiS2qSb5ntV/FBV+nopeBApWthTWVqmDymvs8WBsESxmMf
         DOwuNLBoDkNr62jnWtFyGLlSKb6ipXvXmXxlDO1hdL3ZtKfU9hw1E6SjdtnD6LjCKonG
         +Ja8uKRPUxepl0nb+qNzPlHJADjPju4KwcbOMrflBH6juaszbb6TbAPgGXkL5ZJCLGMu
         y9QVVOxCM/kFwt6AYw2TSRJPCLLqKfmBEu3sVA64dCU6iNeuGb7+sOjUUs6y/zX0GEkC
         24wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805318; x=1794410118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYx73SlJlPR3kZ8X001pXqQBidHcVHidrYo3yoJ9gB0=;
        b=DVtVsBx6uArgM7g7VlvqHk3L79/2AWOOiYzSoaDgqwkUgGvfFQjhGAeiEVrZ93nJHm
         mS2jELbpKZI8VfIwVNqPiufatDpRQGeHTte06xmX/BvZ/R0xw0785keNissprgEdiSv5
         GKyQkYeBB2N2tM34dFdfv47I7CESZAH6RCYRfvZYT3IPmtwoelwTgxtyFbyszXcbncep
         yqQa0ome2Qg8NhnhSrixWiJgSYnbbcB2OkefioF4cBMpddN0imxQNVh3p/RWCwbK0L/V
         5Rzw3YTcpCf3oQ9Vs9qsSuHjzO0OfExEeFyDQ4rNf2NoqNsYPzynh5pWVH19376Ubwcu
         qk5g==
X-Forwarded-Encrypted: i=1; AKwUvBy3YjY1FaRZe+OaAp25Lg6yc64SFIlIRqrww8y4xnSf+1Z8tqsy0z1qixtPAAf74LEYBF9mjhkjxMYn@vger.kernel.org
X-Gm-Message-State: APuU4Z/6QoSHWA/TQ3PDGGaG8c+FagF/nzpXHzJzugRTMMUWK7XwhKXs
	oWwXlEpgGESMBGt2bm7eKtXylXDYxTEQv6+cmFJrYROhkfnGhBJLO0Ol
X-Gm-Gg: AYBFou1WN7QjleKwekutfHzmXpw9JsAs4c31z9jBPxUJK+vgfUQDZ8ZThNLXLFPEaaS
	LhKj02I+S1hyMacyRUregQtM3kRGsFCN5PdgzVgp6Pu7syTy5XFJVU8gF1Aex6AXLwqzwgg9pqK
	GGH524Ks13ZiUlrFmxGLWq++wgvikU0VyVaeW7YaHxlI29Asrw0klem5Fg4IAnVwDVbr536WDM2
	A5EkB2WJimhtxIc8EeUXg2fdIgs/61cdOFBk7lewGm5cYBubLN7VbLKn49Tt8D6To0Kh8RdT5K3
	r6IDVd2sqZoCnFIMxyJgkNnfgOfm/7TrwVVEvBIu7udFMhWzyLe+5sXZPEf0sNfTbqQgMkbmRgR
	W/4ryzlduR68tvldyhXrLahGue1/OVhO9/+N6rXJG9SRqUTedi1iHU3s+8YLdgZUmySU8ov31WL
	AAS+mv537cxEPtwWBscZGEdlaemOoj4FHcWOJpvg7N3LlVy9hnVMmOO2JyWOmseBe1xg3nbRe7q
	2o0WHEAfZ1qkAVtZa3xNAyCaoV86Cjh+qSlXHYvRgaHcWiSsPEDDh44vMGsBu2F6cpE6tpqMaGC
	Gg5fzRwnwSb+M7ZNecVFHyESo7ih06tQEY4SvJ5rM1Z6Q8Y2Md5h9wktOblB+NFlAA==
X-Received: by 2002:a05:6000:2288:b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48e6e2e76a5mr36167522f8f.9.1793805317529;
        Wed, 04 Nov 2026 07:15:17 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:17 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:12 +0000
Subject: [PATCH v8 3/4] arm64: dts: renesas: r9a08g046: Add USB2.0 function
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
Message-Id: <20261104-usb_rzg3l-v8-3-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=2186;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=4Zwn7eiGx5F+e7i3Q24k8P/CK7A6GlG6OQaRfATc4Lk=;
 b=76K4k07s6+fybYDFWpnzklY7KhumEnz8DNk21e/s0oOMjA6/zO1v4oU1N7bzNteHER8ir6GvQ
 oUW/Wr3FWO1AbcuJ/IeeSTW0YfP91NnC1nWF62oFoPxdLcAcduTpKRf
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 function device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index 4df290c9937d..7e379f6ab837 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1406,8 +1406,41 @@ usb2_phy1: usb-phy@11e90200 {
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

