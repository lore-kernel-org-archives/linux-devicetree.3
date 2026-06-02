Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF0237180
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 07:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383942; cv=none; b=R2YPzAAt5G9R3no+W/8st4nt3bbLcIm2hBQaw4vbGWgAYiyNLSm+GYz1e3J3NmbY67yYUZZF/LN9VG4zb3N+qjjj8isqXVvJdDGBXMGyjr79+/GU5bInfjCcxLObTkUEKAdkxdDwcCvUokKnoa1lJslkJszUqCi0kUMN/W6A8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383942; c=relaxed/simple;
	bh=M1z4d/AkWMR7KXcpNBR+aKejM7ycMN5MP/ihy5uwn+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RHpHHMwxAAd9sv6NaqwWxhEubfMXT3TJSoNHJ5/lfAWPFvAe0lXycjiE26DHc6i0BUm7HbFVRx91daL24nIDM4tEOwpCc535bDNjL6JRNyfuJo0isicNnO/hMIydy2gk4U6507mnYCkHLT7rmZ08HNODC99mpY4LtAJtftPivxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gty3hKHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOz96wZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gty3hKHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOz96wZJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525iqnl1316634
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 07:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YffJt0zE+Kte35o46jx3rRp1xZd4ANe81of
	6Ua9ODGM=; b=Gty3hKHcwvdfcjvRTZKukoG0iNdcp5QsmhZMIBM6Ux1+AhtpSaX
	aP+basxry/Hj6zl5lt0yjE1SqUdbBdp2xZ1sxfiUrlG0cZ68vx63LONGJ2RHs3lq
	YMu7I5euYWZUISYapTBhmg//dcR56PxnrtNMKoWrZTvscwGdy1dt9neojk6wH1N8
	PA0KXSwx1jimP2eBkw5fEkHR1EWHg3JlXu9H2dZkzDDEImMZnEC0jkKIUb3I+dKO
	EMoZUSCBos6y8xh1R+wi7+vpDA/HrYk76q84q3O0wk+NcubjbM4bCLefcAN+49vD
	1u1CQ59Q9mSSi1PG1S0UQQ0rqitkUyMBCyA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vraj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:05:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-135de949041so19192145c88.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780383939; x=1780988739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YffJt0zE+Kte35o46jx3rRp1xZd4ANe81of6Ua9ODGM=;
        b=cOz96wZJKFFYmhDYgfbesCWD+kIsNsvvjqpJqVWKMm7AmbKyOkqhglrzYbuNo2uK5X
         eKIjChezgDOqNM+f9/rr+HTIGCS20nIL4bAu+N6NaGO9OgfBZiXqGBMnk+KCap+A1GZU
         gvq1YuzZfTXLgAG8StsoSSkC7D/+4IU4zi5Ap6J6XjxAhJGvjsENnyM8pxd7E9RdmwJ+
         S4TCxHyJPUdHj0Zl97q9Hg9xZC6idgTdwUfTceF89mg6INBnuQIpb7aZ4gyVCwxAEqFw
         thriIdb40UNBxg7WS38u3vKCk9acb5YqC5jnudZiJU9JEvfJNO9TPBZTsD4hpjKxNL6T
         wjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383939; x=1780988739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YffJt0zE+Kte35o46jx3rRp1xZd4ANe81of6Ua9ODGM=;
        b=fmSKr8XExIX8UuuWjS2hEt7J/A5tKQN0R2q4JuW77i8LeagEIENd5qmPYb7pQby+Y4
         1dkq0WTFE2SQhfKCOrEkoPFxSOEOluUxRZiQ8M9+NFDu1BZujYEv1OqGKEcE5q6kgGP5
         CHMRg3eGWJx2q+Boo5SOxxNcbYEKdYuW7bACVp8VHtM1HF6w6g48226tP6SkZ2kd/10e
         0nf1SPu9r2U2AsDM/PIkUtoN+yJ/hNmDXy5k1bbC3m3XByeFtpRgKFQBrrwc6/cJ96Lx
         vLVe0hoBfIkHD7wnIWx0jl0N6XM526olmhZD/NLbSlaQBjq6jWQAJ1BuM6ujFJX6+3Sb
         dNgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YkeIC26F8198vzSG0HAtPgCvbliMpnZmbffHogcW9TY66BO1OCt4BQ64pVa8YpdAfBOeI7ZGZ3IvU@vger.kernel.org
