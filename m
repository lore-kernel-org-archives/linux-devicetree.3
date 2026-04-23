Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420D40DFD5
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928616; cv=none; b=sKaaMFKuDPXZmxGV8A2YLfDYTorjZXDIMFvIyGyMAeeJ/Yg9u58asud98sFDgVNYNKdCFSdhr3FVIHe+KIIAx3kzCiYddZVLS72zBI+m+5t1dW3+NSxBF/rdW0civ63EbXyCIhDKVsGRCEr6kpdxhU+PdusLiFGQ4x9jv1C1cQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928616; c=relaxed/simple;
	bh=ulrm7hhT1C/R+X/eza+IdBh/8UPhAJkCQSzcmiYnsm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dG6WcDNGxQDdG/cluDxRtQ4CrYrgR/3JwUiHGwdjseJEs1gUZpYetBTpoiBHyvVzYbR7ek2G+UkOv1MUWBfq0we/jYOy2a0RVSegDKdDrDyNjtUzH7Y7gH8XUWYKHq8zGEkx+nSPdswxayw5SFmuSY19cEpRULWFZHUZ9sQHyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAHheGv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmnLOLbb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAHheGv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmnLOLbb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N35d83121891
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 07:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mur4MXHqvMkii9QpJkTUyQPomvf56RRPQfpcXgqhu00=; b=NAHheGv6sOWkVZkn
	dCkId4uEZ+FuJEsUGnh9XVbID7qHFYZJtc2czotY6r5J6NDJDYFDUPOmul3jGC8R
	opAf9P6Un9cdOtG+1ck2AmT6H8Pee82m14JsU1kdOeq5eyaSNc+DvWFkHmrxJzsY
	pWaUF3zRhAV17xuI5wa2PEv5IeOWdtwbJsSzYmoxv8a4cRIFuEiwzSKYUZka7tXu
	rY7rXFgBpMcD0b6rWIyVAvAA+ir/qoANQBtPDAPwIl7wkcbCu7iXrhcC+DUGsZAD
	TOLeMDHF2dqFNwKKiRwyejZrpUPyZOo+gvCwFHlafuJGeK1SBa5YIcDa8FnwkjUk
	ui6zNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h82nqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 07:16:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f13da9684so48235631cf.3
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 00:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776928613; x=1777533413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mur4MXHqvMkii9QpJkTUyQPomvf56RRPQfpcXgqhu00=;
        b=JmnLOLbbZwzJkrkOkPgpO7elJ7fHt+4L0rOdC0dv2rDXQT2PhwjtcU3Ve8vOmUks8/
         m9jBJSJlWjlLHfZuGeSI379kCVfakUFCXmELCNj6M6Agjg9B+z1Iv3P8jrREqHaxJMt+
         nk8iIsKQ++0S/sNsgakjan1c19M3V6KD2T/fCa+vsUoQLQTvqbLd4Z5v/Df1vA/NyFzS
         NcGMUvKq8CPfPLCcPZpxmTC9S9FkZkK5DHjqHYUDILlW4ZyMmFqp7E+CYAqVPZxb3EhT
         RZaMDwy5LzRGT/ASQuqdHCU6LSkmIDxNfqidt6QVe9/ePuh7AdsMlTRa2OrRu8yUvC7Z
         4TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928613; x=1777533413;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mur4MXHqvMkii9QpJkTUyQPomvf56RRPQfpcXgqhu00=;
        b=AFlz3+jQG+e2h6m3J+w2DEls3diHOEbBvvuPERlMVYwUWa7J5HPJg6SlfX5RiS8zLZ
         /kGHLfSDBXuTuKvxKwXNVRy7T+9IPZH9jtgaVh8zkIlyR9X/Cc5BPOnQxrxdRXwl7qSB
         9Rv/SYCpy7O8Cc5Nsnxjs+DM6kiB1z8uoQIZgRKLhPE2ysy7BTm5fnQ8B8UZyQ5FguaU
         N9PCPznGae5lsTpp4K1Swws58r9UQVHeXSDmBkk1pz4bnVGgySNo/MTDN2IOOdNUtodv
         1Czj8Z+AVHXJMUctkdi9JZyQxVOdxJ6lf9SJkuzhhmYAyimHAdAOD9AAmu/A3H14/YRs
         2gcw==
