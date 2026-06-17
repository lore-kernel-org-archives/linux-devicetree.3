Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1804B8DEC
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781716441; cv=none; b=GDZ2WIFWgg0BMeebiWF9Q5pRtexecHbPi6nBZfmqqhFGSRwLDISjyhXJ9EYR7xF12vDVrzmDX0qQN/CZ9r/vra/qn1q7AaopefwNIbszbOta8BYKjAFM9/sveGo/VHm5ZJrR6bpNzoEMbik/GeVBVa68eGjs6+3PsateFAuKXCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781716441; c=relaxed/simple;
	bh=xIDciGkPDxl+GOsw0EvfaENOKwnEE8x3lxWp++1w/IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1LrUNLR6MyZvbEFW4IpJ5gjqRYdUH4rRNrC1nRvivknyVS9cPa3hHy0c+0SyV2vjeo0inaV8R0P9N13QFWopPqkS/iXr7bu5YCTZFUoLs1/IKdiZ5FKhbu1avKOdj6GLoLqmHKKX7L/N3IZhNvv+/QJk12SV9R93yygDpYPjls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJv7snLO; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJv7snLO"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1384ebe7a10so40265c88.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781716436; x=1782321236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkK63x4tm8us5I2Vs4qjhcSV0srfiYOxRPUfwTWSlMI=;
        b=rJv7snLOJQuG8RPtb0+lWgqA3hRNON1a5lGuHZdHZCV5EA0DzdotyQ5lbkrl6ku/4N
         98vxakRQiEdf6uZKVXZy2fOpyR7oKVCoQGOwSafAOHUmd/lKkmBAjXG8zD/WzkjXAhkh
         9HtgTNwbLOJZZUp8OfWc3kVjD6mnf/tm6wrUhPT1/wcblLoLtlll4yBoFcsCVCaNEdKO
         gD+2wD5SSXKjFBIAaqtRf5zt/9dVNC5+i/9Ue0axjkj5gNMxXWTPeoQdDJJ8q5nCBZYR
         z5/6zzW6XWHSlDaUAuH2lYiRIvcjEMGClXrcU6WPp9hJ7H9mtKJnwcTQN1fSKLtYqdYQ
         CdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781716436; x=1782321236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkK63x4tm8us5I2Vs4qjhcSV0srfiYOxRPUfwTWSlMI=;
        b=HaJwpSxDtpV1F8JLBK3PoAM2/gnXm27qUgCkyrhF0BCJ8km7NhhJkWijKkXYG01xuD
         QU2JF35V/WqNFXPonEQxlXMitbn6mPF6CPbEm0muiLyo16lZDeJUGmwA96+mGO8rvoVY
         cQcQ0XnQWkkUQ+dvPHJJhugqefWboPUqQhPDyFfmoY+pyPbbhAT3E9PcJp75QjUwCRMA
         bwJthTJWbtbHjzQ7oEFc1wcWWB0O0qy0IY1ZkDb/qSjnZc884Kjt2BCnnbJv/BjWTou5
         zu7bZUhr/KdDfpimImZ5Q0l/HdU6xg7sGulr3pDG0BWp2uTwBegwPHksllx3D4sn04gY
         4nwg==
X-Forwarded-Encrypted: i=1; AFNElJ+3/p34Xwxh1lyWVCcNl0NWsd7YlHIWn2VSV+KlLmuG5/7D8+weTgqupFG0v83PxWw62O0iJ2dp9SXA@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+daO+4cmRTk5onDImZsCkdmpUgWESwEG6iVdQXvHnHFPd5Gx
	30Ss7p0UTp5EEHrOlw1csgLoqeyacoT7iVgzeCkFzAYqeAm87PRmhsM0
X-Gm-Gg: Acq92OEM++1HREAvHWChNt+g/g5BXXvt108vK5YCRzjS6yUDzMEBw0pptQ1qhsEsEfV
	TziwW1Nf/e9Fp82dVIiL/XaQhV/GAqD3w3sAefGRlllu0O8vY0/Kdag2mPtw1HgRJnVd5jcF7LU
	tM7gb9jlFHfrZtm2hMqiGSGBxJDVR5S+Q6v9wqThHkmGRUyRPveoeniChnfXXOsDhUVcLq4enmH
	+kIJYmbSo1zI9zzsNnBJZaUlNPQ8qgdJREoNfqCaLb74TUTlhHZ4+XUtlFJ6ZzGV814Qu1NPLFs
	0+yTbmRIRXDWDqEQOKooDr6oTO9X/3MfRaZ5lFiUouGoMN0TsoM53NckqL9q7LzUbEpjSjWWaLr
	CYoLlRJiOyL5Fcy8U0vyGG96BBUywLMIVwcfkmRIbF+oDI3bFATt9pRQDw2WB+MVBFGuyEwhGKy
	e4tIl+9suaoht0REoR1y6GAw==
X-Received: by 2002:a05:7022:f9a:b0:138:576:fd with SMTP id a92af1059eb24-1398f66aeafmr2117301c88.2.1781716436403;
        Wed, 17 Jun 2026 10:13:56 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm17285359c88.14.2026.06.17.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:13:55 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:14:32 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pop.ioan-daniel@analog.com
