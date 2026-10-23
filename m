Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740582;
	b=oWUMMiyJ750E7L5Yh2X3tKlEwRvGCqyFiN3tdK2onUnvKgnCwpCCt3dNyT8CAhH+YNcm
	 HXpjHm8fpc+cIS06ylyWJEHW98Ng924oMeAWLPzkeLYqgC0S0KOsHGgX0I21E84TqZFdA
	 pwyNnGXjDdyEA1EX1z2lfMztk8Uy5fnZcERktO5ewH4BJKVFBapCEgskTSiHYw303qMbA
	 gQdScWpEofwhNAWZMwoI3LFUtOPu0m4jeic2rC6l1+Kch/ftjkjim+0vqsN+5rTvS9kbx
	 lzaw1EGfNYDEJXkK/DKlXkkuE4RYfwjZEzcEFO0wjVFLxVfOOkPPjx+qWOBMV7+qDpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6y6nqDt6mAJiogSVBxweWlKH7MGDfWlUgG68zfDz828=;
	b=bFp0466bKZ+s10OyN0WgsMlX9P7PB16U6yPVL5LR6o5OFzjcFlp79KrfCdHoDrWSO/pa
	 En+diGyFCfFrAX6IQzIoEbZmIWtj8CG3rYhJ712WbjYzO45MZew9bffGbiNKHGzy8RIxz
	 W6iBjH0n1CGMdTeT8GhF9IIE3Y3Jl3Pe8RMkmeEIhPEbRlY4Dm+/pIcBoUyZUEGD5E7Hs
	 2hDSgeAnyN8EZ8e0WoAQKWMENsL2IKIXfViJ8GHiS3qQ3afJwd5jdojs5leMZbqbQ0bHR
	 /kw4EIPj+JFUkFwx3s1wRWNdsGtJXiAfytA7+ewlM/FKRksvfLi4EBz41FYhZyQVTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qMCppTvp;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37463606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37463606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qMCppTvp
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e96502e447so4230235ad.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740580; x=1793345380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y6nqDt6mAJiogSVBxweWlKH7MGDfWlUgG68zfDz828=;
        b=qMCppTvpDQHlhRWvcke/hUNaLrBjBHXgBtSbc2L0Idow6+auynJ1X4uiZKVPfnf/ng
         jYluPsBZU7TpiFvCN58Aft+i5ITpuqGa1zVlCOyAbz2eojxNHkbMXALXGmOPJ3sFAB/F
         4cxm9jNDNpbqvV3Iq5v4VnFeBbdOJ7xkJH2S9bi1Ie3LiVMCaunHH7yhrDwb5RU8VbOA
         EAkMaHkG110c0fbNhiiDhn4wXfhPzzDuHpdSOD9EeA9mdYE5K4Gg3a9YMm5yIJYiOIgx
         ohQC84rjXK6x8Nuaemj/KfMS3IqOQ3WgcI6Mh/WUEneSKosVjWasANfnt7DBYOlyczfz
         YrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740580; x=1793345380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y6nqDt6mAJiogSVBxweWlKH7MGDfWlUgG68zfDz828=;
        b=sxyiriFR0gV/en03jmlrpV0WeHWEaVZhqZuAztNjC2sbFHbGuN93GW9hqDuVhCYk6v
         U8T9PCDAQ+UZdiSE8Sssb7Ju4uaN6zDR+C8RO1tNxayEAfLi0nTt5tE8ABGTsDFtvm7j
         8JSwoJ7X4Zwu+r56iLTbe84sWiR3nR3mkZRmycF9+Pb2O8C3oJ/2tsvxi6JmmZ0UT7KR
         twij5egxPHqpxFdtT4Tg9OG4MpXAIbM+GJx5ZTEjz3pr9XviM12bCaDooFaHG0eeUTdM
         MUDtluO0IF7S04UkBrRjtCTvBC6EgS7aLX98yAR1N6BRRhdsJATe2BEALov/ISKvwtEO
         le9g==
