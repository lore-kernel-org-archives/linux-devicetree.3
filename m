Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507603368A4
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912356; cv=none; b=RBicejUl+3IX4nfGKxxezie7bHcZFZDB6Bi1xrpc0RpbD1Al5xFzcB8uASUEAHJTp9angOgyJFI0ud/GAfgQMtF4gKCHOKVgGeGUVSOuYeop83mwpK+5LKT49oy1NaWH0r3XXu6ST0g1ONkLh196TjZOx3OldCCSq4r7eEjn60U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912356; c=relaxed/simple;
	bh=vXFLc7V6vTbnZuIPg2XnR5XpGpGE27p+GqG/p8ZIcX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZG0ENFVMKxAqV8aWmNBgW4thAcZyIXrJjWTJk+UoWdsZSyOg8e/IJT/7dCWyVTeXPhAggkya8SVJo59/EC2xt1ex6HlaLz0kYzPEi3SjTAAXRK03uZcyCJjEXN283x6UxWf6bSfwMWQzun1Oq0Nkse1FNnWo8unpG2of0Mls1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtkAdHoJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDUCoY/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtkAdHoJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDUCoY/V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PsvZ2733328
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=; b=CtkAdHoJs1PMSPAR
	n73pYZM4cgjvO6Fx6FIB+DKxM3jeaqX5spxHir3YcBzmWwWd2k912vHQsLFmDo2O
	FKitW6k/zsm7NF0ibJmLy0Ke2Fk8xxmO702cMGLdxycXy2TDk1YVQTsa3RgEkgIM
	1ZCGXx6LrGeNKSunZSUfhwvP8HLOOaUn23Ppq8dogUiiWDnbU9VO2/iA3ZR7C89Y
	4rvgewRUS4+itu6TCLYUfr38G1zCO1Lnv4zV8oKQkhSkkEzcA0V8dI6HvvN0xQEj
	3FqLwYquY13XauRDefn8SWxjP/alE7iDpiJhD0G8WaNlaG2ggAWdhzZwOOWfW7k3
	txoakQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf7a4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:52:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157263095fso105055985a.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912354; x=1781517154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=;
        b=XDUCoY/VG9nzeY/iH9+2+AkGP01F50Xp9O88Lo3nQSdfgaUr4ByfMUfnygCEkYHeBx
         W56jxuSN2dGGQJ//6Wev+ikZhXxYKXKfOLiA55Ucq79b4eukXC0S0/H4OKcyfWXchDVF
         BMDm1nXM440ZeziGMqgsMgGRq8utVIGCKs8l/5Dq0L79kTRjhJEvrUvolyySVcQEguJ2
         zGeFCo6Zxa4n1BcaLB8XIbn21YO/wqVAoUynSvwTA4u+/yhHnf4Df09ehAs3BPS7mRnr
         soQaQc400lYB74AKJTOHgmoIrOodDAPf+nkoQWEt6FASf6hNl/8iUnZrENwDR06rGh5p
         jp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912354; x=1781517154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=;
        b=GVsu6+N9aw8nn+BWyc/joTZK8jZ0z+mOsvi7UaLPmRRnMISx61BGrc2l+DNRqzM/IS
         zGuNnwMq+UBqzwxFVOETyz90nSxyXiwxXnMUrv1ZaWymEIqDIDYrb9GN4VUwbnFbfVhM
         3Q9FJoGZtK4FvFZtQItcvtfGPzIm8bTJsZ0NxQnjdIMaMzbBfUWFzJHM7WfcxUHQ2g8b
         TThVT8WqwC2yZ7Nhb6D4LfjkY9L6YgSBNzRd7xCIeG0tuXwP5hN5NBvrGCRccyK5XOcD
         X2BsuN2XbmLje0S0STVoAwnGwt1nX19ST+DzkF7P95W6H+LdU6G7xjeTBzWYUWcgvtn+
         aezA==
