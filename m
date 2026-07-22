Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01348368D76
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 22:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757790; cv=none; b=W5ElvBr6YLLdgxhRJL1ScAzrnIiN8ev3WGzF6tjoQlt/o/KxD6o56VIivmNRbYI7vWEbLxK/+AN0utzQBmTaz3EtAr6FJtzxeHPrv9FmyV6OeBxRg+keEt1wg9R/ZlHfsQdpvGBkVUe8Al9tvY0ZUQyxI5tdTAUIPGrijQSqtFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757790; c=relaxed/simple;
	bh=E0N6ejwofGQZKUI5IG7AIORG61v+GVYT9YvB2dlakvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZclCHBLWNapjTyEpWaQs57CHtSIPpyd1qO7awfV4SZZ3YHKxCSJX49cK2fDyWIlgb/WFQS/ooG+kQZwAlbyPIpY8mI3awjhkYhiXbvaY4TceokzgYV7mjeFMog7dtgQFkmdtk4jWl4UaIJNkL06jzNFU1wV0iKKSBDzrRr9uhko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pufwH+y9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pufwH+y9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49558ce01afso33369415e9.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784757787; x=1785362587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TMMeAthFG9QEamm+yIE9z4ykTfRpuhgtov8CzjPdbNM=;
        b=pufwH+y9BeOz38C3r8jNtZNoSW2a9HeNhw9YQPcNPTQxhYiGNqK85bhauNENipfslX
         QyWQYrpuwV3ag9nHvpBOz8rNSwcRJp78QxY/wVK3z49U1j79T1gvMm5WFKopAzOQcKv3
         5IVyx74FRqiLDk/rBPSienAQei4+tlP9sqr4/JfpORYe1mt8gPHA1wbJN8etr5CD6pKx
         YnfW3tMPLYoVSGgoxoQ38X+760qs49i2KJn7B1xS1eoHcG6OVf7ZD5KMNkHRwikBJg3O
         uIR+dzv/BXmCvJ3r1vO1kOk2STBjX2uDQZ2vbn9WagB2V16Lpb7xklufE81GiBQNXW1j
         sT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757787; x=1785362587;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMMeAthFG9QEamm+yIE9z4ykTfRpuhgtov8CzjPdbNM=;
        b=aS5VdaOgYXaV4WaLmIRsVutn+OqbVsjw/YeSX3CEqMs4nHhSoWF6mGUNHrA2szKocM
         Jf6V55wbEtg5rBZRAzHuk9C01KuYXqfEJ+YBRYLNdpZaMpsQB43cZI5CE3CHI2uRihQQ
         rJx3oEUu3uvH3NoH0KqsD4kH2+W7rWqO69pPXEMMsMro2YX3sF3ogmrUJ4Uh/PrmqeoZ
         OX6qNvQeL81+9GSB4wvo/WOEjDpsQWUpBNuVqFztolRRWug/Z0SDAIbt0ZKIjHdYkgNE
         1gqNoIzU8E5WrpVcIkCMSxg3GxF6qv0fwThXncP1WQG8JOosGk2uG/mVNbWUwOjv4yax
         AAPg==
X-Forwarded-Encrypted: i=1; AHgh+RrxIyFJI49d9QUR7pvg9/i/F7DiYFasxGDcly/J2VAAkAbmLEQox2TeYOhx+KWemjv/NBLviSDti1Yi@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbK4cZegx89aj28SyR1sNsxSLf9lok8worAcR4x4HN1FAzr3g
	68TZbGWTQxvz57xiasTZl76fRplI1lLk6YN4R+9j0iKqvO6x15ozCvStwRHHqZT2264=
X-Gm-Gg: AR+sD11LFrk1PX/SOXgBAYtVh1JHcweqvS3ex/7QYsLt82v2r7+VrF2q3+ANsmr6pjH
	8zsrswoSUWNHo7g/f/gHrOeyy55EGSnlmznKGLNcHmX7Vw13WgJbmHttaEmHTVdsrKzX0+owSHC
	Lc1JukauRbpY9rXDskw/VIuUVdZkDT5KLBfg10VQ0TOXuSEpvlbSYPtCE3Vs/ab99NFZJR2CLDL
	CrgJfJz68SlLTG5eJMWh5I7F7kpWgnLQCrUSfNTUbCUr8oLxgxzbk5HyKC0JhUqXCrzBmVZs14Z
	BRNDudljy6f4SZXByFL1LH4a08RVyqnB63qTJeEsl3saI2a34voZYrSZZ8Zr/jHIfQgFimdgckf
	XqTDafGCIdrSXPkk5xPpIKl7WbqR5qeHRsY1/5AeKcwqnKdIgBWKXypD4MhN8kYsKq4hXNjF7W+
	IBV1+bVzp0o9lK/g==
X-Received: by 2002:a05:600c:1989:b0:495:3f99:849c with SMTP id 5b1f17b1804b1-49573cc7cdbmr4456425e9.15.1784757787192;
        Wed, 22 Jul 2026 15:03:07 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm8969357f8f.5.2026.07.22.15.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 15:03:06 -0700 (PDT)
Message-ID: <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
Date: Wed, 22 Jul 2026 23:03:05 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 14:41, Vikash Garodia wrote:
> Update the memory-region property to support two regions:
> 1. Firmware-loaded codec carveout (existing)
> 2. IOMMU IOVA reservation region (new)
> 
> The IOMMU IOVA reservation region is required to restrict usage of
> specific IOVA memory range. For example, VPU restricts usage of 600MB
> for specific streams, which could otherwise lead to device crash. This
> change allows platforms to define separate memory regions for codec
> carveout and IOVA restrictions.
> This schema update supports existing DTS having single memory-region,
> thereby allowing gradual migration of DTS to support two memory region.
> 
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> ---

I'm not mega-happy with this pattern being used - I prefer the pixel 
pixel_cb sub-node model you've proposed yourself.

OTOH you're the maintainer so its really up to you how you want to 
arbitrate this - the 600MB constraint will work even if its not pretty 
or the best thing (tm).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
