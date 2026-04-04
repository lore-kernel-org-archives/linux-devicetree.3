Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F18245031
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775312748; cv=none; b=QV7Rq8KZfz7abQbiG0wilpycHOSB8rd3RA4oVaVMaNc5bCmD7hRbsavgjg/umQ+4i0GJpJ+ykQbPxhy8WRNOlXc3rKG/PBjnFjXPIF68IvBv75Z6Fueu6BaGKsHYITxm/bWxn62zcKVT2exUQ4c0jOkwh8tDhDG6yKZo1kb87kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775312748; c=relaxed/simple;
	bh=YDHQQIkUtIMA5RuVXX+SK+ZopnAIz0IH3aZAqaHI9pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awrcqZbuehkfW16guhD5w5k9MlRie7ysVimswv2mpZTLXk5YrmPzz2y4Vai+FTJ6Fsu2rtsMCvs/q2IUjAitoIMWGREe+honJQuPXdoHIdk3ZOXjhTIV4kiBXc4bRv/osVaZJ17emp0RWWN0KeaZ9x25xLDLGx4ikwyfg95gMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=T+tHPtq/; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="T+tHPtq/"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4670676ba03so943823b6e.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775312745; x=1775917545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG8ZLzSkLL5KxGbpBt+cYKmm52XpYZesZWRmcIu235A=;
        b=T+tHPtq/ZJmrz/x0hon6ubvef3dyaaHhk1GRRXgW8y8HepFtZGYjfJcUQczd3MEkSt
         2Agviun9Cf5EYKtk9j0IqUraHya5+cWg7jpTqs6odctBlL2Zz+DNQ/uNqQMe9wgH193o
         z3zeYYVklZaMQki3yiMddob47zunpO6AWKU8n5PWDQ6LxULv6X3f1wcyghb+It/+xjWX
         z9PNVkRx7eWxmjJNLwRnRuJlliHjZbQNuYTor2Ij+hbvfTGn47XIa2O2GDia9HEi0TFp
         QBOE28LuVqSi18lbs2VxGAN1lYamyOifHSPJ/JYonO7K4FYFJ/G3E8jlIr/y0xjtfZ+C
         UNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775312745; x=1775917545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG8ZLzSkLL5KxGbpBt+cYKmm52XpYZesZWRmcIu235A=;
        b=Ji0nujcGNi/wKnEYljZrW55emTAtLDNpZ6viD0gtaPf8oDtaGI71DXHDDlzGR876DQ
         vRnUqrjQaI2s9JZL9tdEQIJ6nYkP+4N/TneHYEKqE1UcJz44i5cnNWcsEcExnNUNs3P1
         Q8IqIDNiMUK98pao+bVZyxNPAjmZZO41m3YaFEaBTYjqtg5XZBZx2/8OHGPrVkIqYYu5
         NNRWl+UMCvDvIcp06njJZbMkfV4efSk7CoOiHXjZvPRSb0OJ0Ywp3SzwoCpmppKTH+4v
         gMGx1BLNmDoJ8fhKeLaykbKWuoQJA/yFIa865G/Ziy51YSCVwY4sQCPOEaqdu1YL9k2x
         6Bvw==
X-Forwarded-Encrypted: i=1; AJvYcCXbUFV6PvBquWiFjyJrSIplzQ5yTZ+WE3+JUxJ+A0lpQ/IOzcHxf60HGiuWSttYdve/oPROQuGfqVQN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69VKgem5dz8rYoc72jmj4NQ72eo7Vs5JeFLIM7yu3w37D/eAz
	o683HctJoUdAGUtXyIkSQNbVChLnNqSGxAxUKuZLGyd/6fmO5L4izB7bfp4j8eECumY=
X-Gm-Gg: AeBDievRJyQN0aX49gqIgf3eosJoJDBV5yEwMnzuBiSsgeWGg+FzylD3OaR5ajmSkD+
	mfWRF2qvhO9ZNs51UIAuNY+pxFLKQCmMGxuoXCOM2k0g9hKIk9Q/DqFhDW3hAcMfvGqLS3Zo87X
	K1TSAheP2PNZrvULgqoVRBP5fiqn60JQK1mbcQaXbKHvYDG67Hkz5XtZ0q2OKp81d/t4tVMxHT5
	C93y6Qpu5AAI43dL890Sa8vIZHPxO8z0GokqICBwy2S9lV2N2r1kJR5JWoD+BWhaY7B5USk++4o
	Kd3yvrbWzM1/ulY+xoo+mq2YifSsW3MeXb3N+BCJ1g72yW/HzwJWeqgAHEhc863LjDn+9BeQZjc
	9ZfOeG4bWnIDUZBn17KtCUSx55Zb98AvhcnUhYnpv0yWNIMAUCruv6+K7WHPctoo2ZynPZ0K4HT
	+uKI8Ed5tm1/CVZ7GkccDw1zxcFMK24TLfGIJqMq7Nyw8HPLCexBHv9Y3q3fsRzE4xxYBajdw9z
	Q==
X-Received: by 2002:a05:6808:1206:b0:46a:8dd5:3a4f with SMTP id 5614622812f47-46ef5002b8dmr3010289b6e.5.1775312744846;
        Sat, 04 Apr 2026 07:25:44 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e14e:bcc6:3f95:26eb? ([2600:8803:e7e4:500:e14e:bcc6:3f95:26eb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46f0f4e16a9sm2936944b6e.4.2026.04.04.07.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 07:25:43 -0700 (PDT)
Message-ID: <e4ddf44e-3189-4d4a-9184-13b0560195dd@baylibre.com>
Date: Sat, 4 Apr 2026 09:25:41 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] iio: adc: ad4691: add initial driver for AD4691
 family
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260403-ad4692-multichannel-sar-adc-driver-v6-0-fa2a01a57c4e@analog.com>
 <20260403-ad4692-multichannel-sar-adc-driver-v6-2-fa2a01a57c4e@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260403-ad4692-multichannel-sar-adc-driver-v6-2-fa2a01a57c4e@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 6:03 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add support for the Analog Devices AD4691 family of high-speed,
> low-power multichannel SAR ADCs: AD4691 (16-ch, 500 kSPS),
> AD4692 (16-ch, 1 MSPS), AD4693 (8-ch, 500 kSPS) and
> AD4694 (8-ch, 1 MSPS).
> 
> The driver implements a custom regmap layer over raw SPI to handle the
> device's mixed 1/2/3/4-byte register widths and uses the standard IIO
> read_raw/write_raw interface for single-channel reads.
> 
> The chip idles in Autonomous Mode so that single-shot read_raw can use
> the internal oscillator without disturbing the hardware configuration.
> 
> Three voltage supply domains are managed: avdd (required), vio, and a
> reference supply on either the REF pin (ref-supply, external buffer)
> or the REFIN pin (refin-supply, uses the on-chip reference buffer;
> REFBUF_EN is set accordingly). Hardware reset is performed via
> the reset controller framework; a software reset through SPI_CONFIG_A
> is used as fallback when no hardware reset is available.
> 
> Accumulator channel masking for single-shot reads uses ACC_MASK_REG via
> an ADDR_DESCENDING SPI write, which covers both mask bytes in a single
> 16-bit transfer.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
This patch looks in good shape. Although I wouldn't mind using
MEGA/MICRO, etc. more in numbers with more than 3 or 4 zeros.

Reviewed-by: David Lechner <dlechner@baylibre.com>


