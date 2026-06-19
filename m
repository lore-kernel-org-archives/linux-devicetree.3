Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60D13939B0
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874397; cv=none; b=NRgPuUDKjio85fiiiodftO+Z+Gy7A+X23HR3HRD6Ulel2oLLtc7ow7HlEvJwGM4sUW2O8qEy77y6dI0kW+bZEa4Gtrs97BfFDFcehlJRm0mD4RSNnIjdhZJgQc25ANjFM4XmDMk/An1eOCrcNgtPBqhTLhxXU5wYvDCFIPreU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874397; c=relaxed/simple;
	bh=hPq9GGLB/Xa4IfooWLsXz4nhu5OD3HFtkok0T2+uuA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SS9toveiQwLSVFPRRXctcLd1FzvXmepqfNRmrauQ65c0YRsWYqyTzYs7VD5tivOIoAUBgXUP5mTE+ZLSW9g1/dGOLuKQ3eHpjtHFoCnG8yG3EUo8vqwwV6/HlqqVQz04g5NDThY/wPw29/C0nav7tpNWh1oIjkbewq7DnyMIQuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvE/fYcz; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvE/fYcz"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1384ebe7a10so4187387c88.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781874392; x=1782479192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FKWz+v75WavDxx9BcP+T8YEk8allFL24miMeH++hQ+0=;
        b=QvE/fYczu0OE3VUksxaW9jmXDexJ3B/ZcFDtR/slEuRRWZj+dBvPky3WZfwG/kUEKT
         /9hS1HQQO4ETAlhBMpAosYfQaQZ5sHZfDRKW17VvperOicg16NDpCzIwdBDlz6P1kGxI
         Fahs5CLjDUj/mG8MyNRoI5tjlhZXvWB7+zwxbK5YbJyVDny5TfDQB/sUxk2Mz8Jb5cfN
         TVZxNn9yHMbgb1jMjTUt7F8hN2JTAfOevXkVhEditiyeHZKp5GLK4O4Zv3S7Du2IvzBQ
         IYt+amwvz8g44hLw4FwA5RQ+9kmPHtBvqfSq/e8YWyQDNHy+ZQx+FMI0oPrUUHSxFnVq
         jcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874392; x=1782479192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKWz+v75WavDxx9BcP+T8YEk8allFL24miMeH++hQ+0=;
        b=nZGlBk+DOcX9eNN3V9qamqblJRs7TfZMbe+UHNtSnB4Hvt3rYcFoh+MvJ8Pr55DbTN
         XFL1ghmgBjBgE6gLEpWgNy+kNtUaXIY5DxC09CmQ5k9eIkfuteZjjeeSiAAIJIa5FR0C
         UDNaX5Y511OeXKSbVwFbiiCh/bxo6dsfuVhynG9aZqSFC63H3QAK+DSmwF+5JMFfU69Z
         MZFauGR+n9Q7UNEpW/FfeF7cRLTqdkHc+bYTysBNGsxoib3yUus/XIwjPjCFgeD1MoqE
         u93VOTZYjRSyyL4xMJD4uSOSo9GZBmbheY2zw9iz+WuuqfvQLWzNQMN3/PscnQv4a3wH
         +fhg==
X-Forwarded-Encrypted: i=1; AFNElJ+vIZCP5u1cVF2gBWgvjukP7PPGPqnmxtrnGyb+3UO3y1qvljzITXGkfRMRczJ1JxM+KsDNNiGc9g2d@vger.kernel.org
X-Gm-Message-State: AOJu0YxvwRbfOO9MlLOJAmmZQIutu9nphtHAKpG3XRW3MgqDxExqK+2O
	BOvJqp1lgM6VIsFfYvSlSdtWYbAMQ+HImYxakhD67BVOBjgYGzF8mP61