Subject: Re: [PATCH v3 1/5] dt-bindings: iio: adc: Add ltc2378
Message-ID: <ajLV-O60lCdlIbXR@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <f9e88abdbd23df8039282497a81d3c8698a10665.1781661028.git.marcelo.schmitt@analog.com>
 <20260617-bok-gains-9a1af41cf0de@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-bok-gains-9a1af41cf0de@spud>

On 06/17, Conor Dooley wrote:
> On Tue, Jun 16, 2026 at 11:03:11PM -0300, Marcelo Schmitt wrote:
> > Document how to describe LTC2378-20 and similar ADCs in device tree.
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
> > Change log v2 -> v3:
> > - Re-added device tree fallback compatibles for LTC2378 chips, now with options
> >   to provide a single compatible string or a pair of single compatible string
> >   plus a fallback string to a slower sample rate spec in case a driver for the
> >   specific part is not found.
> > 
> >  .../bindings/iio/adc/adi,ltc2378.yaml         | 160 ++++++++++++++++++
> >  MAINTAINERS                                   |   7 +
> >  2 files changed, 167 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > new file mode 100644
> > index 000000000000..7d30a2cade8f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > @@ -0,0 +1,160 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/adi,ltc2378.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices LTC2378 and similar Analog to Digital Converters
> > +
> > +maintainers:
> > +  - Marcelo Schmitt <marcelo.schmitt@analog.com>
> > +
> > +description: |
> > +  Analog Devices LTC2378 series of ADCs.
> > +  Specifications can be found at:
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/233818fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236416fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236418f.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236716fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236718f.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236816f.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236818f.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236918fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237016fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237616fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237618fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237620fb.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237716fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237718fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237720fb.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237816fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237818fa.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237820fb.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237918fb.pdf
> > +    https://www.analog.com/media/en/technical-documentation/data-sheets/238016fb.pdf
> > +
> > +$ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      # Single compatible string match.
> > +      - enum:
> > +          - adi,ltc2338-18
> > +          - adi,ltc2364-16
> > +          - adi,ltc2364-18
> > +          - adi,ltc2367-16
> > +          - adi,ltc2367-18
> > +          - adi,ltc2368-16
> > +          - adi,ltc2368-18
> > +          - adi,ltc2369-18
> > +          - adi,ltc2370-16
> > +          - adi,ltc2376-16
> > +          - adi,ltc2376-18
> > +          - adi,ltc2376-20
> > +          - adi,ltc2377-16
> > +          - adi,ltc2377-18
> > +          - adi,ltc2377-20
> > +          - adi,ltc2378-16
> > +          - adi,ltc2378-18
> > +          - adi,ltc2378-20
> > +          - adi,ltc2379-18
> > +          - adi,ltc2380-16
> > +
> > +      # Low sample rate fallback for 16-bit unipolar sensors.
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2370-16 # 2 MSPS
> > +              - adi,ltc2368-16 # 1 MSPS
> > +              - adi,ltc2367-16 # 500 kSPS
> > +          - const: adi,ltc2364-16 # fallback (250 kSPS)
> 
> Your driver still matches on ltc2370-16, which makes me question the
> value of these fallbacks. That said, the chip info struct contains no
> information about sampling rate.
The info about sample rate is added in patch 4.

> What actually is the impact of the sample rate on the programming model?
If the user tries to set a sample rate beyond the maximum supported, software
can throw an error to indicate that.

> Is there actually a benefit to matching on ltc2370-16, or can you just
> match on the fallback?
The benefit is telling software that it is safe to go up to 2 MSPS. It is also
okay to match on the fallback, but software may restrain operation to a slower
sample rate.

With the code being proposed in this patch set, there is no benefit in matching
the ltc2364-16 fallback if there is a faster ltc2370-16 device connected because
device driver supports that. Though, other operating systems and/or platforms
might not support all device variants and so the fallback might be useful.

> +static const struct ltc2378_chip_info ltc2370_16_chip_info = {
> +	.name = "ltc2370-16",
> +	.resolution = 16,
In a later patch ...
+	.max_sample_rate_hz = 2 * HZ_PER_MHZ,
+	.tconv_ns = 322,
> +	.bipolar = false,
> +};
> 
> +static const struct ltc2378_chip_info ltc2368_16_chip_info = {
> +	.name = "ltc2368-16",
> +	.resolution = 16,
+	.max_sample_rate_hz = HZ_PER_MHZ,
+	.tconv_ns = 527
> +	.bipolar = false,
> +};
> 
> +static const struct ltc2378_chip_info ltc2367_16_chip_info = {
> +	.name = "ltc2367-16",
> +	.resolution = 16,
+	.max_sample_rate_hz = 500 * HZ_PER_KHZ,
+	.tconv_ns = 1500,
> +	.bipolar = false,
> +};
> 
> +static const struct ltc2378_chip_info ltc2364_16_chip_info = {
> +	.name = "ltc2364-16",
> +	.resolution = 16,
+	.max_sample_rate_hz = 250 * HZ_PER_KHZ,
+	.tconv_ns = 3000,
> +	.bipolar = false,
> +};
> 
...
> > +      # Low sample rate fallback for 20-bit bipolar sensors.
> > +      - items:
> > +          - enum:
> > +              - adi,ltc2378-20 # 1 MSPS
> > +              - adi,ltc2377-20 # 500 kSPS
> > +          - const: adi,ltc2376-20 # fallback (250 kSPS)
> 
> I didn't check these, but I assume they are the same.

Yes, except for small variations on input (unipolar/bipolar) and precision bits,
these devices are pretty much equal.

