Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869670;
	b=QdJ9AQNaVW9DmnbENBmJMq8uGxJOESUd6TfQL8IINy2ae77txCttMiUFPyr+F3OT5ahM
	 AGDZOfHUmvk4aQDurbWkREliCjuIF/UMof45gwjoTHTWznGrfneDvD3ioUzEii595TK7d
	 EHIRZs7BXrQODg3gBVE5zEVKmCV/lo9q60ow4KyffW7ag3qLPHSvwdHANB1jmmRt/KSCx
	 306ebv1u8zIsFzLyeYSGFfImhyN17p4UfnnSPJm8oKlXyebtbTKER+dhZf3+dikSrcxzm
	 McdJvDjrnnMcuXyO9SUO4HoeYLOE/eoHyuoqOxQH1U7EQ4RorBIt9Ldm670tTPNIs0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LsV440wqUVdiZdYoeXwTYZWm3AKrhNqQvELUvOIoVLY=;
	b=TYK25fDHWvHs7RDBp4IQXYI7qhN+zUtVh5uH8eRKxoA63gqfuyC/ifLndI04EknxP9Hb
	 a+Svei4uiANH1Eno50m31J5husCn0Gr0qoc3l3+9SE5xoPegjWAhWPiQl2yVq1WgK6fSs
	 bEbfwgN1Lbs4LY2DgNyy0oCfLHblaE4UJajmePyKSAeFL0Ursm2Dh92a26DNgcFDTLJDB
	 yLv+IUV5Ri7f9yqzT5IELFEqdd7CChMXCZzLg1vUjbF+bmKltVc+HopL1AufZkOfV8DBd
	 mhhxXVh1ksKHKAs7mL9MmU4POKbzQvrKTWgzK/YteaD7H9FML+g2KQhWZaJ7KZtY4/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=faRp1wfs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcVf0gGZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E11606A332
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E11606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=faRp1wfs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcVf0gGZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U9An4169647
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 09:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LsV440wqUVdiZdYoeXwTYZ
	Wm3AKrhNqQvELUvOIoVLY=; b=faRp1wfsgn8FUEXvl1m1aBBHowGakxDz1tY8X6
	zf+IXor4iT6kc0BpF+HDF29ox++N4VUB40vRVEb7xW0CCCKSaGnKboLTOCvLzmVj
	eVcsMXL2G4URreAIKEjbemC4DPZChRV/KyGS5MgY3FFvjuCAffD9Sf7urN6sNqaQ
	8y2wzkhu1elY/f+qUPugNj6y7f3nbP4FjR9CK6bbn9hQrbNAf2D2WsRNID0MaK7Y
	PIkuOcHB2j/rIk3uVgv9jDxmq1HbQcj5O9sN5PSY6vlz+fxTTIllxmqkdRgSqDSc
	mVYebgk3f1ij52F4CG4zHocqh0MNq6zrZy2I7GNMQVg7+8Aw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8n91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 09:07:48 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2578056b6e.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869667; x=1794474467; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LsV440wqUVdiZdYoeXwTYZWm3AKrhNqQvELUvOIoVLY=;
        b=kcVf0gGZtajB1yNi/EgzrXXPB3zh23IveqYvCUSriZMn85lsmBMN2eaJAHYB6x7Klo
         5gRgXEC4gLCZcCv0gKijQ1DwjoYy0JrA6fmN5XnaHDheW8D0PhlNlRKu0Osi4Vgor/Ur
         /2MXZpaSlgUvixFzBvQ+GIQsRHMGReJXbxltKuWK4LvtmN0CGOWY1j5fDVhxrMk4IkOf
         tEBeVFdGIorhA36Auxey1tx2CQZruM2KWAWdT2I50zLsNazKiPZq/RDSIlyNNskendjU
         QDMYx9N9xfeKP1ZnkeHekXNFPzqpVzsFdekl1Kd5m7/77YvGl6ShUQ0khdQxHqpmAKek
         PCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869667; x=1794474467;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LsV440wqUVdiZdYoeXwTYZWm3AKrhNqQvELUvOIoVLY=;
        b=ZNOq3O9K6sS4TQNGYckOiImFoeLopbxhpBIpoDnvNplaLOgjWiH6NJZ/Oeb+edoSx0
         7nfptfCT/PmZaeXpoHpzYlXn3dQagWHDOgHwmOQiq7Zx4OJLzg3FBYjsfR4loh/1L/26
         tZ420rOrXkjMyJjkLHTfzUYaVW+25GV9V6hW6U2H6+/rxNZj1ZWYnehqX8HDaQvgGvM4
         IvzE9epUttiz/qkozn9wUBsEIRQS4YuN1M32qw+cm/UhlVcg8ItEc9KTOktxK5w3Llsu
         l5mQn4uEoWcCudZ1zwQgDIOp8GMYZZeqV1r+9qB/2bVDkNk8Dplq7ua4oYe3yTBUCM0E
         Kp4w==
X-Forwarded-Encrypted: i=1; AKwUvBz7kwKLXaiv6n2cXGx8WR9bXiMXI3xKd2nPeWcYHUgaGlMA3ehXjDrlXbHaubcNIU3bBZPLCmapwadI@vger.kernel.org
X-Gm-Message-State: APuU4Z+vmefevJzCNEBShebw5Dhz+jSubQ8nkgvUuyWmrjZ0+b/tAv/x
	zLnufv5WN3wX6EJwYbtl9zcy6zl6gg5Nlrl2QC1pOKtLGABhcBvSWJGj0GvVcnwW0Jevolv0GcJ
	pITrHQMXjgytkgQk1LAoRGd5//SjqD1SDtwA5aTwHihwogI87RKihQik7D7tO/8qp
