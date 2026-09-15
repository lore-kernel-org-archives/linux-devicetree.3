Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6E54A8A04
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475289; cv=none; b=oD+2OfjW4Z3Bp6XtRey07rrcQg3tOUQrAoQ1L7zSCg0ARzDT88oMEqDIb0K/Sm1AkcE6T+/3QES0hweb4f4oAvV1hDXRzkiQIDr1mK9e1R0VPCRpfDknmTZ8WUf5bAMovw9bwEbBDK3KhuqPpw5d1OpAY8HkQpDclrdOeCjwSCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475289; c=relaxed/simple;
	bh=ts6YghVyA/zyzel5doEzGL1L/0VfbhJhUqB26M/V22k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPCZFA+PkKDuoDotNpcggjcoPEAf93vXC6dk9aH8c9Of8z1IVNEKmJdRfZofXn0MQg1G6GnHRFZ8A1Ndv2kCg3bfpEB1FNiZBrPf5tcfF8b+SuFt+0oK3AJFqLZtapFK/YfJcA4P4pX6ReT9m7X2Qgs0jxtovp8Uuy5SSqdzblQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geaQb5T6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geaQb5T6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so17201345e9.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475285; x=1790080085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGVlAiXSUMIP2F6e2acD3g4t6CrjKoFWSLsHsqDHE4o=;
        b=geaQb5T6dK1pxNal0kk5kbZPfJq6M9TPkFg24RvWdLVxJ/zDsO87/G5wga1nAZsn2o
         vOC3YoQEN1kKB742rnFBCIrsN0Iy2dO7gnFz4wbAha0U1MfjN7WYzNhCc4U9JWb4G/lH
         pkN+TJ4+OIcaOpLMj7sTCVFjIgw6HxqGdpbDTfIYDLQ2/9I982jpZVNlFjsPlGpQ1soy
         9s7sdUbzosILfFEUGSy0rvFhcBwx3nwUrk/ewmkrE67UU4s1Z2+ycnPBwtNHgaSRjCta
         tJjKspS1CPRWWRkwJLc+kaWyDEPIng19qhTsnSy2bpIMHLefIliNA+FquJI9Ub8qFBqk
         voTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475285; x=1790080085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGVlAiXSUMIP2F6e2acD3g4t6CrjKoFWSLsHsqDHE4o=;
        b=oXhoM3lfWDZ/FVoN4AD6ZUOnJ3GMKDzsL9EfjyeuRtslV7Ja+HmEy9QSJTCk4Hp4u6
         rDw1tg1GNktbOf4NowPbAy4BTVIa/Pab6dqsqNaVeuY1XIrEy9VoYpbauHJ5WZ14Ec+Z
         /QjAKEszgE5yitviWKaUdrkjMIQ64OpzDG6wIoVgXZFi2xy1BSUuy0mdhy3w0VtpBx8S
         kq/LBzL20Eohtyq29oNv/7iFa2yalGm8nYU1uuDUKAJ4agjAOj/2FhCK4HNGNxeq4xZJ
         vTJZY3Tg3wzzvsqqF8/SqiMtUCvfAvQKC82w8gGUq+btSVRk4BUi/9wMfzu6qoYMeSio
         TJzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVNXnmCLpPQ1uioYqpsGmexPo/WUMMmRyXee/gmARwtkyOaVQjLMkOdzfGvPnV+PMEylI6K+SRJ8er@vger.kernel.org
X-Gm-Message-State: AFuF++llgJOPTSTI08YsTKX7WD8ovchD5zfZWMzqYaYyJaXZ4KU9/tfr
	HaF53iA4hZ7uyA4gGrMId3L/oVmH20edfwZ6YOHH4sW2hLKdamIW3XMA
X-Gm-Gg: AYBFou3BisxVCPZHK417awMa576GFYONYarjHdiY4HjrWVYkgLu6rmLJ76T5YMDE29x
	MwGOGCMvpLHN5nlrgNQNM0FdSRH3rcpG6cVP6DIlZxTuDQ83LLkZz/duMcnO8NzzBiDgXEJe15h
	w4UKFsiFzj94Y06aHNlMkp8IjCvCZta+886Eosw8+dqTRV3w73Fr5UhjoJ7gguxnrNuKSwNL/e+
	K8E2JFQNt/u9mIzrHnNsL2Q8UF/r0dAKp/mrvJ4/l1OJ0X4I7OlKwahy5fFQMPRCiQwdM3KgwKI
	Tvt9qDCuFNXM5eMs3yKOkaMfAiE71HiAoFM/MFKWm3qa64zTNKGiuA6tuplYnp5q0672Pk7hEdJ
	ENcXk0JWbqp4DwLD8SmU3TahVakczVTtLPSBY7w2zfbPBRJR+/CvcAbcRzBY0SwBg7v+WEvK++k
	Mune6KykLqnHY9EmbYxl3oWphtF7LhzgjRL9NL5hlOXW7bwTgxcaVo0Ma2ZqSe9+vYVv4x+M86R
	bkX0QjhFdvnBb7BwKdo0mqogjP113fhVDNj6i8oxEV1+3Mz1ATnyAFDdcq5mBsMZCY=
X-Received: by 2002:a05:600c:4f87:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49e7a66ac24mr76568825e9.20.1789475284877;
        Tue, 15 Sep 2026 05:28:04 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm83105075e9.15.2026.09.15.05.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:28:04 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 14:27:58 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: add vicap node to rk3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vicap-rk3576-v1-3-d3f5eb58a0b5@gmail.com>
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
In-Reply-To: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475280; l=3278;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=ts6YghVyA/zyzel5doEzGL1L/0VfbhJhUqB26M/V22k=;
 b=0fgklDILhS6+qpSp5w+qn6nL6tcjMbDA8a1JI/kKqs5AIOzSjV0gLt0i/KY3bs2HtZsfvqwtT
 u37tMDJ/EqVClUfq89iDRaOQ1FHFpJdy2qmzB5sbxVb9dE217e1xVcs
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add the device tree node for the Video Capture (VICAP) unit of the
RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode.

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

