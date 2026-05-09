Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF2E1DC9B5
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778360393; cv=none; b=TJBMJzPwy/gDrvDsRHbdmKdcF2gMlZuacAZhYMLorCbOxYeGeVJXOa17lrJawizpxzQyMDuzwp5+WpkA0d+N8YOkqU7SBt9CRGZ31XkivK/tOPtNqYrQSN5r0k82rt2jvCYiSWcGGjlwUbj52U7lV5LHcm7H5kjAWraSHPVkkQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778360393; c=relaxed/simple;
	bh=ZzBP1B2qSk4hq42ZDl+LFeX6Ht/pq4pigntGLC9gO+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ri1O9wRjZtDjyz5JIILAEvUagX314aAVWSoZKo4cJf8b98DCmXzva5Tn+tzHLNg4vdR5Y2oreDNcCHDlP2u7yuAkidOlI3GQOpUOaPXo7HPOu6/VSqCpNQBXEz0l40lSEtONLYV5VL49AW4gEWpbavsEF/sKQKJpyGn1vexNHns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=CQGAAnAL; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="CQGAAnAL"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ede943bf0so2360782fac.2
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 13:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778360390; x=1778965190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2B2IWzmjvVV7Fc5wPOLwL5bkbEhy/N0MPl9N12WAp0=;
        b=CQGAAnAL7ywC+Xw8r1P1j2yPEbYhIyBQiqgyjfjyueqjzxIv1s2tfb4Xkx3eukVGwy
         fcxzbJHNE9txfWhuIfK/z12rwuU5asKJX8TTzc48dZxIR7lme9jzrbW9j68qamK1+/VR
         FWoSbHeihbAUe8s3uGEJHYmBG5wxTTLHrYcVAs4W6INavfEJIn5oVhOqRJSiQacgqaQ5
         8q/23MiiO5+FWWMKMbm7mwI2NdL2MojiiZ8296ALK2oUxJoIsu0ehNV8J30V9S1TOcwf
         aGCGY16FlBBdMHHNY+hofTGOo3tYnUeTTvUXwedoVKeaeYParwfMTiTN90I8HSFDwVxl
         gUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778360390; x=1778965190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2B2IWzmjvVV7Fc5wPOLwL5bkbEhy/N0MPl9N12WAp0=;
        b=kT5q7Yqk6kV3PDyabxJKyBZQjK11lwvuCeg1EOjBwtOF4AjVFMG192ks6WmLuCqI7n
         /hlsBhshKMEh4MrS3KKRnvV5nxjWG3HlDukZqdDeu3mDhjccpVSJ3izDLtDumeZfEjXL
         9AHA70AcnVbzP+pNGuPMMczSLCaZrmdlFrG2PKnO1qwng+7YIsvdH7dYPyI4Gm9tMklN
         M/517GxoIFnach79UzRGB5Mv3ZvHj1GJbtjhW03U2feS0pF2Qx7E/mVdZa+anNAZGex5
         QW+Dgy8h3eikLgBssEveam5tw5YtanToBNKUmbg9rKg1RAWT/AXSiTZNxUPL2GpWqe+J
         cKJA==
X-Forwarded-Encrypted: i=1; AFNElJ+MpFgESpT0/VVeFksiwiNWXKiT45MGjH8a7tTy9MUNQ7iZ9LlQyfgBItIGSB7+D0/yHIVv6EaennOe@vger.kernel.org
X-Gm-Message-State: AOJu0Yw474W44KSuGc/6ULXa8gZv5VDUZJf6EFDI04j6sDSYn6Zmm69j
	TcfmdRaDfmms098DV/+HZuRsCWHQK4WuJYF7UqkDh21by2TDyQJ/Hg1E6kEToerArRI=
