Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9953E7BB7
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114388; cv=none; b=eCFEtYYjgD4LDYObT5i3xyo+JE8SHXTKxlkq8FcsKA2pMV4OUoJGgLFB7WlCZ3IyXVXkekEEjCCQZY3v9KUKiXsI54xP0Woyk0m/m5MIOB+tsGthBHsIFnL9yz/o6Zaw2X87MQ7dWRplKjopRTPU6viYyVhOpCnQWdgKRPMRchY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114388; c=relaxed/simple;
	bh=jj8C42vP8d402qhEj5BRNKUYabfpNU3fCaowD0OVNto=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mkk32WcC5Bl3qwgON/olADdqxUreKUgKOhjomb5YzJUVXDQRkrPqRj3mymhsGobjeIeUACQXSx34D48roShu1gny9dhlT539eNpsP4xvGn96LIoBT/guBT7HcWC8STaAHeDVzaknl4llwC2a8vlbHrpwRMoozFsP8wfljngMDGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvAEqn/E; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvAEqn/E"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358bc9c50so372336966b.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114382; x=1779719182; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkhDiryJOpnQp+hMnQvA4acbZ3NW2ct6Ye+UJkfo1fw=;
        b=kvAEqn/EGte5BsftZMQtIevhSTjN/lg4par430Dh0RjjanumMwpUMElyCf37+/Gdh6
         Ba40klxUvrSjJOCn+yRJMbG4OZ8Y/hpmuifn1lI0/peZ92/1+PP4wC0KmDiWwSLi7isY
         HN2Fi2qwPisfGHcPCSnlaWMxAiQtMnEWe00qVfAFLnp6dLV5Z/04K8NuztTR+EFuHrgn
         iEZc4eYVpOqrSNSsfSndEq2tCxy/Fb4KCwASLG1wE8NOkHjo/eqATGcsnBaKZ3Mo/BIO
         Rp5UWskfLhDtb089YxR2z54Z4xUFMMZcSByV9O5wmffnNXg4ppZs2CXttdONEHx/dTze
         HxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114382; x=1779719182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkhDiryJOpnQp+hMnQvA4acbZ3NW2ct6Ye+UJkfo1fw=;
        b=l+tDArXegtadR0XASKFc3xH3fKXcxaWUgpFyqr4UjJ4lr+N+GEkseveGyCSHCTtGxS
         wJMoEw+NHyMA5s1CYyi/bESEkSt15DNSOS0iUb14lW0836eiXthV4uYo5s93/S5BfIe8
         pwbrN7/Cx1dHW+FIqQD9EWJlPOJFgL0Cth7lYTXJIU9MXANoZCMDaexur4syGFEjK9wa
         41x5ZUFKQaJGraDFPJkwwn0qxu6yYKDWxhB1tPD+VAfIST48hZhaZ4/Gza0pLRS8ixT8
         XFEi8HUSLlw/kNVwGhEMYOzDmq8qRVcM0dowyLwE1nPJSzrOGbqs6KbNeWFxZ6h+vjmP
         jxSg==
X-Gm-Message-State: AOJu0YznlknHTEoZJrgGYbbn9dtdXPJ9UsnPre4wBAtZwbbtdo8YiMrv
	2ouG8mAilRDbQmmLMs6XVSNaBj38LeMozz4vQJV4DjofdQCkzNQKKABcVzSOsxJW
X-Gm-Gg: Acq92OGU/L5UWWFNhAnfChmD4ih6zbpZmYXmMd+O0gZ90eRMH5uR9oTPdWw3eciQkyj
	FheQSlKkOTHekuOxay6OwTzuSi8lHO9xysK0QrDHJSyajGKsgEefayoTf+JfsSWpGUP6hxs6H+F
	AgBsHYsfXX3ppZGfOfV87Oae0Q0edRDs0C/hIlOS7F5/SgRSwAOl1905UUVuqgnpCWGe8xBgBs0
	yy4TeY8/Y8GUyxw3UVfC3Sss+T/GaPf+YesbCPXk3DR9+ZhP5+yPDV61FZwDQ5U/TYAyeWb/6Ps
	kGt2sJ9jEZOjzPoCLYuJMv39M/ZAjx3lEUkU9XdvA/6w+Rem9EFW9SuvRlbFUIr6XUbF2x9tf/t
	TbH4p30X2OvgkdBkb8hKIMXVCoilZ8zZ2oK8oHsIH+MqqjvvQkpyh7pZaWIDS7uOBYWmLcAkcxL
	jKbusG5OfU6iaf6x9foVR0GDRF+xwfCJS68wEYpk2ApUy9MB2WsYw/713AA9pujaUE+5EZr7VCA
	uCAGdrnaVwekaYZrdGw1vjGf0NEnRrP8Gqi7W6p5UaHjqmhfUM3XLQ3+DVkkd4k1MUdZ0w=