X-Gm-Gg: AYBFou0GMaPmuWL2qQbVEiEQ5bbliHZQZ8P6pW9rScJWEzNZypSxwaXvN8jDJbT+WKC
	evCZX2cQ+aeQk9AHtPH0mu4jqv/0wSQ1fWMMXYFfzlCdaecIFE57fVk+a91g0ZdkrcUy4YgsdqI
	KSAgfh4aJgPPgWjx1plyOz18ZN+WXpQZ4n20PZZ1EIr9pEUD8ih4Mo+opWqW/M2xSGen/oCev9G
	a78ZX9eIBWl3qG3Gm+RvzHa41ylNsy5BURcQea+t2+zaYJwsT1qm6ADzuSA2rN/w2ScegRkM5Jk
	5/cPnTQXtLKONOpegAgslAQ6DvYrRfJEbietawylNGNkYsb18x0l1AdD4dERz6MyiwdqlvXvHsH
	y8OuSd6SNptCardFPlozZbjZQ8+4bAQQeXbY5KZGW34uqzQQdatziHmYXPI7QratJ3X2quLEMNy
	Aoab0D3l1PR2ixadMqkTk=
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr13110653b6e.36.1793869667541;
        Thu, 05 Nov 2026 01:07:47 -0800 (PST)
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr13110637b6e.36.1793869667088;
        Thu, 05 Nov 2026 01:07:47 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm3729636b6e.5.2026.11.05.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:07:46 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 01:07:45 -0800
Subject: [PATCH] arm64: dts: qcom: glymur-qcb: Add PCIe3a support
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
Message-Id: <20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGBH7GoC/yXMzQpAQBSG4VvRWVNm5PdWJHF8OBZoBim5d4Pls
 3jfiyyMwFLhXWRwiJVldlC+Rzw284BAOmfSoU6UCuNgZUHU1GdWf0x1m3PWsQIictFq0Mv5Dcv
 qt93bCby9F7rvByFx6elyAAAA
X-Change-ID: 20261105-pcie3a_x8_1105-72b9c8dc1ee3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793869666; l=3904;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=1HO7Y0XlCTOoiqkB5LsRHtHbJ2y5S2S3Yf2vpPHMePs=;
 b=QbUw7H1ATXvDbwNVD7NJjseHpU5aQlQudedBNm7cOOsDFn5E0PzL2oNYpI5ofI0AR2t0CnPk2
 f6kLosFNGYDB330l0vCQfo9X0Li048aPH5Vooeil9HYmbVLW/oyqA7i
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec4764 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yYecYAONF6xWfZrvDxYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: ckJFqhC3BtW1qcI7GsugUKLesgjUmJsT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfXwDa0CTCpfNOf
 8oYA+6joq9vialUdDZeyUaTOPvayGNspezC3j8GuoM8JQFSwiC1rBbAl7jrE6Hn+/HzPor2TEYp
 cpx+9D2hZw1WoWxij+hH26x4O8ut20Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX1IEIm88xwCq7
 vHpU9igU/Vn7v0IzyQXIQqokPNM27pFzceOJjFLj0H9UV11rr+B2n4n93deFBEsoLbbRlTg7mFd
 vY6/SpgSXCMajC+tF1HTlnjGKinAAEykJ8uduK5Och5kjqlPN9cYj97Qj1WYMRWV3dLYKm/koBJ
 NaDW153NSe8ZRv/mKXC36n3iXx2noAI5S/8AIl1LIeV06ZroOGedo+XpD+/F101gZAICiTDPKpO
 +Cxu+v1DrUDOvzYSvrPoA0/R/VQz1ipmn5lzDViJL/hZNRx6ApxqN+6d8NEywdhQjxMrHzfYh9/
 0z6OLQFEutcR3zWanQ1Ck9FdYuvyxv4s2nGZzz2Dl9J0TfmICeJ/0PZx/2yQ38uIC3YirDasSCc
 13fFEYjdk5vWVyO2hXIY7Kn1iyx8Ny9epzGvAyY1WKo9AEpng/fe8KbX9sN2PtWlxhiFifwlI67
 OAcl95eknwSAvM7sUNw==
X-Proofpoint-ORIG-GUID: ckJFqhC3BtW1qcI7GsugUKLesgjUmJsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050036

Add support for the PCIe3a x8 slot on the Glymur QCB board, wiring up its
regulators, pinctrl states, and PHY/port power supplies.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 117 ++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..741a24454e80 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -78,6 +78,48 @@ vreg_nvme: regulator-nvme {
 		regulator-boot-on;
 	};
 
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie_x8_12v>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_main_3p3_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_aux_3p3_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
@@ -438,6 +480,31 @@ embedded-controller@76 {
 	};
 };
 
+&pcie3a {
+	pinctrl-0 = <&pcie3a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie3a_port0 {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4 {
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
@@ -590,6 +657,29 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
+	pcie3a_default: pcie3a-default-state {
+		clkreq-n-pins {
+			pins = "gpio144";
+			function = "pcie3a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
@@ -659,6 +749,33 @@ wake-n-pins {
 		};
 	};
 
+	pcie_x8_12v: pcie-12v-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		output-enable;
+		output-high;
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_aux_3p3_en: pcie-aux-3p3-default-state {
+		pins = "gpio136";
+		function = "gpio";
+		output-enable;
+		output-high;
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_main_3p3_en: pcie-main-3p3-default-state {
+		pins = "gpio135";
+		function = "gpio";
+		output-enable;
+		output-high;
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-pcie3a_x8_1105-72b9c8dc1ee3

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

