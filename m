Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194933EE1C6
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949701; cv=none; b=j+IUbsdhXxip5Rp2vBx6FoxmlGq/BqGVlRiYidaFX6n8LduXKAqaU1uqcmRCrl12OVwHP7LSxQtVK//hQm1qdYJlLj/HQFne/I4pkVhWCTzQTWKCt1/cWK2IsADXoJxqjiYwu5utxfKFazi+y4QZvAgrYRgTNbQWqDywt6oYZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949701; c=relaxed/simple;
	bh=JeKBGFKhmjEikeykEpVzEpAMRaL8OGouJD/58jOryKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0LuaBJyK8u7ZFzQLhKVthaYqva9ASpcglZVVVYJSuN8FeEDmQo/ZBkBzcBGxFP9awXnkph3y3b5XKHRx+qXGCKaafvAkg1pA+E/OioVGK+0l82jXxiWPXr+aCmdkTa1XRewv/FwJ6LGnqSX+xrh4Hsig6zK0yjxjgQBBEv+TY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJZRgTk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBlb4yZQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJZRgTk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBlb4yZQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94fdT2319281
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsZKP64t18tk2l6QhQDwcPLRCkxAprASAWO0tvycFyA=; b=RJZRgTk/VEJZYy4r
	iGRQa4yy8j7KjA6LemHZiXfyson3/4DzjwM2wkzqtzBIrlOBg/3c7JGB0DnSslAx
	mK5Nq/ge5Mv2Ce/ESwBlwKaoDh1ywNYB5P+NSGoWj71GyqFrdJqFJVGC932ZW7QX
	l5LdHvflUo4afDaq8gea8Hcs4G+PJqyFQ6Q0Tp8ZfEUfX0c1lqvv+dC/hW5eHcuL
	+mCvzCuw0G8UT3smUTmw234huggSWakt9HFAcdlGrplI+Iy206I9KPgMT3HfcUdO
	mRjamnyaoGnGO9WItD33In4w5WzbY/ROpjm375WyIRElLkY+WxeVJ1q7t9AY8hI1
	drGb1w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsrxx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 13:08:19 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d8ab2f3c7so498071e0c.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776949698; x=1777554498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsZKP64t18tk2l6QhQDwcPLRCkxAprASAWO0tvycFyA=;
        b=HBlb4yZQG8gN8CQnxzNow7Ms9enElGfjB/NFLCY0XGzoLY/ZwcaPbbm2LvwNaBms8h
         PNzZcPKgZttsWpXh34ONWuKjmLdB6xZseXWA2Y0c7NGBM5/ynnLJffKgjzn7fl8sVKSV
         dsOQtgj/q2jBeMJves3LmsJf7virukVx3tfxSoO9QrUCyk426g52OrPfmc1ik70F7xec
         q2dDgYSVVLLNd2vkOX6IHldgxfPTdcYCFYnVDzoSxg/VX9ZeQtnA3OxZQfHcVRwilqDR
         eqE2aD6iNGNhAJx3wWr8/H9yGcVz558yhI2R5CUX4FDCE1csO3q9D+4Ee3Ma+M+p3vER
         SxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949698; x=1777554498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsZKP64t18tk2l6QhQDwcPLRCkxAprASAWO0tvycFyA=;
        b=bGQrMlCZWGf7Iide5uTEb2x13vUVlENiQZJjwTTye1ML2a7PiJcon5blAYN/vO/fm0
         SGdljnOQgkQBju+oSiQJi97UZZp46laafjudUDUi893RCEOYxu7gor7nae5Dq4zGhJ0C
         1QelgxKZxIZOisVDyc7fvxiMecYRh44bgNjKwURz4ImLa3sZLG3z247geG0/ZiFIJdYD
         Uy5EMG8pRtlk0xF/X/n1kFU4PY/3y78OTWTYXxzPbzj0PtoUDnHbLVh6zkxfxKIWq5yx
         RBdpmFV+/VAU0ewwT5q1IpXbECgw2dOfkd39HIW1vgCijp9/Q/EIJdFAMqija+XLCaWi
         phnQ==
