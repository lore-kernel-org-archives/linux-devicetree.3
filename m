Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631AA4BE45A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004700; cv=none; b=jrdKuRW3No2qtfXpoT6nGOjKEYBhiuvLuYju+KSN7M8dNdFbsoseBZet7VyCg/w/d+2tXTWJT89+++jmM2Z6Aa/FawnENmDllEJOWXE1YWZAGHj1iqUjzPvV5bBF7Gb5Kgji5FjC3Npg7JpcWUsuqLUoNzQt0S6ugC8cPhPmnt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004700; c=relaxed/simple;
	bh=ZC4qyA+QqW+G5Bs4L+6PfR/B7WGJI496vaWFRnkBXSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACRJeTn9UHkc88Qo7dpgkbliAD5Z01eA+QBz+rTozOdQB00txVyUGG5kiXPNAXfev33b2O9X8Fv47GUyqIKQ3agyIKrv07wFUD+Iq34QCZtAyHHA+dayLzcqcVHnYLKj9iTl78+hfCH0AmZc6UItfoy8U7aELBVlVHwsCuby0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQv0XWph; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQv0XWph"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2497610f8f.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004696; x=1790609496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG0PGngxZ9eJCxWKdqWKn36vkLKB7SwSqjxijh1UYCU=;
        b=jQv0XWphQsZvnGcO64PlTAYgerbS4J9mXyaDtWy5CVSMZ4qcYiBqUSuecj7jUo7a6v
         7Hbk8pWm7yC+SuoE5XKtMfXa6UOtOQYVGuQRDNZ+aer8JIQkVOGS8lbxGgnar9pzbv9m
         ZEynk/wfzKvd0NcOpt3I9S0cASg4P27itHSm/kIWLpzjXR1XYsR+C6iCWJe18Eu2mj3E
         a5Xh8LMxGldAOTJ6DYNhjPDLnJyv7lN6aSmrVnk90rTJ+Vv6dNOm+9TxlM60ILWahRZx
         8mH7h/BgTEuO4+frZRiyTs75H9WRj+piAi+RYTaLks+y1vplJzhqmMWG+ju0y9GZrtdh
         KW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004696; x=1790609496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rG0PGngxZ9eJCxWKdqWKn36vkLKB7SwSqjxijh1UYCU=;
        b=NsZpvTCfQHvC0GdrmCvZZYYd4Irpm3LY+c2+u30ipDPMgNXuhuVNH3MCmsDyLobmvc
         LX1o83NyCZXjSp0104gju3b4sp5Y5/3AikboYM+FYUfPAQoCVi9aD5vyZVhsEgtsrda2
         GZsvvPTyeZNzBZcch2NIfbPOEt178V76ENUP9LY/qLljwIR7zFrIAblExACYBwYR3MMB
         HUCzc44xsXDqTwDy4+X8ngIQq5IYIoXKNy0f5GIiPmRWJ0cQl5CKfhdTVmPCJ2zYT9ru
         AlWepS81I1FwJAKfsx4dhZ+bApA2uXV1YJMe/kgcDPVs7oG44KWJ2Ik0f/Ptp27UpcEi
         61Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwhAy2vXnf7g1qbbBB61dKoffSj9UCQjhrl/S9bV7UcR3G/ay9oU56Xg6M1l9cLuRDJ5siLweI9jUan@vger.kernel.org
X-Gm-Message-State: AFuF++nsLCHe6/d7GHNZBcGSWUX+FzenXx/TFJUhFHkSlzBis8HumGpC
	pxAyE73G9XKp8p/TRiRa4P6oH/WUTGGMsF7rs5VtzdoBRWqCFhun+0hG
X-Gm-Gg: AYBFou0CgHB7TEfAm59geO2SpdKpg8A86byKR582APIdeV3hYvW5qgUidGrEZX7vVjH
	ewLUBz8kYN8l4oG086P73bZhA9FzVTZJ60yFq5Jb1RpE38VD9KlbNriSLOpbFwfz0Z72BIfhpFX
	0Jp6PtpP33lNWSHKed9yM9oUMF2nCRqaAzuDKde+9dV2xq6kXA7MmFoJDPAPKWMXGm2ZdoIVbQL
	rFy0WksUZFqGyyBDGq9bpVGHunS6MftHoogaQXOLi22d6HZb0gjQaCqSJmGZXpI9v5pekxEV+UL
	LdnDP8x+ipIaJZXLnvDCO5lIGbQoe1DmlC4EYNrv+i4jiKgaMThpEhT0tYqY8/gUVeF4IaFj3O9
	pGDgXthB55nNnPAK9iEBlVe1RmFlPPuJOuvbFxkqiXHxYvl1WBbAlM6WSiWppW0C5u4sMvdTVWX
	VK9b6s75XNiNqt3f+2sHjSG8c4B26Y22bf52PBc6ED4bW65qmKAFsKJW6RxCquAL8gnTWbWEUEo
	7Irx+za5utIHbtWoqF2kPTJwuvA9ABYDiX3ycCDNEKr6u+bxWmTcyyX8w==
