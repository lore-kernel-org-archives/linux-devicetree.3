Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478592;
	b=h26Kjcs0CBBOtOyYWhwc5XbwFoO41NarZmg968CBmoROassaPiqV9J+nVktboLGMh/qT
	 prmPCz2cEB4oValEIHcuw/KbVAvPkAiKrlBjgPOQZt8RJN/bjf8pCX2A6Fyk8OMjYi6FE
	 EU0mKmnRTa9/Dss7oP0IFL3+2fPh/EyBVTZFJ5nXbq7GXAeZdUF8lu0ke527qByktJEjK
	 iHe/uxDDk91H32GPhqRo0MG1Xdd9la59w9EpkyMdh3P3q2q35LEof0JiIbwSBRWAhRzdD
	 xGf6aU93vZ9X0p3F3goFIY5Qwhmm8oPe7j2eaBf7o29vXGbBArezrSNTSw0mRtP2GLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478592;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=USuWAzJaEpO2tz+1HoJhHN3oMTp4mj4DRvQNdSwIcO4=;
	b=N/G9WU/D/FToE8FMPU4jbceuTbkT4J/cLQpw1+YP/OTrc3Eh4PCBpOKvLvgCCT+A0dxf
	 uOz42K6+4lRJCp0ofPenCqkbndoiBAUXOrRrse1FPviFkPGqwB1c2m23S+Z9kJZw3YSfE
	 vbGDsl9QND4CjODdBnjJx8UBvbiYO0hN1TD5WQ/JjvzF+jksodsieg+2+z0C5BN7wKZG+
	 15RZo8Br9nTfRarphSnS5UcLmXtjT29ADiVb7RgsyNsnHHUo4qW1C760XrA1FGNbAoE4Z
	 LUxKK/3ZfLgHLgbB399ldEyLwWXkm0jRwY2c0YDw6xq3huIOmxTsKq6gieBS0k331Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=LdtMYsNQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ljh9v4ta;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B92A606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B92A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=LdtMYsNQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ljh9v4ta
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5C645EC0B28
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:03:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 23 Nov 2026 19:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1795478591; x=
	1795564991; bh=USuWAzJaEpO2tz+1HoJhHN3oMTp4mj4DRvQNdSwIcO4=; b=L
	dtMYsNQbwH8Nkl1fRe9g5vEPo+dzzj22szDLZ+R0CirgUqkaMjPqNCw6FCHkma+S
	fVDjmX/zAnFHD2YohdywiC/pGkDB92sbdjyFAIW3db07HpfamVXY0d+5Od7yyDzg
	RwCVgRKq0bMqGkNXmvJLFVGPeNh541IVEOFbvfBxn7dGcWFMUOSHucndBKHx0C2z
	HS+DoCpigubadb8OCTZdEyFTHMb96o1TbbpHru/dyWXJ8L9GBJaoe3tRIRJaUjc+
	33+B8RbZAYEAnKaVcdHvvrv33mS0Pv9TMJJdOwS8u5FORIKUMvfJKcGKIHIdB+Sq
	I26d+7CneduB1eEah8V6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795478591; x=1795564991; bh=U
	SuWAzJaEpO2tz+1HoJhHN3oMTp4mj4DRvQNdSwIcO4=; b=Ljh9v4taklrAs/W46
	wFCVboPispzxoyEgq7LKfK+RYzECWjVfb9rWaRcP42w/ebgqx3ZavIQLSEz1aaH9
	LAtYhC6CttEtZVGcHxMk5Wh6e6qoNJLAZw5So9Dm7V7OFBRR5oRkSm9IrMFHGviV
	Mh3dtdxqPeVm2trJ+TqsoH6MXcdyn+O0WQrS7tsTC0oiL1kio7IUDz1oBXE70OVl
	fk1dsJN1+WPBKMJXzs64OFmoulhqpp7keMlq8UtY54TMzDy1fDTxe0fU1z2CyBjy
	QZqnqXKBgYt7m+uJi913GlJ9/43NT3EqpXPaGq0wbk4vY09RiBPf6hZyQHDG0lNL
	tUEZw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795478591; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:SlDQQiXU+SXZvI0xinsmMrFZrPr45rnDXA9ZGpT6lPEjmZE
	ldi3XGs8HTW5nuy3B1bxBVK5Qjo+iS3s6BIhgUjRwuvaSKrq+qJ9h7bephZmeFd4
	mMCuhNlJSZW3JCYXWnAg6TCznyLDJ7Vc7Q6cTrrIcy7zNl+qiIOmhQRNdbgH7wkg
	dQkZ49/MPWQycwqrkL3gox0Dky4D/6ZcZY4SM42Rwwq/vfJDqkfAUwyBqhGQgNcr
	LVAeKyDSPZoxBFE1JuxRxOZLWZe2QgpVncBv6NNghaF31rq604jL43T44rpHagPN
	a908SyH2jE4vHuupPxAgcaMo+Nv9l+GpYyCwUMQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NK/ol6VMFS1g2Tzz3DCQUhee2qCzx73EgnI/mJceXhY=:3qmchG7VMWiyCnFksjWyxYLSQ2dl7VXMaogtUEZ2IfI=;
