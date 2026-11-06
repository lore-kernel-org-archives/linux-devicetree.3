Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956908;
	b=QWWKrbZBy/gQgbzNH23wTfWoU4RykDBHHHyl8edPygH0k/wpp5vwwxuX11F44ChgPHBy
	 IrsTXFtH8hKE1JRv2X1f87vwHenoqzYJc0tXPpYZnPTb87Yt2okqcLfY8OKXqQuhnJMWO
	 9TvYaNyXSwdV1nKN01WB4CTRoRCBFSUAdQO693ZjxKaeFq5Mid8ZKjD6/fPrZiY2RMQEq
	 2H7aYnVsZYhbYsmueOVmq6jVeAamXzu1JsXxv7qplUel/370L/UpHvTW4wuuM1aYfIBks
	 x34VgbX2qm61F/uBSzsU8epjmy03RvLjhYHLt5G8isXkeJDpvD+j8WeBF4s3CoLSUhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
	b=P9TBwWBNoa3RJ0nwaK8ymYO9c+q3TwpW4cpxACpAIXxA8yt3OMbs94GbUjYQu39ncUY5
	 fX6OYVgjLFYPcUhMEYJAUa5jar6/Z4KNTJPhAfBiYRjBXdz5aNkZ6Mr5KNmrTNdlZOjFz
	 lRMZoUvuURwKx4sLWlkIacTIeOeH27dxrwvzKChEvQx84d9ROcKBGw6qVFW532+TFk4wj
	 U6pKPIh7ZrJXUGd0zNCYmMm1JvpUESIW7pUqHfHAMrOMy21Qg+gGeunWJsuK+d3s3ogXS
	 k4C+f4LGiby5V56buLSNIgjw6AKb4Q4WHByYPlxRZ0aVuMKwX8r9AvpJjREpq8FKxug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Qzsi/72D";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYZ8YJ2H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D640606EE8C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D640606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzsi/72D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYZ8YJ2H
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJVf1679494
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=; b=Qzsi/72DOJQ13oqI
	mXu0jlLkGfUFwwgjMZ8Yryu7Vd+HNv5eIzTngLVRCUC/9n05iNdYPF400lD4ddrk
	gXf/yTUA8NByV2T6ZgHJmjzXUppwgHjW5R/On1+LboaLEBrXcDOwi5aDgHi5zzvT
	yUCmyfcJtLDFizw8qTn44JsCBcvH1H7+qTV3evTQ0s1Y9eOjPkfIewA2FDPtDxku
	KBc5is6OgcyYTVtF+hbJp08B0eCB+OxkXJsoOakYQXAC/DlkQP2cvQ90ZQL/K0Pz
	s6rRN/jvTa1MeRnnZR6R80OwaYfpw4XfVA7DttMUHA8jcg4ByZMoV9CnRyrsI1da
	Jbt3bw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 09:21:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1784093eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956907; x=1794561707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
        b=iYZ8YJ2HGyFH5qCB3AHIwltBaUFxpuhuxwbhbH48RKmKPfcJCfjWJLdv4yZu/0Tini
         kZE/6nKMwPlk+YOeTXQbIM7AfAvogDlFz0LWUaH8pOaErc7gEfZQ16y+oAtNlq9VfGRD
         dbOzEpkxWBrowIomW9kea1t+6yKvSKIL7Ue2Ra+O2D8wpzF37IIrk1q4AOhiEJOPUd+7
         /R3m74zU0zVfba1FCkZnzl982cbAqfxL7LugffoQzgKuxJvcJgD7MwEqFFYFKhE4IE/4
         M+HxHSQk814YLnONrnBEYTYOePovLe1glJ6E7sKFDCn9kS1QKr6+VjaFbS63616Ztsqe
         KfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956907; x=1794561707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
        b=VL/tNp+e5/usk4RhjP70BYmqJsR+FsBhDzgRAzfWaPMZqX6ZJ16JpOsPB83RmpBpgD
         WCU7Kf9LUvmMEqBSWjY2aAQsg4+/T2v4Bl5GrLoICwbJLKrUWbK3NsSWOOptkHX1+HAa
         Q5i5M0XcDDOU3Bd5MZRMsZ05m7v1Jvksekw1V5lmZJb/FxyEpcS89maHT4sxHKdL5Bkf
         DbR8AtLrsowvHPzdkeR3pk5IQmbdoWbp+ZI+dCj8mUCsDaaKgsSYfSJu30SCe1hsA2wb
         SK9s+Yemef9XuLhGkbHib40qmJrG8JQCK8ZPlAse0+9x/MR+RV8cKhmlrQi9Xijd3mb9
         P2xA==
