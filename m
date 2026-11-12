Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458226;
	b=ClUyqCbjlccqtewdffOuRnvtsgui/8n01Q2y4Q8WZsDZbPsuMuuz9tU1H9Cl8BsOYAwc
	 cQK8ZHx93ix2NR3mkvoe/LtanHMZD7lmaVriM0r7FUKWeUKmSvR5cuZcP6BKskWvvLhHc
	 Spr0HltMiQKDhP61xm85j5d0MYtBoILqEqJO74u8os9ZReueU/+9Wy6E5AwXlq0UCnNby
	 3M9R55KJ+omsuGhWWc2uPRJGDt8fpwARdyYLqAGgasGMyUj6HuTOoV2tLLei4D72O0FeT
	 WB74eyCBvEPixulliUWer47owebNQI4mypXhREcC4Gfd3VzXd/WbiT/nbqZ2CrzJlhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
	b=2hDKguxEdd3ik9UQ47KyqjTWJacVPfaS3p5gU+0owtjuDWpO+el4Gh67vu7Sper5ZV2A
	 NVlucbCm06J5GNW5f1td+2yRq0SPfwQNVxbpPDFMQuCMUo8U5ai6sP4FtDzVfzKD/Xi7v
	 mCMDtfSNa+uc7H0pQfoLNomqRir/V/3UWAgV6CdAjcBvyoIV0F48A91TDEHqu72EeFPOl
	 sX3azWteZuIM1bS7LTeeAj4qEkX6acxfkA8pPF4uZYR29bEYRpz2IdR4GGkUmnHHJB4bz
	 UwDW0YT56cLDND+VwL7495LVlQzaILm+lTNMuU1uc6KxXUA6t/iFUsp6/tBXmah1f6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8KTScis;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aNyiYJKK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F3606B9C2
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B50F3606B9C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8KTScis;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aNyiYJKK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZS9g3158551
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=; b=A8KTScisN04F/Dfr
	uvXgyFAAbbkKyyL7ESWlywj5IF1Sl80FCjCsU6XGms0/8XuNw3gVB/Ek6vD8awbi
	vMZ+z8fDIrUdaaswGrjDu+QzaJnv8QVK6L3tGTA+ptXSezPzPFPMkDMAwmVa/OSa
	uE8rdANa3NphI3mvdFwGJ91Nxkark/0IELIJKwMFDy67Vlr/PTuwEpEq0iCCwFj+
	SKgli9MDmtTKjPMnNK1gxlXpCLfLakssVaShi2r9iWXmytMw8E0RtnbE8kW/V+X1
	Ic31UG1RrTgSx0wNfSxlniBrpJToUlNv9UXT5dqjOqqvS4SROzYy4p2SW0LrbRKl
	ybdysw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pvhr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so906000eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458224; x=1795063024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
        b=aNyiYJKKsf7mD275PQQ7ctMgE7tNoDfLpOUefIwITNjz95z+QH+RblBKbp0pBzqUIa
         DRPXjV2jy8T3muXVMePI48BJsDe51Nw0qf4KdoPTpxjWjHRYv5neVOMJnveuVDaAekv3
         dtqfjmr9JGd6TcfwpqDeXFuRHYtwY4tVNbm/2ZE39ZDid9wUVLdXDc7Y5BF1+iZCu90B
         pya2O5+2HbzvtMF06yHfgAByBfAc3zkOXjsf810BBzuSmceFq0ENW4Kc5Q5gsKxTvkTs
         zHumKU+7X+OGDoR07G0VxaJ2s8gUquViu9H55qF5QbQt2RiR3TWCFhUsXVbhdVu8F4/X
         t1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458224; x=1795063024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
        b=AMwcPGS6PcZEAT8ZY0XO3nW6J0C4+GR56sVdl0kRkm/CoTw1W5hDaf/9OhOWusWR/I
         rQ3TRqLViBLiF1PAs2+Dm/xyFCd5TzGjgz9HIV5evpQvtPy4RFzHejINE4wAi7pWZaow
         k7xe6hDtH/YDFVrDa9ShS8a0KEYJVhm8QpmeiXhVZTsapTfX1mjWQgZsC+tsXjfR5dOe
         OsUaqcEObpXxAmZZbCZEzINBp7sdA8hGcNYZAFGXM4TN86CDj1N8QGf5q1iXdVmBLssh
         6AGLI5kdOmEjWrDQIwHUzd8xwHyYItI2Sy+wzvRlO0rNXXQ9g4/XzAlrFLL9BO+ltevS
         RD0g==
