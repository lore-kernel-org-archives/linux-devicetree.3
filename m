Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636364;
	b=H28V9TKv5qmlDi5HhzqFJRAEWcbB2IbUlRpXsnTwdaLWceeA+oPHRIYTGcQbH774OMY4
	 vYhcAZ/ndXalYOmO/lqIpLzH6eXguPVnBzgS8nPpAsDMexB3m0EgdvgxGsp0h7gRMX88h
	 mGf3RHdE7jKge6A5C/mGpU8oI5kbju//CDs584vK/hS2uieQatsCvlt+pmWAUjdW92Fd2
	 Ic2dcucgBVULrTbb5TlZlIfyEKx++jZUhEzKINBW907HVig87MOa8wTkd7/fnyadrVDX8
	 waADgQ4f+S112jutBjbpctXwupPVty7FEv36L9cquEaN6LCrb2pOR0KGzoSfDMdNPIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
	b=IK2fgUVAYW0pLuH83qGAI/sg5kZaiYMaMVIGd7kn2a3g4/GFVi/Fkda9wD+ft2So20CR
	 glxCNWWxCOYAiK2OkyPfywVurwTWJuDoxqd7jN1DTBhZ+ZwVwF1QmL1GW9p5ahPVBu8B6
	 BTRuNMLTMvYn+Lm1ayM4Nq9Gq879529w5WwZpT1t2DcldpV+mOEufm6LFI9+/oxWbZ4nb
	 vqgfoPQAjYzAJruGP8HYI0Q//QusM3QNuyfEOhdoPADTBN9RTqgXczg+rpri7TXkN7M6W
	 sGSzTWPtqR4DybQUGUWb3E1FCaEBicnApyUlUbqHySKCqJ3BC/+1+ZPL1WL0TrgHedg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184B4606A333
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184B4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAtAQ162738
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+yTEKtv1a9
	mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=; b=XHu1ZAnbmrEJWrA8grrqU8YU+Hl
	ANFhDJVso+pHirUX0Lv+kVvDJrucArnsRoj3jnAdKI/l0TpCJZU2gugn5w1iwElU
	iKNwxTSH5R9uauP2UeDVCN4GajNN559nYDbTIynZb7htPrUE0Tofso93rJcaRVpU
	R1vis4vDH5SzwmoONAgdIJBDBr6PaotxJ9cTrpz/147/etvPtzstOQPNuoFe9r5H
	9VQ+HsMeC6jWOv8D5ZDEBaPLM7gTUXTGy+b5UU3ev8T/lXvBgWET+669ogYhEWgW
	hk/WDe2lS4inZ23gYv2P7nbc6hrrx2TlrhKTb662BxB2/vGfGEEgSSIqCTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeh1cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131befso900518185a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636361; x=1796241161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=ZErE6gHyPmcexilO6LYBBM2sDxoB3MDsQ6L025EJZSaepEIlw2ibMAOXf8+p06q3Dr
         3MEQiBrWbF166rpcj6PTF3HNAgM1DpAJmxg61GDtVvTLZrlakDlC29Y8kM9R3qLQzsc3
         YSOqi/IT9fZuQs1rLMwPFILR3RBjrNVKD8q2JcwnpnTORmYWc3qH/GwfCbj26Sp3lK3t
         h2rgqd9QRTX2w6XQnFgLJiIzNBCv8K8UeH7togiMhKHO4T5+COiBR6nyRxb+3XTn2gvm
         +GdSMPuXBxuWjpcoXnry+eYA6E3hsN4Ego2JGGX4vmhG2RMeuX6y7z3ayQ37ozXmL3dF
         j5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636361; x=1796241161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=aZpzEM33sGD67Is0wkzFaOMwlFXKZxvkE9sANuBH6woPDdfnlAU5bzdOjVW28dTgnz
         eZ6Yl7jwYAQVJcj9yofHb/MQzw1BuKk7OqidjRVZVub49okhvkV+1A085YMoCutgIPip
         Cp8CRJK0cbShyngKbT0gOWCGFSrGIkQ2+IvHHfeAjnnuO2iKktAhzWBMbv30p8Aum/hd
         oDDDIw3AKQbaYl3BcBejBiuj09RXu9VlQGw6c9XXrAcr0D66U0FOH9mSHbp52gGOridb
         y+tf1s1uwi7QuNK45rplvhC7vXVU99ZOVqDdJBqZggPCG/EijJAZXHGLvuSdVv0QDTtr
         yQ6w==
