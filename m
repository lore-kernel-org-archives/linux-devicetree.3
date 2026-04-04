Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BE161FFE
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775299563; cv=none; b=fldFIWZWOxII7kbOEyg95W4qnzg1JNnhhKHlM/80JPZS3L5OdPS/15hfln3DJkKVjZNhcaRpM93Th15vY51iP7CZ2ymGqp0IVbyUkmK5SkYstsg4nbfTS/kebIN52wYmjeMJ996EY8FREP0CjZgtLntzmDToJTkGcMxrT0xqtVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775299563; c=relaxed/simple;
	bh=aYrePvcUXovVni1iKaDN/7closkAZNMqTpAbBEJxOfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eW7azpFk0cB0FvauFs4nUdDo3taLgzzOvUx1U2jvRh7SakawuLVaWAiNC4dGjfac60/W5DQqMG8Xqp0fvVz9C+3Kn0e9AB+0TcEeviK63+lRvtsTMsEi7iMLPwmtmmB/ZLiAxK9fyexNm1khwbJIbKz7s2c4EkrlhrTPCEQFFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYkj0Mv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Arf8g6gg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYkj0Mv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Arf8g6gg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342pdE52197712
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 10:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nrB6L8Mc+M9ITuIoXIfhrZ7HpsY2bfsSBniy3AVQwQ=; b=TYkj0Mv3Nqq5yWGN
	e95H09u1INlnEd9yrD4q/HCLS7fC+ct2jX2gEO5mwHzpqrlOTZGX9pAA+KwP54M6
	KRbZbF0foqQOe1nDE4xRp4ZNA60hYCr7jSoNMvfzgMVmVNRwThV9FnywZMLS1DdL
	Xfz3t8z3m3Uy/XuVjPBuHTMNurBf+0Qbl89gwtzHES+z7X2+imNyEp5pyOF7Ygag
	rXFX2X9lwcrHs/OAszZ4i/PhXj6tIOiHlGh1EcxPfeBze+DgTIVBzq6/RhZ3lS6d
	V0Zjwkhan7QBVfmnWvzHn4QS9Vf61l8P0bjcHUmU649kNgEQHjAZcAqqr8mz7PN9
	TVNjFg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u8q6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 10:46:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b8fe7c71so8540555ad.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 03:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775299560; x=1775904360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6nrB6L8Mc+M9ITuIoXIfhrZ7HpsY2bfsSBniy3AVQwQ=;
        b=Arf8g6ggki60AiFhi2ATRojuIERmS3eBn/Jmq9Gb4GThKDAq1EK8gKXxfOsn6ku29M
         9DuDwjSIoaRbhhX8VlTBbPVtYoidXNZp2Ab47XPHMUp/OudMldwnWjdBQbhMazKq2XEK
         MOOkawA2vndSh1Vr9wgk5bvwKNqvV5fp2MTym1lUyYk1RZVpd/Ik+gCYD0Bn+RqZBBPi
         NOV6e1FSqIK28xelz1KF3kJxP2k4A/9T+mrbMqdTcgnsELlbd6G3PpUVblZYCenEssr3
         zNwdaUy4NFkxQbkT2XcIU2mG/H/Y+7kte5VOK8G+6aqbPV1FDad3n80Q94huYcnpgy4z
         DlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775299560; x=1775904360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nrB6L8Mc+M9ITuIoXIfhrZ7HpsY2bfsSBniy3AVQwQ=;
        b=kYIZYC8E1dGNQrSm9Swm7I5VOeIE3rHqEO708HapGcVWadAPs6KZ6s2I8f00gsiBKS
         1sniPJBNk1vlKazESq7+aaKyVCmYccsSAQusmUIrHr9ce8Jlh3d2oo+vhHWSzUqKydUY
         uJ3AgAtWCxKgGCtOGdU3QIam/97KKzI/a8iX4lFiDNMOdDJ1toXdJEjLTB0R85zsFSZ6
         Iyl3af8KGn5rDV54HR+9vBZ+j33W5oNMXEtnVYGZMB01n9xHcwmc3Vc8KNOd1mv0Kue6
         aWEVpOiUskcS/PfpHo5GxAUq9S/qm50r5uDwtFi0s1Vp5NLCzXNcYK5JD+l8TVfDTX/u
         Eq6A==
X-Forwarded-Encrypted: i=1; AJvYcCWNAySM8K94YWUSqWRxrzfpQY5DU4vqm5gtA3f7EAZt1qVdRTl63F6H5bVFlU755MfUXaNl+00EbWqx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4LlWvE7dqdi0G1mRzA39b4TzIg03b+tYnvXvEzNf1WpXhaqib
	uV1HK3gCb24X4UV1TW1P//SaIrtxApJsCYUZ1rJnNqiznXp0OYQmeAsxsvChlGeQuGUilbRn8fI
	4oL7ijIAYq+U5Qv4qo06qHOmbNE9BPGrA3qpVAyE1ijzMIgFzsizBDOGiv3JDOnZ2
