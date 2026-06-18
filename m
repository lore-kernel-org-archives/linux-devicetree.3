Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1B3D9030
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769745; cv=none; b=oBmdu4fc7Scmgkb21zyNHmJPxFOZ+gXBjYADaAynXTogulnHk9K23kPrhTpCwLD5FhtdXjOHVxfVEmbmksnQg62uV0KAI7crmjMcHjOpT/XsS4SfhmW7bIZgvqdk5CS2RB67WOYgE+vAo44KrnsTS1TCVOTYlbyeJLiB6sCSh3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769745; c=relaxed/simple;
	bh=ukAnbDogb87UP61Mar8GPMtMi/rqIRE+bHT4t5jxtuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORWlKeuSt4cPtXHwTKyZJIr7I6+2JJAnXCIWwyny3L7PXA0Xlo0AikTq3nquw1JUzx43RerPax/nkYTh11hR0aRnd6qGsRTHOWPL2veSuT7/m0BSeyTw6aUhFUbQ29s/IKXoSx87SL8I7arWuU9IyS+oi2cxucSdxvbKE1D4H90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e964duZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BibPVavU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e964duZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BibPVavU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I4gQS63068021
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=; b=e964duZnoQXUCwZi
	9qRLhXpCMsY9515ihE4qoLJPHYNCIBL6gWQnwJnthcXs/QfSjPuSjONklX2WsbJA
	l4pRoBTwlFZnvDX6ezYYco1GK32uTHXQgDagT+b96CnwgRVkeq2hsxEqO6z8u4y1
	P3MV3TlmcrzAl49uD/ARy7Cdo1VVs+i6VOLpsAvV0tTz/9NsYYkgy2R/kSCQ5VZg
	/P21ILcWJrd4O+/8rJxn88++eoQbPqnEkZIPLKwisKBCCwbW+Z4OKuJ+Ip4wQTuM
	I3ofbRvRMJO6XqAMlMeY6hCJzfl0cziaPfJTVq9yyFHowAa8EIr1TbRI79tW3J6V
	MzHnow==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev199jbj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:02:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so54441137.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 01:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781769741; x=1782374541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=;
        b=BibPVavUDd/MAPcIkrfAomwN8aQm3GlvnUAVJG+uFbjFUTK8+DcbPlpRwfuCC2Ujqk
         DYg4+pjUQ21WSt/+FbxwgND15ypmK8Hn79qMpvE0XVlT+f6/RbLg7D6ERLylGhH0MUYV
         M477LzdMbLAi+HVeVJSrACvJnm29ws8jQeQ4J8pcyP35VBn9pmrGVrT5i1j7+Pv7rTNc
         tcAFEfASLFv5msH1VxadLHBh12/TNnOMjFLjLiHBdw91rhSowL7CKBulG3cV7KyRruXt
         ICIWwABahtg3tDoXZrZo/bJ8NftCi3JZNuJLlDewlnkP1KdJOZehLQ6nEmek+M4uR0dE
         mKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781769741; x=1782374541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/N9uSRcFNdrxYby1iNTjX5385eR4TpZ5CgLI5Syc4ac=;
        b=nECbWMedOi+QMh8VznXZENp1xOUySVbveJ+c5XQ1+6ol2CORfx04xTTcp00STzmRKc
         qfF0HxD6HBT4ZfztFCgZj9ravj7+nXznou+YvVo9IXl+MCegUXKoqbd3eEkZh+khDWhR
         jOh/K/Mv7afMCF9V8MqI9Pkum7yjByStJBTAq/aH+e07Gi/O0V2WVyM98l+QX7um4Pcl
         HROo3OobeoGlCABJ6GMxk5lwyAXvwWHhzHQ93tUVIYTMvot+2ym+wLkglVIdb07VcF4w
         l5/1X9qiEDFHiTH5ubf4X5A2JBjmbgiN8XY1KLJ0C0FCyzRYlROm6Cu/SvUDSy427SKt
         3h3g==
X-Forwarded-Encrypted: i=1; AFNElJ+4tnLmqQbWD+PFJwRRBA9y4zptaNcJPSGM6jU01L1rYejnIMBdLo2pPIMC62g96TrolqW30iRHVUUM@vger.kernel.org
X-Gm-Message-State: AOJu0YxgExO8fEoro3ZwpCqVjLOdrl38cHnfUMP/6zAzfLbPVzqJAbGB
	p4IVbGrdItrW+3bcrT+P78eU0EQwUa7a75FGQ/igbRGjfvYFaFrRczZAWmjT08k9FSnrTJ1tPSL
	bYbcIY5gVKKyd7a1rBp6ubhXNtvb+prJjFw6+iM9KSiHcmptQv0Zgabn/rm+97gGV
