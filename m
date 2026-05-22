Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB893CAA4F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441774; cv=none; b=Q9hVMa6HfkhYMaL2MkKN4FuVVyV7WRHnUOFdDRW7qraiTnJMBPuXkTR3StdxSxDLNz4FCIh3eDgWKy8Z55GEZb9PVhhcwKotZB6t8eRPoujIYzAfAa7H1+9L+S10FstrMNcacQThAzvma5YmR4nZ78HlLvVTPkqA/7QYRmNMBSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441774; c=relaxed/simple;
	bh=88BDVV/FL8yOUO9iW30evt6DNYWf8WWsDtgXsbtNGf8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aVAGl8f9fs+zGo+pcEusC8zqvKDHNLzpT9RtZnTLFpa9Xtfaa44wHNAChaBx3lC/S+776wu6EB73YEjlZeDyOhXwrtDFPGlBzGUjeJxwFMTCfME4NXNDsMUoEQl28BEFWgzg/gYM6GEclRF/lk2ywj9TvZDoCU/3X8n7TJKWnXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCre33nr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0W4YdYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCre33nr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0W4YdYj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8kFxj1658003
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EGQzsRHMUGEP3OuVmMr8JVJyXDsuNK+Mhko8e8FKK8E=; b=WCre33nr5+stCrkf
	VGzAquYPwIr2eDss0rHxibWG3RtGGinGCrv4nWLP0H6m5N5SXbaN7hUstO6QxRjO
	1/awkJS8nUhbWoRgZhERMEF8qtjIJ4R69bHelOjd8BcBl+qnjfwS3/EhfIHUkckH
	jgoiypYdrqCQyq2aV7qmHH8e0KDG6g4tQ4Bv4RyPID6tZZZ+aqKTaMzlt6L6rmO2
	oL/1zTCuwlJd53QItaViI5oqPM9gSig6AYuqyoT2lUWEBPfkXIN9rTsQZYRwIKPA
	znj2NtVP4Nhmak0UXq2Xmh0eQYonWUdc3DD0TFRI0PA10pLYXuFq/1EKxLrdKRK2
	bbMbYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkn2y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:22:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baf7748d0aso70638495ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441771; x=1780046571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EGQzsRHMUGEP3OuVmMr8JVJyXDsuNK+Mhko8e8FKK8E=;
        b=K0W4YdYjYPPKYUHje/kn+A45Z56ONml7AgJAEeZHsL1p7T6UFKEd9Lagpy8G5Z+XuS
         JwkJU8AbLaWLBEu7E2vAaAAwkiIVCAo4UKkgce1qaM8VZuf8J7FS+CV0VuKCRIBHnxIV
         9LkkXfJ4JzZgKSTrDu3FegDDTCxVFVSQkf5yuNL0/wNhEDaAyLEPKDbRaVpdUCIgkuXt
         9jAJcZpnR79ch8T4hsK2k9WUFzZ7CcYkF5pKqQDZZ62ZnJ6MagpcxkgoX7zugyL91sfx
         IpZglQp5MXIBjSjhwWfV8fhypNTLDIV2e/dgZG8U2aWpC5TUs3RKbQA2F8VMYuGxJ78t
         i0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441771; x=1780046571;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGQzsRHMUGEP3OuVmMr8JVJyXDsuNK+Mhko8e8FKK8E=;
        b=XzVSfocxc7eOwXCIuKrmijSIjn5jv8M1yn5nuiH+5NEmEEqKj8fp3fcLJSsFoWlNQD
         fJomYfOpx5ltS4sLLTOXp/oBvoFEUnwGYRMDWT9OssroIlUQD/A3qVjRJ5I4qiO0E7x/
         7gNXZ1xCeR3cazQ1xnYR27U4TgKSEGgleEoeGSTEarCWrqHAAY5GqESgob7x8I2cju9Y
         Uf1CWkA0peKnBHswv0IrU61IPuac4zX+47UzjtxpSLwZljXZoDgqAJa7PkQNbTgnvETV
         tmsFGzZ3l2vHTkxFUMgB6Zx81XgiGl5YZsstWoj8BLY47qEQeVFGcU8apcVf6Yypw6kt
         cEnw==
X-Forwarded-Encrypted: i=1; AFNElJ9poV6P4Rd3CnbCZBz13FSozxyDNIyms3sax6vgrhMfm1FpfUKZohl/v/IGA5SWgIlGt7X19sadslYf@vger.kernel.org
X-Gm-Message-State: AOJu0YyTEpMX7zCH7lff7hxEpBh+oOom4xx7Y2SSxfZQLH11TbH8CvNZ
	xL87Rp77E1LUI58OYkVyJnOveiWYt23DphG4FA1uqh3DopM/9jdB1xD1VzztL32+S1ue145CWgT
	Xnbk5cN4B5wSuOMMF9v6VEu8/VkDiz3mXkHu1GYjSfL+mvooU5pBJSqovQ/cAYQoE
