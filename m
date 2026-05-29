Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA736D9FA
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058202; cv=none; b=TxDMkelXsugdBJVoToGz05PycbMvm15cYN/B00Y7Tx1DG5MxjhiTliowg427MCTFjha/NsLozsWq4r8ayJmqLHjPEtm506M+KqlM3JdpiSjxgcPyF1Msr3ft5CIYIuw4C7Auf/7sdBfc32lTPlKrEHJrxbqOyVo1GZiTZelqT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058202; c=relaxed/simple;
	bh=myrxXD1dGrcA11fvw+2HVUvByQyyr53oo8ch+/2eIv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOM0qEYzhA27tBXGiANImqWgEvSDr23y7mMWweoBqV24eyDNQy5pF5XLmesi8ODl/p3iXYUF929t/2vMuiTDX8qG/sSR42jBmD+4zdigrXTKnkMyJemNzdA3/OoAWDtEMHXpLZXzstDPe1cXha7wVULOvgKtHDlLy3/EcVn/bDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiQX5Vck; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiQX5Vck"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9106ea78cd8so2097937885a.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780058200; x=1780663000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQQjgDRgrAEJpjkBeTc/yNlL6NewvgIK27ug4YpHsI4=;
        b=AiQX5VckwhBPhKjC/YAd3tovir7unV+zrNiwRvH5dbEPKKArjeRyNEoJr7eXmFAhPj
         we9IbbsjeUJdBDPH3yz6Xbt2dr7WSVq/8/X8IGqa2i7ORP/ycj65AQ4V65g0JgmDlBBL
         4KeAz7UGStSNkOkxPDQMTO0s7MY5TjhlTphPkoPYGz+jAO7YoO+hglXh4TVI5OicWIB/
         RxDMsJjeSM8/q4HFYqD2kDpP4rMTJ1Wl0jb6ay4HHskiIcf+Wuc/m/qKCjkLlkNGDKaG
         frO+UU5NMAP9EM+xS39aTRF7k561z+mQZTRxY1ajdoNqc5ZuB40vd6U8jVyZcGfZT5bf
         Sm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058200; x=1780663000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQQjgDRgrAEJpjkBeTc/yNlL6NewvgIK27ug4YpHsI4=;
        b=VYFwocGeIv2Wc1s/DGjVEAEwUb1FaRB2ooehJCQ2r3zFxqxOlCaBHjSUFKVXt2xDMg
         viqT5Xz/iwPzcoDTioBYfo5J3d13wWapHWvnGRapCPi8akG8KwiqZQT3jDIBbgj2Tnet
         Zy5JrTOicVetjXHU14as4UT0rTozHZtVH8d1bhqu7Mp1ESS3fQUzCkyzxXiJBSZxfWH4
         IOQgPcIHYm1FgSvCPqN0xBLos+FijYsI3flsUPy9YwaLfbhgmox2f+6sKJ7G2c0VFg2E
         EZj03MjJQz5wUtwD3QsKwHAXJDX2JNT5V9wGMTR2hvsqEHUAF8THUhPbQHN1mBG1+Mw7
         6Aiw==
X-Forwarded-Encrypted: i=1; AFNElJ/3qJcD4NsAqELCXPUh41E8s+M+uZD5BNGkAov7a/ApLLmgY4+lLU1vWW6yF40HQ2NtpL3xvNiIKmvi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9LQIuXpXimp6Ndyw+95Sbym6vLlij99sdGc90CO34SRx5v9eV
	1i/oiVYSJvTPjATGlmSw7SqYh17p3l7kL9UGjdonXypTmF8mO0Q65zHY
X-Gm-Gg: Acq92OEG6y4c+UUGANwUc1HtO2AnMZDt86/6CYjSIM05E3hh7bNpYhUTbFqoOr7tjW5
	lDVaqiNzNqSNcEL2ovHAdffUQRNKtF4Hn/jl63p06AkcTJ1d20EfqpSuLlPCNwUIOYs+C6cfwSV
	SCWCEyXzthAkCDIXV+iBhE1BqrRKQZnqf83WrrAaDUzldXdatxG2bORX50J76Fbwr4daEFNYklv
	c2+G6oqbrdWOiEFvnIeHwU5OI/dXMGxvBNOL5lWCNyq401sYcadVYEWKLtw0yDn8HwhNKCSD0CF
	yC5ctl8cGPVEr8K5zP6GS3BeAy0Q1Yo7fz9Pwlw7IK4F0wIFuFJ4ecYAhxgLWVuboNBQC92u1CZ
	7yrzXSbTmB/uUPiRy2SnOgHr3CehyUvL3iKRNszT5otfV1nVdpV57F5y1LIYPYDM2G7kfK8dRub
	AsynJOvIapRKXrFwINf6l2C/aJk3Umqd/DjLbmfX1OQBk=
X-Received: by 2002:a05:620a:4054:b0:914:c316:4608 with SMTP id af79cd13be357-915300673f8mr311156185a.62.1780058199768;
        Fri, 29 May 2026 05:36:39 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153247515esm175596085a.13.2026.05.29.05.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:36:38 -0700 (PDT)
