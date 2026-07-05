Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431202F7EED
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783273557; cv=none; b=et+v4ebQh2fGBPKaWkDABaqRr363TzfvJ5ZloV+nhHJd9tJZp+W8clXMvHxE0uUSS6m3TE9x46vWpgAUexQqPZZK1n6ZUZ6JuesR0c9x/XzhQStWV/DaqgP/FEGZp67ucG6Kpc3k5178shqNaJDn/aKng7qBtd7Y7fTmWcUaDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783273557; c=relaxed/simple;
	bh=AqeS2WQenKoV+dzXfsfoXUVRdKIljUEkzTivQu8QwVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmZ4YV/cFdulcS/WxkQoXLwgnerwPeODQj37YwfOXNTYNYIyCsxr0PsI0ckEo8ySHM5ZuXsP3bfk4ZIu2tC54VcIBnqRO8Zsp760OSdJ7KokFptnL820c+uNThizqSZB5r3nExRvj7KBvA3HtK9EgyzSeYd2/75KFO22KIdmx5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rz7SGFtZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAYAIrfR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rz7SGFtZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAYAIrfR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HiQnP2273276
	for <devicetree@vger.kernel.org>; Sun, 5 Jul 2026 17:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lm3jFZCfu7y4SHb5dEMYbHPrvclZNhMmF1bK6UjstW0=; b=Rz7SGFtZT3B9OxYc
	GmY2nfgr44tXPro9jct3cZLSPlEU1qt4Nzn2+NYAsmyegIu5hwQ9ondlNKDQpg6T
	FIU0LxAYX1N8O0tArVHwmb72Oh/hyVGed/9BzTc+okyjBrytxuYih8fnP8spJche
	/stSt4SMnoNv2O5AniVIuyR29UAvCHotUGXpre5Dl9tc/TehUvGzL1TIJ2hbS9Oh
	usjDts3mnkHekbuzIioNVz5hpAYAoWehULU427U90bDH/IPkR7JMZB3oLjRhc9o+
	WxnKlawVt9GlUOhg74eYG5He+CNWUCnBRbedgZEV9LhrNbw7VBaixx0K10vWWzCU
	Vw+lYg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnke9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 17:45:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c81db324caso50150975ad.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783273554; x=1783878354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lm3jFZCfu7y4SHb5dEMYbHPrvclZNhMmF1bK6UjstW0=;
        b=CAYAIrfREostOCWU0T9RTFvBtYcl0q/tl3/RuHHdeofzTa1XoN0dk7K7BF50bw65Y1
         mC1Hccrva9Ixt2PbZaAqvsaLAElYdvtCzXSYew1jF0jBp0H/GVyGZr7h7nJrYW67s9+S
         kdsRG9c6sahLP2f5fc38RZKfBfOok0Ise/JHm0LyB2rzYnNF8wfvxEajfpcKnHEETLl9
         r0u42lCADSjDNvJpFMPswQ9fqPTCVjgJjdZZZi36qb6JlfSIzJW3vBWzg11Sr3EL5gdP
         pJnF76JzTD2+qRjz8/kUfsmM8tJGNdXhDm2Oir60Ch3zZxBE+bwL/QyrPGZYvaW8ieBr
         gFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783273554; x=1783878354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lm3jFZCfu7y4SHb5dEMYbHPrvclZNhMmF1bK6UjstW0=;
        b=DB9F+pZYJwafpejQQM2r4LoIPX0SsEdNtjuXCJ8GrMd0O4Wtd5IryFzwwawB5bM2kv
         vmg+Aiso2Tc/5O4AV0W4AGR1psevheLDxL1wqIivYHVhADrP0YfbP8Or9jqpzba9Uy2B
         eMLfRdIZYnmLeSuAhGAlC7GBMo+RSg/JNPOGegxXaeuAKEM4CjpjqY8NyylQCeN3cKlB
         cAYSVgZb/rYFq8Zg1jYSuz7nSYLORHFtbyPU2QoMaO1n6YcLCvajpNfgUcfRWQaVFOWS
         Kec3XQcJGcNO5bX5LLvJ4zvk1EdDVZWSDjgCJ00K7BlkroIpMkSlGKXbM+loP1u+z/ER
         qTSA==
X-Forwarded-Encrypted: i=1; AHgh+RqTsYYQW9Vn07JFY73RJ23EUjxYkZicLtsC+l74jO4oAlalIr7WlIJ/0TSvrSLnHxDTxKxK7VHvCUEE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7vGMWb5gbJnf2/ymxAOpbaJf/qTWx84V9VBBV26Mt0GlVpVrh
	aMb+vbUa8Z6u1D9aaGoo6NAIU2hHu7MgvfcCcKhxzd/URjZ5newBy06EwQLQ+S4CGq5ivE4ytr7
	RmylObw1mPM1elBT1hPSM1v1nTDsdnrA8KDQBLFYsVUaj2+904UEleiPhYMQjbvso
