Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812943;
	b=ZEJT9DwJN2bLOvdoNjbk1xLyfYQ3tc0aPaziuF98pG/ce3VYFPwxtDnbgzNDI6wYNUqz
	 ROizUF0FL/75Bzdf0GAcCxWLLybqKHnK1NEnvI2PexDvkPhhl5TJJfNQk9BuwxtNhBFAr
	 uTkowhY42XBJ5x1m10clxXt0kHPYa5+RtPyGHbnip2W7eIZLcPIqJAIRRNBKdDpLIHge+
	 8MAWrcEGHKuR/+EB+jVU0L/iNcxqkSGIkX4Ddot3v739B1ocDnx01DKQBeEb4u2CBnBQN
	 UpaARYAkZ8h5/o0bBEyjhT7nb1sHRGtWg8YAR0yBBIn6obOvWrYRVUumuNKCQylZiaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
	b=S78fzkb9Kmh5gIwUH6dl8L7bZa++noYDeKt59p6Cu6UPxe29koPk1gZ+G8UBL0NniAf1
	 jVjmjMV+A7SWnEkkcDng1ula4JiedKbA56piqycHx9hjGppZnzcic+DXLll0b3cI/Kxbq
	 8Uld/6dbvNg5VwyO9H+Nlb1Y9xTqZENCrk+6amSdRHYhLokeEARQGQyvmquS2U/7VIYYa
	 KNl9VMMaBTo/hst2KVdMoXYE0rcYx1RO7IjQaSV57AERYgWQywlluGxA/Gb2svGE7UbwM
	 mPgRc1T9lw8WvCdkTFnu1ndqZWENfE/sRMhl85Tgin3TjpbnnH1IjsycnqVaN2w4j5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZH8MeQs9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=edWR+TJ7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B6606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61B6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZH8MeQs9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=edWR+TJ7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LVaF1585482
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=; b=ZH8MeQs97Jn+Nz7j
	oQXiHB4IkGURaQ8uD+A1xpdIhyqr3dFJIZKT4L7kqlPig5xoeR6JA0r/asWKYhJB
	D5jFdJuSbWoN15p31ZxK6Ssl/n1l9zmxe4JOXL34RTNZit1nGG1bzZG0xRSRpGYa
	7Bh/vGGSPgv/8OqLb7eluzdXznsvZ0FDTfaGMPczh/zTq7mmNidU/xrcNYzmjVFc
	ghixAsQypLshPo03XZNCxZsdlOqq6TI3kqTH87dUI+FgxB6gUMvCEF8eJS8owS1P
	CHwMQMF2wJDd/cAmu5BXC6IAuv/xvbMNpDN1U3/jnJlvjQaZqq+Ji6kl0sgf9a2y
	yv72GA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdw73n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e987ec84afso26090575ad.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812941; x=1795417741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
        b=edWR+TJ7BkxF99l6V7m24S/Y5lqvWA+S6/1v8YrYnBqvwHOVRr9bd2S54ESoceHamS
         CB5r8ZBXTSJwuvzRm8JY4MP7ySwOdOU0ud9S5bB269YVyokgSvLBU4EA11lvMIClzjKk
         vBZ4Q/aMEXqG9JLkX2WDzJoBu2g9t0ieOrsE5yTXc0dJ+XE62ippT+LxWcJ1ron20JgN
         YdV0QznlbpOHVXEYcBD6Ki/g1TYL7J1XgiIikDtpD+BAjlHLqLUPTuIPBZ92j6m2P00s
         b7HAW+AxFaGNQ135E4femHepm1lM2GWn0/fQEahJy6Ogho897Vew3ch6iTNkTlRYpJUy
         z+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812941; x=1795417741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
        b=1XrF05JoRXvFuNEVQ9pcVH9wxiACNC5uc0w56GbTsi9K5fTaWCRDVp8Hp+MNVlriZN
         AVZrKoduNDWSGInkknygVCbAPlDlQcD+/+3l5E18yesBNbfb1P7BsZQoReI3HuOyHF59
         sPY1eZLAVJ4U9hl9sgFr+w25ChE6jemX5d1hU9POyMmQfEJmzD09cvQXibD4QZjubF1F
         dQwMFrT/iJC8pJD15dgkvzoNT1KItvgqYpKwd+urWqmQWmxpZlZOTCRhjazrkovU9d5V
         RLyM7KA9aFrOD95TwW6cOFN3zB7p/bC3WFaIFMO7uRZHXONZVIYTFHjibWktHGw56ULa
         VtAw==
X-Forwarded-Encrypted: i=1; AL+hErErpvJS3tzfxxuHVsTSfrlEu1U6H8xIeKxnN9T08CgPe81npr/R9gZpb9qt7zRXVc8NHFozweiKwOGv@vger.kernel.org
X-Gm-Message-State: APuU4Z9a0wWwYsVx0Jh8R43RiM2os/tyHIph8QcrzALtwAvx8JefGvLb
	AMt/WYvh+RW4SDwmc3Yn1qumqDCquWgZngjoxJ3HmUQmEvtfzDbQs8ISggATwNlGLTWo+dfEnBJ
	VITyzIq2UVSNGLIfxw4Pr17GJckQd0hesDJ4FaFLIc5GSh4j2aY/Kbuv6gt6wCNfC
