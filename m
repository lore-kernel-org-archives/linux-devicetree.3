Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC953C5DC5
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033406; cv=none; b=ZN6dOWesq6Lknys6y6t1GlaIu1s0YQnsoKHOw6xyuLwhJSjic0R3rRQeZOqFCGaJ2jvO4pHtucrM2N0op87dHQzhEIUxw2MPRlWkl0u8JS26cjCPEGvCPMddt7rnllT5kzlNN0vg8SkjMzpC8RXvWDRK4rZnhElnixTsMx2mMDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033406; c=relaxed/simple;
	bh=dVnzfYNahGsZdHPE4ZftptE+eRQBcaAuFjN3VuEZhOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvxNmDcHUAzJJ59z9TOQi5X+90NsiBTaxDCazqPnr+WkLekpB8/hJR74/JRkY1mrRLhHF6IVoCp7cPDI1CwuEvxeuzPB6M3rI5a4i0YQe3YIFVaxKp8kP6HREQW95oVHo7PrR3AefS8iZCwTV1og6wFH9a3fZFf040Zz04hnUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQM1R4m1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKFPnSmx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQM1R4m1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKFPnSmx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7F0vO1822849
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=; b=fQM1R4m1ZklHAzh2
	4LXb7NF1Krk4HpQ50F/K1sFunMWzc7xw/XbB7r0VsIey881YD9DhM3dpKo+TyS2h
	4/hU0KlX84MPFSjWGrP+Vq/FUiFcg4X2WLZxd71BycjsvG88OEqQu9mHQIguKdRj
	Jr2fS6WDKJeLHrBQpMlZeRpZUADG6fvHssCFGW/l1UAOLwiiTkr2V0olsSEnIbZO
	rKA0bcF+PpmStJXDZ726Ukxe0N1RPXii/2rA1iTbKU5r/5QoFPF44A+DEi9ttU5o
	/FQRmP8i2Rlzli+SK1tF0y1f4KAjTV2SFV8cD7xUeqqndi28iNofyZChS5ibBftK
	BYtnXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5ru097-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 12:23:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b026c4497fso15893596d6.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033403; x=1777638203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=;
        b=DKFPnSmx0qsa7Ry8jbbXuN51JFQA0I6beZB+ehe+NtT4L9s3rRM7tbkUrf4d1HyoeJ
         vHwaS562/qnIU68/X4yOS1B1/E2GiOg2e+3kh6pl3Axyo/1XI3/w1LotVJJiP5XyNX0d
         QckcRkTPQE7hsclmx1QX4sxo0VbQAa/oHqU+EtrMF23gSby6nj/POr5fMVRsG+h9LUjg
         XRagTHubtJBctz70pgI9Jy7n/r4SUm+02Xh3hgvugouf41ne3WrUOmx6+tWiK0YGdp1w
         okMR0+b8pxDQvcwd+/tFmdiSlIA8yruvWL+FZaGdPtu5fELHR6H8fGgSen/L6r5tzEbd
         Qufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033403; x=1777638203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=;
        b=qM5rHHvYOt5yP3GAuOK4b6qvkpsfgyFGFAK/na/il5QcPmiaP8leMl8W2sQVi98+es
         F+pAI+tDUIA9VzkH/R9Ofg8Gc3TAUbGa8/nUz5oZUFOmwmngccyLyEDFcl/UuxXwxrRd
         9A7Ls92mtWnWBTYpUMjZz8JwNq7fT0SMtus6l15VJFpIW+HSyLMpHClbDk23f7lafFyk
         oxyzHTH4NhRmkskBj5h7veSxLF2WTEI024EoqDNpqbPW93tqe1s1J8mBuRrFrvLXA6ve
         MCt/7ytsiyJ+El7nKw5Mmi1GeHBYcPAIacrPVYlofWn/glrcLSx2LUnKsNk+oPD4S2lU
         l7ig==
