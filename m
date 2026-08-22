Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A743594A
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787425645; cv=none; b=ZAoOKuRFi1dz0MNOb98ElD1DWJqgzjG2cmB3pwiwgEA4S1F9PYKN2UP7HGdZdZ5fUvp+vaIcwVKHMz6pxAW4cYyld1XMppyKlVFumGHzXEArhEEFzRRstI0GYViMZIidOAYS5ntgtFl8l9ZBVKSfYjNk8PRoduRKwvu2chukMSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787425645; c=relaxed/simple;
	bh=q+JiaLcxdy3sysUNv+2t8QVziFcjTkbCGdLHD4dAkUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RXv9tCkN9ccWyOkBYpy805xOdR3BgfDzrD6dFKP9VrboQJDMhk5B8ZSLPRkH6i+h/4isZ43EaXXDxYdKIMtLJHilB5d5k/NAykCXeRNA1AOGEtBClXq00nX773yNrH4c+05RvbpOM00pGQoPX9Hsd9ABJp69AsP+b5+jXBycQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CY5oT7h7; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CY5oT7h7"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8200ca16f26so31667077b3.3
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787425641; x=1788030441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfLRiHPUQLr/m5S0xV8RZFTsv1ej10z2QqVIP6Nh6zA=;
        b=CY5oT7h7dUIaG85wif4kxQDbOxqLftOCeDCoB6CgAi6EDAWa4expzztVj2WpPF2WrX
         9kPDsdiklCJJBY3tI2/mDh81rotvevYa9333KstiQ2tLf0Pb34/RVV6y1x2AZLEi20i/
         WvJ6Kr85QvRPcmH34iakx4AKxbXB5/Ev+ZTo1jEefBDQ3R6mHoLJS5RDTEpknNIX7Xrn
         r2FDWv3hxF7i5UqZ7btYmUcFVzTg8vl0MkQAo5dGe7wg0W5RzAimyLD3ccBqM/dgq+uM
         QQzmxYOJuqWhIu1KyC5r0qgemu5K0gJagn6m3OeQhsDUWPc1vbbJano7GjSfsDeoUf/N
         SlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787425641; x=1788030441;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfLRiHPUQLr/m5S0xV8RZFTsv1ej10z2QqVIP6Nh6zA=;
        b=IBh25C5I71tspqQqV5Q0fXHq896z5Gvzp4KcfamAJJ09YWVpT8fI3EsHZuO0GimMIi
         5/qhoJc0a3GADAzhuLlnJI46Qzap4gm5Ko5uV2HyNW+Mtiun6ygjKPziu1UwLezjM0E5
         ZSyZQGPUpFqAVIatVDv6gNLNYqz7E5m2G/oRfoDAkRDf9lwyN6GUr4ZDZvbMcVztgBha
         CwQDmeQXvnqn2QMPzbhn3NGWSi/zQ/cBESyR6JaJFMAuP0lJpAVsfTJiaqgPSEY+HFUo
         mFdWteCIZjv5CEAeghZg0gtuyIm9EWAuHLgpmJSN7fhRYZWNeQK6penMuCrd3N24OzTi
         7fjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Qu16806grzLuBxbBIkfzmceWUrtlseruBJ7FUEWHdz3b2NfYNV5W5RbN6BAtWCPunOvLGBxMVnTj@vger.kernel.org
X-Gm-Message-State: AFuF++nFw6OfK+3VTxlTnUBnHZjZFJ46LVlPTKF/tpqVIPY6e9KTYzLQ
	2RAXZZvhE+zYi/+AFCUlhbnwGMBl989l06+b4PftMlamLG0g/zTw9AAl51uW/oztogY=
