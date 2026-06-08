Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F633B6340
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910243; cv=none; b=DYkafVmXaeNJ0bMZfejsC+mkKWRVy4/GmorKtHT3lw5QtKq/2xk11SfOYelqFVRWNMi3AMP5Ksc3gV8F11k5KbhpWGepu72lW7+ykYCbm+uO9Xyccu7vianR3f0ToEqpfbNJSFj7YCpBal5+PvMYBd1Y8OrBmmy3zmCzPKwGbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910243; c=relaxed/simple;
	bh=16BwiGEPkH7/ysMphuATLsStlnhNmZN3HHL+C4F1suI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dPb1UvatbPpU4k8Ss8en3THCR7CdRC31EqDIN4exMYB9nu4mSIB4tXXsrnZKBdSo+Spo/Tcek9xXKjuq/gvqcX0RvosNCG51R4p9+gtMJqpQ3GEFyFv2VhCpFB/hwPJgsNG34xU95/UtLl0ZukXAhQHTM0EdC2rrSHKsUvanBrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYzn5vz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caWLEW9S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYzn5vz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caWLEW9S"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586R4SK2771849
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uVhpj0+3qsx
	pWXXMLqCXAXZjOaczXJToUdmPlt0GToY=; b=WYzn5vz9NrNOXSU/wnwqrfCokqn
	knQnWkbaAonetqy+597gTMonwfFoGBh+N/SskssGZMSyemCeHTto9s+BTSqPsX6Z
	ltHIILFFuANXWOgTneC2BWyxpC4WZ6+uRHzDrDOFGIO91y3Zsh85NZTFZNlQvtZi
	KVesC09TeDWu8sMg625Yv1tKf9c7VMI2XLoca1LCdLo/CkcDciNCaz2Zkku4KuiS
	hGo8ybv+qoK0PCoYIDavIqcl5o8/9H9Zg4M+OtlESVHcd2bu+GIpbnS7IaOJDGIT
	a1h/AWNxyglmoszYAuND7YVyDzKwAtfzC7yMm41J2mM6rVZdqt5tcfhM9JA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6eych-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:17:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f3041088so402973c88.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910239; x=1781515039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVhpj0+3qsxpWXXMLqCXAXZjOaczXJToUdmPlt0GToY=;
        b=caWLEW9SxuCHxUTR4SgDNNo7xK2GF2P0GFRv9cPlgI6Ruodb80doMjpTrI8YUdMTu3
         TO6RoVkP7SYZusJ57BRblzDy73F5BuQmEtfnGs/LSIGh8VIsFe4JV8sDufcjhZ00Nmah
         a/T8GnHXLhi07WahpLJI3kL34Rr3DEVlfTk5qoKYsDwmcMbn8XgWZ0hn7ZMu59rJ+iLG
         3uBqvWTffOTcj0R4PDrSLDy2pngsWgwpcNkW8aA90lsBh57PUfIQJvUtMwJGbjJaP6Ku
         vSe/bDD8nh08b1DoG8J8Kf2+TDcKWgIRIRlTMY/GHpA5Fjc7eXxtLo8PyZr1PvM5uXMU
         6qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910239; x=1781515039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVhpj0+3qsxpWXXMLqCXAXZjOaczXJToUdmPlt0GToY=;
        b=rGjwhkB2PdWDocWTHxiMIGYmnBHGI02d9F9xQVb6xTpVB397CLvCgLcXiVtKD4Zlpo
         0V3Rvn0kKvzM43TOClY8O/yGvQf9aO9dZAm4ZhXOdOcL8pq78zH7vju3PHanb9IMh4cw
         cJgpP++yBdcO0KPq1it6jtfeGUW7sQW+TZMTm/LWsnvwqREVbJ5FKVh2BU1zuGKGCO1N
         UyCvyXV/PIpBQprQH/flCc+G2QLFfcZeTkd+dFbhrrqEuZwmpkOLWii81UbhPztkMXe6
         O/txyaGdMCAtj9zo4Tp/dsSdLu8pd3gbUQwuESOptnhGHFk5xspNIRJsi/Co9np+/JCI
         Vdog==
X-Forwarded-Encrypted: i=1; AFNElJ9+/7aiOsySbGC6AI9IoxTjgmDlgYjbMhljvfmn7xTTI/JGAluKefjH0sqnTyhuckhKgzlFP2FkhzL7@vger.kernel.org
X-Gm-Message-State: AOJu0YyxuRVBtt1HLOMOIwmjrlqBa2Y9ZWi8wOO4p64pGdRwL5v6Expu
	i1QzL/oZ4Y/0UT32AnH7vjE/CCNX8DUlCvOzPLv3NqKQuDajBeqsvsG4iY8uwQNezmFdzgqXCnC
	SH67VseibKJbDiPYMpergobIxIWnYE9wv0AEhXvUPFrvPdlgRh8oURXeXCroYjnXn
