Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741BD43B492
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093680; cv=none; b=PzRMULhoqr2bFL1TsJc759zEEaOZgpGVi7nNXt//1D71NUHcZn6lbhPNvfCdA0UEVR6X4t7L9onHsArBHMkVP3q4kKbQLJfANju86lDenxcTd6bf3yZhj4Ozby/CgTl+z7qNiVk3t71jmHF/SBzM59CH97JncjCro7hVr4l78Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093680; c=relaxed/simple;
	bh=5oab1R1aq42rAyzD3U2Std8brNnLwvPCUtJcAWd+yfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRm10ZSb1m0Ws1IB6ie2exBR4ZV/H776edmVOijd3EYPUHmM6BNlghXUlRCLSIygwmnnZecp8uhwcLrUjTeR3uku5mZazuXELSsoZU/iL63/bThfoAr0ZxHZZAFBAr8KfpgrIdFWoqlw0UpTyqt9BHv6nbNPGSBxfuJjOSolDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRPTr39B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7Ck44Z2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRPTr39B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7Ck44Z2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FI3gdW3902237
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wMU0CL1oXRl
	v1bCCuzBInDSj9OJvGkz88zUTHMOfhDs=; b=GRPTr39B8OuQ4jXdhqK6PmFDmh7
	+sCGjoJoxuyKEwPLsNYWWn0wknW00fCPWKD6K/Y0XEyXl0CMMAsgY8pwVyxRV45P
	AsqdidnHUpOdiwWJwMHL9Zn3fvhwm1Er8ug2Z7QRBE0mZ75fOhsRwfIKUirjFmay
	jwL3sz011VH9x6xrrRhp1BGe5wdq3fQJvY/yjEacB+cpE1C125iV3gWMv814y6oH
	oiz0YxIPKVTLNlJyTbYJBpwNn/B1ah2s3wj+wThhIn89IBdHduPA/6bI34fb1FjC
	8mM8TyuR54E/tAAI5DoU7bzyq4Mw2mKXJUHRkWsytePAYnQpU92FNl/kbFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3serbkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:47:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso387916685a.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093678; x=1792698478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMU0CL1oXRlv1bCCuzBInDSj9OJvGkz88zUTHMOfhDs=;
        b=L7Ck44Z2JCIlBss/vlFi/GSC8FWjnf089laMbUSLE6g+ynAA5niI1Lcdvab8c5pKlB
         sIAtRjzClbPBGFmGmOg8IRmt06t10vfQkNVC2jN9FUQ25OsCf0oUrpWxPk36xbfTs002
         HP5UmOZqGusljyoBfPZTQeDQvqvauXo8N7xCWIq311gjr9QwpJiyL2luRFhG+T9VOsuF
         02YFDSosnRcb9yrrr7bx4cUAJRhgBlKwd5M56c9g7Vw2Wsxi3OP2/paUI7Das/nGk6eL
         xQqDPYGqEGvH2ivQE+pJiaA/HAcxUvBImtbgUAXwVupT9/rz1YqcOW3tov3hJv/Yhx9j
         Twgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093678; x=1792698478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMU0CL1oXRlv1bCCuzBInDSj9OJvGkz88zUTHMOfhDs=;
        b=Yp5Tn8VnjM3+olISvR+eDMlNtwa3kLAxFNtc9BSU/yse66dMuC1g3aSNMF7XRemCg+
         sDtMT0KwJjupH8g7uJagUqSpkNHdMwzl+8VtT+94vkQFGr3xm7uyi3muPgz1uv4wEC+i
         PCTKxhJKLQ5Uo6P8xthvPNUvWkIdVhRK2MlIdwVmrSFptovzFhNY/og1OpWhlfJeVIWJ
         dYKIlM7pp7AjbCcN7jRNf04NugX5WdxfyaNvdmGUKB28dlPFjdDrnuqGoZjnUuhinW5I
         C5Ql5DH8FdpYb4vELPOzQkgV8xpm7IxaW37SY7RrK+FyIM+ABzu5/pOJfr1yq4DfExky
         YClA==
