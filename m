Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441542;
	b=ZRJ2maAO1SheBeLBf/yMDxBFkCWogZe2hgKeVa/aqoUF0mdMbNYQOgMB4WEqm2ONrbFb
	 P9eik/UwEHxOTFciGyf2oUCa6XYLqkGb4WgxxGGD8uNvAP2MFxLLyTlEWaxq2Bnd9exFZ
	 USo9QoboqYSMmBSK50mczaPOu8ZeP6qn3EcEow9v+Tzv8IWHsvytzZ1tzEziopDmWGktW
	 JV71NqSdruq553el2egwHE6JnK6L0X3r+2ygbUeD1NmY4ULoJLHtdD19OIu53D66BmKbK
	 I2x4zq69ENeScvYoJVelKB1uw6v7qHRyScW9P5ZPWUc779boOcc+PbOofI5aWLTWxAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4CLm7A+8SN3dP9H9Mvo0nl4IugDxpC2FOKJG/azirs8=;
	b=OoHQYgO1RJvJiT2KRQW11ZQHRboUjKCWtaoUO0/49LSpv57rbOVK/vAeocz9NPNVGRe7
	 mTMg3rp8H4rkAKpfV6VG/d38SRyWgWh19VGAeGbqQA1D/1HvCI6HUGNJt1kTavAj+96aq
	 TjN/1qGFjKX1NIEhSU0lfMBTF/hZGu9oZSC44Y57B/SeLeOBXBaelsfWnZIDLmniTXF2B
	 Tk1zFn0wFu+B7JsX/eTlDmCezymX4JvLE0Z4QGhBYgqPkyPl9KXSgjkVSPvbDx0OjNQHu
	 mcpwHjECz1oN0K8jCpaq41kLT8eMDyP98+Qd5KIFhyq09QMn5hw9XWlM9kWVyp2Dnlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gy+KoPx4;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31961606A322
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 20:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31961606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gy+KoPx4
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1880945e0c.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441541; x=1793046341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4CLm7A+8SN3dP9H9Mvo0nl4IugDxpC2FOKJG/azirs8=;
        b=Gy+KoPx4G2FFUdo1www7Snk9hT07C1qiZ9AooZMC8xWJE5vRvVg6Cu7gkXju03RBpt
         4qGGrrzZXhFlbmXH3wqdO+551iMzjGefOoD6M84fd6Th+y3xQQOcAK4o/HzLv5gy+k+X
         Q2AX+SaXfk0+aJLfCV+AHNH/jPfFZyWx/LV4JiRWOzFT6Gc32TpZ9mZ78JzXztsC/kgc
         yo+gfNgYiHHJUdGcqPGqOlhlyaNqAirqFaiVAWTxc1MFXSzC5Z2Fjxta1bYRq62GVxSp
         cKHrf/LJMt/BEcJJsr4UKVAYDZBiB2Bk1Nypc9+uZQZ8MBEQvLzJwNlQyFyFAQtdD3K/
         pXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441541; x=1793046341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CLm7A+8SN3dP9H9Mvo0nl4IugDxpC2FOKJG/azirs8=;
        b=12r2UZdkxowGo9Kb42jcRDBlVN+jNtThrcm4CMv7hQw+rm+YNDVuP49D+nLDnma0ib
         EUrQ88uOpB4i21Z1IAh0P4WxcuEQSHzh5yIwZ+m5FafqyTlKKQLFdLmdsvAIBUTegDWj
         yJlG0vBh4DD0cupha8OAOS/ZvyQdaN4EpmDv6tWueiTO04Ifor72kEjUy3tUwW0sk+B8
         gK5VVHGsP/GrEkN9c8/syUAwlnQdZd0CKplTnZWzVPB3Zew4GUxsW5+NSoAy/iRX3Yim
         3EV6gNPevUKp4+Pyg8z2TcA7cPfjtUL42CiifVHVdnY9VI113hwA1PAL/o6WJK49Yy+C
         AoRQ==