X-Forwarded-Encrypted: i=1; AL+hErG6LtrJbMQamuzOkJ6+ZpnRjuqlUAosgd4lZpc5l6NhjRRqrAXfsk8peOd1Njd6UdBkJ1H24l6hSvjV@vger.kernel.org
X-Gm-Message-State: APuU4Z+XTl4qTuv//K6xQn4tJpfkMU3uf0PoI0c7qI7pjaDqaeIZ2JEU
	/TnEhMLdxZtV0mtrfId5Z83U2LrevhAscJNSbtMBHnw/78Ma3p2e5vBQkXmSpLqLuzAF0RCD5DW
	YbxjmrJcSX98Hp/Bzt98Itrv6hDsmPnhhRBtC/7h5S+nTqfkQjH5+iYKadklYcYS8
X-Gm-Gg: AZFdTZc9u5CaSK5CgK280iAH5DUwRTOW7i2/HMmj+oXE6uzOwt1co3Tzo1PMZ5Kdc8X
	VE9oo4NX+T2yH+hVc/kSwczpr8n/PKJ+DTZX4KO1pepMkr4O9u+2vHbaDPWE5mYT1dXqExujYUW
	eeDEcj5yXRdK/AYFmEbnAWQ329sIXpz3Zb/O2xCjQYsta047Uvn34HwWanstg6XAl6td3yWc7zv
	Qty6UTn2rx6m2Vhu7zzk1D12KHTBLR5PZrMUr/BNnKYJF+WvpYcEIGz3Bc1izNXL5vDsqpw7o3o
	3lmSahJ933CB3a7TfZBhvpYr2j2rAXP2fDBI2BT+nkkD2T9ftGn8Ts8yz1Qs6rEq8hcIjYWUdau
	FaLuv4LWP/ubquPAZMUuLLj/CHXzmkIt+IdowZh242kLkTgpLwYiIJumyL7pat5Lt
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67455085a.55.1795636361397;
        Wed, 25 Nov 2026 11:52:41 -0800 (PST)
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67451685a.55.1795636360999;
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: pmk8850: add PWM node
Date: Wed, 25 Nov 2026 19:52:25 +0000
Message-ID: <20261125195226.1563577-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX/qQy1u+7Ue5U
 tjcZiW99eIT/6xtSVk+JIJ9CeUL0FYfY3F/VsKUbaaQBfb2qL5P9pPzkSa3iSNYWEnSccOFDZ6Y
 8DqHiyBIbIs80BcNUwIRYPTfvABhXbnoWLGwf/Or96Hu4Fu80V6dGS+ddcdBUt7f3JRtkctgVwS
 /E7x0DYk5FWxZQ62FUZnBe0wjn73ZsZYS4fyPOk7VIUa1S0qGCONxlF3Cm6NMn/SZZzeQy/YdG2
 Fu4FfedE8VM+4RcKuNSWZTb9LGr9TKF6MPJHetdgh1p0Av0hE2JuSGxZts3cPP+XnMnwYLOoELx
 gsJ6shZTan0n+1a/PR5PRGhuTPQatUm98CqkowOv8mrb36r/OoOPEHO8qOB2na77BFYrLQRqQdL
 PnxNhmVZmW7MKFlpwrhlVIscQQXBFIbjmkPS+H7GU4V4LBau9a7hwVZ4gpUJNIUtrlTWtWFngcE
 vmBmJn/MA1+xUDGj4og==
X-Proofpoint-GUID: 65_KirAcpOsT8dVLYJSBoO8QWCoO-w2H
X-Proofpoint-ORIG-GUID: 65_KirAcpOsT8dVLYJSBoO8QWCoO-w2H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX8YzYtj5JyPFB
 IryD6INpxj/uTI2uV5ppXxzKTNNhmroAR+988kILPzM8UBqbKR2ApAVgYDBCS1FqEX03VDuoH9T
 kBSqzX9xClkpiS6E8jqJpz5S2m3ijNU=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b073c8a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=mO8_gwkcAAAA:8 a=zgIjqA5jzSmhAMQQ9ZAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
disabled at the SoC level; boards enable it and reference the channel
that drives their backlight or LED.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index c7ba72fd48bc..053ae42ef0fb 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -66,5 +66,15 @@ reboot_reason: reboot-reason@48 {
 				bits = <1 7>;
 			};
 		};
+
+		pmk8850_pwm: pwm {
+			compatible = "qcom,pmk8850-pwm", "qcom,pmk8550-pwm";
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

