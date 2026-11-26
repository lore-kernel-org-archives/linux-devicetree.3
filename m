Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718307;
	b=Soy+fMDr6wRcfmyOr5df3ORbkmJSBK7i2oLacZcv4RnwwdXCITZF8tW/llAsbp1LaBZ0
	 shesokPZwUACBWfXuU1H1kdfLcRvjLYJSEoVZMtDkKHbFrHkWyETzCo7+f6MCVUyuL8oX
	 /1GkXtvCmZQytwnMU2qo1iqgS74XowNQK4IJkpeln7AT9GIvBj2fYVKVGdUWc3to4BrOn
	 QIxMEk2LdGmHfe+Gbq1lMFqWa5QaQ0i7D/bw/W2GGl6dxn9zfLQxaxU7BEVN88ldfIXbs
	 NWYNADdjJhN07netsy5Xyi1guAGsDKFY5+qGzesVHRRZfuqK/3ws8hDU4YmZk/InE4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rZ77rrPbpTMti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=;
	b=Shodi4fkU/7GvwBp/6ShpNE6G1iMVBf9IgG6F/1rFrDptRWNLP78sEIuh4WU/61wzz63
	 wjRwdLRCp9Nel0LXEZl4VuDXCC8zu6HYgXWUJ6jcM9luzAR1RPdAe4dSKuhpOBgwSIPGm
	 ssi7fCImqpqb+YZaOBfRB2E2kxPTKLSGVx5Rb2sY2WVyBxujj/bhWhGukgAvfoG+RFASh
	 dui4YvjfxwHI5ECg4/HTvy49t9/zDJqTOT7x0reg7CWI2+vCWJXVqDKTWSHXDIdXPJGkN
	 9C9JSmYjEUblLKF1re+ZLL/1aiaOXZtAxjRzr00xUPwNmqZi96im+pWwQYNxnAZCD7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUE1YKph;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVl49IfZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B11606A33B
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B11606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUE1YKph;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVl49IfZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQH3JNT3470978
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rZ77rrPbpTM
	ti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=; b=fUE1YKphOZWoz+N54PNqlhiZohq
	S+3ResfSUS1JUfKlSiZuT3i9zpi9nqVy2gmjd9akn/ewSRtXKs777tLqTONWoVG1
	Tu8veF2r2LM4YzOUVgBYYIe+12gQp0ljSW1VSNzUwrlDRty6sAvaRuHMc0juOzI5
	74llgG+wyqE6cuFLkPGj60OShnUSmtJeZ7zPOQ/pNCtblgcKWHJVkt2sUd+f2MnD
	nGNmf2W2081w52M75ulPUb6t04vtSUA0Btv+EIaxkAdrCUVRT9WfbQrGGibZ8iXw
	OrJqyzOnYG09zWVojmohC7IaLbdj4V1S5IkfpVZvCRWqQgJd8NAvhRZmpKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru387tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d32f54d21so141265541cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718306; x=1796323106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZ77rrPbpTMti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=;
        b=eVl49IfZCJ0V6WYzLGDHCAzGfo+qTKh2lDRjdclhMmnwEv2Mf4P0mXJWA6L2IoWfnO
         jbrG+jrwvuTT/xNr4GE9p2IxPYp3QeTCj2PPM0fengQWDZmmYDJNVHIIH9ZYPWJQrpwD
         NJXxMyHCG+Y9KiuPgAjci1/DtyNw2XNqLyMQnCgYbwBgOcerj+WBgnCD6cKbBTQ/Hy6b
         2Ao9ogFLZZoeRIXueqFtMqnAjvnm2lGbyNPl9+2gr5r0RaPZlgoaLkhhu40ValA1ToYa
         XKpKUXe7MTFMVRRHUWN8yeoN8ZubuPn3Jbs7L9+J1Jc9/FEy7AZzvVn8c6bw/LEBfVOw
         Q8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718306; x=1796323106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZ77rrPbpTMti4JAz9Xa5Id0mArJS7dhs7MItMO1ANA=;
        b=rrcZVGbmYTFdI+g29xx783MPINRGVMPEA5lFtP9ldz6fOj5twNj3FIkkD03zNTZHuD
         hYuYpGl1GM7OHtQqXlGaEJI6tz+7ZvG/0b30HCCvvVRBxFtmu8A8O1nkz4RIfev9TCT2
         dABklpOPDN5LxLzGoXl5NozsE4rdnj4xMyKpp4kp9bJCCj7RyqhbxYi3eJRvJUdLNiTD
         4eeLtxItNfOcZvOuEu1bV8ZS7fs0dVoSOPx4UGyUBGmbUBe2RHwbNyiOxPaDa4WhM9Rf
         wEg7dh0No4GdQ7VqHswkGGzIH3BLM6LCYjxc05lKpE9VcHARZieeaL/FY9GT6YuGj7mr
         Ilgw==
