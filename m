Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2358389455
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292849; cv=none; b=G/iu3pGb+TDFqpbdGwduRyQurjJRdQaxjbmoRyNlVq+5Sh33j/qoGnd9GTwd5DeSurl1PPzSnETYuOpPWYPBgk0wOONgoIePXnG31hxKNKb68z0fxyf3urBtxqsIGw+8Tj5peuRzuywIiuooL+Ewxk1lASoGHnvvNcjOq+Da0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292849; c=relaxed/simple;
	bh=jZRQuBJFgH3dMCgZK+oQgCKyJeHLuZB2H4ExRaw+5Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZzDWOrPo3x1iWUk2DgoFHif6aqOor5JWYMML3rV6Xqu9MxapFwzlEwhXqXOlkinlffXK3jWBgZUcGvJXhEXxrc/HDBAGw4872wQwArsfakhbNX2T+p0ZPEkcgWT/hXIDDQ/8HYlgBlLuoSbJuBnlCzs+BJXps/28NQman2cqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsjFqgJY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PycUipiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsjFqgJY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PycUipiy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1H33e089856
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5TpYVMvpCAoUbl15g3r+9NzTsSj5tqT5A0tuokNfL8=; b=WsjFqgJYqmBvNiej
	WIKDBa3hCeIUuB/O98rqo02SgeqB7QVVaOE7lraWzHlON6DJIgxb9ZgFeXdolIez
	w0qJfuyB4xcVcIqO78aMATr4dUIZrm4oAbIw5xJ6uZO/jWaFLxC3lQwcwA8mhuNs
	GZYhVEdfJ0/Yiaoo2MQxaYGqV5M2WL3od3PtgxYcflgL+4onQV6JwPPuRug8Cuo2
	tpc4LGptUPlh4DXJvwvYETWGF9qfRPTGIzItYLuktImOLYzxVOERfJIngQ4O1grJ
	U8aiLgf0sPuSkTkr/JMi/oeTDpJT43FKhmhy9pHeNASa+d/xpqLTXpOZCBtnFSUL
	8uV2NA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvd3kjw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:40:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbdbeffb9so837155ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292847; x=1785897647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5TpYVMvpCAoUbl15g3r+9NzTsSj5tqT5A0tuokNfL8=;
        b=PycUipiyQeXfqqjFsFfXnIkpxChl2b8Ncb6J8tu7dxw4ta9f5vwO3JNpVuUlaiMZSC
         rnWZoA2yEf7nJmr0VNTjj9pYbqWRE9Aea2P2n2WXh5dUUNSdMNn9SbiaGDiq/x0+vsK/
         A6sXcz9je5vMlCEgD1nj2b/Y5uzw4UDgl4j23piTBWHohz0jFwx0VW5zxyKSkRhGma9n
         VGbpzwgLSyLMgT3KD1iY8hvwW4ynSojgP7CR67q5lZFUVSaPDUx91sLsNBF1AFIoF5BE
         59NAqJdEXq9wsIhU3dLtUADV7FD7sBif1U+HbjJ0DLOxpDSgabZnrNR7qUwRS+EvaTK9
         BMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292847; x=1785897647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5TpYVMvpCAoUbl15g3r+9NzTsSj5tqT5A0tuokNfL8=;
        b=FYXh27PnY3A2RB7M/oaTVfArJhh1+2McpMkcIM05wOxlH15FF3jlt0yiB2HFzDrTpj
         7w/b/5Zk6u+tFmb/R6zhcZGUO018Cjpicm86m2KLrizLIFYGcgWWjTsGuWuJMDLyZbOA
         TqEIlsTZavmxOqOq1GqyMJ5+RA2uGrDS0WgSrRUYHEkRo9F+lVj5ZJ+3aS9vWar7owP1
         z11kmgTcdt5XrX7yGbI1DyI0nRIlBpcxA5dXwpQkVNEfGXZiAUA4PtrDipiOl85HXKsB
         VZmrQn56ksncnFKz2CV1W8CgBTjo0cqopEzn+ykgQeTCNjQr+QwX+zVIwPyPa5yGeZ+a
         S0Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqlKaJv/e6At+dRU0q9+/8DhVY2sMQ83ja+fhcPEd43Zc3CvNj0oPdYjOV1QIx5wRRck+up1175Ai7V@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8O44zhzgRfpLV3mZeb2Kgouzlehr5tI+vqVh0Mmul1Dyngpb
	rmH79iQFA56XgWXg/FVEps8DqxJnkV2qRhbU59fcTmhTo2m/OJ8ezJS+92FhF//cFI+nOsMd2C3
	spUMa2s5080yhErx95TNZOuhHnrbQekxesSbpn+33ZD5L1OnDxTMXJg87VAhkxeGc
