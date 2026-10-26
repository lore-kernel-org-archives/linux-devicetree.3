Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018366;
	b=Je+KWPA0sy3oCGV6AZxOvPKix4cbrpZcftrFtIKD4XeRsMhR5rJ3z5BOzsTqmUXTcEXe
	 ysiVpcW3GmDEgf1qb2vYhq3nOUinyqu6Ob4RePNDe7Tcy7R9rA591akhetyVJO3FU9OxX
	 wHFNKH24F6djPioS6BT1hBg9oVg+MhN1tdjZuBmoFxRKDULjiuEgoHf7g95q5EFSpRCiB
	 F8TSkLPHTPHIakiUX58JAhDs0LknmKIuWUy0875CkRUV/eiKFbn1104+r37iLuJNdEHqQ
	 SpUyo5Oera2BzRGkLWGH0Ax5lTfrlV5tEv5yFySJarePZBozPXra/w0fEpx6PLo9iIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
	b=ls8SpbCErggw3dQIgOKLwlepvcDHGIfxMuZFzz0ZQbtx9owWhV+k6nqgjGOtQ1cqbCVL
	 5mCAMU765v0DKcHYOR4J3FX9/ijqcTaT5SxFAhqT/Z7ysv9SdSAmlm88EokzVnE7pX7xw
	 GQq0NmwFFXr82GXw/nbQdisdf18ycq+OYTniOQJ3DiZ9ax1YLBufAgRrCC7q57RbhHXKi
	 M15yGPcyY+Q1wEhPUkoK+cwqdYV/xnc8GilVsusX5vmlXENjpXqdzLCNz4aYwgFxOg+WX
	 kpKFqJWCxK1amDbeaeZ3X4Z1zu5QLDJFaPlsGt+bBMCtOTo63HLnIt4oE6/THPCoUPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WTzzFqLn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpZzmsqg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48030606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48030606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WTzzFqLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpZzmsqg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt8rS4126450
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=; b=WTzzFqLnwVYu4HrR
	4MHLjMicCThMVoWiMc6rYZhLuGFM6mLBo9ddNlnWGsbyHybL0SbpP95E1mk7M5v1
	fw4ZVK/BKbdUECrdmzG7FEA9dHYmmf85Sp4pAkjFwKZhHr9eE0w7ch40Ul2EezxG
	8y77P2R0QL3rXTjrAfsm6OZuNIjzqDdoMo5nMMKyvU4H29+DJzxwF7vN/GwdtC/L
	X01BZUf1AkZxpLKT622MCUmrZAFgFT/S4Hb48CVy/AQCAv/fih0hCLNRZhZqPUMa
	WmKHjE2XY+Y2cEB5kAa2dZ1G6IYLxQaIRuoVb18OnE7vv5TY5XYj52fFuEiae7Hv
	TH82qA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshptd7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:39:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so88497085a.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018364; x=1793623164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
        b=SpZzmsqg9YEJN01lH7OxCQK5ZAtZPjABZnB2VQRFv88LS9KMIFCX0abgwwCi4xSc+r
         VuO10VENHsaRNe44178uj0ntScXSeqKJfTWEXj/Xo444hdgPHAKUN+yC3RjYd0QtMr2u
         YlBEAygME3EOEItCpnrNSmtR/Y6QI6W6w4clsSHW/AP77LbHJBp3gUUiLrqK2ib46xOS
         6if+PQ+e9x6FNLge1Q/aeMgOSMZrqzVgN7DEWATBmvPPv641WkEBHWwbWYeNZjlYOi0r
         phWY+cti8mdlBHlCJanxv2V70ZM+4qo9nnjY1Csw41KQRPC+67gwwv/Qjj1w0iFt4MD+
         JTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018364; x=1793623164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
        b=jLlZcM9ZhEMOr+PqX80sxO3FB0gy8T2kRgAoXKeIh/C51quAXADWiBH4VqR539tQyQ
         lWQp//E0rDD+YalRdaadDVp4Ddu7kiWhFiwOBjSO38/dcMdqJsZlfnoDX3FIeZztWBS5
         lCOqpzaQI7Atyhh+zedOiY5LOXDJmMc3pX3EU2Kz5j+/Fi888Z1a6U5AOJxAehG5bSf1
         UC9iYzuxYMxeLvYvKGrR2DsW6PamXb4LRJ9c+y2dRex2OSio0E5QPyEoS4DYqiDZ+ckM
         JKheCn7SN8v5Dm5aPaL5SlsFmMvzuuoJmY6mX3+SgX1A3XfBSJ8okMNjwsJT7Z8BYsyH
         dXWw==