X-Gm-Gg: Acq92OHfC6LfYe6kOTqFzg+0937CDIs62XSvIUY9HHqiCIJ8ZGQD4ce0PawNAOmMbGR
	2ZbEvL+Z+FffhELv+aOWkRrJshWvJe1pe5hbVdxRl2ujMzg1a/f1SRZhScKS0vBIRhe/iA9d2im
	ItVluNeCuSOr+hkxsUeqOK3opufpL5XF/uF0Q0jLd+52ZBaKoe32fKmCmH8VVupcs4FKUL1HZao
	Bqm8E5GWJue/SNyvsfK9r3X3J/H0DnyxAEG/pt2Dzjk4QARtnSAEZ34Zp8jD9VzdvaARfbCnphs
	Il2SApoLHBCK95EmN7F0KnfiCUQul++Usu8tlJt/PIehgl021mQJcCcjTX67NGK8b36MUx7HrAB
	BYHWl0tpKx6d+vVEtNCyswl+qgMh4iW9RXGyu00zYmVOcjZySTKY=
X-Received: by 2002:a17:903:1a07:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2beb063193emr31329065ad.23.1779441771120;
        Fri, 22 May 2026 02:22:51 -0700 (PDT)
X-Received: by 2002:a17:903:1a07:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2beb063193emr31328745ad.23.1779441770665;
        Fri, 22 May 2026 02:22:50 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ca7fcsm11220795ad.27.2026.05.22.02.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:22:50 -0700 (PDT)
Message-ID: <6fd91379-4347-44b6-8514-3c1e66e12aca@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:52:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
 <acH7AJq6tcmemvU5@baldur>
Content-Language: en-US
In-Reply-To: <acH7AJq6tcmemvU5@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX16LQAmAw+i6s
 irzg6TZ0teD7TdsOL5z0Bh1RNyVlNwNKKTWhf3cfoBMvPHSSit0HBZzhP5qedupNcID05fWDUFW
 rNbnhwiaGbM9uFJdg0vBIqH5eCsvV+4LmeUWTfG7fKbPAfC0GdDWRlTVBd39Kzw2a3b8ffMZ/zt
 I/WK/OZSvv+74VSP1xuTqFLQxBaibeEu7JRdtbSj/xdKfZzpgvCLAA/2I/ohntcgPbA0N9+yQ3B
 U6FfQ+p5fXqIISmvxZ/W3U0K64uwyatdgLWKqComeuozW5qM1BdXoYVg1YW5oN/0dXKfSQ66W4J
 1c9wR57YC5wfFCFau5NQBRuFTUPUHKRA2CnnDQRmlcwenJt1raKWghNlTDqkrQbtln+DvXEUUYV
 lKcyLucRceG8JslASk7Xm2K1cuhNxlpvabTuQINBFka9xusJbVyifr556tH/61drupQ05vm7W10
 20S0w/oi1q0wy98M4ew==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a10206b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1v8zxqPQ2sg2QXuulHIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ZbQuZjOdDMo4UxkO8paEVuBFmhfEjuCp
X-Proofpoint-ORIG-GUID: ZbQuZjOdDMo4UxkO8paEVuBFmhfEjuCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220093



On 3/24/2026 8:22 AM, Bjorn Andersson wrote:
> On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
>> There are two modes PDC irqchip supports pass through mode and secondary
>> controller mode.
>>
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
>> still works same as pass through mode without latching at PDC even in
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK.
>>
>> There is no way to read which current mode it is set to and make PDC work
>> in respective mode as the read access is not opened up for non secure
>> world. There is though write access opened up via SCM write API to set the
>> mode.
>>
>> Configure PDC mode to pass through mode for all x1e based boards via SCM
>> write.
>>
> 
> You're failing to mention that the SCM interface was not present in
> initially shipping Windows firmware, which would result in you breaking
> those devices.

I will mention same in the v2 series commit message.

This series has also been tested on older firmware and the scm_write failure path is handled
properly, so existing devices will not be braked.

> 
> If you're certain that this change is available to all users, you can
> argue that this is acceptable - but omitting this from the commit
> message isn't.

Not certain. In v2 series adding the secondary mode support which allows to hit deepest low
power mode irrespective of the old/new firmware.

Thanks,
Maulik
