Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE0397B1C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879203; cv=none; b=rMvJ5IXxj+MloP32xQBkpRYm9gKhlGdh60v6GO6x3ucGqyWdHJWKorkJ9o/sSgA7GSbfA5+7+4O0autKtzcQtflFItTvU6wOUdWvuvf2mcFH35t5ra0JaB8mIR9cNuyJmbvqKwDg2YVhRnbUfMuH4oRy4AYhRQaOvLzTPFbXFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879203; c=relaxed/simple;
	bh=qcaWSGPvUy2u54fK8ZwK+zHysS4I1DayUEvb7c8WnWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvN7RfiLugEeh46+jd2SeD3Qj2zey37WH/bo0ndpXnbeUpffSpzUYoi+KSbVUFt8s41fpmTvTwSO7Kxvwnk9GqJ89K87CifBf3QJb2U03CfTXk3Q55ipRJj4CTaB1wzX8wSLPYJEJ57M+K6CmJjLMC3sKnT5YkL74GpAy65+mrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMhxd+f3; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMhxd+f3"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30c001b21feso1573564eec.1
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781879199; x=1782483999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+NOFvW+oVtBVeLrjfLCqJyDxKh0T7V/dXs1RZ3OhYY=;
        b=CMhxd+f3T0sWeh9EFmuzHt8LoaghepR4KFKr2Ncf/DNX5y8U/5g38b4OT/7wE+5Cd3
         QI+dmyU1jbkSn6O88YOitKwit3n5+0Bd6EJ6R11L2kQIaozFeJolTlJSF9rpY3cJjljR
         sA4SkXUOhbgdyY1616RXyuQGnFWwyL1E+enN7Sht+SFIpAusfH62L/wx9vSb1WUFUcDS
         +NKca1BJ7ltroUSjJ00JEDgNC3RBz0EopG27HcPYihe7sdIjYdRppw+gkS3RySSfFy0C
         AYO5JUZwi5coDqm72KEB3nJ7u2FHFWnsbztvDDi0U31ndj8cXu5NC3WphOnYDwtTP3hh
         NFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781879199; x=1782483999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+NOFvW+oVtBVeLrjfLCqJyDxKh0T7V/dXs1RZ3OhYY=;
        b=MKTssalOiVPZ6r5mV1qFbeoYP0P8jnPnpxj7E+jRr1QspcwnqoImhw6rWobhWL9t0Q
         9RuYyXrE4aBL2BSa7BtfEwHj+BvtLQe/EFFVIu4Qhl3rCoPEPV7Ifdc922ofmZUMzYZN
         f9NoTHYFOM8cs/UHL+enMQ8J1VvSkSQwsqdg9Qfz+l0jUensZPYwlCO0QbEzDnnginzD
         edBVQBDu3yGNkgiFLYAnGhdH4XgrkuD91o11O7js33ks9plXZinLKE19xdfw4cObR4+Y
         QRDsFUGIR+YDOxINb/7SB8E3JUxcjP5UHKC3H++wABCrhjpDk4COuHuH+uRQEfE0CafK
         xTAA==
X-Forwarded-Encrypted: i=1; AFNElJ9FYIsLN1AWE5guC2+nnF1tXWLmsSa0CDwTy2TmvR/V+UFJO5g/QcnB5P9mPA5Zp4Ew1yA9lFPpRSe1@vger.kernel.org
X-Gm-Message-State: AOJu0YwH4o0+Kvw4enOSjs8PyeNaH1hUUMqwUP4sAv+OMW/RnouhFv8U
	j/bTP5DwtPj4iT3xcx6tfgc6KsYK4356tCDBwK+bY0FSCOVEOLicvfkD
