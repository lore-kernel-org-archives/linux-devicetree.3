Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F43C4B84
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444603; cv=none; b=AxKgK/NTbcyGR5YONVD0GzOXPpJ7vSVAtxOwI7a46o2SC/zJJUrnJXtzwXzkDjkAJoJtcwrtXZoVp3wsVXQJnEdiZDI8HrKFzia3zzJEfY78l+aVS07cnVQjFcJE6mibOey5FtDhG9SQhj58AEx4xJ5dgRFiUHpmGca0ps+uKEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444603; c=relaxed/simple;
	bh=hL2LGlLTT2tGA8Z73kZn1O6WgOl0cizxjuAna3CJ4xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdyT8n8KA6lVTfq2c3vO19M17wo/WhCEiF7GSgkjlAOrK8SI9DDlhSNssOyjVOawBc05G1nWipy0fF1IHIR5NOsRt5/yyQTTxBYNMkNPEKUjL8alNL80IdSnXgqbWtMMdgGhxI8E9dMbixnL1UrV5/OmzEwNZfEU194QPYk0CAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DF6QlxrI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUXA6Ny1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DF6QlxrI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUXA6Ny1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UNvg1959419
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjDG7K4cMDv90KlkHup7EisS/IQ0eeDszu2jromAm8k=; b=DF6QlxrIkghnHKK0
	KAi3IwsyEuH84DLBGwk3Mls3mnqgZYshBAisUllK/E3Nd7eDbhZOK/pja/isvrvy
	uC3o/l7MV1mcMJA8e8l8SqCLo0xvISJN6pqbRjUOPkRZwrE+71En/1anM/36iRtQ
	qIDGuv/FBbWWZncq83qrXaPVeHh961n/7L6Tj+rqHCYOpUoygOXKEbRoRPvHIhF0
	U22knCJ92vWyMxzZ02TiPFwyE81cCWOfP7nQ3IFdYUC0T+s4SBtR5dqQkOSsTJCC
	zgOyU9A1gtNW8EEPuNbGXruqR7dnpeiyAcoTR9sN7jW46fnOx8bPrndxfCk7/Kok
	u7/wOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxes0q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:10:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d1d282deso2311021cf.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444600; x=1780049400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjDG7K4cMDv90KlkHup7EisS/IQ0eeDszu2jromAm8k=;
        b=QUXA6Ny1c2hBM/Jq9bAzVW3z9TKexcJ8o51gSDywBOVHIriPFffAZymvmi8naZeo0J
         6KU6+gAqeHA2lJT7zE7LcQHMY61H8BWDU1lDW6cIC9i9n3svt741Q/EMm4MsDNDxiPTM
         Cp1rGU4W4Jdy/Ytw4M8WHCC0U24xE2AoeET8mXSM1/2RsbUTdLoo5F2Y5HL7gDqx6sr3
         qX2QgLCOHzmqwzBk9oR+KDufGUxxe2U91hYEP65FvxHcZUzHiHd6104ILDED4uDtsgQJ
         muY4PaVH7kw+m0/CxHEFhlM9/1oSETkH/GfvY3+Pp5nNNQWevt9FBMq8xUNQFyq4MnB6
         CNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444600; x=1780049400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjDG7K4cMDv90KlkHup7EisS/IQ0eeDszu2jromAm8k=;
        b=aEc6N+H7yOOJ9OwCJkIhyJBvb1kdB1n6Pn+BfcWp+QWbh+7KI/uRtRw0swp0Go2d+3
         3hoqVfR6GIQQB1AYL326WP4r6f6udQq8VPhUErYNKxx4OGksg6j07O1Ngr1cYTMTfPGI
         2mZzybnnI8y0bxo3It/T/7Pu4UIFBp4o57LH6tMNlKnWR8iG1wiXz9soaX3SNmcTgQQN
         R7pFECiZZwHUmUIsmJuKItl6gCIkGnc3dDdQ55hF9HgQKjIucTbs2rMDiv0QRl109FNX
         A+sbFMAaKK5/53vTwsp+lvr6+NM06rL1++zSXiVavggbk+gTQsdr89XhWNH+WvGLkl6t
         m3wA==
X-Forwarded-Encrypted: i=1; AFNElJ+lXRTL/wbkOewn+k8gnhLegGD2hh4AU8l+gop9XLGm3epwL8G6kiE92uI6Yw6irWnILLMMofgZZHtK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/jUfccWZuf49F4958oTSAIT81usk0c4cMHAVlPVxuUIn32wE
	4rm4e/bbCm3AXxsMoSPjRusxJ11YpXRIkV9G5NrrimCb67rVQED9LnhAOJFb+H4hNuIf1J0jq71
	i0PYDmTZk1tzl2HrRpJN/rMmJqqcPtgLitQynmhZ8Js+ZJzAygC+L1Nym0viC3ggn
