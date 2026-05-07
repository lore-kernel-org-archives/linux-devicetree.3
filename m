Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890AA3E867D
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150851; cv=none; b=Mwk6pFwx7lt8GWRvCS4nIlnLOd2flfwVC6v2TsSNDQjE54Hkj3GMjd0eCNmM0E2/h+Hh6ZEeKfGIlRo0Z+zfYuoofGBe3JZuHevtidDsukfpRXpOmOEbF3/DizAtEU/NUYY6lYFKrqIeHJM7gk9y16+ThPJeTiEZmd38FFoc55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150851; c=relaxed/simple;
	bh=UEwxbaJ0zSifgO5b7IyAjoQTTJ2yzB7dL0KnR+F5muE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBitH4R6/zVxZKKHK/xv4jPGNzzUMezGG/Weh5dBlEx3e9gpKyGMjN2PPWpuXhgkCZoROCsy4uOum5xcNx34Bdj8J/fe1NQ867E+j2qrV8jtcVBx2dqSTyWp+Psy6ZWXHc7Fj0viMULfmlqC6IH27kBsOS1vgpJp5E+BWTfVxxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCalwYxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUFDKVVX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCalwYxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUFDKVVX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pUfW1424462
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 10:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeymGbIOXptDj2kQO0H5D+kU5N1M07bvil6DNVwrBzQ=; b=oCalwYxG6Bo1tnqk
	Bs7GSL+a0H9tZ9jBiEZUc/3N/jqXOhm3uqdDnUdujHYg1UGxaAEkLAOqs2lUUKk9
	4ePpCg5T1El8KUoTE53NRqq3ecsWHFR7h4M44ZKQUkV4AzNZMLzwGVkS3tmV/Xi6
	rH/5MmguzaO4jufNunsqM4UboAtSjd7yr1tC9r9+6RxJ2elQbjTkdBjF0v0eX4iv
	ihyzVAEiznoxT+6gA1mOLSvPuZWo6EOfKuLLT7l7UbpgnIehlaCzt40hJFO4nGYN
	UOvA/qo+mySEy5+it74x9YGPbakas0hBxnf//g9H5Jl7HOubolppcCc9PpgpZ5UF
	Judzug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfrp15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 10:47:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb98b09d3so1532151cf.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778150849; x=1778755649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QeymGbIOXptDj2kQO0H5D+kU5N1M07bvil6DNVwrBzQ=;
        b=HUFDKVVX3ra6VWE/iYFlKy+OnxWTyEFv2GGxrwSDRqi4unHraBuDBkmojOSqPXsaJN
         j5EEKIO3vpMqrOibOkh7EuZeBcAb+B9oOm0mLNXOLIIxunvQ42KwX8Tdcolm90I+nfUE
         K95Mq3JBKksQJlaqyrutQCyjyhJsRLWzzqMd8cAYGw2UA2L6/WTB0SAebbfim3pDDDUN
         Bb/UVyZFRdePzN8tpyfEP1nFOyO6VuLABt30HHAxjzM+GVjbVsstua9CJJMKgJpg4i4E
         ARxg3Y/Dqrlu4Lql96YsfPVOlEFjFOuuGX+SHDW1wbEbDmUcyfoaVi70jIO5sv1mKjQD
         +QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150849; x=1778755649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeymGbIOXptDj2kQO0H5D+kU5N1M07bvil6DNVwrBzQ=;
        b=rKbsGHzwfL6qT51XF/d1QF2OEPjLWQxRX4xFyldCRG+xrZ8wWYQrrIfm76Hcs5Y9m5
         jXW1b6MU4aWTcpijvAWsBepWULUFDL1FF7z7HIStwqtUoN4aKMMbfF5gQicviRFrFq+q
         mFLJU0/1VkNpMuq2PopQ1/FklzSKqC+zCb0AD5DGr9fmXNvEBADAKH5rJ1AA4J7XVnVj
         CAuwG75Cj88IDL8BzTjn6C2swVdj1quuAmS1c5qwEg8KOn8OWFZVgvBlFTR1y4cenyA4
         bC/0/HjGck8g9oNZLtZcuxkkZYTwI8pQ+C/1XbqtcvnWcUr7KqfqgnW/Eyd5zLPPB4QU
         zHmg==
X-Forwarded-Encrypted: i=1; AFNElJ8oHAEeOS7HvDQxnQdmVlcLEvBujCRtmzlaOKmentqn+mdZGzoJJWDMS7+TvqXfWPrGVpGw7uhHhZyr@vger.kernel.org
X-Gm-Message-State: AOJu0YyUg/SoVsV1qIJUaKcSyNqacEvTbsx/sdQtuZva/rMr8fWOG2o0
	SOFYDfiSbziYh7X4ku9UCzxrH6g/sMIIshvdMabeQeeC+ITMLidN1aYI0nT/qryUie3OVFqwCMl
	2K05Th9teAB+MZOmGcAHloJuE3Yy/qjQqZvBwgQLJKA3haeKgYzAJjAJdniEhOyIM
