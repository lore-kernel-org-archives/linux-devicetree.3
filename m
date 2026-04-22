Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732092F6565
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853495; cv=none; b=iMZwJW2FQV52XVPczDFZ+Wdm2sZNANe147SY7YkcJxbtDzLsFYoWkQVxJh51p/CzaYUKB9g/doAZ7CVvHVuTqRLGYagh6ppw0knxHwmb0uAFn6WHEj+wf/ujqzSnX0XlPm6JrgfIglUaAxyWo2SS7R3v/kYTQcmp7A8mZGrX35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853495; c=relaxed/simple;
	bh=lF2SLdGVoo4gj7oWwkhvxlJk5+bPlhQ1nbeEsOnnIBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMQOxAlFg1oqO5jUJITaslYw+Fk/72rsYoh6lafI4fEwtxTPVK2JaDN1Y27sui6ehkzQ4vzIQy34urc20xK/sM8DNAy6hYO9h2Cu2Ipj4eDag8f4m2MDj/0m7uPY+0KkCo/jsTk/KyswZFQRpkLjbusgqfNvBCuTxSKVsvqqpEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1vWuR1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/rxDQVJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1vWuR1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/rxDQVJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5dtaa2123589
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brbAVWEeeGvsrtkIZUZZywKmr80O+w4KSxCqy3rDJKo=; b=V1vWuR1nPv9QWCwY
	iviDvTDBBekJS0KXJS4Wqtc3LAgCP6EZNVY6PaIhLd/chxXqU3t0F9zdUsMOicsd
	TOwgG8n2MWQ3/2m7+6QvpIfMtIDfpP+YmI8ZmZoshkktD/dWXBYj8vfSSBpit8ag
	xtXcXFImEoCGeTYt1re6SeaDQYbFY0mw5nSPctXNWFVpCAgYbqfXU9wvyH+8JKbW
	g/t4bINZfUHzbc/qanMVOdKI5oHO9/1fA7tfyuNfnv/llZ/NQG6gxumKu64Wsfvu
	JMkbootJgQsK5fbaaGpytPduuLkqFI8G6x9Tsm4e4KIBAZIrWQmH8jvjXnzJIeLs
	N/H/1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftxhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:24:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb04e1b499so39231985a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853492; x=1777458292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brbAVWEeeGvsrtkIZUZZywKmr80O+w4KSxCqy3rDJKo=;
        b=I/rxDQVJJlCyfG6Kg19ZeGjoriPvLaqbd+9lDBSlnT38g/K7KNxLuIjcGVhAp8YMIB
         LfEabBxhOtCjbpzhu3w4+3I9vMprT5zajiiqfhIZKh7+nZcgGjTISJZYvboKDHlaVfKv
         w5AOXF3zLKY+B7WBNXD0a33nXS9KcfEZXfYFnSpmKAIIWVKN09v2u9n3GEM97HeVmZ/P
         C1gRKB8OrMqsp27IwMIefGoww38dxvbivNwEzBlU9mH3wP3SZilSAH4C2yRHje56izml
         wLi7k3oPH/6MdlFIqrB93h4Bk+Hq4OfBRSOSe27RP65H8UK3VEll0yJzGPRefBljCJDn
         TwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853492; x=1777458292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brbAVWEeeGvsrtkIZUZZywKmr80O+w4KSxCqy3rDJKo=;
        b=O6JfM8WkU6LbxBjBu3KBuMqFQTeUsQRF826JH2OZmpOYx6cOIGirtuhY9uOYTRLxKx
         XM6ZrB8J/enPNUEpq26wF0KrHAmfUeJiQlAArUy9rkx9Um0Zc7hsvm8NkP2iA66csxLG
         T7fv4Wxtx33KoF66bs+fPQX0qgZ6Dp+PJdoyvKVB2TEHz6Kz6H20Tu5yDbNylSpRN2IC
         m+8SKlzQlMdb/3E5bZMhI0AAs+5jzHUFWkXVi4boyKzSer5qaTMhFjB8PwUN3cGf2m+9
         +ffNklMjlkN1H6jBqqqNOzQs0H3xr/C+34xfTuOJUyXZql3+2yywXgaGqvDaK56C7RRD
         oR+A==
X-Forwarded-Encrypted: i=1; AFNElJ+4BSCjlAHGtsjsAh6KExaeuZsEoMP8cX9L0Vrmeb48IjS7G76jKB0JLaa8z6F3qExjMW2rFvC03uT+@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlKQirJuADwWlhucdLVGfxIERsZlX45aQVKkP7F4jLx5WMVQq
	bh7bacv+itgr6k70ZP9K1TL3KnaEqkFwAeu+TTwHuze1QFVHLenLmtiA8IChPWAQNq0VcDYbMv0
	pm/0toQhaHo3djQ7hy0s0frJH9/mWqo6e47lRRULB/ho5UBTo73IiDdSkiu/QCu/8
