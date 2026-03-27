Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA513033F8
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615348; cv=none; b=Qcz9SyG6f5wfPhM9mz4WCnkrrQjJG+yzhd4gGHZrKqANxPUsmFWLIhF69Atqnh9WzccZidQ9CFNuHI88b/OFsYqWOXARrIsnj02YhTcJEOi8FTJjb9P6iz4hQ3Whfx3IwDV8Qmt42mVgUjTh8z9TYDiOrvYI8sHBuR1h/5JWEFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615348; c=relaxed/simple;
	bh=dlfjRc0Wd3GRClcRoGZO0mrsd5beoDaj1RkEJFfpeac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3zcu0m9uF1qSROI5TwPdX3/JVMRuVxp9O/xkdLWIKI7Y8GFcEEy4KHrczu3fJhYMFuWvfADM8zVe3Y7YD+Hv9WA11b283mceeWuqZBjFhUal6yRiAoTKTgOTdLi62s7iLHuYKtfkj4WLObnZ90wOsMg3GXFjK9+Er5n0hvANGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTWxhcWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axi5M25d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTWxhcWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axi5M25d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsA61226370
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SjhMqj8Cj6Hfid/G3o3exTChsMlC04r95ixtaTjC0XA=; b=YTWxhcWuym6c5OU6
	AXQKPUmL8SJAYWbBfadtSbASx0U2G0KN/f5SeoduP8NjgsLxats/sRcXXJFNkrLW
	pK43xRTvIsoCme/ejNoN31oOc078U4GySZA+kljqBcYvDBAyf0euifBNww3bqK6K
	NmefnvwDsZV2Svrf71zVgKTlT/CvU5Gm8wnpFDmNb5sbx4toobOuebO1mAJ+JibG
	ziCNLp6FnTpsS9U5SvMkQlQaQN5d0bchLzdvBEyHht+9rQsk+yqvYOEN+6u6/eyx
	u0sAvrPJJZhJxtLgvHdZ2O2NXSQhBliyA7ntLdI0pWTb4sdB37RtYcBD8TzSkUXR
	/j62QQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1bjg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:42:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a081737bbso8908576d6.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615345; x=1775220145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjhMqj8Cj6Hfid/G3o3exTChsMlC04r95ixtaTjC0XA=;
        b=axi5M25dRuQ2Zh/AmiUYHX/yBT+q9UUCdA1Nd/dzLwLt0ktX06thFW4C0Fxpf+SVQR
         wrVXPD6Ri5jlkJ2YHJzmRflqFfwmOWro7pnd/cCdlIdzCboQ7HIDLLLipqGx3KNi2FDS
         wNoQ74/bGSbdqgul1ShSNfCohATg9vNHsfQ3Ja2kE5jR/K0dOW6L9qwQurFvj1c7x3KO
         wo2Bd0Z9HCvgQbSOsNg4LDl/CUzhxz8tJK83VLeyAN7ewvXDJKWmdMPJ7gN24gNqAJJN
         8Q7+3JucBrmZ6gXt/f6Cf37szX5QZ/jLlIV4nGNNkwaXMsWz0AUpvNESuppnHyfYjsw1
         Ln5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615345; x=1775220145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjhMqj8Cj6Hfid/G3o3exTChsMlC04r95ixtaTjC0XA=;
        b=HrXP6ae7ghH4kdGmXgG+irdvE3izb3qrfYx+obZrf/AjnzM/f6HRNF2iK4XwMS3DlR
         DpWRPHnuAFNaPlnPzqWaUpPZlNEOTrcyDyKZ3DMLfQdDbBF0xMFK0x/DmXEHRmbH6r0L
         9qWyAdFSSHf9tCLFac4sHSlkbG773BYLgM+WQeNmA2dVub6pswsLtE0Ul0EsGpZ6iXSB
         HVj/dAkPJE6+27CnaJdWJUsTI43xjaglf6UcgcA+Tlh+AuwhhjQ+0ptTwuD8lX4iPH09
         9D3Y8uHGPURrJhIvkzg9HLSG8oiCrOH/+fKpEcpflp7vdRxhq6jHcVtO55hTeiPE63kJ
         8tYA==
