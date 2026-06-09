Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F60370D4C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999035; cv=none; b=gGCPz9h3hN4UfedEyxlEmgf7xNTh6El17gC1C3JCWkiMZbUeNXUlRHqs7ef17D+pH2H5JBQo+p8A51o14l8pRjjINA68HV8iUaBlTulLxp6Y00j6kNc3TqoAkAbnQwbLYGvjbErqQqLAu/eYYrMdPwtCCQItfcAiYnrUteoFA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999035; c=relaxed/simple;
	bh=l/exZGynhFniJ4IOReSaddSkbCSs3Th1uTqufpftfQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7ZJET6MsIW2JlZPLswAsX6NWmZ68p0o1mPZ+AgHesUAx+vsztbAzNruqb4rOycHLJ6dvpnrqtjUEXSIVBuOJ4j/7vivnInLnfmHEKkPILMLNjzs2BUTBgbY7ui9XWXlGZbUcir9pqty/O18c82NzDNHbqv7GiSI2o3drLfKlfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaBrytJc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIb7TJdQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaBrytJc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIb7TJdQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rJJC1584053
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWJT1a+F8ivTQleEWMwYup4EASygHT710sf+q+SVdxY=; b=RaBrytJcs9g+wY1B
	kZZ97LmO8KApbhI5jz+LhwtIguW5xr2a7MMmqWX7vKwakyrIQMMmf2ehgleFqfH3
	rxHjkMYXGNGCDXu7IuXWoiIXD/LC2F2K0ujkXTbyp0VQvq9UGeDVLqZjanfiL+t2
	n6TOEJlCGzeDzKysLv9kF5qt4TYZPR+Inbo1ziHEn56iGSJEtcshxBJ3umA96naz
	ndnelebxxz5d78djULzJrUNw851SVfQ2TcAVFi69We/L0CPtj7buUzmVolfMr8li
	1yfLgFR7LMIZya7IuDNU9r7OVpXMkVAz+HrHd7MURpfv9eiTeCrT7OlImPL4Pp8j
	BRpzcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeerw5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:57:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51757324dcdso10959571cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780999032; x=1781603832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWJT1a+F8ivTQleEWMwYup4EASygHT710sf+q+SVdxY=;
        b=CIb7TJdQKCksE7WbnlYK40pVytbq5FmFJ4By/hycRagxZJk4ghoedVRmQaa1ULGSJd
         JR/jUNYHogiQpy0kks9njvz892TdHT0sdluJliqvCfTuO5V4bOajvkdmQHB3ff1SMJL3
         hlMli/nu+zI5Cwt4f56uLgtuWbV5g4p7cruCKsZi41hls/Jd5IiY7e8ZWLJYGAiCxTMu
         oAxeOcBKPW8nS6gfS5GGNAztKD0QX4pmatpJAKqeMWPFzi4O1CLhfllOkpXY8t3dCucE
         5EAo54g2J/liuaKL/T2VrkqHhQBG9TNQ45dlFUKPwNPH+AmXf4K7PLLSXyo9HuWMhMU8
         94QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999032; x=1781603832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWJT1a+F8ivTQleEWMwYup4EASygHT710sf+q+SVdxY=;
        b=RjL/fn/sOs0VmAbqZLDKaZckI53eIfSFO/a5vU/gEtRmoxKiS3gnXzw0Rbjz9VuW5O
         f08e2TsGIJQsTjhLAXSSYfgC/Y1GmvyBBhDRys0WFgBXYq1A0kISwFUGgcwP/NdQxzG1
         RVYuXPZA9VIQkhfXpBUZJ2JVL5010rWy9hTjwPf2UQTKmmU36TUot7w9Yw1b59nZGhzx
         9fpR68C76FBOmMIz+Tlfiioqmahuxivy6tvYgVvVwK0+rvaKbRRPezrLD2hCF0aPlXkT
         ELJxIXpIDsujVcJefTp9CNieJghgFikeshSknKM8ef1fDQ95bLSTff+It8BYlhnxpqox
         m7ug==
X-Forwarded-Encrypted: i=1; AFNElJ+JxaoySyOmLKXJh32+Fxcp9Q7+bqDHo65Sbaj0ssLzAgfT9mmihbvKhLFkgstBF6oLTgH3UBst1+Cn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7SEX0GkwJdlYcRohzOqPzGe6bDkZ2dgCOF6Ggxt0Ehvktne9h
	gvuU7vyHkCh/sa4WocN0dH88V6Fhy2yFajvHsy0VfNhsc4I+lzb+rVB7dZBKLSP5Hp82N63qknq
	RQZzVmW/A31aVh/PQzgzfr6MTkIIh7UXBH/lmmrRoeX7lzMQ1pA4gD2v5qhdDWBfu
