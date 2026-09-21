Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451A3C0A00
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000250; cv=none; b=I7UGgqKTJly8mgqMVw5QCUnmbHuE+e6ZgK0w4ct8aEZYG0kjr1ls41eDspq/KltGsgXW2NqS3PZtAkj3aRjm0tq6mTcSx96iZAFhC/PRaeeLVj/sA/IbRjdkgpvlDvL/R2/kPYinMHhq4rR6kQa8l5hjHHFi0beacQgvjdbcBlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000250; c=relaxed/simple;
	bh=EFU37UFfQRX1UHjlCPt4rwQW/IXUSuElb5ZFIgQM/pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyyEhNOhrhUb5V1AGLDWJGcT5Ce+o/pioPFDuEioFDBELXBdrTobQ1KdlWwYwRMn0chLdRnXX2aQ7nNSftjHUXCyjJLqzqJ+dWpM0HIUReG0a/KkODTXF9iLePvHIylAZRv9axcn+rP7n4kOe5/thzVFxth1NqZhEITNsZLwJMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PywaCh2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QY+qOVXY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PywaCh2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QY+qOVXY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGSuA2404151
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jcfDtWbHxehPxyh10SsVgORUjfPpHlLMP4V9bTOfkZc=; b=PywaCh2e13tKt/BP
	uF5v1D15Ul4ve6dbANtHPvybf/yMDbo9MkoJbjnN4TBNS/WJiElW6q1xD58F44od
	b2kC8fDCvbEq988kfRg1gfuKsMohKSBUJAEYvYZ5dQ+P0EHKvFrFVcR7ck/hiK9i
	61rgS7jJYoDN1/ipjBssyQTFUz8ean6EosOR2dv4Q3ZZL3pw3bPHwQ6NR54KjcS3
	6wTrxk2l8C8ksaUzVk2FK7PYLbZhCqc1EojhtDvZKwUAXXO7L0oxHDVW2kuzT91X
	5ALejTZqSw/RlderSvH6InldmAgjd8gyN7L1yUHOyhMKy8N1V3Cod5byX3yWLluP
	cvG4Sw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vashe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:17:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cace0be95so48934241.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790000247; x=1790605047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcfDtWbHxehPxyh10SsVgORUjfPpHlLMP4V9bTOfkZc=;
        b=QY+qOVXY/O13qUk6XVsjrtb2S2nGUkiUzjq/VYyE8CupzEK6Ekp0s0aEeCc2ZSvUtq
         fTZZSFlU/9cAfJVokb45Yj9Yg5ly5ah7IP2Af0nzSUwcUTdr56E3zQNsUc3Wfdh1vKit
         VWY/Xxj3LoqJld4Kmtg95pslFOMIwG4iJy5iJe4maaEuN1jUo4OcswRx7pUYXgoLAmpc
         iWxLyukdHDbJImvC8F+apiiFyo9MG7KoR76tyEdKW0n49UL+v/oXEQjpzBYP4E+b5iCp
         Qzu2JDeAoLaBFf2hxryEtWu9tP3gW3rirwHJMMncToKQ634DdrA7v7hGxjrXCpQP4pn/
         T4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000247; x=1790605047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcfDtWbHxehPxyh10SsVgORUjfPpHlLMP4V9bTOfkZc=;
        b=q7v1pLOSZuHALPL0oINhWtEWkjY1ZVGI4KyURCQaYehy+66ONDvCBEnfBMRgRVDRaG
         qWjplaO8EWe9hjC/q7nCcTzeGmacywJS9nf3Gn7bb8ZHEfmiGh8w6VBA+lNw70bSLWi3
         SKQHFPyG0Uz4BSUl2PrD1+xNqca1HvoHqXliyiH1J8rX8NQnvr69CL023PPZtQT7tKlY
         Sf7V4u81XptgQbfa88fYzucqfXIECS/JTrPNGwdeq6z3JHlicTIVVob5V1jCgj8lNMwn
         C100Z8FFSpgk5IRh0V7FCs9QxGdDR2LXpZsISlH31HqyEA0QFffS9nK8nZQxaK/xe1GI
         UUMA==
X-Forwarded-Encrypted: i=1; AKwUvBxEtwzDOqHmr+zJ42DChHWEsS3OxlrnOpg2Ltyh3hycjFTTgbk+XhyJa/CJxIS9tqru3LsqV6YqPTSE@vger.kernel.org
X-Gm-Message-State: AFuF++lbT9MYQ8kwpBknlt10D50z1jIXMg2QghfLCSFEGaCF0A3NK3I4
	DYCQZ6raRYcQA28NacCxGCjby+3q/l12uS1mew8Skpe7Cm9nqu1Q3DQt0dc0RE0wB2QALJBWmyO
	iKwU4KCYVmcczUv6ce0KoF+sZTdwBDLJgZc9UqH71x/GCoSuMrSW7ljvRBG48Cw1w
