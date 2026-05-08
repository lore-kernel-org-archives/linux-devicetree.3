Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE3A30DEA2
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237428; cv=none; b=nKnmQkWL53gV2fp9aPafL78Ge7dA0WTR8ltxFKoZoGd0du4vFOecOUNhj5FOmznSar5hN6E+8L2I0D4nm2/FTrWQm4I0fX+WeozvvCEAg1cHDDYNuzY03vpMy7qe/ssTu9xZO1rZceYOkAQFEamyHF/Facrd/HrQKYetZ6P7zzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237428; c=relaxed/simple;
	bh=zZHfs5GqOlJsp7vaK+kGmAuoRStRuUS0XKmyUHWMTHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qA6a7YTR3qIjNYF1TessZrwwT2hZi3DhA8HiueBDW1YJJGDuxziRHtg4b5gFTRYXOyXsifuZ5s5yBud9oyXShkpMzvjLFLvs6RqOEjPFaOiz1qtvz7PWS8NCgEjSDlnZ0K5uBPsWJcK4HL2Z9RLEQDBaMjO1hcrzvGdyY/JGMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqQc37Ew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlYlxT9H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqQc37Ew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlYlxT9H"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485uBQb4069519
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DNE6piEGw2lRb1belq5Nv3ZUsROE8WFEZUcH4zeiyaQ=; b=MqQc37EwecHG7oGF
	IpmZv33ZQgAvRlqBF0x943IizNMaoNFy3t179oeKdRLjMEOXNEUWHm6Od7xC/l8Z
	H4qVdCcfglgTxhnvh+g0wG480kdcUDlVqjrZe54QJBhI/yhrLWI4DycVr4vLHqnw
	QL7sJq+vGcL3z6Np3zywjegN5D5ue0692cuX/jS17oeD554a1NIHtTMc3xhnwmxi
	bdrDVCnxrmTKe5oT7KPrtZAJ5TAgS5y2YlTFWlc7cknkJ91Q6JZWY1WkNaglWOrk
	QF5ry7eOXpK9UmZltHqC6Ne0Xv9BE2G/U68t7SZPdkNF6oImACQ/MCJdjTzgQ7ep
	5DLh6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp2jr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:50:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d63aeaaedaso36562785a.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237425; x=1778842225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNE6piEGw2lRb1belq5Nv3ZUsROE8WFEZUcH4zeiyaQ=;
        b=OlYlxT9HxOfoq7xEnDM0nkfFrvIMOVKs3FrW3qm5wDboTZ9ZQ7wiYvrsxDySQSfetp
         JzocPFab6AU5zyUGs7oYGVfMC1qKhUCa+tXfdT02t5Pm5PhaZ1MgEsegkO+S+aw2/0lH
         GxxX2HHOpgoFWfVWK1rPzYFdiaaor5cQYFWLcKNUVgsi7eahFhHr5O6YL8l8R8MHtFSR
         sgaqUJCtTjcByoeskYDT4eL+UlVm7LdLZqDvg2Xfv4MwDtcrPCoOTmRzKRIqOaSlcTAU
         fbyJdwlOy0BcPWzydDvUIYfrnKyUXvrM8hWhbaBsImzxSE5z9OgIW2sAXIWu8Bxio70M
         rrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237425; x=1778842225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNE6piEGw2lRb1belq5Nv3ZUsROE8WFEZUcH4zeiyaQ=;
        b=fYjPMoWijamAD5MLcZEjD549vhg4UqQfwm36bjSkG35oj6qLpS9CtI6+GnQxNCDOZz
         YB2iv/xTi/J2metdQhpUmuayW/BosVCCFNfWZKBjEY4zOgz7ao+t4x8v+aiJfRVnas22
         IcPa1Pq4OpmM/SkFTSve+wMFmYKwrC4Xg6fvndXFqvDWsH4X7joD73HcXzs5n+EC+247
         xsraTOAp+n/90HtvWckpsyjfPmYr8YwsAutjTTmAVPqK93UfsVKWfFYUQ2vNPt7lBDV1
         Pb7MiWPPPEweQBoLXH4EQWJ8KsJRF+AvW3RTIyDSdxQvxyPXFtskHjyXDGSLk6cQM0Md
         /H1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8yyRHhGCelBIdUX6UP1JEx9Rtbp5I/N01Y4UBhrfHMmu7d3LPe0F6kj96tw5CaeMfJFspVAtbPgI9D@vger.kernel.org
