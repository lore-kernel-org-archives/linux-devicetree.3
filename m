Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB9F2EA754
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066689; cv=none; b=JVZF/PEHHAxFZVQ44+Iy0LrwtwM6Jn5Da5purgn6wQDIawyS5ySDm5dTwOVfXSUIBAtLkCy8v3ZZR3afupzELDjhGvqmACWkXovLph794GT+MZWDMNk7HSoHfG1wbpvNcgFqkJv3WkzJ37x85HLUIzLRbrfiMxT5B2K87WSGaBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066689; c=relaxed/simple;
	bh=4wTI19B8l1eezLivABuTjlzexz4XaVMwPllNRiTNtD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYa05rY6ruVzSnDflrmI4+8BBf1F7th+1CFSzFWHK6p0L8sWxbqdHynELJESLnrM0yxa0pyl2cw5SqFSIBQo+iGUTQKTFkU5KDgj1edN2ijQMY5QCeesh09bCqtDcCYtcYRGqNT2FLaOW+qE7XXiLRhTBbDEV4J6RVXzg74IXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djtBa/vJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzPNInCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djtBa/vJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzPNInCs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s4nd3148185
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	23eKjFEM7rWU0A3xW//2WVDBSPpUqqI9TSb6c2Ke9xI=; b=djtBa/vJFNvQiElD
	VwvO1oykdeTaE2y7h+ZBq796eyB518uqRPOxCF71GDMWEX7Tw16Dy4w+GtW6Eb36
	BBlYQQgwJftLGngZbqhkri+KFVC+Vd6tO8h1pWkcLcjl+8uK1ZP/GazT2JNY/l1n
	EBBcGBA2OpXsQhO48vnzE5bZnBJNdWsvgBUTcPAwTXSHTttYRB949DcRyoV+OmPQ
	O5VMPePVK3jtXfLCfj7cg4PAslxv8/egeqGfC14/pIyPsroP9Qg4JEYln7myKsj7
	OiDY/hTwefF6/OWZs2iyDd9+ZNNTBLrUyDx4maYYXZgn6jp4UVJa55OUACF8dYQz
	YRrI2w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvww7ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:18:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so610070a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783066686; x=1783671486; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23eKjFEM7rWU0A3xW//2WVDBSPpUqqI9TSb6c2Ke9xI=;
        b=VzPNInCsY1tw6ao2/JqQP4LJyHIGuRwr6Xdctnkdi137b4OZPqpKVggVt6TdFzyh7i
         X0lLcjwiDRHJGcp1iRdZwBoKlUl4shNG1ElUj5ho43qwvnx8RbPt+Zm1LUZVwvwV0pP9
         lZiGp5Co+wLLt+HFiDRVQ7mAPDFZCHhfhHa8PUpQ3MfyJts8iZH3V3dcoy/X0PURfvo7
         ID2PKHTQn21HoNeCOqQfsl48poyahL3DbY5F60JZyAFz31hXZpgdWbpS9xi7BRfg1BMK
         gKjv2NVK7Ecn+MOHs/+neYO4/eJJRFy23NUNoU8df+LpwCXWf7XbJMhhoHuEzkS+ndpD
         0O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783066686; x=1783671486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23eKjFEM7rWU0A3xW//2WVDBSPpUqqI9TSb6c2Ke9xI=;
        b=orLDQ1aH0zanr0TvLbJ4JNDH6MbC9844kFBQPacTVUMTa2/ZPl4rIMIDItR11pYTwL
         hLcFr4tIyMnO3mIqRkWKpr7qtWB3etW9r22QFdfm/TSJA9WN1Hbx2UJaZNTXclDfkQpI
         /iX8JnaWr7B3o687OHQ7NuCWnUhMX+g7+uFGXOVW+Wn9aaUFGM7YeuwTkUngHwDb8q0x
         QelN/P7wqKaVEjp9EDHdPVyofqKrS3csjbBEYgz0+1JA7UHTh6HbSwvwvq3JTWrWZkwj
         lmzRtgc0Qt+pO1SScOBG4OC9W+EWcP+UPsVUGDnoPafjv4rOZ5P2d1xnVmp8trJTPCrG
         SWvg==
