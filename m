Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655943;
	b=zOhYk09HXS+AhY60gcHJa3K7TBtEXlIdldbibbLMlXwY9mU5N+dSn3cyZ+vusALqpnJP
	 6Wq7jswWW8xuw+Swm1aMFaRpynCb+NrJgFvSa9J5e+mHMn+nahIPHKghg0LbZmRe/Mu4d
	 ZmDJqygNLTCg/NaE6WrjdOwwuRO5ZuKfGi1I1LsJOUAjLDDzuFlZlxiIUyMN5okX61yp3
	 U3HuPzMqaMzq3P5VqirZ9+UBUhTDrfGkx64DAtAygBrsNKUpPlMaZ9Jy+Un6htdGvSmij
	 tMudyzUJ0aQUGjTSpfgsJJGyzBc6Ky3nfvpgmC+1kgNIYIJ8swNMRn3owkldXkHqFNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iOVns0On8xHRpLBncT/ucc3Ts++fKWZVvwDmwZRoZmY=;
	b=0Cn2A3Ffudl7BUTN2I8lpMskASbvXLN0QmLL3yow8IYjGsARGP7rguOWDQaumjPIeH7S
	 Bzfc3a4xdnayRSX7Q2uvQBnkEcI3MKzGPiVZ8MN7tdTznNOwJonej7jHtoG0d6/auzvvY
	 o31LsOXH0vYktKeWlgLqWVf1qErgwdxb6hxh7GzCJqEpSiDEliTjKlDt30VBhQ3cmcMkW
	 +wQMi8kgok2t0Gko80M8ts77GPUKGdFsZ8mfJ2pGYoLkHtt1WKiKVaoJ0yA1FFIdK/ls6
	 P6VGpGzMbGB1/VeKisFXyFonuMJdNePrkuEqYBa9ZbCTBtsNr2JQxxT7UKsw9ez6xoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9MZNlLw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmU2O7hv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63825606A332
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63825606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9MZNlLw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmU2O7hv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wBpP3649923
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOVns0On8xHRpLBncT/ucc3Ts++fKWZVvwDmwZRoZmY=; b=A9MZNlLw1UQE6aUU
	yW0GWR8ycdBsliUATMPJ1369rv/R889JETKb94RjsiUW/bBYnTKl+qkhKZwr68w+
	ZKbAYQuaJMeCRQb2g6PQ8TMu4P04cn+hllJfMItruIE8cX+86V3H9gfSoBFk0bRa
	VL4v3Bo+3wcAfjVMkuC8/6Qtv2waq0zu4e/3+IL9yFjQzdNVViEY5Sj5Oe7KqnbK
	iOZ5JfhhZkEaYa+xVeHspdy4T7mbmuEE3BNgTuwOvODFfhZYOMQV3zdspkKGhxcq
	SVoXT8PDm+CS20PYctRMIE/lrKiWqcRyYRMmJaLWCg3IqSN1xOJhHMMqSLiAxDS1
	ezFIcA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjrnsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:32:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f0f4c70cdso7148056d6.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655942; x=1795260742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOVns0On8xHRpLBncT/ucc3Ts++fKWZVvwDmwZRoZmY=;
        b=TmU2O7hvMIBQ6JNuayS7oKMQTvB7s1PslQhsCKwu29WK3yIGaJKHmKpLBv6kd2pVXe
         SC/hut7xTRp1sv+sPKk1t3Q1GRueYke5kFsh1CY0x4wKar3gX4inKRAoaZwR6T+Rwr7q
         Yd0S+htLARETex0vY78bqRFLDgt7vkYkWOyfypQdpQH/dNDhw6fY1LFG4/TCSVlec0Vy
         Td/jlkAxRa+ZCH/xes00uQEf2gm6Fe1oLB0pVZVRj1ZF/a4oXnWZsb+456CiPCW/XQgN
         qYqlqtFtZf7qNsmF8q9TFFkwlcl5ldgAKlyf4B+4WRU9MDLrvqiKSIin6nSYkZvUVtK3
         Ih8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655942; x=1795260742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOVns0On8xHRpLBncT/ucc3Ts++fKWZVvwDmwZRoZmY=;
        b=eFXVTaX4zKKhHlSOsP+tiRBMbaZeYCqibzNNzpesGRyNvuNNTbwxgiCEZUzckN+Ckr
         Rr7yL5MUYqNy8fv6RnFmTeE9ko4ATDGXWYqTYvvNHY4Rvy1LVrPZA45Y/5bb1nn+E/oY
         JDjx0wZcetzA8+Yww/hX9fmezC/6qEx1tKyV7tJ/8AMX62H2woj7lqCK+mxDsh8UT1aJ
         bmCpf5MClV8dpbAI1h7etdJGMEUc2muSuzyG1RixIOYcHgGmGVG7fyV/2jGmztxDtmON
         a4q+47knoMm37sY+xJnR2WB2CGSM3BDDFx5LQogbn9Em3agRNO/4Zk0KQLv+XbwKgjmR
         22jg==
X-Forwarded-Encrypted: i=1; AL+hErGMYkoGmoJb/+5+WGxku01fMlV7jZ0h6qIo9w9che/Ds07U4FKY5qZNzyW65cKIezg9THxB0GYadSI6@vger.kernel.org
X-Gm-Message-State: APuU4Z/fsNxPYx21y9m9fwrGsP8hglKh0+bBqZ7bY7nDXYYSP3Kad+bm
	FbgV3ssj6B03IgU7Kv9pxRS20Nk85a+rz3WK/0ibLRNuhy9zlkiyeMwJICJG2ScPeXyt0qissx7
	hNQtTcW8ClV50CkhvqzCw50ClovOyMwbACT5XmkY5igkMsHffetg7Py4xCcmX0Rpu