X-Gm-Gg: Acq92OEXJOk2RNI/Tvl3BrGDU0v2UiLB0PbuD9JqjI9irPwFmBOrm0lpIJApwhvaJzH
	KtBBJpKbg6y2Ucb+otwrTZqQpDzg4A+QHVT4RpndHyD2EY8G+T5QrYcP6ya2IrxvUp7RzVtF7bs
	8SujeEQD/e1LO0Dnp1CwWy5axvmZMTP3cykJgP8AazXgwa6D0Zds3NE8WlLNoL8cDatQt/R6zFI
	72Bk/XJayDvX+O8LpEf9eO76ouUk4OG6JQhIeplfvsJCtYg+0rmP2j8gv810XPgUnre6nTjhCMv
	+2ttIhhkHiBfHudTnZ8FXKudMaH8evre3xUmMaQXAGmDAW7rfnjJbjbaXWcNuV2TLLRL+Zt8W/p
	oytcOZCMIy7iIxNAFSCq2xPLNp9COkZSEzYFuYLr3/T5zW5fNg7moQtcsYUpFmvb1tyqsrTevAI
	TdxvOX1lRT1x5vMivKcusjaBHaC5oKXZ6aF9VjESNsqv6ysN3zkhjTjTedByt2+3P3S1XeoiEjl
	g==
X-Received: by 2002:a05:6870:c693:b0:42f:c146:da68 with SMTP id 586e51a60fabf-434f58b4a06mr10972755fac.16.1778360390185;
        Sat, 09 May 2026 13:59:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3548:c22e:ea52:dbc7? ([2600:8803:e7e4:500:3548:c22e:ea52:dbc7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736dbc0sm5428751fac.11.2026.05.09.13.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 13:59:49 -0700 (PDT)
Message-ID: <bb23a9dc-4b95-4e36-9619-0c34d46a39ae@baylibre.com>
Date: Sat, 9 May 2026 15:59:48 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] iio: dac: ad5504: fix scale via
 output-range-microvolt
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, skhan@linuxfoundation.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260509142047.30302-1-0rayn.dev@gmail.com>
 <20260509142047.30302-6-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260509142047.30302-6-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/26 9:20 AM, Taha Ed-Dafili wrote:
> The AD5504 full-scale range is hardware-determined by the R_SEL pin,
> not the VCC supply voltage.
> 
> Fix the scaling logic by reading the standard 'output-range-microvolt'
> property from the device tree instead of querying the VCC regulator or
> relying on legacy platform data (pdata).
> 
> As a result of this transition:
> - The 'vcc' regulator is now only enabled, not read.
> - Legacy pdata support is removed, as it is no longer required for
>   fallback voltage calculations.
> - Strict array bounds checking is added for the DT property.
> 
> Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
> ---
>  drivers/iio/dac/ad5504.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 9e95da6e49d6..040f580b8282 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -14,10 +14,12 @@
>  #include <linux/kstrtox.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spi/spi.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>  
>  #include <linux/iio/dac/ad5504.h>
>  #include <linux/iio/events.h>
> @@ -274,9 +276,9 @@ static const struct iio_chan_spec ad5504_channels[] = {
>  static int ad5504_probe(struct spi_device *spi)
>  {
>  	struct device *dev = &spi->dev;
> -	const struct ad5504_platform_data *pdata = dev_get_platdata(dev);
>  	struct iio_dev *indio_dev;
>  	struct ad5504_state *st;
> +	u32 range[2];
>  	int ret;
>  
>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
> @@ -285,16 +287,19 @@ static int ad5504_probe(struct spi_device *spi)
>  
>  	st = iio_priv(indio_dev);
>  
> -	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> -	if (ret < 0 && ret != -ENODEV)

I don't think this would ever return -ENODEV, even on ACPI. It will
just get a dummy regulator now.

> +	ret = devm_regulator_get_enable(dev, "vcc");
> +	if (ret && ret != -ENODEV)
>  		return ret;
> -	if (ret == -ENODEV) {
> -		if (pdata->vref_mv)
> -			st->vref_mv = pdata->vref_mv;
> -		else
> -			dev_warn(dev, "reference voltage unspecified\n");
> -	} else {
> -		st->vref_mv = ret / 1000;
> +
> +	st->vref_mv = 60 * MILLI;
> +	ret = device_property_read_u32_array(dev, "output-range-microvolt",
> +					     range, ARRAY_SIZE(range));
> +	if (!ret) {
> +		if (range[0] != 0 || (range[1] != 30 * MICRO && range[1] != 60 * MICRO))
> +			return -EINVAL;
> +
> +		if (range[1] == 30 * MICRO)
> +			st->vref_mv = 30 * MILLI;
>  	}
>  
>  	st->spi = spi;

