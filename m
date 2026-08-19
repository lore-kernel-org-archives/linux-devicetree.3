Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34DF41834B
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129806; cv=none; b=CtL1QCYlzn6b8KWk0j4WlJn7kCnn/Gw2K/FCEeShv7GealA4owPcpDPDIzG7db4hnWAEdGfteFrmk9jeaJ6E8YMRNz5ewMD2EvxWBUBs3W9VljpU/LySdPxvwA7ciOrXoKKZs/mrBqTxAz128cwq6pb/qSCx7+0kkTFuAuBmpgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129806; c=relaxed/simple;
	bh=GfwPUVy1wtcXHI4cDKG2x/qkjKjLyxyWGtyRxR9bcQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmSKXTH7sjgah4KbdL+91nMR6dCFp77PMHe62sfzmdueAQg3PYxwbVScz/S3LJ03z5cW/OGwYSXLbbjh0kl4r2tANa0Yas1KyGgIMv0+l+8S595W3Vu0/3x6orKFLk54TP0lcYPmuE/dr58tGvlloaiNx8SlBBFSaUDCG/pMlSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAkh17Gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJtJyhoW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAkh17Gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJtJyhoW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z0la3266680
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBFLe/deTAdHGLQZGNjOTwoBFce0zoTmgIq152Pb7kY=; b=cAkh17Gw9EEr4N+M
	xXIqQWtZTetc+GYvYVwvxiRxT3aMRPThElkVz1Uac9xY38W7rWAKw9NB0vh1hEbM
	ma/MsbZoTnU59X16Vft14mrsTI8KuHYH72QNjkc25XtS8DHHihkJrFpQM/t/WSy+
	TT6mHhBehG2WUzOSJmk/wCA3eGHaiCXfj98zrPX0zBR6Ye6A+gytlVe1UGCF8G/X
	oPRI0CMAmRfN4/9bitPShOMa1S6nojba7jI6k4pZkSrRF8lCAjOTTF66x5fOKc8l
	e3XItM/qVBFnDxZAZlOb2nZagVAkh7y8kALp+hWNmOEHQS0j4uApQFZ7homjFSO6
	+ePTsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yffj7yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:56:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so316311cf.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787129800; x=1787734600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBFLe/deTAdHGLQZGNjOTwoBFce0zoTmgIq152Pb7kY=;
        b=bJtJyhoWS9h4rXOKWtxmhTAtwW/Vt0Wbcpk2+wrMFEPLCuKSXVIVIKZaZb0E4ybI1j
         oGEPbpcXwJubNX4rMyCjbzN6EOfvyV1QOKCESzom2lA9CQUMSZ9tXCnipFsa8zw4u9Dr
         9JelFFMhA4TW12W0JmCNuLA0LGQlr7y3ZWDGE4Btf67WLlqa1EN3Y3nom8utQYFAvVjg
         olJ9qbLmZvRCF5nxpjitAb3Gotc+MNRl90G6khj+ZByN9sBLHIFf6ET3d0MZlgatb4ja
         v/aMtTn2JyRReAd+3ih1HhraDp+HD0QwqMpUX8FwWrBt0Mvyd98S5PR1o5fFympk0gL/
         Tovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129800; x=1787734600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBFLe/deTAdHGLQZGNjOTwoBFce0zoTmgIq152Pb7kY=;
        b=SlwZmG8Q6q3BIX+7mm5zfModVp0Z3cyftDDuFTk9l9AjBmW5SZQ+czcEuN9eLLqRy6
         FSV1Zj/rl7+5cGOBTpcqFc8WVYbnc5jJ+RO6zBfw+NgnEsRKecGdOVi3pnZG+Rtvlg37
         8MI8IS/+cZl0Ll078ZMCFw8pcWsIvq5gW3v1ThjPu/MdI32TPLJVqsY7dNfadB8xKE7m
         6x977thRMYlkft6g4WqIbbN/qKkMZHZk5XxlUwoelJRORc8d3uOXHKJZElErOYmgPZVN
         pqd9MSBxEOU35Oo0xTgwl/5a6F9M/GDd6rCOz+Q8YKU7PtCr32tFVnHgMXuiVd19yHS/
         Xrcg==
X-Forwarded-Encrypted: i=1; AHgh+Row7PrIolwJoCGRfau8uvI5jo//1uUo1iKHMdsHfPgAGhBJvQB0GK/OuWbr9hZmMIWfD9UqpGx0wFYa@vger.kernel.org
X-Gm-Message-State: AOJu0YxrFEAdyjOzcv42xjLQQHf0mJnFamY9doaBnF4wfK5MmRtvhJf8
	qpmHxxbaJUtIUR9uRH+IXtbX1RTLKo2u2XmKYorFX8hNABRWxsS4q5yvpI+pA1Ynb5FLd5De0JH
	VC5C8c3d9Jfifd794AV9Qi/iQrPf2ycaO4bQHksr1PHuH+BCEOYKC8wrHGZD2/fzC
