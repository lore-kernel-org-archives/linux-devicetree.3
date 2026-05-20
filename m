Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F73E0745
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281160; cv=none; b=ZVl+XC6DG4LV7bOD4itmfpFQLBCrdIv9gvQ9METu03vIgvldCY0AJ0SWSziVyzAAWvaYuJqz4MbTs20kCn66BfVTaj+t620AKzAS2zJLTDZndgSDZ4Oe2MI8N1M8yxaX5CpQbDZ0WRA8Fox3Dd4LVo68f/dAk31pLuhty+uK3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281160; c=relaxed/simple;
	bh=cLaTmSKhZdE69LzIgcez/DsGhTPNYNcrI9RL0CruJ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUyeu7Xg9TjwFVjw0r38HKLnQmDjqeWljKJWjrhHFrRg7IpaC8VLZCqfF5VQtl9bmv8zkdu+BRI+upqVbKr7wdipxC5SHmih/htJHkAa/FF2QAWRsoNbinnrbAa0L0NSyLzlxAL1lJULjdVWZ/228R7xVxn31B0pA2OAU4LJP5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bJKrYH+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fb2TRzKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bJKrYH+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fb2TRzKe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7qA6d2065195
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cIZhTAzDt9+wu0W7bhluPXYB
	8tTK/ULqj6C6vI+4RFM=; b=bJKrYH+HZjulNKG2nXTbJFE5pY6emoCZ1RcOpXoq
	HXkHQ92QHj6os7+z3O3bpOMY7W7DN2TN5b5UPzpda9mZLuAS27CGgatIBNS2zqju
	GsocGnD0zr81EiY6gImdXecz/ASrZh+Q3KJ9MYSQV40m+CKba1NEfY1Fx6Jn581i
	BYMdzKMfiHVX9JzdXNuPq1z/nwOHC+dN7T1UsVomfbWvcM4TXyC2IkNZx7A2OYnP
	6Vn2mIf0a/P+mKl4lUz3haD9lB4nJTzamlD4g9W4XrBsOExzMLvlxG21UUkpqZHF
	m4pVbaO/Vee4X9P4PzNse/kXjwj8uGr2KEg3Nh0ZaIqU9g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4pfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:45:57 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5760d43e659so11634765e0c.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779281157; x=1779885957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=fb2TRzKe9UYzUgJCV5unZl/sJTnYfj8OY+MhBEN2E2moL63XSeXcXoogXQQOZHmtO5
         T+aG6vPA/iJ12f7Kgx+CXBUa//AkOeKyq70LnyqurgI7WB35rGagMkoNVwaHEi2b2rgp
         zgZWf4+93EPDitRYzWRSQ/fDnemiicQyzrBhyHWXHrb4Mp36P9ev+IK4r9WnKKmBtQ/q
         pCADlY5rn4bqiUVGD622xSLJCVsyvibeW9ois8ETGrGIviGXs/E/Z2g6b1lTUPmMjdif
         l37S8AjD3MjGkCkgbPCAfM05l2gOzTWUQb6AXHwUjT0KgfX/yIC3AeshtwSbVFjwSwYo
         pd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779281157; x=1779885957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIZhTAzDt9+wu0W7bhluPXYB8tTK/ULqj6C6vI+4RFM=;
        b=Ji8elwcDyjRev0xJEyRSCXvExzjSIf4w9nBiZKJmTRa0JPXj9QanyCMZWqQSLQDwE8
         G2inD9LdqSr4/PeR627AQ55AUvv4taIzKEXl3Jd0toAqeg4RGP9W0XxuK1r3igXUvldt
         SKRgG+IgwEmIbXtOzYExurRiBSglyFwAoh1fWHdJL6dz65HuUsasCh5joMhtzkL7W/YZ
         oUsoVBfQaJUEZAXc+RHkbVvM7iidbF67eVkfSuoUrqLvOJ2f0FrgXaQ3qW2N2PoVE7I8
         fa9C0qxPsgnhLHrICL/1rMCr+qreKCZ9z0m/2SoBJZMBdS95yVnI9lbpDzsmiRkbjNzD
         G3gw==
