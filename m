Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E1403EBA
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995091; cv=none; b=mHnc+A538i5HdR80XFnXbRVJXmZ492nlz0dSqzMt7ez3i+vUxE/4Da/Y5/79319W8u8TuHsw8NW7Uln7yrgcBDiXucgTcmWWxBaEYOhN85Z/gdPGc7G3Jpr927FFXGTKerkYZklHNWjFKlTGPFJUB+zjzlNSFTX2x4QH/VS6zbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995091; c=relaxed/simple;
	bh=7qGuFMvllEpDqWefN8L6UtrRcmDGHxh///3f50FPo8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsyerc/Lqn8cwZVl5XMxIdPUIkmmuBvL89RGSBkp64R98/gfR320IzzMscOYCsIP+PJn51SwBnYIVQ12DJHcTHldXxlUKY56PmpX0VfRFxpmr1ysXL+TXQ1CBArbUB1dFNo1yeCRyGhwuNltXjFK8VwswBRpbscSKR2T1beA6DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFzxUU+x; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFzxUU+x"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b20882a71so2182341fa.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782995088; x=1783599888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BMunvEvzFx+EKCn/rHllT9/LL7rulR07jvCFBPoEfWQ=;
        b=pFzxUU+xxyGzb30fYfdjgoZ7w/oDjg635DCp6V+vmrV99k2sze8MlUU8AraGCQbfSr
         0a6ghzRGwcsx0dUuR0Qs4roZ31yEr5yQxBxmlj7OfXYznyBPRHP38MoVl+BjjhCLucaU
         S7ceXMUjGLwKMhuQoqfmaCmutf+hvzx0M99kFFWUH9svWQsS7fjBmRcoXzsUEBrUZwF5
         NzGQHUWkzqwUk3VYCiCom7u3k8Fre1Jc0/73ysfyBtVq1xpPM0WbiI52AygfN8g+gUHr
         KmBNXCTiP24PsoJMLBQZXO2cs7rg0WCiNSx2G07iHrSaWh6nEhXztYf+iPFo5TItboMx
         k38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995088; x=1783599888;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMunvEvzFx+EKCn/rHllT9/LL7rulR07jvCFBPoEfWQ=;
        b=GCIP6alXQeKonN8rWXDZZ8GDlqTb2DRYskgrlaWeGNTGQB6EUtdWuTwuRpKmIb7pa8
         uOR8Wx8//EZ7PRGFLH7/o7mnqSS+P9L4pcP4W9NXA1gpDXCbYECTeVAM1bPlJR9VzMrO
         tWi0lFke3rJaeRWP/bkFtFRAGobUczP+ht/RxX8zLqI360OjzzRqC9YlLEtnffz1k5fJ
         ZwollLFAIkwL+TR1jrByYEFeLw/dDgrW9MQ2TFzUUbhoFcMK5md4Vzt6Vr2gCqdBOjVT
         mboEQWqjr6sq4vY7eD2KIUYaDP6ZNYVDazJl1JUtpXbwEjCdSstEe6JDI4v1oGKVGUD7
         N/RQ==
X-Forwarded-Encrypted: i=1; AHgh+RptjV1x8jTcTLvwfZmkk0V2zBUeOikTsLbeA3B+NU0eDBaxpFIzAYvfljGRqxciBfjh5xoOckxFG2+x@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkt6vE/oi6Hr7T0Au4bJlE0fZq5iLsJL1HAIzvpKVGjuc7kySu
	W2mFc6dVdz1Q95gqhpqGl9NBxwMGFpTTwE9EX25EaKxkmQGjkFQY/ANQF5PbvpQ8SQ0=
X-Gm-Gg: AfdE7cktPGR+byG3TSRCxEcXCH02FDNbrSbZExBohM32i7h2T4FVGl0qxmkK1VtEikN
	I8U1aHg/mdz3fukkFiyrMtktJiyRwXsSh8urhQgsuXxEUdOYknMtnXcW+4wXarTeqYrSjp/5PJP
	yFFNyHWdOJcOJfv8nMOTB4UZCHUAq5nLnYG3d5nrNOlMPWN2SOCTr1+YPL8JEuGo2E6ifhv0mmB
	DsT0YzzwOtjk99T3YrDJEvniITNqcKfwj+9FTmvPz0fX8lkEZs4QWiDiNvES7ZzyJMm/Hxddr5x
	i4nnJDtqPbdZKhngFdLKLIvRAn4LcZEGT2ND0a+NJ7l7e0gk+1MQnMuN3elcAn+n/W2y1r/kkgk
	8oZZqT2kitWpSXURNojZW9NENGsG8nG0+WMoVuU9XZUiqE+mIwvZm2XaXR/jNsbqa9TkY1iGc9+
	2+lxvm/0o6b2ZqoN+FgYfghNMxlNhzjRqZlbvRKUvhgmG5HhXrzqPktYr04vA14FvJ7WE=
X-Received: by 2002:a2e:be0b:0:b0:393:d08b:2a0c with SMTP id 38308e7fff4ca-39b34034b20mr7388641fa.2.1782995088079;
        Thu, 02 Jul 2026 05:24:48 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37fe9960sm5868781fa.32.2026.07.02.05.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:24:47 -0700 (PDT)
Message-ID: <df510ed0-815a-4d72-b7c5-05025d8dbfd6@linaro.org>
Date: Thu, 2 Jul 2026 15:24:46 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260702-og0va1b-v2-1-0071442caa2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng,

thank you for the updates!

On 7/2/26 13:52, Wenmeng Liu wrote:
> The OmniVision OG0VA1B is a monochrome image sensor closely related to
> the already supported OG0VE1B. It shares the same SCCB control interface,
> power supplies, clock and MIPI D-PHY description, but differs in its
> chip ID, register programming and output format.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
> index bd2f1ae23e6547032361924a6953000bab1129df..ae44ec2fa9035b4e19834888a41987ae9e25118f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
> @@ -21,7 +21,9 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: ovti,og0ve1b
> +    enum:
> +      - ovti,og0va1b
> +      - ovti,og0ve1b
>   
>     reg:
>       maxItems: 1
> 

Since it becomes a shared dt documentation, it will be accepted to get
a generalised description section also, in any case:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