X-ME-Sender: <xms:PtQEa9xszRmRJSNo59v5vLuXttDEOby3M1_B-6Z_sSECV1JodHaEGQ>
    <xme:PtQEa3rphU3zGDLWEZF2xH-hzsp2N7KoImLGvUEeRHm2YyVnYgpquv6gebJn8cLSQ
    DpnPZ_r1bdSUQEP7_f0xEgwLZNov8X6eHNTyzYZNKa0SiHDMO261Wi4hw>
X-ME-Received: <xmr:PtQEay6GGfa5c1kTbWWt54W6-kDI3JDm-YiSo4oSgH5VSXINmP55QNl_L4e1wJw1B9CndyeJ>
X-ME-Proxy-Cause: dmFkZTGKP0BuMVQ3da0kgk8xyu0FeulfFYiNwWsz1ncbbHTgCdKnIzqgtj8HE+Sx3Bdzzv
    UHBTv71EZVKpqeV9rxm1MIvNJL9AXj7xVBZmLE1eixpLLqayua7NAs8x5H0q1ciBofCLjp
    NMw7pEcY/WV52tz2iQPP0EmzGBLCISFgjTntJipgTFdXESJrU8iFlgEO+fAeoHXz2DOy1e
    bT9+yAkscfEZkaph3J6yRPtOAvFwXcm30bt4RskxY+A7l9M33XtIkcUJBggauJtB7ILkPB
    +nBCHuNp7bm2KuVS9+xfSl6UrUwwTUWs+yOcGSXlxnTMCiUc7Ag4WRGv2u8Gu/NL3Fomis
    yLr39kE1PWGjDQd33GTFoTtzq2wmTHyhxKUsr8devUTd7LcN+GMULeP2KDZhj0G005d7Bf
    n8Geo3w0RCm9ICHjIElOtacNN6kjyG6V6VPqD4CygQfFUt0Zet7Em9+FK/i96HU9UAYsyq
    HVebR8R5p8ISWcsSTN0NQUzg4wbM2OKbNi+4KwONMmewyCwsTj1chqllyeWOQxAPIAF2Hq
    NsMfdeX7XSc2wa4eBKcn9gF55DR1FT3pUeoMUnS4rG5YSu6ObUgD6LjLJk60RRTJC+avhq
    6QzdjsJnHRNeIe81zAkVO5MXpLRxjFzWXrIzsSOIP9YStbEbf/AiIwINRkSA