X-Gm-Gg: AR+sD11AwokPTUMhudQHqj82YTMqFxB0mhBO0eKeW65ySW1gtvEuDLC0xfadwWisvUy
	pTYnivWjKHv/Rbg6qQg7twebmFbHlA3vPnC9YUGRtWn2suJUV4Z5rUThNjRRO4MlLazjmwaJeqC
	2uCMmrH5leINoUmyhAg7nSjoxYxwHmIoSBZwOmz+KTfP6nhBrJS08J4/CC37aSquJ+QID7Qx+0/
	X8zEq6gwu7XQP7ejyd6+J9XnRBCU9SGr4A1097lc3MHU8r4LXKHD8B6mZtpAefeuYB7VRVOShAi
	LLuGJuSndNYwtRMMNKpkicXcqjzy3oOIUmOTA99HunHl9e8PL20+adSMNdJBhXTHlKhppbACagP
	RNfcUbSlxCpKh/uW8uQUrOuPAmhpRvs8fGkCvdRMT9Us0PUmTccXclkAcU7Gnn5vF/4Sh6HWtn6
	qmpBFmofjiKrt2/hRiFu2JxyukO1QT6eogbhZatoIlpA5bLLKA1stBcl/krWcx8JqSkh5yBOPvs
	A/A5LPoziV6Dn5/wD9pcH4iH1gYfmrs0yXjT4c=
X-Received: by 2002:a05:690c:9b02:b0:81f:2403:9e70 with SMTP id 00721157ae682-849f4e5fe5bmr66342857b3.19.1787425641254;
        Sat, 22 Aug 2026 12:07:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e0ca:316a:4629:d835? ([2600:8803:e7e4:500:e0ca:316a:4629:d835])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac01868dsm13360367b3.42.2026.08.22.12.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 12:07:20 -0700 (PDT)
Message-ID: <8283770e-4c42-4d7c-adf7-7597288c9712@baylibre.com>
Date: Sat, 22 Aug 2026 14:07:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] iio: accel: adxl367: add support for INT2
 interrupt pin
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org, linux@analog.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821180753.4633-1-antoniu.miclaus@analog.com>
 <20260821180753.4633-5-antoniu.miclaus@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260821180753.4633-5-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 1:07 PM, Antoniu Miclaus wrote:
> The ADXL367 provides two independent interrupt output pins, INT1 and
> INT2, each with its own event mapping register (INTMAP1_LOWER at 0x2A
> and INTMAP2_LOWER at 0x2B) sharing an identical bit layout. Until now
> the driver hardcoded INT1 for all interrupt mappings, so a board that
> routes only INT2 to the host could never receive activity, inactivity
> or FIFO watermark interrupts.
> 
> Determine the connected pin from the interrupt-names device tree
> property using fwnode_irq_get_byname(), and route the interrupt
> mappings to the matching register. Use the interrupt number returned by
> the lookup for devm_request_threaded_irq() so the requested line always
> matches the routed INTMAP register, regardless of the order in which the
> interrupts are listed. When no interrupt-names are present, default to
> INT1 and the bus-provided interrupt to preserve the existing behaviour.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> Changes in v3:
> - Use the interrupt number returned by fwnode_irq_get_byname() for
>   devm_request_threaded_irq() so the requested line always matches the
>   routed INTMAP register, regardless of the interrupt-names order.
> - Access the interrupt map register via regmap_assign_bits() following
>   the new precursor patch.
> 
>  drivers/iio/accel/adxl367.c | 40 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/accel/adxl367.c b/drivers/iio/accel/adxl367.c
> index 54c4d1226790..f5808980b639 100644
> --- a/drivers/iio/accel/adxl367.c
> +++ b/drivers/iio/accel/adxl367.c
> @@ -13,6 +13,7 @@
>  #include <linux/iio/sysfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/unaligned.h>
> @@ -81,6 +82,7 @@
>  #define ADXL367_SAMPLES_L_MASK		GENMASK(7, 0)
>  
>  #define ADXL367_REG_INT1_MAP		0x2A
> +#define ADXL367_REG_INT2_MAP		0x2B
>  #define ADXL367_INT_INACT_MASK		BIT(5)
>  #define ADXL367_INT_ACT_MASK		BIT(4)
>  #define ADXL367_INT_FIFO_WATERMARK_MASK	BIT(2)
> @@ -168,6 +170,8 @@ struct adxl367_state {
>  	enum adxl367_odr	odr;
>  	enum adxl367_range	range;
>  
> +	u8		int_map_reg;
> +
>  	unsigned int	act_threshold;
>  	unsigned int	act_time_ms;
>  	unsigned int	inact_threshold;
> @@ -366,7 +370,7 @@ static int adxl367_set_act_interrupt_en(struct adxl367_state *st,
>  {
>  	unsigned int mask = adxl367_act_int_mask_tbl[act];
>  
> -	return regmap_assign_bits(st->regmap, ADXL367_REG_INT1_MAP, mask, en);
> +	return regmap_assign_bits(st->regmap, st->int_map_reg, mask, en);
>  }
>  
>  static int adxl367_get_act_interrupt_en(struct adxl367_state *st,
> @@ -377,7 +381,7 @@ static int adxl367_get_act_interrupt_en(struct adxl367_state *st,
>  	unsigned int val;
>  	int ret;
>  
> -	ret = regmap_read(st->regmap, ADXL367_REG_INT1_MAP, &val);
> +	ret = regmap_read(st->regmap, st->int_map_reg, &val);
>  	if (ret)
>  		return ret;
>  
> @@ -400,7 +404,7 @@ static int adxl367_set_act_en(struct adxl367_state *st,
>  static int adxl367_set_fifo_watermark_interrupt_en(struct adxl367_state *st,
>  						   bool en)
>  {
> -	return regmap_assign_bits(st->regmap, ADXL367_REG_INT1_MAP,
> +	return regmap_assign_bits(st->regmap, st->int_map_reg,
>  				  ADXL367_INT_FIFO_WATERMARK_MASK, en);
>  }
>  
> @@ -1423,6 +1427,31 @@ static int adxl367_setup(struct adxl367_state *st)
>  	return adxl367_set_measure_en(st, true);
>  }
>  
> +static int adxl367_set_int_map_reg(struct adxl367_state *st, int irq)
> +{
> +	int ret;
> +
> +	ret = fwnode_irq_get_byname(dev_fwnode(st->dev), "INT1");
> +	if (ret == -EPROBE_DEFER)
> +		return ret;
> +	if (ret > 0) {
> +		st->int_map_reg = ADXL367_REG_INT1_MAP;
> +		return ret;
> +	}
> +
> +	ret = fwnode_irq_get_byname(dev_fwnode(st->dev), "INT2");
> +	if (ret == -EPROBE_DEFER)
> +		return ret;
> +	if (ret > 0) {
> +		st->int_map_reg = ADXL367_REG_INT2_MAP;
> +		return ret;
> +	}
> +
> +	/* No interrupt-names: default to INT1 for backwards compatibility. */
> +	st->int_map_reg = ADXL367_REG_INT1_MAP;
> +	return irq;

I guess this works, but it seems like trial and error rather than being
purposeful. 

Could probably do something like this too:

	if (device_property_present("interrupt-names")) {
		ret = device_property_match_string(st->dev, "interrupt-names",
						   "INT2");
		if (ret < 0)
			return ret;

		/* If INT2 is at index 0, use it, otherwise use INT1. */
		st->int_map_reg = ret ? ADXL367_REG_INT2_MAP : ADXL367_REG_INT1_MAP;
	} else {
		/* No interrupt-names: default to INT1 for backwards compatibility. */
		st->int_map_reg = ADXL367_REG_INT1_MAP;
	}


	ret = fwnode_irq_get_byname(dev_fwnode(st->dev),
				    st->int_map_reg == ADXL367_REG_INT1_MAP ?
				    "INT1" : "INT2");


(Could use device_property_match_property_string() instead if we want to
return error on invalid values instead of assuming INT1.)

> +}
> +
>  int adxl367_probe(struct device *dev, const struct adxl367_ops *ops,
>  		  void *context, struct regmap *regmap, int irq)
>  {
> @@ -1479,6 +1508,11 @@ int adxl367_probe(struct device *dev, const struct adxl367_ops *ops,
>  	if (ret)
>  		return ret;
>  
> +	ret = adxl367_set_int_map_reg(st, irq);
> +	if (ret < 0)
> +		return dev_err_probe(st->dev, ret, "Failed to get interrupt\n");
> +	irq = ret;
> +
>  	ret = devm_request_threaded_irq(st->dev, irq, NULL,
>  					adxl367_irq_handler, IRQF_ONESHOT,
>  					indio_dev->name, indio_dev);