X-Forwarded-Encrypted: i=1; AFNElJ8oAecEgWe4V39PtmZnXVk62GVHPxr3jXG7GU9gZwJZR2pLWxwxU4MZVlvjRJCRIbcyulxeZJfiHbZm@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzEe4e92UJYvXW15A7In01rLcloRBzYA026WG0UmWtEJExkSX
	QprfwCloytbtE4x4rY8Q+restBRrPEj7w+h2P2WnB2eyWXCghcjUA28rVlmMFqDzQwRSEpbdnWy
	px4xxUywm2Y0jcLHbCXHnLWcDujyPaCuATQXGXWLloCIilukam47FWDDpYIIJnBMY
X-Gm-Gg: AeBDievu/mSS7wZ6IVz1hW8FiShIT3FkYc0mfp1ATwbUGpXPPsWkc/+EyX6E2kKyHog
	9qBFf9vPCBS7SEzHYtRLGjchkOaJG38iwh+ciQx0Pj+nZ7/rHmgSxK4XYmh9c3w4kZrCmejB3Nu
	2vIqXwm6iQ6R+8HJbYhgTI9D/0TDNzn/fKpKnO3AFy0kSj6sknHu5MQVthIOVSWExI/6dFsEBma
	Avf0FNxxs2fjgndjBUe3+LOok9/Mf+n0+qPE0kA89BokTWaL2JyqqjL3txlNoo1nMI1cjJLlQlt
	ZoRnomAGlm9CfMvXa2OiDpUKauzlfwWg+X4smh3Dn7Wu1NYbsPezMTvje0KKWWvR0CD/I5X6FiP
	lVtivAaH1jy1A9kiNBSsMW8+FB9DCUyp7IsU31DkTTcmqtylcArRrYSNca3NHNFufZQK/W4IpcU
	iCFYTf6Ve24bUf3Q==
X-Received: by 2002:a05:6214:1c05:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8b02818faafmr337500076d6.3.1777033403177;
        Fri, 24 Apr 2026 05:23:23 -0700 (PDT)
X-Received: by 2002:a05:6214:1c05:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8b02818faafmr337499686d6.3.1777033402670;
        Fri, 24 Apr 2026 05:23:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046429sm768141366b.50.2026.04.24.05.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:23:21 -0700 (PDT)
Message-ID: <e3702cc0-4a42-476a-bdf1-6d984e8ad7c8@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:23:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Align
 reserved-memory with latest firmware map
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-9-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-9-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb60bc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ksxQWNrZAAAA:8 a=IrLN4Iwa3TR8ocU_hn0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: fxA8ZAqMbPfGls7Wqt03s_MQIx14g8KH
X-Proofpoint-GUID: fxA8ZAqMbPfGls7Wqt03s_MQIx14g8KH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfXxArROmUm9O9S
 wAMrYfyY+XgMj+UDQW7y3XJLRrmejh1FoFh4dvnEjEHMF5Rni44Mwj++EAH+ytMbDVC0LkbJk6v
 ulTEwmldNyO71k6YSa+82KWzSuHyHH/M1p0D/+gMm6AXv0kg80C9rrQhr58Z8AVTQCtacKnqSer
 /l0epUVuuaAzkQqew5q3F08ME6jOBsUmar/jjdcHVTheQsde4GiJ9Cih2Impe9zsWRrZ+T35ruV
 YI4yVw39GOxwUxet/7k/w+ylfbAl5Bknqtx2VPbS2/be9pv691U+z68DqYe72IeRlnoo2Uf8ayL
 TdmnxxBqUgyh3ZOEn9fXKB/eHbvQGmTaODlEvInjJpJW/JORfsvOJeZLP8weM5qk05mHJ7cIsQJ
 St3nqelzhWglmJm0a57RHXaiTcKixt5ronVJuVqsqWIQjE/O/FbotoyqTi+LtCW99TbTbQCFZEX
 QwgFy7IYy+CbRvXVhxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240117

On 4/7/26 5:20 PM, Xilin Wu wrote:
> The current board DTS no longer matches the reserved-memory carveouts
> used by the latest official Dragon Q6A firmware. Update the memory map
> to keep the DTS in sync with firmware expectations.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@c6500000 {
> +			reg = <0x0 0xc6500000 0x0 0x800000>;
>  			no-map;

Is this a fixed cutout in your memory map, or is that dynamically allocated?

Konrad
