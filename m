Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41368305E28
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 23:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781308208; cv=none; b=NyWH+15JP3OAq/JW2AFzGX58hWg7jLymkf9LQQV1Ntm0qCYnAl3zdgi52ZaJLpa/QmaR7RfSFWllxbGeEkOpdoAxK+zN++knTkpmKN0mrYSKvTKeYua46g92UsD9MykHX47w28FC8olziBaZnAP1yBVVACcAdxX7ZwytQ8mTxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781308208; c=relaxed/simple;
	bh=iUC5KuD8DUpRBxmH8q9YtdnfI/bOwVeYLr89NTEjfAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELK8s7NV+qmkk0q9sKG+bVrps0QRnT63ssddfkeufJMf9lN7EaFWR6q/bgsSe/Gi6/OPzvZ9TAu+vWTjVsXyoK0aYRpoyDDq1OR8ZhNrT0BIXHjrZdjHCKqUy28CB5c3R2X8w7sCfV+WtI/fiI6oHEa89oD/nONAo6BsEr9BSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HPMsgtHd; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HPMsgtHd"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43d1470491aso763171fac.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781308205; x=1781913005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYdl9jUW3MXBuDee60djhsxFixkF1o3CC0t5JyKpACQ=;
        b=HPMsgtHdOOREknh2zMO0uePPRofXpf7ClA9Cw3w3F75oGGdmCIvCtrfgJ8S7fTuiud
         ILEiZErYb7lf4LppQ6ChJVcZ8hFUUH/9s5t8E/ASYpAbJ/7W1RMa3iza9t75xn0JNpmN
         mNVuMeri4RlJfOzYice87OfFgOMZMvrRBFG4/LTm96q9PYJtZFsn/WoL1WIVb+LGQnxx
         fky4oTI3MCFlF84qHMaftmYZW+UsI9tBPqvgMIaqB9fXTA/2rrGrnXIF2J2I5mjqfNcr
         GWziwqdxze8cyT2gqj60xpWx+jQRwktie/UutVzzMq4ol9dQ8awd7uJqxm3uBWDoNbp9
         tbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781308205; x=1781913005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYdl9jUW3MXBuDee60djhsxFixkF1o3CC0t5JyKpACQ=;
        b=YCaY09AHgEsHrhkwxSDmtPpMt846bUoNEc1x7LxPFfepJsioEjJVennQfLKyuz8YYh
         zUh2v9aD0QINyJOw5Mi+sDQAnRb4FepX5obpc0CREmPXypWXAA9DGT9AB4XBIoO/+OnH
         fmLccByLacEb44eTZlgZCFPWcjmLBO1J04E/TwliLXAl+7DkTJmLPOtilnh+8wp8jmAv
         SlBL3JzwDCJva4MqrdLR4BNXIpeXZdlgRbNAQfvaz7wVPtJketehMgj/TT52R9GqgNva
         5R72TOBZs9cSJhjvtPFu0UItOdM/bBUI5SSqdaTtCXg95Hynk3pMhmd664L4avLgbKTI
         czOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Nxs/W3fpAvmA0nywhbVRQql/941i2v3ZeqJqWLqOpnJhwF+zA2tRI6bwduu1Oj4QmGed3i9fDwG1K@vger.kernel.org
X-Gm-Message-State: AOJu0YzlE7bQhOjdWAWYFADOt10flDRh/B7U+O6bjuheAK62d8yv8Eyz
	sFoc1Y7E30tPSTXM1MlUYxSFqueIUDtvnbs/A2wVDJ83+e3XEg/1U0h/tnv93Db6glU=
X-Gm-Gg: Acq92OFFogDuvcq2kTD1tc6mo6n5dTqkPs5qQzhB/a/rDFXz6ZkOJ/WiDbHO8SpHDWq
	34WZsdaccnMbhbXcxORe49IQICPeRZ2X4t2yGtFXz62f2VN8JM70RVXJ0yAwXXkIHMSud12QTyO
	GMUkwWDkVhd9JE9UQwSYWgRtlXO66KjDbWiTTaQBEMIpewN2OtJfe/IVokwPURPtt5PyHoEm7w7
	Nnxmk8GrTvNTxBYBCf9h45pOmlNW5bvTaBvkHeDBFS5uoY5EP/suf0yDzZvV2fQ/IoCG/tv+gfB
	di2OcYkrM1eplPkirinEnRHpM34JYRs4tpg4Blq11vjfi7dD7xVELZ5YDYDj7JzXD5kJR4jPlQ8
	D5hldjVED8fNtcxr9i8HulLA4L/nQXZl5Y7Y8rnsPJ3n5vbD92cXAj9RHPv53GyRpum8vNndYmN
	4oc4p2/+xOOzjMsbnk9+4e1NiMILlE7O8lsrKHxX5V02Y7d+QGskihEOA8k7bmE8tLAuC3buKzU
	w==
