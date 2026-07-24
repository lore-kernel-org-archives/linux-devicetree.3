Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6F5360ECE
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904442; cv=none; b=NgnF+yJFRakaym43p6F5nGNegxQen4MpDS+uJEoS9d63QMOtj9RMN3LOtK63fSlaoduhrSxv71YJVY/5BuCHSIVgiAr2fEw0BeT+aYFx0gDLei9BLtqWLZK9ENKHJuvD6vB4LFyRFaZ7VWlDQfSs+xcC/DIzIauO+GrUqDEFtGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904442; c=relaxed/simple;
	bh=OxwT/NZpAw9aMLGpXFCht2PPuvSomIUkFsVv2SQEvHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbWcFgIHOmqTshWNiuHc/q2f7Kww+UiCidHJaHI/edzNiUlPazn/8bJY72wEddq5PpGbXeUSkYYsFZC7D7t+jILzS0tqojGJ1mSiFmvmLlc2JCMKbJFwJVfMtW9a2NbMrsQHm4PGxqP2EEUzES760MtqX/cZBlLaI1ncdf9IvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itevPDil; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itevPDil"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf95ade656so158084e0c.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784904439; x=1785509239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dd5ljADXPcqLcjndY5eXs0DUhwwgIKl9NmXiyKOKsEA=;
        b=itevPDilwuZk9FwyjF5z+V160Wj4S+iiLNXLFxSmA5G7dsSsO2+AxZ+0kq0btzFCuX
         38arPPZu2hKIvJqOv03DbrGCQAmrU8ikkY3FVmKIu9I5ZDPqEg72Degsim1XB5wS0b8j
         76dOyYpFE0TVVdd5UEq+ljQ6CoapGCxQ8MJO4+oVNytb5K04w0VhS2H5y8Z0oku+ausA
         0n3gjbbevUJY2AQdoHTBwHkkSibSwbknYCh7j45QISoFQu4wIFSx4ffhRexEilHCuHR4
         LigR2P13BTHQ5moFgbfVIEWzEm2QIl7l68o151I1ms0IjCnW6RWWwRCvqDUY6BWWKT74
         C6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784904439; x=1785509239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dd5ljADXPcqLcjndY5eXs0DUhwwgIKl9NmXiyKOKsEA=;
        b=JA06O0tzwhVqXHV3v6rCWH5zeA1f4pg0pO7EOOr4hA0j1qGeIl9/WJSRkbuRK5The3
         u+y0QxxsQcUXKbXguwQYjih1brQmbzWMiESWSTrv8PC5ywqV/NmtFrr9PcB9r2roJxji
         PHNpNBYnxZNqEbkiwZiyXEv0J6OQ0iH2xt8rRZuFbV+IYOWpRusEmJCzU1PoVY0SQNJN
         YA0CRGJDwSRtIKXkYVFdWtn0IE++lNNu4kOqfowsdm5jAhVspgOqXmFo/iiAVyYKmu8A
         PPcTcSIFJ6zEnKnCVWgOoLFgHx6C4kxf9QjDmreZtOSCeRx2S6l61AyukikiD1TcRlGu
         l4Yw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5tbIiWzhOQpFrI23wl/RxrZLZ9/hE3YKRKQIECwRQvCJzXgZsh6YUzggl2av9VHJ32aki1lZ5Mmcd@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1vMP7EAEBtV72sPLQ+J6Vp+ll47as3U8A9eVcOWv1t9/VFOT
	v2UgC9EqLshk904FFkzY5esxKV1sqeS/n9A4udSTwCGgD1gCzaWNbDXwhy2SSg==
X-Gm-Gg: AR+sD10HnQ9GFtM7cuToyi9hWY89Rf2ZATjn6bVnL1MYxQRo+5hx024KuLAf+RNXLXq
	Ffrs2LRW992HbyzYWMG3DPXMN0MBxLw4TidB1kvZ7i+pqpwdeCTXHorbgiZCyvAMDsa02+MMKg1
	NGJ+A2DltvyExjVux8fxjDgYd4BYxhGcIXrrRWQ7jluUdlAR0jQhT6kySvH/mCZGq41Q44Onp4v
	yjtnYWr/El8JkxlHA3AFnwQsjHIsEul7Jer1hFvGJmS0cWek1K5aBudRfSu7plbO2VnznjNYiVB
	vOcsN8TPZyigFuMXJHYe7xdUs1/UL/Vn4IP/M9Px7OilFp/Z/qIgdvAa8HQtoOWXKoiKVOJOOUr
	wD0O/Gw0qSF61PIBoKcCf2bG7D0zhT6X2rcYwwoQkOgU/chLy02oKc6f+T6CxZLiKLfs535Fg/h
	QxZEwFrKHVYQ==
