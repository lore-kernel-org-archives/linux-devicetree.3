Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA003CF21C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122953; cv=none; b=RbHJVKwofWgbBAax9v55282V6qVTb1SpiKK7TXJJp8wUs91qFnARPYxPUF9iBVGr5xIyU+E8WMU8TXOJ77MLkG+/QdsPtivvAlRM+YeU8VQAHyBRm75XUjDWYy9egmw2w3bKdF2zaSQstM3gideNmoZm8aoATdb8xqS7F6DdyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122953; c=relaxed/simple;
	bh=TXxeThOPsalMuxEKHxFq3CVipBw0fSnOB9//e0evp3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0KEVSWOhbJOTLR4UhJjRpCdurFv48wNJSSQ6TB5bmW6araKuKEkRNipP1AcuARWKoeXKRwNFKj7Pmgj4Zf1D7cgDbTUxpiKHXfxWABHDJdMH3ebJ0lOx81C+CVEoOZe30wGXwy48hbXyKk3mUVjiar+9E8+MKSw3UXynm6wqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFkpjJUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkUse6h9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFkpjJUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dkUse6h9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6YuFf026365
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbgMKQh0TKyeCz5+FAHlCqXy9+V3ay/7mYaL65116IM=; b=MFkpjJUIeuU6UyUc
	hC6X9Sz2GHRSl5E9rmU0EMzBglkeL+ABNGrTod/Y+69le3Dy8FhCHj8uJ3kTUnXu
	0GSKdSIr4xq0edIZsbTJWSCNvmlbtsWQHkBUfdwoOqAKHdvRQq9fY0W8geG9JKrp
	BslIeRA0UpmLxPU7K+4X8VGD79pGOcnt+xh81/SyzPrRnhlgLeTFj3oLtiGwHHf6
	7Bb/fOeZ7Avajrl+GxfVSaSqNRFlxkCheDRn2WVSvA0MLDwbhAYMafrWumy3Vn7y
	4c2Goq8PpliUnILT+tqBCSZGxElRabVIPjAuXWplPqDE1gSh4XJlODjZRYonB4j3
	EFWWnA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpst26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:02:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so1000069a91.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787122951; x=1787727751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbgMKQh0TKyeCz5+FAHlCqXy9+V3ay/7mYaL65116IM=;
        b=dkUse6h9MeQqWVK2yVRpi9C9/HIKFHBAvHj6q0E4KpDf3gnO7mA07GOBRRjAg2WJq0
         ylWJSqI2O4OwS+1/n5ZUiJ/OFpzLIQomA+vYuvDavNWdvLyyzJtupJ9+IzKSZrBvX58i
         Fq3QRGzxxQKRiQbKVMYt8XwgUtF6j3SJyUqozPPtpm/YYnAnvht60fRHuQCDy5742UEM
         uBsVmBl/RYHfas6BhmNbliqU09peATUNQQtUMXBD0TMim42A8K7hqneZsHpmrH+nDGIn
         CW9qDgKEKY2WKiSY8rN26F5e4rv9mGjD4eHpC7urwJw34P1eTa0b/fJTAtCa/VXD/pJH
         lciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122951; x=1787727751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbgMKQh0TKyeCz5+FAHlCqXy9+V3ay/7mYaL65116IM=;
        b=drJPLGWK7ydzcjRFtsvt4XbW7LSsBUvdb3es5lhjMbDO/he3rejeWbTN+a/Hyn+Ltk
         qv5sWI6PWVB4MZ8uzpkL96fI1JQkGRvUuUwOH4skC4t+ZrEGIKDLalX+stGSGm63y8n9
         MGvLgAg1tHsKOAK6tx4jA64chze96qf3WAZUwQFU/jx/HYRkDokcxiJAQ7/+f8RAGgUL
         uBSg1+RS13mI3aoBAACXTlB6jmNiy3HYBLi+NpOQCsDo00pzwRtkPZdeVpcYZ8bYs73n
         9K+rVMZcRvaKLDeRviM1UolMBctnWolmnqPGkaOGO5fVWfgjKOzACt/kE+bVG+sEHb8v
         AlYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqv+Kp32Vz4QZy3WbA53jbPru6wZIHy+kFgvuDL8ibcRTibykt4YkT8l8RLNxklhXU6QK4abDbDt8pg@vger.kernel.org
X-Gm-Message-State: AOJu0YylweNm6hhAR6aIFbEffnk2H5O2V0KrO8NYhxK8HEXsbeH+kRkX
	czbwwPBvfzLrkYXveu+4HJYjOHEgg28WPU3oEyOSZSkuleQpKLcYInP0wUeZylKTW0on+cgz6rN
	oX+DzYfkr1u0/IpVJskPegXK+D6lnIHXHnVcsfApjkfbTZWcquaRrf0De8FXES3W+
