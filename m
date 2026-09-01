Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48E36CDF2
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243309; cv=none; b=ZZn5wbhh2+UNudk0/HdP2M7DQuIJYQCFqriED5RO3PxhKQzaZj4zehq/LdOwl8Vo67tAH8u6+hg/HpspQy4YoNQ0jhDkwWVezyIVTII9yKalfnYr+1+az2eRtF9F6860DCfOEdT3B2jBJCZC9wg+k2WkMI81K0UC3tul1FgqdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243309; c=relaxed/simple;
	bh=NTnarSf7tMp3CKYU091Dm5ZqWd1tV6igF2erovmUMp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CExZ5xgl7K7OSSv8oUrWb9XAZbH7PsT7T2Qgftom8pjqsDp3lex57D4RmXLi8//xENkKjn22m5wB6X9AXTcD6Ri135FDlRT8MAZSRhNJCeJPeUbTm3jE1Wi84h1gmoqEZIoP32XLICUKdlvhE+z87qNtKYedno6HEKuRbKeMnNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0VhgzoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=boCRfLDq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0VhgzoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="boCRfLDq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812kEOo1312285
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=; b=n0VhgzoM43hfDWcI
	THxETxudQj7Vq8uUpPn7mYOTgTrIwkOIc8kq4AnGJkVhta5YVylH3S5emYaByRU7
	yvqq6tAGw7ftFu/0VwP2TTI1xm6F/o0RZquHrkRs0qzsEV7bXh3TYIfyFUUA34TE
	rIPYDlzNAHDprfdAM8HLA+WhRZGQY3KA2lB+fkU9LgEM1t3ouIAHc0tG+YomlNh0
	9qIV5SZnbM/m74ISv70r+ZOeD0Nsp2mzaFwvUXWm7f659ZpXzWKqAxfrzbm3j40A
	yS+Hmcd5qWp9hKn2vBa1+r3TqEFNNoZi26RJjuQA1BPKICRxw2vTFstTd3xx7/xU
	opT9xw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c8rsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:15:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so5605175ad.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788243304; x=1788848104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=;
        b=boCRfLDqLenYiBdggYIqZW3g+g+hVPxgppKYMn+7B8qAjBhbt0lUAPOuLQLukb73M/
         7dCeyz1N1de3jDCm0hU5bx5I24aPy/xi7ZQa20q2INW+59cPFt169X8pr9E8zoRRSpKj
         RoEj/PJDMfzxQz4if2iyYGwQPHg4Y3ty0c/sczM1yWDjeaN+z5Wbsz7Z6P2RNwYutyp1
         pbJYMLfMjPke58ZzfNaRiLuqqKoUjGyShddOfvm5cl+f6bKDQ0mdsGag2y/6UhbAyV1R
         cWoL70HkBtkwoG02WIdDiIIbSBsz0ovL87LTcXYgFLE5ehIODbVwjON/5PgSd9ORPZyE
         Ofog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243304; x=1788848104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=;
        b=WUpywa+UEyxaKbI8MwhQFk3P6j+KRlluJ9qv+QI3nAuI4JZo9kg4KJzYw7YwzUL2Ii
         ORkn2jrwxCbWnlwbOpUuVTTddwDba/2pbzR/iYD+QwSOMhEV7USur50kWERUXbjnUWvK
         6MaM4uOdLzvRBPR5VyiO4U8Ndb5F39wb1wPfuSxZ/9DVZWiAuZITS6NxlD3fVYrVMdDU
         xgzgjBYL3hDLK1yzxQ1O8d4sJrmHp2OR/qmFd84GiZZ6Skr2GZEXBiaDj8aqfX3Gz7Um
         Qyo3c32cEMyptOXO0Vn5E6UWq5YNlj+YlOzoEdWet9sOlzFVNjwTqR5SAhzaWgsgOYmE
         tS/w==
X-Forwarded-Encrypted: i=1; AHgh+RpLlXz8SzuSN5j08OLavT/vPIdxYXlrmq2EzQil38myF459ZQrRRPfCj9VGdeymiOjIF1lfXn3A5nsn@vger.kernel.org
X-Gm-Message-State: AFuF++ktuFqE12mJArT3EXzEqXRbDFqhelo/qBw81R/5S3uXnTpnWt90
	oFV0An9ezT5SFj2hMAB3DS49ao4ePVUZcVKkGb6QmQ7nQ6DKwFmjE3gz/6ufkts4PU1IEwPrimj
	vZziizpWhcwOlJaOa7mOpomATFDTkMguRTgqGsJDLRGchmJvG/DziQpX03WHb3S7T
