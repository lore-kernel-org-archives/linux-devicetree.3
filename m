Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D31F3EE1F6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320167; cv=none; b=WpEILE91kstSotYccLhBQLgpxF4a/T570QVn14P/TiXirffQG0nTYuYw+g8j09V1/O+JOzE3gbck+u6lwn7+E5uNg/urRsdmRWmn3BE2AnDhr5KadDH2UDQSDaHzz3XlHmBTsxJb0RDiWX1eqrl3Q2156hWlZaBDcMnzZK6WLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320167; c=relaxed/simple;
	bh=s04XVAEVnG9KkqB53E1WQicRpE+CeuICR5c9XprgAfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aok8IQ22fBFlLbfGCYqPJFceloNpZc5SepWIeYiX593pvdakmRWpEb31736Q4HZKsTQ5l7D3pWvg3xvgn5iOzVCniyJsfkeuAgj7wCJOzCMfUire0igPyYU9JYJRn7Ndl1SKm/Zwy07U5x+hrX7kb6GE4ctn6lA5ZY0HorIlrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j7xdpuU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgGg5rLf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j7xdpuU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgGg5rLf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641SkI3615440
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CHahF2AuIFC
	nyRgrN9VERad5zx57UjOdarWckgEUsKY=; b=j7xdpuU4VlMVIVfm3JJfshGTRua
	hjt0QzVapROi9bDbbH0X0/bAdDYS2fBgMfhzOkwsubQdRzpTnBWs7m1oAN3ABgGD
	wAKDz2SCqaCppQby60ZY8bGLczsX921wrvSYeZXJjj2hYCZwPsEhsISD6aYH1Qi+
	wFW5evNpCe5n73JlMohXyPnxDC+lCaVnBpjUtaMaLmfoYLZHUzLuajW270gcLHGU
	wBSMxDW58ES8pRBmkbY6UtbOXyBdSG8JZm3nPXfuTxEN2MPZwqrLSU4gC5GR513j
	wAvV5jtb53j0C5a9MXtgZMFe52CvEUHQYM2ns3XzKS5dgxVy1haiwjDfnFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cuqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:42:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915f6ff639aso494074885a.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320158; x=1783924958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHahF2AuIFCnyRgrN9VERad5zx57UjOdarWckgEUsKY=;
        b=ZgGg5rLf+PoRER3Sx2xxyyB7ZmI2TilCfeCycnWsUyksgQb1Wi4Q2jzce/XFFhD+oy
         +5G+oG61DU4agguyFOFjJa4zNN9XrAbgTW6pnYL9g6kDOjiFv1ijwI8x5aQhHXYRHy0f
         SajiFCwBZk3v2/I5Eexub9ALi918Ys/CThniomgYH0legR8Z0afh4UIc+AH8Z3dxZgX2
         yjOHy7UiP7P5tFfj1dZF9jlMEXQQoOun99QsFNSyuob8CMClsPRI9XOv4amreqg/IaY5
         39lZM5WNeyGnpvlOwsUvHDHDE/eyoy96/HH2aw8yzOMb/4muLQxsbvBcu2/M3liOsKcu
         Hcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320158; x=1783924958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHahF2AuIFCnyRgrN9VERad5zx57UjOdarWckgEUsKY=;
        b=Mw5HLKCg6tBTvwWy+Cnc7KlIZ3tspgirdZUQpKX1FOIW+9Wr0pWNBQ4OJXKjXCHmR1
         YCj1HoLwxq3E5gfHhUNzF24D4sLYOkWxpVqiD/sbfV0C2AwepDxALnKG8lzTMMmkd9ok
         HcGh/KwcmouYkFt6Y2sUi7JMbGVW5yLt2ty+HglaFlkgU2T+unheJjhuAOzxa9YwKtHy
         HsGvxVoFBhhEXKGu35somtocfDaNZmPqlRUpVjs08M7f6r7846l5gAcDWW6iQI91ypUP
         cR5Fhf/SIjuam7hlwTpYZtLlKmp0wQADGWjZ9N0JzloJrfQZngGd9sWttF7Z805y/0Nn
         jNuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjJEZEV4+yQVYlZ0rHEDNCbhWm8pZoOLr47xucpt3BXrNLhie2aTwjVR9e0X7EFDzb00y45xE2nIdt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Vi5Ja6LQejodqA44cKG0NGKlM5flpMNlHawjgJkui183gWJz
	91pp29kbnXDf9/Stb7yAX7q6vBc0F797Sk1i/gr4FKSsdcb7uf9MlqWbFSkhD+WHw8DES1nSpuf
	qS2PT2u69iCJ+/agJS+Qwv7qbau76r5S49ttG8NMIZa4rOe2Ij1wNHMcV26pEFxfI
