Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB846AEF2
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692593; cv=none; b=SQK/Kwc2EsK66C1esKHI5PhMfszrPuASo1HOQRO+/amSeI+CI7Qldwh89PeXZWaOmsV1Bs15gPaOT3sEbazT2aag8j44MB4wJzjGXM7RiDFO9Fytssu4BN7kTDHJwcORfeJWDP7k0AkMeQJh6YCJe96UzwPUtxAXhUXNjP7ZwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692593; c=relaxed/simple;
	bh=KnTuYeZRW8y7/0KsX+KsMVHS3o+Iun6XoHfPR8REoOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xzf8vPX2RGXorhS7wFj7ddEAlXlwuDAYDMjrfvpoka2m1gb/W6MDgnTClH/7yIF4sGkYr+h3q+TxiilDhs7ddpYE3QtPmDWcd4uspkG0cvtFHhJ6LRGyy4qqnC0zNmUODdecgFMBWYoPQE55rfQLCxCYHlyUE5J2kNkZr1P5I1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj6tap4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqsx2Mp7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hj6tap4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqsx2Mp7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UZwl2217819
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZE/UYjH0ajhhmsX7fNo8hWaxZ5NU8yaye5JkX/d8D8=; b=hj6tap4s3U9IembA
	xIXPtrZdvMZX7kJdB5YSJ0FamtjXDYBiuc7wNYMJ3pSh8ylAH/d/G0NTYga78MDZ
	+6ay6cKH2B2/7yXbtmdjNniHP4TWL5AFyEtSL40QySt6PFnBy9zHkmRGc1yaz+00
	vrwA3Z8pebvzFTYcZi5tKD6tdrLCmXlyMdC+Y2481yar3jRrzoyD8J+BKNM0fLCc
	6oHbJ+9KUtYAYnXWT56pQC8NLYppgMs2UvWBd55YGrFKAI7iNrIGRkEhSea4JCpw
	2n7NRV4XK3vmuQwZblO+pKrTjC0EpJtY2t6Y1g2VRSEBOg0+/vZj6ebfnQNslC4p
	QcLSpQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueeraqb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:36:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178a632a12so13646661cf.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692589; x=1782297389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZE/UYjH0ajhhmsX7fNo8hWaxZ5NU8yaye5JkX/d8D8=;
        b=Gqsx2Mp7UCY1pbSv3fbD2t/bjt0hh3T5Uz4L2OzPWBZZD3VtGw6kPME4WJ/o4LTqay
         Znj7yI9M9DTgsjqNgyPemkplBSkN5Zxv1TiAUwdY4x+hxsFabJEAwwcbOTlAqHTs2/yV
         tzWR65E+40B8RcSJuRsqpZ/jK9RYGe3WdV2WUYFFNwAZWlxCvxGWKe8bpaAnhfN6gZBJ
         2dxNEnqjnMMHvuOLO06WJB8zeLQHLN+ekQsybMhKy826aRYd86eL0lfvcJvtDrDcVqXP
         24BCMadOuuq6KzcinhHqZHbJVjbGdxdf9XigXP9GlVLE9O3enVPkCel7LHz02+UtgCY7
         poew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692589; x=1782297389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZE/UYjH0ajhhmsX7fNo8hWaxZ5NU8yaye5JkX/d8D8=;
        b=s71B9iGBNW2X44faqb3zTp4O3FztcIukdv0/gZ9KOSmLEZpfTbNuZQEw5HkbmddJeV
         MVkZzThiTRVn3O+PZ9AprZsNZA53RwydvHpb+la2Ysn+Cc7EjSxUMixnZdoBlqsBrlOE
         3XotmA2ggl5l/LdDoIfmWyJqdiItGiiJDCfzp8sUbaTBAkp2CXtQ0tlXlKGPaEftM7hN
         F8xjEps1gAhcqrE0rGbyDHcwrkaJpzIW7ktqtX1TSDEYOtVRMY8Qtz+dEgzgkJbreR2Y
         WOGeWRWKDEn9/v6HxjOZmwa5ow8WVZRiOws8lGuAFcbtpFOe7BdFE5aOO5t29LLZPFP1
         plEg==
X-Forwarded-Encrypted: i=1; AFNElJ8/d60rJE7ogAcgwVJ+HCkRH/WPhMQJPEiLtxgN5clfADNh4/vxYAX9VSoHogKoP997QoEBfk6XO1CL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywskrxt+9Q6r5C9Y4Gmvuc0EsFMsIeeFyNjjR4HxhENML24wOvK
	3OgxqJC71nPrjXfJrvuVwt5rVlrNxr73q5gyO/75Tj2kT/IRjIzcpApuF6KbihZWLct6yLzgPT1
	L7hb6m93jrhu4Q+1FLoJcES3qhscESZbAuzEan5FVn4GQ36I8eUdXPe7CfAZQZWQA
