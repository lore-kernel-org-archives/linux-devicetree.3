Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94B332EDE
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775476726; cv=none; b=KderXjkfmh+f8jDVzTfsCFlrBUU9wDq8vknIrMnCLQRY5KGS+txrv2wVhOhW6Pn6Ox7qqo0mcDHrOu4MuhRQQQzz/CU52gLpd/DAtnWkBbNMgz2ec1qrgF1ahJCTYExEiwnJwD34ok7e7mOub7oj6HIPkhnMGuIlt4RTWymhvFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775476726; c=relaxed/simple;
	bh=sdulTfIZGIJEqWel6l2jvDouPMlgJ9AyuDVKH+29ZOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsNxs5h22hoVNL9rs/94kktTnmOwb8poUCRGJMyQmOo3l/JIFnJixUPMwO2QIAywpBJhQ8jCdpng6C0G0fGlYBPMGAndTwdpzk1rqBW3gYvl0Pn2lZ27p4eMwO0+gOxSiLBqFgx2IANrY5vQkRAcPZom3PlSo8YpdzZYGU/gAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6LSHNcf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RwV/FzmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6LSHNcf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RwV/FzmR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636AmWwV015838
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 11:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FN5ZDjiy2FKrMXgecdzRkxCIor0XyXBcB50swAm+tV8=; b=d6LSHNcf5MechMlj
	hbUY4xanFyVAIBTK1y1NipuQ21zvyafftD5BWhVkJ8qJfrwcAX5gII7hW7R5c1Fi
	Fi+pGiX+mtD3olTjIyVGrf3sBXohRPBm21iYEksTmPrMes6lshgiI9SSSkpZcAXH
	60XKjTwEsDam8LU/zOhEQ5/VkPlWuLpUJZrQ3B1b1d6LrhawplxFIf4PbKx4QGo5
	U5Bfvi4Zw4dwF5UTzHfqWlHUHB2QqkjFSpNm6YRbsrMLbJPIdwnwS91+5P+z6DHw
	obvCqCrY7AqFzvWWgvC7o4VIrUnMD+O3j17aL9YpnCERr29jk0NCU/vp+QcFqVCq
	ShWwlw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcbd6r5ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 11:58:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a80fb4566so996146b3a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 04:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775476723; x=1776081523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FN5ZDjiy2FKrMXgecdzRkxCIor0XyXBcB50swAm+tV8=;
        b=RwV/FzmRWrvy0YxleJd5ibNYlQQRZ1/4Sbf5XfQazogMKk5iVIbYqe/44T2sK7LO1t
         u/4ZxzS924V5/qh4xmzU5KmzEEsdV5CHFLbhpbjA35Ch3pHWARobOtF4/CHpIiWklNzb
         3oIWsvo//xDuRVK+nkFsObhd2bZVSGYsq7S+gn52rkxt+viTWuBo+lHpJiYh3Eg65B1I
         Ygjc155RnorlCdMobPeHTurWKITFaV50ixmTHhbcIrNBKb7EJFg1/tDs8c4YlSn9ja7J
         O9cqvXudlDFlGpyuzWMhuE7sxuCUnOjXKcCPtuqhsiDe4a8K6TCXGvvYdq7Ue7q2Bvot
         L4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775476723; x=1776081523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FN5ZDjiy2FKrMXgecdzRkxCIor0XyXBcB50swAm+tV8=;
        b=W2lj/BLnWc+Zr6C6NVa/bCn9nhpqjz66sZ1apSFTb4jVREWQEk0M6CrVpZNA33OFyF
         96DqwEA+N+TOBFgE3PxZiMm3QoDFg98WjUkyRlbVyXtMdjmB9tSaClHHG5GAwHSbk0Yn
         HBJ/nCJqt+ixpgCZhhdeKLMgQ2QsgWOrbOLk28SCrr6txbNsBtfdJuKdtpXK9vcOP1bf
         XeDNQAZ+lIy5L/yjo9WIBYogEVe1AY00082LHcR0vz3CkybSlmvB1qH/rfrjkRIGnnac
         Iozm5FEVPtWaWQ6LLGgYvlUORGENiTlI8YURwAdOder/KOi9OIe9uX6ndWyES/NfW6x5
         ybEg==