X-Gm-Gg: AfdE7ck8FUyzCJovekEjHq0vbOdR2Hv069va4leNwK6WbjT3eOjMFhoILjnMqt/ODzW
	1zmih8iOFb5ljZ+p6DSSZ9NRlAjQnptBkYH+vBmUskgd+ECJdlmgaQBVPK73fYZfKsh1IX6DtmZ
	slghCZSfxhM3eNl7vhOixIOrM6M9UpJM3Ovq4yHcNSUriiv7SB96o4NoGoHct50PDA1cBhAOXoD
	SD8pMCYUb1vo53wBkAjbEfE1x07+v0yHSw/xjIkydYUASjQHvgzAtiQqItRSl153C9dvLd7CIAt
	Rh4MPjSF5GhoLcBIWzlIBoibX7zanlknzFRS9Ya4JI2C0NIn4B6yNW1ehQmbHOkwy8P2k/7kmjJ
	xkW9wM+6Pw8wPUklcmsyTq9PEHy4W2Rjcl4VqLbX3ohU=
X-Received: by 2002:a17:902:f544:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2cbb808af01mr71570735ad.3.1783273554147;
        Sun, 05 Jul 2026 10:45:54 -0700 (PDT)
X-Received: by 2002:a17:902:f544:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2cbb808af01mr71570465ad.3.1783273553564;
        Sun, 05 Jul 2026 10:45:53 -0700 (PDT)
Received: from [192.168.1.10] ([182.65.247.208])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870ff3sm35571975ad.58.2026.07.05.10.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:45:52 -0700 (PDT)
Message-ID: <b693a9d2-4f1d-4c17-8a63-99c7ac79ed41@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 23:15:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE5MSBTYWx0ZWRfXyZUKDsMi0XYP
 MXrqnXNzF+yPJzzq+/Gu0EKzaxg9H2YxZEm53/wP/YKn7RZfesouf0d/mDHizNOERIhf+DQZ76o
 ML1NOAR4bDkgLSYNCYYxtDjOOI+x64U=
X-Proofpoint-ORIG-GUID: gHkiVAPugEtGr1rD3u9YYhWeiNWSykCn
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4a9853 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=PVj2vuZyEA0yLiFZlqDmwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-O3zn3E73KuLMlEsYjUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE5MSBTYWx0ZWRfX4p8RhKiIsmJ3
 hxsb8iz+N+VO8+AyNro2HkI2luluIu5FNGSL+t0ZjvpNJ4iBEvTsFtWhicWXPv7rBC6/TK611EH
 kxBo/SbBQGaE7y7HNICvb84CTzktsHZqs2k1IhXSxKRwZHcgfe7PpG8Y6T61DS4ZEh2xkRhtl2E
 YgmgfgxZzHppnUsRp9xgG0aLBU8NM5ckIASzbXkq9XsndM8F4rwgVna4c+vv0EgFZiu9Rj12jT6
 XZTtfn/qOQ2WCn9LlfbCB8psxL3m4hmuaeWtB4bJ5gjRlEy27xpl6DzIqH10tvHR2Cn5+tgFO99
 DvIHCsjoV1JwZvMZa0eflDw+mFXjff3Z83sbsDr6v2ZK5rhp4s7A3nORU97hEaO71KY/SeNHCnK
 7UX5RKUEEfPqukuBaxHTWpYlULB2V4UHDkXk4MBhkMX7us3tBsCLXE7VtkjJYTjw6veDUtppKxx
 xTecwBZ5eT+uul9NiDg==
X-Proofpoint-GUID: gHkiVAPugEtGr1rD3u9YYhWeiNWSykCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050191

On 04-07-2026 06:14, Shawn Guo wrote:
> Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> It was included in the Nord SA8797P DTS series [1] due to that
> the prerequisite changes were picked up by Bjorn for 7.2. Resend it to
> Herbert as the dependency is gone now with 7.2-rc1.
> 
> [1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/
> 
>  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index db895c50e2d2..d690eff2e86d 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -17,6 +17,7 @@ properties:
>            - qcom,hawi-inline-crypto-engine
>            - qcom,kaanapali-inline-crypto-engine
>            - qcom,milos-inline-crypto-engine
> +          - qcom,nord-inline-crypto-engine
>            - qcom,qcs8300-inline-crypto-engine
>            - qcom,sa8775p-inline-crypto-engine
>            - qcom,sc7180-inline-crypto-engine
> @@ -63,6 +64,7 @@ allOf:
>              enum:
>                - qcom,eliza-inline-crypto-engine
>                - qcom,milos-inline-crypto-engine
> +              - qcom,nord-inline-crypto-engine

With below patch, we don't need nord entry here.
https://lore.kernel.org/lkml/20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com/

-- 
Regards
Kuldeep

