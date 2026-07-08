Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59A443B6E1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512742; cv=none; b=izDZjzLbFhR7l7z0/YYZBMjBEQEkan4Zvfjz+v1K1JE6b0qGIj6K59pMFvhQDnW6+/XM2xZup+zzN0yXN2vakaTEkHBEnVsP2C1UWo3YOSPTOR7gKw9ioOCMxmB2OSf1zRLzVWpg8DWuLJGMEo7fdI1SXK4hvUO8WG09rQNpWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512742; c=relaxed/simple;
	bh=QDWu4O8I5KOVgg1UuqQFKZb6pS9L+NuXj96Vv9RNZaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skHggO7YkmuzuwL2ZOwvLhsObxakCBQwBNoQJ2Uckkkvau4YAGy4CYiVwaaEisUiOdD0jeRrJXYja0iVoPhHl+i47Sa/DfV2thud9GVtWeOMu5w0pZrOyD7wJllgP6rEgHSniIJ1DqMGO5uzdo8/TBdFmYkP1CmMJAoqyjF9lt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ja9AnmOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvwbrRo9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ja9AnmOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvwbrRo9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Hma2752124
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x99srZ1k83NBw3X7LSFItZj86d9NxG5WKDanacpAupc=; b=ja9AnmODhXlEoMTF
	FNwz0QJU2GPyndpnLM5SOP90Nk3EdQtqJDdrafXJpQ7j9YWqpO6cdBHiMnWWJkku
	ppjEAKg3MCFnwrs9JTU5KgYfysEys/pj6JtdQS68qM2z8PI7szix+pzphtpajJqI
	sn6KOMFkKvAdzMWI2sx67/Qf8qzYR04+SYlPcwBd+SyJc/yPFe5U1O8ZsKLhbZX9
	mBpu1M+aj7jwNb7551K4q9RQxcCMDVOphoq6TbeWTa4C1LaPMkHVN5LpTr5Qv15G
	5Mhzv3VccFehIBZDmdLJvlxH/zQ3N4jCE25+aUDAMo0QagIt1pI4E6XKA//p/aDP
	f5upfw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hhj5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:12:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso3513541cf.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783512739; x=1784117539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x99srZ1k83NBw3X7LSFItZj86d9NxG5WKDanacpAupc=;
        b=bvwbrRo9nEBUJ8vWCQRFAxjRiSl5HPAvGncc8EqJY+sY20aSo2IKBApFl8+wM1kjZI
         kC0kw0+5Tl/XPt4G3U04DEYCQM6dWGvNIuRQARVhqw50qnCfteu7jWKaC0owTVqQRikZ
         1n+zDPechTYyLh36k6wBDH8Ovd6ZlcuerG4AEKt3ijY6WOcEsccqIfMUZwuKSlnVpVEU
         PjHtHQXNTc74qd70CXLuNJUX0b0fMOqbWJEkytSF578Fzd+ryB75Z+d23EHMyJhPpD1J
         iAM7pl/SraWLEvmzNn8AvJ1mTCHxbjpwtMwuC8CcXaGL0J9jeKNu8T9pPPaE3LVfOJap
         bnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512739; x=1784117539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x99srZ1k83NBw3X7LSFItZj86d9NxG5WKDanacpAupc=;
        b=Q2lHUzFMA5fsGjFk+OhhwrBWjry+99QaTZAW7bQmAEXEjNBMSU0mTtslq5OWyy8T98
         OE1oYo6JcfblOVu44Lntl6ZtbOZn51lRmBXCmOmBt/Vpl44zHWNU2jdS5ShMo0LBPhlF
         H8xF67msjAtZd0tdPCDxvBUCXASOQZPa/6K34ZMnLQtte/rALS1tekDaoYq6Xy1GcEBy
         M5CFl9NKcGJmidV7tN0kIygGoxjEPvc0IV1p68bBsFcBJuPpHJrxXrRnZ/z6kUhoELob
         V8PI/CGg5WxouIDiTNsV4brlD//ivt6cHUxq968dWs0wbkygDN48guqSMXuBTBfdZG+M
         zinA==
X-Forwarded-Encrypted: i=1; AHgh+RpvcfDRs2ffx6wNc8OvQS/IzpN1fOu8QIhnMygUlIaA+Wko8ISUOSmdgrlmABj6kBFrGJzYDx4GHxxR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0gTDMS+X7tg8+Lws4vRhvGeLiVuDtH9myvcU82xq+BYKYDDxI
	1DwZFr+tybiOqnP8Vzh0rNBfRtNO1Y9qyFrVd271e72dhAQn3DXUO3rLtVf+SCVuZl1mzCizQUh
	oql9CIZkaQC9c2o8GUJenjLFSYTGSm88To5U095trVwEWjBVfa/YQhPfflgfFFs5b