X-Forwarded-Encrypted: i=1; AKwUvBysBYeM+hIdXdeyHqW3BMIZA8lFavHBHEFnTJKECyzg0UXFPVy6MsPokZty8NDqoPmjp5tJq7O3T34S@vger.kernel.org
X-Gm-Message-State: AFq9FYJhEMjRxu1N2A/bgMFA5BV72YUGZf+XHjcyYlBlB8gVkzR90M19
	Ne57pNo6gELOgpLQGveP0x84Z2p+9a5/05dNgP7ZFXcK20hwAcFxw1rt
X-Gm-Gg: AYBFou0OjSTNR95dAfVc+C9b9axJ4/Om/ucLDKf7om7TS7v2Q3OTesY/hlhHJhPG0Z4
	QxXtNKyHf6PcVH8ZxS9V99clLfW8aYg6p/y49Eae7/QqT8vvVoImqwXJrqsioo7F9QJ87t/LFQK
	SxYuMYnjknMyp9DHW5RhuiZ5S4q/tDKaFSZ0Zn8SwknymwWvKXhfKkZQkE+MMTnzPli6VtJaB/i
	11z/3KOps0eEKRuZH64mdj2/IhaK94mDO/HnKjXoMOxLuXmcPfuQs8jvH7nbTNU0licMCDyzg3d
	vc7yykXttMC1Tl5V80HRX5g1UU8Vm9VQwCckeb3IN4P68HJpsZMyTZf7Cko0oxbyXlUJ48AccOm
	WU7MMbTJH71CIpGIWoTlMj0GLFVq7YSpumospKSj709kVAY3VuFnCkNGqYoLcwHo29ZvAMjv17V
	Ap+fit+6fdO6JSDPfn7Syf5X460xbF4HVIcR14VHhBZjEaGdX4W9m9n1toy4+wUgkLz0WdunkZ0
	MRDaA==
X-Received: by 2002:a05:6122:2093:b0:5ea:c45f:6c4d with SMTP id 71dfb90a1353d-5eac45f78ebmr1323912e0c.22.1792441541185;
        Mon, 19 Oct 2026 13:25:41 -0700 (PDT)
Received: from localhost ([2804:30c:4067:b00:a68b:4892:7af1:b51d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm10865354e0c.13.2026.10.19.13.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:25:40 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:26:43 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@analog.com, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Subject: Re: [PATCH v5 03/15] iio: adc: ad4134: Apply reset recovery wait time
Message-ID: <atZ9A4IocEYpZ24f@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
 <20261017075513.3a959a6a@systembl0wer>
 <20261017201331.5d835dc4@jic23-hlaptop>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017201331.5d835dc4@jic23-hlaptop>

On 10/17, Jonathan Cameron wrote:
> On Sat, 17 Oct 2026 07:55:13 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> 
> > On Fri, 16 Oct 2026 22:57:08 -0300
> > Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> > 
> > > Add a reset recovery wait time to avoid any SPI transfer from running too
> > > soon during device probe.
> > > 
> > > Fixes: e0bc6d7e2584 ("iio: adc: Initial support for AD4134")
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > > New patch in v5.
> > > 
> > >  drivers/iio/adc/ad4134.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> > > index 40b27b01f126..d555874b4959 100644
> > > --- a/drivers/iio/adc/ad4134.c
> > > +++ b/drivers/iio/adc/ad4134.c
> > > @@ -442,6 +442,7 @@ static int ad4134_probe(struct spi_device *spi)
> > >  		return dev_err_probe(dev, PTR_ERR(rst),
> > >  				     "failed to get and deassert reset\n");
> > >  
> > > +	fsleep(AD4134_RESET_TIME_US);
> 
> Sashiko calls out that this is currently 10 seconds, which seems unlikely!

It was actually correct. AD4134_RESET_TIME_US was misset. Fixed that for v6.