X-Gm-Gg: AYBFou2IezKtKFAFru8uPNhvZbirWz4qbOlYo5ditoR9wYxSUWGub2PlsmUyyG+ZNdB
	HLPjzWRYJKWg3u3FEZFe0AFutw9F8I/weEhMBbO9sKHRMC2hk1pbU24EhWgJe+PFiJYjdassOKW
	FjJ9JsRQ/cu9cw1oDhmWCKAg2Ou0girry9bvhbPqps/YTJpNUAeGWe48EwxlvTymGwLNYxoRySF
	O8TEe/yAOYN53LPyesNQQ63BnZzsl3ah+PluzPsQz2pIVduqJUSx0Rx1+2ztTBgoGvinEt/OA7i
	N4eTI2LuVgsh/OQb0iv20T8uJFm9wp0u/eBJbv4so7cLl7E58981jUY1Cyh5abhjNMjfindfCXB
	bZlyGA0FCRBbA5g8GxdgLb94MhVf6cQFfCgJ8iYlmaKQJ1cPheLNUOFlF3nJJO1O0fJqHWEESCo
	bdY7pVpKHsWgUI8noxWH9/fGg8kzIKfxTVLc/Ft1T4
X-Received: by 2002:a05:6214:2c11:b0:91e:d612:a120 with SMTP id 6a1803df08f44-91f23f1757cmr84911146d6.0.1794655941826;
        Sat, 14 Nov 2026 03:32:21 -0800 (PST)
X-Received: by 2002:a05:6214:2c11:b0:91e:d612:a120 with SMTP id 6a1803df08f44-91f23f1757cmr84910806d6.0.1794655941400;
        Sat, 14 Nov 2026 03:32:21 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:20 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:34 +0800
Subject: [PATCH v7 17/23] arm64: dts: qcom: sm8750-qrd: Enable S5KJN1
 camera sensor
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=2708;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=WcXr8K05MCivYBH7t55zgxmqvzswrk2NVxaQje+wUUE=;
 b=83dZyLdKRsTC9xpzwO8aD0RlXWspmyBIeBp19Rd28ihT0G+7H20crZ0mR5issY+uMIh84StPX
 5Gnt+iHD10iDNVT5nZBG3xVbirzR7Dn6giWZ3plWGxANoYXGtpVoPG0
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX/9c82C5C+AJy
 GNBWm316QaUiNq5SuPHZYUv/bYk0+SfgT8pjoqMFmsz0rNHl5LolKrtOSaPsW8M05pd3+81H74P
 3YqvR3AtGc+M/DXgkpbW+Hs8VAJ1Owa34vTvdpjskJBKW3VvE5BIjExxktdz3QGAL8BQ0Drn9uo
 2dY3NYQAmOEGVA9KWT3H+ikSOwQbVXGU+BZ2Dm+v/kA7bF5DTw9A5bGR/Sir7Z1BT6n3yJEwViN
 bc0CSEuyopOeXomjVF/1f6KXn7OxnGoTfGurguFnHlEy26dK0YySM48cmMYLF+I8W9V5stKgH5z
 sVmGZHBpALMGnNlUGXhb6QUBat8vR4IY577Wz6JA3ZMnjfeBwTZJnHZYMLGA4c9MnRGGL4wJKtz
 UZwt8XsTxBbwNUApIvk9Q9YPoybnE214ztl/11w+aUu8y38vUby0axRHN+mMRY5udsW6N4IYDLw
 85x94ma7hArE3/deeig==
X-Proofpoint-ORIG-GUID: 5BFZ_aBQUEwFcD49FuG34JS-eTxJu9lN
X-Proofpoint-GUID: 5BFZ_aBQUEwFcD49FuG34JS-eTxJu9lN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX8zQCu9d6IiG3
 8SHZh0pEHv5fwcXNDyTEFGmMUtPJHjqM1jajSzQACCUc2s1myWVxjjiGpLpoeVWYtz2kNRpcWPN
 AsRwF45gRcEyKsEMIuge+faIc9h4RLI=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af846c6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2P3Xd4wR9g5NvcxdGpwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Enable CAMSS, CCI1 and CSIPHY3 on the SM8750 QRD board. The S5KJN1
camera sensor is connected to CCI1 I2C bus 0, uses MCLK3 at 24 MHz and
connects to CSIPHY3 over a 4-lane D-PHY link.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 72 +++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 75927e1f7b9ab0316781c64dbcc82d3394c414f6..c92a1f3c47bd5cbae26854614682c3bc7daa0398 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8750.dtsi"
 #include "pm8010.dtsi"
@@ -858,6 +859,70 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy3_in_port {
+	camss_csiphy3_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy3_out_ep>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	camera@56 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x56>;
+
+		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk3_default &cam3_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		vdda-supply = <&vreg_l4m_2p8>;
+		vddd-supply = <&vreg_l2m_1p056>;
+		vddio-supply = <&vreg_l5m_1p8>;
+
+		port {
+			s5kjn1_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy3_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy3 {
+	vdda-0p9-supply = <&vreg_l1f_0p88>;
+	vdda-1p2-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&csiphy3_in_port {
+	csiphy3_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&s5kjn1_out_ep>;
+	};
+};
+
+&csiphy3_out_port {
+	csiphy3_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy3_inep>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1081,6 +1146,13 @@ &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;
 
+	cam3_reset_default: cam3-reset-default-state {
+		pins = "gpio109";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio55";
 		function = "gpio";

-- 
2.34.1

