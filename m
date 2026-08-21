Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4869E357CEA
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308048; cv=none; b=BI7n0Y11Yzl7fMik6woraiRtAyGV1OOG4IPSEU3k1nuZECHRS3EBqwi1n2oYhMMtTuGb1Xa3TERfMtf1uPxGQa2gh3LVEKAf5mjc/Lc893eANNIl966GsPi7YQCS0hoPpD1CfW3HYZeNZmvf+y98T/QuDlvhX9dUW4ydNz14bt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308048; c=relaxed/simple;
	bh=p5ms3ettnsZUkMaMVpgaQ1dF7NvICnT7m59e4toR5Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/hAy2ldybwE09K/viRYvOkk6JZ/d0dzrGBGsz6yfbwea8qc8l4dQS4MFWMhINl5NMjR1QMbkZAaxDV1k39FSNt+Hc0NfFwW5pjCdXt37jRCVFTK76ZShYSp4tW4BISye/12KaI1NyEbGaMZjjMLVHRU+cHUjgOqfm2EDqJ+lOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwkdOgaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFqvR1cy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwkdOgaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFqvR1cy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LfK93029243
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=; b=pwkdOgaJmZq3OfU6
	/Y5ih8Q9yCvhIBnGm0Jr1Rf9Qd4gEaCeery+gdoan/a06coDqxmNItufhxLBt3C/
	h4r9P/YkL3M77XA5kF+9hxD6kFHMoNmRmxmiKnMIFfxZO/fZJYHHT+z1zZO7FF7J
	Up2cS2pL7Ujdas73tNvdOsyDjsD/wrdrjzwZ/oxzFlzi+M1MCGi1c2eN74AUHShE
	nC4ZV4wDeUUGGiaqF83Y7GZ9LYskkOYtEX9fy6akBYevEgJMErvv/qGR6cXhUneG
	5pjPWqBNcwJHrWiKbukp/v8ye3zy+N7CwekuphvC71Yel5kFDJQB8HPoP8BgxT+5
	QxxvBw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9s86h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:27:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so685002a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308032; x=1787912832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=cFqvR1cydNxIVWjQu267/wr6fG3pONtKtJ/vz8FRodaL8UAi4lR4911j6dKDEmQAz8
         4dGcxYEpap5q0DXZkfgGw1meLZMqyCVsPsQDW/8vclbJ2DNUnopYrtoP0M9Wc2eK+A/a
         7SgENC2CY+9feDUdYpkFCsRV0b54ak5iS/nDgqqXsbtbkJ2OaPIuX4R3KQrz76jcKG9K
         kuLuAOKg3pL+WoRN73o9dFjw+d0Bdief8nf5/84o9U/AIK1iiWeyjaiqTXm0NWiAtHNt
         cuRFtmn2vQi73qxlN7CFuA9QyQpMrgV2EsTgzwkV10RjfyJzZjORXWBWRvwve6aZbwxz
         rURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308032; x=1787912832;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=TwjOyIlwHmtSN1p9bwKDlN/fYf7nv46/FYM27SY/+9EvFkU5NyfSfsCWAbDQ0BTPQv
         1Si9U6Pi+rxn4mkDh+j0nmigZtv0LrIwxM58GQu+61qBAieHEWJI7HcLxbrO0mnPZ2wP
         WyDaD3r7zK0vRFQLOwqzj0n6q61IzKsNt8VmmBITuwi872C6ic5KfmylWTB8yxczEp+V
         jZyKZnQpZKws2r9VOkD+7mkGpSvx4XtFCRUv7YYRuKO8CQvN2uRmzcbuzUmezW4wFTcU
         CsurKoF+s4HYUbm45UjZ0+0Uz0VnuiOs4XZEGd+6Le7BYZb4qoyMVI/94/5+zl4IaIGi
         lqFw==
X-Forwarded-Encrypted: i=1; AHgh+RpA/vhgubjc83FvU/NkWwiMvU2ALQMzQevH2chnO8iHGI+2ZzoK7uhF/oJ2cf1RmZwcbf29peUMdbef@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAHtanId1H8NJu33akG9zvYm8cWBEAfG1RuDh0fvagn5wP7nt
	D28plGtd+8puG6E9zk9dSCKkZbNM/fqqAmIPtmkpVSHeY9eRoR137ddE5ydX9ACrwtj71Dl6dwo
	qTs3An53rECbCNPClnPnkaplqRDdy5IXgqP0ohwvQOWVCjBIOeS0hbnZnjXHOaysGhltONmli