Date: Fri, 29 May 2026 09:37:00 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	nuno.sa@analog.com, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, pop.ioan-daniel@analog.com
Subject: Re: [PATCH v2 2/4] iio: adc: ltc2378: Add support for LTC2378-20 and
 similar ADCs
Message-ID: <ahmIbL8sIwXaysff@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1779976379.git.marcelo.schmitt@analog.com>
 <40e1108bc9eaeba486705b54c4c94004f0e7f369.1779976379.git.marcelo.schmitt@analog.com>
 <20260529110205.2f91a1ed@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529110205.2f91a1ed@jic23-huawei>

On 05/29, Jonathan Cameron wrote:
> On Thu, 28 May 2026 12:03:52 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 
> > Support for LTC2378-20 and similar analog-to-digital converters.
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
...
> >  
> > +config LTC2378
> > +	tristate "Analog Devices LTC2378 ADC driver"
> > +	depends on SPI
> > +	depends on GPIOLIB || PWM
> 
> Triggered sashiko:
> https://sashiko.dev/#/patchset/cover.1779976379.git.marcelo.schmitt%40analog.com
> This dependency is odd enough that I think I'd add a comment on why.
> Also bring in the dependency on PWM in the patch that needs it not this one.
> 
> Will it build without gpiolib? If so I'd prefer that to be a || COMPILE_TEST
> just to get a little more coverage.
> 
The intent was to allow using the ADC with offload PWM triggered setup
even if the GPIO is not provided/enabled. We would be able to do the buffered
reads, but the single-shot read would be debatable since we would very likely
trigger many conversions in between a pwm_enable()/pwm_disable(). In the doubt,
I left the single-read procedure untouched specially because there's also the
case where the GPIO is there and so the single-read would work normally.

     +-------------+         +-------------+
     |         CNV |<-----+--| GPIO        |
     |             |      +--| PWM0        |
     |             |         |             |
     |             |      +--| PWM1        |
     |             |      |  +-------------+
     |             |      +->| TRIGGER     |
     |             |         |             |
     |     ADC     |         |    SPI      |
     |             |         | controller  |
     |             |         |             |
     |         SDI |<--------| SDO         |
     |         SDO |-------->| SDI         |
     |        SCLK |<--------| SCLK        |
     +-------------+         +-------------+

Maybe I'm going too much flexible trying to allow all those combinations?
Simplest way to avoid what sashiko points as garbage read is to go straight
'depends on GPIOLIB' and check the GPIO must always be there.

> 
...
> > +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> > +{
> > +	int ret;
> > +
> > +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> > +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> 
> Should we check for errors on setting the gpio?
> 
> > +	fsleep(4);
> > +	ret = spi_sync_transfer(st->spi, &st->xfer, 1);
> > +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> > +
> > +	return ret;
> > +}
> > +
> > +static int ltc2378_channel_single_read(const struct iio_chan_spec *chan,
> > +				       struct ltc2378_state *st, int *val)
> > +{
> > +	const struct iio_scan_type *scan_type = &chan->scan_type;
> > +	u32 sample;
> > +	int ret;
> > +
> > +	ret = ltc2378_convert_and_acquire(st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (scan_type->realbits > 16)
> > +		sample = st->scan.data.sample_buf32;
> 
> Sashikio has an interesting theory here that you need a shift. I can't immediately
> spot why it is wrong.  Given we are clocking in 32bits I assume the first
> res_bits are valid then we get a bunch of garbage after that. Given it's MSB first
> the SPI controller should put those in the top bits of the resulting u32 with the
> garbage at the bottom. So shouldn't we shift them down by 32 - resolution or something
> like that? + in buffered case provide the relevant shift value (in later patches)
> 
The only way I'm seing to get sample_buf32 with ADC data in the MSB is if the
CPU endianness is BE. Otherwise (LE), the data bits would be put into the lower
addresses when SPI puts the word in CPU endianness. But, if we do unconditional
shift, won't that break sign_extend32() for LE CPUs? Well, I'll anyway double
check the data for all sample_buf16/sample_buf32 buffer/non-buffer use cases.

> > +	else
> > +		sample = st->scan.data.sample_buf16;
> > +
> > +	if (scan_type->format == IIO_SCAN_FORMAT_SIGNED_INT)
> > +		*val = sign_extend32(sample, scan_type->realbits - 1);
> > +	else
> > +		*val = sample;
> > +
> > +	return 0;
> > +}
> > +
...

> case IIO_CHAN_INFO_RAW: {
> 
> > +		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> > +		if (IIO_DEV_ACQUIRE_FAILED(claim))
> > +			return -EBUSY;
> > +
> > +		ret = ltc2378_channel_single_read(chan, st, val);
> > +		if (ret)
> > +			return ret;
> > +
> > +		return IIO_VAL_INT;
> > +
> }
> 
> As that IIO_DEV_ACQUIRE_DIRECT_MODE() is declaring a local variable
> so there is something go out of scope and result in cleanup.
> LLVM moans about this, GCC just does the wrong thing which can in theory
> at least result in an underflow.
> You'll get build bot warnings on this - bug sashiko caught it.
> 

Oops I guess I started mis-squashing commits after a certain number of rebases XD
Will fix this and all other suggestions.

Thanks