X-Gm-Gg: Acq92OGWsP/g+5zQpK0TnVL+eK/cAZEtPT2ny7Y3fAC5lA2xUc46XCcgqrtqndmbkSi
	FJJbXOKoCO3FZQdYpjSEGLwsu0YcUBpCBTP5jDluDnARTYMuXWCVfo7el8kw5UcQlmdTfHrl/yJ
	HsIvb9i4YnrYDXnbMWlr1Q2GMjlgnd7ijDGTJBTe6Lq9RkyxJICR6XwUArVjncXiisr9EvQmzQX
	GW7G3815D8TIdMvbw8qpbGL15yahdR9zaacKT6096jumqv1bnmJ+fP1ZHYgeTkf7dyA45v9tyYp
	iHDKcWWg4huyAofHjVxC3gheyxvh6PCk5Q3IPGWjMRTYppWR2C/IIKok0NSH26tpU4IDLtu//Xn
	fb/2Uk9UgB4VClJgCO1ZqrFGZNApZpk5SvKyzEPgRh7zbiyqOiX8bNImgGPjXEmg63H/slv/txQ
	tuI4ZiUcQ=
X-Received: by 2002:a05:7022:407:b0:134:d037:aca3 with SMTP id a92af1059eb24-1380676bfb6mr2783438c88.3.1780910238670;
        Mon, 08 Jun 2026 02:17:18 -0700 (PDT)
X-Received: by 2002:a05:7022:407:b0:134:d037:aca3 with SMTP id a92af1059eb24-1380676bfb6mr2783425c88.3.1780910238094;
        Mon, 08 Jun 2026 02:17:18 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm12178656c88.14.2026.06.08.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:17:17 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Mon,  8 Jun 2026 14:47:02 +0530
Message-Id: <20260608091702.3797437-3-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a26889f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Z7u2DObkEaOzrTdwhUcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NSBTYWx0ZWRfX+rGKzkjgdsjT
 u2mqv2o0Z9zC9v2N4sdeoDHl5br73PFEpcArV7baBJXKkEdFrJBoQx/8OLk5Dqkq3NPNcTffU+u
 OjGin1QwiawpyXJer9GlfwyjXnkcComamnnuHsEeU0Sq2cwrHBnt6CctgF3fzxu5HKVKf5iCdxS
 53TXPk8wrqv9qpDEkvjFDLnV5tUPbZFYckKLAySHm/Ai4yeg2FJOprbxx+jW7onMOV1s4XrlpnW
 O2NJaFOa0cOhTI/hGkroyEgxZ3FsG9tvvdPhrgxqaIRshyvR+ejZnKuokWbpR8C2HiXSwjJTN0Z
 T7yULzQjLPtarJFoZN2mBLhgzl8oodTbn6I0ZIDMvDgynkAFdm+DKa34IseoOByi5dfcAzQCi5C
 FXAg0vYGOyjWabuYtEfl0c+1JCwBM/mGz4WQka/L4Ep3vi1g27h76M7paoyEDG+ki9cf9qzEJ1s
 QGraaE6YDasLbfX9QbQ==
X-Proofpoint-GUID: UyoVddPKZqInihPm24JjszLyMf0nbfFL
X-Proofpoint-ORIG-GUID: UyoVddPKZqInihPm24JjszLyMf0nbfFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080085

The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART17 nodes through graph port/endpoint.

Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
lemans.dtsi to allow the PCI subsystem to associate the DT node with
the PCI-to-PCI bridge device.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
(vreg_dcin_12v). Both regulators are always-on and are required by the
pcie-m2-e-connector binding.

Also add the serial1 = &uart17 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART17 interface.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 75 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  1 +
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 34dfc8d22b6a..b2967cb53760 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
+		serial1 = &uart17;
 		serial2 = &uart0;
 	};
 
@@ -88,6 +89,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart17_ep>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -178,6 +211,17 @@ vmmc_sdc: regulator-vmmc-sdc {
 		regulator-max-microvolt = <2950000>;
 	};
 
+	vreg_dcin_12v: regulator-dcin-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_DCIN_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_sdc: regulator-vreg-sdc {
 		compatible = "regulator-gpio";
 
@@ -191,6 +235,19 @@ vreg_sdc: regulator-vreg-sdc {
 
 		startup-delay-us = <100>;
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_dcin_12v>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
@@ -742,6 +799,14 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
 &pmm8654au_0_pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
@@ -970,6 +1035,16 @@ &uart10 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	port {
+		uart17_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l8a>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..9afd6e8ebcdb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2779,6 +2779,7 @@ pcie0: pcie@1c00000 {
 			status = "disabled";
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.34.1

