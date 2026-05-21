Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C3D3A75B1
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362277; cv=none; b=JPLRDkCvip0jCG3/IFax93hcSfIRIeEI+qLsVm/SnqE4KgnMeXT9UOuQqpDSVVgP6qolj+mB49I487RoAZCwfwO4RcWmoj1A+HG58hzlut5sFtZZ60Zsuz2JcFNKRxI2LCL4uVYfvWRgnv9pof51VC80uJE4qa8Kj2cxJb4Vj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362277; c=relaxed/simple;
	bh=xlK4wR30Get6eubzseSjA3iYaEkpST+adJFHECpBVUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSp1EnfAaZnaKMJNCCk1ooiGRBrajodQgmk0GXtCJj7aTfbeSITfMkhefsiwmJBdEWhuroqOlKIkqNOSCfIP/XMlulTjvXmzh5dG48zGOogAc01w8FUuMC0IPpM20noNr/Iy6xf/LGPIowwqODpyF5ckFLHmk7wTYSVxxeXt79U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZjX4Pqn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HX31AAsV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZjX4Pqn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HX31AAsV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMpR3556033
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjOIjZmNsHI/mHiPsfUA2XrCOYx/OJ3QhhVcNXQP58I=; b=ZjX4Pqn8zPdSGDdm
	ItenlA+6zdadPvXLHk2gZn2oPAZjzKHm1WMHNPyZbeBCfFWnTN6EKeZzkseU3G2b
	1s0pExiaUmIZVhg2HVYr6+H68Z097LH+Zsni9jgRNKC+9YMhdZgE6GL7v/2h58iw
	x2/gtSOmaB+MdXkM1PxnMrAzVxDtaSMRd0+g/6Z5s8FOaPuf+1WxH5TW5gJaq+aw
	sutGds8EdlaDlsADCXD9rXyuujyShFZOpaJew1RHga1dVxHvBpEn7b71cF7OayC8
	vExZUrhxK8OtP8JFizNwEfToO15kqxGepCoEwEpeb1RgAZdKYGiHXqZqinvbCrng
	ICnwTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6m7m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:17:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fe39eab32so101349885a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362275; x=1779967075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rjOIjZmNsHI/mHiPsfUA2XrCOYx/OJ3QhhVcNXQP58I=;
        b=HX31AAsVjcP9rG1X9QOdV+Geqni2xmKTlTmz1tNr9HQLHMcJBMg+CGTwSChVp2AXze
         7oO4lroQUMdjn66c/arLUk42L+4YyaK+u+UaX9JxA+DFhXY8Rew7R3/ug4oGwORuyYIS
         bR+7wtMSp3ej+T2WMSnUXVOUKQG+XHCeRrFiHOB0zw8Qr52KFj9wNaT3iseCoZ/oTmi6
         Ld69LodISoC2fe89HD++M0jAse7xYaoIX1Fg0uC++3OqFiEn1yK8ucWRnlN1myGe4LH4
         63T64wKvJcRUQejY6g0bva67zmp+J2uH7xg3HAq0SHEm9s/x0abOaAlXrdv3drNYS70C
         i4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362275; x=1779967075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjOIjZmNsHI/mHiPsfUA2XrCOYx/OJ3QhhVcNXQP58I=;
        b=kU2HtJM2AI04vkJwHQ3iwtoaOuIeejDXxn0Kq2ELlTt8ePJKD9zvsiWoKM4APML8HS
         z0fMhEuPDV7JQf9jAreZ/uwh8CO12Qa9J1IUsxlFj/KKGNVAr54rXyxccdy0pbv9A8DO
         XCXFdy0H8ruQG7gsPTJz8GigadoVWBPa8Z3l2SjqistdHEZAZav7Aw45vTB5MErlme34
         93UGBy7A7sG2lzip18H0Uh6RRrlgPQ8+XKJCB8CiOw2gcf+QLHiTizHAm+e90IuJr2eG
         6/jgdsDg2CZQ1SfvzIiAD0l2xb8nKOBPO9ta/tVAoy7o0RaXIh0rIKmyfkxtv5J6UIMB
         N7Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8YlHLL2pM96yi3F7zZacL8iFhBAYY6x3z5ZDb4L+Sr+1b61ZRsSnDWbAetQVazGaeylyabf86Kczdc@vger.kernel.org
X-Gm-Message-State: AOJu0YwAYBzYqacZ+fptlmuQJJ20bZViEhtEPZi6RSq9Ovd6emZAM5Ws
	gAEaY3iJ9QfL9N2tJAC1YV7oLP6vK+vjVgXUyTj6RsKoYryV9TyP+l1wvClIw6zm/DxPpKIOXST
	xlS/QvZUM/9mTD0IkkXytrfLe70vnCBa0lmWPNStGKAFv8jBrYjRf+KhutWv8xf6q
X-Gm-Gg: Acq92OHE4OtDNja/cm3N3g0jcfnmnNJJnhm4cNJwV8qbbep5kf4pPL1cNUi1fN+RclX
	Yk8DaeCTcRXR7IkeKD66qASoNcXyEcA98G3l5cpCUX4vlBePZDeAKNnsPY6YteVdnySqiWP96iC
	WU4AZGsl7HqOeVNJCRMWeK6N0uT3lQbN+X03W2XeS326Iu1jAOXgtWzDizST5Z6HdSUDM4bnzEy
	xjzSZJnewy9+wjPtMkfXyyvdyuTbyRsEZ9DNRvTQ/jEGCVRUpicNNmY3QNcSZq1cKYHRmYT+mXJ
	9EjDhRjb4sBhwccfNPx+ejs3oAShl45i/H0bHSJsFEAKH0Q/b6RcWg50GIXPkiC7VO6nkrLoWpu
	5iD9c3nYUx75USnp+k7yDkHlYaOKN49hxjp3vbtX698lUDNSG55zX/C0KMHJ4GgvAuO/SDefOuM
	H48Ug=
X-Received: by 2002:a05:620a:4804:b0:8d7:a89d:958a with SMTP id af79cd13be357-914a2d2377emr193349385a.6.1779362274992;
        Thu, 21 May 2026 04:17:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:8d7:a89d:958a with SMTP id af79cd13be357-914a2d2377emr193345885a.6.1779362274444;
        Thu, 21 May 2026 04:17:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6887e01f7a6sm26576a12.2.2026.05.21.04.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:17:52 -0700 (PDT)
Message-ID: <e3b15b7e-ba09-43ca-9e6e-b778393d6acf@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:17:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ee9e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dRO4Il1Evtc0n822G-oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6G1G_HIXgl_WuA2NaEdT56kxWrTz1MAe
X-Proofpoint-GUID: 6G1G_HIXgl_WuA2NaEdT56kxWrTz1MAe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMiBTYWx0ZWRfX1KUCIzIlc7vi
 GnbKf5n5J2JWfwd9aNhac+TMos5bP1CpiFgEcCYN04+HOH3leCTRFSO5XAtK1iHNuTYhXbqSIhu
 yfIZlm9rff8nyfzQAUARjgnNZHU8Evjj2Ed/lmzaAcs1U+jbaDLT55tP8ygvjXf3mmORumElfYT
 YRySPOR5derzEbgMdpnHXKeQpZ3Q3Se799i1HFOIfbbsZaSSH8zznrPvdBBbL/5/UZtBbEEys7w
 k/UIdGiiJWYDtkxrJolZy94xBxCtneIcm/HgjL+akjo98L7Q64YayTnuDS5D45tlFzy+q+PjWYs
 VIVOsKR2jOJXMdWzrCh2Opp4gmSjhuDxAKzAVPMyEoIO08OGnC6Eg5pz9YmHwb74ckgEQBWtX0g
 NZpiUdOKKItatmxeSDxuDtTVfx5UcgvpFTJa1GzaDtaZmIha2OfI+w7sX6lnSI/IfAPbwH1CUpi
 qEBCNLJZppWw7sxR2Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210112

On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +/* Constraint configuration */
> +static struct spel_constraint_info constraints[] = {
> +	/* SYS domain constraints */
> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
> +	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
> +	/* SOC domain constraints */
> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
> +	{ 0x0C, 0x6C, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },

Lowercase hex, please

Can this data be const?

Konrad
