Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016FB38D6A2
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784682; cv=none; b=eJIjGm4Y1AzVWB5oiM4+OWayu0zpr9q/k7Kq5rsGxMvhjVH/ES5A9MVoJMWC4N46h5Wlsju9h4L60kCA1sDiANHc2rwJtj8rVfvoNz1WKti5Dv9SSjUP8IrcMtF1JL5pgVQo55Uhm6w+8uEZNosyNvDIQZlhrNLzcp8ZNZnbFF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784682; c=relaxed/simple;
	bh=cjj+1DO6hUOxYbgOegOmSiP/6C2RB9RtnTO+CP9ztoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKm+O8R8iywuQws2Ay4vm5IRshx6g7HN+XHPPikheSyKPam3guuYMN6zOHQMByeRsKYEMFTPdK1fz667daxXZG/gM4FXBv/BcvvW/yq5T1bz1fQnlUGb3mL/rQNJKYWKNC8z687IYP/cz+vn6IsVn//I4H2r2FDGKHluZPoq8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VM+S5pMh; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VM+S5pMh"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso884101a34.2
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783784678; x=1784389478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBPr4sYRQOk0Fgqro768mOMscfiBYVVYs4XQfhWXjwM=;
        b=VM+S5pMhrgr45C3snmkjLtDTLiwXJTNa60SMBMEOOi2hv+szm1X64DRg4Tu9PefZNl
         qqEgurEQB+AvVR1LCZUlZEGDiALZDzEDOQnC2kneDibSH0K9yoLDd6Yije9OtQI2GVcF
         +ZhdzAejrR8UFvqOteHc2SNw/SrGoRsfLtQCmBhbRt+c6++BUAtGxskvLnSZlVKY/qBL
         pmdic+9bC6JQ6LAsaztVmVsSuZfLikdIaGBrvGhsGMI8gd309zuEz5+2FeFV18j0GpXJ
         ZdwJi5DfjJ44pI5d965IYIyz9hBeOfAHyEzuziykNJPPYLxNR+xqogPNDjCXbidS1a+p
         LRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783784678; x=1784389478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBPr4sYRQOk0Fgqro768mOMscfiBYVVYs4XQfhWXjwM=;
        b=nrG6DhBuPoCGtHKKLEcpu9OC3LxqGXOMu9zBbGNxHXapgSSG7mwW3LOB8vRyvp7bdj
         l+kpACQwMU/0oZCeF9cDtK+M9pvaZAh9o7beoi+lsHiRUGDpYPEr4m8QPg0Psj4m1/3z
         lDcM4fil4rs7LvfnbubsXN+7Z5UR6QRhifmDI8p1kQRl2yIIC+usQR5PshGUbelZH767
         kdbGAvpLJeljMvXIiWcFIoj+G4WIIvHIliJLv9xjuefJBvTbHXBpk3rGW2ITRnKHGpen
         X7WXXoVuRqHln4E222FIvWX0q8dRELGnAuAsKgVcM3NzbJLtTqilbOnd3qdxgqWptGoC
         rjBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lqUAmpFN0Ozf3gS3jsGwBLp/lbazPai0B7iIu26GrdwcxaCpBaE1MTcQcLZWp8535pfVCLEpkWx4S@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5W/8zhKT1HviPQnihdXzu6R3nWAAJXmGO5TNeUstOgCbb8k03
	HXf7VpNVH0QPqeJWnhqcANQbJiZLsFfJIhb21IhjGWF95EmJ6u8FhdexxsyE4yrtoTM=
