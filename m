Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA2F3E274B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408428; cv=none; b=cak3MKyQAHJui3VYkKeNCvX+FlqRoRm5Pf+NlBBR7WkfP46SClXcJZFW1OxsK+eQss1Ydss17f3S0td8y23PpRvQDt/QG8p/rDMVqBKEmYu+HPQc5P0nx6oQ5gUZqR5n5Uctr9xQsSlO/SesULRrMQfg+Od3aA4OxPwRx8I6J64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408428; c=relaxed/simple;
	bh=g0W1PyzooAtJ3scJ3oC1HLYrSZOEKQZ6lGmXblvMhfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XF5Ja9PxzUiApsdNsmgXQaGVGdavt11GaB4zOl2B08FLvUNqijbulkHy3OuDjEbRAPP1oT186iBA+TqXj5bnbRZ9AGmiAKM8lbbP+WbVsB/ekm477oUTKv4Bv9y2v/WhKdMKvhMSyh4HxgQNQueqSJ3T+D1Sxmomv0SMMcFNE4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCo7FMfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcqhnA8c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCo7FMfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcqhnA8c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CiRFp2688155
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 13:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mb77+VbDY/WZt4TrGoR5MtuoBG8W9yZaYbwMG3StSPI=; b=oCo7FMfKvLe7P1eJ
	Rx9fCO46e8PCGH3r9O3boH+fhY6YKQnWiuB+8eboaHIdSMVt3ZSaoc814+VDTdID
	10D37B5+yJT9HdjaFGABToADZQaZdXMFJvvAUsAGpv8chaKTB9OcG1d21fnjkEY0
	rzEwz6oK5ug7AF18VVUhHbDCwkKUcbcgH0fBGskr0GVOW7BrJjf5kShYv0BhOyJl
	HCRv2hNQyTpkp3wP6/3kjmx4YqWlvUd3lj+Vw5fDp1wx2CC42kjnjTEmhnktceJE
	IFCLSGtiJVjiF3yMgDGCvmmF4/Fs6tDS/TUiGUXv6vzIOZrDEYVHsQgxTB3evCj1
	+M70VA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsja9rmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 13:53:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf2bc4371bso28524965ad.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780408426; x=1781013226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mb77+VbDY/WZt4TrGoR5MtuoBG8W9yZaYbwMG3StSPI=;
        b=HcqhnA8cGLsHB06IpptwCiur8LN3oYl18LsXm7nmSci8wbVTlX7BNMSJCy5L7F6EG2
         4QriLWXg5CRwqN+3icSK/vjJropmQ6LeZ1jf8vsHFsyk6e5OE5pwD0j75mlBsy+sttSt
         fmW+BFeMTtCARiNsKUfL3RVsKct9AViVWB1g0xfnH/FiPfH/OB6pR7fA2dFUH/YFj0CY
         AhvQ6tb1hFdldHHqkJ6qA62Sbm0zpSAspaMUvTiiawWF4s0wLIiM8AEHm7EMsvbLSQS7
         rpV33g2cCnaeYTf1NuXmaykhk0RD/wNKNUlFrI9qWF4V+adLrTYE36Co8sl/leCAt0o8
         UCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780408426; x=1781013226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb77+VbDY/WZt4TrGoR5MtuoBG8W9yZaYbwMG3StSPI=;
        b=RYBT2CXCu4cFEHBOMvUJVUVX9Mxso17Bh7krnKdf/ZthrigktePA/Oyi8aHGl/oaoY
         gCULdMSCGG0oKUOWH2rA2w72iWKDGJhbgefYYuY896XqxeI6WNnY3q6WFnAVxi2oX6wV
         yQOEXPnac0cfF3hp6SGDgd4vmFgv2Bz+Nb9v1idYLHlCf/Q0XYo0uXYZe4gQk3OPnAeN
         DiUJ30Q6POLOz87unSZKo6AseZjmPcAQg6gZ6AQwfMt9A4f4o4ydv7FLddGeh2wrQWoG
         P5NfEvqwHDpMC86jZXBGqRK7DyzPiTQcdfmoQCudlGh6dW4cCbiJ/uZM9g9C2N6P5Ncq
         4kdg==
X-Forwarded-Encrypted: i=1; AFNElJ+Gr6l9bCmxWqagdz58qMyZsxclmHuk5Vyw5KDUHdN14KXh7j3PMH98w3l0F4n3fa1lbXN9xJiPCUzs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9gy9SkskxhWYmtdRzkyTcEx5Ni3bTtEUuCY+BNCw2IDCk48Kb
	vivN3Y3KV2Fanwni0mwPOEHrDYGlcpYMifod6ti9nRl/5m9OIetemcnZOsuIm+TeiQtRBZBgSC/
	a6g/LGr9TsRBT4Q4mtVAdYT/eVkYDmlY7xJ0RT3txiSuzlOFJ5OQf0Ni3CFbh9NLK