X-Gm-Gg: AeBDies5bg9e7+WVkpfxPnuniBbDNqjwxtG7eDQKYnTibW9D+JspuR10nqEpm+FcLRi
	9bvl7Y6lL9CRDIO/gPF1xrYAQBOvwGZuuLbbVHVfMVubiM6XwdhFKVevN30RY3wHEvltjsVJXc0
	KUhpVEl15veMlGWMbGh29WuD4SD+2Hd3yz3eu/PFnScVdXOL0+iYn1zGWLpytZwgScEPxe5UFQA
	gV7yPu0MUPSD01Pk1gOc4gYmOHeqveixdj/0JRldY+Q3cDTY3u3aHfVOIV08jSKG6edmLiNOr8r
	3S7II3KtgjoBL/aOreG3EGuEc7hVcIvocVEdn8r4ij8kdhXzzs1iVluT4wJlrq0Gbl3LRXjoMPv
	vEwfbPpOkWyIZ8GIN3X11S7B4KOKQ/67ytxTi3Rqk88u3n3xEEltZOMLgH5Ff9c9qMO2tjgO7vU
	QhzxJEqZ5/RweBzg==
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr856596885a.7.1776853491547;
        Wed, 22 Apr 2026 03:24:51 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8edd6ef1bc9mr856595085a.7.1776853491101;
        Wed, 22 Apr 2026 03:24:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5d8f9sm3162610a12.25.2026.04.22.03.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:24:49 -0700 (PDT)
Message-ID: <dbeece49-fe91-43ae-95d1-a855927e2de3@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:24:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        quic_chennak@quicinc.com, quic_bkumar@quicinc.com
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
 <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
 <a32fda72-6bf8-479b-bae3-2e551671945a@mainlining.org>
 <fde2d8f5-e512-4a47-935a-9cccb5ea79f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fde2d8f5-e512-4a47-935a-9cccb5ea79f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8a1f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=J7E-TG7-5iH-1ipYxysA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: NzdJ9dohWyLyoIaUPzGdPbYPb-ljHn2y
X-Proofpoint-GUID: NzdJ9dohWyLyoIaUPzGdPbYPb-ljHn2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5OSBTYWx0ZWRfX2uNOeLX73zX0
 ENpLLZUMXltOirzCotoRjpQtSBWgw7s7AWpXrbbMoqm/hmOB64Tkxf5u/oZoZCFIuMlwpBmBa7r
 9PoUS7PMs9eQeznvrAzFRVaWyccMBlpEOs8ORt10t1hUU1xsOALod+IAIB6i21wzGxO2mjs9N5A
 jk8kSeLrB1lSMsZSE8p89TJTDRzhqGGzvObomMHTwN4LZBxss8aN3hURnkOnGQjZ2DD/6IqL/Ef
 K3DyfL2SNJFcWAKSQ5Q9aKAAZQVhgMULRI+QJr33yS/nVxxyfvv7rQ4O1PXO5g2hbLkhr8YAZZ1
 mWQvcEMtkvJn9cbYM7p1EY8TILVU/tGmunxaea4EGd9WL0oR7OYhApcRJihdVf49g4EYpPm2EWm
 NtvWvMRsPIl2DCzrewgBaohM+tDRK2VdGj12Yn4W/53wEr0UwERauEmBsYl0oc69Df/AcPDgQus
 YAcTn3uMqeEKEfqB3aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220099

On 4/22/26 11:38 AM, Ekansh Gupta wrote:
> On 21-04-2026 14:02, Nickolay Goppen wrote:
>>
>> 21.04.2026 11:29, Ekansh Gupta wrote:
>>> On 17-04-2026 20:45, Ekansh Gupta wrote:
>>>> On 15-04-2026 15:22, Konrad Dybcio wrote:
>>>>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>>>>> Downstream [1] this region is marked as shared and reusable so
>>>>>> describe it that way.
>>>>>>
>>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>>>>
>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>> ---
>>>>> +Ekansh some insight, please?
>>>>>
>>>>> We're giving away that memory via qcom_scm_assign_mem() anyway
>>>>> and I would assume that making it not-"no-map" could introduce issues
>>>>> when the OS tries to access that region
>>>>>
>>>> With the current version and the upcoming planned enhancements, I don't
>>>> see any major benefits of making this as not-"no-map".
>>>>
>>>> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
>>>> entire memory-region to lpass VMIDs. and un-assign it only during
>>>> fastrpc_rpmsg_remove(). There have been implementation in downstream
>>>> where this memory is dumped in case of SSR or audio PDR using minidump,
>>>> so marking it `reusable` might make sense there, but that dump logic is
>>>> not added upstream.
>>>>
>>>> Upon checking the DT, I see a bigger problem here, this memory-region
>>>> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
>>>> Please correct me if I am wrong about this point.
>>>>
>>>> [1]
>>>> https://lore.kernel.org/all/20260409062617.1182-1-
>>>> jianping.li@oss.qualcomm.com/
>>>> [2]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
>>>> tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
>>> Just had a new finding on this. There is one more reason why it is not
>>> added as no-map in downstream. This audio PD carve-out region is not
>>> defined for most of the platform's memory-map.
>>>
>>> With a change to qcom_scm the memory during boot-up, issue was observed
>>> on RB3Gen2[1], where EFI firmware was loaded in the memory region which
>>> was causing boot-up issues.
>>>
>>> So defining it as no-map might not be correct and it might need be
>>> changed for all DT files.
>> So It needs to be set as not-"no-map"?
> Yes, that's correct, but I think the static address setting should also
> be removed. As it is not present in memory-maps, I don't think assigning
> some static address would be correct in this case.
> 
> Konrad, till now I have checked this for multiple platforms and I see
> carveout defined only for lemans, monaco and hamoa. I believe, for other
> platforms, we should move to `shared-dma-pool` with `alloc-ranges`.

I think so too. The only exception would be if the UEFI had already
allocated a fixed region for that, since the memory could otherwise be
wasted (as it would need(?) to be reserved anyway)

Konrad
