Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346482F5337
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120907; cv=none; b=FV1EvLZM839tB7HHhWZAmGQfR1mPGE/oErMHHH2uqTKW3o4ilz9izConIzwMXLCckZ/ESi34qshC+PKK5poov+aNBMdObpLoKjd2azM5iOW5pB0g0tenfgf0Q3eh0uj7anei2Hpxt5V7H4Q58rhi7Rv1OHQBPrXaHczLIPpml0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120907; c=relaxed/simple;
	bh=9NsXEUlnH4j7ADwZDbgWZ1lVjhtDEdNYgKwpwi4iFwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4fI8H1D/lY1GRnLTHdfU/7R753S5rGD4Bv1EjJYpI0KTPqqap+uJz1/gYda4O8Ie9f7UbTYHTmxhObZCY+VXgIYExN7eUrmAIaNASLmyAEauFXG/KuOSE+CDsIQmZAcufNcS5KBZvrqMk84L76pv8qgPd3lUBO9jMVxo1CzFs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0U2L1Bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G91s3qQv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0U2L1Bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G91s3qQv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I8tx3839545
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hv2CQMZRu/930lUMcg8A3Q7wtJR9SUi2cZhagdGpK7c=; b=f0U2L1Bg2WopJlby
	iaQAC5/AYgpbUThO5DdZBwy4zsPMBES1Rcmkbv2G0por3jX5sddEfbzjas/PtC0B
	PXxZfwfMhdkM7PumvjHJU/LKsH3iENAKmBobnYTUKloLVmj9hjMigdNEFm8MNMjV
	36XHFdF5cGnAmCOgeOpVDFCxqF3+QPISXzEJCb2xULqvgWE1ukz7sPAQxx8TnJgE
	Ora4xwg6Khf+MqT4/DeUAGLL49mnl4LrbHpjj39rRHLqf+SslmzD5Oa169ZtynH4
	GsqxmSlXg6GvTTdsjRUA7g8r8eMe1/yi+QIGzDpUnD4UWLEpiwSzkAOqops3jwYG
	rlz6aw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm9pb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:28:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so988429b3a.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 23:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787120904; x=1787725704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hv2CQMZRu/930lUMcg8A3Q7wtJR9SUi2cZhagdGpK7c=;
        b=G91s3qQvj1Lc+4n2akdnW4kUo6xrLRW8zSJIXaWsR/B786ahZA4c6mMVjHfXunNIKw
         yT8rG/OAVMZj0EnodW7fEP9pXGSLPanbTs7XwLwPR0aG/b/yeqPpYJXjqFXHnfN5/wG8
         snnJOij6f66+N3UPcjwqkQ/RiQBDBYDLMw8TTbswXBk+hwrAUslcUccLTU2qt38AVoz9
         KNSUgjrP5Kgeir6AOYZi4pNbUzbj+xdwQB9mWpcE4HYHUfIWcp7Bzg/wPV9mM6gRI2SA
         TCKF1TUVA514V7hXkne+5pO6c5Hx69NijZ2GqtgCmnYTE4ry2vZ4iyGiaWOOpORZtffC
         Z0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120904; x=1787725704;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hv2CQMZRu/930lUMcg8A3Q7wtJR9SUi2cZhagdGpK7c=;
        b=JFeEDIMDFrPqS0AQuvMCwdX+A85X7JmnopEQbGERefHaLujMd6/An9UYZt8BAfJ+Oo
         EhbQWzQe7p4u6Xo7bqIoyCDgfv3ARXVuVo2sdqwziBFfFtO4iWZ27A5rtck8KhmT7Zwn
         fBU7bJDa3c75FIVKErVFl6hUW0MkNdMH41RvvGsKM5PiygQymGhBsL+ouaocEyopmhIt
         +MSP5zDiXG7c7m0GozODifuqiPQzzefMPxtHOxtjQs/UsygxYQw2S0BYhqw+CiGS3sp/
         6abrrm8FZKpb8frLa7siZVJ6D1J4pT5waM8AUnVnk2wIf77A9GVJhhHe+6QINnUtBnij
         tbFQ==
X-Forwarded-Encrypted: i=1; AHgh+RofGxmv5eK4tFQ+13rZpSXGt+5RWM9fULp9TBsivTTX0/4pbgsfBv5Hi0ZcnK+Pmz33Wep5foX2t/lr@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxSyQ0dPyeXgkD+GWAjSsRg/43gGlZJ8VqtMRYvAupjHPBceB
	2r4bT28tRi26QEwQ9l1tdn18QuoKkvFnowUgI4+ZRC5iDy3TarOWH+YJyqRaFwai5iZsOJuxrlf
	GiD27CLuOVJ3bHLPkWMXSuj3H0pPdw+CSgSlbKGU3iJK4MqmUIf+WSKbGfpvK5lJa
