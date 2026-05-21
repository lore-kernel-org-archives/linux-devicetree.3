Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CABD3D79E1
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371320; cv=none; b=NujuPK0yyJQ7nRoU/nmKoCfYD2KLDOBTFJzuYG6jQnlDT+yalELNsdkIOWQrpsS4yGYZip/kbXitBZFVWvImPfi30Xer3usitaqX6/+Az4LZEdF0Rbfm/ANFrZpRlSjAkJxMp9sZhdUl4O1sISujRp339ppun/FBsSz01J0rwLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371320; c=relaxed/simple;
	bh=XeEOKxqcNhrXKitEzKsGvJcSYxxb2/NE5qqflkYV41o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYKgw0dBVJSduBtAHjpOqheIuTPKeZ5e7u/YFFkzrIWALjdmky8CqPFNKjLKe7Pe1wZtYYAJeezB2PPp7ji3Fhmchz5btHYNPTa5sSte7ZQjCN1YQFMQDE5PPrZEGl6QavvWf44inuF/mzUCI70CkuLVeF3QeFfJiySAiKi0Zik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdz5zDEu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdz5zDEu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903974854dso6498985e9.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779371316; x=1779976116; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52jcbEZbjO5t07+/FFl717hGmuxoIXJoziT8EaSDvxo=;
        b=jdz5zDEunt/aeUwJJTeTTDNu9dUz/LoYm3xPBMhX5qmJDtfsnbdGZaUf8T7e+oH8QI
         x1c/0th6WyOanLc736Quou3nAPCHy7T4lPaYdkPkneeMuPaU8KbGCPHYDPc3LCqljZO3
         aLMP8lglEB2DjefJl+TBdmdZdtCKyOo5YiV3XDVkrlLHs1dYmxx3H6ASe85OfC9vejF/
         pWVTc+Z8yppFPz5Uyr2+Dw2irUiguj8j7OQnV72xFRc4khUnLNumJzEa6i//ZFCQCZwD
         cAZfCg48mUjFY2UR6keKGhjzx/3tOOAF/VcZ15gzRuEs/B5Pig06/2A0xcNiwuHhoXja
         frUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779371316; x=1779976116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52jcbEZbjO5t07+/FFl717hGmuxoIXJoziT8EaSDvxo=;
        b=O+l6uw03/R10UgXvFl6jECcmoHyIIk91+DWdVaDxn31ZgYmS5YxSHwx2K85nQyh6yH
         /H2u40ksa/xgTj+RhY+X7vR1JF/rxNLVFkA9lHhMkaGODtCRRKRxEwm7uU9o4FMWFkz/
         /liZzYloodtKeLhm24L1uFsgYP6tNc/Bk/w2Of5Q8e4d+qZ+GpRLtppQoEaxqykj2VU4
         qYvUgB1rkLc3WTIZ10HLgmRAp9BLsNj+FkM3OyBnDvSXzIUd85k6oiwa8j/oR5uR71lY
         XRkyPyuAUYgWNyO916IvWNH8e30wYQpYOn807g5wh+XUvu6PAptIQx4qatd7vPsGTEE0
         4ttQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xNNtpebLozaohQ9xlWAE/Zv4+EAQIaypA7dJV5A2a5Rd9AzODxM4X9OzZrDXEY5mt6cwfc8WHu/z9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQFSF9sNwocWLFVgS9GXYEfgq1S4dajosyIwPDgiGTz5G8cDdM
	2PQpkLzgxKUYQiaeeQk8Zq7oLadBvHFi9znofNkKPYarcGRwaGRMHGnU
X-Gm-Gg: Acq92OHpG3lBskHMIXcaAlHXOni8ZThKV94p5qHaMQ5A46zGodVB79IeDet4Q1TCwuK
	+hVE/2mpfOAojdeII4335m9Nhou5qwh/gzVwQzp5dwkU28LvZYpHjuty3V69moJFFnuerrkmN0y
	5qciXnKZr31BLtqWnJQ2Xtej8yUYb8qo22UDTjP1FY/sP/YjfMGNf4n2romkiN1vHp0iE+h1vST
	WmFZnozVAoSuJb8FBl+GFLWbR1n1+b6JMO+49sxjiYr0WlPebpIcZJBy8uvYrkGlcczJR14gQ5M
	alxeuzblJYFdTDmIbbQ+ulMBBVFavdls7/lEqMVgxyHM3YvaLlAUlpqH14/fpXlMh7iKiEVkp+a
	eIet8G8i2055HPlyT8x0fofdqwscq/8dse9OQz/Envq446/8W7t7n8T297VhxcwSBp1xNM8KteO
	73xL6X0a/5TKFTWU0zxPtkuoi5/FpSWfrbTQZzeofBScZoqFnQZPITNHvnfCz3P9NaF8AmYt7ud
	sUO/Ny070KWDHYPWU2EAfRtJU1bL6AH2oV13xcFlSxHOcBHFy38kD/ZfWcs
X-Received: by 2002:a05:600c:5298:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-49036034241mr45116035e9.7.1779371316202;
        Thu, 21 May 2026 06:48:36 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c22d97sm16292635e9.1.2026.05.21.06.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:48:35 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Thu, 21 May 2026 14:48:30 +0100