X-Gm-Gg: Acq92OG4L8droBGarySd6tF1TakCPp+n3OwFnpeFXvLQ3PdxiBIWZ0PqDkaCzRq96C5
	3k7p5HiC44/JVe+AqKMsIyuxK25hUKctueAVUYSQHi4rLdYOojTP+zG/k3HS1qesPwXPc2y/t7T
	bkzE7cozRneQrB2LkD4WLn140R4kFIGjcdhXitUIuX77ZIsEXyYDbhtCuXRSAFRCQqCXDqbKDNz
	CNHVa0VMhFRmYk2DKp2cI1G8yj0GBiDDQ1DpPFxPuRrFdD8WhrV4n1rVnV/r8mrNYn3gsYWQ023
	dwcSsDkuYADZyK/tW8ZJJPnWrtADuaq9e4FfWMcVD0dhu7qKkJuCqVa3dg1gORNqeqr0tZ5b9FC
	21RSs5MsnowFKS6WjXfdb6YJjb4czKiFoxLk=
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr252973285a.7.1781692587559;
        Wed, 17 Jun 2026 03:36:27 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr252971685a.7.1781692587168;
        Wed, 17 Jun 2026 03:36:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5103710sm773989466b.22.2026.06.17.03.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:36:26 -0700 (PDT)
Message-ID: <ff72dd25-926b-4a51-99ad-4535f6025dcc@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:36:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] interconnect: qcom: add MSM8x60 NoC driver
To: Herman van Hazendonk <github.com@herrie.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
 <20260606-submit-interconnect-msm8660-v3-2-f9da0158cdf8@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260606-submit-interconnect-msm8660-v3-2-f9da0158cdf8@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfXzIVJngNnJorh
 KkxwvY5FmLLxuY1sDryQEw1sZYOhs3BPKW8QEu9LfGoK5njmMCU5wmIqHASwXVjrACuLDtY2LMX
 cQNjAS5aSZvdKD8xXbFLH7fPxztLvZ0=
X-Proofpoint-GUID: 76iZ-GCaRJwpoiYVRRBPNf5KEsY46Ef-
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a3278ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=eFASmHcy9aB7nxdwtpoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OSBTYWx0ZWRfX92K4nDbx6Ed/
 Xe1h9D6MJpC8mnWrpplXUpeu5hN714O/m4K6LeYSGRWdyaBoOX/6MbEbbuvw8pLs3t8NNvGEUqJ
 wDxlolWLdozMD/B59NGwnfeHytWJtZlaOkxfKAIo6BaiIpSXLNIjfPjFJ3PzSfKUZn+nC22MJYJ
 mElqVgMKqkKP68U43RIoacFA0ibJbA6YB0MdH0puAG5PZSusy4zuMAdO/mweDY32gqfdVY2/kwa
 foedHnb4u8XcW2+nFtV+KbIG5TUN64NPbKgauhyfTRDI6q0ZnhRnVI11CAatSnmSPIykcENOmMp
 eWqYCo5CP84FUg6vvrgEKP1aLXlvi0CyzLGaL2VjwyORaL3vLrmKz4hhk+ayn2BR5oyZx5Y+mZt
 Xn67PLsiixioosus4BkmjqJrjGzk7TvP9Pg3iskwdq90EF6MSZz9m2CMfAshlJUsb3nx6Zf9lgK
 +pOKVfBdolaTBDf8i+g==
X-Proofpoint-ORIG-GUID: 76iZ-GCaRJwpoiYVRRBPNf5KEsY46Ef-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170099

On 6/6/26 2:34 PM, Herman van Hazendonk wrote:
> Add a Qualcomm interconnect driver for the MSM8x60 family modelling the
> four NoC fabrics (APPSS, System, MMSS, Daytona) that connect masters
> and slaves on these Scorpion-class SoCs.  The driver implements the
> interconnect-provider API to manage bandwidth between specific masters
> and slaves via the RPM arbitration tables.

[...]


> +/*
> + * Minimum fabric clock rate to prevent bus starvation.
> + *
> + * When no consumers request bandwidth, the rate calculation yields 0,
> + * causing fabric clocks to drop to minimum. This creates bimodal
> + * performance: fast when other subsystems (like display) happen to
> + * request bandwidth, slow otherwise.
> + *
> + * 384 MHz keeps fabric fast during concurrent MDP display scanout
> + * and USB gadget traffic. legacy vendor kernel docs: "AXI bus frequency needs to be
> + * kept at maximum value while USB data transfers are happening."
> + * 266 MHz was insufficient - USB crashed during display activity.
> + */
> +#define MSM8660_FABRIC_MIN_RATE		384000000UL	/* 384 MHz */

Can you ensure that through a vote in the USB driver?

Konrad
