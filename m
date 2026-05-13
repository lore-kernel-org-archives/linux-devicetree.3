Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC32DEA74
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680884; cv=none; b=nTMvTtc+MM11uZf7pwAaKUPpcCYPRmXRSm81uH06iGbFZPUesePEtCTLNm0U+MkSO029t/Ct5cylVcFcI2Z6BhmTlwe7Yko+TTNME7GZUusXnqM6oLazMMDHr8PRJ6crv15db6yLLyTJkXk8sfmhKLKSHnP+fcZuxTCknv3k+dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680884; c=relaxed/simple;
	bh=RR1P+F/lK7MWgQTUPi8VJdox4tXBmbdLcyaJFRdb5Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acyLAAdZwLiswugpEfT5FGXsNOZtRTYO+xrDD7HOADujZpUcGcxOSVFEs/LvGlVqEirqT8gx04qjAMHHUUgNKcGj1dvA3g4+CwMStnzbdvnpI0Jzw8dgYimRwU2n7EjA3YUR/5FCy9irsn771wzWDb8nCizxxK/4npOTxmCha1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHZJVhkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHbqQuFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHZJVhkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHbqQuFt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D9jggV3007378
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W1d5o2XJOwpJ38A2n5YuZxfC
	k7Q1SB4UhnBShn0r8oQ=; b=PHZJVhknZYvlYbLQnPjjS6OE1Frx5EwaUWO4uqA7
	/Q9N2hO7Y1mHMqAAp3jbbx1HzlbjSO4dh8kgb7gOleBP8CTxMZoDM7S/kEp2ZeGc
	Zn2FABxXRGcmTCvIBUlfhPj7RstokeuEaETrNxXNPe/dU3y7VsVfmK5Ke6G2ezRO
	1MfAMHJbsbHxHrGOKfiEh//H+VRcQlY0tsbqyoMGEas16O8DbgZ1blO+O1gbB4fe
	K9R6eNcBQIHrwWMBXPFPMCpytgD4wC9F8vCDzdKVm3mOi6RSpwfEkktjBcjxQHhO
	zjX+ZCdFCrJhX3uBK6sz3JnXWWJgnMu35p18jXj+MLEJBw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0gwe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:01:21 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69b4f753046so6422825eaf.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680881; x=1779285681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1d5o2XJOwpJ38A2n5YuZxfCk7Q1SB4UhnBShn0r8oQ=;
        b=QHbqQuFthvFVuyF5kSp1/7BpqpNI23olNIC4WTEEKpKbmkTIqcfJe1iA6/GcuPJSKX
         OhfXk+EzF1y+Ci+elQraP8wREoTk6wFveiyR81UNV2lZvDTbqn9VwMBa5IE/etRsjRX7
         3Y4DI2dniN5WDc5nk63Y2OYZ+3xus4q2vk9gh1kF6GG1fQQn3RxVRpfr6LDLDCBlical
         ZEfBY7xb4qafmTFw9ZtlbmpL/DtRwnr/NGyC/MbLLeubiq10uqlzc14kqKVoG/s31Omk
         2J5Iah9zB1SyK+OOclcwScLj6mbibHQkFlLs09bxcGFxtxYkf3eWzHbYrxXH/2f+jKLf
         XJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680881; x=1779285681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1d5o2XJOwpJ38A2n5YuZxfCk7Q1SB4UhnBShn0r8oQ=;
        b=MCikq6aBd/1pg1RqYgfJq0v1LP2WORJVIm7H8ze+eXtQSe6pdcfLjNBH0mebK6Ls/X
         Kyn03jKSrICyWORw5iJeNCF/zf5kVL66bYXDQ9tgIcT/flb6CZHjM2NQeqmAYURunUQL
         rNE/vF6f+r6RouluAHWIgQYe7Erkjiv5g+MGrVf2JE/GFfIUYPmKWr+X2chYVHoO0bGf
         P6k2c1sfVJBxaipq75rttxDLSMBtt3uu9FP9GqbCmdqtp+FIg1so1VPoeHnfoCYH6uTp
         /pCiWQy5MChLA+/49EzYbOixO2E+4888MQkI4nVWkKN6f+INTLKzuRf+8uxhsLkSFudd
         y0Yg==
