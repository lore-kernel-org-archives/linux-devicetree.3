Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219F1347BC6
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384247; cv=none; b=SpYfTG3/hweds+p1SjDPJyPHhuej7HDy9XN1ZSq6Nz1o3ALUY/GA9D74osw8xuRtxlkpRvGHs3UY+QlYhgv/g0/wOaw4KlQmhLhv4RiyGt2mcSs4+s1QBKhCytKV9Dod7j6MFihvKgC3EsgY1x9bMpAnVt5K8t7U7jUxQr/sFzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384247; c=relaxed/simple;
	bh=UOnQFRu0U48hwYAzKknwcePfAFZb1FJw7AWcMPjRHdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GFbvvvPH3+iYtqtBfEaQJIT0jFlYjKuSaumbsOT/yvyp38xcRasZgYuK6GXVSnyLgOghgsjOSAMb7T03Q+hOoDf+vL7nBK5MuiwTcEjQfn36hgwB12CzwQ91HAHzB16BBp8G8QYJNnyaAKs+xaAF2F8eT3/Fb6LIAa8cwNcDRe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NulDPE2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSnDl+6Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NulDPE2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSnDl+6Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65218hDm3430226
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 07:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0prCfBwXxcW9cW9jirWBk+0w3KssAX0zPFp
	KbxfBzQM=; b=NulDPE2ZD+50OvBG9jTmCt7bdeBcFszl0NLH0QJRXXwtGKsJHsD
	TETJ2vY7qs67iQo4DkkNU3iCS0BlV196Gb2CD5W/7UZSh3UAZ5CzLl9f4PnZEhGq
	dG8ykVx9Woz42+2aPS65t1he6iAHbsWu9ecNnY6Thi2X4MRooNStNkRZwYSdJGcd
	7Q1JZH6J62uIhE8UvBdhFakx0h/y0WL516V40mwtDsGLIup9/WkfEyLCd3zD1KQ8
	lWNH9NtdsTxogkq+ciQb0NZ7gWv2eNeOmoWa1aUXBekpkg7HxaRRqQ91BbvizUhI
	LmmIQHsXhreKXIERHClSDKpjrOKuba6az3A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mh693-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:10:45 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137ea73393cso4703726c88.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780384245; x=1780989045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0prCfBwXxcW9cW9jirWBk+0w3KssAX0zPFpKbxfBzQM=;
        b=KSnDl+6QwWEyz689Z3KY4dbfkvYtZ7QKH+yo5ukZYw+AlFCGt5FHyYJpU6YHllDg64
         xZeDxBDDExLjF/MJMkn92LVgpUn9QkAOS78RYXbVk+eencWzkxTgvmXg08sTQBvwK56q
         JpcLRRO9YPg0zitJgTkOMKgkF+F1Ud6yXL9L221iVNKnfzFRhFA/h96vfgbLKfsUaOop
         riKmTwoJRuchDL9XiNoqXuv2VeNb6qy/65bIEwQ6vzybal5Zwfeaj0ShYiO8tCmJH3d4
         lp6Wv4NASzrs0Lc/D0FMd7BDdaWs0orH19D+5jcOkyCwDfwTFnNBFj3y2r1rxTZyRFJZ
         kfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384245; x=1780989045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0prCfBwXxcW9cW9jirWBk+0w3KssAX0zPFpKbxfBzQM=;
        b=l3SJ9dnLAPbJJseNvQYAufcpqF9bqhEcXIC0gpiBebG1s8k5bDSqhtOCWYqOR55ikO
         qQ/x5w2y/Towwd1WMgEfduCeE8p95gKvyIubZx95hd+icvFnFIguh54v9O5EnTiYzOqu
         rYonUC11pxO4lKPO/Hy5rIV2RGjEyFF9IpAI/Jb+JYwcaoTnWAfZLI5z/Qc+tquJjmy7
         vw+X8DfuebBUoBwFkRPar3VmYXgVMFP5y61QPlur9ZOsynQ9WpIcOPS1UP3tel+LSWTT
         rOKxDaX41YpfNhb7jeJfZgL5hlnbSp2MXZRzzcbfu1EtK13M7HKsIEqPvcOx3SRktAFe
         PdaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MNssQzd+7n1O0z6hzbRw4BdDemQ45wOe7rPJBarUXwL0mZ2kmUgLuUv956/6CMQuPYWCIiW1b5ooD@vger.kernel.org
