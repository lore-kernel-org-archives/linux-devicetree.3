Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D31D36E497
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 15:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436569; cv=none; b=SKTwA2DGKUUGjZ3PlusfgsQsCQW68VHz9SVlEf04ml7fPUf1NGX6tdogRNxoqkJe4ZiS0OrH4x5Y/Juwbc0RQq4aPsoXFiTf3R98a57sIKQg6h4yKR/JqW5yTUWWa1sU3RJpXMQY1kSdkCdVjD1Yfk/eC2c8PViWnqO6yZw6k8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436569; c=relaxed/simple;
	bh=27lbe9R0uJfA1lOEGeN84RLKHIKzjAm6O94agj9GLmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biB5Uv2X6u0jeGS/sgliKm5zCdRj/39SgOLZsBqJwTomj6VaS0BNrajBkUuBWSoJv7LjoxVFjPHWgogwX8FltK4kJoQx/Xxj43A6WzoIOgKVSd+EPFsQrrCaUd+vfpf6SD7w6zPvqcQdWZsuV0YIBG2n3LqJ4d2R2xbfbZEXX7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbqDHtV8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbqDHtV8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso42518035e9.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436566; x=1784041366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8YHwGJCeEFKefM96NEtoTmLf7gsLMxJ2f5daJOJFZk=;
        b=XbqDHtV8n1DFiZkDFQ7OW8EsTRE+M2YXCnos1vEfgxfezgV8DPSDkVE5YpgzhjQVBQ
         e3iTun+MIrstqeEPGsvZl4PaOUr6kGwNo69At8wq6vp3SMyeVB21dFj6zvb4suQIxK//
         +nBQuw5MPATNi39PU28ujbefPQNFAmlkg2aRITExD95ewASXkXsGeypmfP/XCCsc4ex+
         4hQVfAle62EWGpGQUL/kLecIylQeLfS8HygLPWImOJT3MPXkIMvboFo46kLj+qV4RWrv
         oDznkblW70FD0FAPVK5lxE+3VmjfJHKRp0sXXzNathUtAPseN9wXtApD6arnNJkJyNZD
         aMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436566; x=1784041366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8YHwGJCeEFKefM96NEtoTmLf7gsLMxJ2f5daJOJFZk=;
        b=cXrDd/QTU3sTj0/758avfyaU9EipIJRZBniIgCHiBKqb+02MPfqmoSu8xuEVAL9ZmX
         MyaOJ4PUftONOKlZ21kb4aPbd+oCtcnZWxvXVDpYM8Flb8yT+TuJ+SdMFvxw/FoipXd4
         c3rQpuxNviXltxVHF4trjhdF6NV+agVVBaPnbW7JSrPGqTf3IHspRlHQztPgVzRsN9Ju
         gq028LHH8JmH9EP7gsQoZleM+j5LEp3qdKuJFVOxibubTNwoBauBkORiGmbXhEglNVFD
         /k//hD5I7s0+spkf0SJ7SyMN/DYsmQ8xVF7vegsDEqcisGEEASvvn41cLe6fwtBXo1wo
         Htmg==
X-Forwarded-Encrypted: i=1; AHgh+RoRtecz7TMKQZJW3h689N4AmpJsBkadQ4xupzxC0GNoK2aTEUcXLVdZgAaEGr8EVs39ZbRGJzpHH/tU@vger.kernel.org
X-Gm-Message-State: AOJu0YwVJNFzVgOpEFrBUuK1FhvEm5a+kl5cELazqyW9kPUOgk2Gk7uN
	IO+feMRj+wkSyasLRIWsOO/DNAEPR3JV504Bl4eGKQNC0vVE8TzBZwY=
X-Gm-Gg: AfdE7clz1E/D8amh7+wS9pqBUamXF2hnoXrOJ2YFt3rKwsp1lPuhP9lPPBKw57sltbn
	uJoYt8yoNx/ov552fEOLbZdR3skK0NFIZWuUe8VytfXMMS41oz8ea3y1M1ojpI/6Fv4o1vRpFgO
	kccs4ihlJXL3yS+e2etpjzzAeeHgX+40nrx1Xeq/+lTyhyCsrxht5aBz3N4u2HxOdy6SWI7ZWU1
	ckpkI08cftNY78XYQ3X5ZXybGh9D2HjlRp6LjOOLyTw9tJrhFin8x1xXjRM30gwNKZQMPRd14nH
	m4hE72QPPa10WaHRLt/Ubb7HfjT9OcAemWJNk2BGygusLLFJm1LmhQgi7uUXgXM7GP7/qrxizhK
	pq/JkAD8cq2MNpESgHCspBOyE4IvNPEVetn33v3ZkWIRl4QFIiH7aW8+lXx0AuYLyN2ynzCGWpA
	N4RuzOo8GG2maY41RNfSsNBwHCXnsBHTm+q9l8j06GhkRsVT8RlRyktzfvnN5uc88HZ1zZTA==
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr65333955e9.21.1783436566150;
        Tue, 07 Jul 2026 08:02:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e10af392sm62069495e9.2.2026.07.07.08.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:02:45 -0700 (PDT)
Message-ID: <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
Date: Tue, 7 Jul 2026 17:02:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>> In order to associate the SID used by LPAC to it's own domain and
>> context bank we need a separate node on the DTS.
> Can we use iommu-map instead of adding a new device using the same
> addresses? You provide zero explanations, but it seems like you are
> trying to separate a part of the GPU into a separate device, but it's
> unnecessary.

What I was trying to say is that we need to map sid0 and sid1 to 
different context banks.

 From what I recall, so long as we use the same dt node, the iommu 
drivert provides no way of doing this.

What kgsl does is having a node for the iommu and then subnodes for gfx 
lpac and secure.

The address on the lpac device doesn't really matter. I have very limted 
knowledge of DTSs but I think we could just leave it out altogether?

>
>> Add the code to look up that node on initialization.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

