Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794941;
	b=MpRiReFKhlr+lmXoad/DJ/3B2Glq/G37r0PSd8g7e75L2HWYN3qguu1bp5ldXRfyF8Li
	 s8gSxeBYgltimRf9W4F5OJIfeTiKzokyXsEkGR/9zxXJ5gShEdxrhv9XcTUsvLyfcw7r2
	 iaNM0t1eiHojh/yyfBopZ/PAjs/W4HCsvbmeEOI9dgCAWzNGm0qgo7z0Phcep0jNN9LsG
	 cXRjhqpEXRTq0bgCIBsWk5iPina8fWCyIs7KZ1zAIQKZZX2ic57up64s8pFjIUI8KqkMj
	 r/W9j97yr1njmatT0arpiPT0oqblHOkBcxeD7KV2W6tddxUkYQ8718wOCZ5rzdSKIdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
	b=lJ/HIwqvmFILG8F4KwpDu6zYScaf0gdn0WAiVL0Q9H4CHf5nDWvxeOLwWa+qste/JBGa
	 6RjNUEV4rnWZQ4fiYFmYgNa8qUIgyitSv9tmq4SRwYg74r2UR7fL5jLSBfetaNVZszPmT
	 9tvfSOP3qFcRQYk0yQ6OR/YhndyAr4ozYwiwzcTq4fVHpbKXowoJVjU4YFTG9m6AfombJ
	 7JIkXrCQvwnDg/LDdDBTrUiTEYkmLEI+hgJuC33SmI6lX2kcjxk7Biw9Zi/mgGPsMHhBS
	 ZwXc0Uv1EMV7AgnDQjUcu5mn732BkO1yPy0eXTUTF8pkRidP5XIDrX6xuyzdZQ7YM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cstmriLc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1M6lUFF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62024606A686
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62024606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cstmriLc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1M6lUFF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpCsJ2617667
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AlSrlFLmZff
	wL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=; b=cstmriLc0cm87GqjflUjx8V48QG
	ZegzPBBCid+HEXcWRYX8bQGwbpws+VNQIM1udvuRI3/FR3BOSEa/0i3dSTK3bZCL
	sc40j4VEYPbJgpBTue+6iOg3YQ7eZ7KRRyhi6x4aOrtUKMzfLI8hCy31j2OtwFoS
	x4mU7gGb0gRjoW4bzb8NHbM7jR33yo/0tS+5zwcgQXwZDQ+a0G1Tn0XE4HJiQVlL
	ctUheAa39+lcmzwjI/ah0LmI/zGZSCMYD3TQPZ5q4Ct1r6B/zdd8hbhuazbrzsFZ
	pQvOk4R4kHKeM9gsaukzwWvqRuqYFgfze3cxqoQVUiBlLJbXqKT2vDSXFDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hurb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so926152385a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794939; x=1796399739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
        b=h1M6lUFFDy+eIt+2/EgPrcuXNt+3bD3jWNzo+0JSycMfZ1Lf9q0aJiYuYpaHBjvkxp
         nupkz10cFKJwTbU9qAXoCqSZwQZPzLoOe0bQkRZJ61KMmbypT60R/KEXlkVVEVfe2xl+
         JdHG/2qe5vmiliGaA27VTkrzk9U/Jc/OPk520VALWVTG9+Bw6+IBxc4ieDN9k3US552U
         9DZ6tDVmQkdnYoQGYZNVRyZXGd+ZCqDh56pHGl+XZ5hb3V+WYwGB8Mqd+8Ca453KHBWY
         7fc6UOm9p4RyHWNP/6aIsdiCM9PgDQfpRBW+H1hJcJmIQqGRTHRx9XWQCv17U2RcCyhO
         t9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794939; x=1796399739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlSrlFLmZffwL3k7gDfM1QEVNvHBDX3zqYtjiRgM0LA=;
        b=Aw0tT0KyXUxcZEpzR6mhgUwoXKIsN9UQHw67UTm01PQHR6/6VEflNZ0fQ5YpTAHBwG
         lLsL3c1fgf3wAZwbRZT3SUITlrALocGRq5ALf6IqeSxZe0GdyJhLKPHR1GO2ZXyN+CqK
         JxGhg3ikNrXAcu860XQSwuUZQ8G1GEvjWh+xWH0xU7IhTX66B/lLKP09RtNthwwp7SnE
         Rv1tOz4XOF1MGvKSKrKMwSe9HG86uatF0oCwGNHDKokCQ1r3x855GSQYIQxNrA2xLhKU
         E67N86kkqwT5YyudctGrTOnI+9ICT2h7M2siUw+Bowp6eNo48JhQyrThlK+ilI2flu58
         xjWA==
