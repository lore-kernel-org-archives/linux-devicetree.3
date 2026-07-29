Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA144C648
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327670; cv=none; b=hIUX4wizf6MAucFOwLikpvVxz4OBCT6vKzSrJxCSRFiThPnvIVIsrxl9ofaJZjT4o2dMA23+3sXnevZlEIO6b1jFWlqWaF3T5dzebyoCWZQJ/n3nnbbbgb1pHzzXSsCOUX+BJg2rrQlFMxWM9+giq9ymRbN0FGDXOoMlL+bpyfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327670; c=relaxed/simple;
	bh=ZtcaL6QuzTdO1mo/regAXILXVX98ZdiaHF6vmeAsTXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3Ck2kqFXbd20l1vLaYhGQJK9aR4fT4jLSYNZBn4x0an3Su3t0yb264rQpJM0LBxWk4wsjGJkiF55haIgo285xynNc+3xcHezj8PVi4fJbhBKrjsTPxezIbiugk/0czV5kdbGsUainitGtmS7RIN64z/RbiaNzZiEX3mp1RV4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGb1DLyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jy6Hj1we; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGb1DLyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jy6Hj1we"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBurFa1981740
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=; b=PGb1DLyqzrUhk4Un
	56irEINRb8qA3XKWJTWoJ4heXrwUxBcc3XZ78rnDiKJHXj1c9Ff5rxih3V7rPku2
	lxKtOdKUJ/ARrHsOoo+7DKW1BtsOWGqjZDLQ3TqChvihdN7P7VxqJpfqjH06LGK9
	N6zCHJt3N4k5EOwMPyKtPKGMvLJyQWWPGbHvCTx8apbaRHyqHRNVtknGxZEfK0f7
	J6Wl2B4qC0azD9QRzR/eiPoYoxARKzlSanLASq9wYx7Tvt/zuRxSHqj1VH9o5LR6
	q5VjUTgo6V4F4PQZx4j9ZWi24kNJK+8JDvh7qisYPheDUhOzf8Yvlzks9GNbB20q
	+Z6rSw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3gg30b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:21:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-977be80568cso4279241.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327665; x=1785932465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=;
        b=jy6Hj1weowSGxNo5Z8KcVvQkP47q/QBcE3tB+oSjIAKWuO0NMAAIj/sg9ivMj4OoTy
         9R6QxqeNZguYyRzo94mwD6afRCQyPxFnrirlfSSuW/eYJeb/O1lrOxHDdIq4Offs1muZ
         MRMi/m5nRriJtGP32Ee3xM02HQr2Ygs58Qtu7OmzqIkuLpHnicae8CYUA/H/olUXNN4H
         EvTnj8L1Dx40x6KiL4rV5HLgxd3x6jzF+pFYPLT+F8hEC1WCMeDAVmvTajtVQ+FOguZP
         drsqc93qp8iUOkQcBYmrDFOD07OTy2KZw34ZAWCBm4a65QRK3rusZGirQX6ZPqFpaRvA
         JhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327665; x=1785932465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeM2xcHhZitweZ+bwJX8AXEasPFrzj/T75so9QyUzag=;
        b=KbktRTxC4VPI8QwXrmqSJEeF1/GN+l04yb+CxRoTPKZBK6Tr1KOFs9V0b+h+MsGB8x
         RsvGEaUtVrC1CSy6EkaaVGGYLPc69ue/fNMmIPksJ0QqoxqYKbfOkUgR/xceruMRbZFA
         p9RBlqdqMW3JuWjNTrKroeif3Xu0I+NuONWrOwIWW6pQn6GIIWPSPInZOGpKXcLXiH2Y
         zj20d/5BrW6ZW/3CN+I4SPdYGORTtKGTWdsNt2HppnbUqQ7jUBMlPmDTj8t0i5PyZ5WH
         gpIFxli5lbzBhLdNef8MS/d1ifzgUwQkHFQCrwDHIEJZE1SXsMjuoYViePpjBI5QaCHy
         pXFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrdrr0Sgekwap3bv1VUgsPlhqGyH5rUKuFhXqqOGfx1wl+9rtTY/wTT2TafHCg+q3soJOTxPjbjo0p/@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSG5kMBwcXxu8DIToRgb747L8lwW11+J2vM+v6curpJsanrtg
	oCzl3AsEFjKKXlYBDEzbrmAcy2e512cVhRRWZDzwKPRoQxKolO+vFGwHb3hRSBr+SDQW6gwM5zk
	tG73n4IkGms6FaE5IwRYT24FtVsUmFRmNt+DDGBoBs99lBLDKL/KX3TU1hNrYmjTgrJOJ9PyA