X-ME-Proxy: <xmx:PtQEa5gwc5tukPH4sEtwiG6FSDKGvDbC48qX1c7bUqGNqpMTplPuGQ>
    <xmx:PtQEa43SDBmAc1vvgLzwNoNfsh6Qh_Gfr2NTQHfVK3OXHXr2QvghJQ>
    <xmx:PtQEa3UgxGElwsw36dFsTy2jtN8RFn8t8yTbE5Z-2Obcvy3rH-LHgQ>
    <xmx:PtQEa92nbkEgP-5SEfnU_Cm3M52tQpH1AD56pEgjUUWbl4QioGJ8XA>
    <xmx:P9QEa7d2sbQlK88AzG3B5D2EBciDrxQeRSO2TFoz7WeIvx-gb_f2qKSh>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 19:03:02 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: ddrake@baylibre.com,
	royalnet026@gmail.com,
	sidong.yang@furiosa.ai,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v18 7/8] arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
Date: Tue, 24 Nov 2026 13:01:42 +1300
Message-ID: <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795478392.git.gahing@gahingwoo.com>
References: <cover.1795478392.git.gahing@gahingwoo.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the two NPU cores and their IOMMUs, disabled by default. Core 0 is
in PD_NPU0, core 1 in PD_NPU1. Label PD_NPU so that boards can give it
the NPU supply.

Set CLK_RKNN_DSU0 to 594 MHz. Nothing scales the NPU clock or voltage in
mainline, and the boot rate of 786 MHz at the boot voltage of 750 mV is
outside the vendor OPP table and gives wrong results; that table runs
up to 600 MHz at 725 mV.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 70 +++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 7828736bf9ac..6ff95066d470 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1131,7 +1131,7 @@ power: power-controller {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				power-domain@RK3576_PD_NPU {
+				pd_npu: power-domain@RK3576_PD_NPU {
 					reg = <RK3576_PD_NPU>;
 					#power-domain-cells = <1>;
 					#address-cells = <1>;
@@ -1350,6 +1350,74 @@ power-domain@RK3576_PD_VO1 {
 			};
 		};
 
+		rknn_core_0: npu@27700000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27700000 0x0 0x1000>,
+			      <0x0 0x27701000 0x0 0x1000>,
+			      <0x0 0x27703000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core";
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "hclk", "npu", "pclk",
+				      "aclk_cbuf", "hclk_cbuf";
+			assigned-clocks = <&cru CLK_RKNN_DSU0>;
+			assigned-clock-rates = <594000000>;
+			resets = <&cru SRST_A_RKNN0>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU0>;
+			iommus = <&rknn_mmu_0>;
+			status = "disabled";
+		};
+
+		rknn_mmu_0: iommu@27702000 {
+			compatible = "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27702000 0x0 0x100>,
+			      <0x0 0x27702100 0x0 0x100>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "iface", "aclk_cbuf", "hclk_cbuf";
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_NPU0>;
+			status = "disabled";
+		};
+
+		rknn_core_1: npu@27708000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27708000 0x0 0x1000>,
+			      <0x0 0x27709000 0x0 0x1000>,
+			      <0x0 0x2770b000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core";
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "hclk", "npu", "pclk",
+				      "aclk_cbuf", "hclk_cbuf";
+			assigned-clocks = <&cru CLK_RKNN_DSU0>;
+			assigned-clock-rates = <594000000>;
+			resets = <&cru SRST_A_RKNN1>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU1>;
+			iommus = <&rknn_mmu_1>;
+			status = "disabled";
+		};
+
+		rknn_mmu_1: iommu@2770a000 {
+			compatible = "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x2770a000 0x0 0x100>,
+			      <0x0 0x2770a100 0x0 0x100>;
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "iface", "aclk_cbuf", "hclk_cbuf";
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_NPU1>;
+			status = "disabled";
+		};
+
 		gpu: gpu@27800000 {
 			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
 			reg = <0x0 0x27800000 0x0 0x20000>;
-- 
2.43.0

