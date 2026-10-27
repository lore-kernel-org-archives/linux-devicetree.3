Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088635;
	b=Aj+0+QeI0FvOJrJa79LDdGVvUTuEWs3zewoQe1ufi18hebDQ2UmedVd0K4l5Dnsq61mL
	 m9p4mHRvlyJtzWAICjJx+epS62uOiYnE4A2rsynGFQ9HGjtjCpCQrsQ1l/KsR/yLtBjvQ
	 HnpjhermTuCpzQFv6v2CRHNab5cM47K6tS83tTMunfSwrh/uhgROBTicVxNjK3HWB/hd+
	 ed06K7LjEm/NDt88h17DOk5jiCq/ZJ7XF+cWEi4nGD5H4BrM8obAy40Hb1MggBTvz9ke/
	 Vg7/3qCGDBVBMkJ1aJ3blG10tJaOf1EoyK0E22o5etX1kiuNkih47fDpRR0QbLjXrfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ntimWK9nMQiamVSVjPC/gz9lfx5y+FUcTwV8WAjrLC4=;
	b=S0i+ZUz6UAq28KrdRd/vp19fbRNriDAz4wfCGnCoPfa7Uza3IzbuQ0llkb+lEZGSpwfH
	 oLND/T+HXtJhFKFqD3GIwtExHtFsXYtLf1+zFFgi+LB0I+RYUxRMT5R6mzvsf90R7Ctvz
	 pN1sNIZM9G82dEwZxHn3sJ9MRce4PiV47bZ9QqFao2tpvjuYF5LC21Ctzur/gAlPkDRLo
	 gOtVcnXA+LhzSEn0nREJv4rccgxaduHqNo7ATg8vUznb0hEin5rSwoLyrw3/e6o9VnOX2
	 6KBOxq/mQDPd6k3dKa32wsVtTeE4PUTF8manH0rGhAH7oDQ3zskgczTTh6duKznwvmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fxuszlNG;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736B9606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736B9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fxuszlNG
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1963799a91.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088635; x=1793693435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntimWK9nMQiamVSVjPC/gz9lfx5y+FUcTwV8WAjrLC4=;
        b=fxuszlNG/SKj3HLwGXEREAo/kxLEsawWWlO9cNWns0igyYv+PcpivKmwNNwxZETSAv
         CHSGEiqTlgN7gknTFfM8k9xQXmrkKfoXQD1/iNregZMpyNz3KybV1lygNnZcYPbUuFYz
         ABgykjigxpwM+FBfsDx5Z69xqpeosBBbgRF1ZO3ehrPoh97s+tYwlShPdFIHBDOT25oI
         YhbBERrWO8BbrAT+21dc83e0bkhfJwGDTfIh1oSOiByhMV84DNpuPds8bvDxdjszVOeA
         JLck2Gr3Ii6DUkRF84Q7l6o8U/ToZjReGtey//xuWW2de3/SBj2HSD8IRtC4h/yS3mTc
         zfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088635; x=1793693435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntimWK9nMQiamVSVjPC/gz9lfx5y+FUcTwV8WAjrLC4=;
        b=ekXdHEFJVEboweChhYL6Q2ADEunLDa5uKpr8sSxqnZACfjFvNU+TIJ686QBrNQ2OEd
         573yj1ROEEIsuRPH8mrDg/a1mNSXkEYcnkza/h5HpSHn0aMUrWkfH51mNY5GDRjwZtlX
         w5+QR3v/39wufox9sfQL23JI9Sjb149l6vfR1prMUlJETev5yGtlNkjuVJWc6rZKpUqy
         zlzK/1OKPHPLTgTaK9enHojCpaTI6EL6bq5qIlk7JMBshDuHZPgF7XUPcPBBnzVGvQDe
         u0/pCxd2FoceptKMT6an5RNKIdlXy3SvbAHgIVblyKiFnsWZ7/AfiZe7eMMx3fOU2++w
         iqaA==