X-Gm-Gg: AR+sD118oD/DQSlBvXfw8ogFjwuVsLND9R2gvhxfrKmBrJI7/3no8ZoRgHdSVTVunv5
	amTYZrV7VR9XKs1B9SDPM8Ts/I6M/dgFHGQoU9vhTys7kSqI2Mx3pN9ufZcBSsC9fKut/9N5dwH
	aOyox7ky+/6+2E3AAXek9BUaXD5Pipjd1HxatvbggdEuevn1EKzhYzW71on6Ck+aX6x/1gPVcuz
	5dxpd0R+7Eg7O9BGSjSISpsNux5M3vg7Krsjlw/hES3VqCtCD0FVN2XzSgJVa/+QrebH87e7HrZ
	D8EZ06pAkQShYVHjSQn4rkSY8t/4Mluniv0ViyuGVb+wsoG2WBegsRAXfJ3Yhazjbv/GQXiRGIi
	pVKBH+60n4VWUXK5aA4SeMqgkM9G8ZjtwQqItaaVW+Pl7XHU8It1nXyeJNT6FcqXELTQdpQ==
X-Received: by 2002:a05:6a00:94ee:b0:84e:e741:174f with SMTP id d2e1a72fcca58-851d37f7928mr3454107b3a.7.1787120904036;
        Tue, 18 Aug 2026 23:28:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:94ee:b0:84e:e741:174f with SMTP id d2e1a72fcca58-851d37f7928mr3454054b3a.7.1787120903627;
        Tue, 18 Aug 2026 23:28:23 -0700 (PDT)
Received: from [10.133.33.191] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15543d0d2sm245726a12.8.2026.08.18.23.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 23:28:23 -0700 (PDT)
Message-ID: <1a2f89d8-3c9f-4316-a2ca-e515359b012a@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:28:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Maili SoC compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <9cb0c647-e1bd-40c8-a1db-7a0f6382aeb5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KS8DizDkHrg9t4VpR6nnCkKYO9exxgjY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0NiBTYWx0ZWRfX608m3h084tih
 B8F5wgNu1/0ME11dX+8z1+vejDAgevBkScd0ZzxzQle8pVQCkgFg7FRMWPoTL1jXWVX4xUOpzyX
 kC6UCbNYtskJVs1bYsRnmKsO09QoHQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0NiBTYWx0ZWRfXxh6fn9Z5llVj
 c4ZPVcXOq98VmGMcTcK3JWTH5FLZl9iMmQ/h/hi0a/Taq/bh4WMT1qg/uXzXP6/Pksp1hU/dxxf
 WAl5i9O9lTa9uYtJ3qPT1VUSqMEALDW6gaPPQSS9Fdb+oWXiWbErx9Th0wSNKwLqz/dAM2NsE9n
 Hpg3gyWywNznEuaNbRutOqUqjFMQEjQWCFqzwphhUi3YHZoCOLFeSrJFr5qKI2G/jKsezQesf+D
 ml+6t++c7IbKJIh4aLFRTQ0or3vu8kN2cBOagB5Y/i1h/6EO60aDiYqzG8GY94WFVKwMFMBcu5e
 npRZj+ND8ZQoe7YIQgAF6etWVgAejktu1chxyoCABx/5dHlmb691EBvI/LcecXbawS3cO6sLZiu
 MeTznBMseyiCKBFkW7eVxaHYjG7oRLAshmiwWBgVtiiuFK2N/r+Umfu0CRU9sHmBCJhDF+kq1Iu
 +/gKtECTI+0/CygTLig==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a854d08 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3TlOhtAxTlW9CNtfbbYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: KS8DizDkHrg9t4VpR6nnCkKYO9exxgjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190046



On 8/19/2026 2:09 PM, Krzysztof Kozlowski wrote:
> On 19/08/2026 07:42, Prasad Kumpatla wrote:
>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index ff8a35df7862..00d9a493fe76 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -175,6 +175,9 @@ properties:
>>                 - qcom,kaanapali-qrd
>>             - const: qcom,kaanapali
>>   
>> +      - items:
>> +          - const: qcom,maili
> 
> Heh? This cannot go alone.

Keep only the SoC compatible string and exclude the board for now, as 
the latter is not currently used.
https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie

