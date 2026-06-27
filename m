Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37668233D9E
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 21:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782595477; cv=none; b=UvQ49l3Qzc+ZA1cXchrVroeUlbGgNQU2aRFSx0suZjK/IcI0hQOvPoS7d0WMGnMFpbEpdSLbr5L2PpoyE25nGS2ZQAbWnW/h6z+357iQBRwrF/6b9ri4qTnnoBrNUKj3Ef4QfgruT8E5y2zthBcVWizQE1fLaAGI6iIE4knK2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782595477; c=relaxed/simple;
	bh=/ZjeGJ/bIA564jdCVSzFiyPxI844EbgOUogGjeVY0oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gT5jyoZ9Ga9jlW+NeC+yxeLY5gdzu5zPTfTkJrZC1+MJhA/sRXreFDKFqK2o7Hd9Llph6IyUqDOPm/o0ciOibC9M3M2QMWFhAe713HuXM0S7OqnkYv/Xu5uVGc2JxHy2B4yU2kXi4kyoa8WS+XYisESxMX0uY1uPpV5Bkgw5JHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BxsW+YcD; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BxsW+YcD"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6a14d52e72cso1036774eaf.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 14:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782595473; x=1783200273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4jIJTVXYnKYZ9qZqfum56MRXesVpvMmgXXybijGVXk=;
        b=BxsW+YcDMse3LD+buzs64R3PbYgSW5+f9IQ+d+XKoQnKmvceuUf4l9bqM8NpRSDM0f
         UEpI1zq8m5V9K7pV62P3PeokmS3DtZMfvw/ygELDXOyEikK8JHy87pctkt3NZCoz600z
         uFIyPEys1DtMlnpoDFVJONbAZcXWoR0Y1a1iOzza4amN/Q33F4NohPuIUytWQ96LLWCS
         yvfr4pbNoqgUOFdjrweHPTtL8DrpMYpphwLfrTFv/uzTE7clpvz7VnubnAAwOlaO0gux
         ZfZezzc/mntJ6Tpal2B3G8DAw59FGBTrfiDBQHMXiXnDrbp2n3mEq5HWy1oIBYhB46Kx
         dYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782595473; x=1783200273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4jIJTVXYnKYZ9qZqfum56MRXesVpvMmgXXybijGVXk=;
        b=l3RYsYRVEO9QYxGDe3J7mDUpuCpIfoRV3JnhNeyeP0WQa6JZ6VJnJtGun3PhNC5BMZ
         e8iZcPylFZ+FqMafs6MSsFxywRvO+uqsXDeoEY4xzVyDjEg0VauC6+nj8HWZ6SptptA4
         2XCB4jmmIfF64jsgD2UZNDK3w4ebpW/QpLzf1PImqhgKa6BQrQANogTRXNzHyUhpI79w
         UaQsBUVnWS54UaadnA6OHa/EA6rDyr6g+TuKThi777buZeOGY4SGAaZ5axvoBW5lQQAC
         y8Jsnym9OM4Ypvrl66nwSSM5eulg0lOjPlPXi8pOw1Wv+OGtUMG+/xh3E7GwGNG865Zq
         yWoA==
X-Forwarded-Encrypted: i=1; AFNElJ9aHLMEOQ1lcipBJiKm6KAOkc90fZe41jf1MYlosx2HKIBojons9tJILhS2wEDb3kFJGHoD+TUuY8gN@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZSi1DO59nBs6Eufz9VYqwg65PWBrrRNDZtIh3RTC01b3s4GA
	jBhF4nc1/Fx58NEF0t8jBfYLWGbUj4qGFG/X16FEJt+fkbI8pvYxuLoBqvtOxHHjsGU=
X-Gm-Gg: AfdE7cmaBiW0dvuh6X23nZqHo6lSWwuTR02loKY40Zf1/14hU8D4kG1jbnMUtXj8rfw
	FIsNKkhc1htAaY4/4O+29wnARxRl5+pvQ176g/i3foJbp2nTN/TaP0yDjA1qUrydwwHip2fRIBB
	3B+F2KuqUBTaICk2Fnu+JQn0JOUUlWBY7qQ82FiTQKAOIM2LN/HhgOhy+YXOgyGg9RdldwsljDE
	/cJK7PXDzudYHIJ8Mewxf1dTBFcDh47LKnPUDDr592KCbIjioo5XkeuyIjD3Aamf/XDU9Rrdhdo
	7mL8imXkPFX7PhTVA0QEvg/YDpmHZjVfmBCWbxnATzu/Gl+P1IfkKJkhcvgPs9G1vfHqMCqg9tt
	5AJ81vVYjkCs9U4/6qkl90hITg76C9NOvWpiCBeO71Tb7wV+PZu3BNOTfz0rcOKc+imyScqlOMS
	LxN9RAEPq7/OcKkJ/mVmcR+pDtKsW/BGNcuKmEssjKRtCOQ2uUDyeofJwji4TNKKI=