X-Received: by 2002:a05:6820:198a:b0:69e:97bf:4756 with SMTP id 006d021491bc7-69eec7b8f0dmr1138577eaf.7.1781308204992;
        Fri, 12 Jun 2026 16:50:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:cb9a:87cc:1314:fef5? ([2600:8803:e7e4:500:cb9a:87cc:1314:fef5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69ed8575597sm2680424eaf.12.2026.06.12.16.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 16:50:03 -0700 (PDT)
Message-ID: <95291df3-c34b-40a4-ba73-813ccd4b9ef8@baylibre.com>
Date: Fri, 12 Jun 2026 18:50:01 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] iio: adc: Add TI ADS126X ADC family support
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 5:46 PM, Kurt Borja wrote:
> Hi all,
> 
> This series introduces support for TI ADS1262 and ADS1263 ADCs [1].
> These devices are very similar (if not the same), except ADS1263
> includes a secondary auxiliary ADC.
> 
> The main ADC has quite a few features supported the main driver
> (ti-ads1262), including:
> 
>   - Power management
>   - IIO direct and buffer modes
>   - Channel hot-reloading
>   - Internal or external oscillator
>   - Internal or external voltage reference
>   - Filter configuration
>   - Sensor bias configuration
>   - IDAC configuration
>   - Level-shift voltage configuration
>   - Manual calibration support
>   - GPIO controller capabilities
> 
> I plan to add these features to the main driver soon:
> 
>   - SPI offload support (38400 SPS turns out to be too high for some
>     systems)
>   - User triggered, automatic calibration (Datasheet 9.4.9)
> 
> Additionally, full support for the (less capable) auxiliary ADC is
> introduced by the auxiliary ti-ads1263-adc2 driver included in this
> series.
> 
> The auxiliary ADC operates almost completely independent of the main
> ADC. The only consideration that has to be taken for interoperability is
> when reading conversion data in direct mode (Datasheet 9.4.7.1), which
> happens only in buffer mode, when multiple channels are enabled.
> 
> When reading data in direct mode, all SPI activity is forbidden between
> the data-ready signal and the data retrieval. To achieve this a second
> mutex called xfer_lock was introduced to block SPI activity on the
> device.
> 
> This is one of the biggest drivers I've developed, so I hope the code
> and the comments are self-explainatory. If not, please let me know so I
> can clarify them.
> 
> As always, thanks for your reviews and help. Submitting upstream is
> always a great learning experience :)
> 
> [1] https://www.ti.com/lit/ds/symlink/ads1263.pdf
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> Kurt Borja (5):
>       dt-bindings: iio: adc: Add TI ADS126x ADC family
>       iio: adc: Add ti-ads1262 driver
>       iio: adc: ti-ads1262: Add GPIO controller support
>       iio: adc: ti-ads1262: Add calibration support
>       iio: adc: Add ti-ads1263-adc2 driver
> 
>  .../devicetree/bindings/iio/adc/ti,ads1262.yaml    |  308 +++
>  .../bindings/iio/adc/ti,ads1263-adc2.yaml          |   49 +
>  MAINTAINERS                                        |   10 +
>  drivers/iio/adc/Kconfig                            |   26 +
>  drivers/iio/adc/Makefile                           |    2 +
>  drivers/iio/adc/ti-ads1262.c                       | 2180 ++++++++++++++++++++
>  drivers/iio/adc/ti-ads1262.h                       |   39 +
>  drivers/iio/adc/ti-ads1263-adc2.c                  |  470 +++++
>  8 files changed, 3084 insertions(+)
> ---
> base-commit: ae696dfa47c30016cd429b9db5e70b259b8f509e
> change-id: 20251129-ads126x-fb6107505cae
> 

Hi Kurt,

I'm currently working on the TI ADS112C14 family of chips which
are functionally very similar (although have a bit of a different
register map).

I have some different ideas for the devicetree bindings that I
think will make it a bit more flexible. Given how similar the
chips are, I think we will want to align on how we do these (and
there was one more similar, and thankfully much simpler, TI ADC
driver submitted this week too!).

So rather that looking at your stuff too closely yet, I will send
what I have next week and we can compare notes then.