X-Gm-Gg: AfdE7cmZpJRiP/L7KsaqMdUvjpwCDj9xGAQ/VN6MxTSNOe9YhzhqDedJSIlBbdLUz9u
	RQSZkI7TxB+G6Kuci59XbTvw6ven3VP379t375B5KvkKlegqT4vhZt1/AVpSBmbngseFkIU8v/S
	74ZeG6RurQ79NGHyrpDHZGKTDuu10j44XLSfB7o7azx6Qypb0mgm4cT6qc47MdqpLSIZX0BPoIO
	Gz0goOBYl6xSgDmsbleTaTUIwGF4w4hfn3Kd1qo2BA/vnSJ9wHdmnCSXxHx/gh0cpeUkF152XwF
	IKG+oeO6LkBakWqYIDd9MvaNfY5JqJ4uGFJdGNQqC+sbmaBDL0V/v3UyxqcybJuIvf4Pn1Vnfv5
	e42soJxpGX6V0FdPOLpxXwD34zSb8BtYKOMw=
X-Received: by 2002:a05:622a:110d:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c8b2712camr17779221cf.0.1783512738986;
        Wed, 08 Jul 2026 05:12:18 -0700 (PDT)
X-Received: by 2002:a05:622a:110d:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c8b2712camr17778871cf.0.1783512738409;
        Wed, 08 Jul 2026 05:12:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm1965138a12.0.2026.07.08.05.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:12:17 -0700 (PDT)
Message-ID: <5d46c46b-1f58-487c-a883-bfb8ea356035@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:12:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
 <20260703083421.2736184-3-ravi.hothi@oss.qualcomm.com>
 <bbd86b28-b6e7-4483-93a1-bac96c2dba43@oss.qualcomm.com>
 <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <059f8b92-6df0-4439-b3ff-1a270b5ee1b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNyBTYWx0ZWRfX0RDJdt5sRC0R
 rCwqb/UPIVUjT9Qsufv9WTcZOt8kqtw90dAX9jogZlaHeZFneFN8ZJJQ9udNMO7lhVYmIVDeQmH
 CjebRhw+UdXgxHom2lCEXuphT4YMWwC8TLw22T/Q0EJAp19FVctKnod33qigg+J2NiU7mia++c4
 rGgZpr7Xp+lwZiW3hMOA4de0f0+FxBpSeIONB7b5cixVLpTioszRhpXc1uzTn+WJeJsUNV9xm3v
 Be7xRRix+jLHR7qYkxeeR9rqp/u0ZD5gD0wkyAZdx+p0kCBsEgECxliwmnIn2tc2FFhniRpucaC
 fZCGsyVmOxX4Y8CiUsIb7bNlF4EcvRZdy71ISfAVLu7BX8/u0iV41CFvkdqku4Fy51kkYIoqbDx
 H6jQAYINP2i0G/o2iu/CcNKIV1i1NLBFztDzAhw74q6FhePik0ZEhaF4pidD/bAauSR0SCP/Gn6
 Ei5sAJdOIKeAOiKNE5A==
X-Proofpoint-GUID: aDCuhukx58kYsBVCfxtBacS0orpsiSfj
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e3ea4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QKulUWdV5NHAk1IIq1IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNyBTYWx0ZWRfX2IITLZ+O/UfG
 PyYoHDF/zyPiwsNxfU6jwSXgjVHImZZp2rDtQiulnDbXHIsr7U73tcBpnncMOpCGkOh1u8PrOsz
 Md6sYPn/dhoeM3oBRkz7beaSm3E3OaU=
X-Proofpoint-ORIG-GUID: aDCuhukx58kYsBVCfxtBacS0orpsiSfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080117

On 7/8/26 1:27 PM, Ravi Hothi wrote:
> 
> 
> On 7/7/2026 2:11 PM, Konrad Dybcio wrote:
>> On 7/1/26 7:43 PM, Ravi Hothi wrote:
>>> Enable the sound card on the Eliza CQS EVK platform, including the
>>> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>>>
>>> Enable the required LPASS WSA macro, VA macro and SoundWire controller
>>> along with the necessary pinctrl configurations for DMIC and WSA
>>> SoundWire interfaces.
>>>
>>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>> ---

[...]

>>> +&pm7550_gpios {
>>> +    dmic-eldo-en-hog {
>>> +        gpio-hog;
>>> +        gpios = <7 GPIO_ACTIVE_HIGH>;
>>> +        output-high;
>>> +        line-name = "dmic-eldo-en";
>>> +    };
>>
>> Why add a hog if you defined the regulator already?
>>
>> Konrad
>>
> 
> The gpio-hog is the mechanism that actually drives PM7550 GPIO8 high at boot to enable the ELDO hardware. This GPIO enable is required to enable the ELDO regulator which is powering the MIC BIAS supply.
> The regulator-fixed driver with empty fixed_voltage_ops has no .enable()/.disable() callbacks — it cannot toggle the GPIO. The dmic_eldo regulator node is needed to correctly describe the supply chain to the VA macro driver (vdd-micb-supply) and for power tracking, but it cannot control the GPIO itself. Both are needed for different purposes.

Well, why do you think the binding would accept the GPIO if it
couldn't be controlled? Of course it can power it on/off, check
regulator core code

Konrad
