Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B956D4A0F15
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473410; cv=none; b=TOk1+x9wlmk66+tIYp2eKUvRlFJm6VlBP9iEjMCyU6gPl/FGKqg3k9iAbncg2yEqzIzqnltuU//9TwbN9YtC9z/OwxgUNKGyfuPBF8OzgJgW7y2lyaPSImSvVf2WGnW62Fv3Hky2SeqmijNmViAo0/GGbtqt4mLWMsJ+13ihRs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473410; c=relaxed/simple;
	bh=hz7ecKJMlWN4w7YByidxbnhsifV5HkA2kX05eT5H6SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGIc5jTnu24fsmjzagy4ID4d6q7QdNaxQZSg8UaxmLcDaW8I8gHP4GkB6eWcoFCTMS2k4wbKDGNFirbHWQNCCKW/SN/18Dmps+dN+L2YqDWUSozQTKAcDghkvvmvggCJtkWDufx1+BdW1H13Yg2XFNKGyBLs9iOfjHowffAlcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBh/S1C+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBh/S1C+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so23518485e9.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473407; x=1790078207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=;
        b=rBh/S1C+njeQtcATYq9sSnfPHPIutabhRLULOnt5CgmCDAkzOebXz3ANXkGCxUXDr9
         uLJo4rPM9Xi8H3eVqT8Yii2pANjBWFfX90uG7v4OqOYv95ECS1dfVg3DIbyXr9Ffuj4z
         4jeT41r84bEBP+EtxZZZv3OuJq5s3Ii4/Su7JISa1mwmw/RgiGaPB2zQL1778+I/n31V
         RDI+RTM66bT/5kGCcuE0zE/I2cAM1kU5uGo/ZQmxZ37zu86KzkWg8tBfTygDtGiLX79B
         nQEqWoeVbTRuzqhM6B28Mx6Eg/0KZ3ppvHNdagWNv9wjnMVvYSBqAYnml5z2sYIhAYJe
         DIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473407; x=1790078207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=;
        b=f0rsohOgyXWTUuyLcS0cmJbOHGmcjFALwVbcC1eZvxvLxw4GWsbzl8iNc548Cox3Jl
         iq/NYp39qVEtQbtqBSdJ4vksAvfd1RWZW1IOBx98RhT2br7yeeEvt01jNlXTcQaRgTKq
         ateGCfiaChicMXwH18MeNhCDIcovo5tJuOo+P7XN0IQ+FBcPHYX08qQ1xmjp+mM5lVpO
         kabWUFnpC9HYPg2ofcDOEUl1fv1vLd+CuLPLd1deC3H6SoMxcDRz72VrEsJbP+PCYY/p
         qo2pURGkpfesY3Z7+bHjf/0/sDVupTOoucV08kNCJ0bS+391tpq3y5BFfEVv7a5Da5WY
         zhmg==
X-Forwarded-Encrypted: i=1; AKwUvBwUifeMmoUv2VDkTdAg6Xoq2XMJNm86hoW4ZdowC5aH49N4JAWMchMD1PqoeiuZGeyuCVypY/Gd+JMN@vger.kernel.org
X-Gm-Message-State: AFuF++miNuToi/VfPGxkysVsX71Z1+zSCaMS0uC4IiLDDZnJpD+N4rFT
	dfA1Yv44wlQjctNrFVBVPA0s9kiCcqaCehuWuQ/zfdTr+J7ZGMTnncDMYnL2jQ==
X-Gm-Gg: AYBFou0hVP6ax/wGikZ5KqkbvTm+YdZwk2yZfHLeSTY4RmV+NtISt4JGAoadXlcxnxO
	wtr+7cM/5TgrymX93mrrUSAxBj8PjiA2M9KCcVzVbTZrcOuAqLfdvYRiJsmo8biHuubw2I0Qb52
	xWH83plkBVsYNInNxJG6WaELJpwJQp3utn66LLwMZNaErNv6kyQGYYCRFH7KEBAlEOX3AhomVw0
	KDtsMlr0isN3Zmucr37E9ygruG2PxX0yHh7iZB2Klw7mT1zIy7wp5BcXbSLWQY/y1kEZn6e+iS4
	3HY1K6Rj3TEE0sqQbl2BzSbeuu1eRis63NbUOpkqjWt0Y5VPaDmb1LPI7arKVgJ9vZwnTdGbo6q
	fRiTO13kwlvSgIJorvY8xu4ucun5E6Jc2NhgVgiK0In18tvTUVqJxNLK3h9ZSeFcmm7YZz0HR5I
	rm7BTko4FuqsGdbS1Sn4fdPQsUMC7eYGrjepoq8UpeahTEyPU9PmvPf3X1q0R5LOiWOeY1+PxLx
	P96NZKF1iDVfL5776MyHeh57GBGihtTZ9kIrmeeeguCH1vYLU++LUx7LUBULrjSSO8u
X-Received: by 2002:a05:600c:3487:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49e7a66af92mr186642285e9.9.1789473406677;
        Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 13:56:41 +0200
Subject: [PATCH v2 2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 to rk3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-csi-2-rcv-dts-v2-2-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=2691;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=hz7ecKJMlWN4w7YByidxbnhsifV5HkA2kX05eT5H6SA=;
 b=tj68X/IcmWZX/XZiXkGeeRk0CFzYyPr/Y7qcNgyol3bOUZ7O2Jnd8YAYI2xuhQ50+w+iMS1+r
 8idipYTKQdOAh89PeeC1du381r95I3oTVoV/s0oBkv93JJ63M6jymvM
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

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
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