X-Received: by 2002:a05:6820:1608:b0:6a0:b54b:a1ef with SMTP id 006d021491bc7-6a13517f731mr8946039eaf.11.1782595473208;
        Sat, 27 Jun 2026 14:24:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4487291914asm1472012fac.7.2026.06.27.14.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 14:24:32 -0700 (PDT)
Message-ID: <9c6e0a74-c9c5-43ee-8eca-ae1667c51c32@baylibre.com>
Date: Sat, 27 Jun 2026 16:24:31 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 julianbraha@gmail.com, marcelo.schmitt1@gmail.com
References: <cover.1782397418.git.marcelo.schmitt@analog.com>
 <0abf862eeb277ae82262d09b11b1446f04c47be7.1782397418.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <0abf862eeb277ae82262d09b11b1446f04c47be7.1782397418.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/26 9:35 AM, Marcelo Schmitt wrote:
> Support for LTC2378-20 and similar analog-to-digital converters.

This should mention that it contains some future prep for offloading.
(Although would be a bit easier to review if we deferred adding the
offload stuff).

> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
> Change log v3 -> v4:
> - Reworked the driver to make IIO channels static according to v3 feedback.
> - Updated to use default 8 bits_per_word for non-offloaded transfers.
> - Handled refin voltage reference supply for LTC2338.
> - Used spi_bpw_to_bytes() where applicable.
> 
>  MAINTAINERS               |   1 +
>  drivers/iio/adc/Kconfig   |  12 ++
>  drivers/iio/adc/Makefile  |   1 +
>  drivers/iio/adc/ltc2378.c | 395 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 409 insertions(+)
>  create mode 100644 drivers/iio/adc/ltc2378.c
> 

...

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> index 000000000000..9a9f32e4989b
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Analog Devices LTC2378 ADC series driver
> + *
> + * Copyright (C) 2026 Analog Devices Inc.
> + * Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include <linux/iio/iio.h>
> +#include <linux/iio/types.h>
> +
> +#define __LTC2378_DIFF_CHANNEL(_sign, _real_bits, _storage_bits, _offl)\

Why the leading underscores? I don't see a conflicting name.

> +{										\
> +	.type = IIO_VOLTAGE,							\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |				\
> +			      BIT(IIO_CHAN_INFO_SCALE) |			\
> +			      (_offl ? BIT(IIO_CHAN_INFO_SAMP_FREQ) : 0),	\
> +	.info_mask_separate_available = _offl ? BIT(IIO_CHAN_INFO_SAMP_FREQ) : 0,\
> +	.scan_index = 0,							\
> +	.scan_type = {								\
> +		.format = _sign ? IIO_SCAN_FORMAT_SIGNED_INT :			\
> +				  IIO_SCAN_FORMAT_UNSIGNED_INT,			\
> +		.realbits = _real_bits,						\
> +		.storagebits = _storage_bits,					\
> +		.shift = (_offl ? 0 : _storage_bits - _real_bits),		\
> +		.endianness = _offl ? IIO_CPU : IIO_BE				\
> +	},									\
> +}
> +
> +#define LTC2378_BIPOLAR_DIFF_CHANNEL(_real_bits)				\
> +	__LTC2378_DIFF_CHANNEL(1, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)
> +
> +#define LTC2378_UNIPOLAR_DIFF_CHANNEL(_real_bits)				\
> +	__LTC2378_DIFF_CHANNEL(0, _real_bits, (((_real_bits) > 16) ? 32 : 16), 0)

Why not move the (((_real_bits) > 16) ? 32 : 16) into the __LTC2378_DIFF_CHANNEL()
macro to avoid repeating it?

> +
> +struct ltc2378_chip_info {
> +	const char *name;
> +	unsigned int internal_ref_uv;

_uV (to be consistent)

> +	struct iio_chan_spec chan;
> +};
> +

...

> +static int ltc2378_regulator_setup(struct device *dev, struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "refin");
> +	if (ret < 0 && ret != -ENODEV) {
> +		return dev_err_probe(dev, ret, "failed to read refin regulator\n");
> +	} else if (ret > 0) {

Else is not needed here.

> +		st->ref_uV = ret;
> +		return 0;
> +	}
> +
> +	if (st->info->internal_ref_uv) {
> +		st->ref_uV = st->info->internal_ref_uv;
> +		return 0;
> +	}

I would be tempted to have two separate functions here and only call one depending
on the chip. Otherwise, it allows incorrect devicetree.

> +
> +	ret = devm_regulator_get_enable_read_voltage(dev, "ref");
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to read ref regulator\n");
> +
> +	st->ref_uV = ret;
> +
> +	return 0;
> +}
> +
