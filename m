Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC86F39D6C3
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035295; cv=none; b=qqxEt9+4FRt86WNzC2onZjXDpViwrmKv6ZccufnjAo7ciu+1Kts5q5c0jv7Cz7XHyMwRCEneXvt02x9Ggwxa6YZ5pDdpjwVnh4EyPYcR3Fug97WXVJo75uMmE6d7H60Pgx41mmo9tg1x78P5WsHCAeex9uC0EmgdiW9LozS0eUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035295; c=relaxed/simple;
	bh=g7mTCaNy+qXAYxV5j5ONa70Z2PoLfxCg80HoTtjWOgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qh8X/3S7sjlCgoMgme+HtFW9MRY3fzR33nRwD5pzhzPv2OlzTA1H/2aW0P1MVtPINGtknkIibHWOi0p16/7QeUDMZIu50BK4/HqavsrLwT07u7w3AJ8Tyq/OYSbDDH+WN0fFwXrx32VaOnCNJgzOxbUdYG6sYTPyftDfcj+5OCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNC61BQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SxzWc/Zj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNC61BQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SxzWc/Zj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ZYZf1005231
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWmGZ7CZcJb3X90qICYay41hOsfqZ5P1zWycST4heJ4=; b=nNC61BQ24hkqlOFz
	4FnjbxUUaAv3GSHKXxbEgbGfRwsjrR1PBxpmo8WQyGmc0+wbkuY607T64Sg+Ra5n
	pAT/o1/a+fGvZg1MqXYTuHgdIeFK/NQR4y8uEwQpHhN6P0QsKTRp/z/4cO+CcUNR
	ZFE9Tq7rsdZlFdcrpTQyH6lRFUapKwnODAwXHo9omcs3gGInlPRUQQegiR8y9qm3
	/pKsFGPgsVGa/SBodtSS3AL5vRD0eRwYvawpF5UIMfjHsW9KUqRAUp6+hR1tGvtB
	EBC48VKX/UwY/83seQuEoUxZT3diTFPVwieRcoObIB3YIvGHLbQU96fHlZKCjbCH
	Cl/R5Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjhjba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:21:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cff2297253so196643585a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035293; x=1775640093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TWmGZ7CZcJb3X90qICYay41hOsfqZ5P1zWycST4heJ4=;
        b=SxzWc/ZjSrRK+4AUsxrUo/cBgfRySw5h7kA9UzdYUh5//I1du5zRnCPtZXpIWZI0GJ
         wPFj7MEb8fXhd9ji54u9WQOvi6zRfjigFlH+1RU0fo+89spyBjtir5OsoJle+uaBXWaN
         6SL9m5WB6Y506oLUSSIATy3s8zlVZvNOshEUjr5QkPGnMCthPa9+k6q806Ndc9ls/Pux
         7+n+gPzTZXF//wlOZ1BtvZyUJfBlmfHricR1DX/XmpSiZ1Vuksc3REZXzPwpmra2ydjH
         5eBGCr9cJSWHkf/bx7r75/slVRDNCCr8bz1SDhrMeYRtahlLGRylDU/E+una/ljIYMl3
         jzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035293; x=1775640093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWmGZ7CZcJb3X90qICYay41hOsfqZ5P1zWycST4heJ4=;
        b=GfBNUpQkmuP62UT9AmS0rEyRAr6sTCxkjXUAf0xs6hxF/Hwy1Y9HKq5irRKJlujmjk
         MGVwMR1DPngkhWdK7kZkKSklYMEXYwpQnIBcRd7HcBRnPgGWL4xShDnpl9NShojINSyc
         imnF6w1/h+AVMnFNCPqGELyIAR3dCgDo5yTpwnc4lL5y4o5URfOwPf2UuJjq7btpqiMG
         q4zIs//y5kaFKM7K4k8p02EpFUUgMeAgERAsKGXhArVSKCHsMgYj1vGlfIIIPfXgn0fP
         uGiVbrkde53i0OURS5HDGpReUPFAhOMtBTism3CHj/H175tdIM1gm+zZ7hqrha0m7EER
         yrzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDX8ugjY6cu9Xzo4/ctmkmwUdnt8pvAmpxzPGsIANtZ8VHKz0FhOk6W9vmGhc8fBgo6PCY2mdBtY1D@vger.kernel.org