X-Forwarded-Encrypted: i=1; AFNElJ/30wv9Dlm/u3SatFmXQIzjc0HF5XRRoE2KM/1JehPDnM/ccEIehjcZIOxtNI07x+rzgjR0Dr1iVJKX@vger.kernel.org
X-Gm-Message-State: AOJu0YyalB/CfdmDRMe4Tz+kqEKW+tAUVNOX7Xdf5eeu/nl5Muq+bGnY
	I2Lr0kCF88WvqD5kLJ9/zWHzz6NuSAtO/sMZBGwU+phcQD9UHcDvt8DB8oG/rPBbqzJH33BgU9t
	EXqnMTliEmXwZQnn25WL/NlgqnxO7c37gI4q//dtybmImrICAqcCfwIhVFQ3k37eA
X-Gm-Gg: Acq92OFnfxvAw9JifTnoDVCy6PeCua7k82NmQaEr9Gw8750M0/nTHZBKTEBRRBc6kGv
	3ZeVvWW3lqc/EwNuTZA0n+ie53FHhz4K1w77xO7vUrLDRgBxoOzvC9o0NOEMzfdZwfLFn+AGq6S
	g/zY0fdvBnGIKmtKq4fwfxPVhUYBRLz7eLahlqiwNCgyRRiGfLvygraYgu4qYVei54LYD7Y17x9
	8FUe1rC7Y+rjVmhc3tPKobX/gqCjQk3fUiy5RLY72nwaWUpDMeFlc1Em6AqEO4KpmF4ZaaO2uMA
	oPRoXaeAfe+SA1Lpai/CdNsKYdRz5Sjy8SH7LuGuzcwJQimdV77cLSzxr/0PZtHj8pbTb//9g1n
	VGfl/nIro7zMc3NOW3eWcFfkt3S+S/rZa0Adktns+6wXLeZz5chXwPPy96Rdx5hjfz60xIrIDnq
	zrujm1ydTC7sR0S1VN5NvcSpcCs2TwJuvlfbA=
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6284062e0c.9.1779281157277;
        Wed, 20 May 2026 05:45:57 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c7:10b0:577:51e4:ef1f with SMTP id 71dfb90a1353d-57751e4eff9mr6283671e0c.9.1779281152095;
        Wed, 20 May 2026 05:45:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5712sm4836341e87.59.2026.05.20.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:45:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:45:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
Message-ID: <mvlslbtufxodehvqqcmhihtchct3tegjbfjl2nmt3bh3fczdze@4fnrrtm2njlv>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
X-Proofpoint-GUID: 6XqHtjXGUEfiadW1M0pmHzP8pDhslXoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMyBTYWx0ZWRfXxTqOax47X/jL
 +EhTRkYaXy7hwOB+aTBGSHtkcGhzmdrU+yikxSYdtr2fyIqxLCAs7ILaFLyN9m4g0+MT/i7y9un
 rk3z3mdBWf1vQsl1hrP3+VXotlI/UROaw6v5qc0ehm7zcss7C4z4Emvt+1wMw8tv8gZ3YYzIPd1
 hEEWubmnrSC4pL9lEPlnPzDxA6SBB6pZ7EeWXOJAEDJFpmsvlTyXYP3yQRa3apEDcuzHjKiiSTm
 wxHTb+lk42OA3VccH6sLEjsXJJIXzfIBxAL/30uhTIZdjzMozfR88F2ZqxK76HrTe+U7IamuhjH
 80wOJdkW53EzLtjjb9b1JYRI/1WlE0J/59llKGq8zrq/845UKMaf2Xm/B3RiA+fylNKtcO1B9Wu
 nJZrp/91RC6v2YYhw18NgBqsvd21+I22yO6XD8Dq0Tr3wCtWxNrQUptKcgZ4m300QMrtz1r4SM1
 H0Htw0ctl3+LKTDwBdA==
X-Proofpoint-ORIG-GUID: 6XqHtjXGUEfiadW1M0pmHzP8pDhslXoV
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0dad05 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=FYQP979REZT08Aj4asUA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200123

On Tue, May 19, 2026 at 06:10:50PM +0300, Erikas Bitovtas wrote:
> Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
> them from loading.

This should be squashed in the previous commit. Otherwise the codec list
will be broken between these two commits.

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a87e8afb23df..3baa6bb4968f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
>  	.vmem_addr = 0,
>  	.dma_mask = 0xddc00000 - 1,
>  	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
> +	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
>  	.dec_nodename = "video-decoder",
>  	.enc_nodename = "video-encoder",
>  };
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry
