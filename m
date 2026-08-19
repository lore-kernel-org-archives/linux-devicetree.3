Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93444AB80
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158123; cv=none; b=qTfhgGyt7bPqgdOS9z+nqKrBNMfXNhen8I5e/pqD9bWrokgFIGl2JDFmpKO+f48PMDlS2DgMnHIEQBZsZns8fhXjujLc4T9xj++wE1NAZuVc4+s9JcwVxrVis1545xS+e9Bqu0VUkrm7BazdwRpmAgZEsYsQdyL7czggFSZLlT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158123; c=relaxed/simple;
	bh=l+17BhEUjQRC/w3E9J3bIejev5gx1pGsjZDaz9YdxHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lgtb0S0G+rz/dlfxVplUc1giu6n50bSjIj7MG7YCcSZvJulVijMXQaRyAVFc25cuGZXpaBOLjBzhqtfxnCWPWR0yhyryp3ju1Jx3JCVCuYB41PMhRnUrOJSvJMixXRQUJvaH1/yMxX8WPIrOCaf/mGgyZTezTeHonKHS8iFWGtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUTC/GLH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8p4NKsk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUTC/GLH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8p4NKsk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1dKe643358
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JhlCZZ0HYaVuio0TwOzKVTw8iu5qVB/j65AOdS1nc/o=; b=nUTC/GLHikxAoQKN
	L8svseSWRQ72NR+I/BJifbpZPoytA3pjVMvVI8gYaZtxfU7iyZi6bvizRfnU9xdW
	LW211JCxMFHZFnhFGJp+gOPVAfosU+GUn8R/fIoBBAc/Y4U4Sw7qP5V6p42SCYav
	NKp7+2iT2DQ6K8YyRUEp6KOqhnD+THLns6fxEdaHADCnr/5keISxamL3Gd8iM0eA
	ZXb/5/e2wRW+eJ7Vh8ogVIN95TAVmmq4XOkYCMjAxDbQn0IwtHCvraB6i/QXjxvo
	lB72ujNgLk45Q9xWiQh8+kWgdl69lnhD1SIPIY7E4lRNFXfz5yY44UNH+KDXVwP1
	pSSWVw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es48jyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:48:40 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so50704e0c.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158120; x=1787762920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhlCZZ0HYaVuio0TwOzKVTw8iu5qVB/j65AOdS1nc/o=;
        b=j8p4NKskmfsFwlzaVedNCJxriyuI9xeFd0pD/AvwGW1YS8QojnWsB3DOBBGS7dbZQG
         jpvME8GfMzHvY4hqhE1d0I7HSdgMSHjfhFZs5hvAmQ4TAmEcVM6/rAfICV7awIPj8U5x
         U+X09BISO01EQwcl+Y0S+Y1HDOmMeY+rcmAVmCmbtziLESqKZmGXy2vLPp41u0jKmfGh
         lxKHVM0R9d0HgRXznvhATTKAdZ/F1/FJ03fp1ykO+jIXFafmCSYBPI1Xr8PeWHWBJqSD
         /btF1+w2oXWRTa5DbDNcoEr+D2+5NoHeEUevRw6+REBjHpbvXz3dQUqYhQSwZVKnKtpB
         I5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158120; x=1787762920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhlCZZ0HYaVuio0TwOzKVTw8iu5qVB/j65AOdS1nc/o=;
        b=QdUa+wjGHQKoql16L3icWJqRpZmMvKn5fKZUk0s7GRJ+Roex9IaOtqqye8PUJ8h84V
         otQUgEC3xzIQ7cB4GYx1RFQUKYe2B9mxXvUmi66eQXmbf12EYr2K3fX3T+Q107UtI3hE
         dZr77FP1Qwfxj0L+Mh4mDqm9Qb17oIlZ2eGJB9rf91bJP0dPECW7S9Og9nemrnTTGVFP
         vNEDDDzUjxXPk/zQ99ILdjmo0am+cANzLYUA85dLtLy/tjJ+Lh3cYGzGs5QaGQEO9VCx
         CKCDHxwqXay/91Tvdg0o6P4r3h3nms8k27cgjYenPN0qQglI3R3und1PGsEBR8QldfMg
         F9qA==
