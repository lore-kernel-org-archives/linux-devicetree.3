Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F482F39CE
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953473; cv=none; b=hK+98a4OuZoByjfbtGtZCxeJAJQbRdaI2ME5Ownl4mnJ+68qCqbUggzOc/i+l2fSJz6f8apnWkXM5yDrc0JejEdsFOFjfuRnGwOnKx9nSAiRS2wM6FGypejM6HoGeEajE7kxNPoFzi/bTD992KmfKAoHgtID2xXDJUt4HvupGTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953473; c=relaxed/simple;
	bh=raGwaoZcrN4kjJyDEnDCeSeMtBKidjZPyvjh/XLnbgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKqhlCC9g03rR0uAeRtVJdleQQXcWLLCi/DR4RtIa2dv6pIVlAbqspQmf7D917H20h4m5SlD3oWArHHWvZjUghDVTk0ZWpFmEGEzu/uwozvCmX6jIxiiDK2BRDFZxfiqFhIozJKQCeG20FBPcphPF8nv9uKHeh1HFtWrsmKFKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzN3zBXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpxfiKYj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzN3zBXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpxfiKYj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8Aug8058040
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mO9asXWd+omDGcbdkY7dOre9nZcSuxB4BKr/K3o1ZoM=; b=IzN3zBXhqMRGoOdi
	ljjDp/1yZwnWMAsCO39sx5EYVgtPuhYwgTCHGPS2jbTpcR5Rud3Of+BDAXYSgLMl
	TdrK/11RKRdUs8EH+93+5gfNm5FcT8cK4ZBa30TcnGxBH/l5mD0cUlFAV69WqHCK
	VTnr/ErWa09wKEKsz4Z7N23IY1/NOycT3Yo059UDkiPjULAN8s24ydCW5nDGMXpx
	wnyle6wFXyTJSAoJlOANW/6Yp+FHyRQ+TbGtANnaAOZBl2LT5ShKJjfSDgUbmhpm
	Omyt47+jOGhbjJ5YCrjRCBKexhq0W5KhgGGk34g6jjOOLEQU2QWn3RM4GtPx4WDA
	Fyns0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkrm3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093025ffecso173527071cf.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953471; x=1775558271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mO9asXWd+omDGcbdkY7dOre9nZcSuxB4BKr/K3o1ZoM=;
        b=ZpxfiKYjjWvfSKD5R5buJwucGkO0uhz46apeCl3vjVvBLFFRIZ5QQzzjIfWy96vfVj
         Li2EY74igHU5YeqkoC7ZPVSFEyn7QM6m72PWWqAu0vf+xesA+UrjI3zuwhodgcpQuWRE
         M2TLHlEAUluIDHEFJn5GC7hVGsoYho0yFXKsD4e1w28jhyksnMPJo3QYaBdpMbfZ+/NM
         1qje+H0bhwOZMiobSMETwBRDnwgjY/ZK8tCWNsbyeIr98KJALD1/Fy1rl3weAPQ7657K
         M/yiQQn4hVqUFaGBW5Zlk23aVQdeIUVy+klKeSPF3n0nvRs1G4nDlmn786MbqJuiHMJY
         TxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953471; x=1775558271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mO9asXWd+omDGcbdkY7dOre9nZcSuxB4BKr/K3o1ZoM=;
        b=lq08Xv0zyU7EZIKlWbXvcU6sW/HdCMf3aH5mah/bhkkTe6yCN/xYboF4+C3Xj007Z8
         9UXJ23AvVA9FGKfZBE0/SGQNfk8uDlgymL6wjwAfeVBEjv9d6OJSEqzkBpQz/s4k+pex
         YrHRst6zYPbClB3+HKJYLmSF5zpFciITSdDcmcrHZYlI59rriBwAXbCPZQvDXGOIfpH+
         QxHIq9sill4wklcHRz8ngrNsFPDt9Z5Fv1N3D5lkXhOsnQTFRq+PDNB8ZtG48Ab146Nj
         clLb8yWx0sgKObeHTBHsJnke2jFan4HZVnXRFqYeoZivSsumeMka8g9AOnqGp4IlclQo
         BqAg==
X-Forwarded-Encrypted: i=1; AJvYcCVz8gy5fdEpz1l2wv7XzcxgNxnMWcwy5pdNSVTUyljBw1Cm7539tlIbD/9lpMeH+VbJU3BS2sn7eFon@vger.kernel.org
X-Gm-Message-State: AOJu0YyxELqw5NetB6hXGYyC8HeAYffJ+sgvMfEqirZqyO9w4BqGHcvx
	eXQQCuY7GEH+H0XV88xqvrdVmjJTt3+E9Cdvm4kHKCLq7PEj6odAeBYe5yFEXM+XxgUdKX6o60k
	yNeWvqGRUTGheE+nzgJQh+uPZPdCEoYzI42ZFzc/89iQt17K7gnTbhJJE/LkD1atB
