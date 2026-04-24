Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498253603D7
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024927; cv=none; b=JleAsvyF5nH+auQt7qdPT1Ec+UIhqzNkF6vDzmzJDOrLRib6QVkGTnwWW5jyezBDxgMkSB2sVWws8xxyK7GB2CsrRu0BaQCmn9laC/vv4dmZsgQDUOfnbNikhxcE6CCc47tQYyT8VKZ4TfmxxjrG+Dvi/wDiYh29/OPqn2OBKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024927; c=relaxed/simple;
	bh=k7o/UioGECwM5LJZQFS71Sh7ZW7KHZ4/bSQ3a82xFC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJfVXu+OsBcqloYaPNsF6J4Bqx5MnRB2rZzEuD4xBdaCZNyjGJCclddu8/j86MUsoVltz1QD8kivWnm0GPpPFplTuxAtBHPm+MaHX9C3WxLBQ3ZOlcPEGL32DTKzDpq7jKgN0O8iY5k9tgoomp6/XX/9LCMjWm18laG7krT6eOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glZWhGsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSMBiFW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glZWhGsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSMBiFW4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9Huo4756696
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbirre9qTSAm+YSJOM1lqnCtSWn/eJ4q4YzLVrR0LIg=; b=glZWhGsWiALR9ps7
	vAsKQlz9Ae3CRq3IiOgw/qFaP5k5knD5CkkjQo+d+FfbNwW2LlKlV/LSN7b7Ag8C
	oO6q41/NUP3IYfDDH9WHVQvDxyHu9QFSwXqTRewsaKZs9nHNhS5qkiPTAPqzvZBX
	j+KKTvfF5XdwpvoGqq9tfWtSYMzNLJZauj9oCkmfHoTLYMukAPbHuilSXpRZQPpK
	dGh2agQagDTtIBVszj+jV9lktNu10gu+R97cIYWsQqPzKv1MoyBgSjPf2CExhnWr
	durCPotRamxgsgePdxKCnzpkyRhkmVW/YIH2H0hfO0ZltupyKgW4jRcC5Br3gCSx
	TkhqOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bkeug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 10:02:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb6880430dso160984585a.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024924; x=1777629724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbirre9qTSAm+YSJOM1lqnCtSWn/eJ4q4YzLVrR0LIg=;
        b=LSMBiFW4XWmQEAOT6IKU94JjoLvjIFhMS9EdmBXzpPdVYAAiir6o7UtJkUH/51RJWV
         ctt0WfQNXtiyLxYYEX1vQcNtefaZQYmkus1Fa7LwLJhyPHnUAATpsegbXe6ntjZ9OkqK
         V54XL3+PRarhfdCcuZ4lj4Z4P4gTZU1uN/RQpcF3h8TeFLF+QToS/uYZG19rojh41LXU
         3BF3sfdJ1rOc7uG7Cxzjd6NZXghnlCYKnlHAmTuSx6tzaOLDJSYFVrsBFXunUvaPcnj/
         O1srEA+0K/qYOkrUk3BwImhR86xGnM0UX5g9U3t7IBBmmzaB96ITo0WtJVtx1Pl0F16u
         bwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024924; x=1777629724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbirre9qTSAm+YSJOM1lqnCtSWn/eJ4q4YzLVrR0LIg=;
        b=ez4/4at3QYVAvIoYgVEvd7n6ulWSPTq0lGym1HuPLYDW+H/y9b409nvXtC1Gq+Mme/
         Mp925gfzr15l8TFzbDAq36qLDGYfDbXZOuLPquTL2QVlnHucVas8wdJG8VqYFQpLHnee
         00i3VS8+wbLR53FPihsuuri3oaVpsclfAQBFEBmZ3JQpuR0tH74RJjwGpSiD7gAhoo0V
         +JGt6eyTBSaf5ZjhfOJ0nWHZcVERNBhm29RhLxEC5odW0waIPzANB96fZf0yP61mWJmu
         KkzODhLCNfbnE6iwHXVSuEbWFsu4vq6i5esdp/RGeKN2LBKwZDA1nISOgcIWM9dAimK0
         fSKw==
X-Forwarded-Encrypted: i=1; AFNElJ9j9q2ot0o/1xejEUDt1jKFVKmgylyXBdfoFMPkkTy1hvMWNvvek6qBhyNZlFzrGyrR+8HdUfhIX3zH@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYIwdbn7Q1Dy4SjuhlO0n6PHzOvDHjtkZw5mKChKrHYhfobNQ
	nj6t4v/3+D2/IcyvMNnNUvj7KofHyv07FK6gDrXoljdwFJ9MRBEqh9VzZ1E+BbAaBt0gBKbbt/l
	GxaSA+c083hVUYXt9RXmhcW1mzx6WFDFMPWbxKVPmE5JpgdDvllerR4FnMJq4qHFI
