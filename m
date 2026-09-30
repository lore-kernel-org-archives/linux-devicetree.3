Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3224C9E0B
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771831; cv=none; b=nF2wAD7WkxrqpxQsnTDe+ugVtgq0NNrOPRDC8YYs79dt2HWlC8rbo3rVV3oeZGLlr5hWLbnmMWqOebjDOM9qiGGBHItYDyM7jMb8cJ2Qldz5G9341qvyenbAtcczoWZcdI3A7sSAAL1OZTXEZIj6H5Ka927fSJlhvOAlZndoK40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771831; c=relaxed/simple;
	bh=u3FP4394F5WeOzXMgeTc0izd67r1yUkSSChegsp9gSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDrt1gdvvLOwuWFSSce2iDeSBK3LJX2zQA3qVJcTuH/DqoRPwDbQciqzdDq9+/vxKKXuFVqdtcRGvmptty4ZtJeP8Gg56DqD+q0nPvn6Q9pTwU7wLxsgC3rncrryLvBq+yeGGkG7AKvbcVErwVzBPlD1JguENUFItpnYbOMxbjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp+OC0ff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9j6Wyy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp+OC0ff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9j6Wyy5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7bHb3135721
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR1pxcm93dXVjoCVwNe8cAwUkjwrpYKoF5JTMsrsvYY=; b=Jp+OC0ffgWmb05Ok
	DwUbVD9KvFLD9T8wCmeGszFRIvkgwyugnGTdMgN6n+LRmI/eNd6OjPtFZ8aS2Ek+
	/s5ebp9fDmYtbvxfWvbUpjEWGNo1n36FVwM5n/g8KCYkfF0J+Q+qYLQdpB/nQtNg
	Cf8EPmlfTqS6H9iKeqvI7gx7yb4+g4gqn7kQyMt8yrlBVGZiqeReYU/pSpjBnNAm
	bgn3+yqg31O25MKFTjuDICrMnkqDuGKnqVAHQQ+Bd0DvxgFZ26MZ31GTUJEn7buU
	AA/fkt2liss00X+yNA2DnXpYSzPUlIY8KelGr6AaHVTqcgH7LwOnMpWKy753w7eh
	XrakFw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27hc4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:37:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88679c4f94cso990133b3a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790771744; x=1791376544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR1pxcm93dXVjoCVwNe8cAwUkjwrpYKoF5JTMsrsvYY=;
        b=f9j6Wyy52CzGLfz7QBdPHqAxQHTAwVnEzSVMws4OMSaZ3khlQmLtoYVVTM9r553feP
         NaF0bTgd16cx3QUPfV0VrpgOKScXFwmlc+byO6oUcXHTuvpVmsBJELhQjjtcbJt0t9OD
         ZTHmPCrEdnAYDWwHhR4iwOSwXDtl28RnmXuyeGN6vHh9CKIa15YSL0cjQq7ZBDQprEP4
         loQhDl1Iklvwocgop1JHwRTvmZTEI33zAeBOjR2oo8jWJpjwByZiM9Of82tI0wDKde7T
         GeOZdk9Eu3QUd+6TIfgDjA24eS0XlPsXkN3eoYVf/72DPiGh4jl2Air6iwxnzwtxAOEk
         C1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771744; x=1791376544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YR1pxcm93dXVjoCVwNe8cAwUkjwrpYKoF5JTMsrsvYY=;
        b=M8qEq0FwgNpW24hc9RqcjRy6ZsMfJgLGPVMOfStSmBOKLan1CBlroO+u4STYw2mdgJ
         vVY1YeTxRoryHb+kSlf7NaQSWA2Z92mFgTAOwJjBnnP8e8z+iyDjQzPMLxq0BxnBfxwh
         R/fQAmwxm9T3Ol3hBpC4VoB829xVrkOqOyEauSL2XbWv2qcTw6uJxAYAeDb7iJdORMh/
         4mJfwy408knt5S7au95atcOdsrxwebjqU3OfvyntbVif1d4SzJAAidT6vGEpWCzbMBxT
         IkVZS5X7NGV9shgHUCumZaAmSTA/7NJEgViH7VVhPr8KP0Jg3xjtVjsU0A28vQrItg5k
         Povg==
X-Forwarded-Encrypted: i=1; AKwUvBw1zHio5/egiSsXcQGG6CmvHiwozXXT1Hw/M9xYTRM6d6LJLaRRon+8HBOAYdlJx2qwnsREbncXXdDj@vger.kernel.org
X-Gm-Message-State: AFuF++mSu/xk3Yih3v5Qf6piE71z8uJ21zc9ZkIRvpFbXkHz34ToImlP
	25aUTXW/MsFuDn90jcIVSgZtuv6WFC2E/8W5XZwaCjpPip05eOCUwYu1igNZJGPdX2Gfl/vkx4I
	Kw4YUmQhIVR4yp8c6xu2e/3X9rnjvZV43xdSx2W5h1IPaQ5kC3Hxvi01RpQbJTJ1c