X-Forwarded-Encrypted: i=1; AFNElJ86dgiGl69tz+59w7dMQOAK/tBKSz7w9BnqkYNwMobJDxnPAlukfCicG6HABubgrQvVOYvz4Vrg+s1s@vger.kernel.org
X-Gm-Message-State: AOJu0YyNY09nMZbbiEm6Fux0237Y57nR44MYWXxrjSFLpLqawOXRIdKa
	9f7hIQgc+XrePRjJfPp9HG3YxVlm5P1TMxqeXlDxo7GEAQwfF1uMPtJ44fu3lbO5iRI9Z9+gTWF
	O5qUu4WFiDeOisPYpIqJNgJyooY8jKFqOFZW9jlBDHnx3vsRQZPjkXutNHb1B/LHc
X-Gm-Gg: AeBDieuHzqgKFKwsneA8r8d2G5wjKA63fR7nBz1qDI4M+sfoDmLcum/mTiZLidlbR/9
	4TEe2uamkItCkTf3FQnY0hStZfY45Gd3qa8O8FgB0aUE93nODoQVdcplJzJB86bb2AkXDnegH3l
	gXXfFCHHdgiafMS0dTJ6JLlOXOg9gclpEwy5FwyjC3NFZZMhdb0cE1f1gipMVoiYStKd5RRSNQK
	/sHHDeJUJbNor8J3nXJEIW63ikFCrTSOEl8E4jrYW1NqC13ayMf4FS9dpXYqOjL3NZbNdTIA2nC
	LjMk/EBklXOxELScHJ+vs2P01VN9EZGUIjcswq11fKUkpkzWv5LuzWZfmKPdxbm3bGMkEfIaT3E
	uq3atslIo7LNjA/BlN6eiKydI5nf7lBgfETFxrX1/p82+Z4ScEia18YI0V5cy9r4snDLVELbgmV
	TLow7axNg1Y7pMdA==
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr5263147137.6.1776949698269;
        Thu, 23 Apr 2026 06:08:18 -0700 (PDT)
X-Received: by 2002:a05:6102:f06:b0:610:2c3b:7d99 with SMTP id ada2fe7eead31-616f88a28d9mr5263102137.6.1776949697737;
        Thu, 23 Apr 2026 06:08:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45553980csm655451266b.58.2026.04.23.06.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 06:08:16 -0700 (PDT)
Message-ID: <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:08:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n-sVKQ6CsQNEHElcANw14mbwdXVbjwoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzMCBTYWx0ZWRfX7Inc1csG5dhy
 fUhjYqe7UTLF2g6k6PMp6v6zPjZDwnGxoWgVpVrEEjkFikTZumVI0FRjJJtguyUjvTCU7fJhomh
 uNZPdxc0eG3eIQB7VbC7rNE9pF2amE5P7VMFMVtDUV1Cdw42GqglQPXoARgqP3CWfjtHQp3ebcB
 nZqzRWB4gpX0rnK7l2fh2fo2sOCk7ZX8Wsy1NGo5TKidQIZcIkMAwKJfl0snExAXps0o9sEdJUk
 ieSpkc6w+TQVjEUJ4J7R2OIhW1JkRZW4+aWljtSwZT/GkONn36w7XybwnkpKi+iRdlFai7iTibv
 F4tiCIWOjdyzkCyaeA22D/uvK60ttlwaIRcFkx3/hb8qywIF3bB9oSNM/ehmc+MKa0fu6p8QUWB
 GEXn5Di57vbuE3zx7XH+PwakjUgvOe2GjW54pmSEEn6R/WUQDvi34NtT3bW+RKTq+LRxpF7MoFV
 dhc+/kr9r/w8AXtwMWA==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea19c3 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=FdLPwuPmqTsolQjbzToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: n-sVKQ6CsQNEHElcANw14mbwdXVbjwoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230130

On 4/23/26 3:06 PM, Nickolay Goppen wrote:
> 
> 23.04.2026 14:05, Konrad Dybcio пишет:
>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>> assign it to the ADSP FastRPC node.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 36b419dea153..af2bc29ccdad 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>                       compatible = "qcom,fastrpc";
>>>                       qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>                       label = "adsp";
>>> +                    memory-region = <&adsp_mem>;
>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>> Please double-check that, the VMID used to be different on
>> older SoCs
> Do you know how to check that?

The least painful way is probably to add debug prints to what downstream
calls hyp_assign_phys()

Konrad