X-Gm-Message-State: AOJu0YxacV4Vc2bMesrikdbFS4m7Rbr68TKONCdE//MziWciYWYsgjiL
	vDvjWL5X5KW70HDl2dhu15x4W/lM8lWcHIx1b629TB/7Fcb/7L683MNZs7B+0+mLfPhqONHR15I
	64Y0xD281tOUxgGq70Cjp7Fun+7Wc9lQm8lWoKgDrpckNe0R5s63d57mq3Z+nuaRo
X-Gm-Gg: Acq92OEQm7EMb2Q27y2bK1Q2nMbOyDNxNI5kU3alawbcNDVs/msLQ9xG1PcIs96e6gY
	arBpse//PXFWLk4bTn01sOerxH8QaSFRxLOg9yPlCTutbCvkZiy70P0adIGnhQXyChZjnZ0SU5i
	v8lX8OAdm30NiiPXcZYqGBmD8YaVUyKC0vUPUAUjKfmRUGZB7y/acTcMz277fiZK4niKBL41g8Z
	/PLb6Zn94jDupiC6nJ7RZTx8MUJSUbweMEzAG+8oIF59A9u+fVIKmWURzCINFC1sa2JfbNi1JUN
	OcrnTV/McnfpauHjkSrL5iDq8fv4+XAivr5ocMlqmMqfRyCg/91dRG4xejrf5qONPhki80w+bz7
	VEL83NmUJBrBumFGmOIS1opcMcZVHChSfDTwA2nPS3IW8xD/LoFzcGVFOcw==
X-Received: by 2002:a05:7022:60a4:b0:136:da48:a3e2 with SMTP id a92af1059eb24-137d4283627mr7043593c88.27.1780384244569;
        Tue, 02 Jun 2026 00:10:44 -0700 (PDT)
X-Received: by 2002:a05:7022:60a4:b0:136:da48:a3e2 with SMTP id a92af1059eb24-137d4283627mr7043566c88.27.1780384243728;
        Tue, 02 Jun 2026 00:10:43 -0700 (PDT)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b2d04287sm11108335c88.0.2026.06.02.00.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:10:43 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
Date: Tue,  2 Jun 2026 12:40:28 +0530
Message-Id: <20260602071028.3810-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2NCBTYWx0ZWRfX7Bs0kv6GsCn+
 LiHLyUIvpTkop8y9reOM2BnSYpUm0AxPVtvWJ9HHzbXFzK5kc3jvGG9QiVUWCT/qi1ncLn+pkgL
 7Mv8FVkAbN+0TsOI1jxXPWztvb3mvyzuRUekWFu4TwE50WJehDdlI4KFvfBiCb1TZFPeN8gUMtY
 pox/D+Gv7vDXoq6QVlaT/mzHkGF7kaZUYPDmJrgDU+aLZKMMzrZQcnBkxUU7+bwffApaZC70/xt
 ++srfj+VsmaKbnlAzZv6KAledq/6Ol228fbDQm2g+myZr6L9zFylBF64R6h3tL9C0sk8yQnL99Y
 Ca1UF7D3wnAKT7++XfVIqgkUTQGC5G0oTcD0P/V6+h6CJN5UL1EfIYh4nNPULuZkZ3cau80YMaE
 J3DZL6/wzFr3evcX1yX0UkCBlZ7wYwK0W20BE8YWQMvPihOTXSJTFU0x9QWb1JteSGm9qeXTTRH
 lHb2MPXmaQgA23bSuUQ==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e81f5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Zrvy3XWoeDs7RjMT9-kA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: o9Ra-EErqjLyl9QuzUUJnIZt31iOS510
