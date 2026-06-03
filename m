Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C346396B68
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 02:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780452013; cv=none; b=stB20ZJIqd7v2P70SzkNHySuyW8/eeIHgeU34rXlUU/wdGy9SX7dXJ790AiiX2loZMBRsJi2XIQLkMtCFnZ7iE5j30cEVWbCHQM7MYpXTTRE53FteDnhX8YKdUtOgEN37zsvDbODvI637MazXMEFyVVlZRJxu8DwXyOm7ShrvtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780452013; c=relaxed/simple;
	bh=DiriHkxQBNQtpfb6jcC9iAgcy81cVNXDaqSL4Lor/go=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D2Ui8xTo495GL+SNlQb7GSN5J67l0b2fZsN9q6OvYManHywu861dQqJLoshH3HJossBKph7m8Mzr0tohBDnd4YZ1bLBSIeuTjhqnalyROKAuTY6Al3BPT/zCtUOBptC1ha+078izWpThp6TM6qOCa2dNTnBl0pG1EZ3xXXpWktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oIE5zmDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqw3lm9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oIE5zmDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqw3lm9c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65318Pl41260395
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 02:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LcNrlUHYv+FofxZOQiUgqQOI8dtRfNTi8nB
	Nq6zOxI8=; b=oIE5zmDmsrCQJzMY7pm5mJ3PRJ2lvcFwrqh1l0SW83PXztzlhPd
	RD3XMfLqqZnyShxxtKfHe5Df6Z7qTmWdIYaQZU4xJU9k6B2uHp/N/fRo00fQRKx8
	fGN8N1Filog9GCnwDHJq+05cpjy4U/1SAie2RCJBF7yWDmyjTeq1V+b7IURfsLd/
	hJV+p5TYe1WFOeKc+ORzHcFRL6Q9RZm75ESq0EleGwF1H8KGbue6MVFrj6dArztb
	wHQdfV274Spor+kvGxKAcPk4KMJcCwk7hnA6trYJPqCH06pvwb8ox7GJbnXlNBZ2
	dq/TE9p1KCQPv5MkvFeLhTH1h+MUJSsJ7Gg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgg53w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 02:00:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3074797dfa9so1405428eec.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 19:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780452011; x=1781056811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcNrlUHYv+FofxZOQiUgqQOI8dtRfNTi8nBNq6zOxI8=;
        b=gqw3lm9cxMYm3cSdBYCt8zcXVA56CoWYuxX0VnbLxe1nlC5t9SPKyfk68rmoweIClW
         iuoyqdGSNT+ncGyygl+6GLp5Er2JCY7vo+oj1E5qygQvoOGDGVHk4rtJClFswwH4JdGT
         BMyKUZOrKdwNR2njYlN71ylJlqyVJ7nmEr9t6wuotLGvcV6iwpZ3uufxoH620WzSuUu0
         8k9NsyzXJDP3auTfbx4GBTfy5skQJogBjtMa9WzCalk/NH+8b4abSgh/1FbUhO7Ddza8
         w9Zbf0Pvk3vQ2phSLU7QvRKNqTS9fyl/3dO548MVIiw5UPOl5vtzvE9CshRNmZuhnluk
         lU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452011; x=1781056811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcNrlUHYv+FofxZOQiUgqQOI8dtRfNTi8nBNq6zOxI8=;
        b=LyIBJYmO5XX5Q8PQGPGER3nCNEP0EMyahE+w/d56DWjzMIs3upwqXQWNm/7NjsEurC
         /usqiWrYaBV8gFabP/2M+J0KWvHYGGzWn25EPxANUh4+iw9YBy61Txc5W5WshNOWkpxY
         zB2iPR+WHY7egpP7i0bwDaiTNesm50G2Qvdp3THlupBZDkUp/jVpoUJqbwuxwTMxtD4G
         6MwW4HheXtXoLCpwCb9IgqArpVod/u5OSvCXN6atPqr3sEcQsc5FDEkK1cpz6zOyS9HR
         241F7XfZN+hSfK9JkllTvmJpR7xHr1Xlz3fxJKSHEqAAgOkptJ9f0bqvl4R0Ioe1oRdu
         hWow==