X-Gm-Gg: AfdE7ckhnXZ1vISTXeTCwGfGGZhnpqgU77euM7+FkUi39cp8rdAMc/H5wkJU/WVUNXt
	pb2bd3WHjtmk03aE4YxVPrJqx8sMGQMEY4xXd9BntL3cBXdnF4X6hkOm1tWPeAWYO0vYW+Xs/CA
	oHcJo8kiiwGRweBvDRtMsrvPtom9iz53eWZAw6QHE1+0o97L2VOyDoBT4eRwZxvuaqUD8zz5hFb
	6v5A4A3/HnWGZXfjrulyraKFHPEDWzwF92YoC8oVDpivMZ8ZVbylN5HW5fx5VXMdwXrkNU98uNR
	nKIK1aYyF3lFfukMmNhFxU+QrsQhIptRxA02CexO3yVPgK3llssv/8dWnga6vyNI2A4vQinjQw6
	SxXxDIIOUyodonoxS8wjKYOEzN0bA6kNa2s0=
X-Received: by 2002:a05:6102:548c:b0:632:8717:e553 with SMTP id ada2fe7eead31-727d775fca4mr560346137.7.1781769741077;
        Thu, 18 Jun 2026 01:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:632:8717:e553 with SMTP id ada2fe7eead31-727d775fca4mr560331137.7.1781769740637;
        Thu, 18 Jun 2026 01:02:20 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm907759866b.28.2026.06.18.01.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:02:19 -0700 (PDT)
Message-ID: <2978f55b-0b5c-4720-98ba-e14ef46b1169@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:02:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M1lbHcPaOl9IJUPrdYnOb6GoGiaJnE5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX9qgEHOuyaABe
 c2JdqxB9PhS62VVv2tvp9OP8l6FC5Ufpn9EV+BIcjHewlGKYd4zWpan/Oo1ub2PisoJIHKDhpKw
 T+Pl5Jt8Uuej1BSgkiZHt20Ej9s+e6a4JaSpei0ss2U5mAY4u3zCrZ4PReW0fXDmH1fDxAEgsdc
 MU6WBmQnqqPyqg+40wZMJ5B+c4n6LkBP83x3YyuRYIW6/QmRet1KZBdDk39mRxSVkwgJisiBZVn
 ozJqEsyu3gwEia/z2dmQhOUsbBPxbUeDKDQJSsnneGbZJbyvC8oYyeD0BRuszY69Zzqe4A5qUca
 rGRhnWNkNhaj/f53Rn0KVLsVQynzdyr7KOTZC7AXSh12/6cf9nHyrHZhrersDoY+HL4IkGmy8Ns
 n+Q9KjS42i9cIvzfU8vpel6HJfSiTCkntHKeflIewRtSzb0vmRvIQVOgovK99HImvbMWjWedoWZ
 UXJriJcixZEqjXK80kA==
X-Proofpoint-GUID: M1lbHcPaOl9IJUPrdYnOb6GoGiaJnE5X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3MSBTYWx0ZWRfX21UW4quDxmti
 QMn4pJG9QWARN/KRWp6BQAx8c9MxHAfuGWxQ95wFBmXL/hSK5MXH4irddlB7IuzdpTOuUdeM77f
 DKIO5uHvxVzs5QNThPuXnPZniQl9u9I=
X-Authority-Analysis: v=2.4 cv=U42iy+ru c=1 sm=1 tr=0 ts=6a33a60e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NCwGtS5HQ1RdJiNybOgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180071

On 6/16/26 11:25 AM, Maulik Shah wrote:
> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
> there are separate domains for direct SPIs and GPIO used as SPIs. Separate
> domains can be useful in case irqchip want to differentiate both of them.
> Since commit unified both the domains there is no way to differentiate.
> 
> In preparation to add the second level interrupt controller support where
> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
> seem a good option either which leads to waste of resources.
> 
> PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
> of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
> all GPIOs as SPIs are allocated at the end. This information can be used in
> driver to differentiate them.
> 
> Add the support to read this register and keep this information in
> struct pdc_desc. Later change utilizes same.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
> +	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
> +	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);

num_gpios is not used in this series, please either drop it or
use it to limit the index in the following patches

Konrad