X-Forwarded-Encrypted: i=1; AHgh+RrCEfPhhYGt0VD8ekGMnat7vdXivOn9fZN/MxUkKJFvqeYPMobKEIAGSfGA2uitCdNsF/BwtVsVe+xB@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhRKrYctHs0Cx1HjleXpQjDYloD80HPeCyJ4jUPjvI5jEgbzC
	CeIFEco9Tsn9uJlE82XaaiCieERubS8nCVegHgP+KbiDLmQoX7kpPp9HxHk73tCiK+8CjPvoIxk
	sw9HkvcBkK1r3H4uNxJCjWqVoH46MTyXmVNZwIY9Tf+fhS7HHHv9GboTZkkh29noz
X-Gm-Gg: AR+sD12D5heMW5qOuOK3XMLLYE7B7DT1RfUYsJwr+HfWV4xEAxtctZITy2SjwD+c/9f
	DCS1UUTg57VquHrweoBwnLm82LjOTnhzkRvowdG6J9rNsTbccbU6lUfMW/+8Ek6Bhy7uiyoTboU
	TRZNz7DIfn5R2OxuH3dzgJRH+w9SWX74m024zN+i8mpq6FjdMiR47Qn26jlblHAil2E9nYI4zWX
	VaReiJSIZBtYyZUhUSfSKouMYcbhHauCKJNH8zVv9f4EQO1ayfjsyR8qwXxAoF3fOVLRh4Hy4Tu
	pnvo/gpzHICbMDkFi6CTtJ4PJBuvRm/pZnj1wSO/ctKd2SXz+orVpnDKoFpi6xZHmbmFWdWUg9b
	JgN+15hxzuO//oT502MnJMbRX
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854908137.1.1787158120197;
        Wed, 19 Aug 2026 09:48:40 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-777faba447cmr854897137.1.1787158119762;
        Wed, 19 Aug 2026 09:48:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:38 -0700 (PDT)
Message-ID: <9d8fdbbb-5c54-45df-8479-01ae4fcc5424@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] arm64: dts: qcom: kaanapali: Add GCC CX power
 domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-15-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-15-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f--DxPDNq7R5Z6iba2q8f0om2jPfQ6ab
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a85de68 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX6zsxxIoSVQXe
 XxfGBdBu3+6LcDDF4JnG/j7X4jWeX+A9TzvMRHaCmP12jsTkJwBNh8DFnuGq0FUMyjU+yrw24zC
 3M5JpHUe/MdMwrzR61/GpUpRo5T7t3g=
X-Proofpoint-GUID: f--DxPDNq7R5Z6iba2q8f0om2jPfQ6ab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX10SNWmcIzpBN
 B4cbAISVfdF8k6aWzc/xXKx8YarZEbZBWszlV23YM4PTDcBCXU7kn56RKkB/Nt4A4E1zk+2AiAV
 b16dmoK4SvU8wnyyYwUU1ICfRo2wGuREJUJ/9srCOX2N2kqP2+qxBtRPQ1xwF+Cpi4jQwnGadVM
 u7XijKId9fLkBJjXY3KPFok/sEKTh5VvGwESaEztIjexrU/8uQzZE5zbzkJsgJrGdnuJ7mnhsBn
 z+7dQsrrkB4R51i5GqUwpg7z598ELGItaygx8PqsCTRfb4J/93yN+5UscP8FWHEDFKwi1ZHmtet
 AKUbSuWrU6U9aJlakaKjjQKPrIKnhOTJ7MQwAECQ5ht+xfJRzv24tSzp7MFW6WJkNPO1AuATVG/
 /UH4pQ1bhNxff+XS+5xlTJA0/eJWgWI/6bmaOPmUc0Sstq4SVJrBxJFQEbH0oxcr2TE2WGaSUvN
 xB4rr/mEJSt110yEI/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:52 PM, Abel Vesa wrote:
> The GCC GDSCs on Kaanapali are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Fixes: 2eeb5767d53f ("arm64: dts: qcom: Introduce Kaanapali SoC")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