X-Gm-Gg: ATEYQzyd5ITN4j+OgjflhCF61JmG+glslX3xVEiUsnuMBOj7BtqXdBwpMUYvMZIdkdI
	Q2xsEVQqDegQ88tlg3buLb6a42dMOlCwPHGmCyPVBBbIFYd7rMNhaB8XP/sz5HWLeP9+TUy0uvP
	+UsULWB4fFLQTJMS/ajcQaUoInSllJ3fbN2sEE6/PAu29WtSB40s2nYoifIhMme7rTLOIc1s8Ip
	AT3oN988ufalzMmhfsDax4+xYhXvc5mktD4DF8+sNWSZZ+758J1HDc3GwZbkxHqWJSBNC1QBoHv
	nGImLhnrGm0o2YIhSKy7C09HKkBTzGv1XQ+JDzySrvHIlWOECBpPe8xWSIwQj9eNdOrs+CvgqzT
	QdaXa+A0OBRa3RgN71OYk6IKIuXyIUg==
X-Received: by 2002:a05:622a:120a:b0:509:1326:ff24 with SMTP id d75a77b69052e-50ba384b0f1mr193105291cf.17.1774953470665;
        Tue, 31 Mar 2026 03:37:50 -0700 (PDT)
X-Received: by 2002:a05:622a:120a:b0:509:1326:ff24 with SMTP id d75a77b69052e-50ba384b0f1mr193104851cf.17.1774953470092;
        Tue, 31 Mar 2026 03:37:50 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm34178175e9.15.2026.03.31.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:37:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:37:24 +0300
Subject: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-eliza-adsp-usb-v1-3-d8a251be20c3@oss.qualcomm.com>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=raGwaoZcrN4kjJyDEnDCeSeMtBKidjZPyvjh/XLnbgM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpy6P1R7kuo170merMYSitIBN725o728DHYTCIH
 zR6u7rYXdyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacuj9QAKCRAbX0TJAJUV
 Vt6zD/9CYaEN6GHSxgkAMqnsP+s7AGIq2VwuZ8W9RTGHynr5OJYd8/VZlMtlHtkHfRMR0scfHv0
 1e12LDp2R+Tg3zGtJw/O+kqm0QrOv23PYnEtacp6Hk4nfz2Fm6HjZfcwAwd1Urtl9QNcS65rflP
 onTyi02FTkjiQ3eQSgYxQb4HByXLXHHAzQ7crRgWQYSnpaPTjGzsrSjjvSk7wFmi7B6QXG9AH64
 RGzh1ajqqyoiSMJaTAPWWNWG2aHppJz2jC2+rPGvwVU9jSMxVffqS+YzmdTh2kUAVX5tdaogc2+
 Amb+XOtnt4fVeBuSiTiFFrf5zIpoXLLV4bguG5r0sWLhOIMz6OElxascrWddlJe+MmZzTYpclF+
 rkZrre3aTYTYH2iGd323YBIOtDG0fVf/Mdcda7OwK1Bbm/Gedl1z4yHFyYoidotGm4lHpYdRiJ1
 Tl3oEhnaOy8mPGGQEim/Op9o6B77TFcDNwTibR/8hvs9Lzz5OIz+E/A4OktBeJTBe3G5G3inhxo
 TRE9+MQObL3hwezNMiBmAnx1HYXSfnwJTO1lABnfEYCfJlN3vSKHTS7XGiLMoNeY4Eo+Ok7b7L4
 0XETGTHiODFKL8MZSh7EFV3ne2BMCU+5Mwyvl7q8VWaIFKjrANpvWckc5Bgybgc+Wh80oheZv3f
 mSHB1g79uAzzsMw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMiBTYWx0ZWRfX0kqcH18ESDIk
 XcqY5fhrQsY4gWYG31bhgSu+UXY2J3v/MN+m8XevR2LmX8QyXkNlVYW5B57ULj1/gIPnrQKBOlu
 eAPgEczUhH3wDQKCzhFDSv+ljY2LbASbPdRKD+4iF6ekDpkm61Z65TyLiKmsnUCSc+TMkylIq+N
 VuN87XmjIDN0Ae/Bc56HOHpah3YfhF59vSAEs8xwL2fVlzk6H2mJhy2b3RZDGJnp4ntN6JIBURV
 W4sR+4LNzIWkNI/3+A6CNul7CVkYKoTfhChfwfogPGow0jTDxcztHSLGJdRFwd/ZUND7zW2NOCY
 +frZt4vD3ygOT36W9APcY/bjV1KKuLet+vRxUm/JrRxjTnjU7hWt5a/W89+OtHaST/5y3GxSspN
 aJdWqBlN4xjYqsnonXfPUlCse1zXN2rtxlDzoFydXu1ldAYqCi2bAnjiv3mQ2jvLEiy8U1c3J+e
 oabgRCFbaK7/T3p/O6w==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cba3ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XerPLwBTpPCFuubScswA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: wtTlM1-D3lBJv5yTH67sgjtOuNa6jCwF
X-Proofpoint-GUID: wtTlM1-D3lBJv5yTH67sgjtOuNa6jCwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310102

The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
routed through an eUSB2 repeater provided by the PM7750BA PMIC.

Describe the port and repeater, and enable the USB controller and PHYs.

Also specify the ADSP firmware and enable the remoteproc.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 90f629800cb0..c31f00e36eee 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -6,9 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "eliza.dtsi"
 
+#include "pm7550ba-eliza.dtsi"
+
 / {
 	model = "Qualcomm Technologies, Inc. Eliza MTP";
 	compatible = "qcom,eliza-mtp", "qcom,eliza";
@@ -54,6 +57,44 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -376,6 +417,18 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -405,3 +458,33 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb {
+	dr_mode = "otg";
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l2b>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

-- 
2.48.1