X-Forwarded-Encrypted: i=1; AFNElJ8V8OKI1vI6ZGtxmfgrMUwMcwWYpcqqDqpRLEV9Y2wgF8+bs15hvrik5tkPrNwci2bh7OgrGudiNrmf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eJKRkm1gG9DYEEOw+Jmm67DBwDUzLgwn+Q5BGat8HxDu9P42
	vCgmxLsMSDMPpShIPcTaJYmcZBmWF/TwfPO2LQQdHdMnemeTnJMUUGJOClSXflXP/sidin646oW
	A7AFKiMu/LK7X5QHqLxlaRPYU5QHWc4GD7XILxzq1DT2Uq3x8dkncKqibLOIlS6/B
X-Gm-Gg: Acq92OFloSXU6FbxfDK1aIV2RYYYHzJlDFeqlG/4y9cg2TKMCc31uVxhPHhVQUcMfec
	VMBw5BG1nXEvUKdVogq+dPVHaba1UAVWqlWKlEhNQOpztSUSAQIMh+Rb56WkrEhe9hgk98cidYm
	ONfc8H+qu9hXQwJv4DPQqTd5pChTp/NeBt3G2XvcQF/IWO5vUVkZU39vve3yi5McGQmxXcfaKaL
	fLAZ//Mabho04SX1ts2+/RT6ZqS97WgjumpAkqs5CyeQ7qgS1baVumA6c4McFZSBvqLQQl5rxFJ
	gPllIrxDQXySd6XrwasR42lO0MGj0KAufb/678J/XN1RykRdFXywCbaQVuSaj4HxSfRLlxBTqWM
	2CSD6A5td8cwBZNaYz9eDLjvQ0dYmzaV3tmekE4Uu69r0vewsBz0a4Ahth6pq7wqn6CSbd7mX+Y
	099DYT1pdR2b2KFXCtSNkd/uk+Q8+xO7xH5i0=
X-Received: by 2002:a05:6820:4d09:b0:67e:160c:36c3 with SMTP id 006d021491bc7-69b7ab72c62mr1431515eaf.48.1778680880750;
        Wed, 13 May 2026 07:01:20 -0700 (PDT)
X-Received: by 2002:a05:6820:4d09:b0:67e:160c:36c3 with SMTP id 006d021491bc7-69b7ab72c62mr1431475eaf.48.1778680880179;
        Wed, 13 May 2026 07:01:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f610f5b6sm43728381fa.29.2026.05.13.07.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:01:18 -0700 (PDT)
Date: Wed, 13 May 2026 17:01:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MyBTYWx0ZWRfX1qwJ2O6JhkqA
 iV3o8Hhk6vlwRfvegT1WLhvwkuk9kThOa38bNGMp+GJf6JrcGlZNDw/o6YYTNNqDHdX26Whd6cy
 /mzVO7fqwH99a7nzkz89m8DuoMqQ+/NkoE1LaPdfcA4rRSv6H7+zx9rPN/KUzFq9/GVpIH0HKPk
 wdd6y41To/aCc/DzqQE1lqtE6K259RGKRsFo/Iwd9SdbaBMwbs/zHDapd2gWvag9VBdqGj4X4Uu
 6KZHDEOoU5zZ7fKYlNLyEP5cetqrOMJkIrhfjNmqk+uA7MeXcqCYoOyfGicDFV3ceoYRKmVLu2e
 wYVhXBbmEyn0Ldqi+n8TDqiBL0KeMBI8hO9n/MfuN/2r2trxgsUGMZ3OKcpryQJp3HMT4tA+Wyu
 /HbIG8kILAYGEjbRmWvHzxezcyQ0kRwXe5io/2HVc+bD1I59NJLBef//t9R54fFvSHdWJivhAP5
 nj7csP6NibkZZa7qD4Q==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a048431 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: xGVAdX6F71xUNNsFPkb82Dmp9KyY3u2H
X-Proofpoint-GUID: xGVAdX6F71xUNNsFPkb82Dmp9KyY3u2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130143

On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 576 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