To: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v5 03/13] iio: core: add hierarchical channel
 relationships
Message-ID: <hjv4uuudhkueaotpyuzj3u3jg2rkr73jmrx2vxi37w3po5xk5x@3fhfebj6a3wt>
References: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
 <20260517-ad9910-iio-driver-v5-3-31599c88314a@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517-ad9910-iio-driver-v5-3-31599c88314a@analog.com>

On 26/05/18 03:26PM, Rodrigo Alencar wrote:
> On 26/05/17 06:56PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Exposing the hierarchical relationship via channel labels creates an ambiguous UAPI for userspace.
> > --
> > 
> > commit 64c6f961f1d7645c58f732e4bd4c11200b999e93
> > Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > iio: core: add hierarchical channel relationships
> > 
> > This commit introduces a parent-child relationship between IIO channels.
> > It adds a parent pointer to the iio_chan_spec struct and exposes this
> > relationship to userspace through a new "parent" sysfs attribute that
> > returns the parent channel's label.
> > 
> > > diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> > > index 5c8404efd0a56..348ac7a597385 100644
> > > --- a/drivers/iio/industrialio-core.c
> > > +++ b/drivers/iio/industrialio-core.c
> > 
> > [ ... ]
> > 
> > > @@ -1263,6 +1271,31 @@ static int iio_device_add_channel_label(struct iio_dev *indio_dev,
> > >  	return 1;
> > >  }
> > >  
> > > +static int iio_device_add_channel_parent(struct iio_dev *indio_dev,
> > > +					 struct iio_chan_spec const *chan)
> > > +{
> > > +	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
> > > +	int ret;
> > > +
> > > +	if (!chan->parent || (!indio_dev->info->read_label &&
> > > +			      !chan->parent->extend_name))
> > > +		return 0;
> > 
> > Is relying on channel labels robust enough for programmatic parent resolution?
> > 
> > IIO channel labels are optional, human-readable descriptors and are not
> > guaranteed by the core to be unique. If multiple channels within a device
> > share the same label, how can userspace definitively resolve which specific
> > channel is the parent?
> > 
> > Also, if a driver establishes a hierarchy where chan->parent is set, but the
> > parent channel lacks a label, this attribute is silently omitted, hiding the
> > relationship entirely.
> > 
> > Would it be more reliable to expose a definitive, unique identifier (such as
> > the parent channel's sysfs prefix or index) rather than relying on an optional
> > descriptive string?
> 
> A bit impressive that sashiko can comment on that architecture level.
> 
> Those are all good points. I suppose I went for this because otherwise it would
> require refactoring core code to get the needed parts from __iio_device_attr_init()
> that gets you the channel name without the attribute part.
> 
> Maybe we should have a function that outputs a channel name into a buffer based on
> __iio_device_attr_init() behavior, and that could be reused.

This is the function with behavior extracted from __iio_device_attr_init():

	static int __iio_chan_prefix_emit(const struct iio_chan_spec *chan,
					  enum iio_shared_by shared_by,
					  char *buf, size_t len)
	{
		const char *dir = iio_direction[chan->output];
		const char *type = iio_chan_type_name_spec[chan->type];
		int n = 0;

		switch (shared_by) {
		case IIO_SHARED_BY_ALL:
			break;
		case IIO_SHARED_BY_DIR:
			n = scnprintf(buf, len, "%s", dir);
			break;
		case IIO_SHARED_BY_TYPE:
			n = scnprintf(buf, len, "%s_%s", dir, type);
			if (chan->differential)
				n += scnprintf(buf + n, len - n, "-%s", type);
			break;
		case IIO_SEPARATE:
			if (chan->indexed) {
				n = scnprintf(buf, len, "%s_%s%d", dir, type,
					      chan->channel);
				if (chan->differential)
					n += scnprintf(buf + n, len - n, "-%s%d", type,
						       chan->channel2);
			} else {
				if (chan->differential) {
					WARN(1, "Differential channels must be indexed\n");
					return -EINVAL;
				}
				n = scnprintf(buf, len, "%s_%s", dir, type);
			}

			if (chan->modified) {
				if (chan->differential) {
					WARN(1, "Differential channels can not have modifier\n");
					return -EINVAL;
				}
				n += scnprintf(buf + n, len - n, "_%s",
					       iio_modifier_names[chan->channel2]);
			}

			if (chan->extend_name)
				n += scnprintf(buf + n, len - n, "_%s", chan->extend_name);
			break;
		}

		return n;
	}

I think it is clear and reusable.

> > > +
> > > +	ret = __iio_add_chan_devattr("parent",
> > > +				     chan,
> > > +				     &iio_read_channel_parent,
> > > +				     NULL,
> > > +				     0,
> > > +				     IIO_SEPARATE,
> > > +				     &indio_dev->dev,
> > > +				     NULL,
> > > +				     &iio_dev_opaque->channel_attr_list);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return 1;
> > > +}
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com?part=3

-- 
Kind regards,

Rodrigo Alencar