X-Forwarded-Encrypted: i=1; AL+hErG3oObq2b9yjt3i3aeUPfcZfYA7U0LwfQios09qSBZ/N63g5ROm8lzVC/ffmIDlWMnDzivQw9Asi582@vger.kernel.org
X-Gm-Message-State: APuU4Z/uIV3XP1ojblAH9kuqBZXjIU8vlTXb1AfcDbe5bQiBbHGECcON
	2clP1ThfwbiutotvSK64MMwa6sz2zHvU2fo/KnyhSJHSYZKc7M/sPMLYEQ2KKDqmUd9PNOzDC7j
	ld+YZ2/qen/2ZTLxaRizQjunfztUz6JMvGKn+FnOhBsVgNGLfsP09jqC5cL7x/YiF
X-Gm-Gg: AZFdTZfX0ZhjMT40/fXatwO+xUSNUyJyxaZL9YmwIoXgyfCd54w8txOcp9NR0K3BeXw
	W5qiTG9oYQ58fv7a2HZENI9XFGEu9NEczbEwl7lLr9KWHguGmPUaDy4gZ8wF4uV8tzEKz2vtzsJ
	BpFRlxSKntYFXDYCtYco88Ppeh4NITx0IFo7OeZpoJSbAFr7/D/I5+aXW53QQtO21Re56Ar6ccj
	0bIbTkU+zbcz5EN9+dBtzT5E2l/OeUsV7dJP+/6w/Dp49vDRJGsYJ3PQoDQNYdTzu0c4z6gWI8C
	ZhodAJ50a3x+tVgKI9B3a8TW6pZSz3v6np0alhi5vCuRII4So/HoS14ewFwL3Xu3/uFCrdlsv2m
	1LLRWcGVH1a+bLKcxZoM4cKHwQdv+TO+lT2KJ4Y3Nn0E+i4Ppu4i7qaBuui6gtD8K
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr3996340185a.35.1795718305786;
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr3996336885a.35.1795718305415;
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/7] arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset codec
Date: Thu, 26 Nov 2026 18:38:04 +0000
Message-ID: <20261126183806.172485-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b087ca2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xQsMbUBcp26Z66NZsYQA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 2h1QVatOh89B1ImMXsEN1heQbtuauOmp
X-Proofpoint-ORIG-GUID: 2h1QVatOh89B1ImMXsEN1heQbtuauOmp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXzDmqL1WU4HCa
 Lhwe2EwyYD3y3BgtHogt+c5E02dmL7v9GeNw/rlmzw1c3veBBngg5Do8d5t2qdifNoBIzl9N+N3
 RPD6PW/8/0vILQViQx1b4LJZGQUmuEeJ09MPgamZQDVa7xYwGD/uZmrDRA158kR3Ep/jR6owzIU
 prflgb45GnbWbjfNzNqxq6K6ODSWQ8QMgvF3WS+5Oy2qh22wbbXAzTOm3SvrYMeOjroLHlwulDa
 ImM4nzpa34OMN30gfpmZwQswj6iFV4jr9Ai5l6QJ8OA01TYMkrW5LIA0z1O9mbSISNXcNaE3l3S
 KOMPwZ9THoK4s0wiebgPoBhvnzHye6okysUHvzmLKE9MGnZVOUYxJ4NJO85pmkRyrRNAzbsDuWk
 HWN/aQiRMHgoZRAU/Z/kNvGhgwhQcaHY5QBi9t/CbfrUsdfdjsoqabE/MUHF9pJFhHFOOrCUprq
 uldUCHQx9Y12GoIliKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX7h3lZvi1uL7W
 Ea3tZzqm3xgC2CivHo6cBH82eEmlLqL4mVxWJLPwLzPC4fY9qbWT2kLO3B5pTUUu7+BBwxCjd+X
 we7ia68Ld5/ORBLNjndjjvnlbx5tS0c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  Adds vreg_bob1_e0 as the MICBIAS
rail.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 90 ++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index c253597b5a5a..ca035f10dc6c 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -272,7 +272,10 @@ sound {
 				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
 				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		va-dai-link {
 			link-name = "VA Capture";
@@ -308,6 +311,38 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
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
 	};
 
 	wlan-connector {
@@ -351,6 +386,13 @@ m2_e_uart_ep: endpoint@0 {
 };
 
 &rpmh_vregs_b_e0 {
+	vreg_bob1_e0: bob1 {
+		regulator-name = "vreg_bob1_e0";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <4224000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+	};
+
 	/* Unused */
 	vreg_l2b0: ldo2 {
 		regulator-name = "vreg_l2b0";
@@ -763,6 +805,44 @@ right_tweeter: speaker@0,1 {
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
 	gpio-reserved-ranges = <4 4>, /* EC Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -920,6 +1000,14 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart14 {
-- 
2.53.0

