Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F234388393
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503230; cv=none; b=Gn4AQaIZOq9XHwSmxX+w72TOdrj+iPGeu9+faJs4nQHSeAh1JTNJswKi2UKmRZ30hfiJ1nZK06+RghvNEftzn6DuBe61gcr07tHSkCeSdCWxh2lHFz0Tm/lY02cTJuMDr/tynJjrWdw8/SbnvD4a/S6Mxn/V/9ibds1s1CY6BxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503230; c=relaxed/simple;
	bh=nGxWKW29W2AOH9Ky6bfSCGDBZeSZKncm4gB/k0IFftY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYGxIikaADVA0g60WBM3ETiRdYQRmoN63iK9Mv15LXN/CMxIwPN5w8QxRQP1sYimN6jhiHCwyoI+LK3QnXGatHGsYa1aVjMbqMTtq5A0JviSz7YmcpRwW2yRxYV2MyhuHREuv3SK1pPfavMprvskRzfkJjMReICoyv8y5QIn5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwdzT6wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeKLWUNd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwdzT6wV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeKLWUNd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1j4M73244107
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=; b=NwdzT6wVhr8wqnW0
	iWoYkRcefGrrbfVMcfmgzXTZSv9XLheXZRPxHPa5sT9qQFnDOSYBX1ZKQex8AQhx
	rbrlQjzHP5IOFZkQJUEo4oCwFukGnF1/3DzikNBBwrws7cJQLsZYTm0jrRoTPVEp
	75sevAWXOgQl9vp24ggILJG0SbD5pGuHaSF/UlUoQwA4zkYEGYZ/YGHyL56ZEhpW
	LPGpvJtC4tM5p7Ox4cUie3HGFjFH+OpQ67INlJ3EQoesU8JfIRwo/DKfioFvswHf
	REGW7DigduKYpuiHfEvMRQHeBM0u03S+7YiEL3dptVB3kklI+OxhnNxheqVwKIVO
	vkCTog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gwtrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:00:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177f07ea82so63191531cf.3
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781503227; x=1782108027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=;
        b=KeKLWUNduZscqlq9G87aQD1O4v8Uu0kveEJ3XiBr5FQVlBjOcvNqCyllSkuwkntNKU
         DW+EtgFjX65kgWskKOEsj6Di8EhnWd8JFVf39kqx2RTXtG9i2ERnpFjDsA7DyclTamva
         endkx1vUsqY1L6apOoj6T4WUL1uPg+KX9+GTwxBU1b8QCKLu4Ju4lqpdLcprU/9ZCnvX
         XSmH8vgzJlK2Blmz0KgltCEda8juzhIvn33U/nLhWu4dL8tQ9K98lQTNUMZ+vuhsne2+
         oBXqbzZB/07evPKfxTLmTdEwzE4RepgkuW7fnlhus/L2y9H9l8Fztoej0Aiut0DYcTpT
         hk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781503227; x=1782108027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vJFgXBfX8hCngXnHeKMpasfyiLgstCWDgdNuIMGu2Y=;
        b=XFvS2vJ24bcxQebottvvh6NyfOm6OBonLgr8lCSXfrsOjQsIxS49wssCAdRo59TtuW
         WzmHkZA/tJ+P+OelFNcTfOuA9CT0KnL+vbleGjXE+IAD/4ZNVznOjf5/14smuBxpdu7Z
         PFmG5QvjTX+5SO304YjQmTbV0Eh6R8ZCUZIMAf24uDpxD9lpdvt3LpOiQcGNSDJ+uGiR
         uSf4BTS3VVnI6IbLWSjm5dz4waN99C9mrwFovYV0ZXnIzx6I4t+o6KjhzhijFfPEsh2b
         6i09aC4S0+aHFn/UYrPBPjt4EhzE4NTW4mAOSHKHdVxzJfVOjIb4xneZGyDtPQeoXoyH
         2pTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Sl6OJFLKs7q0k4m1FU8DIbSBeNUtq+z5bcYy2VMV+TcauhZMgP/ezWERgYnStbHn2vJRKmt7tDXNu@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBB3MvAp30fBUVHI19N39PAbtkX/riIteUyO/7d8QjoRmzFwB
	f7XBSQgAliQYLvj0nj8H+hbYwlouhj4WlQCvICjR0Zd/LqwZnVYPbtkuSrMCwOoa+/e19KosxCI
	cEtTdRxZdIFHQmZWN9jKX8Urjj+AgCsUPY8ON49Cz48yfyUY3+7RMp0DphBtufml+
X-Gm-Gg: Acq92OFrMKR/pyz1BvoM5RZeGmz3bYT5Tj2k+YNv8/OtgrT3xr2YhnQH9La+hyo3sb+
	gSgPWvWJwzWS2ZujiWqTvOm47MroTyWvHfCbpzLmP+vjX5ZT/fOFhObHPRjFaq7QuXZN5TzuRlI
	ZJO8B63F1KTpVrU9sFSIXj99Z7UID9iRfb+ahjR6Z8OyptRFnv5Od7NXI/2O0c86OIKkJ7RO4KJ
	irymK1g33fbysIGcSx0xMdtxKQN2x5E7Sg3phcqSPAa6XQezu5YW+tiCo9IHhzSGM74VLyFLU2g
	IVVMZLT9gPCOANpgCIXa79erNIQ4DnhyPiSKO3BP+nFpP5wJ2HHJ5b/oYQ8trg+YS406ttO1RbP
	DgWGNiK7FkU92QtVYbHlnJjIKDm8b3HQzIu1siFqtfoO62Rf+Sem8DyAz