X-Gm-Gg: AeBDiettUPbas03Tdv7dQ7844gd9TaVh2z5zswE827IHhCcu2it7MuzjGdEzbhcJKFq
	DKmJwwnPIQxrSrF0V+r1Ll7sb58zEsJXqkvh7568fCNBUv8wOtKzMEPg9INYuYpZSd4dLCgis7/
	TndzhepbqBUZyerelJzZff6aU9YLmgJkkO9SIaAmkl2KvZvZtcnB+j3rN9ln6ESCi4kZm38b/SW
	49iFQKCJGZXbvtFMcGRBgsln5+SHkHleEQLajiKKMjt6IaTnwvM3utm0vSgRwJEQHgXEidL/GkF
	paAjqefIbRq+K3ke0JfKF5jdfpBUlwWCalK+zhVTV1zn/mAkD2S87b8NSx3oBKMU69HtXkSvDqq
	GboI0m7ZkIQaCeopgN7gVOaju6k6BU26+hhSk9lEGPz94RODtzVAMKYz4/EO9zmORL7JKyXql4u
	BxTP7I1KnCkBsKlA==
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr856452485a.1.1777024924146;
        Fri, 24 Apr 2026 03:02:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr856449585a.1.1777024923735;
        Fri, 24 Apr 2026 03:02:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67325fcad48sm4622364a12.17.2026.04.24.03.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:02:01 -0700 (PDT)
Message-ID: <c4d611b4-eb49-467f-aac3-e944b219f464@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:01:57 +0200
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
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
 <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
 <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
 <22faffca-b4bc-4e43-b33f-2c5a7152a218@oss.qualcomm.com>
 <7ca1a729-b8c5-428f-8785-287c5c7c73b3@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7ca1a729-b8c5-428f-8785-287c5c7c73b3@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5NCBTYWx0ZWRfX3mCoNJnyt1Lp
 o+G2wGPVIji6kjfcjJjyb86Q2gnu577a34Ip6/BTde5z3IHoFaWIh32i7qjH7a1KZZgCqKPhT6t
 XwGsOPOPMSpYzrYw5ot4AXVAMUgkcbwGZ+mhZanZJoQl9V5LXkObOQgeUiCdLhK4xnZ90qKq9ue
 9RJUXpaMIMVfmn24IqIOzg0+CH0r0iBURXfOAo9zUdqCFXX8mMaxEDXh/dAbp3escV11kLOrkOV
 +qHXtDkvbu9jJtN5uPUbEWlXQelDMCxRvcw2nAbJVh+Wwz6wPnJYWBK0wUv2W746QCd/9V/kW/R
 nHZ7/xicPhNXFKWAeGSH5oB23kPRUwphFDioTAR5h6m2XMBvz9XYhwyCw4lq388m2npjt3MG4av
 GHDlFSu2BkqihlKi1+pQOM9HZhLd+xfo3TOOaql7rZFVKX10gRpvUATCplKSIDbalxEAPwT/8Ri
 s462wNTEfiBHywPrhGg==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb3f9c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=kavRCsagfbASwgqc5RYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: R8glUPdT7GFUbIdhbYJdCrlc6JePk9Bn
X-Proofpoint-GUID: R8glUPdT7GFUbIdhbYJdCrlc6JePk9Bn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240094

On 4/23/26 5:00 PM, Nickolay Goppen wrote:
> 
> 23.04.2026 17:39, Ekansh Gupta пишет:
>> On 23-04-2026 19:18, Nickolay Goppen wrote:
>>> 23.04.2026 16:08, Konrad Dybcio пишет:
>>>> On 4/23/26 3:06 PM, Nickolay Goppen wrote:
>>>>> 23.04.2026 14:05, Konrad Dybcio пишет:
>>>>>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>>>>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>>>>>> assign it to the ADSP FastRPC node.
>>>>>>>
>>>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>>>>>     1 file changed, 3 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/
>>>>>>> boot/dts/qcom/sdm630.dtsi
>>>>>>> index 36b419dea153..af2bc29ccdad 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>>>>>                         compatible = "qcom,fastrpc";
>>>>>>>                         qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>                         label = "adsp";
>>>>>>> +                    memory-region = <&adsp_mem>;
>>>>>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>>>>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>>>>>> Please double-check that, the VMID used to be different on
>>>>>> older SoCs
>>>>> Do you know how to check that?
>>>> The least painful way is probably to add debug prints to what downstream
>>>> calls hyp_assign_phys()
>>> I've found in drivers/soc/qcom/qdsp6v2/msm_audio_ion.c the following vmids:
>>>
>>> VMID_HLOS= 0x3
>>> VMID_CP_ADSP_SHARED33
>> This VMID looks correct.
>>
>> Just had a look at the downstream fastrpc driver code in the same tree.
>> The fastrpc node in DT[1] is adding a "qcom,fastrpc-vmid-heap-shared"
>> property. For this property, the VMID is getting set as
>> "VMID_CP_ADSP_SHARED" in the downstream fastrpc driver[2]. The
>> hyp_assign is happening during daemon attach call[3] with srcVM being
>> "VMID_HLOS".
>>
>> Thanks Konrad for highlighting this difference in VMID.
>>
>> [1]
>> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1699
>> [2]
>> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602
>> [3]
>> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L1999
> Didn't find the "VMID_CP_ADSP_SHARED 0x33" in the upstream bindings. Does it need to be added to the bindings?

Please do

Konrad
