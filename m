Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BD32DCF45
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525235; cv=none; b=lZUcZsUtA7jNeljlj9Ulw1e5zB4LU/n+EQW9u5whu4ydnNnGskOCV5bzKk5qmZpLBxDKwYwkkE+9Zrzpli20uWXzOTNVONXDpjOWlMUG7iAyQNWTqdPyK0HO2XmMsIWSmlAPuz5aeZphOHg/8qOtM++HywonmiNEFZKHkrRSpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525235; c=relaxed/simple;
	bh=ND7KG3N9MBrMZvVY0w5QREg+dNE6BwwRSSbIcSH9sa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFBRICcK76AZBDJ+0yRF00fFDg0ZEr4v+xyr/ML4yOkzSPyouVo/HBFtsFzaOLu5BcwQ2D2V+VJ9Wu1xpz8NLJWYyY8eP+2tpImtVydIHzn5px2sZX2fMuT/4tT/lC6TEbB32h619l/AeWSkcf5N1zxwWg7ZV41xqzMT2oPdpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5wJdni5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKYPIJo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5wJdni5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKYPIJo/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApbRB151694
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuSAM3kSZuXdViGtqqiEJCksQHrxoR+infoumgosJxs=; b=d5wJdni5rz04nj0p
	B/sk5reO7L8PiLn/ZirW26K0iPUoli7oXhuOlzTC3TTBuXOG2YN0ppqfWoIfLLOQ
	ZddzEyqB6/OctbFM7QgjpROJvtCNt2CxcrDhnPsvpvk3vKJM+4aW+CSMAwAWX/yR
	tMILsycwUzCiSJPC5r530r3B6lK2CKbMjbEOICIafpZtCRzPV+2CdQzAG2SLKpcp
	9X6mH3jd0rgTc9ffmpgwKPb60fWtxEokNYKDlKyYOeDTJLitCwiOCgLBQBYSs3JK
	R09gZo8/QIQytN1Tmb/94io/OTY4klv0bM4m8+8qWX9LK+FLzVw7ThGRtPkz58t/
	ZjZ7AA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf0jh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:07:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cc5ae9b959so3390766137.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525232; x=1782130032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuSAM3kSZuXdViGtqqiEJCksQHrxoR+infoumgosJxs=;
        b=hKYPIJo/JbqVB+TVG5X7Cocd1lRtgjnZ3QTvxDhiOhBqhLtcGiQ3LyiR5lLdMelP99
         kUzEFqDX4WfpVDB7vF8GB3DgcH24bn2GxJ8KdL/5l9/yobbEMHJnQfPueLvWJZzKIO3o
         /jLXGGKS1bg9CyHKS5Blrt9gcvTokwJQputikpY0dd7lAVG3q0/thaDTOO03vGd7fQoW
         Hrt5V90mHrv3hXToTtAB80NInc/1sdgPuOH1wnRYrvQ2NHiWeRH5zdEWex6fXGiFycvx
         EnySNNKeMeQ/vIo2L+fOHaSMvLAqhVpKfMs5pF/knzISavc6cQkk3mcuhbtOnavBERC0
         w09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525232; x=1782130032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuSAM3kSZuXdViGtqqiEJCksQHrxoR+infoumgosJxs=;
        b=NhKtH1NUNBC7CJGB1A9YPYLBkhy+N6OccPEDinX5yerx4RxZ8at57Bl1eM/yXgqTCg
         /TakGSOvFQ2H+dqtrPnP7scQu7sSCLJfKB6rrSqD/4GyX2DsvF2IAGyiaflCw2poB3dN
         mifnfbX3yrCR4ZMa5SotfaZKecI9XiaVT17pYWtyR84nD9uqK93BL95mNq2SnT6LSIFT
         rqxvj6VCjnptx3+kxM5TlC4VUPkGVhqVeAY6JHghXoqZ9LvjsFCVvAdn5JMlcL0RepbM
         yRYZACjK5hPBSb6p4Hv/20e1jzQuu+z8lT0Tt1h2rL/DyIw6HmuEvfRAAUxef+8iOFpp
         P8/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bbhKpqFeOfebO3hFICGs8T6z6cnHTY9ggu6DZaZx0YGOq7ZZiMHBj1lW/QDZlZFmUJXe4kxP4JD4u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0ajC80YdIpmdSELEHECm+dF1YpdY3D/U+L3jrOWfgVQHj6bA
	rOaCNVFNN5wXcaXJoAf3kRAOJAq06hnFZzoBngfNyaybN/VM/sIqd+WEZtccNTfKPjvXZkr5Cg7
	+EM8NmEC1aJZS50ZWrZAcHHHaaEXcy0rM9rDUWaJZeXWqh+GPKtOGKYRQsjidWops