X-Gm-Gg: AR+sD13R0OUIfRlzY8Y/f3faMs++sz4ujpFVa2dopRQVa/2p6raWcAU/BDBCYBqsvwL
	URd/GZxb/qGmwOFHdC2fPvp2IGj9eGZx4+wSWnBYO4KaevybxXYvjvuzIddFe3dP1bDZ7n8OiEW
	xAzuGJ9TBG/A5YrYzrf4Mea8PkQQJE/GMA+HWgvSmwIyMILhq7wSJ2+MekDm8svoA8ouB1N9JB9
	z1zV75Lq4HxKyJHP5yupCasYfIpjcTWLU2/QvX55ZBw2GPko+xJEUBSylxId6GDB0xaV8zy5z3b
	kgSB9a2/ygIosH7QWrM5yBWcLDyzAqI93UkTRWeP0TaLSRWsbve6dfLXqk/ADu9BZOX0k6GP7kc
	i3e4z4Q5a83tJCtLG4fyj9Ppt430jsQ0chQ7XnDEykv8nfM3ili0JJPiRbpNe3zvQkW2leA==
X-Received: by 2002:a17:90b:3145:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-395810af13bmr4215881a91.16.1787122950776;
        Wed, 19 Aug 2026 00:02:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3145:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-395810af13bmr4215812a91.16.1787122950272;
        Wed, 19 Aug 2026 00:02:30 -0700 (PDT)
Received: from [10.133.33.191] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb321dfsm1585421a91.16.2026.08.19.00.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 00:02:29 -0700 (PDT)
Message-ID: <4b3d0df7-083f-4acb-a568-99f1f74c933e@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:02:25 +0800
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
 <1a2f89d8-3c9f-4316-a2ca-e515359b012a@oss.qualcomm.com>
 <16c0cb87-a25f-4d6b-bb52-24c51aa975d9@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <16c0cb87-a25f-4d6b-bb52-24c51aa975d9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hzzWM3U_hGN46wCW7ScSmmgNdHiY0EwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MSBTYWx0ZWRfX0UmdaKj/Aitg
 MQIJikIHaXMHXFln67E7Qlkus60W3AX1soP8hEz7fnX/Exh5kAQFLOlNF+oq1EhP6RQsNtgTTY2
 XE5eO/0joyn5wLTDZffAAQrVu4LVrjPdE8yVrMfwT+j851fux56NftH47WEC+YxFYZPM42mv2Bw
 JLtoV+NqzPR9sm6Dqpe9ec0aD7cQeZb5srjXA3hg5CTrHFa1N+nhel6u+nuE02bOzStMIRWyVh/
 UVoIfQP7aA5CClC7jSBx2sU05uAb7YnNZLOgShEGx0GUOhIIv9Q3s7xFJfLlJnUFQpMsPYzapBY
 M9oc3XGnkh+8iBDBeyDSGjkKvVEYrQrsb5la4eMcqEq2m6da7WoQfPFPPxqbRAwg3F4/iGwwX2E
 8IJZtEBFFQ/WrCvZ4xQLbiExbR3F7bgvDcN5E+dJUMy8OBw5tMDevoXNun5XwEvK0UoFiFl3x0T
 /0gGwGJh3EFoHXAr+9A==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a855507 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Urc9x3V8Au4Xlx3QvY8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: hzzWM3U_hGN46wCW7ScSmmgNdHiY0EwJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MSBTYWx0ZWRfX0NGEEniCJYi7
 m1K6hqfE9fGJWhnSjrop291OgJe6ap1mRvPjQQXS+lsWNXdVN4U9bCF/a/8stNi3GA3jG3uLmm5
 Y6T+j3KsddWZiHXxz6SLiHG57YLCi3Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190051



On 8/19/2026 2:35 PM, Krzysztof Kozlowski wrote:
> On 19/08/2026 08:28, Yijie Yang wrote:
>>
>>
>> On 8/19/2026 2:09 PM, Krzysztof Kozlowski wrote:
>>> On 19/08/2026 07:42, Prasad Kumpatla wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> Add the qcom,maili SoC compatible string to the QCOM SoC bindings.
>>>>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index ff8a35df7862..00d9a493fe76 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -175,6 +175,9 @@ properties:
>>>>                  - qcom,kaanapali-qrd
>>>>              - const: qcom,kaanapali
>>>>    
>>>> +      - items:
>>>> +          - const: qcom,maili
>>>
>>> Heh? This cannot go alone.
>>
>> Keep only the SoC compatible string and exclude the board for now, as
>> the latter is not currently used.
>> https://lore.kernel.org/all/20260622-brainy-rapid-tody-dd7c3a@quoll/
> 
> No, read my message there - this should be rejected! I even wrote:
> 
> "But if ever this commit is used in argument "oh, compatible without
> user was accepted here by Krzysztof, so I can do the same", I will
> simply NAK such future contribution without reading the rest."
> 
> So NAK because you did not even bother to read what I already stated!

In patch 2/2, pd-mapper serves as the user. Is there any other reason to 
reject this binding?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie

