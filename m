Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2425426B2CE
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303146; cv=none; b=ajCIIBYiXBav9im0KaCKZKLlHKd58WskqUoYl2TYSLDqQFXe7QFc56krbNH7OIkZEOtpgEHj4EBzWGdeOUX/jo9pEegcmiwAT0UV2skTfN84jB0ie4+u0GBz37vYREJ7zUK+lxtNFFaS5+8QSbqIFVZN3GpadHzxWo2tdzHiDiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303146; c=relaxed/simple;
	bh=VQaQaReWebVOMn6fouhgktp+o54ktSN9vZsrXEZr7vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXGB8RamicDS0OMNGRlt/nvtuorrACDBEqF6YBlY7svW/kfvUhc5d1LL+0wZ6KWW2JDVE+vDzxzmJZbnskXow52RyAnCkR88LivdVeA9uZEYUfM0d7b9JXJzUehcy4Y1cErVMvP+HB1JHb6svLkEX6eEjQanjp3R6XypyhU4hrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0dxZSSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4BVXgMc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0dxZSSr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4BVXgMc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANbkD1148170
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9d5uZ4kaUOPlkaQZfkAgT8ELlBWwy/PRGB6ginLC/c=; b=V0dxZSSrWW8p/JD9
	F24/CrjZxkLJj9hGHKjjn9kj8u4dOal4jOW4uyvm4AlHgtwZRH2dilcjTEMTS2om
	2aiurGZqv5PqjDLAVO32y2P2pZsd28OKIJSepHaU/f6ICoItrEyC5TV7kJyOB0ES
	lC21fCNhAwjvURMphrZUDs9b6fXvdmQYfWO4/RN1B/i2BEZghrQ+cRuFfA3ovbZJ
	dR2yRDQherJwg4p08IHW/Oo4gcLWqC9OdJqmNq1/sanvwUwEOj7LF7eQfR0iK5jV
	R7MoEj0rmrzP75u797NZXG2fy5tZdXS3Mu5cpRPDUz4M4520k95fM/irONKArq4v
	hASdqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r31y0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:12:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5198e72249dso1030291cf.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782303142; x=1782907942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9d5uZ4kaUOPlkaQZfkAgT8ELlBWwy/PRGB6ginLC/c=;
        b=f4BVXgMcl+LiBkuR7zcny3OcdHEcjz642HS9NOS18Xo34cxGma7JLdVeSwBGF6jcme
         /U3KA/rCCA95t+K5+VCQFBbmOvqNpftKX3cVpaM36/6AB95puqI5IzUTCFGHQDwNAgiI
         cisRMXkHP4K5I17Pnjr8pVVwEYC3nXLJidqH4HbFj/+vSMzuBBBdVLIx7qkq6/nJIDxd
         Bc8piyxa3BZV15tfTgsJDTdjrPa0aDjc3TSHvZ55mHDDv2Rh8+t4qaSnLeDEYpU0NPKK
         I4dvgSxswnyOIPfCUVE18qryLC4oF9CxeMqPSzNBhEOXUchTIb2C7WtTAGNuE0qAlGjB
         M8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782303142; x=1782907942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9d5uZ4kaUOPlkaQZfkAgT8ELlBWwy/PRGB6ginLC/c=;
        b=MdDO5z+EFzljy/lNDSGvHWp48tanT52nROU3GzNN51xW+F477KVYFtitqEnz4REoTM
         AHGzkeuj6Js+UnCYIr8WmdkCt3YKtVt6gzuCymG+UvNoxsx0iDMMSlOb2aN4jS1I+mIA
         12j+qSiYy5QrLAvBGlIzqQLfg3rAKNorfQX4i5KtYysuVhO+i2H5OdYitMHAnHwj0tM5
         NyHIIMdCUuOmVta5LGkxcVHbVMLs+0OViEveyJGa9duec3a6oQFs/IopTdaygNmg7aVD
         jkW2Xmn5aTtDdH7A3S0YCrPUM91Yi2hgVg9pTpxArn5WaLUKXvfh+BHVA1t0x0rpyKnW
         mBBA==
X-Forwarded-Encrypted: i=1; AFNElJ/i4TcuRrMDhQ6zggoARhA1oF7wECUVQ4hNSXYJUHqtD1FpzAH0/DRF891RpC3yDguohq+8b5xzHDMg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi15IK+4khSxJtWyJxW3Pskk/nl0hD6EgiQeQhZXqLsrDZEfkg
	SgiN9NuLb+T8p1tERYrB3klsMIZzFO3ySkina7vakRAHpKCWhPC0+hRRbfy621p6jSncIqbli0M
	NM06n5C35hTv6tt11pRnm2ggscimCD1sjml2AArUrljgprZ+JN06VDRo8iLKjnwiU