X-Gm-Gg: AR+sD10mabJCAHDzh1/TV87lu1BHb/fISkI7IRrBYZrjl2Dimj47DIeMgUEdNqEdjFd
	qv73fWOTOGLCLI3kIGF6u1JwUMIBNLy38F7BNMEAPL1UWcsd9D2PXyaYAK17FZn2jz9OKg/+S96
	6EzmyNkttJ7x3iApJr1f1+Zm0jGiLkJXpnn2PJxpRbDB7t9fUDuymeEyAR+SOrfXewnu9+Sfjvw
	BQeH0HezB6IRIP7qDvky9SVd+zgeQk5P8iXzIOqp0DRO0VLFRwyT4RL+R46P7tRg035O1Qofj77
	LWspPDmbbBrJ9LvKUf/rtgeIHhKE6MSQ/n//e8J7J6rCauxXJvHNz26r9Rr4wYWFVRNg2vmSGld
	GTkVKwaQAjRfO6kxFManrklOd
X-Received: by 2002:ac8:7e8d:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52dd4e01d31mr22916891cf.0.1787129800076;
        Wed, 19 Aug 2026 01:56:40 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52dd4e01d31mr22916611cf.0.1787129799580;
        Wed, 19 Aug 2026 01:56:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9e2esm569203a12.5.2026.08.19.01.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 01:56:37 -0700 (PDT)
Message-ID: <7808f348-6f9f-4fb6-92ce-74aedd6297d7@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:56:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819054203.61385-1-prasad.kumpatla@oss.qualcomm.com>
 <20260819054203.61385-2-prasad.kumpatla@oss.qualcomm.com>
 <9cb0c647-e1bd-40c8-a1db-7a0f6382aeb5@kernel.org>
 <1a2f89d8-3c9f-4316-a2ca-e515359b012a@oss.qualcomm.com>
 <16c0cb87-a25f-4d6b-bb52-24c51aa975d9@kernel.org>
 <4b3d0df7-083f-4acb-a568-99f1f74c933e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4b3d0df7-083f-4acb-a568-99f1f74c933e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2NyBTYWx0ZWRfX5CMJis8yH1Aj
 JHgQsKf1rUh9Ps7zZMT9Sxq27VoskcvMTJDPQ9UHlCrkW/WOvcIPH59M+7hXrSePZ/g3qSCRko5
 mKqxpw8K1lMvU1rgYR8pkSjb8itYG10=
X-Authority-Analysis: v=2.4 cv=H5PrBeYi c=1 sm=1 tr=0 ts=6a856fc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=woXYOrtb3ejycLe048IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 8SQLYH7B7i_z8aIaFSpb8ibERHgRlRE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2NyBTYWx0ZWRfXya5w0uZwMFj0
 lzn83Pkb7fvrh/neUNnC4POXrstQgGVgRzyPFNtNGgdRB3EO9wxS+VthRqkQpvXWhakrpfI6dHR
 UpgO/iSwKaryqY9P6pPLxeqDtxog5aZ6+sl43gwuUFLKHlQ+7YZvHXGFZyBtan20h9emdC+FnkS
 +F/UZQdUKkeOTIZhxH9XfGJN/cIKA9er6lIu0VfEqaHbCd0tlzU6odUUsOHDjmtjThxDjrgYMBf
 yG2j96SdCbkecyDxpefFj8tFKLicW/hp02CnEJRv9NNEgMMdl83ryv5+D9ZfAJYAloySD+mGccX
 X6Q7zx3/Fjl6fgWV5/45VwDpXgAXVMaBOh0XyblQrqewIuCqIM6QDrDgkMleuiF6R7/Q8pWgVaU
 6a8rmrQJuwsmMm7LAFHbtxhB2175aBiQY7NRG788svmecWq2sSzwbm/6ElUFmYbDKHvydFAGaPc
 7cTTusVTBXxb67haChg==
X-Proofpoint-GUID: 8SQLYH7B7i_z8aIaFSpb8ibERHgRlRE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190067

On 8/19/26 9:02 AM, Yijie Yang wrote:
> 
> 
> On 8/19/2026 2:35 PM, Krzysztof Kozlowski wrote:
>> On 19/08/2026 08:28, Yijie Yang wrote:

[...]

>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> @@ -175,6 +175,9 @@ properties:
>>>>>                  - qcom,kaanapali-qrd
>>>>>              - const: qcom,kaanapali
>>>>>    +      - items:
>>>>> +          - const: qcom,maili
>>>>
>>>> Heh? This cannot go alone.
>>>
>>> Keep only the SoC compatible string and exclude the board for now, as
>>> the latter is not currently used.
>>> https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/
>>
>> No, read my message there - this should be rejected! I even wrote:
>>
>> "But if ever this commit is used in argument "oh, compatible without
>> user was accepted here by Krzysztof, so I can do the same", I will
>> simply NAK such future contribution without reading the rest."
>>
>> So NAK because you did not even bother to read what I already stated!
> 
> In patch 2/2, pd-mapper serves as the user. Is there any other reason to reject this binding?

This defines/allows a top-level compatible of

compatible = "qcom,maili";

which is missing the board part, and that is strictly required.

Konrad