X-Gm-Gg: Acq92OHxQKvGjQoQ6KZoibE0ZBle1vxivCuKwPYv8RukRbVGwWIHMVemN+MzE4ArUxS
	zgjuJQYFdUxXUq57OX5jt4YDyYy2llNuIojI4CRStVxCO58Z0GkgXsbH3zNXlno0PAkCq2hxHxh
	qrcdVQTcsp1EyCbM++w/A+ZfEAzYKcddwSnPHNyRLV5R8pGGX0Hbdnsy1EkcYDKJInd/z6xbr4X
	W8RAof3kA5Z+nTIwsqjjx8UoxNqKkOkzN0JWodzKYeg6T1yJAWXoOZqMOKrO/TE+PXfbFfvcNW/
	HSIHipkZ+CxxjWzcTsfN15oxAkumVnRw9wBcX3bRxGDnT/XSC/TpzM56IE+lplV0Fk8KNXoVSlJ
	KKUhl4HLtSLBOdJg0LCrWwtrDGz81fP+7zyGXNrj6h4edwA==
X-Received: by 2002:a05:622a:260f:b0:50b:3489:5495 with SMTP id d75a77b69052e-516d46837a3mr26397021cf.8.1779444600052;
        Fri, 22 May 2026 03:10:00 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:50b:3489:5495 with SMTP id d75a77b69052e-516d46837a3mr26396861cf.8.1779444599558;
        Fri, 22 May 2026 03:09:59 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc65dbd3bsm39288766b.54.2026.05.22.03.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:09:58 -0700 (PDT)
Message-ID: <64950b97-7655-491a-9cfd-ee5ad0e7d840@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:09:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <gd5ixcfablbyyyz2wdacrvg43jogwg425na6utsgfcterm276k@tdko64tn6gwh>
 <ecb75ada-60c4-40e6-81bd-fc392007e9d8@oss.qualcomm.com>
 <5z7zoybn2gqsyn3zqvjo7saq2zjpoimkp67ubqenlntzcweyz3@rkm36ya6j44f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5z7zoybn2gqsyn3zqvjo7saq2zjpoimkp67ubqenlntzcweyz3@rkm36ya6j44f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMCBTYWx0ZWRfX0sMKTEvvtzMP
 yhsdETLK64PFuMgFU5OX5blmDK5Viig2Z7qDLRqO5Pt1HJVZBKr3lZnugWLdKe0zq90n34dEo5X
 ykFy8uTw7Uz8K+s/ytQMct7koFiNEBx/MI2S5vKr74UNsuJTpnwMYrxSYRnxbhnBGe30CDuddyC
 mNRrJIvMg66rtmqNOkWnXdNRnfcsYvBgfvgnJz7Y2gZUa2vixdl/iWcxf5QCX7dII0sXr9QEVWV
 Nj/tyY0CfyWTMQSrUm5rZYTqxo2t2ZDu3X9UkIk1GMiVL1Yioy1MG+gwYjBWhS1EcTYdboaoJAo
 9f3vLKu6gD5EAX1lyyzxNEPb22RsCUuk/lfm42gObr//wX0tcPbUebHdAQbBfZJ7cr5O6QdE+WW
 bA+L30lMGM+4DPCtKdJ1nF8MDyd3TfM6Qgx7pavCUFZ7jNeqs6Q/ZPG0BZYoYpkvQOd4L3Fv2g8
 moz0ihBAEVSBHugLfaA==
X-Proofpoint-GUID: 6K-3KF7hsHsHQ_zmbyIzOCWyE2U3-bRm
X-Proofpoint-ORIG-GUID: 6K-3KF7hsHsHQ_zmbyIzOCWyE2U3-bRm
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a102b78 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7tNU3UykEfeABMgLdikA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220100

On 4/14/26 6:23 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 13, 2026 at 10:23:59AM +0200, Konrad Dybcio wrote:
>> On 4/11/26 4:32 PM, Dmitry Baryshkov wrote:
>>> On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
>>>> The PDC has multiple DRV regions, each sized 0x10000, where each region
>>>> serves a specific client in the system. Linux only needs access to the
>>>
>>> Nit: there are other OS than Linux. Would you rather point out that
>>> other DRV regions are to be used by ... what?
>>
>> TZ, HYP, HLOS, CPUCP..
> 
> => commit message
> 
>>
>> I'm wondering if we can make use of the HYP one on e.g. Glymur, to
>> parallelize accesses (and whether that would bring any practical
>> benefit).
>>
>> In the RPMH architecture, each "client" has their own (GPU, AOP, DISP,
>> etc.). Then, each one of those clients may have an associates RSC
>> (Resource State Coordinator) and/or anyOf BCM ("interconnect"), VRM
>> ("regulator"), ARC ("RPMHPD") voting interfaces
> 
> At least the RSC should be visible to the OS. We don't use it (now), but
> we probably will at some point (at least the DISP_RSC) if I understand
> it correctly.

The display RSC is a separate instance, living at a far different
register base. Same with the PCIe RSC etc.

Konrad
