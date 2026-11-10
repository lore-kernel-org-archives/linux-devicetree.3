Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293021;
	b=pMA02LHAeFngKnwM5sRgl1T82oJYWJdWIOtniyv0ppE9Cd1P9YIjHpMLIh9KrfFwz6/N
	 CBzxMKb0E9gEND5xotDuY0xgCWeyxHeKBw+6TtPH7QkDEcRk9iOR8TBP9cDvxK+OCvAzU
	 HovkkWO5nowCBbZS1AS8P0loJx28Yiv0fk5y2oHBoeTeOJkTdlPdUSrUOKwylcTIdLJdO
	 kzwClrZioTtRtJ1ZoiKUIVdM7MxFkEon8PmVNYbA272XtsMkmhf1ScB67un4DuCa23rWy
	 +PgYihjaIRSgl152OMNy3AoZjHz8V77m1LuqrRZJVZN4u2k114SR/PxC7asRLcFZkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=;
	b=lpJvMO++LRKjIA2yw5ZjmbtOLEvSj7jRQ4Fb6WivFoGT6lncddkc/GbNB0f+zRXnhpol
	 YHd+8wL3494smdoi4CP6UJ2cqM6bmJf88rkLq1ZMbG5SJM7IKzpyTLaBLXnMpAE7k4T3S
	 HqlJzOpNUnr4WWaEfdfSLrWFPlN6kbnXojVTos8LuPUswnsKOQNacwIt2L7/9UV7fjDmN
	 Zj03RwyMozIIWQ2bXGw3/ellD+Ai73dI/ogNkXbkyWB/moCFvp58PlWcmXWcHNkBGmDyP
	 tq4Lj4osH0MruP+XAzhG96jeDEpZVkfJ4InGYQRmr7FqiawpMpBHkhO9PEUME6XblPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZ8JyNG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIOL1VyJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3268606B1C1
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 06:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3268606B1C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZ8JyNG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CIOL1VyJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ATXA2920120
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 06:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=; b=lZ8JyNG1vBZwwYua
	aFo0km1sUjWyZwlpQP4jwiT3BHLTIZ3B8JnbqY6SSu6S+6tDzG7gVdxtapOnLmpt
	AZBuZNVElPunatHbcdr+SAOJsz+cwkmlpLRViq9tXg8ayjRs6tfKkpa2VtJpy8My
	/mgbyMr+fURqbjaVTbHha6UNvj5CqjCOcCvd5zjwzKNQIcGDtIS5UoC4kppiWwzb
	D4Zgtzju/+LMCpapFfMBmkAQFMoii8Qq7aWUwrZEyrQ2lIzkDQFWkKXMAeRf0QZL
	m2HB0GNXlwjyyh8URISRDQG6dltBouocMOIg37JNC05av6mbJYC+uODkTqn1hRXT
	sB0G3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg24xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 06:43:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1728135eec.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 22:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794293019; x=1794897819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=;
        b=CIOL1VyJmFqtBfC47M7TH5Bwo1DnOEDl/bUEq2MKd982M2XWVSupp/qyZd/HZkmeQe
         scgGHJuXqChR8lIVe6Oya229go5IN2fpWBl6Z7lHtz6Wgl+Bx6nl92Eiew9ma0pZSOSB
         7fov6zKRAlDPs7vfYOp2HY+/FRRpUciBnssfaa49cUVdh57+0tp+uVFq+DSEuphZvr5X
         mm+htzuZtrTia3wM3mwMlRC2CDZpEXookiBlMPucpE3MP/cw/TUyfJdIj180Q2XRxpO1
         zqqH4ZJNG1c+kR3ABTjNBTskS9Z9JBoVT196ouruckrW77IVOxqbBUcPd0VnbQD79nI/
         0pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293019; x=1794897819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+aF2tyKoI75LNYryEDqpv3NapaynPVLnIbDr/MktCQ=;
        b=Fq65FPzR+PmEPQ3gaf6aF1jB78USvhrMYwBnV+VyrCiDpfj9L6ptE+o/WAnfZdnJXO
         DkeiJ9jKIoFRoe5wMWbSvZRokgU5T0sEtb32nR9K4SSI6CcHtSmQqqcXxv5EhCz2lB/X
         CcnLFAZPkK3hegVg5YB1KVYTZlX1PISPrrrWClkqRBHpju+CTy+HbAird+Vxg6Y8lgiE
         zX18VFANvHsOPSMun59lFTOWVgIKteZooabtFOinc5xFJr6c5doH0r3IcuQGZ13yq0cP
         invblb2ptXHEo57gNnZT/nt6sk1sHvjwN5lOlca0MhSy7Ayy7hw8viUzCc0e4uqc7R71
         aaiw==
X-Gm-Message-State: APuU4Z99XyEjMtE9D4Tvf2y8jcmNxwB4RiyFJuXFcJCIEO2mA351ydOR
	TdyRKpC5QwLNOX5WbFQ6/MqvMRTly423ksc6RKNmIGWTD0DZIR7FrKdWjUzdeCBGMrO+IUzlhJB
	J9BEJNQ0AShnFtSAE0aY/zFnKD0oZJysRwUyEl9jkaIzJrTFlnZBGCBneIDyd86co
