Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF03AD509
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 01:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783474792; cv=none; b=AITQAzEDtKkFuHOTqJME9nK8mISgcEOgJ+zGwTzmOeR3deIfSErm5oIljcZ73eTY0HzQyaqPxxC01XPJIHJDVnsOUgAB3CCTU1d5kf/hElAjV7Q76k4wDQeescHT1KwiTgZr8yw7tDn7y8QN8RZ4qdNnh2rqHe9Z5R2Q2SCOgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783474792; c=relaxed/simple;
	bh=yCncyE3KlpVre3IkDw/pkbr47CSxW+I8kefLdPBj2hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSYvLKNqcaWRacetWrubTp+QAPV4YzWkqiWmaSdgXvsJTy7DfdjlYJ6846dMooL6CH1WgKqUTSnhRO11w8qeByxKKuyVOxdrRfgbuVC3b5K7shWpJMBhM4NvcVb+kfmYzFqfoYXePJnmGRe1GfF7EflwHguhAIuP+k1RxS0nqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ShLeWp18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYCXU/mT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShLeWp18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYCXU/mT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Mcx6F879423
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 01:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=; b=ShLeWp1829Zxz3pA
	rMJbwZSnB2Xcv3uwTMUpd1+DyUEnB55gn/RL6XWzE8sy/behNltJqmhsGvECKcx4
	uAxHXwvYP1VbU2VZP1+AGtkEBKI9b7RqgjbkjZtcoOOV2NRXPeSohZDRsnm0EszK
	WTvCIApwc8Fug0aA0dxrkxMr9ofoSrbLPwKqKCbJC9fr2MJDDtAJmwtQBYRuDKCn
	54YCcvaokUjdU9eIbC896aHZNSf/4KnXYRjRD9qjFPrJAdnoPaSUWj6Us4A7KHMu
	4HD1IEMn470zVEqPsBsVVnsQdb+wLSYMobEkBoW/pd5lKNcYLSF1r9GWv3VUMmT1
	Z+l3kA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgrr1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 01:39:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso385850a91.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 18:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783474789; x=1784079589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=;
        b=bYCXU/mToj0wPvRUigk8IlKr9inIZNhdW3OvCRJ03+5uoOQpS3oT87iRxexIHGRmHJ
         bRaEaaVzK8kf1Fl0EicdDDVJIZ3UlBo6euqiEJUArPjpnUiTOnpqNKI0OVMtFd6SzUcn
         n19bKYhJfBoXGizl4iboFLxDRC/bKq73wciZgsYct2Cl4eoIfPB+1A29a+Kb1b/zA0Tc
         jeyKtoez6mNEy/kFgD/AfkCQCoX1PdgkL4XtfUjLC1xxotmAxTkP9J/MhYbrpj8o/8Hd
         /+bJP3M4/qkKtybiZwl8Xr888DA5iswrkNmbkasEl9d7jPF1PmoZWdJ13+iClYEIFp7w
         5LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783474789; x=1784079589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dg9S1ReWnO628QueH5exSmyzBX+YB3dCIncjF9Fit/g=;
        b=quCYzM4fq0mueovPU7buN0grXvr8Q3ACjaUnGpk9jsAKlOLeXEpKI6RWwvp/D96GqQ
         gbEvy4y91gC4l1EfKXKbS8mTwYYyF4MeTpm9Ox5H8C2LRInkmHcfNnxqlN2CB025FwqP
         0+RbqqYk8vPZ7Pp7SiOoXdyLFHQAjCDaNsb98trwpP0ZNzc5oGPXBuvFbmAXN0b3wfwE
         mKZCPoSgvB/uEA56AUgjfTeqtprYkUMM2NvuNbuAGU2vnJh0nRqgmXIrOcMt5BE8mpqr
         zvFCshi9RtGQayHXyNy1YBKMqYCJGaJHdyFVfBd6cfLMzAFmSaAfKuxqTP4hX9Va/6Uu
         2cDw==
X-Forwarded-Encrypted: i=1; AHgh+RoPJU/toiGkYFZxTFLDrEhUsFJWWhB8JtoqgWIK1VY1yNg1WtZrafctsW+Xop3UJWbZlyxEdbPJ3ryW@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3QSWOHsahBOR3LZ9b3dUA+T/bcAG49bmqn2X57Xkf7YDWdpV
	21mRM0rFitH7lai3MlACB3iTBWE5RzWhPHqRsk/EPaAs3bs3nSXxduGL2N3pWNpC6N1MV3E6TQl
	ADqsVa6TD1bE6skV7O8ykz9qap4rR+VJKQlZ6mGHiUfeQ+BoSkDlGuH3+d/Bbj7jK
X-Gm-Gg: AfdE7cnqqBfisE1C/emuXzqALUYEJKULUole7w/W4c4PbaTlk4awzTJRFZyE++hx6lc
	i4tNB+v4HtgeBHJgH1YXZpLBRC9P6o5U19SdR7pz5uz1h/XAyf0q+SoMjPi9xjtWsAh+Xk16omj
	cJA2AYVNlmsi17rc7yfG3pEAYnKqFpYbVT+KHijVCCp3K8mnSxpiHP7dYcYZUCszzF1duYPxnJ7
	hD56qHq/UoG5mohpQ+GGEDVZwwuuxFt1SsdFPDGxlib7gVZ/YXLD/NglrnEfohOuLrVFRKihRSj
	6Gm+TgBKDtQaMW55sEGS4dGDhy6PSV201/B42UY5QAO3dMmHUmGFZ5LeLwGob3w04iLfh83zTMt
	JX5AZs0rwb76YZHWJBBHXYJR0Wbqtk8lzQwSnx8g/WfRZVfnXaj0/PSOc3rB+Rh+VhuzGWgfIuG
	S+