X-Forwarded-Encrypted: i=1; AL+hErGe/9kc3axY4WkeJFsNp9bbxTkJnL03NmMChocsVLvBgU1Rp/ARbxL6p3LMwd1pXB7KTgxjjNYodYbK@vger.kernel.org
X-Gm-Message-State: APuU4Z9ujmXHaLsJy4UDAfC7Zk6VibWFPn846B3iqUkC8SELem43GSF1
	oqmRC9SvcASG69QKLeZZwV4tu3wyhzmsXG6h0G+SjEBAAhU5wKPAf1/HS8NBv9M1EbhMuTT4eZd
	/38SFjotNUvq9VDE/eT7W36wXLPbUtaBD+lA/8jlJGCVUGO6rxILI0VsWe8oSVD17
X-Gm-Gg: AZFdTZf2Ro6AQP0rjVzEtJcU6C45+Fd7nUGnlnLjbJS0whde6wG5YtaVFqxa7JHit6T
	v/dWqhC42P9bqw9FFCvn9H3b6l5HBTBzd2kyj0xpS/ANcULDMn4EbD+07P8cgFMiWJGRpTOzLj1
	wNkmzaYr2WGmhG2O6fTCmWSwJ0yf+aol5JCcbWhJQ5Yaq8zyLWeXt3S7z8WxTLg2mVHePOAqn9c
	mEntoh2KKiVmcVkcvT+BYLpiG8InHUzA9h74zYyUKkFbOrsgjst+Z0Uo5GMVFbVX0yT7h9Ihfuf
	N+uecmh6s4PB+M2Q7R073pUw3ZdLy7MDCrL6+ZO1yXiDqVZPsXAYgRpRGhGSVucKD5rzueeYyeu
	PKUFdonzFk88wNVLKtRF2Dfa1Ho4ia8Y+MvddAR4c+ui03lwh2HUha6nGHbz7rff2
X-Received: by 2002:a05:620a:45a3:b0:949:6e15:e1d3 with SMTP id af79cd13be357-949ba8246f8mr4306428185a.3.1795794938687;
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
X-Received: by 2002:a05:620a:45a3:b0:949:6e15:e1d3 with SMTP id af79cd13be357-949ba8246f8mr4306421085a.3.1795794938133;
        Fri, 27 Nov 2026 07:55:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/7] arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:16 +0000
Message-ID: <20261127155520.358909-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXyW8YLoIkILC4
 PKZAgs/IIUjT+dWAWflAMn1XLqI0AKa0VxWfcIiDQJjEOiPe42QaKC7wyXH2plt0sjtQvJudGfH
 kZ6q+Dc+186iz7oZOxsdvwy1BlUV7Lc=
X-Proofpoint-GUID: r2qBTHXJl4qLscb8r6NPBsDp4h9gD6bv
X-Proofpoint-ORIG-GUID: r2qBTHXJl4qLscb8r6NPBsDp4h9gD6bv
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09a7fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M8yDIIM4nUrurVDekmcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX68CcNWHBGJ2V
 Qg0NsogqaYIBZ7lQ+E/KfxlNabhbBPun1Edq15yLh3p9sAQ1RxQ9prv9FFkTQYrrvOuC9djXYtE
 2XYmEEDzXJ6AFKztHram2nEc9nt5LKx5sd0hG74U92bS+2jEPljkCQETMYohVi6Agc5yGVmpaoR
 IGBA3bVLDPxqA1VF/xQ2cYkEf5QrnLK8+Mst7ZonhmOARjnPWNjvhn47NvikL6nE9RaP7ds2gKv
 Kzxc3i6rdbRMLiVCzdXtii5obf/5Tn1jw92aHAFLQVnPK9Kz/N2nXe2UJQZLzsxt0KD4MfuuyIP
 ZaBPN8ENKSCBCZHmNTQSERo9Kyx6iEY1mnDl6T++/oP8/NliuWFCdwtjSmgUWOIqTrLtXZFNhmj
 GluGhqScqpKibB7iBPVfwlsVOME19LDW8gaDt0hNgHknis0Kaip4aWswgzNd8ZcwsyNU2QzAf12
 GTVM67Zc5zhLE1/xrAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  swr2 is the SDCA primary and swr1
is a DATA-only multi-master dependent (lanes 2/3); the WCD Playback
and WCD Capture DAI links run through the LPASS RX/TX macros.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 84 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index bad49ba5443f..34ec5a52aa02 100644
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
 
@@ -760,6 +795,45 @@ right_spkr: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+
+	status = "okay";
+};
+
+&swr2 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+
+	status = "okay";
+
+	wcd9378c: codec@0,3 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+
+		qcom,sdca-compliant;
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>,   /* EC TZ Secure I3C */
 			       <10 2>,  /* OOB UART */
@@ -881,6 +955,14 @@ tpad_default: tpad-default-state {
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

