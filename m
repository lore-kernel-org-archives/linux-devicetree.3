Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C28343216
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229319; cv=none; b=Jmzqq5kr+bHSGbSxJd5dYGb4Fp33Fy/IEDWBHacv3I0qfrDsVPVmCekdRyC/nWP+oGNYH72Gd2eyDW5vcVATIWN7ruKePzCldgP126ezISGi/w62kmajrzveECCYrOtqWQNtPGoTRiW5p+Eaz3hl+6Vj/GGGffVVB6PmXIMs4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229319; c=relaxed/simple;
	bh=Og43riZoLZ2jT+xZ6sRON5utsuqpu7BVFI6EALbrgnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvKXuKHE4TxGq6U3izZTI7v2+HKcXIiinUH1x1m7Vu5E7NAf09TquCf1BId6Excd99JRx+1tAWAkv40jozv9j8MflxGfzSFC3iaMqNdTjIKJw+gWThotFOY4s4F9y5c+WBOTP/eDJsaQgDgGsQmEAekvckfDk9kNX3oomfII5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNx31RBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRvvVAtz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNx31RBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRvvVAtz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64861Qew4069603
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOT6IuPBR8V22MOehqvTfPQ/05wAliu3hoYeuKhpTTQ=; b=hNx31RBg/9GPaaJ0
	S/A5yGPm1umWR/0G/Can7DpGybbk9hJUD9FLEO3emg4skYw1J6edX1ElmVb66mpE
	FIC1Gx6fgMwYbExI6VE4sBNJsziEWdKMNWeupPnTJoWeYgRXqlyLKahLea9KstyH
	5c+QQUpCWOlMYCpb9iiWHKlAzA6o92bR3r1mit6fvSRvBD0Dx96zIK45ym5nSw1y
	UFsplLxlD/0gMToWbO4xZYzbXRyLm4D4Ds0FWxjn9bAI7/80lqWBhzOBjwHEhgcm
	y1KeI4skaw3sVeZlf7ofX6kJ8l1S+Ukoipga8WQbmnkptx50zZCpv9KTipszJZMr
	LJPvEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp22c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:35:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb6880430dso50293485a.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229316; x=1778834116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOT6IuPBR8V22MOehqvTfPQ/05wAliu3hoYeuKhpTTQ=;
        b=gRvvVAtzFSmTAg50d8S17sMWIwl5PeKVkb2gScB3X++llyRuraILXPyZV982R0b13h
         bitwut2CjbmioKXDqBO12aGWbla0QwBi3d4F7FuXAVQcEhEgGKlt2PydoB9S8k0FWju8
         tSjWQxklcA0RiIllykbAh8ySphemHx5rs6/4K6U0TwdO5T5aMbu3YdQWsRUvTF1g6BMh
         lTwFh2ceavSjtHPWoQ+RJtYRzLl5xzV0f2Ko7yMnVenXQDPQv4XET1LNw2ZVtK3rAN1G
         Y+mhDsNV0L9jK5Tg2vqpsCy7Usau/F31vKZPvKW926AHY6R14R2cNKgCYXcPGNooRU+n
         r2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229316; x=1778834116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOT6IuPBR8V22MOehqvTfPQ/05wAliu3hoYeuKhpTTQ=;
        b=DOhZNrrlrKFBQzJBNK8hXqrhcR/BqhHN+Luw+xMql5WIh1uVTxceY5bX6YsuzI0ud+
         bH9slbLyoaCW8TLkDVr+2OD6xR2RzgB/hV1BlNSwiOZDpl/R4r/o5HD/sUTI47gj1F8p
         eX3zjxyLffESfMr6UYrtmPZxBsGGGcWR9650y5BzfdEdnWertFrSr5nTggjYSoGoclup
         ITE6N+p38txa7iFFlXmcDPznxe8doe47EM5x9lqdnddur4FWBp+462cC0OaD9lTY0rt+
         h7qMbFHeA70k5GkPYsy9lmOng1P/NbtH0Lj/HRTNcwtASaEAt6fp9IxPgD7JLnBhUz5C
         /Z5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/hPueYCHzU0s6Im/rJzSG+LKCSZ/ysVepOWmaC4rpUUBX+mTDY3qn5GZkK2k92EdpdirtvsFvOOw00@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBnAMovBh0h0uIIDfPKiXnveVBFJbns3a5DlTz+pGIxGtQHDU
	0pU3Z7PoYX44kmeawk4g9Mf7jAEQotAEDbQedhwUnEJZjZ9CANitrU0jKbQQguXHg4MpbcQ0RPM
	JSALOIGSSeAGvTOGnmYinjdNAvhTtUwfx5JmdXM1K6QOa4Lcug4GJDcFXX9iuCYpb