X-Gm-Gg: AR+sD13YN74h2sy5U2nUasupczytRL98YNldSL6P+RQpOFa1J3XSrae0ofqr0s9gW9Y
	9APfSz0zhd2HWElqdCuYt5yFh1f02ucQV1XDnWrt/KXS+geQ+hbpY4Gx90OgKEOuKVvGfvWozyU
	S71x1yw8gC19rbtCCRwuAP9bq7L7Kf1tyJJqGYVh9pa0MNfnLr6XBhyBbPLxH/EvCzspOM2Lxdn
	0MD0NfgGrPGHxHSx9WDpUoQnareq8Q+eB+Npp65ySY71sbWfcHK+yu2kozxmtH5oPEs1VuCTRpx
	4BoPNqWhbHJKg3fU08VT+1//eY2qpIsfsa6wpoR/BuGca1hVcimMVphs6/gtIG67OH2bChQPwbc
	Zhs1q+1oxOhND09FwYIZQ+lBCgZGTeEizrQ1ChA03U52Tt4iPEss=
X-Received: by 2002:a17:903:1b03:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d015a0ed80mr46375605ad.2.1785292846712;
        Tue, 28 Jul 2026 19:40:46 -0700 (PDT)
X-Received: by 2002:a17:903:1b03:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d015a0ed80mr46375385ad.2.1785292846294;
        Tue, 28 Jul 2026 19:40:46 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:45 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:10:31 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-3-0548e1dab760@oss.qualcomm.com>
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX+bSh3EfYK7kl
 TF3Os9xlYaPhu8uOlG7Nw9FlysxmhhLWYy9Xl2/MUpKwYlCbeD5CVX0QosF9YDZy+/ko31s3IT2
 nvNfBFdWRstr4irW6HpSgiRemwX9Y/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX7w+nIAdggu7c
 Cz1WmZ/y8VDhn15hE1jdZfzhNc8bJE0KOvp5wjwk8jUBYaAHqO/Z/CJ5Mbfhza8Q++RafpmWsa6
 KiYTly8sHkAMYN82cxIZGMuvEsni5wFCgVQTWpGFa15fY6e1iwPvfxOM6SMxSbclIfPJNVyozIp
 QnW4hpslnU+HOF1SRxlbXE6v8f8g2XJGcXW5USlO500Ua4fRvNEvNvBRNL8/wKf9WE7YyBcdxNv
 RU7SlI+q2JaWYBapQ6QAFnT2s3zYhWHizBi4YhModHHtP0jiIu+G+MSaDpR2HCCsd7ByU08HhWf
 diuBInL6yFr4NqtstZfHd9yc6b7xGyF4aG0OqCwPQnipQVaHqq6TywUIkFhmIAiT3Cenj15oJHd
 DRB7bFPzAf2gq0VmXr3MWh5QPjXUe7LALLciDwRq7J4X/qGzIycALswCkEAHBARvQLwMJE84iEu
 yh1SLr36htzklLl3cuQ==
X-Authority-Analysis: v=2.4 cv=SqegLvO0 c=1 sm=1 tr=0 ts=6a69682f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MLakmYnuSw9freleF3wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UZyJrutveD-2dkzzkVb1O9bGIzizuSAc
X-Proofpoint-GUID: UZyJrutveD-2dkzzkVb1O9bGIzizuSAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
(vreg_dcin_12v). Both regulators are always-on and are required by the
pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

The graph endpoint anchors (pcieport0_ep, uart2_ep) referenced here are
defined in monaco.dtsi (see "arm64: dts: qcom: monaco: Add graph
port/endpoint anchors to pcieport0 and uart2").

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 69 +++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..006290c2356d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
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
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,30 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
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
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -646,6 +703,10 @@ &pcieport0 {
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
 };
 
+&pcieport0_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
+};
+
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
@@ -923,3 +984,11 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&uart2 {
+	status = "okay";
+};
+
+&uart2_ep {
+	remote-endpoint = <&m2_e_uart_ep>;
+};

-- 
2.34.1

