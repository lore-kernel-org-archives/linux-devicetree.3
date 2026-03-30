Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE43B47FC
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867867; cv=none; b=p5fHOQvAI9t3sztD0r5J5iivDny8TJ4EN9X+T8tsXbmRoeGMz1AffSDG1LZtxWKFZrubO/NvR40NJrxjYkLM5VbJt7vKT8oT1iwqaAPLblEcbWqKNpoEjrCl09FSOJAmqLLyj0jSk9p4Co9B4BrdZdOEhJq2OZNRZuxNB39FsNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867867; c=relaxed/simple;
	bh=wbcyihjFlyN9mqdx4783130Vxodq5gYXBasSmJ7dDqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDDDQBdYelSkxTPzZwV3zFPQkgjFSniv2O8IaBFCmP7a6ZGRswEbqqVIgTk4VwjQOb6sM2j/6ErglWlNrTRxOTNVINGkEcBdqzY7tsfcTKlTESZMxiWfMTLwI25WAYcjmEyCIvQPA/h4ZGBkqAKNt23TFBrRyoprZW4ZapioXsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWr2piE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJ4vcTpT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XWr2piE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJ4vcTpT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7cce3539570
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JSZkl2nL5DjYrxRUDtrQc33kVMK5sDedSsOKDfU4Q4=; b=XWr2piE18OkHMc1G
	lf0UTSfqz4JaJJax/IMRThC/f6nl2X/jhIrsOCwPsqiu/fZzcim8PeuNZG5zxx4e
	vL6I31S6b2HOA58aDo32DU3tG4lqWPXLIX+zwyPd+Pda45RFjUV5EGHkzUVmmpX8
	37jh7J8e9AIb8tNtAe1WhMguca+osg2LFUdF9Gnbv9Mve8rN/1f4pbFrmwp2bLz4
	22KUr/AGXK+e3cFr/v7hpKF3GEne4Aug7T4t6F8xV8oRCNUnGvk8AHzGs6xIigrt
	faP1uUke/eqaCHMhhFFreM+hpnuXIXf68FLL1T+o5OxDHPkmyEraU4O2hl/spSML
	H/0Hiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59r510-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:51:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso147938785a.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867863; x=1775472663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JSZkl2nL5DjYrxRUDtrQc33kVMK5sDedSsOKDfU4Q4=;
        b=AJ4vcTpTStGiXKOvu7ZxE56Lg9ZlxGR1C5jX1aQuNNwNiGwbzOW/U4DgubCeyRe5Sq
         Gr8hURnRdza2zFHn7Pu9qTg9imNnxxB7bD5iPkWHjCnVVzdmhAIoFdodTokxY/daEQe1
         WU5lVaAjihYbwacHlzL94qNXpN2GLML/aU4fSN05GQXaBdAcgB2JrWFX8Deor7jGs7+H
         cRMfhHQjX5fe/D7svEyJ3sFUvwTyS3AHBca3LBJiOs+0rmjzCrCcLAYCO8NSUncRt39V
         HQ6qPOJhXc67VQfQZmG0ce1/UHy/+JAeeBrHPeHdSPiGk3vAknZ9ST//85+4wSkaHcuv
         jolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867863; x=1775472663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JSZkl2nL5DjYrxRUDtrQc33kVMK5sDedSsOKDfU4Q4=;
        b=XtrMPhp7wdpjYTZeXNUvaH51PkhDAOHz1PG9WCmeNaaF1qn+IDlZ+G7o/FmM8iZcYi
         2xTCCgNIZtZb20IjZyh0Xfe29K/9wogOA4IAAZbLIwVL4igdy6CCSG7InqsZwUvbZJYn
         3oFw84flXrU2Z3yTwTmk07Tx/68jmS/RNgM6fseairRCkdJafMeoLRmkNx9s62kbAKpB
         l3jiXZ+m0S0ukDttfT/EM3GMcaCq6Do6+pyOLKtqy69AX35Qhu4PEPFBLZpwEb3eCSaX
         VZdoaTzgkS4BabVVqgiR0R8vL1+/FouluorXJrkg3prQGz16xInC2zcyQOr4CA74+doY
         qDfg==
X-Forwarded-Encrypted: i=1; AJvYcCXEcWEFnEJxJLHaG3Y4nEVetFSlaqnAzfcNIqQwXT6Bl2/+kSabeZvoeOguLpC2kRtlXjyLlmQSSfVe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl5iFUpfzLH5YArDG+rZEIwbs7SEigHgwS1TJmqFqRL4LFAXA5
	6pJCoRkt5rtxTmJCC5fBO/UwtnoHaJ3I3d4Ux08RJvxex/lUTL7f3Q45ppOlM8EiY4Fwit53dtp
	CIqr4EWhK8U3sqgO6oEhIB7h2Qaas8rTpNjkfRLP/fzNJAFyuRfQqmoVXii7slv38