X-Received: by 2002:a05:6122:3a12:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c2d9ff4689mr3368040e0c.3.1784904439086;
        Fri, 24 Jul 2026 07:47:19 -0700 (PDT)
Received: from localhost ([2804:30c:90d:6100:8a69:5cf5:f1f8:a1e1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c6276fbfsm9432671e0c.4.2026.07.24.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 07:47:18 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:48:23 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, conor+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v8 3/5] iio: adc: ltc2378: Enable high-speed data capture
Message-ID: <amN7N-U7KCb03sGa@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1784835663.git.marcelo.schmitt@analog.com>
 <c331ad2c4e4162c285a3c6c89798388ad4962036.1784835663.git.marcelo.schmitt@analog.com>
 <20260723201317.B76B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723201317.B76B21F000E9@smtp.kernel.org>

On 07/23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Division by zero vulnerabilities in ltc2378_update_conversion_rate due to unhandled hardware rounding of period/frequency.
> - [Low] Unlocked data race on st->cnv_Hz between read_raw and write_raw.
> --
> 
> --- Patch [3]: [PATCH v8 3/5] iio: adc: ltc2378: Enable high-speed data capture ---
> commit cad96004cef5739b24db063923b36678ea8e3617
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Subject: iio: adc: ltc2378: Enable high-speed data capture
> 
> Make use of SPI transfer offloading to speed up data capture, enabling data
> acquisition at faster sample rates (up to 2 MSPS).
> 
> > diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> > index 107388f870626..7baee02450d39 100644
> > --- a/drivers/iio/adc/ltc2378.c
> > +++ b/drivers/iio/adc/ltc2378.c
> > @@ -264,7 +384,137 @@ static int ltc2378_read_raw(struct iio_dev *indio_dev,
> >  			*val2 = chan->scan_type.realbits;
> >  
> >  		return IIO_VAL_FRACTIONAL_LOG2;
> > +	case IIO_CHAN_INFO_SAMP_FREQ:
> > +		*val = st->cnv_Hz;
> 
> [Severity: Low]
> Does this lockless read of st->cnv_Hz race with concurrent updates?
> 
Not a big deal, IMHO.

> While ltc2378_write_raw() acquires the IIO direct mode lock before calling
> ltc2378_update_conversion_rate() to update st->cnv_Hz, this read path appears
> to access it without synchronization or READ_ONCE()/WRITE_ONCE() macros.
> 
> > +		return IIO_VAL_INT;
> 
> [ ... ]
> 
> > +static int ltc2378_update_conversion_rate(struct ltc2378_state *st, int freq_Hz)
> > +{
> 
> [ ... ]
> 
> > +	/*
> > +	 * Configure SPI offload PWM trigger.
> > +	 * The trigger should fire after tBUSYLH + tCONV + tDSDOBUSYL.
> > +	 * Minimum time needed: TBUSYLH (13ns) + TCONV (part-specific) + TDSDOBUSYL (5ns)
> > +	 *
> > +	 * Use the same period as CNV PWM to avoid timing issues.
> > +	 * Convert back from period to frequency for the SPI offload API.
> > +	 */
> > +	offload_period_ns = cnv_wf.period_length_ns;
> > +	config.periodic.frequency_hz = div_u64(HZ_PER_GHZ, offload_period_ns);
> 
> [Severity: High]
> Can this result in a division by zero if offload_period_ns is 0?
> 
> If pwm_round_waveform_might_sleep() rounds the requested period down to 0,
> offload_period_ns will be 0 and cause a kernel panic here.
> 
> > +	min_read_offset = LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_TDSDOBUSYL_NS;
> 
> [ ... ]
> 
> > +	/* Check the minimum CNV to SCLK delay is met */
> > +	if (config.periodic.offset_ns < min_read_offset)
> > +		return -EDOM;
> > +
> > +	/* Check the PWM periods remain the same */
> > +	offload_period_ns = div64_u64(HZ_PER_GHZ, config.periodic.frequency_hz);
> 
> [Severity: High]
> Does this code panic if config.periodic.frequency_hz evaluates to 0?
> 
> If a user writes a very low sampling frequency, the PWM driver might round
> the hardware period up to a value greater than HZ_PER_GHZ. If
> offload_period_ns > HZ_PER_GHZ, the earlier calculation for
> config.periodic.frequency_hz will evaluate to 0.
> 
> Additionally, if spi_offload_trigger_validate() mutates frequency_hz down
> to 0, it would also result in a division by zero here.
> 
> > +	if (cnv_wf.period_length_ns != offload_period_ns)
> > +		return -EDOM;
> 
Theory already refuted in previous version.
https://lore.kernel.org/linux-iio/alpZwoau3QVPtBsP@debian-BULLSEYE-live-builder-AMD64/