X-Forwarded-Encrypted: i=1; AKwUvBz6AVj/Gfhtkm0Ytf/0/fe2Una/mLB4S+D65GUadYP3gLWQvFsVwS4OOThmBogMxS9/0FOFqIYGs0Ak@vger.kernel.org
X-Gm-Message-State: AFq9FYIOqL189Kp6rl9/Hatl9XXPolOf2LFeE7VFN3KMrLxxJhsSUaV6
	KucjBAEm9y3+FslGjpTH9mtmBIL4prDRF09k/KyHGQW1Hfr61gZI/SiE
X-Gm-Gg: AYBFou0imhKVk34PbWSsjYbuhNFucZ4v5I7T+jPmoRbOTvpQTI0h3nxidZcDirX1H30
	maabSLQYBinBNoIG9rwArYxXRca50w+7VSssQq9E2mho5m4jLPoKPkftdAQAgwR3gXNjQIBdy3S
	2HgnTNyTIY+BrcSz+AZZDk7RMrxjZd//wW5VMRY8a+gO9bNrzSjYo6qz1I+pEy7CTJfggY04PYR
	FEzwwI1LydWkrRLkUc2UgVJ30QOKcngLJZy3bxeMBI2/3dIzVLOt0YCzwGzEIS4V/zCR/4ANPdi
	Y9LtctCBvUN4oR5BKV0gqlkw0whsCV339uvyVzuKn5Hdz246fsDWIuTeUj+Eh2dbgGXkLaSxbe4
	vYn69wejDEIwelZmpDkr3q3vgyt38qkBK7Ur5Qm3CArSiapaWgL4V41HuD/8zdToTjMJ979jPaN
	/nMKHkmq8Hbf+BxuDxHOyz9aCH4KwwxmwunQtxm4xeNKLfXxQ0govC2XiQjqBAlGmuFuOmE8YT8
	DLgV+V5X09Eb08gdEixMmRog2/uBgI5i/d/mBbRarxw4lWhyFrKawXSNtAV8UJ21mnrxcQQIg==
X-Received: by 2002:a17:903:4b50:b0:2ea:e24:3eaa with SMTP id d9443c01a7336-2ea7cf5d74cmr15224975ad.2.1792740580515;
        Fri, 23 Oct 2026 00:29:40 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:40 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 3/6] arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
Date: Fri, 23 Oct 2026 15:28:29 +0800
Message-ID: <20261023072832.2642647-3-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a USB-C port supporting OTG and DP altmode.
This is implemented with the FSA4480 chip,
which hasn't been added in the dts file.

Change the USB controller mode to OTG.
Enable the i2c controller for the chip and the dp controller.
Configure the PM8150b type-c module and vbus regulator.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 113 +++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 0bc946682..7a2903941 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -415,6 +416,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -509,6 +514,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
+};
+
 &usb_2_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l18a_0p92>;
@@ -524,13 +533,18 @@ &usb_2 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 };
 
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &venus {
 	status = "okay";
 };
@@ -589,6 +603,28 @@ lt9611_out: endpoint {
 	};
 };
 
+&i2c15 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	fsa4480@43 {
+		compatible = "fcs,fsa4480";
+		reg = <0x43>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pm8150b_typec_sbu_out>;
+			};
+		};
+	};
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -597,6 +633,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l9a_1p2>;
@@ -611,3 +656,69 @@ &mdss_dsi0_phy {
 	status = "okay";
 	vdds-supply = <&vreg_l5a_0p88>;
 };
+
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		vbus-supply = <&pm8150b_vbus>;
+
+		source-pdos = <PDO_FIXED(5000, 3000,PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+
+		altmodes {
+			displayport {
+				svid = /bits/ 16 <0xff01>;
+				vdo = <0x00001c46>;
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&fsa4480_sbu_mux>;
+				};
+			};
+		};
+	};
+};
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
-- 
2.47.3