X-Gm-Gg: AfdE7cmLPIZJE9L4A9RQhZ1Y6JhORrw/HKL7pghZsVMtKwQ3XVRnQuQLTJC19B0w7X7
	8tewQpKCmvHpXWD0SLRXQbq7ftvGwaEXWf0hMEbM8tGl31gAnGUjb3oE3zCQ3Rq43vwWn0RH0+c
	EKVNUbZfhlUQvFBg4ZFv5vsYebv2b9LUzIw5jKxser5YTLPKeIslNSYkZ622+mBk3Xe/XvaVxFW
	jU9OjWmcBUOV6/P3nVvxE4U8cPmo0Q30xeLHC88GAJUFaBOjt6iBFOoHp5xHeVkaueOF2g7wM7K
	BfuJ1D41foLfU4Np9VZdIeUeoVU2llWJPWJTfj72pquSvscwXSzilsecR1+5eAFeWoTAtfY1ssQ
	1cSSn1+oyYpWJkeXlhRX75CF+ecHzul1KHCjOSHKKrPf1fFDUlb+2ph6ReFw2008az6R4NTctIB
	JEH0uQL+zg6Ek0kt6vfQ+LAw==
X-Received: by 2002:a05:7300:6c9f:b0:2ea:c085:44b1 with SMTP id 5a478bee46e88-30c071533c3mr2469687eec.19.1781879199101;
        Fri, 19 Jun 2026 07:26:39 -0700 (PDT)
Received: from localhost ([2804:30c:1f0a:b600:e457:1a16:4082:3e0a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f137sm1470eec.1.2026.06.19.07.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:26:38 -0700 (PDT)
Date: Fri, 19 Jun 2026 11:27:16 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pop.ioan-daniel@analog.com
Subject: Re: [PATCH v3 5/5] iio: adc: ltc2378: Enable triggered buffer data
 capture
Message-ID: <ajVRxCPejqxlo_Z4@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <22248e8ba646fbe8edfc87e2b9be527632d5b48c.1781661028.git.marcelo.schmitt@analog.com>
 <4f7f50ad-c305-4947-b4e9-3666a4f31031@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f7f50ad-c305-4947-b4e9-3666a4f31031@baylibre.com>

On 06/17, David Lechner wrote:
> On 6/16/26 9:04 PM, Marcelo Schmitt wrote:
> > Enable users to run triggered data captures with LTC2378 and similar ADCs.
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
...
> > @@ -27,6 +27,21 @@ int ltc2378_lib_buffer_setup(struct iio_dev *indio_dev, struct ltc2378_state *st
> >  		return dev_err_probe(dev, ret, "error on SPI offload setup\n");
> >  
> >  	return 0;
> > +
> > +trigger_buf_setup:
> > +	ret = __ltc2378_set_triggered_buf_ops(st);
> > +	if (ret == -EOPNOTSUPP)
> > +		return 0; /* Let device setup complete without buffer support */
> > +
> > +	if (!ret)
> > +		ret = st->ops->buffer_setup(indio_dev, st);
> > +
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "error on buffer setup\n");
> 
> This is repeating the code above. Seems like it would be better without
> the goto.
Ack

> 
> > +
> > +	st->chans[st->num_iio_chans++] = IIO_CHAN_SOFT_TIMESTAMP(1);
> 
> Adding a channel here seems messy. I still think static const channel
> data would be better. But at least would be better if this was moved
> to the same function as the other channel setup.
> 
Agree, will think of a better place to init the timestamp channel while
switching to static const channel.

> > +
> > +	return 0;
> >  }
...
> > +static irqreturn_t ltc2378_trigger_handler(int irq, void *p)
> > +{
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	struct ltc2378_state *st = iio_priv(indio_dev);
> > +	int ret;
> > +
> > +	ret = ltc2378_convert_and_acquire(st);
> > +	if (ret < 0)
> > +		goto err_out;
> 
> As mentioned elsewhere, SPI xfer size may be 2 or 4 bytes, but
> we are always pushing 4 bytes, so this only works on little-endian
> architecture.
> 
> I think best would be to have storagesize = 16 when appropriate to
> avoid having to manually handle this.
> 
Okay, it will probably be easier to do that with static const channels.
Am checking out other sashiko comments as well.

> > +
> > +	iio_push_to_buffers_with_ts(indio_dev, &st->scan, sizeof(st->scan),
> > +				    pf->timestamp);
> > +
> > +err_out:
> > +	iio_trigger_notify_done(indio_dev->trig);
> > +	return IRQ_HANDLED;
> > +}
> > +
> 
Thanks,
Marcelo
