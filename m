Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FF38331E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549819; cv=none; b=TXe8v1XYWREgXrA2VhqAcAaVRfmv9gc8i2jvtXMN/+YCrG28JIYmODk/pzUH9K9cqbbz+ACqChw7FSl9nNeLYq+bVYkO0+XHYTnwtQgJpuleB6w0NmoDp1pqv65UeEWthUrr6iBhIV+NLlC3n29z0lNbbfLeKHqnBGTse2Mw/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549819; c=relaxed/simple;
	bh=Ucy2b3MPSEnBCBhKVkHMWhghZFra35xFFNj5Qb50XsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDWDmI3dvxVNhKYeSzo4ZcZzIbjP8uXznHRA4af4hhEk3paT5PwmP0xKFm9x0DPXHhJWc26O+bJtGAzNYNeBDGNBYM/i3dwE4VEXVX4IWUCMHttWKR+ptQS25Kl3WQlL7qSDpYXFrKE1C/b0Wy2gsNUCki8Som5X21yn6fJxvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lqi1o7+w; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lqi1o7+w"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47640541585so663565f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783549816; x=1784154616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=90IOI9EUyLOw2eSiEVVHF1LKd1Sg9MHQdR1C6WQNJ10=;
        b=Lqi1o7+wVIWB3ifqgsn6xdp6t1KqFZUP2XjUycj/9SQqPoQyi7tZLKo+a9JxKQ8nE9
         116s3PnM7+hBDGuQBggD3Wl5NUaISy++kYlfeg7TysKuENF+6gJMh6m6lzX3EDRsdkc1
         g2NPTSLcja1Y4bA7pJytWr0d0g3AZdDecJl5fHZDSNkwMmLdHWJeSoPs6u8UFtrsz+yW
         zaspY21tFQdqgD0nZG1vAJRNcYuQodKA+jTPqkLfISKsK2EVgM22nOHD//qvP0wuR20O
         nE4ymz1SMwv37kJdeWZQ9Fw9ArOvqMfFAVoZgHAbOnPUxwDpBffAUxKO53V2zSKjmiH5
         o6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549816; x=1784154616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90IOI9EUyLOw2eSiEVVHF1LKd1Sg9MHQdR1C6WQNJ10=;
        b=GSsKWf9vyoip2wwoDvuNIq9+dgH/dxzRWA/j4mNVnV2Y99GqqgcYEJGS1UpS1L3UP5
         dm6plhO6TftHn3qJE+THfukK+OnZvG2ctLBCU/NCl26/azs+ko2D11mfOJNHYvf8tERL
         9lbIjMqQZhk98ZKEwn3CVjUx01bA2mj2E1v1X8HX1cPBLTkAoSONR6tVaDSgbVy3hpy+
         TPE2xwEojYcIkigVyvlfHw8PLfQFEGoXpKfZhRnhD+QUkdhIFCo8HORhm9PmQRNnlSf6
         bypydq815vgfyiiZNcTMZoOoqI3gXq+oAUHEc1tla5nZ9/uZhs6DxsNl5f2t668rWRbP
         grEg==
X-Forwarded-Encrypted: i=1; AHgh+RpejHVAxjHt9CNzKIFbtyldF5HktVAU2bwAKadJuAcgoOr0Ux+Bvyun1V8IFA888ToYIix2lxykkVHS@vger.kernel.org
X-Gm-Message-State: AOJu0YwRslSGAeRFQiJp6Mry1JEGcozwRIcqorVyUo1LyDB9OVDbZbiC
	SY/NZIkNkA36Y0Jlg1DzftkP0wMbgBG0cIoaP/LcK6GRuXh6hAU6BY2evK3+9PA2Gjs=
X-Gm-Gg: AfdE7cmsjvQiSFmFM6kq+wZPcav8JU6fhTBdTjmC3NYlzCSJ436+FdtG0/1MXuJVzFz
	ibAaYaFlN4kS/guBYG+6bOQynbzyIxnN6mGyizcXfjq/fWxWch721Syh7RIHyZT2q3vq7MJ+54W
	Vf8kcg/LShnT2Tubh0Mf+O9asXF95Jj2xyFd2QfoCg/zCCgbHw6AEMpLKGQdyiEmq5VCebdqtuU
	fGd8YJrx+Xj99FY465HDDBUjJWoo2eGLCObgJBdIoxmcRQqLcAFf3EDUYSeVulEVK3xLLx48jB1
	fJvhHxY+VJ7K66XlmdrHKdnf2S0NQpQgXssYxiH1PYaTCQrOtOKc5FFMYVzFIwwIeOdS9JBYeLh
	im+Cxm4rYIrYxHYp4vZatBtw5o4xr8SPFueVJW5zL8gEch1L6UdVlVAj54/fvfafQ+zW5aWgUOb
	AdUoteMZ09soTkEOcuY2VxfLX3rHOgn84vU1rRCg==
X-Received: by 2002:a05:6000:2013:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-47df077b2e6mr4491121f8f.47.1783549816190;
        Wed, 08 Jul 2026 15:30:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm46711271f8f.26.2026.07.08.15.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 15:30:14 -0700 (PDT)
Message-ID: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
Date: Wed, 8 Jul 2026 23:30:12 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Use devm_of_platform_populate() so that child nodes declared under the
> CAMSS device tree node (e.g. OPE) are automatically instantiated as
> platform devices. This is required now that CAMSS is modelled as a
> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Looking at my commit logs I see this isn't my commit message ..

Anyway.

> ---
>   drivers/media/platform/qcom/camss/camss.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..95e655a8b6aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm_domain.h>
>   #include <linux/slab.h>
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss)
>   		return -ENOMEM;
>   
> +	devm_of_platform_populate(dev);
> +
>   	camss->res = of_device_get_match_data(dev);
>   
>   	atomic_set(&camss->ref_count, 0);

Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do 
the same with the CSIPHY and Loic the OPE.

Modelling for subnodes is nice if you have the idea the camera block 
should be a bus.

But for what reason ? As you pointed out it should be possible to both 
compile and run JPEG without the compat=camss node on sm8250.

Making the camera block a bus is a nice idea for "reasons" as this 
thread has shown, its a problem to implement with an upside we struggle 
to define.

When the facts change, I change my mind.

You were right to argue to have this as a peer node. Lets do that.

---
bod
