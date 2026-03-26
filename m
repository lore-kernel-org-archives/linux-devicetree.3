Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267D43EAC8D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774525205; cv=none; b=XuL2HiZgUj12btSfCQFYawVvD8xngoo25XreBvt3wyetX24wRa/7lm3SZG51LLW672h87sFS47xePzu9EDzCjLJoE04dUY6dwWyw6jPSDqGnugDYgCsWE51sKSDzWvlsYXMR+IC7eiVyTW3YvEFP0BDj8em3A2TNFh0XOehDWAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774525205; c=relaxed/simple;
	bh=65eoDA5aXZKiN86gCHpFmmdUEmkkKaAXVNwubjRij5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IusdYzl/UXRivX4J6E4N7+PcTsf9b0YFKcYapha4vIkFczXv6jqHnaXhVpa1vPRy93wqFVyHjQqOQp1xRYEef9CBOyXcJVYRUt3IG2JHKcPHLruUaHMCrxhnrpJILenujiMDdxsB7/cmWARYUYX4eTuUlDAtIthxlPFAdGNPyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nY5PlCsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJ8NsJfu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY5PlCsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJ8NsJfu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6OqoI1060682
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=; b=nY5PlCsU7Q4oc7Gr
	o6E4xjYB6CqSMJRRVArxY34+zAlEXSBJFsXMXE7DweGbtEoRMFuLsznxS1Kfj1m3
	tUlRmhF3jj3tr8xw48rHKRxnnAA6mhtRviSHEy0yM170OR4v5M//S8+Y6LA2L3yA
	vouAnDsWAc/LZCYJFr5dGDFZiyY8ZOHgu1bscUcszZbFvRqFrfOlygePLKPX3z9Z
	q4MMNdtlnnEaNS8O609DPVVRokQH3fnnM0P60gYt+ynPXiJbDo1YaynGeO/9HrZ7
	GUGpvXVyC4TbY9aIRugD6p7RQpBZhcp2u+sIbXfNlU6jd+A3jYu0dHMJbiG2JS8B
	cqDaZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkstf6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 11:39:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2955cc1eso2402451cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774525196; x=1775129996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=;
        b=GJ8NsJfuumma3A3h75iA+VX5BBaHl6SN3yO7zAQmnOpU1Fh7cRPUe74qBN5i0UPGSP
         zWjBChpPZ4BCsreQSOddDmzlrLoggkSMxQ9p0KcRMaovLMryJLdOXtcvg+CLEYXah4cP
         iuuZbKTJkG2Ha8LEH9EHEipO+KbvMMaRgGWfYsC5GETjlfMppecTWVxFUkdT9P/rBBHG
         cv/4/GoWhgbbgnvduHzpQNgSUd8mDlj54mH8NdbeqA3MLJq3ares9unIjPuanWzUmTTy
         a74FirzG/UJxcE+F8q4yuwnzR43Y6/1cLrO6YhdcPqo/3onVOmeXcFNENi25kvebB6l1
         FWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525196; x=1775129996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sX8nCJoTG/mn6XePX6oysvzTyZ/0eyadLiabjS3doA=;
        b=nlEUrqzWRXErT1HBg8K9oGeQ3xba0Qb9+xVlteQBe6f11lMFvI1NaSdvHnnfyGuuno
         F1XkXnEcOOE6n0n2U12ZpnRb9Qxo7Z03vqoR6ftFFWHrPN+HMz6gLRpCKCODobuieUf0
         q4KiiHeS7zG4d6G839LHDng5bwI+73LPeuEGOPNy/94Qz49D1zTZvN/I9g4in8kqbuf0
         vz5WmuUW3pdUMfVEC5dyHBD0cMwyJeOv9sXVuqP27RjVhGT1/DGIrRdxqGYaullWo/Jh
         l11TPeQ7DYeWuvOZg8urwZPkAbbIubHj0Cm/TCtmZKtP2r/bvCOlLUmCvR2Pebtna/9y
         7GWw==
X-Forwarded-Encrypted: i=1; AJvYcCX+xPRiHcSrHh4LuItcZToaLkdp8cI7xGI8Ktpb9RtnkUvKhh5OBuIgHOWyhsY9lV9NR44d9opnluMI@vger.kernel.org
X-Gm-Message-State: AOJu0YygVdAiZtY3s77T3ulYwrYHODHDnyt87wsfDnkzOW5oOfKNGe7J
	jthU5xtHqQEFAP0HxIKxDpx7O/yqAcq2uyoI15G55SwkvMn/GuBybpqCW+UHNbdgs1UsUnDgXwM
	kFHGVTQSyVHlQQPSdoYCkE609zB8I42cZ9QNR/r2YPOeevPc1F4MCUPDxKXzToTfb
X-Gm-Gg: ATEYQzzaVU+D7lR9F4kuC1ip5SWVZwAAGD7uHemMZepXxCD7cynPYBk9xF/HGiqSSSh
	NDwxvos9QFl2qOhl2dszVlrvAjVjUJSAthdobJoDy+Q8fY0apU23FB333gWHYGhgi6AUf4UizPM
	guXwVswYFjz2yIPcY0gySYuzUJrdZ3YNlpD17FRGMkW2rBTPFn0d1wh31TZU6Ty9WeJZ8WPkADK
	E13KEMytw5plzA3E8MteITkEDri7IrTAx4BqkdhL48ORw+d5+R8ASTa2gzNCl62tTlfdhD2SPzV
	btWr9xefvCS9ojKKMk+m21RWDkCvFMnCmVMVNgS91USVrb6LVlG+CYcSYM1Xmyr3EkIuc8brBs+
	50HPipKwB/4ftZCDO/rq0q/wUZG43o8ZyX4yqcLoFGyKXOl+t9JN1wwdDnOdADZs9i1xhM3As9h
	Olvnc=
X-Received: by 2002:a05:622a:4486:b0:509:882:9e7b with SMTP id d75a77b69052e-50b80f10b80mr46079991cf.8.1774525195985;
        Thu, 26 Mar 2026 04:39:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4486:b0:509:882:9e7b with SMTP id d75a77b69052e-50b80f10b80mr46079731cf.8.1774525195353;
        Thu, 26 Mar 2026 04:39:55 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2231sm108580566b.38.2026.03.26.04.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:39:54 -0700 (PDT)
Message-ID: <e79139f5-b737-49e5-91d4-c9269be41a47@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:39:52 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: David Heidelberg <david@ixit.cz>, Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        oe-linux-nfc@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
 <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
 <041766dd-422e-40e1-9e5d-c220580871f5@ixit.cz>
 <a0da2236-27b3-4491-862a-457a03cb4c5e@oss.qualcomm.com>
 <6638c874-8472-4383-bf83-21c5b632e73e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6638c874-8472-4383-bf83-21c5b632e73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MCBTYWx0ZWRfX6IMvqpRiL49s
 znTN5JVRd0Z1JGziNvWKl7xFSJ8oZhSJKYUJEoRWAY46LtsUaKppAJPSMGCSX0gXFZxir4ftYpV
 Uwqhv/s59Kl8HBWx+OB0Zn+uLWO5ILPG5JWkXXWweL3K+ML3rVfEMlC5OQ/R4SJeZ8kpHyRKccB
 q4NObRNwUS1q3gKRIsqvxk2dHQdkoXgAeLBx9mKzELNcdcyAWkckhjP+rg8KSYucbig2Z47a05v
 anUiqAjRr14EiQ6pEKAFGptKeoJYwpkfdKCT50QRC/OH0ffxII3Vz2mtYkPeyfhYHsTHFd5rBUm
 1rXWjVhSLnWCgNYNhs1iL0w8RLnhsVLc4YVuLNdJUPWa1HVBAT/JOnHFsTKaJD63y4GUXtmNdIa
 4Q1s8QF2J095DHO2l3KUu8hAKmZ6xDHVwwtuHjfvcG9iFMs1Dnx6jrO3zioqCkM2QkRgMR9OPoh
 bNJJ7UvO/Vo1+aana5g==
X-Proofpoint-ORIG-GUID: uPj_GKZcrY86quv4hBXL7RqkW9dC9d5B
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c51b0c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=-PauhVP_RH9yc3VFBwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uPj_GKZcrY86quv4hBXL7RqkW9dC9d5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260080

On 3/25/26 9:17 PM, David Heidelberg wrote:
> On 25/03/2026 12:20, Konrad Dybcio wrote:
>> On 3/24/26 7:08 PM, David Heidelberg wrote:
>>>
>>>
>>> On 24/03/2026 14:12, Konrad Dybcio wrote:
>>>> On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>
>>>>> Definition of the NFC.
>>>>
>>>> "meh" commit message
>>>>
>>>> [...]
>>>>
>>>>> +    nfc_enable_default: nfc-enable-default-state {
>>>>> +        pins = "gpio12", "gpio62";
>>>>> +        function = "gpio";
>>>>> +        drive-strength = <2>;
>>>>> +        bias-pull-up;
> 
>               bias-disable;
>>>>
>>>> Are you sure about pulling up an active-high pin?
>>>
>>> I'm not sure, but downstream does it (and "works for me"). Maybe Alexander would know more details here.
>>
>> Would changing it to bias-disable also "work for you"?
> 
> Yeah, works for me. Should OnePlus 6 do the same?
> 
> Looking at OP6 datasheet, there is no pull-up/down on 12,62,nor IRQ 63.

Generally the internal bias would be used to counteract random noise posing
as signal, to ensure the line is kept in the "inactive" state when not
actively driven

I can see that the driver initially requests both to LOW and then sets it to
high based on the desired mode in nxp_nci_i2c_set_mode(), so pulling up is
perhaps never really desired.

Konrad