X-Received: by 2002:a17:90b:2641:b0:387:e0db:3fab with SMTP id 98e67ed59e1d1-389424990fbmr352062a91.36.1783474789001;
        Tue, 07 Jul 2026 18:39:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2641:b0:387:e0db:3fab with SMTP id 98e67ed59e1d1-389424990fbmr352017a91.36.1783474788369;
        Tue, 07 Jul 2026 18:39:48 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17ed52bsm1853284a91.11.2026.07.07.18.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 18:39:47 -0700 (PDT)
Message-ID: <3547c76e-0b6a-41e3-9ce1-e7ff652b199d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:39:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
 <545b4ebb-2c7e-480d-80bb-5e08dd3c52a7@arm.com>
 <f2f23d0a-dc24-4a06-948d-56df913994ba@oss.qualcomm.com>
 <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <6b7294a1-8c13-42aa-9f64-5b5c9af0b41f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0JxFd_tARAGvhkbJvLdTmxUVWpII_WMn
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4daa66 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Z8Xz-ZLPEYxu-CxkxF4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 0JxFd_tARAGvhkbJvLdTmxUVWpII_WMn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfX3BAExQD4p0zw
 G8qqBoN5yfuuW5+ug5Arjzu6bU8k+BjCYGBsBawjIukqRZInqXjKkILOKe/jh8Fgp55Vy4f85PZ
 m6sQ+rpa8ap9v4gtQHANm98S3eiYQYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAxNCBTYWx0ZWRfXyC88z4iQfTVo
 MF8Mi2TtrUJWW1ejyef6gWl/GbRz/Yv9YOp4uDRjRsOVcod+jujPH6mmgzimlo8i/YXrD1pKZvM
 FIum3v7aP302nbo4yBTNEgIFzD3RhjOxhearNa8o2lJK3MNfoYFsIo4HNy8WGWuCCjoBXvlGVfG
 G3e67VtjPxPjSuG1C4+oHoa4pLpzLNEEQP4IduxaXDnsSyXkZChBinozpXj7fjMZU74Eqqk5TMD
 dk7ZMxfXRwxS5J+E/lLN6AZkx7l7RjUU08z2S5xYUCDpnmMbZ1UIFspKHCrvxCRX5XGqIuBS45v
 HBbsyR1o2n8y/lh+QNRcYWeFgiScT+AKlnHH1Eny2sLOFJQBCmX6TycPlQnlbV3PMNPdgwYeolY
 tl0jftnWbgA3vTCAOghRwkBAvQ09bKytrIGRsu2DvTjcnSqEkj9TrFVknEPx2raQ9NKa9J193Mu
 /zouDxsmH/ukSg0dGWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080014



On 5/29/2026 7:10 PM, Suzuki K Poulose wrote:
> On 29/05/2026 11:26, Jie Gan wrote:
>>
>>
>> On 2/27/2026 6:10 PM, Suzuki K Poulose wrote:
>>> Hello,
>>>
>>>
>>> On 04/02/2026 02:22, Jie Gan wrote:
>>>> The DT‑binding patch adds platform‑specific compatibles for the
>>>> CTCU device, and the following Qualcomm platforms are included:
>>>> Kaanapali
>>>> Pakala(sm8750)
>>>> Hamoa(x1e80100)
>>>> Glymur
>>>
>>> Given this is predominantly DTS changes, and there is very low chances
>>> of a conflict with the binding yaml change, I would recommend this to go
>>> via soc or the qcom platform tree.
>>>
>>> For the series:
>>>
>>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Hi Suzuki,
>>
>> May I ask is there a chance this patch series could go through the 
>> CoreSight tree?
> 
> Like I said, it is mostly Qcom platform changes. So, I would leave it to
> the appropriate channel
> 
> Suzuki
> 

Hi Bjorn/Konrad,

Gentle reminder.

Could you please help to review the patch series?

Thanks,
Jie

> 
>>
>> Thanks a lot.
>> Jie
>>
>>>
>>>
>>>>
>>>> Since the base Coresight DT patches for the Kaanapali and Glymur
>>>> platforms have not yet been applied, I created DT patches only
>>>> for the Pakala and Hamoa platforms. I will submit the Kaanapali
>>>> and Glymur patches once their corresponding base Coresight DT patches
>>>> are merged.
>>>>
>>>> The Hamoa‑related patches were posted in a separate email, and I
>>>> have included them in the current patch series.
>>>>
>>>> Link to the previous Hamoa patch series:
>>>> https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa- 
>>>> v2-0-cdb3a18753aa@oss.qualcomm.com/
>>>>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>> Changes in v3:
>>>> - change back to the numeric compatible from hamoa to x1e80100.
>>>> - Link to v2: https://lore.kernel.org/r/20260203-enable-ctcu-and- 
>>>> etr- v2-0-aacc7bd7eccb@oss.qualcomm.com
>>>>
>>>> Changes in v2:
>>>> - change back to the numeric compatible from pakala to sm8750.
>>>> - Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and- 
>>>> etr- v1-0-a5371a2ec2b8@oss.qualcomm.com
>>>>
>>>> ---
>>>> Jie Gan (3):
>>>>        dt-binding: document QCOM platforms for CTCU device
>>>>        arm64: dts: qcom: hamoa: enable ETR and CTCU devices
>>>>        arm64: dts: qcom: sm8750: enable ETR and CTCU devices
>>>>
>>>>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
>>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 +++++++++ 
>>>> + + +++++++-
>>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++ 
>>>> + + ++++++++++
>>>>   3 files changed, 340 insertions(+), 1 deletion(-)
>>>> ---
>>>> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
>>>> change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d
>>>>
>>>> Best regards,
>>>
>>
> 