X-Forwarded-Encrypted: i=1; AFNElJ+XTg/ZQT+p+rNV6SGob1kRMLle1tVnx8Qm6UYMwXK0gwIcsb5Hwfnx5xkXR6jTQq9zILfX6rkdvPo5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzzj4yLtaQiSMQ05bEnqujiJF9kPcLDS5rB5hLbfp29rmO0ul3
	6DXPUd9xjAVkE1frL7C74jGUxP/OQ+taP47kY7P0cdsGn7aQTgq+TPfTVqHl8SKMF44VbnEye8r
	zPvFVXq73vbH9FRstDrWl2gT9B6D1BZXRua1b/WsfGyw2RhciSASuIQOhDXrQXYNV
X-Gm-Gg: Acq92OG9Tu/Z45sTsVdqLH92dX86mfH6i2T6DikA4FY4drGdTi44ddg4J0qpSUkd97A
	ejrwwtoyZnwf5DB7um+ri/L9Ge6FEXaYV/g08+X159y4eJq98e7Bq3PUhNQkl3igrGpAA8Yj1Ss
	kLjpuWOa2kEU8Ubtl2sGL1brpDv6owVcG8oGIEANqQfdPWj2JH4nf4IjY1Gbai8hjmmQNk5vBjE
	kxBNIH7Hg1wbFnhfIO+XlrKWlYHIErO4Nl2teJWLEJxIj0+P5KpEKaaoI9z8a6hFMxOw04uko6f
	i2ZumzJaKM9PxoamhnvAmMFsbewZBQX7VCbH2+2daolRmGbKCSPqGQloND++lKaW8LZthMtb+Hd
	cjZ7rrBQsD9LQnv5A74l2ZeloJYWTaZaxUez/9SaKIHrVRNhZ0wMiSJEA8A==
X-Received: by 2002:a05:7300:c86:b0:304:d388:c33e with SMTP id 5a478bee46e88-3074fa4c122mr718668eec.1.1780452008770;
        Tue, 02 Jun 2026 19:00:08 -0700 (PDT)
X-Received: by 2002:a05:7300:c86:b0:304:d388:c33e with SMTP id 5a478bee46e88-3074fa4c122mr718648eec.1.1780452008021;
        Tue, 02 Jun 2026 19:00:08 -0700 (PDT)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074deaab1asm1043882eec.17.2026.06.02.19.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:00:07 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v5] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
Date: Wed,  3 Jun 2026 07:29:58 +0530
Message-Id: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a1f8aab cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Zrvy3XWoeDs7RjMT9-kA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 3qNudZY937Y9R7nGfvL2ZzLl5d9xb1Zp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAxNiBTYWx0ZWRfX5J5pTcYqJ/Ec
 /Qj1YII9EC8paN8SbHRXlrTleBgQAelq0LXgSxYjmcMmdKIg+RVVbjkb01X7dCYK5ZLIZFB4smv
 IX41x7hQr7xf2nkgrs4leQoNHwuLlORbaN8u2NbvLQhrackDhIPj4kM6XWRuGdtqC8FMObEdWWI
 ndThtOIeto5/L+f1d0t7PjeHV+6p1OXNDJ9zpH6wowzxxypyhrXl+WLYSAidMJvYJBq8XUvYO2g
 SPLvw9KBFUo6AnQnGM+CmcHTu7gt86wROWp+sPs7n0kplrZcJsVAg1CRodQEIovt9z5FyWahzft
 lAoZdxA/UFE+1JbdKo+ThzOSE4PfYdjRKC3KSHzRpITMyD4l1TglL6F2UPzBPeVwAvm12SNtU6U
 kHlgqOljx46t2UCw6NeLmjXpctehk+g5113wUMq6vxc3PcrF99P4XcRWR8VA9qcbqVP0MhKooDV
 0M+BC3FWDsWn/sJScog==
X-Proofpoint-ORIG-GUID: 3qNudZY937Y9R7nGfvL2ZzLl5d9xb1Zp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030016

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
- Rename rfkill-wlan to wlan-rfkill.
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
index 379b796f261f..c4011ad51074 100644
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
+		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
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