X-Gm-Gg: ATEYQzwETH1QZDokVx9DBJ54BI4b4OY6iKFZbdsFIdqrtpaq3S76iFDRJ3xUD8SwXkg
	pkC6REq9ZfA54aUvov3DEDuG5Rv21HZSlPCLrYrnNYYihHV/6QOep35DcCyLdBgkVq0TeiWJwzS
	2JJB0UFPt13p5GJXNeHC32qbShIgztLrCPb/6bNHO3wCEBJsk1TgjR07RDc98JZN9fVxgbVZRLK
	n2SNf5NR72Go+u/RYuUPtcfJT98NEbqpa93SuEZ85R3t7rUukYHl63+vNichiQ5V5ADcpQMQVMQ
	IJCBZsa1u/aDypOzMLTHBFckQHOUiWWtvq6KnbSZQheJ79sgd9XqedFlKMg0dCMCJ600J/HEwID
	OojQzDjg0dB5oYYu7nKjMjrSeP90LY3CKuggWVWCwkpZFa9FVT/sTdEy79Vee2ve7Br6bCRYDg0
	vCsnU=
X-Received: by 2002:a05:620a:170d:b0:8cf:d05d:c838 with SMTP id af79cd13be357-8d01c6111cemr1049996085a.2.1774867863159;
        Mon, 30 Mar 2026 03:51:03 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:8cf:d05d:c838 with SMTP id af79cd13be357-8d01c6111cemr1049995185a.2.1774867862744;
        Mon, 30 Mar 2026 03:51:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c074f0a49sm388824a12.1.2026.03.30.03.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:51:01 -0700 (PDT)
Message-ID: <d2fb3b02-d4d2-4bf2-82a0-3432c3c3404f@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:50:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
 <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
 <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vxYoXwGtaZXp38rGWO0oOWMFKFKoGZ4v
X-Proofpoint-GUID: vxYoXwGtaZXp38rGWO0oOWMFKFKoGZ4v
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca5598 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q8wc4JZ8Ynh5jDcX9IoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NSBTYWx0ZWRfXxkASW50gZaQh
 AWrvIJKVHw8UopLXbZRC7VNycz0U/78g7L2J9biOutRYpvRuLgs+0QFZ5GNipGmdPztgZ+TU5CW
 /9p92VPgbX/pxrv2GHXIYVvCeGF4PqiYpkDDhJYvHpaCPHeVRZVhKrGGgW/r8Vb3rP8PGj2wy/x
 nNc0ViWgcZeVHtCGBmBRL//JQnE5SD3LfwBbBIhYMIQhGxw/Ox5fL9/kl+LbL1tocr35LGKgpAu
 GKH8PuO3u8TzbR6DkjlQNJiHiskj1ClXPXIAwcYMPydmWYX5qPgHjiMgzWDjAaFGLMvdp8naRci
 XDV4aDOkvXINPIqUt7kdqZ90QcFH0Pwd4yvnIOIuZIOVcGpxT07pDWj69GNElimeNszseJkf7xG
 Wk2N8bdkYQAH0m5hALw22KV1w7UOmYof1zex2KJCDop7dWFS3i6A9owzv8rMvEm9MzNaNwAiLUt
 PoIowKtvk5MODj8OxgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300085

On 3/30/26 10:38 AM, Srinivas Kandagatla wrote:
> On 3/27/26 1:10 PM, Konrad Dybcio wrote:
>> On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
>>> For some reason we ended up adding only 4 out of 11 compute cb's for
>>> CDSP, add the missing compute cb. This will also improve the end
>>> user-experience by enabling running multiple AI usecases in parallel.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> index 10e799dd4a78..38fbd44c7d8f 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>>>  							 <&apps_smmu 0x1964 0x0400>;
>>>  						dma-coherent;
>>>  					};
>>> +
>>> +					compute-cb@5 {
>>> +						compatible = "qcom,fastrpc-compute-cb";
>>> +						reg = <5>;
>>> +						iommus = <&apps_smmu 0x19c5 0x0400>;
>>
>> I see that the other CBs have 2 iommu streams, the other one
>> having "DMA" in the name - could you shed some light on that?
> 
> AFAIU, These DMA streams are relevant when NPU dma engine is in the
> picture, examples can be data pipelines which involve transferring data
> buffers(in/out) in-cordination with different IP blocks outside DSP. May
> be something like camera/video streams directly to NPU without CPU
> involving...
> 
> Personally I have not tested such usecases, but for upstream fastrpc
> clients AFAIK only application streams matter as clients will explicitly
> allocate the data buffers, even for sharing across ip-blocks.

This would be nice to confirm somewhere, perhaps even denote in bindings

+Ekansh could you confirm/speak more about this?
+Dmitry for awareness

Konrad