X-Gm-Gg: AYBFou2sPPQKuHq4PuVWG+dm9lLoQmb4g/D6nGlGlAZs4ofG3FfYpNE2myohKaFkt2x
	B+fkl7ZpXcfe0KRGS4rMHcCS/1c34hfmLzEYr5lOw41djQqKvi96NgJ31ovhaSRcubPFpJjclTm
	FRNFyIwfxIlwYoLtPSxaBmqu/pyekCTCW6ZegqQHjSAH24Fq0xjHucdYF7aC72Xgat2eHCBCkLu
	tLvefTgZHGVhi5ygyAaEtjmqA3+toDwoLMtPkmdA9ibSn37R9qp3r8agxKbcayLsauqURjGJgHW
	Uo4o5tfrSFG647nxU7lIDOoL8k/SPi8O+TpYM5QdleuMR8KHkuwr2MAVJ5X7bBmUKp6zstrxo/R
	KtlYIR22SD5mDrIovYew6yuFHRr0=
X-Received: by 2002:a05:6a00:4188:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-8874a89aa56mr1031250b3a.15.1790771744334;
        Wed, 30 Sep 2026 05:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4188:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-8874a89aa56mr1031231b3a.15.1790771743825;
        Wed, 30 Sep 2026 05:35:43 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd76asm114029b3a.48.2026.09.30.05.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:35:43 -0700 (PDT)
Message-ID: <ab83f7d1-7165-47f3-afcd-6574ef5d9238@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:05:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Add watchdog node
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
 <20260929-sm8750-watchdog-v1-2-ea06d5dc7e54@oss.qualcomm.com>
 <20260929103912.C22291F00893@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260929103912.C22291F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX8b1VwzHrLsvF
 fK2Ef5SmB5Ptjee+fkYUyhYgS2vwufxvVG/I/xVkp92bb/iunY0nb5RlD5eSgiEA6Zkgg7L+GvZ
 HP2p74b1mK2fmNYqpzEWBP2fVxc+Zc8=
X-Proofpoint-GUID: iBm9DY4zn-Z8-YxuQoDOCn54HTJ1f74u
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd0270 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z0PHE49TrWTsZCah-ZsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX5tszwBMGFDkx
 LzNZzWcX1HOK84+lDYgDY3HFyab1Lf7QQHhZx8pfDmUmDfshoe9RgGGE1x0E+Nch/VwW9muQMxb
 8axRZ7wUJmYwBTZzss6erSf5vNQ5Rb7Hi2um+weUcGt3f6E7k0QvDOaJUWse5JMHE6FqO5vkrHN
 8bzAxU8iwsq/rnohGGjvyS4hbaF95uu5snbhuOjtsOGkGRGr/BAvmxW1NkOs5ie+4yf23acUykp
 E+Gjqu59C0t9EN88BOcNAvqhGJt1S2aWxmkrsUsI29E5rIiaMHb9ECHx40p7K1Sfa0e3iJZeflU
 UbZCstPDwlQg1gjutc/Q9tUYj3NvjB6uPui6T/jzEX0bvmFZiY1KrSVD+0WsJpibC+/xG0jMtpT
 o1e377VLm1prYItybJDw92lbUNDs/A8J6UcwarYldDIRI033aFWM4M+Xn/cuJetvqbhlq+wGJQN
 HhhxOe+DGGfF8VM+ggg==
X-Proofpoint-ORIG-GUID: iBm9DY4zn-Z8-YxuQoDOCn54HTJ1f74u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

On 9/29/2026 4:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt: incorrect node ordering in sm8750.dtsi
> --
>
> commit 807aba78b66c219c014d5a42b4b7964dbeb6b207
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: sm8750: Add watchdog node
>      
> This commit adds a device tree node for the watchdog on the SM8750 SoC.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 8ed5fa4d24fcd..53125e5dc4cca 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -6006,6 +6006,13 @@ cpucp_mbox: mailbox@16430000 {
>>   			#mbox-cells = <1>;
>>   		};
>>   
>> +		watchdog@16410000 {
>> +			compatible = "qcom,apss-wdt-sm8750", "qcom,kpss-wdt";
>> +			reg = <0x0 0x16410000 0x0 0x1000>;
>> +			clocks = <&sleep_clk>;
>> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>> +		};
>> +
> [Severity: Low]
> Does this placement break the ascending unit-address order convention for
> Device Tree files?
>
> The new watchdog@16410000 node is being placed immediately after the
> mailbox@16430000 node. Should this node be moved above the mailbox node to
> keep the children sorted numerically by their unit address?

I missed that. I will fix the node ordering in next version.

Thanks
Komal

>
>>   		apps_rsc: rsc@16500000 {
>>   			compatible = "qcom,rpmh-rsc";
>>   			reg = <0x0 0x16500000 0x0 0x10000>,