X-Gm-Gg: Acq92OFfXszYvDBEUoVArZUqv/KULJ+UCd50z64jTOBVaYYxEyB2Deq80v1M9KxC+y/
	/RA6iPa49T1UkPE8uCDYsx600cis/xWZPLTbFwkIr/V5rT5gwbTHkGVcL6ggrxMah//WnHouuAb
	SovjK/B0b1QSTXOdkEYCoQZG/O2qclbi8wdoLwYBMALcOWt0t1M+a+dfng+8YPicAxVF364kmKv
	LWddn4v2XAYuWdpy77u2+w3Qi0WAcQyVtBnTGHKKlqOL70bpQ4VZgkFDIDUDrX2K/g1W3HWEYXt
	aQcbuBlkALqiXntYs2Hg+IyhlxfS8+j6pIOVQr7+IkFF6tJDwY6iEA+5tcL2bxzdMY4KrkocM/2
	1ZtoPRpc1qdIbNjdGRI16VkHFcjG/1MQF1tn4NZ5ijlGbKrEyQ/KZi7op
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr171478261cf.2.1780999032531;
        Tue, 09 Jun 2026 02:57:12 -0700 (PDT)
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr171478091cf.2.1780999032144;
        Tue, 09 Jun 2026 02:57:12 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051a5sm1019894766b.35.2026.06.09.02.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:57:11 -0700 (PDT)
Message-ID: <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:57:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27e379 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4Sww1aU327frn4sdWmQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MSBTYWx0ZWRfX1mIm0/2VmNfU
 sg+Tn59Y2vUJkz62M+0u/PvWNm29W4xSaSxV08mD/FOy4zfP4XjBLRGhIRWGP/snmTeuh1XsO1g
 j4g1YCKcnHY+h1UAI9dWXICKoQX72blpgUKESdKBZkGR9H2Lx0m7/wwbUe7/ePMdg9m//4YoyDk
 fUs0/XOu5s35l1wQ8iuitrq7YuDE6m/UiGbcQOMEjugcHI4W2z+5NnTO/91bSAtq8sQLXeU8X68
 DYw7IrPXRtCUeYNs3dIFFcgBMa8OArqsWZj7ebLgHv7X07R57H2X7i8nqCS87sveJCnhUDRsKnz
 K4dVQorwA911QoPjeFNqrmO1PR6mADMn3S8e7B8jPK8LOi31zBMapMDSlKpKuc4Ig/tXGcrHSAV
 BOA07LW6J2vMOPE6F98P5Vg/XMZW9LAeMkN3I4JxH9Q5OkL3bMwb5a/PqDO5UYvWUNcUMLAPft3
 iBzKhrRTTvtMo26uaEw==
X-Proofpoint-ORIG-GUID: d8Dzt3Tx8N4Hs323XpyE_QZ3jkV-iA2A
X-Proofpoint-GUID: d8Dzt3Tx8N4Hs323XpyE_QZ3jkV-iA2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090091

On 6/5/26 12:37 PM, Harendra Gautam wrote:
> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF moves PCM data between system memory and external serial audio
> interfaces through the AIF path, and between memory and the internal Bolero
> digital codec through the CIF path. The controller needs a binding so
> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> clocks, interrupt, DAI cells and per-interface AIF configuration.
> 
> Describe the single register region, one EE interrupt, the required GCC
> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> child nodes used for static PCM, TDM or MI2S configuration.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---

[...]

> +  clock-names:
> +    items:
> +      - const: lpass_config_clk
> +      - const: lpass_core_axim_clk
> +      - const: aud_dma_clk
> +      - const: aud_dma_mem_clk
> +      - const: bus_clk
> +      - const: aif_if0_ebit_clk
> +      - const: aif_if0_ibit_clk
> +      - const: aif_if1_ebit_clk
> +      - const: aif_if1_ibit_clk
> +      - const: aif_if2_ebit_clk
> +      - const: aif_if2_ibit_clk
> +      - const: aif_if3_ebit_clk
> +      - const: aif_if3_ibit_clk
> +      - const: ext_mclka_clk
> +      - const: ext_mclkb_clk

Drop the _clk suffix, we already know they are clocks, as they are
listed under the clocks property

[...]

> +      qcom,qaif-aif-sync-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse)
> +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> +      qcom,qaif-aif-sync-src:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.

Should these be boolean flags then?

[...]

> +        #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> +        status = "okay";

status is "okay" by default if unspecified

Konrad