X-Gm-Gg: AfdE7cltYRXVHwm3mzWqgP2cMoIu5RzmSY7H0vpZC7VkbZKOtC9pmrZU6/2eeKOQkUl
	YVFX0fbbMsrdIqhDrizb1CGJAKaN+X+KfUlcb5qCtoqpm4VH7OLf5jFNEBJjaMqKQfUUqneNpUZ
	Rs11juH8U21/Sygdlw/shJtM3xzv2bzbI0/IMxy9qMp5FSTPxwWUWuRGt3v+tT2UT0XAHPs2ljE
	cR2PPO23yID9dTeOgVnRba2LCN6FiRY9c9w804zMwzkfQLL/OU9QD/NyhUMAiGvzkZmn+BUb0p4
	xWu+JPRmlC7YLp11amJA8XS+rRlGDWahxQ1lXCl4wQvfSYy9/GBTOJU1VaQESXO3YTVEnquG/sU
	7dR87rBF8+UFhOCV9ONxx3/EZgrg8c32Ina3yxEDKSV2BjtaNtpTGURbrMCYa5GrXD+CA+5EwPC
	fst7tz3rNdvpm8//teQb/jaQ==
X-Received: by 2002:a05:701b:4586:10b0:128:bae0:e03c with SMTP id a92af1059eb24-139a504feefmr814976c88.30.1781874392336;
        Fri, 19 Jun 2026 06:06:32 -0700 (PDT)
