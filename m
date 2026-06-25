Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF10382F1C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379235; cv=none; b=gKiZD++wGsvt037bVDVK/cNd82xNramtQ159sjsZXsf/IN9RGjPrEuX1efOzPkJKqAfOxKRj5y2jAtjrdXoYEAHWWXpQRhm1o1RlgMsU3YWgbXhlTi2Kgvgqt+gg48fMx/YGhWEU4Z/0RMtCUpsDLDI+OwHXyHr9YuLJGtfESo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379235; c=relaxed/simple;
	bh=a5gHmSxXk0EM6GiLK8Z+ZY9byqUmLddQvQJnA9muWik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVc781HpTTKbaTSynzTxGm61E+apt7WT5nqK/TOa3fFSneI1HowMn5C2ITaf7pyQIMghLvWdak8PntjPxm5UHpgLIw2mTz5kI/tiL2Q2TU8A0I3mKIW+3rCJrkuNEWS3KtAopN9PywuG4v0wEIQEU4xO9Z6kJIO+AG9F+WbwtrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3NdIUAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYZ47hO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3NdIUAt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYZ47hO/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pUi04096686
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6owLxNlPkAyRM/9IkXm18k3Rl3GttwQeKqnecszV0g=; b=I3NdIUAtndd/nf4W
	E5mbzdnvQK14a4uUHqC3uWz9nRbLTxCTI2AJu0nWgQfxg8TutVVPs0/AHuqKiiYH
	i7saDfRYRh9017GAaovEi5orCvrdjUNrD2qE60KAKl+Daz12d0mDN3h84WyrzUDj
	CpcE5iXPm3RsagFjOlGFgAJt2GwwDctIjx1RJeJ4PA9mOBqHakATYnYZmMOEtmBE
	XclWfZ3xSZVG/a0p/rE5kOj0sAcF7aeew67URAsOrrstTkqpkHzC2IcUWS6d8FuF
	d3w0shW2LyKWdSgeB0oStGEhLodzHzusXfKHvQhMaDl0YHnI6h3hMw4CrU89D2Sb
	sGpfrw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tspsppv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:20:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84534f17866so1863880b3a.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379233; x=1782984033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6owLxNlPkAyRM/9IkXm18k3Rl3GttwQeKqnecszV0g=;
        b=BYZ47hO/1Zxlxnq126OZ0LAr6AxEsYB2RAJwb6U+nrFsgEpwYA1hx+WVZD1yT8xLyT
         P0Ks6EatwLYxiLxu40CQs6IFzsu059GM0tqKVIPmWFFrETIxnSn1xQy46R7kLdF74vZ8
         pVKWsj8F6OHrcPEgOlWxvEj+VyAcwlZaUXOWJsvQ9QBgWnPtlXv55gy+07PXqKj+gYwm
         cA8w3ZugNpk4g39A7GqS+G63DoZOgaMtk9neaZGhRfdnLfYGyBeYAH905uFUfjtIgu96
         6VXob22d4YWjo+lQItKQler5h2ShyEWL3GmUd2pseUWJAIQHCiI9MuO+mwSIMFdwl3ZH
         8/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379233; x=1782984033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6owLxNlPkAyRM/9IkXm18k3Rl3GttwQeKqnecszV0g=;
        b=pchzxjCwcGf6gP4ln0KA+LR7w+XOk2TexFsCo9zPlMaQcSd0sLghaN7qv4utV8keBd
         lcrpKflofUkFCMXC6YaDeneEBR20kbZZyI211A6Je1R+NTvVrQssnFjo/zc509pkvXoW
         yGt8Ux0nvYc4G46HuJ5YPvGZhKCS1RSZkD2tknVVJkMjisG02UmAHaSFMkcayo5ZXkJf
         zULn6YrhggKtOh1ZHvU1sNsHgzk8rSUDR/jU6kPSX3W1hZ0C1PaQx1QEcTZu0CTHLwLG
         rQyNbB5W3JgSwFp/kCZCfxi24Bu8ewoMaR6tq6kdRYqqkeiSdYkaL32Pq13NDDFF5kpY
         KtTw==
X-Forwarded-Encrypted: i=1; AFNElJ+X+2WkhQtbob68MLZPIeXUYecetjTjj9UXRY9QALFCw39qL45vgbghS7HJ8S14wFTQ68LImhOTfeL7@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzPBQ4eINetHO0U/lboYD7R2CmfO7VAn13bZ4Vo4csFoxZsoG
	/iYV2nCsJdw8zAALQY/xz1wUIGz4WZ/U2FdmvZngdVLzLkoSNtPUQQ9i3doUWVyznWNCpeRGXem
	3d24Fv655eQ+44X1E8jXFqss4WOJdFB+uPX5WLy118AH0+q3AiuIBM7seLWy4sOCKh4hYBKTC