X-Proofpoint-GUID: o9Ra-EErqjLyl9QuzUUJnIZt31iOS510
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020064

Add support for the QCNFA725B M.2 module (WCN6855-based)
connected to PCIe0 on the Arduino VENTUNO Q board:
- GPIO54 is the W_DISABLE# line on the M.2 connector.
  Pulling it low disables the radio transmitter at the hardware
  level. It is modeled as rfkill-gpio so the kernel rfkill subsystem
  can assert it in response to airplane mode or a hardware kill
  switch, keeping RF state consistent across suspend/resume.
- GPIO56 is wlan_en.
- QCNFA725B provides only a single external 3.3V supply input.
  Lower voltage rails (e.g. 0.9V, 1.3V and 1.9V) are generated
  internally by the integrated PMCA6850 PMIC and are not exposed
  as seperately controllable external supplies.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

Changes in v5:
- Change rfkill-wlan to wlan-rfkill. W_DISABLE# is active low.
- Refine commit message
- Link to v4: https://lore.kernel.org/all/20260531071409.3557734-1-qian.zhang@oss.qualcomm.com/

Changes in v4:
- Replace regulator-fixed + vddpe-3v3-supply with qcom,wcn6855-pmu for
  GPIO56 (wlan_en) power sequencing
- Fix module name QCNFA765 -> QCNFA725B
- Link to v3: https://lore.kernel.org/all/20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com/

Changes in v3:
- Replace regulator-fixed with rfkill-gpio for GPIO54 (rfkill)
- Reference wlan_en from PCIe node via vddpe-3v3-supply
- Fix subject prefix
- Link to v2 (wrongly named v1): https://lore.kernel.org/all/20260501051918.1990713-1-qian.zhang@oss.qualcomm.com/

Changes in v2:
- Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
- Improved commit message readability with bullet list format
- Link to v1 (wrongly named v0): https://lore.kernel.org/all/20260425031712.3800662-1-qian.zhang@oss.qualcomm.com/


diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f..7e045397d649 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -154,6 +154,78 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wlan-rfkill {
+		compatible = "rfkill-gpio";
+		label = "wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlrfkill_default_state>;
+	};
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en_state>;
+
+		wlan-enable-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply    = <&vdc_3v3>;
+		vddaon-supply   = <&vdc_3v3>;
+		vddpmu-supply   = <&vdc_3v3>;
+		vddpmumx-supply = <&vdc_3v3>;
+		vddpmucx-supply = <&vdc_3v3>;
+		vddrfa0p95-supply  = <&vdc_3v3>;
+		vddrfa1p3-supply   = <&vdc_3v3>;
+		vddrfa1p9-supply   = <&vdc_3v3>;
+		vddpcie1p3-supply  = <&vdc_3v3>;
+		vddpcie1p9-supply  = <&vdc_3v3>;
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
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
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
 
 &ethernet0 {
@@ -348,6 +420,29 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pci@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			reg = <0x20800 0x00 0x00 0x00 0x00>;
+
+			wifi@0 {
+				compatible = "pci17cb,1103";
+				reg = <0 0 0 0 0>;
+
+				vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+				vddaon-supply = <&vreg_pmu_aon_0p59>;
+				vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+				vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+				vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+				vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+				vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+				vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+				vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+			};
+		};
+
 		pci@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -449,6 +544,19 @@ adv7535_default: adv7535-default-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	wlrfkill_default_state: wlrfkill-default-state {
+		pins = "gpio54";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	wlan_en_state: wlan-en-state {
+		pins = "gpio56";
+		function = "gpio";
+		output-low;
+	};
 };
 
 &uart7 {
-- 
2.34.1

