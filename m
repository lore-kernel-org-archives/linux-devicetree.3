Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C73420488
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747803; cv=none; b=o4dOSv+eO8CsY6QwFqKDREuwExv5LriS9ODeABGGVwflSmylpQUzVVZcedIlnWPAXDURxSPekprps1y8T0X9kA9A0W75JO3X3BkSGxg5MWfy06abL5z35HIxzx8Iqsa3zRxwYf/+eJpWGcWwubvyrIwXqRPMzMqCI5433sY7lM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747803; c=relaxed/simple;
	bh=qeGW5LpBgkLTF3oueK+lUIcMOPfyOq3EXFr+2a4jTmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4uuPj4rkMxAkmoAtXaW5xILofQSFxbygogwqAsowizYPb+z9JLmoICu4jHnN7+prW/UqnvX5XqmfrePBYnpPDm6JBrcRjMAbg2+NA2jdV98APT2OcsPeagEA0w2xMkw1yn68Id38NN9x4DNzjiWlsNBlFGEu+qlj+qgxHUKdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+5auUns; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+5auUns"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998e0916faso3739285e9.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747800; x=1788352600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wnl1KeJgVHfqTjz+jf+qVoKyfQU1onphkpSJDzU5fyk=;
        b=h+5auUnsATcubn/84j0KhlgedxS8k1xmJzneKiVtwzZtWbSsLZiohaB60zddLsz8xW
         yE0yf6LFon+UJJpMSEV2j2eG5tG1bd0t0ZYdBBcW8x7NAlfpGYy2bNlrAd8W6m9uMTal
         /CSgof/AT8Krj3CLcaVTQJKSbwQENATbSNb3BqaQ926ngYbWOWPjgVUR+wfTSRd3BJKB
         kNQ0ISbH52v6Y28FHMIBs53taPNQrpvlmOxZ9+CAXwvNxW/042iJBlLev5r9sUlsr8kj
         IWWaZ/q7LGfy0e9F+WxaeIxmJpPq9DH/ZtHalq92lFa/XvID3To1S2paMe0/DbZex/PR
         Ubow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747800; x=1788352600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wnl1KeJgVHfqTjz+jf+qVoKyfQU1onphkpSJDzU5fyk=;
        b=YdzNrqY7iPCyTI8cXLLdM6R93ihT7ctZptyLz70mZAOw5PYf8RU9UA0MsfdfijMC7D
         Rdc4/rWy6pBqBFq9USAjXGIzP+2b1uaAjUcVgN7EqIyemPx6I96RG5pocMZCFzwMyXzM
         OufUe0kXDB5dt+Wt6wAgh6yqzEKaWqoVA1F6LdCkce/wF5mGdaxcym0eMUP4+cc22hZn
         1I3ukaSRAgMB+OjRPT+8XgtisV+6ul6rlUVtcm64MK2OGCl6din6OmBtQfHsAehfyuHy
         yKX2wbQjPjfRygff/py2m+zXmNNam6q5IiQv/3o9fKw3dI0Y39OJIOpp65wwSpbCQfzd
         Du2w==
X-Forwarded-Encrypted: i=1; AHgh+RqhpEfyl/YlcrAQUFPCR6Tts1YKi6dfj+lol9ZiizvF9B4BP9ptAN6sexwGXodWdcg8QHcpaDcYfdZV@vger.kernel.org
X-Gm-Message-State: AFuF++kiQvDgmIvxRuafJdTVdzGLq+Z6vdtVlxZAVufX2qCgZH6zqXiU
	S4REZBcwAEKd0UPi+BgEIQZl3gzkP9m3M8YYrE6Gvx2IZBOQUpMB9G/6
X-Gm-Gg: AR+sD10dEkvsS8HsL+y1d1AZ/bWrfIhgmOQiMGcbfe94iMGdbuFG3X8WPGfNMcT+jm2
	NUDXhe+4vLdVRRl+d6wjD5XMOAK3SAc6NraQLi6iO0+HIFqg6e/o00/qU2WLvPcSoew4T68RulF
	fE2Jvu6vZqIdLduPii3sd13PANjMcvxil4ofGtTn2r4hLImanYWkC7fJwMgN/52RIbCiMTY3vsw
	QFKSIuc9fX6ZB5N1rGssC7oKm9h7chLnWYM8gbiaI/MExj3VwDNgdUgYwmTsD4w+Xk3Cf6ntzyF
	mIgokfn876ssSNnDIYYva665iJobc7nPFuSplQ95vD6QvLS+7vuL5ENROSegAQ7FAiXk+s+W8B/
	NSb5Yetxjm0dEbgTimexQvdduYnIe5nyBoTPNADtYfs5q2Cyr57Zjf6t5JG9MQicb/lJxCi+2+l
	Vezp5wDv1rKEgSUX+6qUEpjNYohBIKrrVuAxecAUSewiwEFAhebr2DhtOceRlywG3ljmy2ht2G1
	amUuGPj2GtD70OB+97L2BC+hGRSiJnI89+KQRNq2oL684c=
X-Received: by 2002:a05:600c:8486:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499dc6e1267mr68666055e9.3.1787747799611;
        Wed, 26 Aug 2026 05:36:39 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:39 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Wed, 26 Aug 2026 14:33:50 +0200
Subject: [PATCH 2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes to
 rk3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-csi-2-rcv-dts-v1-2-bcd8d459684d@gmail.com>
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
In-Reply-To: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=2631;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=qeGW5LpBgkLTF3oueK+lUIcMOPfyOq3EXFr+2a4jTmM=;
 b=Uj2PG2rjARWU4fhCPtVG8vSsygORspaiXfNPYB4WCs73KwD+d8M6ssdACXnNi68ENOup3DFjM
 s1X70tpbA9eBuRdXV9fkuL8Bndo7i8tqM7BzdY2UY2JbtcZPkynJ0IS
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The Rockchip RK3576 features five MIPI CSI-2 receiver units:
 - MIPI0: connected to MIPI DCPHY0 (not supported)
 - MIPI1: connected to MIPI DPHY0
 - MIPI2: connected to MIPI DPHY0 lanes 2-3 in split mode (not supported)
 - MIPI3: connected to MIPI DPHY1
 - MIPI4: connected to MIPI DPHY1 lanes 2-3 in split mode (not supported)

The PHY to receiver routing is fixed. Only the full/split mode of each
DPHY is selectable, via SYS_GRF_SOC_CON5 bits 1 and 2, whose reset value
selects full mode, so no software configuration is required.

As the MIPI DCPHY as well as the split DPHY mode are not yet supported,
add only the device tree nodes for the MIPI1 and MIPI3 units.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b7a527614243..cbf8b70cc15a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1324,6 +1324,58 @@ vdec_mmu: iommu@27b00800 {
 			#iommu-cells = <0>;
 		};
 
+		csi1: csi@27c90000 {
+			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+			reg = <0x0 0x27c90000 0x0 0x10000>;
+			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "err1", "err2";
+			clocks = <&cru PCLK_CSI_HOST_1>;
+			phys = <&csi_dphy0>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_P_CSI_HOST_1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi1_in: port@0 {
+					reg = <0>;
+				};
+
+				csi1_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csi3: csi@27cb0000 {
+			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+			reg = <0x0 0x27cb0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "err1", "err2";
+			clocks = <&cru PCLK_CSI_HOST_3>;
+			phys = <&csi_dphy1>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_P_CSI_HOST_3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi3_in: port@0 {
+					reg = <0>;
+				};
+
+				csi3_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		vop: vop@27d00000 {
 			compatible = "rockchip,rk3576-vop";
 			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;

-- 
2.43.0