X-Gm-Message-State: AOJu0YwF50b3jMBifofBhkUbKHwEm54bQmWwq6KHW5PwZ+KggySbK+dD
	VwrWzk4DQyKarVOBjnMkHN+wrFiubQqIVdzpg39PET/AmmCNIFp2nhjXPb4Z4xQhg4Dl1+NM3Lg
	PdbkCjs+K6FC7mJU6PaqCD6FbPfWznGrjS6/xF5R0zU2xAFCjwmu25SmvwH6837xz
X-Gm-Gg: ATEYQzy7yTauFsITk0qxWvdCCmCrryNLfQ08SHFMc13TeQOlM/4rEmj96CrAHjmXlgF
	1lZuV2jgr7zUaorfFcPbjpjN5k2XGwv2jXJMtGmxh7liRZOsLmngCZMfTwxy+yi7fT+SDodw3+k
	fa6OZIvOv2s16JJO8H+wzFHWWX8qMF/I53ow2kbZfDMurlB7DEhZPh3ErliutIae+CumW9FpMX5
	4JZRcSSnYTqvnpGCEi1mIeQU+CGVrlgOn++bFQb7qRvwTCwbjvSbH8pYHkC8+V4Wkci+DwVAp1z
	R1G3gyfYJA9EyjXErlatWTMZGrVpwUovBxaDM/PTc/xM8SLBTIYgwkOIq7HECQJFKm2dgiaEGG5
	sf/zlZfbr4CyhF0CajZ4npPfqVKwRIHeG6TSXuWbrDwRtnjmQo6Sadg+F9nET/v4Cumnh114zm2
	kp+U0=
X-Received: by 2002:a05:620a:199d:b0:8cf:e930:8a9c with SMTP id af79cd13be357-8d1b5c03f81mr278769585a.6.1775035293192;
        Wed, 01 Apr 2026 02:21:33 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:8cf:e930:8a9c with SMTP id af79cd13be357-8d1b5c03f81mr278767085a.6.1775035292757;
        Wed, 01 Apr 2026 02:21:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c074f0a49sm2535246a12.1.2026.04.01.02.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:21:31 -0700 (PDT)
Message-ID: <7b2559df-5131-4893-a28e-8d5dd909bebe@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:21:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add new power
 domains and new levels
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-2-c830c79ed8f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-2-c830c79ed8f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ek8s0Lv-ld7QgdF2JSpXD9sz6iDRS5_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX/njo1QOslz7a
 7UUqPbUt26wZJiwszZiMAOekxqpG23OjiLqPkAqlZgE2u9DMmQ9LQupVQXCs7Ra+xhCIDe46k0Z
 FAO7uC6XdescbY6ZTwEohlUYnz+pZRg0HGxSEYQV4b2unVSg0pSZEIBidCuzMrgBPu4uWdibqQH
 nu6RxifY1qWJgnBbqFUzyNz+r5fWNwi2ZnKindOKu9e/IoJoyc+oKhCmbGqqs5v8eTQcdVwyJfW
 UCVfFRsUSs2EYdjd2zFGyJJF6Q6uD3x3awObLQIvBV4xPF5JDSqwaTig78Z3hKsRYJGMTZHklKB
 uFMGULhpd8FnrFV1M3LUSoEZd5NQGVcLx8So32grjzves1f5v6iAJ6nH8XvvurcFFisQh2QVhhc
 PfvxAm2TIjgCZXe4qmrMH0638NcHB6MEjzv1ikzKEgwRU48IBMxb054gsml9vjihrtJj6RAiIiU
 8erwjE6uyyanSQKIAEA==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69cce39e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5ybyJXMKkUk--e2QuikA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ek8s0Lv-ld7QgdF2JSpXD9sz6iDRS5_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082

On 4/1/26 11:15 AM, Fenglin Wu wrote:
> Add definitions for the new power domains which present in Hawi SoC:
>  - RPMHPD_DCX (Display Core X): supplies VDD_DISP for the display
>    subsystem
>  - RPMHPD_GBX (Graphics Box): supplies VDD_GFX_BX for the GPU/graphics
>    subsystem
> 
> Also, add constants for new power domain levels that supported in Hawi
> SoC, including: LOW_SVS_D3_0, LOW_SVS_D1_0, LOW_SVS_D0_0, SVS_L2_0,
> TURBO_L1_0/1/2, TURBO_L1_0/1/2.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