X-Gm-Gg: AfdE7cmpVwpQQao1xyWkWvHYq2rZfJOR59dMkOsTl6kYTuR8ZxDIETKa2jV6Q26AxFl
	vpiSJ+yYSLMxpjOROePgD6iIqrPbwmc0EqMddew3d8xQoKNu29Cd3b4kthGi6VnHIYFbceTAGie
	PgDeeEfmXYGFlq2SqjZZO1ST0MUXtJK/jR5GCwpb8XYvDNSVnZzyjsKfh/hv12dcyZ7J/f2o5ZR
	m/4xIBLgghIs7NrL+ym0Sloih7zEsNLpDb7ESpdtcjleu/cz3z5zjzb3ozGtYsEyZ3Cn+E03E1L
	YT3SHpSlRASyJP92gUI3FRPpvPgxejRS4Les0EMZMbF/Bu7aaDLebRz+hx/LJN3e4S8gZdICNPA
	mczJ29qqdXySUd2YqxVmi9wfjsj6xcYfIGsBFPg==
X-Received: by 2002:a05:6a00:340e:b0:842:6fac:bd3 with SMTP id d2e1a72fcca58-845b3aae9bfmr2112858b3a.28.1782379233039;
        Thu, 25 Jun 2026 02:20:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:340e:b0:842:6fac:bd3 with SMTP id d2e1a72fcca58-845b3aae9bfmr2112819b3a.28.1782379232532;
        Thu, 25 Jun 2026 02:20:32 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc696sm4340835b3a.4.2026.06.25.02.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:20:32 -0700 (PDT)
Message-ID: <cff027cd-9ada-4a55-af43-2ad8cc27af89@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:50:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <2978f55b-0b5c-4720-98ba-e14ef46b1169@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <2978f55b-0b5c-4720-98ba-e14ef46b1169@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3cf2e1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fkzGnpFETygImC-9BAwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXz6v5b+9GSHiH
 MLV4GgOMZJCwc5dKEX//1qE2Bv0VCHxtp2lRFcxj8pwBTzZkL211y9YLGn//HE/sKuC4D+tWr8J
 yLcNrsFCeR4Rl5Pu+DMtap5l+atx+CUrDJd8a7+ezfwlj24CGuPojryzsQnUiZNRvdnNXReWVzE
 KmVLZxhrt9W1jfJefeIbA41rTPhVmkSfZBlBDDwYafgi3+j16tg4HtC0oJEh0uMWXz0MUzaI1+W
 EpT5zfS1MJsg98DfSZCK2Fxzp0zXCcj6hqfd1blwyk4+3WdUa4chKyrkhBxEKSoi0K2jRPZjvSs
 kpV523PiXBY1iuRYzGavef9UTrvNSupkAaw0w1OGloYY16fXFUvXHHlfXIYNycxlfGLPtw0whOx
 VCjwJpMsH2V19qurqQoQABWN5lTg6YZTRFZdWgA5wi98+0rKe4l40naTjU0mvuvGbPaAEDlCRAw
 CLPCCBN1L6YSNW5ts/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfXw3IpuMPXNUaJ
 lj1bb1mN9EPQuI+2BVUd+75FN7XetoBVhbvFLWd/2wieYPUBiDICUcjhNeryC9GUJ2IwSQtID0K
 qwyKAhhtA6AHbDWXxA/dw2/W4Tfya8w=
X-Proofpoint-ORIG-GUID: Gi8s9S3r2Kad-bMT5ODVMLAW9dXyDpze
X-Proofpoint-GUID: Gi8s9S3r2Kad-bMT5ODVMLAW9dXyDpze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079



On 6/18/2026 1:32 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:
>> Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
>> there are separate domains for direct SPIs and GPIO used as SPIs. Separate
>> domains can be useful in case irqchip want to differentiate both of them.
>> Since commit unified both the domains there is no way to differentiate.
>>
>> In preparation to add the second level interrupt controller support where
>> GPIO interrupts get latched at PDC (but not direct SPIs) there is a need to
>> differentiate between SPIs and GPIOs as SPIs. Reverting above commit do not
>> seem a good option either which leads to waste of resources.
>>
>> PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
>> of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
>> all GPIOs as SPIs are allocated at the end. This information can be used in
>> driver to differentiate them.
>>
>> Add the support to read this register and keep this information in
>> struct pdc_desc. Later change utilizes same.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
>> +	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
>> +	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);
> 
> num_gpios is not used in this series, please either drop it or
> use it to limit the index in the following patches
> 
> Konrad

I will remove unused num_gpios from v4.

Thanks,
Maulik
