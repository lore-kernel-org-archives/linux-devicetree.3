Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E54E8E0C
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558181; cv=none; b=L382gBPgiuCjFBgZDzXT5KArACQsZKC5IbBTSgEt7/CxQv8SSxJrDPz7IZ5W2efkZDdYKzCLdjCzt2L1zkQAV3AHfSJA+ZniUChFnUQn/wXWvAtcz6Vj0LHfmVBwdsk73osDvkmSHp25WYtl5wkooNuyDOZAa15tX6h4W0nIvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558181; c=relaxed/simple;
	bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktmI5lCGaEV5NQtfvc98hZkipgb/3gEIiPfpmr3kLc/nr16daldCEPe2O3xpruVItOssLbZHpeQJSLLfTzil1/iXMpJHXj9xEI1WQf3OfaUePNK7r2PAXEIoVigKm77tAeIUGAMcyz10YmjTmFkkfHwwYDdPqZas2YL3SpyFDcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpaVmxwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRqbQr9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpaVmxwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRqbQr9g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92vcq1721233
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=; b=RpaVmxwmyMOzIZR2
	kDtAUBfg0AgHqU/RCVmEPDCrMJeJojOW1JMJj6bcu2EMqnq7WBC0udXk2Z9Nn4UW
	8Cmq/9vRW1eYdIGR9/CTrlJrXIyOwHBVv8Ie7Y9cZZ1yfX9zfvLzAJ3tO7xo12FL
	GZwZDFYhxuXGaNmO1TZccEbIjv1vnzM2V+Fv0R3hv9JdvaBWxstghFMkByY4RQIX
	aCjUOWdgbJZO6o5qi+0odHi9CirbRcF4CZXtPkOrJ9NRQMy5OhfXGqXcXLyL5kiA
	IizjnMqkj76flYJdyB17ezA5H5HjLXjY1IOMCJhErwSiIQH/uRF2PwOdxt9xuXdH
	+KsAdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkjy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:29:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so6725866a91.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789558163; x=1790162963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
        b=KRqbQr9g6uozhpNPNonaC8YUaeV1WNp+16x1ZV6eD8EwRz8ugkqLCMqKWsmofP+Owp
         4h8fJqssxjMtnWK2Eo+D9/OHvZTseb4sIPx1NFr64R1k3YjKHhiwDQIHROeNaMXbeeNu
         ZW2JC0h36WR2QKB1OysxPMBMzCeDcOyWKE6b6ysWzMybPXt7iQX/xQM20vMvAIMOncBz
         RRUORFIOr1ca9TQVZyCscNuaWtiWuBCcRKz2Sjwie/tJaJZdG88G8IhLv5AtdtCPsObj
         vxhKfrY6b005/mrFRa7S+26YEtb4henfQgHh5j4RQ/ymjDwxvxZ6LEVT2XzsRiT/LGT7
         VmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558163; x=1790162963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
        b=2beFhS4ezNeFkaWIQsGQc6jSC2iAjxm1zhqQTD0qZgfUd3B1gou2kqJt4Kd58x01f9
         Ys36HCi3hQ2w2IPt4pZ2HY3azND7GiY9xtP3SwTcefiv5o6EBjqIpU7goAxqZ4poWqfK
         /ZwdBYIOjSycN9R43ZaM6TRkD1MtI6mOHxMi8m7h//98ee7FwqEXd55JDXpNSad7FH80
         ae0HuEmDCHvHVJy/8ABIK6KS7ou3QtGjMqRWhSWT7ae5lLTwRtfMCPErRC8uYJc6x7z4
         qe9xmoq11f2cz0exZHpOkYQSbcdZyg2+Yk3yZwpXaAa3Hq9SqhTwRs+KRxnJr3+JseYd
         PuaA==
X-Forwarded-Encrypted: i=1; AKwUvBx4OS/ZNnpjnMaX5QAp5dZfNIzsj8Y3bmd64M8s3TotKDopdJ9Zw2l/Bb3mFbQ7Ihd/4+B/eoa7VyJ+@vger.kernel.org
X-Gm-Message-State: AFuF++kSHB9w+wsESF3Hy5wcIjIKF2SzqV5PLn25lQ7hspfnCkr13mGn
	jDqzxGYHFg+OZg3+ifyStQzz1rA38Ft1+7G4XDtFFQv2rRYqkVPKldqzSA/Lpw2nmDG1SfMOd17
	ViY/cANtSgMDUgfhH5fexP4ffASe5Aj+IfNtjayWaArb9/dhb+nJA2RSydk2FKWgn