X-Gm-Gg: Acq92OGrahq+uJJZUwAP9ntLpdJUm6JF+/7oP/4trqbTwgUcoZBTud4nbd86LKBE1Sm
	PhirwO9q+TB7M5nRasdPEttyQRkqAHPEyT5M+/dPxlbC2wcY63hWoDhBkK/gWVQJMELmnMZobAJ
	BjX4li6KNqTDyJyVYTRrqhSiz2hpDVPMCb/Px1M7X5tBncRk+8NH9VNDFF7d4Oohr7UU/TO1At5
	7v8ooR2eu2Qgye8b8W9LN9bi9IaBMngPJLEGUFFgNS7MdivvdJk7jp5V/EbDoUACNVVmSF2uQk8
	DaxbF1riKmlFuK2WqNkOJYFOiT6XfjONtGqTtxlPs5nFRwzxqctWktskK345G7jYqL2dYje4Vcd
	JyPN61LyKxdtoCfirukPlXBJkRu13joWPZOT0aNJiM81DORn0C0qlTswPy0fsCB/Hs+6gsbBJhd
	lipDbUaRFwscR/xPXGSey59PdlaJAK30Al
X-Received: by 2002:a17:903:4b4f:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c10ccbc173mr33528905ad.14.1780408425512;
        Tue, 02 Jun 2026 06:53:45 -0700 (PDT)
X-Received: by 2002:a17:903:4b4f:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c10ccbc173mr33528655ad.14.1780408424988;
        Tue, 02 Jun 2026 06:53:44 -0700 (PDT)
Received: from ?IPV6:2405:201:c416:5052:81a2:4375:a071:12a2? ([2405:201:c416:5052:81a2:4375:a071:12a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0751asm143976745ad.55.2026.06.02.06.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 06:53:44 -0700 (PDT)
Message-ID: <4bf2e9eb-f015-48fa-bef2-ba1a58413e3f@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 19:23:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom,shikra-epss-l3: Add
 EPSS L3 DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-1-b1528a436134@oss.qualcomm.com>
 <20260530-victorious-resourceful-muskox-cdeadb@quoll>
 <afeab8fd-6951-46a3-8b92-9c3b7075949e@oss.qualcomm.com>
 <709428ff-e732-47b6-a6db-b26cd9149c98@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <709428ff-e732-47b6-a6db-b26cd9149c98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEzMyBTYWx0ZWRfX52iJBxrgVdxm
 jkbIMfqpphM16GZwvLxkb//W7i+7m/u395IFwjRI6E+xWUZ+XzRWlx68bsvLGCkSs7jgxRAul0q
 YuGS8IOqRpuTdTtozeQgj9qhaYpM7CaGTXLHOUnwNSmR2pIcLjKER4yHUa5rBeFUQr2j8L0Kv/c
 Qvz7/ATcj+0NgdpTozXp//Q83QthQX9aI+U14C/OGMvtYjwgcQKlzWi77Jlt11QsIQuCMvPC12b
 XnhPgvJJG7TTiPC6UKse57IQbaKvPvUdwmoAz+A5XpN9nyHSZI8QjmVlE9T66IncFpSECuXkpxA
 sHMspBcqsO7AGczU9a2p+ktAG80YcsST4fsIOthTWl7YLZ2zQVP4/N12aayZ4nuc61AKfZlEOTt
 EAqYctCARvZhK5JdWhZtLk9BLn0ERD+TjwypRNfMw8JGYkU80EilPzgeNJ0yBXGmOJg/ixchBpF
 3FdTIzVNh8nlIZc+l4A==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1ee06a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=FhBE5UMFHDhWvMFztzwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: d1HxZzyjMFEokTdC45XnKQFYoLHUV1Ux
X-Proofpoint-ORIG-GUID: d1HxZzyjMFEokTdC45XnKQFYoLHUV1Ux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020133



On 6/2/2026 5:29 PM, Krzysztof Kozlowski wrote:
> On 02/06/2026 11:27, Raviteja Laggyshetty wrote:
>>
>>
>> On 5/30/2026 4:38 PM, Krzysztof Kozlowski wrote:
>>> On Sun, May 24, 2026 at 06:03:35PM +0000, Raviteja Laggyshetty wrote:
>>>> +  '#interconnect-cells':
>>>> +    const: 1
>>>> +
>>>
>>> I do not see any differences against OSM L3 binding. Why isn't this
>>> device there?
>>>
>>
>> The EPSS L3 on Shikra is similar to EPSS/OSM L3 on other Qualcomm SoCs,
>> but supports only twelve LUT entries. Due to this hardware difference,
>> the generic compatibles are not applicable, so a new SoC specific
>> binding is introduced.
>>
> 
> This I understood, but the binding would be exactly the same, no? Kind
> of repeating the question....
> 
Yes, Though the hardware is slightly different, it can be still described 
using the existing qcom,osm-l3.yaml binding and can be added as OneOf the 
compatible enum in the properties.

Just to differentiate the hardware difference with existing L3, separate 
SoC specific binding is added.


> Best regards,
> Krzysztof