X-Gm-Gg: AR+sD11huQ6gQ3e6pR5zLc+cpu40su/YpEyq+HwBH5WEtuqmcRmKLRE0FwDNCRnvR8h
	iiafx+NRHkJDnLghv4kobH0H9U0HJLP60RcR59l3/Q6Vb6JYBnBeHGh821vZ9Qey9l+2mTmyd6h
	sUcNAejls32I6iqNfslxHjjvsj0tbiO+uTDc1865MspgXJcul9CEhLMa+7qZkcSorVfGoWCBdi/
	QktNulV8E9y3GLMYZ2cqaUw0YdAPfGd/p0cu59tMo8zPvhnuFqhqUr4IEmMyA01nN3d/2ApWbyj
	4ExMWKtTJ9ePhdyZ2o+8heBBiL6HLaOPpdbOujjGQIaIY4ZPZEAEYFCtiQqMXdC2MfjOanjYRtT
	lEzxTrjb/m8YLeKuvAyvqYrjFqnRKahU9sQLX
X-Received: by 2002:a17:903:1b0e:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2d74ddc6da3mr506961005ad.9.1788243304387;
        Mon, 31 Aug 2026 23:15:04 -0700 (PDT)
X-Received: by 2002:a17:903:1b0e:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2d74ddc6da3mr506960095ad.9.1788243303969;
        Mon, 31 Aug 2026 23:15:03 -0700 (PDT)
Received: from [192.168.0.104] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm31355147eec.17.2026.08.31.23.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:15:03 -0700 (PDT)
Message-ID: <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:44:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a966d69 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pu1xhwu27SFHiLAfgE8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 6c9PcjUyixamLFihiXl-pulViJKGOHVh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfX0KLj6B7E/xty
 RWZHIbZoJfrd0hdGXMlPeOBSXUOc9L6wxTD8kXe3LLhyx3SEZp/+4RDHJqjZFhByzLSy7tSiOjA
 7T93ELqObyL2lIj+J63yS4D+cBdmPKg=
X-Proofpoint-GUID: 6c9PcjUyixamLFihiXl-pulViJKGOHVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfX+6LoGBDJ/vdf
 ARwlp43CokBF3ihTLDu5Fqec98pS9uVtvbuRRyXRAOD21aH41K8OF0s27cdITS/4DAG/ohG3EpK
 Mf8CIVYtC0x1Bm+Bl0/REqbpSPPp0giEDgsRvb8wfnSLiRpyP3jZkQVcBXtc6AlexVtHsKh3YPR
 E34SE+41M93Hdv2YUxqazcSf+J3KXT2Rzd9tZkmhZcVVBDARn/e9bMdFjc436SxrPatafHDnqfY
 R/Q59aDvykQwlZlM2wsrgLYE2PvtJVfa6mWKqdJ9KTA0bSJuo/wnsjDsb2sdFzsr2M/HIcpPkfD
 rRumkxx/TcAhy7nGFkZ2dTyZcGmGsBJwJZUMmbJAfN2AxJLJkwH3JYpwLEzFmRXsNbAQEZ0YXGV
 JYZUjhKKBZWJKL+M7e/i99KO6nNHMXUFj4/ndcshyMnwCsLgttnYWsTuMcg47VFtBIOBlts/FVR
 J8gs7Q/cX0TaNWE8hkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010053


On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
>
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
>   include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
>   2 files changed, 404 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
>   create mode 100644 include/dt-bindings/sound/qcom,qaif.h
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> new file mode 100644
> index 000000000000..134356114733
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> @@ -0,0 +1,307 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - clocks
> +  - clock-names
> +  - '#sound-dai-cells'
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        qaif_cpu: audio-controller@a000000 {
> +            compatible = "qcom,shikra-qaif-cpu";

The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
Usually DT binding filenames are aligned with the compatible string for clarity.
Is there a reason for the naming mismatch?

> +            reg = <0x0 0x0a000000 0x0 0x20000>;
> +            interrupts = <0 331 4>;

Could we use the standard GIC and IRQ type macros instead of raw values here for readability?
Ex: interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;

Thanks,
Prasad

> +            iommus = <&apps_smmu 0x1c0 0x0>;
> +            clocks = <&gcc 213>,
> +                     <&gcc 214>,
> +                     <&audiocorecc 15>,
> +                     <&audiocorecc 17>,
> +                     <&audiocorecc 18>,
>
>