X-Forwarded-Encrypted: i=1; AL+hErFwGzYgtUSHTo4tJ5muq3qoEl84sCd7Ht74bMdNRL5i2xywDSH/qgF2epC+KB8kjLv2hdT2Wk8iRDET@vger.kernel.org
X-Gm-Message-State: APuU4Z8fIKg4sdx76oEGe6erTrNhauTUaMG3u5iuXYOJOwbGVWNz5eHl
	UwXvLSMa4Ftid2mY5ddMEY6posILwYaZcjhui4RpJGu5Tu8MqOz1zhCQvjFsKq143zK88h/+2aA
	B3taWTGC9jcpNhV4vImVEYQU+jQ8nSgXzzbwXnveICZ4lFS9nPUAyQJV0hqxjiYEc
X-Gm-Gg: AYBFou0wTvJq4Jlwki65ba354HCEqoTNuuu6aB+ZaM47SYU/OFbNbC7xrO/8fNV63va
	oHlOsH+HupO54OufzYEFG+uwkQC/quF97gHBJpPLaN3nHUSAlLtp6dLRgX2hu0M7xGh31M3cXXl
	ijVyAi79qOFfWdd92KAwUa5WF0OuE5htP9YOK6c1IZdqyZhAJ+3Aqg/I2euNl1WVLn1GfFsrzCO
	mNQ9WQGIxx1l//BRbOqPgquhD/TeP/jS3tdcwFckvHtf0GBR0b35m5rKta3Y5LzHROqSpEaHPc0
	kz3cecHQPwfr2JgxKYqXThCfp4mFTm9b7FnM0VAi8Tm1MMS4iYQ/67D/tFm2D36e94K48h73E0n
	MZbvaqcLUm8NyjhXh6k/7ygLSjSxeMB32Xz51XtT+z7qhAy/Z6c25mAyIrD+5QmV77bg0SbiC8e
	594210vkD0iDk3ozb4OEqdJ2Zkm6j0W1I02Ny4uhGKri/FMqOwNN7MvGJfnsUGtVtDlbFOp8p7V
	hVvoe0=
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5070346eec.22.1794458224220;
        Wed, 11 Nov 2026 20:37:04 -0800 (PST)
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5070310eec.22.1794458223534;
        Wed, 11 Nov 2026 20:37:03 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:03 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:28 +0530
Subject: [PATCH v9 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
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
Message-Id: <20261112-08-dts-v9-9-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXyLbHJavyTYc7
 PDvCSsbjGyxb2Q99rpP4lYdzXCQs2BL3EfldgtXSJ57xCPzQ1MC7q+YP78gmn4AJrfQPY3lggAh
 DbBoY645Hu1OEKL/6H9RzQMMtalfieE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX0A3dud3VEGK0
 rkBaSdigLwuu8dnnhpE9PfepFKBavW9gI1+IRf/Xak/+iydXWIZJnKU4drUuexrn88wSn7hR+4a
 dHbkM6bTYx38s5aJ1kmUNdfl5cB9JTuqbYo3+PncSxqGUoZXB9LZBlDKXt9rE/mskc8qtbxtZKn
 Xh3vZYzDZwnbJMTm2dBkp96/ceKFBHCwdn0LbICvfDIB42OCL35S287IukHZbjQ+ubF+iN9xAfO
 q+c8XrJDafv7kMkv+ewy+oCbM4pro7+ZUxjAi9n05hoUEuONliIbdmRj+TFqlYURQMgZXfdp8ks
 xP2AGPfuPTAYJAYhZg7UnQdNaDUM1VbgjAqQn44pXjqfGTTdGkW/ja2qedwC+TlGk/cX6ViM47L
 wMRpfYbrnsl/RwT5BmJ7NRIZVNOh1Fu6BE8eg6/jtsiWj86RLgWW92gac2yfOfOyN1PkRr3W8AC
 KEq+cgfcp4gE/f2sJ+Q==
X-Proofpoint-GUID: wSr4IEyN1f_DFGo-aodZJCO37Vep5exR
X-Proofpoint-ORIG-GUID: wSr4IEyN1f_DFGo-aodZJCO37Vep5exR
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af54271 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GVWKzDYot3hTMZ8E5o4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 47 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 87a7e625a2a4..7cbdcf58d946 100644
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
@@ -202,6 +209,15 @@ clock-pins {
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
index 4cb9f399d480..36f874e57b42 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -173,6 +173,14 @@ opp-300000000 {
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
@@ -460,6 +468,45 @@ uart1: serial@1a84000 {
 
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

