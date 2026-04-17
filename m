Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC769313558
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439608; cv=none; b=XKdIPPz5iNsxhXEhNgTiYm1nJmu14tMaDTgpXSMq8XrRt432Ns7s9sRS/TiuzuNfyClRIVO2KQGvklAymrTrtQHg749Rz9paf1c6ye1Sr2YzXcOR+RT4x7xKy6H7ESBY3XGlaE6wsNY4RTJvO9LQcpf9uJ5vjGegvyuGu5tP4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439608; c=relaxed/simple;
	bh=8xZLHQa61+Ivb1WiPiCAAgPj2mnS+qCO84XViConO10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jz2SuMAXbkJpZQ55wn9r6SKiBPFbju4vTQnGSqKr/nk8TET01Etqt+5IIj51+GQrZq/k/bFYelQl9h9RAOw0EicreJVoVXbMD6aOr7zM1ElC3uOk/ruEaKncZ5jcXPVB2g2eHsKoCocNLqsKEOUwnMDWBLK/7TjAdNCopB6oX7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=E9eZamUr; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="E9eZamUr"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-682fce74c06so638860eaf.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776439604; x=1777044404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4h9F4+veahZHv6ouokvBNavgYCSXgwqEuSCU+Mrc2c=;
        b=E9eZamUrDl5gtmoYhGXz23M327RW71mlW6tpmQDsfkXO0RpNhzf414JhXys0S/mDlQ
         wkHdsMohyrdtki/oA7VHAGqAeU4z4ZqoLpVIQux0KwqMcUvHjvaUn/qWejBbR62FV7f5
         hqNO6lJaU0wth8rN0qaCzgyw7nPMNb72fRDF0wPtkaC4TM2txlMGhNLWJO3tXr0rYZGX
         ZWFwXponVciR5vVnODC9OSxrY7skdOIanRmnVWLI0l0kq8QM21VDmCnTfCTGheDI7r82
         el4CHhzVvmiACwZx/lFeyL+U9aSgq2Q0p09U5bNDRNFDkncCMkQVM94V4rigWSxU4mKA
         YjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439604; x=1777044404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4h9F4+veahZHv6ouokvBNavgYCSXgwqEuSCU+Mrc2c=;
        b=qYMYWZ2mcbaVr9HrK95k23syVhPTvXn34qS7P540pVp4u1u6ttHpMBdKwaaUc1YuVx
         UoIG0WQ6PDvpQwwViUE0EfGXBv8AudxkH4NpZapwnLxrW/lNoAdDVizXzSPu2hzIv9GU
         mcxUfVZXAq0u4h4O6HZ+EFW1S+akPrY4KUd7bQx4v9k7BZIJQV8ays8PL9Sk0kx9pPRK
         GuXxYR5j50+vJQQGSm8NgvRHGnPkRu1ANlPTq0zLycAvtr62qq2TQJvGVRS8LkDutn0r
         5WotcCVIQk+dN5I0WAQ+cNVE01OgrgCOMfBLzpcJ1fEruXBaee90imPukPPvTVvzLRxV
         BwOw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZBkb7b+659xpCUhEiXLoTEYAytim+VyLUbh/BIUK8qJK9CVk27wKRWMt035H7h22yrX0LFy+wf6w3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6vskI+KcpIiDiwclaplfxyHG6ijl3NYpqBs77adzmoh1r+Wrs
	1gaC7zJBpP8luGCXvGU3SHnkieMarDhoWoNCIsR6SbUBmOfvNEasyWj8Ftz7v75YWvY=
X-Gm-Gg: AeBDieud11aYKJ3CrM5tCqJ+Q13F51FFQ8O6+sxCq23mjPy/JDxm3vVW9jvNf3APIxg
	hd5AwG9vqC4WvLGt4aZBmc8Bz1Afos7RhTHMywxOLJgUuHzRa/TJJY7Dzufxhkj6AiGJzMGFUCl
	UnWVkxqFgTGQdUTTwld774Kcw2cqfqdrHvQLgMAJ7GbF1OcOm0nfBKjbw5exZYa8b8fnpvdEz4p
	vLL4X0sblGBfQb+6rLXsdYh8Ozi9F9VyNkwO3zz3kiajZ3P24fWum/Rx+qjEEIeWV/D/WMCNsRi
	RD9jyFoicVktlCFDe6t8q8DyCM+GxsKlefRJdwS0HJ8FydaGeaDrXcohga+0BRjsPm8jrgOikH6
	I2xFnDODDkPyJ6wFDqYyf5F86O9bpJw4+gG0suR2cU4MwvbQKo00er0bDclLZwAOXA0d+14yMS1
	iocEx65vbvGgxvcHOnBxCyBZUAre1faVOnADcFKEEv6/cBjnXTDTomQqdq72suHHJF3E/tMXMLU
	6Rx24Gohg==
X-Received: by 2002:a05:6820:308a:b0:67e:3e99:1289 with SMTP id 006d021491bc7-69462f3572bmr1547103eaf.46.1776439603831;
        Fri, 17 Apr 2026 08:26:43 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:ef27:3314:b886:cd3? ([2600:8803:e7e4:500:ef27:3314:b886:cd3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69465edde74sm907249eaf.10.2026.04.17.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:26:43 -0700 (PDT)
Message-ID: <120a34be-bc0d-4202-9996-c5da8cf15963@baylibre.com>
Date: Fri, 17 Apr 2026 10:26:42 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: iio: dac: mcp47feb02: Fix maxItems value
 for reg property
To: Ariana Lazar <ariana.lazar@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417-mcp47feb02-fix5-v2-1-6592ea499cce@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260417-mcp47feb02-fix5-v2-1-6592ea499cce@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/26 8:38 AM, Ariana Lazar wrote:
> Change maxItems value from 8 to 1 for the channel number reg property.

The commit message needs to explain why this is the correct thing to do.

> 
> Fixes: 4ba12d304175 ("dt-bindings: iio: dac: adding support for Microchip MCP47FEB02")
> Link: https://lore.kernel.org/all/20260403-speed-childless-1360de358229@spud/
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>
> ---
> Changes in v2:
> - keep just maxItems value update in this patch
> - remove Reported-by from commit message
> - Link to v1: https://lore.kernel.org/r/20260416-mcp47feb02-fix5-v1-1-9656c2fed6d2@microchip.com
> ---
>  Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
> index d2466aa6bda2106a8b695347a0edf38462294d03..f2efa0ccbaa32482dcdc69d98c1565518538793f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml
> @@ -161,8 +161,7 @@ patternProperties:
>      properties:
>        reg:
>          description: The channel number.
> -        minItems: 1
> -        maxItems: 8
> +        maxItems: 1
>  
>        label:
>          description: Unique name to identify which channel this is.
> 
> ---
> base-commit: d2a4ec19d2a2e54c23b5180e939994d3da4a6b91
> change-id: 20260416-mcp47feb02-fix5-26994c5b428c
> 
> Best regards,

