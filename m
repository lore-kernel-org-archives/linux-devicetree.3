Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718306;
	b=RtwqAKKgWMBPvE7lNCD2LZtBbNLKAABiTEy1wKuuSCu8PHky8o5zf64p2ta/xrR8BOR3
	 0yjM2lY1gZZ1NWlmA6zKxpMR1aWPHr0FHQ3bHXuvOu6KrMc15y9MVFz7tpoxYayUO6pIS
	 5DUyxgDvMOW02h/kSRp5JfQrGxHykPDkegqTg5wPiXDaSDQqgXHfM9LTbsv84jD46kkPT
	 Wp4/oV7Epf84ugbKpP87eYb7keQBTMIFNZv8q8H0PhvSsGi/Zeo8HS0yvEw7NeSj5b6br
	 jTr1SYSN5iK1yOjZb+29mb8f41dy2Eax+lKziKLToZCL2qq+OtqhqRWekXpUN4rSLFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
	b=EjlLLW5h1x/zg/FBbASP2fhSqHRwBMMPZcwnxs3j9If37nahV7K98Y9TG+4PW1J7x9Lg
	 Js7iEPY1iQQws7+7X5/ZMcVSuLz1KKva6udjh7Wzs4/DDlvriJa16hsSb9n1WNoGtSEDi
	 dTGkpBdEEw9pHqpegPW9AG3dI5I3mRBEeA15ByIBOug6579MNaT2ydpFilYrHMX2Bjlra
	 bO/90MCvyYJoVjTkrnUJLIJq+tyXNWjyRCsFdUhKGeKnxb1+ZYjYdQtKIr01CJ7n7AOov
	 hpMj3+UZzBoyg1SgQigGHUgrP7wYOxZ8sKOXOrNm7MtfO6fVCz7ER9Egggs/w8CXtSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2D606A6B8
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B2D606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iUycXkHi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6DVRbv6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu7n33850526
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BfVcGVrBRqJ
	7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=; b=iUycXkHiF84UIPqvgnjW2Lq5L7+
	bpqHRWR9MYTgLVVTXbo6pzYLBi25Y6rYyGloCPQ1LhtteRUQoN7ZBKvDULG5j2w4
	SDVzI7pjcmdfovfAyOrrofivFVj5BIZe79R0PT8oYO1byR4npkaSECLaMAW4xTpJ
	3sHHVZEwzloOb14lBooXk5DUEOQdMyvNDwh5E+HGchxqU7lv1+ONR1t/9jjAUoe2
	dT0yZlsAi8iyPgj6JJtMrn4eVrBSaOnxuAyg2ERxz4EZEvTZ4K+JAHHfv1wYBHWb
	iQssYxMZ26u2aOvBmEQ62WNmQ87fzzwkfQASjCEvr3qHMSqVYZN1PVqhvbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7ga4kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so341565885a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718303; x=1796323103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=M6DVRbv6ECDiKiz66wAAhP8RfF5QPDNku3xsfNysoTHqlmD5SNIVuBGSvYTZthGEbs
         4T+SZdnjy6fR9vTBIEJ5rIJyGnTYoSKb3ZTRwEW8PW3ll8RLhtf30puolPMZm55eoyMA
         0EIzYPZ0xQqKxMfPFZqf9t2lJIkcRMDnCgGAtmIBlRDnzATG1xlAMEj/LNkFaAinoUEh
         zcQ68x5v19DGFd417dNef4LnKd6+4voy/DqnmLpWN7FjEUCgUHtjmlJzau8IzMiiHf9X
         /kVpQbNZxI/T8cMrI4hDDBMWSQc4FGk0FqO9aGY+t0iwfl9Skz9YKbYumKidMdlVk9mw
         thRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718303; x=1796323103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfVcGVrBRqJ7zIMdhtS1zygXckuAwk4N3NK9IAnInWE=;
        b=Hc/225Q47++kj+zEYAFrLgmgF0RTDhZiEoGVu8qPg9PTDSsFrqBCouYCU1LU6dUM5F
         Itn1NJ1NZ2xJgz1nwP5nLtlGzfDd7CjgiWOM4sHcpvyGkB7LbmfLw1bIQngXouE0JLuO
         lvmnDt/Cp1koqEvAvzOjEoEfXhz7pRl4DzVLT+j9dnexrdrpObUkgAPVbHpEzUv/Fr6U
         CulQwl2Mk5ZYT32w6wLJ70riL3L9hDekdAjzO6eAvScVuTPoP3kMha7D2LjWem5g63Us
         jBJvKMFwjqh6H+5hX3z8xnaYOleA7vMfZ3tZMlaWCxF0szMZh3/d+TzCOTdmaH3Yp6S1
         44dg==
