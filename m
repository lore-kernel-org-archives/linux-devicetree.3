Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C0400E0C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944411; cv=none; b=ngyMDEHvD/Xuc/xcZ/q+ykxW7O0swLPo+ZrN8aFHR1VZtSVnJZLSyYwj6lsCXn1WGwAL/kJYr0TdjC15LxBnbQrGfOLA3zoY17Bpx1ceG+PSKOGN30GBWSdRvDefyi1IovEE1T7bWrbXxNbPsIwkRlJ7kQVER8IRHPE1IYTGhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944411; c=relaxed/simple;
	bh=ANd2Bx0+9L7pMxZpVmv6dUN/nLNpoY0lPSoklF2AQ8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMMLpXhk8kplehsOtKGWQD8t/WJ9tSpIjF00ienzw6kehN/VVZB747rEFhyJ6LfmEQLDyD5iIhEdUkswi9eSoB6XTwEz5n5BpPUwG7wDB3dMm87fFr0yszJhKXiNlSLrGuLzyw/AWkLKKdQsgJkyR9mn6MqbmkZ6YrGPnviXqNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSn4nbhb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSn4nbhb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca0c5799eso30577985ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944409; x=1784549209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiBB2AvjwEgMU9ZBqIUAymdVhyVC0dkURlNDosko2JY=;
        b=hSn4nbhb381bh4UouhkYV8Ba6UMJsHGqCo8FKANQ53AV683bfxiGeUjZYKddhv/Lqi
         rrmNNEwbrKAMZ88VNANlO2l+urZhTjm8dum+lrlpNbNAcGweyMT223PV3idAqdXooX4s
         RdpHlEzzLyOxH/oRJLM2Zl7pfnDlu1fDbvCVByLl1hVwhrkneYspDDSucVJg/xa5ZO2v
         HBesGQDmobmXHG0Z6NvhXtUG5yOSFJj2s01bgDtaV+JJEMETd7gvQCcKrTeXJpN7cZiY
         X9iSNR8DHVSrc8Lelj5lQoHVUJFcoXhXfDVe1p6l4JmpaANxwIUFqTJQ5hOGq0o67Y2p
         Y4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944409; x=1784549209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiBB2AvjwEgMU9ZBqIUAymdVhyVC0dkURlNDosko2JY=;
        b=CQDOqByypL7rsfDxm87pwh0UIH+maXUGvln3Mujqww5wr9Vpk2yZ7miQZ+zoBapEYb
         zY8960h5EaCNBIpkb1A/XLFypGs2ANrG56EcsccGxMZfeGoMNQE41pKJI/nViyrmhu2/
         1XUfKc1p1tq+POMcx+DZABNC9yymKac3cBuoyIhAoqtD6ybziyZMeRH8VTtzPi2IjCdL
         szZ7o9b1FzzINdMFYjwRXqoS3iV1VRudV+MPG/cps0fbjziXlOssOaBOLi4c/zNSAECO
         ywLo1LMfXaEKWV2oqeU9tR1rV8W0kPXAwI0HzWjDQ8NPqswlWp6Jz/+2/1tilFUxBOmr
         MKbw==
X-Forwarded-Encrypted: i=1; AHgh+RpnsPlf0q37BxzVFdcX49xWEVVmcqZGIoj+ghckWWpg12NWYDYLRl9LFT8t9IfJdhd2dIY7OLepxTtT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp+RfzVjSPVW4xNYHQyJInEe0Lf5zYjilEJWgXL/Ga5gFM7iBQ
	s/zFQaViGhsCNO+XV4kqUp1m0/+PdOyokc9IEBcV0huizERPMWiOOZPpHrRfHA==
X-Gm-Gg: AfdE7ckT3kfSArB0bzTHGB9ECoqkPo3wyA366BCtO+3wkXfmOx9rxi7NBKtRxIYKOyM
	H/VoCJybSDRM6rXJ1tfcmxUcWoL+dWIkT4R7fcgjKY/DBxBPC54ifhtISCGcCfYbo+iEaMkqk9K
	H7LzZ7XD3HrwiPXg3tyMb6D7hoMbAO6HMsUU5cyt3XyuD3Mb7q+79/xso9vtOYXa4+odQs+sHnV
	YQLCdY558kWLJwThncGq2hix+X6vR3kvxL6li5VHeNeHsvlSmHQTsT9cBQMUWuo0n2sJkkeWO9p
	xJzT5wpH4onXfrHCu4lHDOc5ih/JOIowZYN6SpxEMFtRWMh/jcSJhtgQDjFeSo/hMUo/JwynaOW
	qzYe1eWLW3IBUi1yvTr5i0jAdJM5V86aopTAWaTtSIfEXwTjsDPK572YMROWHmPOHDjYNvy7MA3
	H9dWt5bplRfOY10ADNLAQFXmO82KalpJ5i2j0uPJ2J+9wIaYZH69xmhSCS97FrAP6p
X-Received: by 2002:a17:902:ea03:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2ce9ed181f6mr82457095ad.21.1783944409251;
        Mon, 13 Jul 2026 05:06:49 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm99687915ad.39.2026.07.13.05.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:06:46 -0700 (PDT)
Message-ID: <cd0aa9c5-6e24-4b8b-92d1-630cf47b066b@gmail.com>
Date: Mon, 13 Jul 2026 20:06:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
 <20260713081127.115197-3-cwweng.linux@gmail.com>
 <alTJPExu9b3lRtx_@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <alTJPExu9b3lRtx_@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for the detailed review.

 > bitmap.h implies bitops.h...
 >
 >> +#include <linux/bitops.h>
 >
 > ...so you may drop this one.

Will do. I will drop linux/bitops.h. I will also drop
linux/mod_devicetable.h since platform_device.h is enough here.

 > Please, make all register offsets fixed width, exempli gratia
 >
 > define MA35D1_EADC_STATUS2        0x0f8

Will fix all register offsets to use fixed-width hex values.

 >> +#define MA35D1_EADC_INTSRC0_SPLIEN(n)    BIT(n)
 >
 > Useless? Can't BIT() be used directly?

The field selects which sample module raises ADINT0. This initial driver
only uses sample module 0, so I will replace this helper with a fixed
named bit for SPLIEN0.

 >> +#define MA35D1_EADC_INTERNAL_VREF_MV    1600
 >
 > _mV (yes, as per SI).

Will rename the macro and field to use _mV.

 >> +#define MA35D1_EADC_REF_STABLE_US    1000
 >
 > (1 * USEC_PER_MSEC) ?
 > If go this way, include time.h for the multiplier definition.

Will change this to use USEC_PER_MSEC and include linux/time.h.

 >> +static const struct regmap_config ma35d1_adc_regmap_config = {
 >> +    .reg_bits = 32,
 >> +    .val_bits = 32,
 >> +    .reg_stride = 4,
 >> +    .max_register = MA35D1_EADC_REFADJCTL,
 >
 > No cache?

No register cache is intended for this MMIO ADC block. I will make that
explicit by setting .cache_type = REGCACHE_NONE.

 >> +static bool ma35d1_adc_valid_diff_pair(unsigned int vinp, unsigned 
int vinn)
 >
 > Wondering if this is just
 >
 >    return (vinp >= 0 && vinp < 4 && (vinn == vinp + 4));

Yes, the valid differential pairs are 0-4, 1-5, 2-6 and 3-7. Since vinp
is unsigned, I will simplify this to:

     return vinp < 4 && vinn == vinp + 4;

 >> +static int ma35d1_adc_set_bits(...)
 >> +static int ma35d1_adc_clear_bits(...)
 >
 > What's the point in these wrappers?

There is no strong reason to keep them. I will remove the wrappers and
use regmap_set_bits() / regmap_clear_bits() directly.

 >> +static int ma35d1_adc_setup_reference(struct ma35d1_adc *adc)
 >
 > Add a short comment with reference to a datasheet table/section/et 
cetera.

Will add a short comment describing the REFADJCTL/PDREF and VREFSEL
settings according to the MA35D1 EADC reference control description.

 > With
 >
 >    static regmap *map = adc->regmap;
 >
 > this becomes ...

Will use a local regmap pointer in functions that access several
registers. That should make the code shorter and easier to read.

 >> +    ret = regmap_update_bits(adc->regmap, MA35D1_EADC_CTL,
 >> +                 MA35D1_EADC_CTL_DIFFEN |
 >> +                 MA35D1_EADC_CTL_DMOF, ctl);
 >
 > regmap_assign_bits()

Will use regmap_assign_bits() for the differential mode bits.

 >> +static int ma35d1_adc_update_scan_mode(...)
 >
 > This is interesting check...

I will rework this to explicitly accept exactly one IIO_VOLTAGE scan
channel. This avoids depending on the last bit found in the scan mask.

 >> +    guard(mutex)(&adc->lock);
 >> +    if (adc->suspended || !adc->scan_chan)
 >> +        goto done;
 >
 > This is usually leads to a mess in the compiler...

Will fix this by removing the goto from the trigger handler and using a
scoped_guard() block instead.

 >> +    chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
 >> +                     BIT(IIO_CHAN_INFO_SCALE);
 >
 > Broken indentation...

Will fix the indentation.

 >> +static struct iio_chan_spec
 >> +ma35d1_adc_timestamp_channel(unsigned int scan_index)
 >
 > Useless wrapper. Just put _SOFT_TIMESTAMP() in place.

Will remove the helper and assign the timestamp channel directly using a
compound literal.

 >> +    if (!num_channels)
 >> +        return dev_err_probe(dev, -ENODATA,
 >> +                     "no ADC channels configured\n");
 >
 > I would return -ENOENT...

Will change this to -ENOENT.

 >> +    channels = devm_kcalloc(dev, num_channels + 1, 
sizeof(*channels), GFP_KERNEL);
 >
 > size_add() ?

Will use size_add(num_channels, 1).

 >> +        differential = false;
 >> +        vinn = 0;
 >
 > Make it an 'else' branch.

Will do.

 >> +    adc->vref = devm_regulator_get_optional(dev, "vref");
 >
 > It can be unnested:

Will unnest the optional regulator handling in v3.

 >> +    adc->vref_mv = ret / 1000;
 >
 > (MICRO / MILLI)
 >
 > instead of plain 1000.

Will fix this as well. The regulator API returns the voltage in
microvolts, while the driver stores the reference in millivolts for
IIO scale reporting. I will rename the field to vref_mV and use:

     adc->vref_mV = ret / (MICRO / MILLI);

with linux/units.h included, instead of using the plain 1000 constant.

Thanks again for the review. I will address these comments in the next
revision.

Best regards,
Chi-Wen

