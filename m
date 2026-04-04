Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCFC242D7B
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775301141; cv=none; b=Ctg1AhzTJ2no/8ppkCAtlD3GAzr07Pcj4lOYJVs6Uiq1JEOWiUaPg/WNcTytLcwJ8UW+Kbb9PZFlqvfe9iJ/vX+sdiHlnTS3ypkRn2azCQfo+0Rs/vXHY2JiCzBbPZnIpefXIXTPLW9c2TH4fyRgCOZs4Jhl/B082COxiKrJYJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775301141; c=relaxed/simple;
	bh=mXekBaB1qM5gOTF1FRrBKh6IOgESVsx4OdgPuLzjj1I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HwQ4k22ydKsFZMalN28/VVPPeTPxN5mkO5wjywgIHqIJ3JMptmii4cypxWNNdELyyYjbfX3uSBGIVCraDMNvJz+/4/8CBzmEbnAdMrTfZlZfK5ezSbGKrLrxFTlGAf5XAbg5o972NRc7dZgLJU2Bc+nIHDt4LfOQoY2oGprFU6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5wkKuKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxFUgG5y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5wkKuKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxFUgG5y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340JabC1309160
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 11:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO1GETQlg9DOXLPvkbjZAxLrjFhhCUrHOA72WOIr95A=; b=e5wkKuKPP7I7sjqA
	EwWQgW9L+3406lL9+S7a96BhJO2zZk4eqG7zlBU4uUIFh2v42oQv/G7DBw+xrjbJ
	4v8N0MKXCS+rECsirT2CYG8c5qhDVQRfTqeDuYtnw5GQ5APmmu6Yei5ymIHPdyUr
	S+hkBd7HASWk4ifOdYOS9AHNcl6sVBLnlrcnY2vydX2y/4ENAx7bRxjngjPVKdjp
	KuiY4IDduEqBjilSgFYBZWGAjx96GLaReSBzzzuIjNfpRyas0QVXMqHb8R9rpXoI
	/WPzRpkIcfjkO9pL4eTY5DPjeScPG2CjQXUEBK30GDgTa8pT5BY5h9y/jlNpZlSK
	U6WO2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mgx56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 11:12:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23eb4f94fso13852335ad.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775301138; x=1775905938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CO1GETQlg9DOXLPvkbjZAxLrjFhhCUrHOA72WOIr95A=;
        b=DxFUgG5yML0/N8rciR17NquKejEO+jAVgKfGuKI51ilcNjw433AKS98ydy1GUzk9Sx
         h2VJRCEQ9HLsOJoPJGFAm/XMErxwEjevxS/NxgSaOhZkKpwR8qgr08RTi5PvLO/JxKt6
         p3o2Ft3UgRNF/CkrGDRqwyBzRWldFRlDFnLVTZrEjnFbbEY1jLMybm0xATDG/eo0VTIh
         RdLjxD45DdAc7z1dqlN+eOzDTlAw5pkuP45LNCa96KHJhlJW7WisZWmyyl6gUI2QLsyC
         scwB2G9gUcQ1jfTS2PYvERsa/wFQF6yzNKKwYNa4RgQofsV+Sf7Wr3n88P/TkatMHFxt
         bxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775301138; x=1775905938;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CO1GETQlg9DOXLPvkbjZAxLrjFhhCUrHOA72WOIr95A=;
        b=hTr7cpc0sw6h94j0I5sPrJKOF1LgVuF1dTplbgmM3e0OAodQvZr74fh9z7asFm4lT6
         ILEvT+zrwRxGXcSRlbTU3pwFFx9Y16DUxRbjZ9cTy6gVxIb/8WYqUZYeUziog3BsJ4vb
         t9DwTYPUDiEDsnIoaoQO4gJrKUn3Jo4b/HYpGX08oYUWt1shQqXxJlXX14ewvcrbLYxf
         ZyNS954gl2jbZ+7YakswyS68+5xGPzkdVUVQE3nwJ3xwS80bQeLGgUPioXKUDf96hIxh
         3XUVde/Jgv+5BOl+y9FNWk0Lm6qpfC6dUoii6YcVKGGihMpyxbP9CyjWuQldaPPX61Bd
         tzvA==
X-Forwarded-Encrypted: i=1; AJvYcCVgA0mIRKBW9bJoPjKIh91P8NmQ1XhjirfZYdrfVo9FLwcw6ctRpnJWvm1Nwa/U8SSIxvaI3/OoXeqW@vger.kernel.org
X-Gm-Message-State: AOJu0YzzC3umfxfluFjgpMObS3ez6CrmnPNeWbtEAGmOzNhzoIu1RMYe
	ye7+lfnRBXK8iWRt7DNYFHrl5NkAi2krFibvPd/t53JKHftqBdOJbBOfm5Uuioo3CyUO672zAEa
	ssPo+lSBZkJ6+t/jdjJQtxnWhSp6Jed3NFDMFXgEMMO3f4S4ZgaoAntC0tP+FXbI6
