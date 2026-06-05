Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DAF3E51D3
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659280; cv=none; b=jWKF5VjLDdh8wu9iidyos/a3UObQA5jCuSSO1ax6XfNdWzCNuLXoNt5iU5QYw4fyivfDCCATTToN50ycb3REEE4UCLkaQi59rw1s5ZWR6OTvJ9mYYThZjot39rq6XY8TtT0LGym+2d4XGmRPOlE24LgCql22e1a15SzVnlMWcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659280; c=relaxed/simple;
	bh=RTjhxEGvOy+F+VQ/siDtUUts+dyofnFoSYDC7g4FuG4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFVW1lRWl8CFzfNC3f4HCmBezKeLNQ1IcF/f3Ei47qMcCGQFCLHBJjnelSKeShaUge4zwDEgv7xkDWGVf1VLI2fwGjWlFQRVuSWU88OvnMrvBu8DzyXy6lJsGVU36oJJdkKMbLTfFYXnDGVyhDhVWOh0kD34sJfZna8V+RE+4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wmq3kPUV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wmq3kPUV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1869000f8f.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659277; x=1781264077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJRmfaxPaWcnCvs7QB4gUgP5UAYanEHUPfa/m1ombOs=;
        b=Wmq3kPUV9UQPwUwMfcEXS9nkcfIrne1+VxRzzjUKdhZSQLt92iAY6nYOEznZG/ER34
         DI+Ud3o2CrPMIs80JfWzrStGQL2ggC+z8+t/N0Z9zJtlWanXANkgmfUTohUzM0ZeWDtu
         GlweRSmz9jODSRyF7mOAblmcPhpdIfjohDSeviSD+UKuZ2V1LPE2w7QjwBhhowwetEB0
         LqDEmOuK7vAJdyDpzNLW4ZjT6MX+Ffq5dqimPRyIZQW61NZ0z06mJK/GcMfaDN5mpcJO
         mWKElBxtngM5oQCC8uS34uksuJNFEZ7I6AIRQZnOUN+L2qyOZaeFzBx0bx3cqYg8tiIR
         vkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659277; x=1781264077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJRmfaxPaWcnCvs7QB4gUgP5UAYanEHUPfa/m1ombOs=;
        b=RdK8x6SAxP75NGAJE3g1o4VNFS7QFjyqk/m6A8YWB9ZdYEtz1pnSyXWVN5Nis27QH7
         ifDYCZbby6BEb5amTYOgiwVBosoStHwKjj4+/KhHp9HJyKNGI4HWnhVYGQ4fK46jasO/
         kDNqK7EWMP24a4OpAgw7eOQt1gRJG27gJKaTtKLWww1pjXH4ZT4eHwq3sBNWTvobK6mX
         vxOMfMByrM1BGil5C3QPdtxB0Ch1QUgHEg1QXAifuGw5klR3sgABWUhIIE5KtDY42dfm
         snHdnpr7cg3yhTymU6XdzwWpNWrpFTEF92JxFTW/MqibU7E/6H4L0nYQh5gU9dqc0PCu
         Mdxg==
X-Forwarded-Encrypted: i=1; AFNElJ82zkp/CFCwTiu56qhrz968uybgsYw37cQf3ZmO/CnuUeuxcUZpZY/yOlszHNZggteVQIYOJzPXepaU@vger.kernel.org
X-Gm-Message-State: AOJu0YxsQi3eix7dlDEMWSAaAm3xlvkqmpuMx0aJW4jSFZz6DVL/yTyz
	LqBT/u1QGzTMvDam/l5nvqRWo4gO6L6mWaHWIxDps3DpYUtY8RjKdkQu
X-Gm-Gg: Acq92OG1NEfHQHuRCYrDTi3lbAcCy1R57koh7uM7DZoz3ubn/RGzwhYuEAhetSpviz0
	3imxNi3yhQz1cB7mFlZjtbiUuCf/u5uW6luk99IRDpyCOXQmrP9kzq0/LAiHZxOUIm6l65gZixt
	q3ZDkljUC9Uwui7JGy6XTHgn+yd0Go/RIdkH1M7tY67+evkJnK/XSaqUwHTLgsS7QdjRdcBq83q
	SCeAJnIEQRJSSW3WqicfOoXwxpJoVv5fzkuuIJj0LxXOB3ImQ2pSEzme8EurNUqT26YoKkEslCI
	fb073hwBcVGnC6I6FvhiSmQRXnSj+gJqjAFxihs+MpeHINHv7vB/n1m7KzXMyUNDZEZQb3eeCdf
	bVUoUiEj297+ohR+4o4j0ZppRmvitqP+82S+gnLRbeCXJPc++kLcd/LYi/ViqqwaNqQNH3SZVqA
	KWpL1kz56rTL7ODxGdX/1ducIG96J3mZ0LDZs8ETKkQPfcUxto5z50PwmuDtOnJyZ1wLRm7I+yx
	YoKf+uCNxIVi/n3IfxficbcOQijmjJCLV0+BC8roDzx78RWj4lmtTTptH84