X-Gm-Message-State: AOJu0YxrkRdwoDkSRDETi/ZyAvd72Ib89vkF9L4xQTafNaKGT05ybZPI
	Fvu0FKL0Dfv6bKB4pZD/AkAW2EW/Qd4s914cJHTRlt2Fn+TPF2IaD1PSokCXyqI4MYYIWi8A2W7
	sLsATYxjhC0N7graywKgI36/uIiuuWywnIuPBiVVqbSRmAN0IokB2cHiZImXRHGmm
X-Gm-Gg: AeBDiesoLnAOBFiglDedlNYoWH6r6SUL6IxNEUb1rOX0WSVlVS8YHv2ZLqT1mApIArR
	lAZpldfjRpKO3biTkwJyzVrYLE7u5waPK86/dNq5+2UaCh8Cver8DiTY0odXM4e3hLKsDCaeZ/F
	Chn9JmuKVf0Md3J57BZQyrM75Vtvi3yT18Jg84zbcsCncrqKiX9RX4mxCi14jljh+KC1K27mCXu
	zdWIQ203W72fVXBPtSm1pf7UNJE4IrUIfB75/jPX5o76wjrOdvjoOhrFVBB8eQ8eZe2aoDVaKJp
	DP9/yH/g/HOI29I7vj8jse35FIyP6EL1Ls4iKk75WyBZJf02p6wXp4g+ixwXKjRM9Kwt8GG36Wf
	DzzKdl6DtY6J70ZoWtfDyPSOr5s6rJSIjom/3hTJ0R8c5ZQVyw4Dlw4gRTFIcLa85HWpfMvPXFi
	0UrYHVRqpADfs10w==
X-Received: by 2002:a05:620a:3722:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-904de77ef5emr1198221685a.5.1778237425532;
        Fri, 08 May 2026 03:50:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3722:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-904de77ef5emr1198219485a.5.1778237425036;
        Fri, 08 May 2026 03:50:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0dfd367sm514456a12.17.2026.05.08.03.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:50:24 -0700 (PDT)
Message-ID: <c0def708-4d95-4398-8a20-8d4a7533fcf1@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:50:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMSBTYWx0ZWRfX75liG64BRYH8
 yBE9Qcb/igrTHWMv+XtTNisirRKOPqYjV/T5c/8HJgyt1zKrDbFmqkncmm1J9q80mzMmPIrAu3E
 yu5SLitFy2KNAuS2Ns9O2hmtS709cYxC+iTijo8cS0bEy0F5xpk2pRqLL4BrbV1vEn2aDd1p+QJ
 ljandTQuN6STB7nA2VpckRd8BlxCqkPocZnc5sxMdbMU5+8/CLhkFgt0MErL6ch2moHcBf2Uf3c
 UrSypzjuYWyuyJkfi1Dl9IgQoQuEF4N8ppDBQwXXLJlGev2EC3tvpAnQxGYoRlRvkSlfKk4I3KY
 8IU8RcXGwYykSA9ALwXJiazr18sa+S4Dw+Q5hzREuzmQluui2MtfvnMHJaYkbpbI+IyVvCYnLpV
 1fWo3UpJno6n91sIlvJ+B2b7BF3aC9bteC4qgk+6cqhPk3FvDfN9PwlDqIykQu5xSDUy0zj73fC
 KaonTLGCLjGq2FJOCIQ==
X-Proofpoint-ORIG-GUID: HAy1A_0ff4pAi1PYoBlTXGS0xqK5qwZ1
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fdbff2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eJ65ZG8ybeDIfqJBo1AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: HAy1A_0ff4pAi1PYoBlTXGS0xqK5qwZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080111

On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
> 
> Add 'sram' and 'sram-names' properties to the SCM binding to describe
> a region in always-on SRAM where the minidump download destination
> value could be written. Boot firmware reads it before DDR is initialised
> on a warm reset to decide where to store the minidump either to host
> PC or to on device storage.
> 
> Most of the Qualcomm SoC supporting minidump supports this, added the
> kaanapali SoC for now.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 7918d31f58b4..6813081fd74a 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -127,6 +127,22 @@ properties:
>            - description: offset of the download mode control register
>      description: TCSR hardware block
>  
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle to a region in always-on SRAM used to store the download
> +      mode value for boot firmware to read before DDR is initialised on
> +      the next warm reset.
> +    maxItems: 1
> +
> +  sram-names:
> +    items:
> +      - const: minidump
> +
> +dependencies:
> +  sram: [ sram-names ]
> +  sram-names: [ sram ]
> +
>  allOf:
>    # Clocks
>    - if:
> @@ -229,6 +245,18 @@ allOf:
>        properties:
>          memory-region: false
>  
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - qcom,scm-kaanapali

This list will grow super large - like mentioned in the commit message,
to list almost all platforms.. I don't know if it makes sense to limit
this. Krzysztof/Rob?

Konrad