X-Gm-Gg: AYBFou0rK+pBhU+6djH4YRg/cpViM/1zH/aBOMQuDQLEykyFN/1nXYnxNgCM5ZUqUYm
	SDo62rFEHMFMs/EV3OnC7cHcWAU/0wipF/2LkO0pzs6y5zxViMReV4jqh2jU3LuRdo1c19L4nsR
	bo098kPjEmnN5cLAWgwNR0CXCBdmYyoAAKpLW9Kq7paOlmTu3hXLef+EZJvAO31dY/JoZzXDvns
	AYBxWK0p+Mk0/Ommlmi0VARxXgaR3eCZAQVutt3BbMx9IetJWDuRBVkuilRo58wUk6nHFIYYOVT
	ZVTLNXtJpXdUEIFepyjLdsptWkn80aGD5ykXTsaib1r7QPZMOxoKdQXKOA3eu5o900vsqjt8HQY
	iyfL9NMuQO4BxpvsYuQdVd8AqUoh9V85bqs82V4QsAPoHWJsli5nza7bzLECQd7XPYOSait6+fn
	N8
X-Received: by 2002:a05:7301:5081:b0:36d:d0f2:7c83 with SMTP id 5a478bee46e88-3751fc35fa5mr2336491eec.32.1794293018657;
        Mon, 09 Nov 2026 22:43:38 -0800 (PST)
X-Received: by 2002:a05:7301:5081:b0:36d:d0f2:7c83 with SMTP id 5a478bee46e88-3751fc35fa5mr2336466eec.32.1794293018083;
        Mon, 09 Nov 2026 22:43:38 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm4267706eec.5.2026.11.09.22.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:43:37 -0800 (PST)
Message-ID: <a7a66343-6bea-42a9-a288-44978bfe865d@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:13:34 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
 <sashiko-outbox-197408@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-197408@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX2yK6Me5UeHXt
 /Spns4rrKuHVIYaf4VnLTxc5vQCMlknuIXa+jp22/puPxWZ3Ej+4T/r8oDww+2AyKOkb42bLbzQ
 z0IxlqVJjitHg6DCTBl3R2Igq86A9swKhOMJYm7wksSnRRmeLXmQ1PO+NGPAAH6bteES5lLLho5
 DLBAoYVKnnYRl4YaIkedWY4By+jNbx5Zl6KjOqSesbNJtODPs5kxtmBQH6MLAzvqP3MA+3Dw43T
 oh070Ehh/QFp54thxcJ4n+J070hyvNq6f6qu9Pd7oBVLRlXw1ld4KgfyZqAEaVlLGso11o8fssL
 3DVLveTEDE5vohDACfBrR0zYyre4Kx0BvJn+Hpzj9rj2XTGV7L98ui728fiKeFwLUCRuEDYzj0l
 rjr1YCpWU2z3bmJbC20RHwLq8RBIJiksz5EyG5kN8MMtyaM9zcdjwcsmXCrXJxtIqRvA+ZzwBt+
 QUqVozpGCLrmMrtYmyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX1aJeuT0ew5G/
 3C1nRZBtFTH0F25hmzwesg9nkYxfhckFaJ7/+RYQRxjZkDTvMnA82ykfSHIVp2FaPvkZ0lzyJsg
 L49gAteeh+wvpjZotJNjky1R0LMC8Kk=
X-Proofpoint-GUID: PYgi_gy1z1zNZTFvYH1QVXCYA2gS4397
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2bd1b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L3DyAVMOO9YV_QvAdvQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: PYgi_gy1z1zNZTFvYH1QVXCYA2gS4397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100026

On 11/4/2026 7:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: remoteproc: shikra-pas: iommus applied to mpss-pas in allOf
> --
>
> commit 53aa8f92faa854bf45005817e5eaa528a79c90a8
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>
> This commit adds iommus property constraints to the Shikra PAS remoteproc
> binding schema for booting at EL2 without a hypervisor.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> index 34a2f15e93616..8c8a7616d4787 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> @@ -112,6 +112,8 @@ allOf:
>>             maxItems: 1
>>           firmware-name:
>>             maxItems: 1
>> +        iommus:
>> +          maxItems: 1
>>           power-domains:
>>             items:
>>               - description: CX power domain
>> @@ -134,6 +136,9 @@ allOf:
>>             minItems: 2
>>           firmware-name:
>>             minItems: 2
>> +        iommus:
>> +          minItems: 3
>> +          maxItems: 3
> [Severity: Medium]
> The commit message states that iommus constraints are added for
> qcom,shikra-cdsp-pas and qcom,shikra-lpaicp-pas. However, in the allOf
> section of Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml,
> the first conditional block matches both qcom,shikra-cdsp-pas and
> qcom,shikra-mpss-pas:
>
>    - if:
>        properties:
>          compatible:
>            enum:
>              - qcom,shikra-cdsp-pas
>              - qcom,shikra-mpss-pas
>      then:
>        properties:
>          ...
>          iommus:
>            maxItems: 1
>
> Does placing iommus in this shared conditional block unintentionally allow
> iommus on qcom,shikra-mpss-pas?
>
> Also, since commit 95697c560209 ("dt-bindings: remoteproc: qcom,pas-common:
> Drop iommus") removed iommus from qcom,pas-common.yaml, iommus is no longer
> declared in top-level properties. Should iommus be defined with its broadest
> constraints (minItems: 1, maxItems: 3) in the top-level properties block and
> then constrained per compatible in allOf (with maxItems: 1 for
> qcom,shikra-cdsp-pas, minItems: 3 for qcom,shikra-lpaicp-pas, and
> iommus: false for qcom,shikra-mpss-pas)?

Right, the shared block shouldn't carry iommus. I will move it into a 
separate conditional for qcom,shikra-cdsp-pas only.
iommus is not applicable to qcom,shikra-mpss-pas, so I'd prefer not to 
declare it at top level. I will keep iommus only in per-compatible 
blocks: maxItems: 1 for cdsp and 3 entries for lpaicp.

Thanks
Komal

