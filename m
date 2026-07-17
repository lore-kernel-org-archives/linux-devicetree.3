Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E21EB9E3
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784248965; cv=none; b=Z4Y9M1GyHjTERhH3zt2TdNcFcZqqGgP+lAlnYgEMnwUGvJrA593qlkRuv2UV8eMtOYTJGItBIN4FlsSEBNdk/26Fo8aWugmDBETmesUK9IR1r3klw8j2Y30Wi6VYPrwcIUW0HlRqhzh7bIo0GVU7AMzQn1AL1QXgN1VwZ179hMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784248965; c=relaxed/simple;
	bh=2aNinRq0flGK0hiP5tHhjAD5hq2MPb8W7LKQHQqMIDY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVlF6SF5NTpiLXVa/A/sbgdjwE3CMVqEYdDXguXqygXb9UGkzEJDTivVfi8xCXW0wtZSViFtnfIWq8qZ/h6TbyZiArA0WFr9HAPoxh6Z335cmlEqByaFgxOZTRvEB7exZ5VYc//0b0PReUn3N13nC4vhDBBaqtzFsiFSAac684s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvjrwzUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLXpwJHn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvjrwzUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLXpwJHn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNJHgT4180343
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UxLGBdpnrkDciajFDWMSeC+2EXjtdsW4rIt9aI9uoSw=; b=FvjrwzUg7HydXT5X
	1J8taClGEMIWh+r5KEZz/IBpSeJqAzsXeKbsnM8r7oKK9+ww8xwAK6KVv23buqET
	P/JvYbuOA7rb4vGbEztsmsuCj/G2K5Q86avt6uJ+uW2jtMrQ5ZmwROwnldW4jdEB
	9v97UNNCT8tcHiSoZSh+bqHQufjIdrmsU8uT2P8nsrPwb0L7JOsT9ZudfBl1LgV3
	v2wOqHT3vYb0kWmj5VGaWK1AaQe6zc/IB6Hi3i9Z3Z4Qa6zTkY7nNavQ0uHsf2Y6
	tiq/WmUngXQed0uMlQAAFRzRmq1tLfJAzfYhPkg/p6KiR9El2a1WuLEgHO6Ro62A
	YW45vw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2su12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:42:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c891ed872ddso12636838a12.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784248961; x=1784853761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UxLGBdpnrkDciajFDWMSeC+2EXjtdsW4rIt9aI9uoSw=;
        b=PLXpwJHn4iAabpmHTQR1BoXaZbh1JmZtbsz/onlJm7Fv+IwfGXFLr8NgzCixlqicI5
         bWkUTr0Hq4kxjWpCT7I2JnTUU4MDVeWFjWvFfA1Es8C3eLrmvqU10+rNQj/HB/umBLbI
         Pwr5oeouopnXh/XLPP3epFCBtMNq+7tKtTqkDyhGOS/fAcdLCSmzsyE+DOpZ0cKTQldd
         t5mGL27daw3kViq7M56K6fts1m2d2zG+UkH4sWtwVwnAsskGOynaA0O0F6UXjtzJ6UVf
         2AbdMzVXrVezTFff2zAt7Mj5r1zWRY/xi816W1d6GawvPVjOXAsJP1MF5vA4HLXrhN53
         O9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784248961; x=1784853761;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxLGBdpnrkDciajFDWMSeC+2EXjtdsW4rIt9aI9uoSw=;
        b=WUUcpqH4MQipneR1UDE9y89qA9PDA/5kIi68dsjx7TeKP1zb8KrODL1hyi6CJpXzjc
         M9L9zTaVN0f/kuBRSxrRS03uGNnzNLwsf0xfg5DM2uiTWrSouuL3IeAVaIeANGF6PY0A
         AP1Be2BDqB9hHBZDNd1k/VPpuaDIHuqib2C9jc6kI+amDlbOueSI3DYwEJfd6cfFMoi7
         38IUvuWm799jFvUrqk+J35YOnXr3JIbMcnUuC4K7OtHsd22wufRhKNOXUCWcBG4RRKAY
         WU5+e6FEVb+sS+ZhuEd5kRTk9wk9Uk+b6VnC3sB25zLSetkenEHvPrX2uxrFfz6Gh/fI
         72RQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOLqAvWUi2Gc1TY8naGDhvRGexGPOm6DcdmUpBD04uD6/8k6xlVJTomXKc78z93Up5Ha+ZwFvOc9FZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLUDcLaSzVBHu9ErhX3h2HLIpPt7OyIil2ZzhBB98HkJo7VWw
	qcnn4ngtHdKAISNRJtaPQRL0c6vMmYc5n0prydHRlg2t7MzakYObVwiCtVUqzq1tQwySq9sWNh3
	fLsZwTDFK2V6O/D8y+CmLs3cBVYXdQn8/+0s0rcFkhHd0e5mhq5+bcAVtdYj6KTLLPgxM6Ypd