X-Forwarded-Encrypted: i=1; AL+hErGqCS9FHRzl6Pz0kkKedtM9y93tS2ZmMmAXj5ZgB5b1Ugvipj3iDS2scMI1EIQlflBkyXKlj24ruRvG@vger.kernel.org
X-Gm-Message-State: APuU4Z8ux7QPEvfPLvbLpR1efgDi5Owg2vidV3Q0HzO48hYhwGhOucNs
	yU1qWJb8QZDpf1WTdemXCJz6fMDK82XB/Y3z9NEE7bUOsDHydW5jtAl9drQviVI+Tbxc9Gw2o3a
	atF7TsoKx1T0xaM4Oi4vgBkvw48cI8/WIh0CuXpfdW2YFrwc/CuKQu84Mh1Cqui4b
X-Gm-Gg: AZFdTZcRwnDIJZWOuvDq+2+4z19RuqU3EyuMS1lkSJaFlBcO2ZqPza4hYNlAs7HvAuP
	OcJC7XgADos2BHIhUS4SIdkPq6jBwYWZOVdE5bo5eajt+bgUloV7KNwdB6TxRJdbkeAlomsJPfx
	sKMiRJAAnp5taYNHFi0L7o5Kw1oV1d5NXQk2jEXXMWq1Jl46ZR8WBWaZRGKRO9C/WXb0CEkCr/a
	4i1OAZMaWrsC6FnSr2JDhdAOcQBBjVVYLOgIWO2cs7aNpG+YgTIuCqsB6mc+OdwyMNcUWq3J37s
	NxSXRvOVaYQZsGeCidrgqa7nJEoablWEm5k/lQVphuO+d5K71gdLi954d4sDXyrTxinTg7DIq4d
	aH+2Aj8GAys+h9KWVWlnyu200yJ/PkOBulx5zizQIFcRkB3s01Jo2TyLHV4A1iYTz
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935503185a.66.1795718303241;
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:949:7acd:3c37 with SMTP id af79cd13be357-949bab678bemr3935499885a.66.1795718302848;
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:02 +0000
Message-ID: <20261126183806.172485-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pdGaUqNUjh3HLjJFDMU5bktfRjDblXND
X-Proofpoint-GUID: pdGaUqNUjh3HLjJFDMU5bktfRjDblXND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX+4ogZJqjZQ2B
 lPFqcQVlNd1xKly72BTicjTawnwjFc3EV6LiYVh4hujWDuxYdvjC/OlUlGHMxX63u4AdzS2c8w5
 SFrdQqj0BBAyA18FHFzy5Fk595B5V0PB1nOk6kWGt5/jB39sl8buslZR8CZiTMQ2gTVR8b0SOFW
 aeejc4j1uwaaPE44VqnQrlrOlh2rX+2o1G2TTB55mFEgHh/zGB3skwyWbzOQ0KFsxfVLh1z5rM6
 ACtjrl71/YarOQA3HU9wsCQ5F3wseo2RwpwHTTdHkllHylwruKmwis5XPb70BED/fCYeUsaHCuH
 hWSKzb3a8IhVNNSqYCFWtGQVhDG61JIKGZ8z9BILeXztX1JDmxUzediSQUbvyyJ3DIsjZJGzQ24
 6cr2dFm6rE1N9+DzNrr/bgR0yYbKd568m4e98ga+jxBHSZl0Q6Jqd/SfTYL3D2FY++A/Mi9udRy
 /b5K+eAk6fKMNfc2yXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXyeivO6jnD2vA
 8/F2owjdvgVwl/QvT/lfr8WQ+N6Qf6XZuY/JZDUmTEAizU2AYbVuILwiJM9mGNhRrSN5j+xBqRG
 va2m+79q10rzvjtFQfWu22JOiaLx2TM=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b087c9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=M8yDIIM4nUrurVDekmcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  swr2 is the SDCA primary and swr1
is a DATA-only multi-master dependent (lanes 2/3); the WCD Playback
and WCD Capture DAI links run through the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 83 ++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index bad49ba5443f..84be12c07f6b 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -254,7 +254,10 @@ sound {
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		wsa-dai-link {
 			link-name = "WSA Playback";
@@ -273,6 +276,38 @@ platform {
 			};
 		};
 
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 0>, <&swr2 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 18>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
@@ -760,6 +795,44 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+	num-lanes = <2>;
+
+	status = "okay";
+};
+
+&swr2 {
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+	num-lanes = <2>;
+
+	status = "okay";
+
+	wcd9378c: codec@3,0 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcd_default>;
+
+		qcom,sdca-compliant;
+
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -881,6 +954,14 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";
-- 
2.53.0