X-Received: by 2002:a05:6000:26cc:b0:486:f9d9:fe0d with SMTP id ffacd0b85a97d-4871e3961dcmr15911596f8f.29.1790004696322;
        Mon, 21 Sep 2026 08:31:36 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:30:01 +0200
Subject: [PATCH v2 5/5] arm64: dts: rockchip: add vicap node to rk3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-5-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=3338;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=ZC4qyA+QqW+G5Bs4L+6PfR/B7WGJI496vaWFRnkBXSU=;
 b=0LFg7TskclcAaCKsLisQlh1M5J7hMLHO+H4Vs4clqqE8Vi5mMqDn0Btt6CcQ37cSRzpVaha+6
 WJotjvQpMwjD/J9lQ19LZJojwTq6AFHEacSCgvrUauDIJ1MgRuVpGdE
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add the device tree node for the Video Capture (VICAP) unit of the
RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index cbf8b70cc15a..0c46accf5657 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1323,6 +1323,81 @@ vdec_mmu: iommu@27b00800 {
 			rockchip,disable-mmu-reset;
 			#iommu-cells = <0>;
 		};
+		vicap: video-capture@27c10000 {
+			compatible = "rockchip,rk3576-vicap";
+			reg = <0x0 0x27c10000 0x0 0x800>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+				 <&cru DCLK_VICAP>,
+				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
+				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
+				 <&cru CLK_VICAP_I4CLK>;
+			clock-names = "aclk", "hclk", "dclk",
+				      "iclk", "iclk1", "iclk2", "iclk3", "iclk4";
+			iommus = <&vicap_mmu>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+				 <&cru SRST_D_VICAP>,
+				 <&cru SRST_VICAP_I0CLK>, <&cru SRST_VICAP_I1CLK>,
+				 <&cru SRST_VICAP_I2CLK>, <&cru SRST_VICAP_I3CLK>,
+				 <&cru SRST_VICAP_I4CLK>;
+			reset-names = "arst", "hrst", "drst",
+				      "irst0", "irst1", "irst2", "irst3", "irst4";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				vicap_dvp: port@0 {
+					reg = <0x0>;
+				};
+
+				vicap_mipi0: port@1 {
+					reg = <0x1>;
+				};
+
+				vicap_mipi1: port@2 {
+					reg = <0x2>;
+
+					vicap_mipi1_input: endpoint {
+						remote-endpoint = <&csi1_output>;
+					};
+				};
+
+				vicap_mipi2: port@3 {
+					reg = <0x3>;
+				};
+
+				vicap_mipi3: port@4 {
+					reg = <0x4>;
+
+					vicap_mipi3_input: endpoint {
+						remote-endpoint = <&csi3_output>;
+					};
+				};
+
+				vicap_mipi4: port@5 {
+					reg = <0x5>;
+				};
+
+				vicap_toisp0: port@10 {
+					reg = <0x10>;
+				};
+			};
+		};
+
+		vicap_mmu: iommu@27c10800 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27c10800 0x0 0x100>;
+			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VI>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+			status = "disabled";
+		};
 
 		csi1: csi@27c90000 {
 			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
@@ -1346,6 +1421,10 @@ csi1_in: port@0 {
 
 				csi1_out: port@1 {
 					reg = <1>;
+
+					csi1_output: endpoint {
+						remote-endpoint = <&vicap_mipi1_input>;
+					};
 				};
 			};
 		};
@@ -1372,6 +1451,10 @@ csi3_in: port@0 {
 
 				csi3_out: port@1 {
 					reg = <1>;
+
+					csi3_output: endpoint {
+						remote-endpoint = <&vicap_mipi3_input>;
+					};
 				};
 			};
 		};

-- 
2.43.0