X-Gm-Gg: AeBDiesJKZ2NYQZlcUZJCBguwrdkSYf/ujv1c1YEQE8BNPud5vJORBSP5lMV76NAKbX
	SH2fBUqxONmAJ8nwM05TXrwn/I2m+LN+q9J1zfRul+PsePf/fbwlFFJ/Qed03jFz/pywJon/xqO
	UQDOSAedr39Yaoknz/zLKAouzq1noUgN7pcNqvo2JzakbdTQ5fQXoy5owBp1Oe/UR6NR+w20qdb
	J6qjTWvr1u5EQuJT+jDRLM78dWvhz2WBgzoe7JJaw/RdtMOJ7Bd9EcDNUJShnzl0zMtUJzlJEF5
	Sm80om6ppxgiRnCr7KpRfyiujM9NRjHMeSICWwymamKJs2CN0cJWHEQK+q84jdgwiffVZ9RuIrN
	yzEADXcbllWdRicY3XvM1Q4IPnheXe8SiCMpWnxY4Pc2lFA9zOg==
X-Received: by 2002:a17:90b:3952:b0:35b:a94d:7ad2 with SMTP id 98e67ed59e1d1-35de69d7ef8mr3317090a91.5.1775301137588;
        Sat, 04 Apr 2026 04:12:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3952:b0:35b:a94d:7ad2 with SMTP id 98e67ed59e1d1-35de69d7ef8mr3317074a91.5.1775301137108;
        Sat, 04 Apr 2026 04:12:17 -0700 (PDT)
Received: from [10.218.41.33] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe93661fsm13739329a91.11.2026.04.04.04.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 04:12:16 -0700 (PDT)
Message-ID: <04c0949e-269c-4faa-8a7f-cef902d54fc1@oss.qualcomm.com>
Date: Sat, 4 Apr 2026 16:42:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        umang.chheda@oss.qualcomm.com
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
 <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
 <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4d32e86f-353c-4951-89ca-46aa49d60f76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dsTcDRSKDt_bEKsFR13AbcrTMrcQ3baQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDEwMiBTYWx0ZWRfX/SSUSs+mddb9
 AnpMhZwpGU1WtCmMN+vvVJZPGHojSeWFVa1FhGyoPcaDrsmilboH9Nx6jalf4rq0fG2xTNZ7E26
 erTgVJ+Pcgk88UgJftPfw+6T9x2Z9kNjdDTJ2cnamTceF6RFZ313/jikpYcG/FCoP0jYGwRcnS5
 V6dWF5nw+SIhspO2ckUwYsyZneP+MXn4XssORptMeMnk4nhQ6NOLhW7JAGvlXNQJfJU7uxAPv/Y
 7Lgl/I0kjb2EpVDPmED5SBFabdaOOoUF2yiWkNKqyo858VJUUeVj6d/pdQY81PTRttOjiiAsJiy
 KH5fn+JtDmH5DkZ7JxpWQ8ClbKl9Rr3E1g4vzNTbNFTCKajIbytnaTv+KzZztWEgXvRig5eZBHO
 j7FC4RmoDmSrCFd6NAYw6jtRdrGyZ92Jm2FeEBYmy7Rq3dorF2ao1kK4mAKWHG+BfhFYoq9VAm1
 WO7hOeAMZi8ViC4lI/g==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d0f212 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=v7fjIr1oppM-PfoO_ygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: dsTcDRSKDt_bEKsFR13AbcrTMrcQ3baQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040102



On 4/4/2026 4:15 PM, Umang Chheda wrote:
> 
> 
> On 4/4/2026 1:58 AM, Dmitry Baryshkov wrote:
>> On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
>>> Hello Dmitry,
>>>
>>> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
>>>>> Introduce bindings for the monaco-evk-ac IoT board, which is
>>>>> based on the monaco-ac (QCS8300-AC) SoC variant.
>>>>
>>>> If it is a different SoC SKU, should it be reflected in the SoC compat
>>>> strings?
>>>
>>> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
>>> -- All IP blocks and bindings remain identical from S/W PoV, Hence
>>> haven't included the SoC SKU in the SoC compat strings.
>>>
>>> Hope this is okay ? Your view on this ?
>>
>> You are descibing -AC as the main difference between the kits, but then
>> you say that -AC doesn't bring new software interfaces. What is the
>> difference then between monako-evk and the -ac variant?
>>
> 
> The major difference between monaco-evk and monaco-ac-evk boards is that
> of power grid. monaco-evk requires 4 PMICs (2x PM8650AU + Maxim MAX20018
> + TI TPS6594) to support higher power requirements of monaco-AA variant
> of SoC which supports upto 40 TOPS of NPU - whereas this board
> "monaco-ac-evk" supports 20 TOPS of NPU and has lesser power
> requirements hence 2 PMICs suffice the power requirements (2x PM8650AU).
> 
> 
>> Also, from the naming point of view, it is monako-ac-evk, not the other
>> way.
> 
> Ack, will change this to "monaco-ac-evk" in the next version.
> 
> Also, should I change DT name "monaco-ac-evk.dts" instead of current
> "monaco-evk-ac-sku" ?

Corrected Typo -  I meant change DT name to "monaco-ac-evk.dts" and drop
"sku" from the DT name as well ?

> 
>>
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> index ca880c105f3b..c76365a89687 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> @@ -918,6 +918,7 @@ properties:
>>>>>            - enum:
>>>>>                - arduino,monza
>>>>>                - qcom,monaco-evk
>>>>> +              - qcom,monaco-evk-ac
>>>>>                - qcom,qcs8300-ride
>>>>>            - const: qcom,qcs8300
>>>>>  
>>>>>
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>
>>>
>>> Thanks,
>>> Umang
>>
> 
> Thanks,
> Umang

Thanks,
Umang
> 
> 