X-Gm-Gg: AeBDietQztBdA9bj1cub6ET4xesRrQvaxFAVpQGqHA1p2wr5xg0PnTjrrjuTyze9yxT
	ecVrnsnZ1AFBOEkdBGwjcppuaZHYIDsgWN+RVXtORfY7HKtmDqfD8p4GXnRaglBodChbnJfiuzA
	gDdLkxejW8KirBSwMn1ueGzild82ziISbH7Hv6CVfushIUL/34v6wc93HUbr0x/uDcuLKFOysUn
	rO6OTRX4Le5Mq9v5IH5qg0AFbEG1DeEird8xdrSIng0Qq7NN31KE0dyC7kIyF2390b+zcBASiiz
	ooCpirkJJYTKIvKmQ5g8qfr3r9vvYK7liz0SsJcR9KgQySVPsLbbtsQzezYrCda9mV+60E4jSy8
	zLpFg8ZTSFscE7b+u/UVR11RpRlKZPeKGQzAC2m0NJFXPTDKDOicw00bNGEnvs82CnWF7qDn31E
	tpIm733Au4YthW/g==
X-Received: by 2002:ac8:5d53:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51462619094mr74850951cf.2.1778150848703;
        Thu, 07 May 2026 03:47:28 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51462619094mr74850601cf.2.1778150848104;
        Thu, 07 May 2026 03:47:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67d0a616294sm1920493a12.25.2026.05.07.03.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:47:27 -0700 (PDT)
Message-ID: <0e0b9933-f753-4a79-b4ed-dc992733a387@oss.qualcomm.com>
Date: Thu, 7 May 2026 12:47:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
 <20260506-imported-emerald-quoll-fd1ef8@quoll>
 <0028dd41-d039-4ef5-a9f7-deb730a05b0b@oss.qualcomm.com>
 <319fc5ac-1211-4845-9a66-79f1a3026126@kernel.org>
 <486d6b30-8762-4f14-aa19-7c5497cba00f@oss.qualcomm.com>
 <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2920e0bc-3f60-49bf-969c-9c049b080703@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc6dc1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JAKgS-5HGXHXDUih-usA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEwNyBTYWx0ZWRfXx9BclufK/GId
 uPQfRw0iXiTB9zor6BKsDaRaoJrNiN+FkTUtXh02Qxl8nkmAF5ATkCy8zf/JXfxSjk4aANtZv11
 pX3x7DmDKYGPUIYzB1PQu7eAaVB8+soai25m0I2JFN6cCPzDKeWMobCa4V6fgZTCZAig7bxuDvC
 aWN2ZOuT4TfTH4O6iS/XBqFXl1jEgkL2KI+vRpS6947jA5u6ZCdrzGONezF5rv9tBsk6ri+QYIh
 cV+2iEfvOY5HqGwizWJkvfpyyYMeTGyGygCNzeGxjwj8/lDGK+i8Om3/iSNASs0o6CxlQrEZEUF
 XErMqiLCbl0Iby6oFnKRxJwlMWBMrUpr6aljB0PMkTBON/J/RFJfBaBWkMP6qFgpGikntKAf8Vs
 tkcVDHLa9Z4PkYo2XFuN0SLbXz+FiZKcUdLGrNaNEuxd8GbOLifz/WoOa6617fXkxwosXYX0QUe
 tvf7+GO24h6zNWJpkAg==
X-Proofpoint-GUID: LzZGwayjmqYIiBNMJUqkC3x8t4bfeOZn
X-Proofpoint-ORIG-GUID: LzZGwayjmqYIiBNMJUqkC3x8t4bfeOZn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070107

On 5/6/26 2:15 PM, Krzysztof Kozlowski wrote:
> On 06/05/2026 12:47, Konrad Dybcio wrote:
>> On 5/6/26 11:56 AM, Krzysztof Kozlowski wrote:
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        reg:
>>>>>> +          items:
>>>>>> +            - description: LLCC0 base register region
>>>>>> +            - description: LLCC2 base register region
>>>>>
>>>>> LLCC1?
>>>>
>>>> Unfortunately not
>>>
>>> Then let's just skip the names, because it will cause unnecessary
>>> confusion when name is llcc1 (since it is the NEXT entry) but it points
>>> to block called LLCC2 in the manual.
>>
>> I don't think skipping the names is a good idea, especially since if
>> we keep them, we could teach the driver what channel the region actually
>> corresponds to
> 
> You still can do it, because indices are fixed. Names are only helper
> and makes that easier.
> 
> The problem looks to me purely doc-related, because this is logically
> second channel, so LLCC1, just like qcom,sc7280-llcc or
> qcom,sdm670-llcc. Does naming it as third channel (LLCC2) is relevant
> for programming interface? Imagine driver taking LLCCx and using the 'x'
> as offset?
> 
> I tried to find something in HPG but no luck.

On recent platforms, channels 0/2 and 1/3 are paired, perhaps that's
where it comes from

Konrad