X-Gm-Gg: Acq92OHjOmEEvC/gK6BFjcdJFm3ppUIiPv0VciFm2ekm20/vxRalZ5j6E08KkFeypUR
	FYn34hFutrVNR4LUbOaFv+M/Z2AeY+jk9e90ohmVxImGSBopK9WZIl5IsF32c4w6DgFgQpMr/KX
	/uP3fAIhbHPldWrcY8zDeeg8rBRoZ10B/2m90dtVFy6K3C74l4xaMMdrv6WEfqBM+XK68uP8E1Z
	2g8Fvl8bWb9XcUFYd5E8w9dlS0nystLPvMAcSJD0ss1J/slTW4JHyuarSV/F0G6wGjH1awRKd4t
	65qR61uekKtzG0TblYNzz84PectE8MYAUpW4Y0XxCO476uP5haXqxgbqHbQNYEbU4HucV4JUZZL
	Y+vG/gUxIE8uj57qCb6+G2uthhAstssztJte096XJunOl8nSX2zzuUcwzH174OUA0zwodeCmsLQ
	TPX24/CZgSmU9mgg==
X-Received: by 2002:a05:6102:570c:b0:62f:3abe:907f with SMTP id ada2fe7eead31-71f5e0fa666mr4734433137.4.1781525232284;
        Mon, 15 Jun 2026 05:07:12 -0700 (PDT)
X-Received: by 2002:a05:6102:570c:b0:62f:3abe:907f with SMTP id ada2fe7eead31-71f5e0fa666mr4734386137.4.1781525231745;
        Mon, 15 Jun 2026 05:07:11 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30? ([2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f23fsm33848212f8f.9.2026.06.15.05.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:07:10 -0700 (PDT)
Message-ID: <c85b658c-ea61-4d34-8327-2a0be2618611@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:07:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
 <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
 <fe5ff2e6-4c54-4b21-be5c-0f06bf0e6696@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <fe5ff2e6-4c54-4b21-be5c-0f06bf0e6696@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2feaf0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qtblmzGj4WCF7b9vubUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: WbbMohexEg6fk3QXRL2DpaGHPufT8kLb
X-Proofpoint-ORIG-GUID: WbbMohexEg6fk3QXRL2DpaGHPufT8kLb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX90HtUXtO6mnJ
 HNalGqe/++btLd9MjFK4a+fJQ+wasSzKDChcx8OwsUcIAHSaWGQM9rt4irUXFssAZknkMCLUJQw
 79mpfkeSdoS82SEALOhqxWpW+j96cRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX4HRtSnxUa0GA
 wKOPyQVfPudbWpQRSQ3pxdr3jYDUKN/b3je9PdRmUKLdvHeZXOwE4L5XaUv5hpWzowJEdxot+E9
 NKQGtT32e09T8Atk2vlY7A8wWPsFvBam9/yo/gD6R7M8mJxmaDnjPjc6iNhHq02MFc+Ghet0Qx3
 9beFWLOvneMAEzcqE+mzmtfHUsBmGk+BS2VcMJCifvW9h7yf0c/mvjBHHEtS938wrBAlYSdw1nf
 qAlowfU/TAcH+EqkWFNSXoNEI6jrgHmvxNGnrMYkqpttnPPgWhMXfRBUgK6QVLzaLuSnKO6nLYD
 Y0snbhp3d4cji3Qr9zfDlnrO7sYK0aSWRzVj670YNQk/3Rx8pEtGMawscEBLVi+O3qCEuYFpBvS
 qHesqvfj2Ae25Ti1j6wo1bsgEpXdVayS2AtF3f8x4Hqd0cPc1WL5SLfXQh3M2ZTZKkPOmoNsZ09
 n1v8PdNUr+AMpkATTqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150127

Hi Konrad,

Le 09/06/2026 à 15:31, Konrad Dybcio a écrit :
> On 6/9/26 3:23 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Konrad,
>>
>>
>> On 5/21/2026 4:46 PM, Konrad Dybcio wrote:
>>> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>>> based power monitoring and limiting capabilities for various power
>>>> domains including System, SoC, CPU clusters, GPU, and various other
>>>> subsystems.
>>>>
>>>> The driver integrates with the Linux powercap framework, exposing SPEL
>>>> capabilities through powercap sysfs interfaces.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +static void spel_remove(struct platform_device *pdev)
>>>> +{
>>>> +    struct spel_system *sp = platform_get_drvdata(pdev);
>>>> +    int i;
>>>> +
>>>> +    if (!sp)
>>>> +        return;
>>>> +
>>>> +    /* Unregister in reverse order: children first, then SOC, then SYS */
>>>> +    for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>>>> +        powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
>>>
>>> Could you try adding a devm_ variant of these register functions?
>>
>> Powercap framework doesn't support any devm_* API, you meant add this support in framework in this series ?
> 
> Yes, this should be fairly trivial - look at e.g.
> 
> drivers/regulator/devres.c : devm_of_regulator_get

Given how structured is the powercap framework, I'm not sure it is so 
trivial. May be it is, but I doubt.

I don't think it is worth to investigate adding devm_ variant now (for a 
few lines saved) and diverge from the objective of this series

   -- Daniel

