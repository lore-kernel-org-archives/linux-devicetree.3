Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364128;
	b=aoi0Rx2PGJ/n7v4CtE7evkJRzRmJRhfyXNI6xOqamY2KCm5Ry5MhnmNQAliNwKu6T3Z0
	 BGS1lJV8pGh3K9UiQ1zampS4tR6OSvpfuj5xtCtqvZ0Tin8DRfoDKbgxzoeyjJ+LaM6nc
	 N3Zj7GicxLWVbq3zWd5z+hJ6O1FyAijLMdFC8rv5xT0eD9yRK441qCZPhHjmVJ2Hg8UON
	 TgiM4Lg5KuAppyIwl30oWjsS49l4mr07cuO8RAtpCglDwZLRH6ZGBaCoHFD0y7CUXCZCs
	 nDzGzxKZZMr52wVeREn8+cMm3LRx8uIMiNKtY6o8+QeXpuuWqmLBbHyUo2DcnSgBRkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
	b=tQicfWSXbPWRYAbWSEHQRxXeS7ecImoHYq9faKB+dJjJUfrXN+wfuTrlq/dnuvbfgDT/
	 aTET7sOJRZKiOI+tZM93eOJNLs1/V7O42/QkZg44sCok7wocV+B3e3+xehHpN+zQjUqak
	 lmJTkBA/rqafQxZWgR5D66jTcdXOr9tWuMItYlAPI8t2ZGasu8Aek/VcF/gYyP1034yZo
	 OtBr8neSs4nX2juIfXaS4Ev3Hgw6+IBIbCJNuHJqEbMVjsb/7anZAyBP2hFVuety4v+il
	 u3SOrxro+XoZQfS8EHTzMMi4S5JkihgjAzMZxRhxAckwc95Qkl6Br5BmA6AG924PG9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PL0+5ech;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="S1TrmRQ/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C44606DA34
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C44606DA34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PL0+5ech;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1TrmRQ/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQCO0279331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j6uKzRJ8kCY
	GlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=; b=PL0+5echE2wMGsS+yaH0I00U4xS
	JYtrWDJWmnzwKiDnzrn1X5YNiNvu7mUSO2w5bD/CSHyN+cxtUVnTzsHdRAhL+1hn
	z0BVMhKZi6Ww3JyknGztcrzJxp2yJLpoBf8u3b4UKBBteK/TjlPEg5Im2h5XoV33
	/V5s1NRrkbb52yIZSLm9QoInh+EJ+6orMBwToHq7wXLptv5dGt9vqe4Fhea8zeul
	ciZwq6J/65Y4fm9cWbBesPR0aFbpX07p6mn5klv4Jnpzg3bu5+3lwPdtIuMOx8kT
	5ozOI5Lf9mDJIXzXhN6RQkR5YEEgh/l85dnpiVpdmdab/drEGnWGDmBFWWQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6kth3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so410080585a.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364126; x=1795968926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
        b=S1TrmRQ/9GxMj/PovrcY8LwG9Q5yHW5V83enfCX4DiKUeck9a1alHnziylSCXRpuZV
         lqL7IEWU4UsPHdz+KRnIUkqP4L5NlrXghPBtRspv375Kl0hwkjj4GQ7sUTWJkqqclHoW
         4AGIwHxjoKqW0gqCc7eWaxikPtSL63cTf6huoa4T0TX8N454WhXSeOQ4X009jsnTOttG
         9UdhXB0UkM7Tr5OHgaB0CExPJlJtBJUOJxYbR9Cgm+TxcnY9gzhtCptGEnr0DHRfwL3+
         69rIClkeZI4RwgA7+zXURVw6wXh1wPEp43mYjEo65tO8rFePAVyTaCGsTpcMJK6Uyih9
         HKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364126; x=1795968926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6uKzRJ8kCYGlP/+QGRq3eRVGcpdCYk0Sxg2glGxdVU=;
        b=HgGx+QkQfpsVtkj9OkeG5KPXF0D+1XvX30kLGuogE2Wz+YEQS3zy4RCH85wI36WjHO
         jtqbXt6weTrSMzD4wRTiJ84v4RIbPxcOBRPsfj7ivGHvvXvZ230EHX93vC0UR+r0b7GA
         KXpwYF25JoBP3eP8DzNWhPegfc0AW52Qt2WgmommsCyuUbrols/+sw94j+nXjngEkk8j
         bXlMIflVggd+SOLAsF2x7kU8Uq3E8MLE3hLjDplRzGQYxHf7IBpgg0p4uoWAAwDUwX8z
         JvyQ0G5SuMPv+ySytjp5LV6K3a1Hq34QyEV04O2FHkqGPUrYabKCzKadlhEYQ7UcR3tc
         c+2g==