X-Received: by 2002:a05:6000:491a:b0:45e:dc0a:bcb with SMTP id ffacd0b85a97d-46032db42fcmr3878302f8f.22.1780659277189;
        Fri, 05 Jun 2026 04:34:37 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dce6sm17068219f8f.30.2026.06.05.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:36 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 5 Jun 2026 12:34:31 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>, 
	linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 10/12] iio: dac: ad5686: add triggered buffer support
Message-ID: <i3wvatdosla3cszhhtizgoetcbknl56be3mpipzdxqx2jzvch2@l4hzeer5zoa7>
References: <20260602-ad5686-new-features-v1-0-691e01883d27@analog.com>
 <20260602-ad5686-new-features-v1-10-691e01883d27@analog.com>
 <20260603134151.7cf1654b@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603134151.7cf1654b@jic23-huawei>

On 26/06/03 01:41PM, Jonathan Cameron wrote:
> On Tue, 02 Jun 2026 17:33:57 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Implement trigger handler by leveraging the LDAC gpio to update all DAC
> > channels at once when it is available. Also, the multiple channel writes
> > can be flushed at once with the sync() operation.

...

> > +static irqreturn_t ad5686_trigger_handler(int irq, void *p)
> > +{
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	struct iio_buffer *buffer = indio_dev->buffer;
> > +	struct ad5686_state *st = iio_priv(indio_dev);
> > +	u16 val[AD5686_MAX_CHANNELS] = { };
> > +	int ret, ch, i = 0;
> > +	bool async_update;
> > +	u8 cmd;
> > +
> > +	ret = iio_pop_from_buffer(buffer, val);
> > +	if (ret)
> > +		goto out;
> > +
> > +	mutex_lock(&st->lock);
> > +
> > +	async_update = st->ldac_gpio && bitmap_weight(indio_dev->active_scan_mask,
> > +						      iio_get_masklength(indio_dev)) > 1;
> > +	if (async_update) {
> > +		/* use ldac to update all channels simultaneously */
> > +		cmd = AD5686_CMD_WRITE_INPUT_N;
> > +		gpiod_set_value_cansleep(st->ldac_gpio, 0);
> > +	} else {
> > +		cmd = AD5686_CMD_WRITE_INPUT_N_UPDATE_N;
> > +	}
> > +
> > +	iio_for_each_active_channel(indio_dev, ch) {
> > +		ret = st->ops->write(st, cmd, indio_dev->channels[ch].address, val[i++]);
> > +		if (ret)
> > +			goto cleanup;
> > +	}
> > +
> > +	if (st->ops->sync)
> > +		ret = st->ops->sync(st); /* flush all pending transfers */
> > +
> > +cleanup:

It turns out that this label is not really needed. When sync() op is available
it must be called regardless of write failure, so the bus data can reset its
state. Then moving "cleanup" up would just make it useless.

> > +	if (async_update)
> 
> Error paths are always fun.  Do we care about setting ldac_gpio to 1 if
> we failed to write the channel values?  That will set any that did successfully
> update, but not all of them.  Note I'm not sure on the right answer for this.
> There may not be one!

I would not see a problem with that, as there is no much we can do with errors
in a interrupt handler.

> 
> > +		gpiod_set_value_cansleep(st->ldac_gpio, 1);
> > +
> > +	mutex_unlock(&st->lock);
> > +out:
> > +	iio_trigger_notify_done(indio_dev->trig);
> We get this pattern so often (though not always).  Feels like maybe
> we should put some effort into a generic opt in solution for this.
> 
> A job for another day but options that come to mind.
> 1) (hideous) a flag
> 2) Maybe an alternative callback. thread_always_complete or
>    something like that.  Pain to wire through all the calls though
>    and injecting the necessary wrapper isn't great either.
>    Implementation wise would be a case of popping in a wrapper function
>    in iio_trigger_attach_poll() call to request_threaded_irq().
> 3) Maybe a helper macro?  Bit ugly as we'd need one to generate
>    the wrapper function and another to use the same name for
>    the registration function.
> 
> Hmm. Those are all ugly (maybe 2 is ok ish).  Suggestions welcome!

using a cleanup.h? with something like:

	static inline void iio_trigger_always_done(struct iio_poll_func **ppf)
	{
		iio_trigger_notify_done((*ppf)->indio_dev->trig);
	}

	static irqreturn_t ad5686_trigger_handler(int irq, void *p)
	{
		struct iio_poll_func *pf __cleanup(iio_trigger_always_done) = p;
		/* ... */

		ret = iio_pop_from_buffer(buffer, val);
		if (ret)
			return IRQ_HANDLED;

		/* ... */

		return IRQ_HANDLED;
	}

> 
> > +
> > +	return IRQ_HANDLED;
> > +}

-- 
Kind regards,

Rodrigo Alencar
