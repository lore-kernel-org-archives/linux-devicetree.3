Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088628;
	b=hOnis8ep8VA/3x+BU7nzyMihDbBYzkjpvoIvE0072LwXsnH5MUvmobW1U9s0fuUtpgkf
	 BkryFXZBrDB2yuwIRG8Y7UNWjP9e5ZvbEvOE7vCsIXnAGSVjL1Ktfwo3aaT1zoTk0h2Vn
	 IJL38eubFjuVJTPcLo1QltNyqQ8zaRU0/y+J68BuHKF7pV8pNrs9oKhIUk98GF1/kKhKp
	 RdHuvj016H/UM8J5ciFcUREXOoTt6Fq6/F1QgHowMKAJYOtrdxDnR160Um5EBrjD5GvlO
	 WD6M9m4WluP529HErDipQx9L72ABBA/TICCHLeH0VnC7QIXYPcO085ubf3Hi/EY8Z8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8xLA6U87k378OMtZ9fAsIDsZ++f4i7oTtmifqYIvJzk=;
	b=oLbFliSPXWKuuAur3AMlezsea+FEyyfgTtZZ0DnLkwM++LYBs/dpRDhTZqDHOBKfpYrW
	 WfxX9s4NZUMZ2NN4S0ieSeWzs7GFKm765tkrXg6G0InlCi/NhFAlJoj6LpwZLgHMVarfT
	 FCjVlmMuIn19GF5BswSXYt0smVgq11tkFTpj07om8QcS0uNWO+1+hc6hkC1Kb74c7OwUm
	 ZFVtXVLXzczfZwNoTIr8Mr5aOxTaG9lA4HzIWwXsLSfrkSPo5o6/37fYQE0dm7rnssxWd
	 s9yUhG9glVwxyNHolrVvyos17BWM/0PsReIBfe6LXc3/yKpUePttpmqY/gQMlXA2Kbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HqMZrTVP;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDB1606A327
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EDB1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HqMZrTVP
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2194161a91.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088628; x=1793693428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xLA6U87k378OMtZ9fAsIDsZ++f4i7oTtmifqYIvJzk=;
        b=HqMZrTVPdrMCfpIUpxSvtLXe1YK6mfQ7kL2fZJFjixqy4UIuLK1ZpaoLmh+s2X2HS6
         jfK81wD+La+0rolSed598Bb2MaV2O03JjIfeJTKe3cvYUw1Y8M7NynqQaF0fO8+Ur242
         nFaAsxAbC9f9oS3iqY/KYrgg0Yy89M5WMh5ALyKAR+JtUR9/3Es8mSQ4LgxW6oZWybZX
         0iIQ+SG2dcUrM1NHz2WNeBNEp6F5RHSkJCsy3WhkFUS+WXfm5WjSJAXgfaHtUNBDXWSd
         NsIjIeZyeAihI8rT9egXEQn/gmvEr33DHR4bU8hDKxN2pceH+pZ0ebQU12LPgAJ1G+5w
         kCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088628; x=1793693428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xLA6U87k378OMtZ9fAsIDsZ++f4i7oTtmifqYIvJzk=;
        b=ttusXgFsiJY0FttGUSCzVvp80HAV6slmz+AnkqC+2WDajHmu5HYBW6SWFv8kNDtK6w
         o+5QU6VCpNEaeusFyX3myB9WUTSoURwClHO6sGpF1QAip0lsnicza+LKSZZNHcH5mNem
         ZOjiGbhBlgb7eALoTKtI2WBR9DZMk00VuWTAtrjvnOq2aC14JbmoHKaCvSXB8ysEOwlR
         ZcUUOjwsORIhf2kaOkIJhdN5sixp+ZnuTOeLomtwE8j5l2EtAmmFaynQpXaPQQSEJpVj
         8YGSbSK629HiKO5Ktgby1+l0PUxnYm7IJP1pqORGVNgmW8mkiMHBAxNhv8U18C3HJseZ
         X/rA==