X-Forwarded-Encrypted: i=1; AKwUvBwQZPsCmC6JTU5H8K1ZAjRqyNO3illLPBrc1k+zO3DfE8d6i4rl3GBfQjDnhLRsdJ4qmCzYjus54uyu@vger.kernel.org
X-Gm-Message-State: AFq9FYJx8j7qslQJOLwYK2yrvCgBAji9XKRMgjncZKlj8olGz0SUBbtm
	YEKJAifPNtGbRF77vSPQmhhfjF8V99oxEoGIQKAA7pnfkSSppaX8LdFgQxh1/Sz1RBqPICq/JiG
	/H/BY5ihSc1IwRjaA0GtZ8/f0fqlAOx1jmUOX91pWQ3mZ09Eoq43V/1qdBuFGOJso
X-Gm-Gg: AYBFou3U27topJgUsDfIXhxCJ78kbLQX/JemFEfPKpndmkcwCsrMbMMGJVDVfp3vB37
	Zx571OkYJw3QKnVGuWFjNVOJ7Og+jSonwzi/sm30TgmGn5znIqpXgL2JgZF/PpYhQ8I8JiZAJiv
	xT/W4pc9OvjrQkNVm8veCRLmirZYJJ/mORxltiUStd4qCLldiPsKrQx+AE08QuC/3AqkhUCwcOr
	g9pXrNJF8LPTf7mt+XNRT8XxwKdsK/H8MBEmDt1vNU/NJe23AGPeAlFAzsBR9mIXBg7KvI1+CwS
	2fR1+ZjYYkYIuraThHp+VdhpIgfl925MpU61+AEpc0tbIoSBpos2BnkfIYGenhx+fOUWSzGLCgE
	cBztuS4z5rrqBV8Ddr23phw==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr949470785a.3.1793018364169;
        Mon, 26 Oct 2026 05:39:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr949467785a.3.1793018363655;
        Mon, 26 Oct 2026 05:39:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9d459sm1530307e87.82.2026.10.26.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:39:22 -0700 (PDT)
Message-ID: <2c20fe9f-c117-47de-aeca-2641abcb4b66@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:39:19 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
 <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
 <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
 <SY5PR01MB10600F961AC57A32262D99ECCA1662@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB10600F961AC57A32262D99ECCA1662@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX0SoJSVcQHKwP
 bAWYjh+Gkof8dBuHZewQyp8eff+oyyKcaQmAK3gL4uzjqmwrKwLSyANEZO8GmAFW9CWTcP6LMQc
 nVwXvNHJgSGZ67a9Gx3XxN96yykPDqY=
X-Proofpoint-GUID: mXXdrJye1AN6U4iAoNk3HOV38bzcKFnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX7Ej9CVCEWO7w
 g40Jv7W79p1n0YnOMfsH4JctuCq8i0sxaWwqskRhDC/eFuhnf7/XSVqsMPyF4Bp4h0pC/8axY9c
 lKim0647ppxbTWNcX2T2ZDEK7n8UEu12vEFDEhtfD1ShzIJSLEbHCf5OJs4752cvjHygK7r5o/W
 5LLRLsipwRzq8h0sd4dSj6gszezqEBZH7BcozWcZfgSJNcD9zbrNjb7ySedl2MXI4nC3AF2gCet
 DeJk6FSLmLZtE3BV+dPshe4hXjQtEBdJIeQ2/zBQyXMM2XBt8Prc8oaeeBv0nGMq50HLanodbip
 urC7UmJJkB0x0zsV/qEWrXRrl4kqzsERokRTq3VTGutPsZdvIh0vsk0tYG9/aaaptYgf/pMFmtA
 NbOlKlPRw6t2Aq17N/LVS71Qlcp2swD/w6TLxfcvyx8gV3knMCZAiTexqzolgHUkE4ikv9JdgVy
 Riv10Cs7IqdraVG7m7A==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf49fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=SGK8BKh5EnIYygesR2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mXXdrJye1AN6U4iAoNk3HOV38bzcKFnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/21/26 2:52 PM, Zhang Jiaxi wrote:
> Hi Konrad,
> 
> Thank you for reviewing v2. I have posted RFC v3:
> https://lore.kernel.org/all/20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com/
> 
> It updates the model name, node ordering, common PMIC include and GPIO
> reservation comments. The cover describes the revised DT's bounded
> native core/USB test and the Codex/LLM assistance used.
> 
> USB remains restricted to High-Speed peripheral mode in this RFC. The OEM
> configuration retains OTG/UCSI role switching, so this is not a claim of
> peripheral-only hardware. I would appreciate your guidance on whether
> that explicit initial restriction is acceptable, or USB should remain
> disabled until the dual-role board integration is included.

It's fine

Konrad