X-Forwarded-Encrypted: i=1; AJvYcCWu2eTGj/9JKOqAE/6526a2v5WczXKMH2eIa0kZtpknV72SCrhJBWECTGd6dJ0hZrnoiu12lBh5XgXG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvy39ILuJXVP5Zg4wpA/KODKwf83wGW9Daar1keB5rZ4mmMFU
	Oar93oe2xuk7rnJc09D4Fhhiv0E+VNBNtY8spddehLLQq+MyKnM3TiwbL2SU90FutzW6bcE2vWG
	jzsn4KxxJqRjWgZBmPciDiTUI3OTXtV0lj1g08h+A4g9KwZyN/kRqZL4HhWDRYyhI
X-Gm-Gg: AeBDievKdFBT8CcsseV2ll2VciR18n3hveOhQKaceGkvtcAm8cZmdrQwGNS3x1lWln6
	TkKL3AWnm8n0rqFq6GAH7/fwDTDw8ruF+4IxMIMGB5iGadlQjpii2YtMs1pXa8tb/UThhRpvT5z
	R1ZFfaUEtVsJ/32fnNCcpsndZTSCAgIjj8SD4eJ5J6W3nutdx1QkdBT41FTQ5NODfg6Rj5U6jRH
	CO1HzJ3RJk1WEF/rMqb2du4zCTsEVUV0jBBl7RK+CEPCZshiegJz/W0lJBiOBaGTVwX9ZKhizqt
	mgnX5uIsMb/Sf/LmBH7vtzIjLkmXsBK1LMfXNUnT11ldFRhzIdiR6p4ssu1GHXZD79waKkEEKJj
	zimGLkQw3R5AYgEHICH2K1mNoxkvZV0huU64EJnsbU8SvqzS+xQ==
X-Received: by 2002:a05:6a00:6ca8:b0:824:3b85:ef89 with SMTP id d2e1a72fcca58-82d0dbb0736mr7001330b3a.5.1775476722514;
        Mon, 06 Apr 2026 04:58:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:6ca8:b0:824:3b85:ef89 with SMTP id d2e1a72fcca58-82d0dbb0736mr7001311b3a.5.1775476722026;
        Mon, 06 Apr 2026 04:58:42 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c4387esm14889588b3a.31.2026.04.06.04.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 04:58:41 -0700 (PDT)
Message-ID: <8f79000d-ccbb-403c-871c-7a36423c9eee@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 17:28:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
 <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
 <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
 <7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ap2/yCZV c=1 sm=1 tr=0 ts=69d39ff3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XEdbQUFsqSG1udmAHCAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: vVJL5hNGqW1BGbMyy9dCFHBtw47InPYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDExOCBTYWx0ZWRfXzYQKWBoS5qgH
 UzGpXbSmTJ/7rJpSdlP3/HyGGcdZLUspeTjmD/HLPadMJeGhlbZrnOYNKid65TPlAt5x0YK+s4R
 4kUgWCb2N6clluFDU9e6yawVkTEf0ktjNUU2tD0k61d7pB8UturrZYqYuNn5lY9TZtZjqNKtGEQ
 IDwgRXaU8HtxcagHO+Bt2G/pn3fWAq6+URhgY31o93tnm51r8mA4soN3kv4AUstqwcWN+5oaO+2
 d3lPGhQhg9GiBx+4Ag/vPfYM0TFcjxjAq+QcztCDX/zg4tG/pY2WTS9rP9MD7mDctWmXMgvZcVy
 2IkczS4gLtKuqMl97jSKb7c9OBv2P4Z/7ynZ9DbkPc6RBbB6byP319uHpytw0X7VwBFKxvdP9ib
 JPzl8XNTfw4LxjDuOvCJvDqT9uid3CwkalddH44+F7NnlbLS5oH0ttfoSSLREhp6uSZHLJIikCN
 XVhkGK+F8MK+BgPR6ZQ==