X-Forwarded-Encrypted: i=1; AFNElJ+gyqlo8DDKnhGjwxnE874rSmMhBr4qfkjNxrKTIyAVtDWr7mBr5wBLx9WfOFTF9BcJGkpc3oSdlqIx@vger.kernel.org
X-Gm-Message-State: AOJu0YxYP/ykgqvfgxEo6qplzGPl7GjMrtcuPi1EBFBjV9hhIpywj1ys
	cuVxZdv+o+EnajCIQzVtZc/7uRu7J8g2tYLQWEQN7kK4AjQUmBoXKeq83qGiI9KzI2YWsSak0m5
	alYvm8jC/R1Hr4bsr+/sHw2KzYZ3eCVvxm1tnWiTqfQr661wxvU7crx78l3OZbe2f
X-Gm-Gg: Acq92OEcwCrE5LO/RzLB5TmXtCBTd4eWP0BDfN/OQlJs0x/nwLdt6NV3yFg6N2C1d7+
	2/obbWYfI7pQCL1rJA082x66kD9RMHjTmIz0Dv18xazBUYDB6BkcoD8C6t8AAJs+X8KinoeuFMO
	FOrGLnIjRmxSdL0PX8nRkzP/sMPNW7xfGUbuWg8vVtwubQ8RMPeYLOT6Dhjz89dxhkBXRsO4ca0
	pi/1uNA35QtADPVtVfzc41Jz51ex5yQ2ACcmJQ1NCH7XH8QYMaamhUr7o6FI0/4yGe5aZciiQSo
	XIJZbJa3IuPc9cHeqoBHg2IztnLkyz3NTq3IlL6Y5n4c2+D0m+Jk4ls3boVNUP7OWp50mBr/D+o
	8Jkn19taxiSKtryBVGNvuoxn/zgohbbFjDOTgcbvac6r914beDvcEY3JS
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr1233793385a.1.1780912353531;
        Mon, 08 Jun 2026 02:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr1233791485a.1.1780912353127;
        Mon, 08 Jun 2026 02:52:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054efd5dcsm852161266b.39.2026.06.08.02.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:52:32 -0700 (PDT)
Message-ID: <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:52:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2690e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=thcKRG5PhHeBPCh_FOAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mCVnnH7zjs2cg2Wy7-yUpITnCk_LorDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MSBTYWx0ZWRfX2dYzgoElEC8G
 KJ2lOQec89eTWAdhw9fvdiyos6z3/E38UeDb2JGboQy4Ok+qA+ebel7xVF/9kHuY8DaTkw3UJG4
 kQ73EChUKpBkG4RriJzHjLCc9LEBASzEukCe/fIldMCelYbv2jHPcib2eqhRhLZBs9GhGB4duT0
 dVaL7nREYZ50rOHtwKwnzGPUm7yBBLfqTT6D22RV0kArX8WAx/BJk0oOI/uJR5v7BWaCXo3gpE7
 ZveDb6mgbLn1Ucbxho7OyaVGqoMnDddmstxPG2n7Oz/4khpi5LY6FkhvoYHo9/+0QPuFCgsapaT
 9ZojESUxXm+2Yb55nYxHgIrWH31CnA/Ag0ddOu1HcmXYQ045Fs49F6v4syTK4zlSEZSmvXukqKT
 GdNitS/gFqjWrY9Yid8GyV2xpmGMq/UxsV2h5j7sXs1CRA5NkXfPlxmbF9fU23NIANGl5KSrgQY
 jApqhGnlyN4fGHNZTkA==
X-Proofpoint-GUID: mCVnnH7zjs2cg2Wy7-yUpITnCk_LorDJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080091

On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional
> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -243,6 +243,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Interconnect path to the SMMU register space. Required on SoCs
> +      where the SMMU registers are only accessible after a bandwidth
> +      vote has been placed on the interconnect fabric.
> +
>    nvidia,memory-controller:
>      description: |
>        A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> @@ -602,6 +609,26 @@ allOf:
>          clock-names: false
>          clocks: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sc7280-smmu-500

This is a list of targets that happen to be supported by QLI.. but should
this list not contain _all_ Qualcomm SoCs, or at least a much broader range?

Perhaps

if: properties: compatible: contains: qcom,adreno-smmu

?

Konrad