X-Forwarded-Encrypted: i=1; AL+hErGn0y2L3sW0PXhC0sepwVere4L8xU2gvVmjRDMGaxtIcNhq7vu9rnMIznXqK18d7LDuC0TASMVpD3mS@vger.kernel.org
X-Gm-Message-State: APuU4Z8GZD1xrYfz2F76QuJ/UxDc+mGm5WsyayvoUZT8eqLkwa+9+nuy
	vOC63PQCUxVPjs37IkXnNOSXelY6WendGdTzKpcSUljbg4JDK6R9OqsdrFuDvvjp0gyOQ/1zz62
	by64dL2C+M2Kq08oQ5nHT6oEEU77WoJA3hevOXr0xeJ3BGrSmQXpsHMF+ffU6vrAf
X-Gm-Gg: AYBFou0SE/FdTdTSiPWW9WFvhWxRDy6CxHMS6aDc/AHcZ+uLS5wQg2OfzKzTb+LDKXp
	bGe1UjsI1PFZn9T+0Fx8vLEdifd2zE7UdFKxB3QJNk0S19cGIeKJ1mqWCWbgs1dlkB5A/8t2QsF
	F5sf3xIDuziBusgw89FOwwyXH/uu+ttyO0s+xS+DbgOcY0SerSpk726v3kdbXZxcIloxNJ4kkGe
	XEvqqKv/URRrw8TN6ceZwfqJhwZQiN9GdfUfS/qEPouxrnlqasgBOUJcmTjYW6KSQksned9AV27
	4zFv+xmtNnoqEusxCb64C4gClcCX0PbzPn0TApin+RdvdsGR0pAUxcGrFE21oUbEbu6ig5X0eSu
	KuxHXy/T0KNpv9vCpBRPMTxtiSz7kKD/v3v/DWrIs3Ru4HGAbTc+K7DXxb0+EnVubKoEOazVPfv
	u+DlG9y5zZ644T4DN783vZl2fFaI84szwbKobg4lKEx3Z/WCxJ1mx7MbMY/Kd6YkflCDKtbBal7
	WgcTA==
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr2886626eec.21.1793956906828;
        Fri, 06 Nov 2026 01:21:46 -0800 (PST)
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr2886579eec.21.1793956906180;
        Fri, 06 Nov 2026 01:21:46 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:45 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:58 +0530
Subject: [PATCH v8 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-08-dts-v8-9-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: DXCdMMG2YzYNAalduJJTBhFaI4y2M2iD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXyHn00sq46TW5
 /+0m6kviB3fLNUPsT/O5D2UWR8QgcbIIDkvFX49QiYpU4KByHrIrbMQSw5rZWrTtFRbsyEHflJ9
 mJJBZ/9BkjYNLA3ydQt8wlFLKi/sIWLRSnmwIPP7vD7HDyjiaKMBXmtDOPDtIdF8CKwslu1McmN
 5jJs+lR2as8q6oZ7Sl3NHPUIUKPs3ar340ZYc8z9Iv77YhhwKMcEfl7LxXIMtgrcMuJoKY55QPf
 auv+Qx9bPZkEbdwhQnTrDfwEPfZYon6SRDfhUK04P4zIBV9/hggKOTrwshKL9SQ+AfTe/l3MjB9
 DxHa5VdMm0NDBBDlagIDG9+xBfB7iVEM1yTzOCy1tVudtCmEeJFzR2ANLn0WoxvqwU1LRV29AuM
 qRsPIurjAjHKmyT9KbtNfHymmEZaGCqr0g3wxJDpkHNT7thYcB2D9q3H+CPySwjJhbFrzXx1uMh
 oOCfn9/2HejFTtrbHVA==
X-Proofpoint-GUID: DXCdMMG2YzYNAalduJJTBhFaI4y2M2iD
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c2b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GVWKzDYot3hTMZ8E5o4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX8m9+6QYX8foN
 EjMrlWYhH4qKqQszl6zMXEDYBOZq2JW6I2GtsOpTKU6v4IGGKPJP+myzT6gTBTKltX/EuC/L/Zl
 X7JfGimqeqMDbslp2ox4N1i1CmycGAQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 47 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index b32daa7c1559..8068dd0d2119 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -191,6 +198,15 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-pins {
+			pins = "gpio20", "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index e4a696a65e55..35cd55881969 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -160,6 +160,14 @@ opp-300000000 {
 		};
 	};
 
+	i2c_opp_table_32mhz: opp-table-qup32mhz {
+		compatible = "operating-points-v2";
+
+		opp-32000000 {
+			opp-hz = /bits/ 64 <32000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -435,6 +443,45 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