X-Forwarded-Encrypted: i=1; AFNElJ/sur9PmhrvsCycJ9YhZR0Aq29ycaxZxRoiUt/xNaYc2LJYzCxkhPcrnrjcXiDYmw1p8oBxtUML7IvF@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDA+oUCRipCDaTCGhu2YMGt9/I1E8j63efE63CutHuCpBY6FN
	DDk+2xKWoOv0gFE/n5AjqBAmHaieU+dZUlp2YTybBFP+5HPAonokGOrEDiRn/2p57YQEe3CrhdJ
	O9u/mEqv+cOh68MpjoB2uPC+ZA217C15dJl5HGbWNSvSSloYMOGYfvIWoysOB/THV
X-Gm-Gg: AeBDietyF4H8Tl5Q4iu1rq4Or89RiZuZsnPhfrnoqidZ5Cw5TEtjdxZ7uroNg0bZXBt
	d/tev0B52fA58ipndcbqobx7InaDBLE2oMe3UmpluAQP54L7Sjc9qAOwM9jUNyJZoQD41kwYMFo
	wzPcq7/Ivs09ZPRufEVnbToyUXLTwR7zCfxJcbkAS1P8l90wfWXP+Qd99bS/CKfUX1wFlsSK9L2
	SKUSII6/+Sij+ySKfBhtNzsyvhTFfZusep8GqQMlvdz6fQWZaRxNYYNGBuN3U5hjTZSh1QWHJLz
	Gk2m2dscj0KkNYHT/IRi1u2PpzKpQJVe6GEfLuRw8tctKMKY47PkvqfmKAqjQq1R+Sz5U5dg6Wx
	K1MRJzi5i/Yt9W9kYfNluGoD1TIv2M1LtB/j4MTKHAxZ3bc6N1qHiOkL27lY=
X-Received: by 2002:a05:622a:5516:b0:50f:b904:457 with SMTP id d75a77b69052e-50fb9040613mr128714541cf.25.1776928613352;
        Thu, 23 Apr 2026 00:16:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5516:b0:50f:b904:457 with SMTP id d75a77b69052e-50fb9040613mr128714081cf.25.1776928612734;
        Thu, 23 Apr 2026 00:16:52 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm404834755e9.6.2026.04.23.00.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:16:51 -0700 (PDT)
Message-ID: <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 09:16:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
 <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2NiBTYWx0ZWRfXz7zLWIE7ljMs
 e6zPy36Fp5Oe/hewWnZy8FYEJJ1tEp5G2B3lnA6a8oTG8oBqd/cOA/JqcqLsyk7M5fKywjwPEaE
 btSw0Ei78+EekFRUwXfCdpT7tLUpOkaZzTRK/bDWWLE0gwdvPrL07C9z/CuwENQuiJTxXALIzWr
 JW8cfFrDTk1JooIlHzSYI3HovNg/+rDsQ7DhGA3Iu0B8XKbOZHqSj1cdlMF624sJctaKbAZu1rv
 AIzZSWa5sdoJ0hf7Xk0fTS4vl3ecYvAdxRGPMDzFmN3xyQ+QTV4LvX1oGavVtertLicHnsoYkv4
 ofjM0D210/1q1DrPlHm8+wbLSSYLFr7lJhww937fTEy39S1sTnclBCcY3NQXgzUrwy+l83fRbaK
 ZBv4j4VCD26ypdGl/CKOzenrGx3eDKIVkgoMxwSJSVMffJ0NhbUz1JsJOM3t9p/mfGDGIzuuERh
 IIEMs2e7Uj0d4C0xDuw==
X-Proofpoint-GUID: kW2eYX5FF9-t3lOAT8iW0cV2T6HWvCpC
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e9c766 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=V7ogQbNXaJUYwqe3PicA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kW2eYX5FF9-t3lOAT8iW0cV2T6HWvCpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230066

On 22/04/2026 22:08, Dmitry Baryshkov wrote:
> On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
>> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
>>> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>>>> According to user manual / programming guide there is no separate PCIe
>>>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>>>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>>>> is marked as the main block with additional sub blocks for each 4-lane
>>>> phys.
>>>>
>>>> Describing the sub phys without the rest is not correct from hardware
>>>> description, even if it works.
>>>
>>> Is this the case for the other bifurcated PHYs?
>>>
>>
>> There's more? Oh damn...
> 
> In the previous generations. I think Hamoa had one.

Ah, I did not check the others and there is little we can do there -
it's released DTS. This cannot be easily changed while keeping DTS
compatible with users, because probably two PHY nodes will be replaced
by one with different compatible.

Therefore I want to change only the platforms freshly added, where any
incompatibility impact will be minimal.

Best regards,
Krzysztof