Received: from localhost ([2804:30c:1f0a:b600:e457:1a16:4082:3e0a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139a34bdc83sm1769503c88.8.2026.06.19.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:06:31 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:07:10 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pop.ioan-daniel@analog.com
Subject: Re: [PATCH v3 1/5] dt-bindings: iio: adc: Add ltc2378
Message-ID: <ajU-_j1SWYbfjWla@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <f9e88abdbd23df8039282497a81d3c8698a10665.1781661028.git.marcelo.schmitt@analog.com>
 <20260617-bok-gains-9a1af41cf0de@spud>
 <ajLV-O60lCdlIbXR@debian-BULLSEYE-live-builder-AMD64>
 <20260617-oat-handclasp-ddd3135c5b84@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-oat-handclasp-ddd3135c5b84@spud>

On 06/17, Conor Dooley wrote:
> On Wed, Jun 17, 2026 at 02:14:32PM -0300, Marcelo Schmitt wrote:
> > On 06/17, Conor Dooley wrote:
> > > On Tue, Jun 16, 2026 at 11:03:11PM -0300, Marcelo Schmitt wrote:
> > > > Document how to describe LTC2378-20 and similar ADCs in device tree.
> > > > 
> > > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > > ---
> > > > Change log v2 -> v3:
> > > > - Re-added device tree fallback compatibles for LTC2378 chips, now with options
> > > >   to provide a single compatible string or a pair of single compatible string
> > > >   plus a fallback string to a slower sample rate spec in case a driver for the
> > > >   specific part is not found.
> > > > 
> > > >  .../bindings/iio/adc/adi,ltc2378.yaml         | 160 ++++++++++++++++++
> > > >  MAINTAINERS                                   |   7 +
> > > >  2 files changed, 167 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > > > new file mode 100644
> > > > index 000000000000..7d30a2cade8f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
> > > > @@ -0,0 +1,160 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/iio/adc/adi,ltc2378.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Analog Devices LTC2378 and similar Analog to Digital Converters
> > > > +
> > > > +maintainers:
> > > > +  - Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > > +
> > > > +description: |
> > > > +  Analog Devices LTC2378 series of ADCs.
> > > > +  Specifications can be found at:
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/233818fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236416fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236418f.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236716fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236718f.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236816f.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236818f.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/236918fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237016fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237616fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237618fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237620fb.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237716fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237718fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237720fb.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237816fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237818fa.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237820fb.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/237918fb.pdf
> > > > +    https://www.analog.com/media/en/technical-documentation/data-sheets/238016fb.pdf
> > > > +
> > > > +$ref: /schemas/spi/spi-peripheral-props.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      # Single compatible string match.
> > > > +      - enum:
> > > > +          - adi,ltc2338-18
> > > > +          - adi,ltc2364-16
> > > > +          - adi,ltc2364-18
> > > > +          - adi,ltc2367-16
> > > > +          - adi,ltc2367-18
> > > > +          - adi,ltc2368-16
> > > > +          - adi,ltc2368-18
> > > > +          - adi,ltc2369-18
> > > > +          - adi,ltc2370-16
> > > > +          - adi,ltc2376-16
> > > > +          - adi,ltc2376-18
> > > > +          - adi,ltc2376-20
> > > > +          - adi,ltc2377-16
> > > > +          - adi,ltc2377-18
> > > > +          - adi,ltc2377-20
> > > > +          - adi,ltc2378-16
> > > > +          - adi,ltc2378-18
> > > > +          - adi,ltc2378-20
> > > > +          - adi,ltc2379-18
> > > > +          - adi,ltc2380-16
> > > > +
> > > > +      # Low sample rate fallback for 16-bit unipolar sensors.
> > > > +      - items:
> > > > +          - enum:
> > > > +              - adi,ltc2370-16 # 2 MSPS
> > > > +              - adi,ltc2368-16 # 1 MSPS
> > > > +              - adi,ltc2367-16 # 500 kSPS
> > > > +          - const: adi,ltc2364-16 # fallback (250 kSPS)
> > > 
...
> > > What actually is the impact of the sample rate on the programming model?
> > If the user tries to set a sample rate beyond the maximum supported, software
> > can throw an error to indicate that.
> 
> I think you have misunderstood this. I was asking how the driver
> interacts with the hardware. Do all devices come out of reset with the
> minimum sampling rate? Or a per-device default rate? Do the faster
> devices support all slower rates? If they do, do the registers have the
> same meaning and the same value sets 2370-16 device to 1 MSPS as
> 2368-16.

Ah, the sampling rate is indirectly dictated both by how fast the CNV pin is
toggled and how fast SPI transfers run. Each rising edge of CNV starts a new
ADC conversion. Software may take spi-max-frequency as default but it will also
need to set a pace for CNV, and there is no default for that. The CNV pin may
also toggled on demand (e.g. single-shot read) and so I'd say all devices
support all slower sample rates. What software ought to do is orchestrate CNV
and SPI transfers to meet the timing requirements. No configuration registers
to be set.

> > 
> > With the code being proposed in this patch set, there is no benefit in matching
> > the ltc2364-16 fallback if there is a faster ltc2370-16 device connected because
> > device driver supports that. Though, other operating systems and/or platforms
> > might not support all device variants and so the fallback might be useful.
> > 
> > > +static const struct ltc2378_chip_info ltc2370_16_chip_info = {
> > > +	.name = "ltc2370-16",
> > > +	.resolution = 16,
> > In a later patch ...
> > +	.max_sample_rate_hz = 2 * HZ_PER_MHZ,
> > +	.tconv_ns = 322,
> > > +	.bipolar = false,
> > > +};
> > > 
> > > +static const struct ltc2378_chip_info ltc2368_16_chip_info = {
> > > +	.name = "ltc2368-16",
> > > +	.resolution = 16,
> > +	.max_sample_rate_hz = HZ_PER_MHZ,
> > +	.tconv_ns = 527
> > > +	.bipolar = false,
> > > +};
> > > 
> > > +static const struct ltc2378_chip_info ltc2367_16_chip_info = {
> > > +	.name = "ltc2367-16",
> > > +	.resolution = 16,
> > +	.max_sample_rate_hz = 500 * HZ_PER_KHZ,
> > +	.tconv_ns = 1500,
> > > +	.bipolar = false,
> > > +};
> > > 
> > > +static const struct ltc2378_chip_info ltc2364_16_chip_info = {
> > > +	.name = "ltc2364-16",
> > > +	.resolution = 16,
> > +	.max_sample_rate_hz = 250 * HZ_PER_KHZ,
> > +	.tconv_ns = 3000,
> > > +	.bipolar = false,
> > > +};
> > > 
> > ...
> > > > +      # Low sample rate fallback for 20-bit bipolar sensors.
> > > > +      - items:
> > > > +          - enum:
> > > > +              - adi,ltc2378-20 # 1 MSPS
> > > > +              - adi,ltc2377-20 # 500 kSPS
> > > > +          - const: adi,ltc2376-20 # fallback (250 kSPS)
> > > 
> > > I didn't check these, but I assume they are the same.
> > 
> > Yes, except for small variations on input (unipolar/bipolar) and precision bits,
> > these devices are pretty much equal.
> 
> What I meant here was that 2378-20, 2377-20 and 2376-20 would follow the
> same pattern of having identical match data (pre patch 4).

Yes, devices that have same input type and precision bits have the same match
data configuration (except for name). That's because the initial support patch
only supports single-shot data read.