X-Forwarded-Encrypted: i=1; AHgh+RpxtMapE3beFkLMZBv4vMQQHJf/CJmJw7yUg0lM+W4zYo0eF/oywCalXea8cANJzeWkacOLg+8ovjIt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq25lg6W7p0Y2CjxuLQmnuL2ii5XwAez6iUfVlhBveNgyvhwd8
	7mqcUSKs1gbbsGSV/0KUaBTVzrQ56y9imYVzyziZX2CSPw0kaaZdm/7vVc/SNuSVBarj8P8PLzg
	Q4C2bLAnuC85pxG5R3gxVQUo553Ymhd7P7tXV81JUeGpXmTqh+fZHrHpwG2et73UT
X-Gm-Gg: AfdE7clrCNq9U93h9tSjjgCXaEkgsQshY2pgd0bxCJD2u5Wp0Pz5NiRRY5qHsGfcnGA
	JHwm9K23WZau5gRyjtmL71ZhVz4EcYzFIiDY+mrcW++REnf0mb+6XdHwW79ZYBKrhAWI9h3cU7T
	pD/V9Ew4uyQFFSgRlPqAFt2QS/GI2PZZ1plNMfZ6c7zjTcjb7w/2lC597EytG0/cm4D0FHmaKcc
	wGJfIvsi0ih5x1f8WNDB3wc1fJ+2Hcx+RabnWivdTfSCI1JA8tCEOor1146a+fadG2ZA9G9blbq
	z0Vfdgt6gVw8aOytuj5IaTt2qQKMKStiHIaDWQ2+iJovyoe6V2jeRQCNGOutdOqXFmRW4swc0K9
	Zbw6fd/NWSE1ZQNqYoiVTOZu1z00B1MvX1BDasK7k
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr4282412a91.8.1783066686334;
        Fri, 03 Jul 2026 01:18:06 -0700 (PDT)
X-Received: by 2002:a17:90b:528e:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-381120f7aeamr4282382a91.8.1783066685900;
        Fri, 03 Jul 2026 01:18:05 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd221bsm18542336eec.22.2026.07.03.01.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:18:05 -0700 (PDT)
Message-ID: <9a28915a-bb1f-4ff7-a981-1cad6717dfa7@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:47:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-4-4d8e1504ea75@oss.qualcomm.com>
 <87h5mkqdmz.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87h5mkqdmz.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gtdax5Vwk3ObjmuLZJJacnTm-98hJetm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX7MEHrFz1Kjzc
 oJPCXKX1Zdb56/NmNoS+C9/NLNim+oTmrk/HTcMJ5F1Y3BkJcVx2bIP1LI7vepmWo7UEd+OMYqs
 BTYFAKEg0mtSCbTrf1v4/Cz7W8ROnlBbrz0MMKiSX8KdBMZbCp4A0J+kgZa/xB45lvRRvGC9VyC
 uWQcN38s6p5qBAj/P8Z377R4JyRm6vsRsc1Jv3xjusbilrZabC5+VpeAxQOXinWErOiN5DIRDUb
 XfoMvmlj+TMnWswWwUDGl1xLE/ADNpZBRnheLsBNTPLm5lK9RbCt16mm4rJO4a3GZ98S+djyFcv
 jpYN3L5t7OuI3MlURY5XLLFkvgzqe5CVq6VXyP0e6t1Ay/G6HtCJ3HzBnFdCM5sg20OAmhl2Klm
 pXqYJfjp5tC8T9Dxl4WE5ahzcANibcn10P3j6fd1PJLwMd4nPnnPEUykvLJl2IhhGeRIOyujJ5q
 rftqC+eykYcSlwD+KgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3OCBTYWx0ZWRfX+4jROMOPxjS3
 NpCrb/ch7i7SHaRo5JCKTzFhBt9jlUTDiAmPweIUu1tjA0f41EdnpUYHDOLfS3kC0w2lgZpD/Kv
 EjD9DtpnuSiGefEQzimncKyxJfDLnOQ=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a47703f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FlpyNqKR0XVUcDgMYHQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Gtdax5Vwk3ObjmuLZJJacnTm-98hJetm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030078



On 6/30/2026 8:27 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
>> there are separate domains for direct SPIs and GPIO used as SPIs. Separate
> 
> s/are/were/

Sure. I will update in v4.

> 
>> domains can be useful in case irqchip want to differentiate both of them.
> 
> the irqchip wants

Sure. I will update in v4.

> 
>> Since commit unified both the domains there is no way to differentiate.
> 
> Since the commit.

Sure. I will update in v4.

> 
>> In preparation to add the second level interrupt controller support where
>> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
>> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
> 
> does not

Sure. I will update in v4.

> 
>> seem a good option either which leads to waste of resources.
> 
> 'either which leads' is not a parseable sentence.
> 

Sure. I will update in v4.

Thanks,
Maulik