X-Gm-Gg: AfdE7clh/xLO3+ZCUV0XoY4wvKoBMNKLfC2Co5ASJofa2GIhZpjWpW2hipqGbR0VPuv
	O1u7CK5k4YiwUPgik7xWIuuhYZNpXfrr9uMM0y9Lc5Ol5M9Kl0T2RXoxgZrdii5q1szw7EM3M1Q
	YDlZk8r99WdLP5tnO/0H6OLW5a7CKcCl6T02qg+WM1jBe8OaaErUQ7Jw49RJiS1PIlWIK6k36V0
	+8COnRbPU8MGhMEgY1n5lWewxEDusWB/rvTSaFS5dBO0Qq7yb4Xc4cBpozWo4p6zXlXIm8WuM/y
	MtcR5YH7OrcafIO3/MBuTuI28oXR+Gesa9UJyQJRm5nxTvBv0p2yQkZKb5K/pINgZWKL/X8Idn1
	F6JnDAysAy48NPxH3v+yMfn/c/QaXvSYpMQE=
X-Received: by 2002:a05:620a:808b:b0:915:4ca0:1210 with SMTP id af79cd13be357-925c95b20b4mr930675985a.3.1782303142534;
        Wed, 24 Jun 2026 05:12:22 -0700 (PDT)
X-Received: by 2002:a05:620a:808b:b0:915:4ca0:1210 with SMTP id af79cd13be357-925c95b20b4mr930672185a.3.1782303142014;
        Wed, 24 Jun 2026 05:12:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49aa07sm650190966b.10.2026.06.24.05.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:12:20 -0700 (PDT)
Message-ID: <f802a990-cd11-4a77-acdd-018677ae8c62@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:12:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
 <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
 <ajOO6bx3KmYzhVdy@page.local>
 <c16a2837-4b04-466a-bf4a-3717436c25be@oss.qualcomm.com>
 <ajYcnHPZjkFwGjly@page.local>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajYcnHPZjkFwGjly@page.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX0hciZ+hSF9GE
 GxED3wqPn6+N2eTED2MZjA3t79Cn9Us2x4b+ZQnJG5mV9472pk4eMWzOhSC6Yk83AmMgjIkHUFV
 4Lj6n5CMtJNo4WA8vSX9dFJiwRI4HgfRxrWSuO05W0+TyIXdg3Dg5jNg5FxIh6eTc/MUfNXQ7DK
 c3g1bdOtH7CAAZ4F0HTa5mlb6pX24AXg+4GMtI6caCEUNFtFXsOy9UCllbCIYKNkVCUmDmzpa7E
 KxTSgI/Xmy+YTscm/0mdApg00gBGpBwLsoaGRzFNzJIh/Ssj4FWMXY07V8DSVnv/OBwoYxn7i17
 Rp262RexI1lgPJcjmm6kUTwSZGKnBcCvVCYRsDimzppZTrWUjsxP3+K0F3mVTe6TJ8oaEvnQ3Cr
 I5xgzzx0b58XGRFQI8QECJYPr9KwHQ==
X-Proofpoint-ORIG-GUID: bwKGgPRonoPiNOy-Hv-96ohS1EJpBpkg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX2JMeCHFQfin1
 FirKEsu1TtO+yeKf6rB0BqpwHQAazmve038P0Dq/gAk1v6asfPEw1hvx67VtqFMKMjwsdAtSBeD
 FcIywHdJ9yvnW2EK26KBt2XQYsUFHWw=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3bc9a7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=rCQGlBV6-1WLTuut6Q0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bwKGgPRonoPiNOy-Hv-96ohS1EJpBpkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240099

On 6/20/26 6:57 AM, Ajit Singh wrote:
> On Fri, Jun 19, 2026 at 05:30:40PM +0530, Konrad Dybcio wrote:
>> On 6/18/26 8:29 AM, Ajit Singh wrote:
>>> On Tue, Jun 16, 2026 at 02:10:44PM +0530, Konrad Dybcio wrote:
>>>> On 6/12/26 6:16 AM, Ajit Singh wrote:
>>>>> On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
>>>>>> On 6/7/26 1:36 PM, Ajit Singh wrote:
>>>>>>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
>>>>>>> QCS6490 SoC.
>>>>>>>
>>>>>>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
>>>>>>> support along with regulators.
>>>>>>>
>>>>>>> The UFS ICE block is kept disabled because enabling it currently causes
>>>>>>> an SError during qcom_ice_create() on this board. UFS works without ICE.
>>>>>>>
>>>>>>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
>>>>>>> ---

[...]

>>
>> most notably though, it seems that the brcmfmac driver doesn't even use
>> the regulator framework, probably because all of the SDIO WLANs that
>> Linux supports were wired in a more "embedded" way, where the V(Q)MMC
>> supplies were enough.. unless it's the case here too?
> 
> It might not be possible to drop regulator-always-on for VREG_L12C here. The
> SDHC2 host already has its own vmmc/vqmmc rails:
> 
> vqmmc-supply = <&vreg_l2c_1p62>;
> vmmc-supply = <&vreg_l6c_2p96>;
> 
> VREG_L12C is a separate module-side VDDIO rail for the AP6272S WLAN/BT module.
> There is no separate GPIO-controlled enable for this rail;
> 
> as you said, since brcmfmac does not appear to consume an extra VDDIO regulator
> from the SDIO child node, so unless there is a preferred way to model this
> module-side VDDIO rail, I think VREG_L12C still needs to stay always-on.

OK, let's get this merged then

Konrad