X-Received: by 2002:a17:907:9705:b0:bd5:9a2:6c7d with SMTP id a640c23a62f3a-bd5177d6672mr847883566b.4.1779114382418;
        Mon, 18 May 2026 07:26:22 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm2764498a12.18.2026.05.18.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:26:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 18 May 2026 15:26:15 +0100
To: sashiko-reviews@lists.linux.dev, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 03/13] iio: core: add hierarchical channel
 relationships
Message-ID: <vlasqyhpdcxtdw7isyapmpxaqw6wwpni3el2jzckfh22i6bgiy@7ikszah6elga>
References: <20260517-ad9910-iio-driver-v5-3-31599c88314a@analog.com>
 <20260517185618.4810EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517185618.4810EC2BCB0@smtp.kernel.org>

On 26/05/17 06:56PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Exposing the hierarchical relationship via channel labels creates an ambiguous UAPI for userspace.
> --
> 
> commit 64c6f961f1d7645c58f732e4bd4c11200b999e93
> Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> iio: core: add hierarchical channel relationships
> 
> This commit introduces a parent-child relationship between IIO channels.
> It adds a parent pointer to the iio_chan_spec struct and exposes this
> relationship to userspace through a new "parent" sysfs attribute that
> returns the parent channel's label.
> 
> > diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> > index 5c8404efd0a56..348ac7a597385 100644
> > --- a/drivers/iio/industrialio-core.c
> > +++ b/drivers/iio/industrialio-core.c
> 
> [ ... ]
> 
> > @@ -1263,6 +1271,31 @@ static int iio_device_add_channel_label(struct iio_dev *indio_dev,
> >  	return 1;
> >  }
> >  
> > +static int iio_device_add_channel_parent(struct iio_dev *indio_dev,
> > +					 struct iio_chan_spec const *chan)
> > +{
> > +	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
> > +	int ret;
> > +
> > +	if (!chan->parent || (!indio_dev->info->read_label &&
> > +			      !chan->parent->extend_name))
> > +		return 0;
> 
> Is relying on channel labels robust enough for programmatic parent resolution?
> 
> IIO channel labels are optional, human-readable descriptors and are not
> guaranteed by the core to be unique. If multiple channels within a device
> share the same label, how can userspace definitively resolve which specific
> channel is the parent?
> 
> Also, if a driver establishes a hierarchy where chan->parent is set, but the
> parent channel lacks a label, this attribute is silently omitted, hiding the
> relationship entirely.
> 
> Would it be more reliable to expose a definitive, unique identifier (such as
> the parent channel's sysfs prefix or index) rather than relying on an optional
> descriptive string?

A bit impressive that sashiko can comment on that architecture level.

Those are all good points. I suppose I went for this because otherwise it would
require refactoring core code to get the needed parts from __iio_device_attr_init()
that gets you the channel name without the attribute part.

Maybe we should have a function that outputs a channel name into a buffer based on
__iio_device_attr_init() behavior, and that could be reused.

> > +
> > +	ret = __iio_add_chan_devattr("parent",
> > +				     chan,
> > +				     &iio_read_channel_parent,
> > +				     NULL,
> > +				     0,
> > +				     IIO_SEPARATE,
> > +				     &indio_dev->dev,
> > +				     NULL,
> > +				     &iio_dev_opaque->channel_attr_list);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 1;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com?part=3

-- 
Kind regards,

Rodrigo Alencar