X-Forwarded-Encrypted: i=1; AJvYcCV0OJWNmhxXQAVtXK1o2OTD1iECVw7ZErTiQTgHp4SAhzYpYzJLHWRdZYUA3B6XcCWtDMS4bdXc0Y83@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0sRwYZaYkHmayxcUua2jvVIy019B5akAYJS2oKAaH05s/XQVp
	iLFtOyqcvCcIaSlBExd5vDIY+YRtG6y9ZNHQVk4D3vk2C9PkQOBaRO8EKwZvRdVBUscb7yKbt96
	5BwX6My8Du/KSlIANNZGaR3nn+VJUgkC+bBZYQedqtg+A75GNJuz8g2J+fLSLAR86
X-Gm-Gg: ATEYQzy7sPvOLrLKbIsU8letzbtQRAAsfXlJs/SmAKBIWV6xTbHohiirqK0U15F+1sx
	8VcpvqJfQsHf0DP7lKw9P0ZMLjXbrQV1lWO2d9uTBthN3cyEOV1RU1Snya6NUpv8IapcZDR1p0R
	BJjK5C2FrDmRevOteBnDoogJKRd6DSJ8j7NJnPF4XSSFU+wDUel3LebXGn1cMOnDtFKuhXsO5Vm
	CFCqVxf4QXH7HLpbwIEgTFEB9k3a7/jCuLpP8Lqb7z02lv3vg2g8u8/YicOqXxvMIdCzK5tGiem
	P3zfeIcLLys9GsRF6vKSzu0uJkuYUyvTn6+BvGAptzqrMwHGo7wwcy8ze5icuEyxWNFPDAZ+6ce
	F41fwU1IsenyHOtVHDPyxqrYjTwbDUmnRU7R1PnTIpuss0nbkRfl6LwZswAZtyOehg0SjtP4lSV
	Vp3V4=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24040391cf.1.1774615344771;
        Fri, 27 Mar 2026 05:42:24 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24039961cf.1.1774615344206;
        Fri, 27 Mar 2026 05:42:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a58cb0sm2157013a12.25.2026.03.27.05.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:42:23 -0700 (PDT)
Message-ID: <2cdacc86-bbd7-4ded-ad8e-79d76a004b53@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:42:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NiBTYWx0ZWRfX/MmeIEurkWQi
 WTVsMV68AUEG5U+2EG/L3nL4RjJoBkpsd1D8YKkGEvhU6cesmSRDcT7Kmw+NfLs8vKTCbzo0229
 tPdVuJrdSEAogwnj7PPSiroslGo+tHKN+sAb/kGWF46mmf1aDgyiHDtCpefPK+PrEf/WPrxGoZm
 KjBffnee/jvYCIClSKS/Pu+c+Ln6Ldw/2yaqIflx/cAzzrdjZ+aE9SqKjsQcGL2QsL/JB5+Poqq
 3LQT704jwgAkQX6ZhMB7SViisT4yas9tragoqnn7eTVukEqRj8SxwFOF58+xruP1CyrcQqqoRPK
 w3yJpqtfcVB09bE5VXEho+31x/i9cAic8fzfUZQqONhkeOjwBrX6XVPV7vj+D/MQ/tJzUoyxRzQ
 lutr/dhjZ9P5JEhoRJB1hi2iARKPRbEW6DfLtsMM8XjfVsn6J0zZA8OgueHSMpqM8XFfrDiy8EF
 1SjullVSbFV6zckU1rg==
X-Proofpoint-GUID: LOB1eHVKDObHtwYKeL9owobMYasamgy4
X-Proofpoint-ORIG-GUID: LOB1eHVKDObHtwYKeL9owobMYasamgy4
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c67b31 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KcAurydH1nRZE6at0WYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270086

On 3/27/26 1:36 PM, Abel Vesa wrote:
> Document the Inter-Processor Communication Controller (IPCC) found in the
> Qualcomm Eliza SoC. It is used to route interrupts across various
> subsystems.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
