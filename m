Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1F347BA7
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423074; cv=none; b=GcACOb2LdYmY++npRbfDIW2/Vi8EJ+iTqRR4YOBzxwlSyex67KfV23kH78oZc40uHXQOFHwiNqllzC7pS3FShOBQ70sBe078Rli5xWupaplKGgORei8MeWsdzCmM6NuTsCF0gRGFMCZulzhR/BHnsben43W8JZrDqSdMu68kShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423074; c=relaxed/simple;
	bh=I0EoiW47USBxE6T6MYvTawQh7ajMMiXvhTvG+Px5aok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWOury8UAYR15xPzqVFtUuv8tMZSEaVLXCKBqsWsE5OXll61yAbh1Lmsy/LZvwSbLAKBkB3voOMnhQ3dAgwtDAaWHpGIjF3GSleqGKSUimOcN5g6gkpd1QatjsswGBsipLTv3jzUvznOCyr4/nqOdYlzIzQUeMMFklHpx4VpPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=D9PPhSdJ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="D9PPhSdJ"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a43c2a126fso903043b6e.3
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787423072; x=1788027872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAUPoDO0LbXR3ORuYSehuTzgSLzhcn+D4ZySu9rxxeM=;
        b=D9PPhSdJwq3c489sWygiPwnXLHEr04XOslOMbw3xJVOSgMiLVwO7Lro85RQdgZuU/q
         8nREs4ly8Pz2m9mJWDbBxPvTkaMF6wmwdKYGanP24VPh3IFApH/oqw6LHrpIg0z6udqH
         yne74shUQBcd5nABZR0ghbANn1pfkmYDG0f4nr18HCfvdfMhW/5ZveZMgcSfRt8AeI3n
         5pj5fC9rIWHo+s9dAJ+OXLUUCx6b1WCGqhNoNFIdMIX8q/xY58J1MqQN+ZrLfyC5C2sl
         044n47jrqnNmJtJHGJSDaZ/F7HojjX2TNHy7wY9GJCiYsf6I9uIyS4ee7z/b5G3S+Syv
         ldWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423072; x=1788027872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAUPoDO0LbXR3ORuYSehuTzgSLzhcn+D4ZySu9rxxeM=;
        b=IegDqsnKvm+XXMQm9xEioDEbzIrJFXmCyGF82VAivEu31Wk0uagoe4hKaxBmkrrJ01
         QurPJpt9a2ORCrN1EDccYmul53UlZV8OPbByy0W1PKjKSRDh4wssL+pz2bJR/hxt6fv2
         DdcoXXfoM8ebwBTIQn4a9lyQiYmNHwsOQ7uP0K7QTcomWJM4BwMP/9YiWYvloe8cT4ws
         f7k/ADyry5NoNwgkAGvVptdXAvll9f+FkUTTh1hvgm7y+eA2K8YVs+KcYjxkP2STJSQA
         8InoPrX7oaYKVjFtu4wGpU7xGZ8b2t3jwtCrEDtffZzAiZspXbCKBt0jZ9Afg+XA81fL
         erxQ==
X-Forwarded-Encrypted: i=1; AHgh+RquBMmgXmo4VupCrB/WdM7a4AzZ6itAjCd/p+tEMSeDIWDp85YMNcgp6Pqjg+z4wJa8oPbluCnWtS8X@vger.kernel.org
X-Gm-Message-State: AFuF++nPlzY6mbeWJ28+z4P7n0KpJoorgRo/PhOIPMIqdOqZp8GmLXuF
	O4Jy3FniB6IfuD0RViO6kn3bWm+8GjPnnxapsAXUbOmqn3lfPtGPjLxhvte3dh53dGg=