X-Gm-Gg: AZFdTZeidUbFMWNUk1Q/+2rGO8XWC5Adkf1hab5RyUInVx+Ue3uS8Hzc/ANml5I10jt
	lnxLgGnlSJQm+/XNs3GpRc/Cl8yx8nz4GjiTHlNlc6DLKfBRKeBBjt0Mp+MDYsZWucBCrJViEwZ
	lU5FfXnwY1cvvqhZBrLx6H3Ar5OIJb0F25Dt0ncUGI3NDXRH4QWNfDnxSnm+Iol/T6jnH6OnptF
	z2YWRHoc0KDJ59ElHH4MYH2AXIYRR684FUAMpqOEP0/x6BqooCRcAVHCiPt4lurafDQTUnyAwK3
	0UgMAkKQyL59oEwImPGNgTdxJ2BWnA/ovmlgnSCRc2AUcAJBD/XdTNSCLW2r/3ob89NGNKEnYxW
	Rl7NUegt5lk21hOk9HHvZ56VS0BrW94b5Vi4d1/Q7oqU7WB5bhX0VQuAo0WOGNX15LQzbAQuabA
	==
X-Received: by 2002:a17:90b:184d:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b1b0a0e8dcmr8498757a91.11.1794812941460;
        Sun, 15 Nov 2026 23:09:01 -0800 (PST)
X-Received: by 2002:a17:90b:184d:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b1b0a0e8dcmr8498723a91.11.1794812940978;
        Sun, 15 Nov 2026 23:09:00 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8658667a91.0.2026.11.15.23.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:09:00 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:29:50 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: add Shikra PWM controller
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
Message-Id: <20261116-pwm_qcom_shikra-v1-3-67ee4553adc5@oss.qualcomm.com>
References: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaac0e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jcq69FRwgK9YgyupxYoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX8huFhwVymcBi
 EDJ9ZOrb3Ak8H/wCXWI6AM6IBR3kOXx4xOUassmu1k8UxA6wWzy6MpOoTL18KBUiemXdwnCEUBK
 pFmASZGgkBV5bZzRx+XOefChMDpivlQ=
X-Proofpoint-ORIG-GUID: iahKUu2WgMuhNOnx1IBi-n9flB2iVw1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX9SxV7ZVWE1Ao
 XiTWqeNCQ+pLpVHpXfyo8ioap7jQdVBKZxFUmm+0MbQHPOnGK40/UxN5i/hqbBbSqwOo347880S
 yN11TzUoOhW/o0ESqqBj4Je+Hl2HRQ1Sw7eDJisWtqy3r1WDIYElojWoGHcNs14HPywTRgPAoqF
 RjURodCNqiFxMZFL2yKLSEF6DoN1FrmuE5c59YDICKOBqGOyTBlOQNl4lctbByklG6r9cR1TJgg
 hBHwV/X4JGUicVh3sGHGgCbMaAvBpte5cbNzGV7WnNfq0MVb8L12HbgWXm1jXLTJD5MFaR58H4u
 Cz4BlXyYFayS3Rq0uUNnPohANBQRKwK8OL8WcKWVV1DZrt1XHYkpTPk4QFMqI2bVh39k20coiKt
 Rt21Mnat9lDdHdMhJdf3vrKvGFfkQrgbq5y06eGqXsiprRGOtErY2dJsTouo1p6JlQZItmn6PaE
 Bz8mH5LaFSCm4gku7dA==
X-Proofpoint-GUID: iahKUu2WgMuhNOnx1IBi-n9flB2iVw1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160028

Add the PWM controller node with its AHB and core clocks and the ten
PWM frame child nodes to the Shikra SoC DTSI. Assign the shared PWM
core clock a rate of 9.6MHz.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..d8a3de38382bdb00684acd709f4d34136792771c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1303,6 +1303,69 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		pwm: pwm@4700000 {
+			compatible = "qcom,shikra-pwm";
+			reg = <0x0 0x04700000 0x0 0x10>;
+			clocks = <&gcc GCC_PDM_AHB_CLK>, <&gcc GCC_PWM0_XO512_CLK>;
+			clock-names = "ahb", "core";
+			assigned-clocks = <&gcc GCC_PWM0_XO512_CLK>;
+			assigned-clock-rates = <9600000>;
+			#pwm-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			pwm@4701000 {
+				reg = <0x0 0x04701000 0x0 0x1c>;
+				qcom,frame-index = <0>;
+			};
+
+			pwm@4702000 {
+				reg = <0x0 0x04702000 0x0 0x1c>;
+				qcom,frame-index = <1>;
+			};
+
+			pwm@4703000 {
+				reg = <0x0 0x04703000 0x0 0x1c>;
+				qcom,frame-index = <2>;
+			};
+
+			pwm@4704000 {
+				reg = <0x0 0x04704000 0x0 0x1c>;
+				qcom,frame-index = <3>;
+			};
+
+			pwm@4705000 {
+				reg = <0x0 0x04705000 0x0 0x1c>;
+				qcom,frame-index = <4>;
+			};
+
+			pwm@4706000 {
+				reg = <0x0 0x04706000 0x0 0x1c>;
+				qcom,frame-index = <5>;
+			};
+
+			pwm@4707000 {
+				reg = <0x0 0x04707000 0x0 0x1c>;
+				qcom,frame-index = <6>;
+			};
+
+			pwm@4708000 {
+				reg = <0x0 0x04708000 0x0 0x1c>;
+				qcom,frame-index = <7>;
+			};
+
+			pwm@4709000 {
+				reg = <0x0 0x04709000 0x0 0x1c>;
+				qcom,frame-index = <8>;
+			};
+
+			pwm@470a000 {
+				reg = <0x0 0x0470a000 0x0 0x1c>;
+				qcom,frame-index = <9>;
+			};
+		};
+
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