X-Gm-Gg: AfdE7cn4tDJhtc/O3np73dkZ+8AxMAT0CA1lLyW8i5L5RYIWmYlqDllZxxXM/ab5P0x
	AArkbKdGP4JQFrMEn6GSDP0TCtCNrbazWhs5loEymk6pGHSuoMaFVwsfTrkmUONF2dgrTs0Omz4
	GOcHmBuqh6aFm+huxfKtwxJPV9Qwb5ufd90fg5X53O2YUKTsCA2wPzE1ekM86wD34IkYjHPjdgx
	f0IRS7F9jh1ZPNsndsEIr+j2EDpcjls7JA8Ucsm1ySbQaFZ1ED2zIyTiXNmWcq3cWixQ7FI+mYh
	mo9K55JQ9E2/80SFgv/yChs3ZzWVzCjts4n08HqipLtyhgKS9SpY7eG8OhdQq/YwYW7c8czbQrl
	2irmI+kpaF1CULPGd2tuUhmuskezmE8lEdqFLJmuDzOc/hD2aoVf/5Ycuwld/AuTUOE1dtdSMwH
	c6RlHEkXhI5+i2+Maj+O/+LPmnUY4D9Hf1mjParC/M3m+3Ob45TJlawszkY7HkERU=
X-Received: by 2002:a05:6820:221a:b0:6a3:7976:706e with SMTP id 006d021491bc7-6a39a56cdbdmr1957233eaf.11.1783784677838;
        Sat, 11 Jul 2026 08:44:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:a950:74e5:81f2:8c89? ([2600:8803:e7e4:500:a950:74e5:81f2:8c89])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a3b0d60sm8823630eaf.0.2026.07.11.08.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 08:44:36 -0700 (PDT)
Message-ID: <ef47b780-e62f-4d30-8c23-97422bcbb332@baylibre.com>
Date: Sat, 11 Jul 2026 10:44:35 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] iio: adc: ltc2378: Enable high-speed data capture
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 julianbraha@gmail.com, marcelo.schmitt1@gmail.com
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <4d4b5cac52b6f4a341d97bd41562a451e8e757f7.1783629101.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <4d4b5cac52b6f4a341d97bd41562a451e8e757f7.1783629101.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/26 3:50 PM, Marcelo Schmitt wrote:
> Make use of SPI transfer offloading to speed up data capture, enabling data
> acquisition at faster sample rates (up to 2 MSPS).
> 

...

> +static int ltc2378_prepare_offload_message(struct device *dev,
> +					   struct ltc2378_state *st)
> +{
> +	unsigned int resolution = st->info->offload_chan.scan_type.realbits;
> +
> +	st->offload_xfer.bits_per_word = resolution;
> +	st->offload_xfer.len = spi_bpw_to_bytes(resolution);
> +	st->offload_xfer.offload_flags = SPI_OFFLOAD_XFER_RX_STREAM;
> +
> +	/* Initialize message with offload */
> +	spi_message_init_with_transfers(&st->offload_msg, &st->offload_xfer, 1);
> +	st->offload_msg.offload = st->offload;
> +
> +	return devm_spi_optimize_message(dev, st->spi, &st->offload_msg);
> +}

Would be more logical to move this function after buffer stuff.

> +
> +static int ltc2378_offload_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ltc2378_state *st = iio_priv(indio_dev);
> +	int ret;
> +
> +	ret = pwm_set_waveform_might_sleep(st->cnv_trigger, &st->cnv_wf, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = spi_offload_trigger_enable(st->offload, st->offload_trigger,
> +					 &st->offload_trigger_config);
> +	if (ret)
> +		goto out_pwm_disable;
> +
> +	return 0;
> +
> +out_pwm_disable:
> +	pwm_disable(st->cnv_trigger);
> +	return ret;
> +}
> +
> +static int ltc2378_offload_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ltc2378_state *st = iio_priv(indio_dev);
> +
> +	spi_offload_trigger_disable(st->offload, st->offload_trigger);
> +	pwm_disable(st->cnv_trigger);
> +
> +	return 0;
> +}
> +
> +static const struct iio_buffer_setup_ops ltc2378_offload_buffer_ops = {
> +	.postenable = &ltc2378_offload_buffer_postenable,
> +	.predisable = &ltc2378_offload_buffer_predisable,
> +};
> +