X-Forwarded-Encrypted: i=1; AKwUvBy21LkvJ4ZmtUzTNs5a8ZUkP4dA9+S4j/TsabTHGYbuyMI9uPDZffIDOyFuB3stbq46KcgVVIDZkQlI@vger.kernel.org
X-Gm-Message-State: AFq9FYKRVRrXQvw9r2Qc/qZJ1A2mMg3yWAvoSk4wbkThHb+rZjdqtB0I
	k+XMBRRdm3ZbQApik+ePtz6aLeli54dfooVamyfowaCzq29fNG5fz6zx
X-Gm-Gg: AYBFou0bXekLzX3bEszGWM8RZvkbMY5kQjX/bQOFiXBOywQ+uqTmuB33os8deRS4NLd
	88Y9vDogTuowLNhRblIuQ2qGwsKcJ2yRNvrFS8deARhypC8mVYWFrC6NY0yUwZIkNKA8WOEwsKk
	RLiXsTsVhD7quaQJ7nkxmUUmh3DGP7686xhN735urc7KWEriOXboNmTZXFftIwzUB9VrOMAdH55
	08pKa7YKOD1sx0FLvl3+WitsGgqXclI3Ii88RuUtbIzrejY65oNp6FjlYI8WraQzOaYdjizzIsu
	ElAey5KfB+muUe47lh8zxwHsldnGCDfxAakhmiitPgsECaDvx65k78sL9zce+I4l2aGwdeMyuk0
	mTav57BTOKxNh5wNQTorx//bC8FQ3ltj20mH+aLAye5pgg7OPh1u8zmQjpzD9Aylsgz1FCM1mEq
	HIe5vH8oNpLieija+VRFjm8HdYtuP6302E+NtaEIXBSIaXmZr4oBoSKBpN0qbzfd8IkZ0+q49f1
	yPBVaYoSGMwSJzWTGvkxwC6i7NdL0V5Id6hJckMgeRxBgwaeyiIzqfiOeIcjSGRopOv2CVsLotc
	c9bptvfcl4Q+VjLBq089W9fuyIZ9KAsUjLfTFI6KUZe08dg=
X-Received: by 2002:a17:90b:2e10:b0:3ac:7c52:faf6 with SMTP id 98e67ed59e1d1-3adea0b18dfmr7012268a91.1.1793088634782;
        Tue, 27 Oct 2026 01:10:34 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:10:34 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
Date: Tue, 27 Oct 2026 16:07:57 +0800
Message-ID: <20261027080758.3990418-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a QCA6390 WiFi/BT module which hasn't
been added in the dts file.

Enable the UART port of BT, add the bluetooth node.
Add the QCA6390 PMU node.
Add the wifi node of pcieport0.
Add the missing regulator node of PM8009 which is used by QCA6390.
Add the pinctrl of QCA6390 enable pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 121 +++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 6a7852080..b32f254bf 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -94,6 +94,67 @@ hdmi_con: endpoint {
 			};
 		};
 	};
+
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&qca6390_pins>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa0p95-supply = <&vreg_s2f_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p3>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p3>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -344,7 +405,6 @@ vreg_l11c_3p3: ldo11 {
 
 	regulators-2 {
 		compatible = "qcom,pm8009-rpmh-regulators";
-		qcom,pmic-id = "f";
 
 		vdd-s1-supply = <&vph_pwr>;
 		vdd-s2-supply = <&vreg_bob>;
@@ -352,6 +412,15 @@ regulators-2 {
 		vdd-l5-l6-supply = <&vreg_bob>;
 		vdd-l7-supply = <&vreg_s4a_1p8>;
 
+		qcom,pmic-id = "f";
+
+		vreg_s2f_0p95: smps2 {
+			regulator-name = "vreg_s2f_0p95";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
 		vreg_l1f_cam_dvdd1_1p1: ldo1 {
 			regulator-name = "vreg_l1f_cam_dvdd1_1p1";
 			regulator-min-microvolt = <1104000>;
@@ -515,6 +584,23 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie2 {
 	vddpe-3v3-supply = <&vreg_3p3>;
 
@@ -671,6 +757,39 @@ rst-pins {
 			function = "gpio";
 		};
 	};
+
+	qca6390_pins: qca6390-default-state {
+		wlan-enable-pins {
+			pins = "gpio20";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-low;
+		};
+
+		bt-enable-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-low;
+		};
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &uart12 {
-- 
2.47.3