X-Proofpoint-ORIG-GUID: vVJL5hNGqW1BGbMyy9dCFHBtw47InPYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060118



On 4/5/2026 1:09 AM, Dmitry Baryshkov wrote:
> On Sat, Apr 04, 2026 at 04:15:54PM +0530, Umang Chheda wrote:
>>
>>
>> On 4/4/2026 1:58 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
>>>> Hello Dmitry,
>>>>
>>>> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
>>>>>> Introduce bindings for the monaco-evk-ac IoT board, which is
>>>>>> based on the monaco-ac (QCS8300-AC) SoC variant.
>>>>>
>>>>> If it is a different SoC SKU, should it be reflected in the SoC compat
>>>>> strings?
>>>>
>>>> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
>>>> -- All IP blocks and bindings remain identical from S/W PoV, Hence
>>>> haven't included the SoC SKU in the SoC compat strings.
>>>>
>>>> Hope this is okay ? Your view on this ?
>>>
>>> You are descibing -AC as the main difference between the kits, but then
>>> you say that -AC doesn't bring new software interfaces. What is the
>>> difference then between monako-evk and the -ac variant?
>>>
>>
>> The major difference between monaco-evk and monaco-ac-evk boards is that
>> of power grid. monaco-evk requires 4 PMICs (2x PM8650AU + Maxim MAX20018
>> + TI TPS6594) to support higher power requirements of monaco-AA variant
>> of SoC which supports upto 40 TOPS of NPU - whereas this board
>> "monaco-ac-evk" supports 20 TOPS of NPU and has lesser power
>> requirements hence 2 PMICs suffice the power requirements (2x PM8650AU).
> 
> Is that the only difference? Is the PCB the same? Should we have a
> single common file for those two variants?

Yes, the major differences b/w 2 boards are:
1. Monaco-AA version of SoC in monaco-evk v/s Monaco-AC version of SoC
in monaco-ac-evk board.
2. 4 PMICs (2x PM8650AU + Maxim MAX20018 + TI TPS6594) in monaco-evk
board v/s 2 PMICs (2x PM8650AU) in monaco-ac-evk board.

PCB is different for both of the boards.

Can I restructure as below to avoid code duplication ?

"monaco-evk-common.dtsi" --> This will add/enable all the common
peripherals of monaco-evk and monaco-ac-evk.

monaco-evk.dts --> Include "monaco-evk-common.dtsi" and enable
monaco-evk specific changes.

monaco-ac-evk.dts --> Include "monaco-evk-common.dtsi" and enable
monaco-ac specific changes

Does the above file re-structuring looks good ?

> 
>>
>>
>>> Also, from the naming point of view, it is monako-ac-evk, not the other
>>> way.
>>
>> Ack, will change this to "monaco-ac-evk" in the next version.
>>
>> Also, should I change DT name "monaco-ac-sku.dts" instead of current
>> "monaco-evk-ac-sku" ?
> 
> monako-ac-evk.dtsi.
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> index ca880c105f3b..c76365a89687 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>>> @@ -918,6 +918,7 @@ properties:
>>>>>>            - enum:
>>>>>>                - arduino,monza
>>>>>>                - qcom,monaco-evk
>>>>>> +              - qcom,monaco-evk-ac
>>>>>>                - qcom,qcs8300-ride
>>>>>>            - const: qcom,qcs8300
>>>>>>  
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>> Thanks,
>>>> Umang
>>>
>>
>> Thanks,
>> Umang
>>
>>
> 

Thanks,
Umang