X-Gm-Gg: AR+sD11A409Q9MXEiSJy6gngRJujFjrCRGrjEH6taxqY/Ia0Sb6OI9kQsCUwMTej5RT
	eQYfNOx/pA5f5g1GMpCEq+/DIw6b8qdG41k+pOJK7XXWEmPgT+278XW/C/jd/B5HZwQlgevXnG3
	ayLrTBrzNJbqvUjfRMNNUcF56kqmiR0ldn23QdYtTx3v/p2b7iTYIlTO4uj1A+2zNZ7MQk0qSKW
	d0bwOQO2YdCYQQVfagbRY8VBwX+GEddI64RRw2JFbn8/Gyzc56OFBhlrwy5GlB6v82/oa8j24cI
	gVEj5q6ziyQLM6ss4C2vpWu2ZQcQXe5aW2EjodVXIulY6JfE8PBOOmUwFl4uDgEKdV+9uzm4prm
	7+UYJWtQGXtbA2ULZnDtJ0m81uDkp
X-Received: by 2002:a05:6a20:12d3:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3cd2fdd1cd6mr8378464637.3.1787308032010;
        Fri, 21 Aug 2026 03:27:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d3:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3cd2fdd1cd6mr8378385637.3.1787308031544;
        Fri, 21 Aug 2026 03:27:11 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm25859682eec.25.2026.08.21.03.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:27:11 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports
Date: Fri, 21 Aug 2026 15:56:52 +0530
Message-ID: <20260821-shikra-usb-dt-v7-apply-v2-3-030647f06285@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX5XZ2MYxz49/X
 hnNFMO8p/0GWt+WPxmsVNWhwmTvjbEP2sZu9+YYfwsbZ7qKK2mkuvXYdMPSTxlD9/FyvKkWTFsX
 A/p5dTGkO+0GV4U+4DEV6qLFL44sB0kF0CFUHH/WKgouctaxfJltJ364VbSdoX/L5vF8Lxphhp8
 nF10dZCrpd5B7Put8uBWJap90amFO1qQNCNNqVsPzaM9wcnA+8ilSW/XuSLl9xvLrJtQLHfLSav
 k1RZ9kg54v7Q/eAsH+hPXYOfN61dhQn70Fy/Dixe4Fu4lphNodHXbx4h3ns34DPn1VD9cVg3W0t
 8+NOQG65+1d3mJTEt3N0wDJv5i/8gy+Orn5P1giAXAPsjIbofr5vrG1jCikF064w85mp0s8YL54
 +2JANl89H4XiAItsjGV+NnLXju5ek+TAT+7+PjKiv1XUeDy1JyWdZufTusf3zLPUOYqE1uZ3lQd
 x26+u1yxnOOOP/uYdiw==
X-Proofpoint-ORIG-GUID: 3CM6-Qx7gaj0ATSIaXOi4Qp22p2vWEuS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX9b2jix7TspEv
 0ItMfxzAdp7g1y3P7cVplGwMTnPTqR1J/yXwXPdBxzEYL1HYQxDNnCt4difyyB0H8Aq6420bnFX
 ogOYlyPq+SkZYg+M3rRhNDMLcHGYeug=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a882800 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OKfUiDEiIDe3Zo9lHMoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 3CM6-Qx7gaj0ATSIaXOi4Qp22p2vWEuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
the primary Type-C port and Cypress PD controller CYPD6129 on the
second Type-C port. On Shikra IQS platform, usb-role-switch is
handled by Cypress PD controller CYPD6129 on both Type-C ports.

Add the CYPD6129 typec node under i2c3, wire its connector endpoints
to the corresponding DWC3 controller ports via remote-endpoint
phandles, and switch the associated USB controllers to OTG mode so
role switching can take effect.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  84 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  45 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  84 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 107 ++++++++++++++++++++++++++-
 4 files changed, 309 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 3866ab8b0faa..41290b562fa3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -42,6 +42,51 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +103,23 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,11 +128,14 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
-	vdda-pll-supply = <&pm4125_l13>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
-	status = "okay";
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +145,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..e4dd793c882b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -85,6 +85,51 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		vbus-supply = <&pm4125_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm4125_hs_in: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm4125_ss_in: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <500000>;
+
+	status = "okay";
+};
+
 &pm8005_regulators {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 34568f1c7b63..36514a31d66e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -42,6 +42,51 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +103,23 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,11 +128,14 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
-	vdda-pll-supply = <&pm4125_l13>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
-	status = "okay";
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +145,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..ee0b55b2c462 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -42,6 +42,72 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229", "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		ccg_typec_con1: connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_port_1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;
@@ -58,6 +124,25 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -66,11 +151,16 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm8150_l6>;
-	vdda-pll-supply = <&pm8150_l12>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
 	status = "okay";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port0_hs>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +170,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};

-- 
2.43.0
