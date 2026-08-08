Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FF3A7F46
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214448; cv=none; b=QSVAHX6yW1ZIo9W4psPilapAPsTwKopSuRkiHjrxZd1vu0lFOd0DolFCsqXm7o4d7vriLuRMCrs3G4YZzxFrzqK3Z+Y7jbkjpNFvOX3rbdhH+NTPrV65GQQRsECpXF4zG6DJBenvSNiJpwvtdjAgk1S1pMh8Wl4eFXxbhoi7HlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214448; c=relaxed/simple;
	bh=FoVSqAX9Cubv9+S4g1XZ9guo+pxeW6BoILi4tAxvEN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNHhNQeJT2nYVKkYk4l+x0Xp6yNBPcq6zQ6YhmIsm06eQ/atpVR07OUpJwkovXizK8dX1sNmLfVN0BixeHJNzOkSeVGXKrCqHpDrPEQu9pJ/ojY6JSd07ogQwHlHnFTA1y80gJc6aXvSGGAr8b37/3yW2QTt4aOscZzlBEhInvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BOmOJtfW; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BOmOJtfW"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6acc2a10023so176348eaf.0
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786214446; x=1786819246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55sctIR2HSJQXFMzWfmfJXeh2M58cCZiDe00f0EVIXw=;
        b=BOmOJtfW9Iegj5XVZLiC+C0xTbSG+FQnQv8iVBlNmOUTPceXTfKmfyi8p7fTz7qdkg
         GzdEhZZxrMQmB9+NPwX8EsHNilV0JLOiUAXx+n+LTN4ZdxOurefwYSDOIVc+HH2B9U3c
         lemCJ1PUc8xI2AC7QzCudWJyyJweXK7rFpFfUYfva976wgibKn2+7LTOpihtk6WX4P1D
         IjQ1sBXr7CESg5SELqr1V7fcyFp4nLilaKHX9SruTs1/iCoPztvXkcfwgGoFOqMYsZ9E
         sS39ZNrw6T16gi738aiUkVmnXj2vbbQCytLL6kFykTN2OueNtbP4BXsIs0TLui2sZP9a
         ng7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214446; x=1786819246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55sctIR2HSJQXFMzWfmfJXeh2M58cCZiDe00f0EVIXw=;
        b=gnHew+QaEAWpxJhDe1dNqacyBgHJx4+nsUmMgEm5La72Lf9pxK8PZJm3gpLNjxSIkg
         zBfX4jfdKEcdGs9bzAHt1wVZWxCgyHfh63H9Cmpuk0+CUCT2zJiQbEaaR7eTgaVl8DNt
         Ljun3mcPb/ktoGPHkdhgWhXm2S+D8y2QsWhfW/M/9Gjtf2jmKZ8+wZvjUTqE49C01ORX
         l5pqN9dnLq48OtRLQnjdKD8G28MbKLDYiuht/y+tD9hUboNcBx97jb9IheI6manfi4Uy
         dULVyx63z/wlGLIjbwaDK23ijB8Y1zkFXbxe61BvCcCrFSBQf41Ta4KBQ+UneZa/ncDr
         sS2g==
X-Forwarded-Encrypted: i=1; AHgh+Rop8PUepV6U/UPM+pZFQMGWDi31YauqxPZ6tUOo+SZoVYxLWpb03WbzC2LrC5sjv8r80pySOONxDWTC@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9b4+D8o2UdOwolYQaTrfM5cDrPIbdmAYxXZh/jHma2tBShsJ
	NIHL3+8QrIncnpobz2V1vyPTsi9bXla/HjBRDZ/YwlZIdnITgyX6UWh9m9s5VH5h4gE=
X-Gm-Gg: AR+sD11I/L2R2/aTmmGQf8nh0as114WdJ9LIZP+a8usRdh2wCWplweSKlKzK27nP78/
	bMf9orWYL31BShRy243UJgw5+GWgA0vBlQbzFG/XnWD1ReDpIlyr3dVHasJIK9qYXbHgRcqYPHr
	UYgB8xUElVgYkgUmCROeW1N/0X0sVVL2aDjGy5mIiES8Rtle2K0SNxV1yr1osRH9kBW7rPYi1qO
	wkSpXUvAcnZA3N0yiA627Y+/0vh8pj3FlySDKTr02XinSrLwQC7lC/4fykxHKmvh1EhvF2RTBeU
	18lMD/ESdEdR/BeEde0+PPNL2meBZoj9+nEOqahRK5W1+KQwnNuZP2JkCz2fXa1BphkgeiNiYFc
	NhujQlA9p8m0S58wp/Dt0YkUcTAIIE6lmSX7ojdpR85lbOlzXpeoPP9D69GwYQQms+/NOLdOwCZ
	2qMCK/jdCM2jrQxBQQUOcCLS4hS0lJ/VbfnHR/NcqNT3HDbr5Wp683oTNMBizIweLejwHiSUa5v
	afZpCr3wKQouVbyu9WTmQ+Nk6NmkBTGRbhGMR4=
X-Received: by 2002:a05:6820:81d0:b0:6aa:fac5:a3af with SMTP id 006d021491bc7-6ae96d12cfbmr16069294eaf.16.1786214445838;
        Sat, 08 Aug 2026 11:40:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:99c2:f16e:201c:3bb5? ([2600:8803:e7e4:500:99c2:f16e:201c:3bb5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bc2e840sm5607169eaf.6.2026.08.08.11.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:40:45 -0700 (PDT)
Message-ID: <b760633d-a9af-4dc1-be6d-496b7a19e847@baylibre.com>
Date: Sat, 8 Aug 2026 13:40:44 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] iio: adc: ti-ads1262: support common mode supplies
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-9-f89925d72792@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260807-ads126x-v3-9-f89925d72792@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/26 10:58 PM, Kurt Borja wrote:
> Enable common mode regulators. The usual configuration is to have our
> own 'vbias' regulator connected internally as common mode voltage on the
> AINCOM pin.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/adc/ti-ads1262.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 533574169b04..238d803abc50 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
> @@ -962,6 +962,27 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int ads1262_common_mode_setup(struct ads1262 *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	char name[sizeof("aincom")];
> +	int ret;
> +
> +	for (unsigned int i = 0; i <= ADS1262_INPMUX_AINCOM; i++) {
> +		if (i < ADS1262_INPMUX_AINCOM)
> +			scnprintf(name, sizeof(name), "ain%u", i);
> +		else
> +			scnprintf(name, sizeof(name), "aincom");
> +
> +		ret = devm_regulator_get_enable_optional(dev, name);

We need to get the voltage which is then used to provide an offset
(IIO_CHAN_INFO_OFFSET) for the channel.

> +		if (ret < 0 && ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to get common mode supply: %s\n", name);
> +	}
> +
> +	return 0;
> +}
> +
>  static int ads1262_regulator_enable(struct regulator_dev *rdev)
>  {
>  	struct ads1262 *st = rdev_get_drvdata(rdev);
> @@ -1797,6 +1818,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  
> +	ret = ads1262_common_mode_setup(st);
> +	if (ret)
> +		return ret;
> +
>  	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
>  					      iio_pollfunc_store_time,
>  					      ads1262_trigger_handler,
> 