X-Forwarded-Encrypted: i=1; AL+hErGFGxhxlapfxa0/jZ+AQxtp8HUwgphNcxDrkKHANK2izVrFVkkbgZ+6ZrLLxYPQWNp8GoHM1Muh7KU0@vger.kernel.org
X-Gm-Message-State: APuU4Z9swaFNRbEuMCIgB3OyxXH3T1qENEXJWu5KFGZR0+QwBgDqgzLh
	6JGqyXUdFkOvYoC8jh6l+7suzFRIFkczwlIVv33P7hC3OqljPLzVvALLTJ9G5gSUNrzK2FX3cRB
	nAajhH6lswM8Bi7rf47I2JQDgGxFzeeP3fSF8U8lZtdItnu824Fhh92TNFe021Pci
X-Gm-Gg: AZFdTZfYPfiK0yAx3YxESRTVlf0kWupDENWjNtJxPTFXfXZxwmuOYq97SXM4KmnJb5O
	ZcYAO7N8/siuqnvO2fTEVe5DgwX1YQR6SWepQ46qTiODyDALPIR6d36zpbBCuM3bA1Xr5DlZmPm
	/oW99MXIU+/kjWgR1SLGMA0YGWMNLYTcG50ARvuyUKubRcV5Pd9D5vLX+ObCpvqi1U9RgEoYa5/
	f0bCxxFPhzuPR3VGmkNu85kfmWsUcZZM9GooFI4/vgndWUyPi7/uLm9mDS+VAknOoetw46wyvUU
	2B82TAyGAXypOW9dJnJJbnIujjrdIYzhYx1zWmdQsxLNvxh4+F2HmwjhkW94HaWR46T7eg1e2vG
	WsfNqLkaAf9hw5onGNWRl3dAHNS//3sMMUkuNfrMhU5XXXWZTsdoG4Q7d4wiQ7jvi
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr1496073685a.52.1795364126164;
        Sun, 22 Nov 2026 08:15:26 -0800 (PST)
X-Received: by 2002:a05:620a:130f:b0:93f:365b:42bc with SMTP id af79cd13be357-949ba9dade9mr1496068785a.52.1795364125757;
        Sun, 22 Nov 2026 08:15:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:37 +0000
Message-ID: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: o--AjXvnt4FHir6GSflF4K5QE20VxmoX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX53rqbSxJFkYT
 X0VJJMNiaq7i/rFVj8yIIw9gkndm8WGZhqrFNAZATpJPn8viMwXb6W16Mn1G3wGjnzABCvnwnUD
 XUhmtjyZTonBMGXZxULkZo/U22RiY2I=
X-Proofpoint-ORIG-GUID: o--AjXvnt4FHir6GSflF4K5QE20VxmoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX6ZcqQkS/qUGV
 QHsDcsEfLTeMuSbfy9+o+upzyEjzUhkcQY99UA3ixT/fB0nVxhpkBIfrt3wurK1q6FzqE4gqnZ2
 Izj4HS6g4v7Wx8V6oGO4l/fkCoObmehukTYcPBDUjfGyR7gXTcilQkEIRUUYhLzH3FNxo5qNz2A
 8ZWv34prleL10RqdzXL20Ur6c8fGcN4VPegLQoJ3IBOg7NRD7xRNdjyBrOqMgfdejucQp5xVcgm
 BW8fa43BOdMqHXur0FQczHebvJawokbYVYx0PcBHIW22il2lH9bz32ag1YToBNYgng6DBDaXFLc
 WeKW6WCdbisyfhKrO2vQpn5UiShhc7JGSoIVul1InAsG26TMdOJXvGrlPl9blvkYRAVJDQWc4r4
 3Yi1/WhGat1EJv8Taf8S8oDcc2PAhZtUqliSkTX2MnW54U6aLh8Kt1gRPXLzq0z3juFnmNgXrFH
 blflBkaDwGZU4lduxYw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03151e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The VI sense master ports (10 and 11) are picked up from the VISENSE
slot of the per-speaker qcom,port-mapping, which differs from the
mahua-t14s Gen 7 layout (12/13).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 1536ad8d4793..2c7166e15097 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -477,8 +477,20 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 10>, <&swr0 11>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -1452,7 +1464,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
@@ -1464,7 +1476,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
-- 
2.53.0