X-Gm-Message-State: AOJu0YzzuLDz0ud4DMfht9bWxw7PCqHDX+KUm7tlrWQsRzVaccnUQ4/q
	6bEaL806vyDD0bOM6p8EgLzCDNO4lachzondqWkx9i2cDfl+PLM/Qm0Pczphuiy6DJo3b+/HuFa
	afk5WoSAWj+FYIveLly8IBubvbsmERoMf503zo3w46JncpWKNdZyeTEsW8BEfc1Ta
X-Gm-Gg: Acq92OEcPZPWRVl3SqZUALC03is9tGpfqqnbgjhJLfdcFCLZBLracsa4KDx+a6YF5AF
	8KHyU75GBryjgfi7/gDplUMNloZndKf/xAAh2FI45w51VB8dEMRIZbhP4b+qGcLGCibqlg5VqRQ
	2QjvcR0u76cjifTS+muELPZ5E32nAcUH2F+YBgdeLC2LiSjYrIkJpCyoGQYlTbikwnOR7iSzoGv
	scZlhMuNxOMbJuDwqO3nGF/Q5c1TF/mlOoPkPjBwXq3gy2uRE217MMXo17WkaC2r+eVfVBLVDzK
	RkKL0d1gEFbk21fH3vsnPWaF/kSpOuiTwexMeP5l8EuTScMMCyOGd+2uFLVAxUW7gvwTMQXxW6+
	7Vu981PiYZEKach79VYvj2+yhP0QHqQC0zOKXN6tRFuNMUULKXkG5Tj1HTA==
X-Received: by 2002:a05:701b:2211:b0:137:ea00:3f49 with SMTP id a92af1059eb24-137ea00436fmr1092253c88.35.1780383938589;
        Tue, 02 Jun 2026 00:05:38 -0700 (PDT)
X-Received: by 2002:a05:701b:2211:b0:137:ea00:3f49 with SMTP id a92af1059eb24-137ea00436fmr1092243c88.35.1780383938004;
        Tue, 02 Jun 2026 00:05:38 -0700 (PDT)
Received: from hu-zhangq-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137dc179940sm6834129c88.5.2026.06.02.00.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:05:37 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
Date: Tue,  2 Jun 2026 12:35:30 +0530
Message-Id: <20260602070530.4194262-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wy6m6u4t9TGEzlI_yECHUfYIscQoMTq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MyBTYWx0ZWRfX2fdxlsTToGae
 pdkjqJFWPJL+iFQUy5fuktWr0tn+k4vbgMOSxLlsI7Ymrtg/auG8+j3jk4SQli88MeCLJ3jo91l
 S08d+2VPIA69CyN2slV99bi0G3bXVsJ5FYgXCkOGcTDendyqVL1xTT3E8RyDvEAyPxy7Odj7OCc
 LozT56wgmUsJFi4T5zmo5Nselcngg7hych7+yj0x+wY9KBHDAYg9YeCH0fvPD00nItOosIYKMEW
 ywdhRhH10fWpW61RB20WfNuAwyumFRbM3BehTMY1D41r1W0bcLLqWnzTmGfJog3AEfyvkCY5/Ey
 wI6KNDZ1FXA76yCopLTUATdT/8ew/E+d0/SM0dm0CO5qAfS1V6SRLVUHmgDu7iyIhJn149qEKpd
 paxNFGwDx9IEhOYhxBN/I5moEDqu0h8I1k4tykUukOOxagZjwLDwK05w9vgY0qlZUlVnx/qVbfk
 gsrt+Nr4Iynv+rZx7lw==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1e80c3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=GbHRhdJkuxPqJwqa-VkA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Wy6m6u4t9TGEzlI_yECHUfYIscQoMTq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020063

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

