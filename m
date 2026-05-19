Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65832293B5F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198821; cv=none; b=UaUVHiqlR/mZKgqmkjz4Oc/UCZ8n/Fgn8EPdt8BQSA7xnW0qhMdP8EYRRRaeNJ7sbAP+EY1GuLwX7iifn2b11s1Hs5oYNQNHHEpb9wENQYMpuoGQb4k3pb2awBhQBN2MD413/Px3Pyld66dxKSNRYFVeQAFWbTT04NBbA5+E2Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198821; c=relaxed/simple;
	bh=HNcI1kNzIGfM0x3r8RbKIKrdoY5+TDkvSLJtco1ZEO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbkOFudAwwAGDj+EE+kuolzY0xz8RtKQGe+Uhvpv/PdQQQmkw/G8OPUFQ1wPWo6xw7mhjuHRjailfeEek74VBXK9RZK2ZCpBGLxEGZsAypmDkaDePRfEP7gv9Ol/eTp31VGbNDe6oUfNdUaiXcpIt+gQJSJsoo9CfZmVQ0nQI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBxhJYGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJrQRc32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBxhJYGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJrQRc32"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCa9VY1396782
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHd/seu6GWeewtLPWuKEX1k3PpnC+gd0X961ojf5+Tc=; b=XBxhJYGQgHoNEFMl
	89KArmF0aZ/h9a2LoUeXhUrYySj9Y1oaF8J8BR7JC1ZWz8QTTHnSksW4EhBh4Jbx
	9OTdEZVwd735yccEBgkFaekYCtS0lESzk8YcOQAQsC/9J39+sSF5e87uI8Wwjj57
	weG/UlD/ZpTD8XudL+6M8ErVvAKzawCgqfi0PMvU7lFe+4+Av3jE/+PvpdH6A6Ce
	IQvAM7Sw8DTDoG63APSaxxA0faWxLTZU7ywBpi8xuezyMq9ggYz3s496JfVfVwsH
	QEchz1Y19grGgFYd87dOHI+0Ji4EMTLBAFW4t5lm/yMpWafVph5RTGdfcZiU5X1J
	Lvag9g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8r0q0axw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 13:53:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36641bb3d97so2162094a91.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779198818; x=1779803618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHd/seu6GWeewtLPWuKEX1k3PpnC+gd0X961ojf5+Tc=;
        b=RJrQRc32NXaansnrjr6KjIGI/+OIATs2GW3GW5IFQmg432KV4I98Uh7jqUnIvL35Vm
         dXB+cU+si9Vzs0Pmx+4FQwMbID9opJkvYDqYgiXw4y4TRYBKLlJmxXpgNeGBVzLf3X4z
         Gqn70lt+GO5HHcbeRDF8gOOfNEVFBbBaSygg7Vdh1n2LCehlLWQcNXPNXvVqsAlDqpXx
         8+HlBKxtG77s9c1jbgbkBmrbF0euBd42c+eLuXsTpfibSyEVK+r6NCfIuZaKFY5c5u6v
         i1Z15V8gct+w0cGd/ASsCYvLE/G8Gt4xnTt0/o2TshlWid5/E3rmGTPbJsknOIp+Dx3O
         eE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198818; x=1779803618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHd/seu6GWeewtLPWuKEX1k3PpnC+gd0X961ojf5+Tc=;
        b=psJtsbE4F77MIC78jWLNRPuW/NtP/tu55DgjiFzt/zXdYUHuuIYYdtvV8L63y6LcNP
         70NRFC/DNWDBKFzzcVoKD+dYwJq55D1J2QThc9v0sgKvYiRtyjQzaeYnO8VSoGoR9ZNd
         v7H53OotOpZTsB0zjYRXigyImRYZn1xIKGiZtpW0dA04JHLkLafkJoegLVoBf7IYbnnP
         7tSPOjmY2WLhWOEBN3GBX5ExN6K6mVKgKXyl0U2nqX2IbXQer+L2WHf6SK5ULzlrRt9d
         8YhHrLjfrssu8DTDCbG4gmHlBLMrQ/pu70BoVnH+F8X4bB2TrJ6sou3g2ViFU21OQaZ0
         YJmg==
X-Forwarded-Encrypted: i=1; AFNElJ+GzWadjFJ9wLCbU6KECXFquWTaNg+ARHPYFaurMW+qy5yWcFTmo49LCuzI28gmigheJaIHHEOYIUPf@vger.kernel.org
X-Gm-Message-State: AOJu0YzfuhFIG96CDIY0YO++BGyr1/xQW/ACOchskMO0UJZCD54hC7r9
	IWq49G45xetv0c3W9anN4YXKGMSSNO+StC2ZIe6LVN3IbcgWrvUDqrom3Duz2QegcL3IZKhNpo6
	DO2aBEJopPkzyhyJ36RTY37sc7aN0LNuwmvlla/HY/BAojLsR5gQg8OPrEh4FlT8U
X-Gm-Gg: Acq92OEHqUcV1+z/+rW7akFHx0AY1V70c8BW0/AckfBBckG7Mml0ZoOQPfASbGFGISc
	QitIdYn9pMCzte3/vz+6HhsN9MGQfgjcsPX5bVvc66aCRkcG6qiXf+lEWCbrR4qrW41D1nCsHh5
	pL5TD41VnJFIf0ubpuz4+YKY3fzv1rkUUKWClG0s1GJuj+YinEFpVfiNmMlXbN4YURqQLBkLzGT
	Car//CO4CsttIybQmOkqHmxvU87Oq7oG2wGk6ZlDuCuCPSQLIApufJ5MBFALHNjKFEmicRe2/64
	wErOTlFhyE8cpR4RNEAQ2jbMy2A77cCkMgmKxjkI1U3pc6obDqcJzcNMYR3wjmw5E1607SImYP+
	wSpNkZiHSAtgy+7/zClbhgMU5C0HJ4PWr1dxpabJezd5D2Fqk
X-Received: by 2002:a17:90b:3505:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-36951ca7638mr19545341a91.24.1779198817956;
        Tue, 19 May 2026 06:53:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3505:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-36951ca7638mr19545289a91.24.1779198817413;
        Tue, 19 May 2026 06:53:37 -0700 (PDT)
Received: from [10.219.56.98] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c4bb4d4dsm3568780a91.1.2026.05.19.06.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 06:53:37 -0700 (PDT)
Message-ID: <a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:23:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iommu: arm,smmu: Document optional
 interconnects property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
 <20260516-smmu_interconnect_addition-v1-1-f889d933f5c1@oss.qualcomm.com>
 <20260518-mellow-robust-caterpillar-93fcaa@quoll>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260518-mellow-robust-caterpillar-93fcaa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzNyBTYWx0ZWRfX1wcIiArWkQ24
 tI/5VcrELmGPapSQNy1/E1uH+Q2BGSJPXKsOywCTQidCmMlbFhKyvFriaIlRDTZ5JG94z5mQ2Xx
 rNLMHffACewLTR5vIqRmSRKpgkfp4tppcUVACP4xrfv6Ok5Us8BcJLu4SpchbvM4X8QOFi6R4IZ
 IHUnBEsIdU57Ombzn96IKx/gd5n94pgzatNwJN4zj1B5T8fOs4dolcH8N8+bO6S6MntO4gjIvV7
 hKW+oJ/Vh0vxM2r0582jdDg7T0hDe0/lV4gIhDV8IOpxkF9pwHafJU+62zePwUj/YFYMC+fEClU
 olYawAf1Us7MZNn0XObARmsSkEoyVT0gHESI0WOmnQOL6S3eBZtEx5lfLhVi2aX25VU0PYhWOPv
 KZJ3kTxmUpNdgQJW57SpbHqmmWjo9G+/has+FHJPIt96rEamrCXZC9obCILDSBp8V6W9sr2sNsD
 v2QSIdUqd7CqHQbVUAA==
X-Proofpoint-GUID: 8caiy_pGDo3N_FF1pWPhwrb7LH_g_BkF
X-Authority-Analysis: v=2.4 cv=Q6/iJY2a c=1 sm=1 tr=0 ts=6a0c6b62 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=E2rNws97cCCTNOQwQB8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8caiy_pGDo3N_FF1pWPhwrb7LH_g_BkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190137



On 5/18/2026 6:03 PM, Krzysztof Kozlowski wrote:
> On Sat, May 16, 2026 at 06:04:03PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
> 
> Then this should be disallowed for other devices in "allOf:".
> 

As of now, we still are checking which all SoCs do not need this 
interconnects field. So would we need to add the allOf here for now?

>> path before the SMMU register space is accessible. Add the optional
>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> The arm-smmu driver uses these properties to vote for bandwidth before
>> accessing any SMMU registers and releases the vote on runtime suspend.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..5cbf944f2d3e178b3723d4dbaa19ee0d33446979 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -243,6 +243,15 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Optional interconnect path to the SMMU register space. On some SoCs
>> +      the SMMU registers are only accessible after a bandwidth vote has been
> 
> Drivers are irrelevant here, drop. Also first sentence is redundant.
> Schema says what is and what is not optional.
> 

Sure, got it. I will remove the "driver" quotation and "optional"
wording from both binding description and commit text.

Thanks & regards,
Bibek

> Best regards,
> Krzysztof
> 