X-Gm-Gg: AeBDietyBmKFTG+FJrAMUeKY1FFHujq8YxIg6we/ona6SS9zQoaNvtWusulew++G/wD
	ZOr6brbwzU7vaZSJljjs9z/e7gvKuLn0TanDGX0qr827tW5IndzTi1AnblM4eBNyltjtYEx8foA
	H0lKnvJ9t3Bj7jAP6tZAjWgLduXkS8nygvjqbaOFLSgPMAJttRhK629oi9prJfV/9fniEEbq9MJ
	23AdfvaqVagUP7AkWd3jzAfy3YJVqAplZ6Evg/ViPeOnIe7Z6aDkZ6mmSXmXzImyOe8O71AQyek
	zvVRXgi0sMUxMQ3DPjdSpf/A+gl+uQXfO5H8sPCLyDWlE1n0H9Y5LLYTktZEsX+N7e8R60BJOKv
	ge1EkeilT/CxmcaLQ+dW2TZq7iryi7dBMHsdgKoWwqlM96BojZlbpZj0qyJSZGyA3adUiNRfkk/
	4d6t4=
X-Received: by 2002:a05:620a:17ac:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-9051f3638abmr1054281885a.8.1778229316146;
        Fri, 08 May 2026 01:35:16 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-9051f3638abmr1054279185a.8.1778229315757;
        Fri, 08 May 2026 01:35:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b4236asm377282a12.3.2026.05.08.01.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:35:14 -0700 (PDT)
Message-ID: <ebc94f62-6dc4-4299-bba0-329675ae7f9d@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:35:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove lemans-auto.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NiBTYWx0ZWRfX0hEyUfEM64xW
 pFYBewCESBD4p0w1cwfqhHQNMPhgcrmBq7UeEnWeN8rZgM4Qs7Y7pUEM9ATE6PtHHrbKqztA9Qz
 1SiI4sn8xnn7v7MR4MDROey5FmpUKG7HBwT4hi9kN57Qvmt1mHLUkVeIT1DFB1SFtCe5E0u11UY
 t7fC6jXEDE3oHFlBAwczGHsPwesd8gOswrF4SCmIsN4FPtiXHH5DRIvwS7GN1xdI9lXqUKR4w3L
 vNMjdE2OfwWG3qQY5KrY1etwN9fv1FjcYeSy/11S5Z9LcK9LOnP8CVbIu545t+rhIfvDrYSaO/g
 Ujz4zuvbxHjdMlaA+cCXD+i4VM/DP4lpYtNSv6x2seDZ1NMvoaAfXjTcQR2J4bVrbbcT6CO/Z5c
 oArKTb8ngMQZTszgbnRRMdc791ETBNH24EsXf9uWYaLCiuJNTXJLHNThhFJzMfgYWqDljEtJ642
 meX1EBqRc4jX88J415A==
X-Proofpoint-ORIG-GUID: A8GdjGEiGnBggT1yKE7wkZdd2Rydi9ll
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fda045 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5N_fG3F-Q1Bs9q6qf48A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: A8GdjGEiGnBggT1yKE7wkZdd2Rydi9ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080086

On 5/8/26 4:29 AM, Shawn Guo wrote:
> lemans-auto.dtsi maintains an old "automotive" memory map to support
> legacy use cases, which stopped being supported by Qualcomm META build
> 2 years ago. So there is very unlikely anyone still running it. Remove
> the file and update sa8775p-ride boards to include lemans.dtsi directly.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
>  arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |   2 +-
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |   2 +-

So because RIDE is the "automotive development" platform, do we have
anyone running the (effectively) IoT firmware on it, or should the
boards be removed in general?

Konrad