X-Gm-Gg: AR+sD138RnXZhh9qYe5YIr3KwclCdhyn8mIjvLOZTYvK85Ij8lKonDeRDgvfdEewDa5
	SpClB11OG5Us4A198lemK2mWMTZuGkuPNrQ86zszqAmzbJFcCwGD2FhjtPM+nPlQC02bIEh87Mi
	hOPA5l4SV7cR5y/Xfc9TcmE8NwNg/PKH8k0uy3rfmlrY6AtH0c5rZ/uDXy4G869wfbSNlBjBrxB
	AxTrj/ZtD7W1Sh+bl2x/Xvi8KeFhtWpBJP66VlRMPJjDi9Xoj93TPlvlUeI7QWr4mqUE78jTCvP
	/EN11/EJaDHCQLKfvZ49ZSM5F697nsKWplJm2fvxs3qyyhTWc6DmRyNHhtBOBHvh77YH58Ddh8G
	FA7+H/tqGXO3tlAY3FCWlsxcY9GwQcM8Q4SNjLd7yFNlVATPr0PmyOyba2B1LtcB6KHsuxcJ9jn
	Idrts8//69YvIeh7k7HPwMtppZchan4U2gBiJLwVWBJQDO2su+dIMOxKplqsX0/INe/cVmU3IAU
	e71Ul60WBLZkNDxOWYGF8w8CmnJpss0+KYmwS0=
X-Received: by 2002:a05:6808:1998:b0:4a4:c12:49d9 with SMTP id 5614622812f47-4b30998a580mr8468928b6e.3.1787423071836;
        Sat, 22 Aug 2026 11:24:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e0ca:316a:4629:d835? ([2600:8803:e7e4:500:e0ca:316a:4629:d835])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6cdd6cbsm7668245b6e.10.2026.08.22.11.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:24:31 -0700 (PDT)
Message-ID: <fb0b857e-eac8-4755-9330-5cfe55523271@baylibre.com>
Date: Sat, 22 Aug 2026 13:24:29 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] iio: dac: ad5504: support scale via
 output-range-microvolt property
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, jic23@kernel.org, lars@metafoo.de
Cc: Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 skhan@linuxfoundation.org, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822085850.17527-1-0rayn.dev@gmail.com>
 <20260822085850.17527-7-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260822085850.17527-7-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 3:56 AM, Taha Ed-Dafili wrote:
> The AD5504 output range is set by the R_SEL pin, not the VCC supply.
> Add support for 'output-range-microvolt' to set vref_mv directly from
> firmware. Use device_property_present() to distinguish absent from
> malformed property rather than relying on the ambiguous -EINVAL from
> device_property_read_u32_array(). Fall back to the vcc regulator
> voltage for old DTs that predate this property.
> 
> Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
> ---
>  drivers/iio/dac/ad5504.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 74679feea385..d0a3dd4b000d 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -300,6 +300,7 @@ static int ad5504_probe(struct spi_device *spi)
>  	struct device *dev = &spi->dev;
>  	struct iio_dev *indio_dev;
>  	struct ad5504_state *st;
> +	u32 range[2];
>  	int ret;
>  
>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
> @@ -315,12 +316,30 @@ static int ad5504_probe(struct spi_device *spi)
>  	if (is_acpi_device_node(dev_fwnode(dev))) {
>  		st->vref_mv = AD5504_VREF_ACPI_DEFAULT_mV;
>  	} else {
> -		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> -		if (ret < 0)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to get vcc regulator\n");
> -
> -		st->vref_mv = ret / 1000;
> +		if (device_property_present(dev, "output-range-microvolt")) {
> +			ret = device_property_read_u32_array(dev, "output-range-microvolt",
> +							     range, ARRAY_SIZE(range));
> +			if (ret)
> +				return dev_err_probe(dev, ret,
> +							"Error parsing output-range-microvolt\n");
> +
> +			if (range[0] != 0 || (range[1] != 30 * MICRO && range[1] != 60 * MICRO))
> +				return dev_err_probe(dev, -EINVAL,
> +					"Invalid output-range-microvolt\n");
> +
> +			st->vref_mv = range[1] / (MICRO / MILLI);
> +
> +			ret = devm_regulator_get_enable(dev, "vcc");
> +			if (ret < 0)
> +				return dev_err_probe(dev, ret, "Failed to enable vcc regulator\n");

We should probably handle range-sel-gpios here. Otherwise, if a new DT tries
to use it, it will end up falling back to this old wrong behavior.

		} else if (device_property_present("range-sel-gpios")) {
			
Either return an error here that it is not supported. Or implement it by
making IIO_CHAN_INFO_SCALE writable.

> +		} else {
> +			/* Backward compat: old DTs without output-range-microvolt */
> +			ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> +			if (ret < 0)
> +				return dev_err_probe(dev, ret, "Failed to get vcc regulator\n");
> +
> +			st->vref_mv = ret / (MICRO / MILLI);
> +		}
>  	}
>  
>  	st->spi = spi;