X-Gm-Gg: AR+sD117C/CtTGc9MRMuhwjQ2TYZCj1lLob+w9/aVo8llt15E5a0IPLnczYxLzJTMTU
	VuUdfNGl9/FvJEsp5HSl9GoStQQewSc1Lr8apmjiL79Dg+UfbxpAje4hZ2hpcpShKUq8THxpztE
	2WvhoMTMQV4/NE5vRoumb7gz5J+dlz0vaJUYeOQN68298JXIpjojqfJ6UIdHkp8bo8nI22M3q1V
	LBlByWLwbfSycajx3t28zgcdSGGIIRBOcwxi2JSBWYYvcc0ar7sIXxO4EGkA1LvEZ3j1pMO7G6o
	DcKQdX8VND0kf9xEg9JMGMebtmDEJxjJ/Peyi835tr1236H6YHZ4+U4FrsJmdLxaRox12xaTgHN
	lzuV6bu37/j1G5kOF4efFjtdi
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1346980137.3.1785327665398;
        Wed, 29 Jul 2026 05:21:05 -0700 (PDT)
X-Received: by 2002:a05:6102:3591:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-754a1ba976amr1346972137.3.1785327664972;
        Wed, 29 Jul 2026 05:21:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f8f981705sm53136666b.9.2026.07.29.05.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:21:04 -0700 (PDT)
Message-ID: <c3131fcd-c2ff-47e2-a8eb-858456b88ed9@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:21:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
 <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
 <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
 <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX0t4hO5yawlgE
 FAfK18Bw31dFUSRW6fA4BLTTOSG1HTsSni3u8E49H9vYtuOAg65p1olOv8UJDWr6oBTCgPym0DZ
 zkvPrkfEF4ULM7oMIy5GNJQAN4uLz2ZnNprAtjz00TgpLrRpDSqVSQuyJZ3t2tO3dEMs+oFZ1n8
 1/JUYZBIqam+PTkfVX60yGRF25pEeaE6MhhpFFB46Ov9PWf5boVCBKJbbqJbxLM9/bWmucN1wfD
 Z9sMop5QZcifBMcEGQUeIjdlBk4KtEF3k/VgSlnDEiewyN8S9f933Den0H/oU7s9dv3TstlHN9j
 YeDJ3l05aviqIy/dzwIledZ3rlHKzYHtFm5ZQ3YFR0FIw/3ejJMhXmy3T4V3oP64wdeRQiu7wZK
 ERj5uf/CYAsdWpskS/2A8SjD3OGVh6NG5hogS0s+oXxSisZ6atf4SxXKF+iTEANB1zyQrCIScv5
 94De9IAk+H8wtUvkgWw==
X-Proofpoint-ORIG-GUID: uSSnSmFF9KrdV_Ld10WKZfjY61nm0iU2
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a69f032 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ablQDHkhG-Ar-HdMcfIA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uSSnSmFF9KrdV_Ld10WKZfjY61nm0iU2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX02St4GnB7zPv
 aJwHt/RokIksa30FT71aGrNc8VLDQwoUEuQ06wMWPt9UYmPyDjuYcre5vYpnp0g81cA3Tns4mE0
 EA9S0pmJVpLQzDtCmPJx2MnWNq2aQng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290102

On 7/23/26 12:44 PM, Vikash Garodia wrote:
> 
> On 7/23/2026 2:36 PM, Konrad Dybcio wrote:
>> On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
>>> On 22/07/2026 14:41, Vikash Garodia wrote:
>>>> Update the memory-region property to support two regions:
>>>> 1. Firmware-loaded codec carveout (existing)
>>>> 2. IOMMU IOVA reservation region (new)
>>>>
>>>> The IOMMU IOVA reservation region is required to restrict usage of
>>>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>>>> for specific streams, which could otherwise lead to device crash. This
>>>> change allows platforms to define separate memory regions for codec
>>>> carveout and IOVA restrictions.
>>>> This schema update supports existing DTS having single memory-region,
>>>> thereby allowing gradual migration of DTS to support two memory region.
>>>>
>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>
>>> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
>>>
>>> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Doesn't this cause the same limitation that the initial patch
>> by Daniel (all HW contexts can't access 0-600MiB anymore)?
> 
> Yes, it does, but for cases, like Shikra, which have single streams (with SMRs), there is no additional benefit in going with sub nodes in such case.

Please note that somewhere, I was under the impression all venus
impls suffer from that

Konrad