X-Gm-Gg: AYBFou2rfuI9Yx4qn6lvRmgTfMpmtBqbrUy4CVP8JK5Y5Y9KZp8TxB5XEnWxyL8VK/u
	IIrX80AQjHwH79es46obKM/bdHjNQISC+QytkaDVuc5oQZtFM0IRi1ogxs/S6T0kbQGVbJSvqhb
	4F8ExABoh09utTS8lDTN9I7ePzQQqdKhWwqXjW445/XYp8xNjDONiL2wqj1bqaIDZ+NYDIbKs1h
	3f9IyCkcmGz2CAIT6q8z/HaPPo2aEXLMgesMcRPxXe7CRkD0UlCfflHk3C35K6ypy7rcRVW84aM
	vrGfPTtHAG2FLaHdCKXpwESk62d2G8lIzWIcC+jlQufovqSoMqXJ6eR+hMUZQXLXRcg+VF4Humy
	CZpb14Va4TyT9f6logZjIYgdJUqkh
X-Received: by 2002:a17:90a:d444:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39e1e314c60mr5919079a91.9.1789558162625;
        Wed, 16 Sep 2026 04:29:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39e1e314c60mr5919013a91.9.1789558162159;
        Wed, 16 Sep 2026 04:29:22 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b71428dsm4356441a91.10.2026.09.16.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:29:21 -0700 (PDT)
Message-ID: <5dcdf9e4-6be6-4481-b5a5-0d3a7784de9a@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:59:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
 <3a2f535c-7ccb-4b50-a6fc-f73ec02d4acf@oss.qualcomm.com>
 <78a7700d-32f7-4592-8a50-c90175338972@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <78a7700d-32f7-4592-8a50-c90175338972@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa7d93 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yuRkgBCuwwUBbEn3D1QA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfX2jLza+H2ppOP
 N+6WeQ4wMkUCa6tb+BFLikp7qEAZt/5gzZS5nJ4tdAxqNtx9D9f5kIQ9nD4ubzygOZfBwlTbK7v
 vEHrmJqUjRvF3+5GFIF/lbhnWj74hs/lKFBRPZ059zk44GbIdrmyCJlpyMn4yV9xx9Hf5f6QtGZ
 uXVY5HH40YWDkQ536oO1ptsjejdJbUu9PeDz2TkxWZ1iqZwtcE5PCNRnTl+qjHxXq6KlXuccNSF
 WPJxepGDzl2CTEOYIc69gtsFyDH/aTdyQSsRmrOeaLZPVoigAO0TWOgD53hJ2aEz4nLU0OI/Fn1
 rXNQRi8rlXYrsuEy+48UOcZGBldm7O8tHL3cRhXXBX5vfPgoOEO6q2nHF47kIKU+M1wGA7vaPeR
 NB4ULfM7I+qSnyS6qETOALjrI16NavCbqJHYTASHsfknFh6g9kLn52qHEyhDq/jiiDb8vyW4IYd
 FifLhvxFhk7NZahyBYg==
X-Proofpoint-GUID: mRNEpe0EyOjgLYvRVO5KhaPHpioJTvlz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfX7aiqyOsTuJ7s
 TbUarZ52tIMCQ1mz2AmKILnSEshww8R10PpuANDhkEYCd97t6Dj3xjsasRpTmJKqN6hhkrJrTkU
 X/fNJE4RiCKfKORhLfn2iJbGXJyPwTk=
X-Proofpoint-ORIG-GUID: mRNEpe0EyOjgLYvRVO5KhaPHpioJTvlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160152



On 16-09-2026 15:47, Krzysztof Kozlowski wrote:
>> For the series:
>> Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
> You cannot test a binding, so why replying to cover letter which will
> make this tag 50% applied wrong...

You are right, apologies for the noise.
Bryan, please drop Tested-by from the dt-bindings patch.
---
Regards,
Nihal Kumar Gupta