... to here or even below somewhere.

> +static int ltc2378_spi_offload_setup(struct iio_dev *indio_dev,
> +				     struct ltc2378_state *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	struct dma_chan *rx_dma;
> +
> +	indio_dev->setup_ops = &ltc2378_offload_buffer_ops;
> +
> +	st->offload_trigger = devm_spi_offload_trigger_get(dev, st->offload,
> +							   SPI_OFFLOAD_TRIGGER_PERIODIC);
> +	if (IS_ERR(st->offload_trigger))
> +		return dev_err_probe(dev, PTR_ERR(st->offload_trigger),
> +				     "failed to get offload trigger\n");
> +
> +	st->offload_trigger_config.type = SPI_OFFLOAD_TRIGGER_PERIODIC;
> +
> +	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev, st->offload);
> +	if (IS_ERR(rx_dma))
> +		return dev_err_probe(dev, PTR_ERR(rx_dma), "failed to get offload RX DMA\n");
> +
> +	return devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev, rx_dma,
> +							   IIO_BUFFER_DIRECTION_IN);
> +}
> +

...

> @@ -340,8 +672,53 @@ static int ltc2378_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, PTR_ERR(st->cnv_gpio),
>  				     "failed to get CNV GPIO");
>  
> -	indio_dev->channels = &st->info->chan;
> -	indio_dev->num_channels = 1;
> +	st->offload = devm_spi_offload_get(dev, spi, &ltc2378_offload_config);
> +	ret = PTR_ERR_OR_ZERO(st->offload);
> +	/* Fall back to low speed usage when no SPI offload is available. */
> +	if (ret == -ENODEV) {
> +		indio_dev->info = &ltc2378_iio_info;
> +		indio_dev->channels = &st->info->chan;
> +		indio_dev->num_channels = 1;
> +	} else if (ret) {
> +		return dev_err_probe(dev, ret, "failed to get offload\n");
> +	} else {
> +		indio_dev->info = &ltc2378_offload_iio_info;
> +		indio_dev->channels = &st->info->offload_chan;
> +		indio_dev->num_channels = 1;
> +		ret = ltc2378_spi_offload_setup(indio_dev, st);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to setup SPI offload\n");
> +
> +		ret = ltc2378_pwm_get(st);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to get PWM\n");
> +
> +		st->sample_freq_range[0] = 1; /* min */
> +		st->sample_freq_range[1] = 1; /* step */
> +		st->sample_freq_range[2] = st->info->max_sample_rate_Hz; /* max */
> +
> +		/*
> +		 * Start with a slower sampling rate so there is some room for
> +		 * adjusting the sample averaging and the sampling frequency
> +		 * without hitting the maximum conversion rate.
> +		 */
> +		ret = ltc2378_update_conversion_rate(st, st->info->max_sample_rate_Hz >> 4);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to set offload samp freq\n");
> +
> +		ret = ltc2378_prepare_offload_message(&spi->dev, st);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to optimize SPI message\n");
> +
> +		/*
> +		 * Set single-read transfer bits_per_word so the SPI subsystem
> +		 * rearanges data to CPU endianness, enabling us to reuse

s/rearanges/rearranges/

> +		 * offload_chan specifications for single-shot reads.
> +		 */
> +		st->xfer.bits_per_word = st->info->offload_chan.scan_type.realbits;
> +	}
>  
>  	st->xfer.rx_buf = &st->scan.data;
>  	st->xfer.len = spi_bpw_to_bytes(indio_dev->channels[0].scan_type.realbits);
> @@ -412,3 +789,4 @@ module_spi_driver(ltc2378_driver);
>  MODULE_AUTHOR("Marcelo Schmitt <marcelo.schmitt@analog.com>");
>  MODULE_DESCRIPTION("Analog Devices LTC2378 ADC series driver");
>  MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("IIO_DMAENGINE_BUFFER");