X-Gm-Gg: AfdE7ckXHTSkUuUXJBt5dFIC+Icc9O8mw5jmXp76mCA4U/FIB1bQXhPg9Wkrelu77IV
	BcPGneQtZIud8TeIEOAv/sucUvhOhWsb/CdGk8Meeg3xWc0YQuiNb+AHyg0zaWFiiiAtxC+hsr1
	c0Ti3zIUg7DO/PMue84wZJOQZGQkc8jP9MMW88yh9i1ANLIx6/rPSZ+fF7XWV6XXnCgmiiZk7bx
	6x42XE0hWIz5vmLa5EzKPFkOMno5IycCyuLQwRv3fdr7DuybF50Q5zo+CGRH5cBJggYulYRGOcQ
	yn+0ar0DYhKwZR5VsV8svTmofKY5PXemAv9BiJSewJWcP/462VE+7qYGQ9HOrPDflZwP/Ax1IZz
	FOl51HUFgrxHEq5pdFL2Sz5rC
X-Received: by 2002:a05:620a:1a1a:b0:92b:6805:91b5 with SMTP id af79cd13be357-92e9a48d9f2mr1308594185a.61.1783320158359;
        Sun, 05 Jul 2026 23:42:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:92b:6805:91b5 with SMTP id af79cd13be357-92e9a48d9f2mr1308590785a.61.1783320157715;
        Sun, 05 Jul 2026 23:42:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm401457155e9.8.2026.07.05.23.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:42:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: [PATCH v11 2/2] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Mon,  6 Jul 2026 07:42:24 +0100
Message-ID: <20260706064224.1328576-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfX9bYfYUMudJpb
 0QEtlTydDgkx52U/GxFSqZW74f+rHesoQjpC6Aq2rSe9pbtJM3EAwsXBJgu8UnaJlLMwutWzeNz
 wTRXdrhTbGIa4Pw2hUezo4Fhy4zdi8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfX+faBgXlxUodT
 q9ncvTaffsfBWV96KqGyXYeCMlzFqG+JmZfGyDrcX+lEGZhrgilVs9DYPoy+CkS4W24q0cgO4Vp
 jXuYrcjryLS3ug/PAdGiih+VwnOMLsHwBcHe0RwZ+HUaU/f/4kWn8fLYMkXvncktOf151adRLv+
 RS/XNcVgmBa+Zndny3KA2WD6o9GkzhJ+vCXjNiqiq2FttgmuXlbmqWU+u2lNPEbDuFdQs8Vgud+
 TKsEj58MgGra9M6TN7WCCaXumo1jrkO1YfBjDwC0/JKKg4CH9Lf1PORMDSyx6PIGx4MDd+LuT4Y
 icyug2k3WENv67h9ipq2B/ylp53ydf3Z7Gu8dSRfYKRdCIXImdMTW5//b1d+pH9tknhNOzgN46y
 wYJbsx9yU0kvY4o69AVLpRAXxaMTmYBLD4oSsK3NEIsMYt0KDBIpMrr+LH+CnOXFhiigjordbba
 KzgvK2XF4rnkZiXtwsA==
X-Proofpoint-GUID: dGI4luXeuSM7Lwdxq2UMSWXfzH10GNK6
X-Proofpoint-ORIG-GUID: dGI4luXeuSM7Lwdxq2UMSWXfzH10GNK6
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b4e5f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060064

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index f7478b59624e..2ffae61a4dbe 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -69,6 +69,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -461,6 +509,13 @@ embedded-controller@76 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -588,6 +643,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.53.0