X-Received: by 2002:a05:620a:6312:10b0:8ef:1157:6a05 with SMTP id af79cd13be357-9161bc5a818mr1340012685a.19.1781503227071;
        Sun, 14 Jun 2026 23:00:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6312:10b0:8ef:1157:6a05 with SMTP id af79cd13be357-9161bc5a818mr1339993585a.19.1781503225780;
        Sun, 14 Jun 2026 23:00:25 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693794aec29sm2731556a12.28.2026.06.14.23.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:00:23 -0700 (PDT)
Message-ID: <21bd4a12-01de-4c4c-a094-a39c330a4b1b@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:30:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
 <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <q3sr74ncqnmzsjrd6jdbkpplxpnsnifhnvxsdplvogr2kf25p3@taadnzd2qrcu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfX9VRJnf5BWaec
 gNGhQAfs916gBgr2Z4gndJFzf6bT0E0da67rTOpCwvdR+pHhfIApZmASpLlGbav7Qudk9VyiAIC
 n/XFUZ7SmUwK5qNRX5CdJbEtv5h9YRY=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2f94fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=1BxbLvcILuCGMxPr/bnfdA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Qmn5Ufgt5HZSozbDxzMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1OSBTYWx0ZWRfX4PiN51Zfx87W
 Sjh4/q1kznnSG1lRXAcqK1pm2lU5qn6DLF3qGfh3Y5HEnWealwBpktqrsTI9n+HbrQMpFEXcyP4
 8G/9r6w+bxFej5LtIgt7VqwNWp+AQpzB27aXyoQFa90Cv1tvtsCCAd7gcpAtMaUF+rJhSwuMxHC
 JBX80HGMwI4wjBDdMm3+KqjOWoHJfQZIijmoodt9xIOz5KogiC9HDUalHeNXyqeVCxLCCcxSsv9
 X//wUijH7TXxhOAM/k8RfbxA+OZd2plYrSNs+DG8iKsqngj4WeXtXLWMEGK9FyPZowWqXhczJUW
 hE8mQKRb0x0xNu0lztFIRDq/UraRRiZbhRvNaQA6RIadHkkopxF9Mqp9MACBYvDeaPxle1Q5USK
 yXn2FIJNQisWksZo91a+yUqzWFMg/+6ANUOobIgXeS5D5uTmWI6QoBcDMjvrGOhxjJ6DK+pi7Rp
 Ut32iO5AgyDBPSfHL3Q==
X-Proofpoint-GUID: xzJ2J0B8sXKOq-AUfCuhwAw1o6Cz1fq0
X-Proofpoint-ORIG-GUID: xzJ2J0B8sXKOq-AUfCuhwAw1o6Cz1fq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150059


On 6/12/2026 1:19 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 01:20:59PM +0530, Vikash Garodia wrote:
>>
>> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
>>> On 09/06/2026 17:15, Vikash Garodia wrote:
>>>> Document the iris video accelerator used on shikra platforms by adding
>>>> the qcom,shikra-iris compatible.
>>>>
>>>> Although QCM2290 and shikra share the same video hardware and overall
>>>> integration, their SMMU programming differs. QCM2290 exposes separate
>>>> stream IDs for the video hardware and the Xtensa path, requiring two
>>>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>>>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>>>> and Xtensa isolation requirements, such SMR masking is not applicable on
>>>> QCM2290 platforms.
>>>> Since shikra uses the same video hardware as QCM2290 and shares the same
>>>> programming model and capabilities, it is added as a fallback compatible
>>>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>>>> two IOMMU entries.
>>>>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/media/qcom,qcm2290-venus.yaml           | 20
>>>> ++++++++++ ++++++----
>>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>>> venus.yaml
>>>> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df
>>>> 100644
>>>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>> @@ -15,12 +15,27 @@ description:
>>>>
>>>>    allOf:
>>>>      - $ref: qcom,venus-common.yaml#
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: qcom,shikra-iris
>>>
>>> Should this be "iris" in a venus yaml ?
>>
>> given the vpu core was first enabled on venus and now it same core on a
>> different SOC being enabled on iris. There are 2 ways to do this
>> 1. Add the compat to existing schema which defines the binding for that core
>> i.e existing patch
>> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml, but
>> again, the shikra compat would fallback to "qcom,qcm2290-venus" compat.
>> hence even iris yaml would then need to carry the venus *string*.
>>
>> I followed the first option.
> 
> It is a correct approach. However the block should not be called Iris.
> If I remember correctly, the core is still named Venus.
> 

Indeed. I was wrong in associating this with the driver enabling it, but 
it is much better to tag them to the core. Will keep it as 
qcom,shikra-venus.

Regards,
Vikash