X-Gm-Gg: AfdE7cmp/OvWhhHlUnaSCPYS7mVtPHki7t0RsfDbrCbjMUyHkFyAsKNP9HA9kBEwUCF
	sJOhT+7QFl5g5Fkl5WVqAdRBA5kTjuihr8MCUWTNwXFzTa4JZ9Dd9POH3dwoKzYqiPulTSA9Kae
	u4CDY3wBXQILMFSxEruu1BKdHrKrsP5hoOqYUHV5ZHF3KkNjI9YCksNCsQLzZcWgNa2SY142hS0
	Djr1Rlc/MYE4fUYebHwbiB33ftDH/ukw9D3EAsg3e9oWnbRdS4cxO3A4Z8QbJ94x143eEFxPlRi
	GpO08bDcp28qnLD+slvuBy156NIBC8Su65MNVpDcXMD/c4YCkhm//owOqn9yHl6hmgZNUtkUjPd
	pAnPshIKcbtTwbtamW89afeQXLA==
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c3ada39a49mr273665637.67.1784248961173;
        Thu, 16 Jul 2026 17:42:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c3ada39a49mr273634637.67.1784248960701;
        Thu, 16 Jul 2026 17:42:40 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432f1cesm22812830c88.11.2026.07.16.17.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 17:42:40 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:42:37 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cwweng@nuvoton.com
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <20260716174237.00004b79@oss.qualcomm.com>
In-Reply-To: <20260713081127.115197-2-cwweng.linux@gmail.com>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
	<20260713081127.115197-2-cwweng.linux@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S2WQvXclzbxjr42d__mrhHkz5gCs3Boj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfX7DP5nIJFdzlI
 g5D41bOJchWtTCsNDsbcnDf7OsphycS27jlC24RTo2PSrATZHy4z0vkgBMOO4RA16o+7yDsHY/F
 KpzLXop7n7wIeKYcs0aIBXDA4yAKquI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfX7M/zlLJLdxZg
 HjG0qLTSr/NEWQnYXRwmHA2Bnt2RBiRhhz/Np5IstoJkRzXtdzvvf/Jq2OPNdl5Tshk9uqGDQUg
 ypWJUc9ccRrnTMdCo4v2Dx4dFtXkSNr5/UxIPm27yPzOGL8t0Tzqj/nwuOxzi5c6oKSgY7LSd6M
 kpj1RckpkCthniZxwhY4HvDCZIU0xBHqI7r0Le7o5AWpN8jI0ek7gcWzOPSDD9H6ZmyOxG9UZE7
 DbsoeoRN+HiPYWr2N2OyQaNiAuy93BQ2cjTgtNVNccvNCVxOpV+nZldg9WTbVsDPQDUTNbaHOUF
 7elmmrHftwh32N1d3uZuHow8xaXrlbQk1WS17oT9/dFGdziTfGdPu7VMJhXGG4WQzRiRoSgJ2z3
 MW3QU7m4JlrRZEiOfGaxAMfseH0l9pP7owmCSoGv4SeM9ov8ybMA6PhWlVPjNzWxCuCM8YlNWfD
 88ON1I5lurAp7UQ7Azw==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a597a82 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=BxgfbMJPAAAA:8 a=O1BfqjI78t3fJ8cDaMMA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=-j4ASRGczZqhCHD74e4j:22
X-Proofpoint-GUID: S2WQvXclzbxjr42d__mrhHkz5gCs3Boj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170003

On Mon, 13 Jul 2026 16:11:26 +0800
Chi-Wen Weng <cwweng.linux@gmail.com> wrote:

> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add devicetree binding for the Enhanced ADC controller found on
> Nuvoton MA35D1 SoCs.
> 
> The controller has one register region, up to four end-of-conversion
> interrupts, one functional clock, and an optional reset line. The
> binding also describes the optional external reference supply and the
> optional DMA request supported by the hardware.
> 
> ADC input pins are described using standard channel child nodes. The
> external ADC input channels are 0 to 7. Differential inputs are described
> with diff-channels and are limited to the fixed hardware pairs.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>

Hi, A few comments below,

> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 000000000000..1be5470643d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
...

> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      - description: ADINT0 end-of-conversion interrupt
> +      - description: ADINT1 end-of-conversion interrupt
> +      - description: ADINT2 end-of-conversion interrupt
> +      - description: ADINT3 end-of-conversion interrupt
Not sure this doc helps. What are these interrupts for?
The driver only uses one of them so why are there 4?

May well need interrupt-names to allow gaps in the list to
work but hard to tell without more information.


> +
> +patternProperties:
> +  '^channel@[0-7]$':
> +    type: object
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 7
> +
> +      diff-channels: true
Do you need that explicitly. I think adc.yaml already brings that in.

> +
> +    allOf:
> +      - if:
> +          properties:
> +            reg:
> +              const: 0
> +        then:
> +          properties:
> +            diff-channels:
> +              items:
> +                - const: 0
> +                - const: 4
> +      - if:
> +          properties:
> +            reg:
> +              const: 1
> +        then:
> +          properties:
> +            diff-channels:
> +              items:
> +                - const: 1
> +                - const: 5
> +      - if:
> +          properties:
> +            reg:
> +              const: 2
> +        then:
> +          properties:
> +            diff-channels:
> +              items:
> +                - const: 2
> +                - const: 6
> +      - if:
> +          properties:
> +            reg:
> +              const: 3
> +        then:
> +          properties:
> +            diff-channels:

For these take a look at the description of diff-channels.
It states that where the pairs are hard wired you can just use reg
and not specify diff-channels.  Seems to apply here and will greatly
simplify this binding.

> +              items:
> +                - const: 3
> +                - const: 7
> +      - if:
> +          properties:
> +            reg:
> +              enum: [4, 5, 6, 7]

What are these channels?  There is a reference to one
internally wired one so what are the other 3?


> +        then:
> +          not:
> +            required:
> +              - diff-channels
> +
> +    required:
> +      - reg