X-Gm-Gg: AeBDieuc1mno2FziYy8jwlTWKUY4Qxh/v/9xwHgeC2Ih8WQlfx2PVze7tsLbb+4v/Uu
	wB6d1QRC/+icHesHKO5To1ijFKT+PfMk/5PJUl03rF5R/OvoubHNIadmT4OgSTu5fFnpYbf9z7z
	O2d9zLc0EUK+s1Ho4VW7Sow87YkoyE8KMt6FswWEktUObrq8PusKtSbGuqOEg6Aq74056urVKz0
	XUTuUWjnok6DCThAuoAOMZlog4vcLT7JO/3tsz1ZSws7PFz3GNokLGQDshiycO3Oc5I4cKqs4JZ
	VkNR2iK652aIqCdyrzAqPMtuq+ONTHwllp1vf55z8GJkp+n9M4EyAVfWsN0eDP5DS+3zdbQdhC3
	UOUm+gat6E0bqUPJJ7Dy4gs3TNmzvQijQr08RAWyTxulYBfKndQ==
X-Received: by 2002:a17:902:da2d:b0:2b2:67ca:5ffa with SMTP id d9443c01a7336-2b2815d8057mr36572315ad.0.1775299560360;
        Sat, 04 Apr 2026 03:46:00 -0700 (PDT)
X-Received: by 2002:a17:902:da2d:b0:2b2:67ca:5ffa with SMTP id d9443c01a7336-2b2815d8057mr36572185ad.0.1775299559862;
        Sat, 04 Apr 2026 03:45:59 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d20bsm83780095ad.16.2026.04.04.03.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 03:45:59 -0700 (PDT)
Message-ID: <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 16:15:54 +0530
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
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5OCBTYWx0ZWRfX3onIn7MpeFIz
 rX99H2otzisMc6g+CgcdmqzDzFMdVUPGXOj0gai3nAF1nLkcevCpNPFqq311YoKbHeMxmTlPN74
 VZzijSg0TBWZaYE+JN81P+RR7sPRhFCwfviHwyY3pBPVBYDrhRyfVx74ASfLcRzY30VLS9saT/c
 6wHiWVl1V8IaCy/YrHkvWe3pnD8ZSl4lJm7hJcQfrkDmo/ITSd0ow2aakntfqNn/ZnsKlMkIS/T
 J/cnfAW4mRfOBENc627JQnI0kl6cUVdCaHnJ46jnxQfS0bzQUI6fVfHXAAWqpvO5Jvvi4AEjt7I
 ihUeX9L3NsueeO+8coKsd4Jd0O2GC2+GiqMCGlc9koX2YAMJ6nnCwjq4YSEdm6z6G+/jB/DPDkI
 lPiROXT25wE+S+2RJZOUQ9CIE7UbJXvb4WRRwKvs49nk/MktopDh6WRsfch7GgA8aBeLxWhIvQU
 q3qjU45UY97Q/AbWzdw==
X-Proofpoint-GUID: LN-uyPMs3EDXQHMuV2LgEuzb71tDQSCG
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d0ebe9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tEkBMu-lKGZmCQ_eyYMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LN-uyPMs3EDXQHMuV2LgEuzb71tDQSCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040098



On 4/4/2026 1:58 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
>> Hello Dmitry,
>>
>> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
>>> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
>>>> Introduce bindings for the monaco-evk-ac IoT board, which is
>>>> based on the monaco-ac (QCS8300-AC) SoC variant.
>>>
>>> If it is a different SoC SKU, should it be reflected in the SoC compat
>>> strings?
>>
>> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
>> -- All IP blocks and bindings remain identical from S/W PoV, Hence
>> haven't included the SoC SKU in the SoC compat strings.
>>
>> Hope this is okay ? Your view on this ?
> 
> You are descibing -AC as the main difference between the kits, but then
> you say that -AC doesn't bring new software interfaces. What is the
> difference then between monako-evk and the -ac variant?
> 

The major difference between monaco-evk and monaco-ac-evk boards is that
of power grid. monaco-evk requires 4 PMICs (2x PM8650AU + Maxim MAX20018
+ TI TPS6594) to support higher power requirements of monaco-AA variant
of SoC which supports upto 40 TOPS of NPU - whereas this board
"monaco-ac-evk" supports 20 TOPS of NPU and has lesser power
requirements hence 2 PMICs suffice the power requirements (2x PM8650AU).


> Also, from the naming point of view, it is monako-ac-evk, not the other
> way.

Ack, will change this to "monaco-ac-evk" in the next version.

Also, should I change DT name "monaco-ac-sku.dts" instead of current
"monaco-evk-ac-sku" ?

> 
>>
>>>
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index ca880c105f3b..c76365a89687 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -918,6 +918,7 @@ properties:
>>>>            - enum:
>>>>                - arduino,monza
>>>>                - qcom,monaco-evk
>>>> +              - qcom,monaco-evk-ac
>>>>                - qcom,qcs8300-ride
>>>>            - const: qcom,qcs8300
>>>>  
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> Thanks,
>> Umang
> 

Thanks,
Umang