X-Gm-Gg: AYBFou37K6YVll4vNBK5zQAuINw5ZlYvlDkwrCTgH82DfTyO7UXlgR4EZ4s7UTPvfjX
	V/5tZV2m3sIAMOL47yUuGyY5xUXRf5qj6ipr3h6c+WkEZZGz0F2YhtFe7PnHfjdC1cCwQl7ljQx
	4ybVVHSYXLCi2PQKP1i9BNE0UD4TIe/dup9RwL6+jlP1+M4XvxTE37pIs/CJ5RaDxx+1McZOAPw
	IG8VxrE17VJ5NeQMy5VbWOBd5P7wvv20YtzOilm7UGBqzwOfdxNx1UKka1Gb4hodQMOtiEQg2do
	fLth8Q4gC6D5AYLOp2o4s4CCaOlTHzVCdhFfDzCgDrPDOEFpfjxNLzBVm9Mr5ewB2tKzrh1jlYG
	r1Z1z4sjRNzBkXJjkjNZj3g==
X-Received: by 2002:a05:6102:5808:b0:7a4:f9b5:ed2f with SMTP id ada2fe7eead31-7a556e125a1mr4761251137.0.1790000246690;
        Mon, 21 Sep 2026 07:17:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5808:b0:7a4:f9b5:ed2f with SMTP id ada2fe7eead31-7a556e125a1mr4761197137.0.1790000246181;
        Mon, 21 Sep 2026 07:17:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355ea970sm317205166b.20.2026.09.21.07.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:17:25 -0700 (PDT)
Message-ID: <07aeb266-927c-46f6-8363-f26fac7e3aab@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:17:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: Add CAMNOC interconnect
 provider driver
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
        Krzysztof Kozlowski
 <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com>
 <20260819093211.1436275-3-atanas.filipov@oss.qualcomm.com>
 <20260827-adept-traditional-earwig-e2c8c6@quoll>
 <4fc98d9e-5013-45b4-8fea-d0d6a8feea45@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4fc98d9e-5013-45b4-8fea-d0d6a8feea45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab13c77 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BA_JaxVOhIayAdK7WGMA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aaVBDkdNnW86sqQ1-PKJNB0UNmJTlK1X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfX1yp99PDG/4o9
 ucmTfP75C6tEnRhVMtlCfVr7o/0UO0nQt78mUf4TZQpv9aD1LdFEPoQbhZYjNNN0SQxQEyh6AAF
 olh5sNdvgfmAnNEmwcdlICrw84w0678=
X-Proofpoint-GUID: aaVBDkdNnW86sqQ1-PKJNB0UNmJTlK1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfX/xiHqw6Zz7E/
 XUnWhnXfvorUO+0+3H6RzQK4MSE9o4IFfS4k247eUmmSVKko+ayyveGX/ya+DpgUfXQHBBUb0gE
 tbWX7Vg4qkopR9hT0qywl70raoKc6K7O7kYYStMSJ8J4EDWLemu1eTP2u35FMrhHqNKDC/Vabfn
 IeRcE5jVb9mpzNNxvuRgPi1hqfU4G3fiBuq776FsVndPshoTMgf3B7SA2erEnWsujadmWXtvpTb
 3pBbl0UkehRtgpVns4+yLZXoThjfS2gnYMFmYmTVSHZD0ww2PIkc7IJNByMaFSGin5qntPYDz81
 xeOW15OaTyCwX2lVCxPoDeXyTqsPsZMNzWEn+VrsDt46kGncnyFswBVvQ3Qc/qF3nBy97IflziA
 GMlgTpM/mwirVMPhSCy0ZTluxqj24H3H9rqNwfbsuUSHDJmDGlL6eYRcElGRgtDMwjKFzfN+85a
 KdmLwNF/r2VV8nlovGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210207

On 9/9/26 2:58 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> On 8/27/2026 12:25 PM, Krzysztof Kozlowski wrote:
>> On Wed, Aug 19, 2026 at 12:32:10PM +0300, Atanas Filipov wrote:
>>> Add an ICC provider for the Qualcomm Camera NOC (CAMNOC). Multiple
>>> camera sub-devices share CAM_CC_CAMNOC_AXI_CLK; direct clk_set_rate()
>>> calls from each consumer cause a last-writer-wins race.
>>>
>>> Each consumer obtains an ICC path to SLAVE_CAMNOC_AXI and votes via
>>> icc_set_bw(). The ICC core aggregates votes (max peak_bw) and the
>>> set() callback converts the result to clk_set_rate(). Consumers
>>> encode the required frequency as peak_bw in kBps.
>>>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> ---

[...]

> Maybe those series should be marked as RFC. The basic idea is to manage clocks as interconnect providers,
> similar to this change: https://lore.kernel.org/all/20230512001334.2983048-3-dmitry.baryshkov@linaro.org/
> 
> There is requirement to maintain higher clock rate on source clocks and some place to aggregate them.
> One example is camnoc axi clock which is used by jpeg, camss, ope and maybe other drivers.
> The interconnect has already functionality inplace to maintain higher
> bw per request which can be used for maintaining higher clock frequency from requested drivers.
> 
> One option is to use already available icc-clk provider, but we have to add many icc providers
> instead one provider with many ports.

icc-clk provides N clocks, it has M clients voting on each one and
avg/peak bandwidth aggregation happens at the icc core so this
should just work - or are we thinking about different problems?

Konrad