X-Forwarded-Encrypted: i=1; AKwUvBxk9dAF+MPFlAnd93gn6w6Nz4WmIileFxndDEyQ2qHP8c8HEvRhpZMjgff8Tjs4cX3bdtCg3wVkNwuC@vger.kernel.org
X-Gm-Message-State: AFq9FYK62/mcnEZRV7IyqpP+yqEAKO7WSVr82+wGbWaDeTLNLCAbKopl
	wLqNh4fxlXjwWEiYjQlkA/fo759EJsDftzibiBXEu8DGVmav3tywSDRrYMujBWf1uqr7POo17zZ
	mFFEOwwAoivp7B4EGKcbWmpFT43xjgcGjqnLqYk5kIHWy/pt0gfNqSo2npWtNR1DZ
X-Gm-Gg: AYBFou00/XfoRVY6tHcnOPatQTSXmSorYuS7/hJXITfDhbvs6Q7Qm9bKna5IJL4HJcN
	kRjKK9xefyoGjfUozvGpTllQkWJaHvSsu3/sdYSY6YZnYhAlmRGEKcs6H0gUSSH/yjkGRw1652f
	rpaovlchmcxNOFIpGl3icIy75yOIXXLTQlXghe6/hOHqOrUM/mm1AipmUA5spKApUSqWFX5DZU2
	m/IhfkqNenKwnrvHCdn9lDUSK5IIf4YHNtO+rJ4IQAKq3Ibw9WL09608B+HHD9DdJS040L9ozeO
	AkEwwL4V3KhUtrGIFe47oHeojgvKmAcAmgr5z7CfIGQp3kjUY2rwBmRPORLwVi3ovvmCLChkxKM
	Yt9zxDa86Ub7w
X-Received: by 2002:a05:620a:1b8a:b0:93f:9f2:86dc with SMTP id af79cd13be357-93f09f29e75mr757822585a.83.1792093677826;
        Thu, 15 Oct 2026 12:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8a:b0:93f:9f2:86dc with SMTP id af79cd13be357-93f09f29e75mr757818685a.83.1792093677253;
        Thu, 15 Oct 2026 12:47:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: pmk8850: add PWM node
Date: Thu, 15 Oct 2026 20:47:30 +0100
Message-ID: <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GJ9pwaFzVif4xb7c696U7FlrZA-Z4m8X
X-Proofpoint-GUID: GJ9pwaFzVif4xb7c696U7FlrZA-Z4m8X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX73RSx324N4b2
 cQiR2izIl816WN6QIc26X5M5HofRItidfV0GdwRvAMapu9U+GE8FQLi+s62AhtzbxyPtSB/r7OK
 8j4K5zUU+90m9bkuOWDCBtSgciwCpZc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfXy7uJCbcRKNWC
 YsUJvX0eycrD86lBTTs/hhDppgNCHO5JNGWL7j3RwIpp+AlnHTio3HrtIZKIleU4YTLYROT+Ibq
 udTWSZLM4NE8BVVAXZ528HeOKfJVa2sF9nxHqRm8nB3WPV6/NNp6Q41ltmWuJYHnPMvYOntcV+L
 od5npyicsmH1I3SRLYBmk/YuqU/Y4kWc2eWRgq9hx2kgslNacGEAffBc5082vhIdMqwYfVOmXD6
 DlSPalYAL2vydir7A+2rgoNbDwkl6FoqI+wuKwmSAdA5XJgHCy0Z3jxNiL+YUR2ONu90667l781
 W98quZ/gz+beW5HHlqF9a0aRw4cASr4HCooTW2dzrOugYXdR0oiN7tRxNpwFUeerzJVYb7H3EAZ
 U7ErnFaozmeiTRhlt3m3tRLYoJkEkjXnAAj2VvIBSbD+DrBxB6sQtuoU9VT74oUu1vSw8APczY4
 /TUikeWfehKlb8Tiqqg==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad12dee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zgIjqA5jzSmhAMQQ9ZAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
disabled at the SoC level; boards enable it and reference the channel
that drives their backlight or LED.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index c7ba72fd48bc..79c87db8e95d 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -66,5 +66,15 @@ reboot_reason: reboot-reason@48 {
 				bits = <1 7>;
 			};
 		};
+
+		pmk8850_pwm: pwm {
+			compatible = "qcom,pmk8850-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