X-Forwarded-Encrypted: i=1; AKwUvBzGjKfyv7MS7XOmYraHtp7H7t3kLEeZObQrjiIl/SsgIlO8YPBo+8JAgcPfW+SKEtGaTUe6wMNoCRlQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKPJfJ/m5FgSnwH7bCS+OthZdQbzHHR425mBCbdB/Yf5xx7tR0e
	onq8nFE4XtCfh6mIFn+RjfTC7iH5041hQ0EzHqOB1FPV1k3cD71Xw/iK
X-Gm-Gg: AYBFou11Hn+br+spSj2kKPA3SY3NUJpWH+aZyaNcLOjoFAZt56OB6jXeJoQIPAdYMRE
	zuTh7JBMR8ci+lXZp9unnlZUI4+uvEIgL/xVK9SpknvhFJSNLeFGUWBIdoMBJyGz159t2q2LDx/
	Y/NLBBCLPbI1lILpwU6sk5vSP9VPQvsxa5b+XBQIGlAdCe/g72htRDswHbvROqr86SK2PGl+X9A
	mYYDUzl/EepzGyVlJZgHUFFIaMcDury1IQJrB5WeJG9bmFsivu+lrQAzGHJs0ro/NhpOni5Hw5S
	GHCp4gMtR5cNbleU5w3l99W98Cxlp6hL0+tX04cyPoCzBCexddvlAfhI0ep3PgYOoksaqqVx2Jl
	5hv7PPyuIQ8lbpqD3Q2+TdRjlAUy2YqRUvR9z9W/SY/4Atngqwr72H20Ah4QQYQ9WEY64PxGBRM
	LirJvKL+ZYVjRYveCjHfKeV1NBQUelwZTvKspJ1959wbsxwk/IwVbwCvj+tSic0MjNKAIJ+2VTZ
	+Y6/cL8Drr5cGRSycYQG1DQj6Q+cvPTtT7O2rwluOm34hzK6R76U0rHe3wg8dbDF8EmO1/gCbvB
	QiTXEp1uI77allXKQa8=
X-Received: by 2002:a17:90b:1652:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3adead50e26mr8334312a91.21.1793088627766;
        Tue, 27 Oct 2026 01:10:27 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:10:27 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 3/6] arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
Date: Tue, 27 Oct 2026 16:07:55 +0800
Message-ID: <20261027080758.3990418-4-dc_redstone@outlook.com>
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

The sm8250-hdk has a USB-C port supporting OTG and DP altmode.
This is implemented with the FSA4480 chip,
which hasn't been added in the dts file.

Change the USB controller mode to OTG.
Enable the i2c controller for the chip and the dp controller.
Configure the PM8150b type-c module and vbus regulator.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 142 +++++++++++++++++++++---
 1 file changed, 127 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c031f91a0..96b4d6c95 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -445,10 +446,42 @@ lt9611_out: endpoint {
 	};
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+
+	status = "okay";
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
 &mdss {
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
@@ -464,6 +497,68 @@ &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5a_0p88>;
 };
 
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
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;
@@ -487,6 +582,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_2 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
 
@@ -565,14 +664,20 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
-&usb_1_hsphy {
+&usb_1 {
 	status = "okay";
-	vdda-pll-supply = <&vreg_l5a_0p88>;
-	vdda33-supply = <&vreg_l2a_3p1>;
-	vdda18-supply = <&vreg_l12a_1p8>;
 };
 
-&usb_2_hsphy {
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
+&usb_1_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vreg_l5a_0p88>;
 	vdda33-supply = <&vreg_l2a_3p1>;
@@ -585,28 +690,35 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
-&usb_2_qmpphy {
-	status = "okay";
-	vdda-phy-supply = <&vreg_l18a_0p92>;
-	vdda-pll-supply = <&vreg_l9a_1p2>;
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
 };
 
-&usb_1 {
-	status = "okay";
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
 };
 
 &usb_2 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "peripheral";
-};
-
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_2_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l18a_0p92>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
 &venus {
 	status = "okay";
 };
-- 
2.47.3

