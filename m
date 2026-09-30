Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708E15172CF
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787613; cv=pass; b=q/xybYl9Me+iq666dHK1gUGmNAabKkIXeKjd6BYONtgSDHX6icbMXVooRItNyAf7S8lzZ5PPrjicRTawyMKnFNeR4yzNaeVFCslTP21Swp3Bg0sxsZYVVzo1urXf7OUSI6uTYQivX6HnqlUtofDIkkFTYRcIEG/VvwSMTFIlJSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787613; c=relaxed/simple;
	bh=YwFLKTRtD485E9tMKuK2u3mAFkxgr0aAxTDkVA98D4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1dIRjj6i06tT8qbaP2xq2NSdu5GJ46IzSDDKhqnXi/8mO/7AVxplUw3V9RlotPui3YyNS0m/SDnT5IjsiRerGRcW2VImsA9Km3K4yYZsOPP6QXubny14C962Xz7LpVHmVIoxsD1O++K7dIM/hVJBfexALKkU2RiO+Cfp4B1mIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spahUrRI; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spahUrRI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so52519615e9.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787609; cv=none;
        d=google.com; s=arc-20260327;
        b=s4IcY5iN9r2MHxSHHvISbICTfZf2GLTcM+Vx5GDydY9Ant1ZFPOSmQ4y5YxIrH6ecY
         XuspiLhUYj2NmH4XlKxlcT5x/YUBuKuUMFeoet/dV1LsVWAJNdTr8OOA7meGzaKJm2JO
         qWwieK4wKzggTdEsvEw6olYXvJ7zQmj4t4my45RGdKusJxEm9Bte4Bh6X5Ut7w0tC418
         FOHSaHrKitjE6W8UxN8Wxl2JMZvDRWn9+xgl8NBlUEgibthnd42LwPazdmIB6cX+mkn5
         qcziwY+X8rglmrJEeMl0Vo0MSSqLeNmj9eEX/9sPwkeKFmg0TzDZ9rvU2JlRXxw2vbW9
         mpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        fh=x3aYa9Y4kZPUZ7Fkv6oK9/AduHEE0Qa6t37zUn3OITo=;
        b=ZIQrfn+sNqHJjM4rFLrotTFSMnfivoOaRG6hH+gSOMmtYyFpb5/lfZUpsIxN8Hybkp
         MC4R3kc5hdMJ0ow7L+79mVsYtPYY1Pyl+IKR/H6jyZ940vZ9Pdi8rTpX/guTpmvZ/yCj
         gxiWCUopGgNWVhqaVoJ6NDEPedOA3K/1PWBYoSLwnqmngvHH8KLwKoDLQAtYNtAtEAbd
         YjS1GpmLGyV7mPfpJu2jNPrSTzVcTo9f0XiZTMO4B40Uz9fpuG2OnXTk3gg84AzN23I1
         o1FnS7H14MX/WE8icqwcLYIjualajlI10YsjaeZuFYvDzqeIkDMWbbm13WfQsvYVggMe
         xpOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787609; x=1791392409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        b=spahUrRInjqDGGCVC2I/U7dc0ub9D2jo+Upg83f6FC+CFeNA2/k5Bk1+fJJD7FvFZx
         5ixDoCfl2yl8TVeXtKqWzfBhBkBNQNAuXT/ufFwt2Wd5jGOLOg22SWt/zgTycF1U3Mh4
         LysofWYUqZtBvTcvuzJdRdkPBj9JL/3xDEyH25hdZAG3XIope6rM/HDiqer5rXTjZVtn
         k4ZLvaF1jho5NXPSP9sKahqsdqS4eASzW3wgTvENPQHXfs+urwFvWycIPM3WLru1vUcZ
         eqjoVMg8TkAwaaHYxyepEK7itbKkk52yZjBOlJiLRiDJk/a4tWnXm6vZTialQtegKAUN
         6xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787609; x=1791392409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/J1exTPTWXkJiVUl9p6jDIEpb+9AWn6n19nTgbowZw=;
        b=zSktiNIWoRErvuJNPrAEhkcNeWjRmDyk7nnqIP9uSM2cLKbFJnmd3kmxLxpSoUuvL7
         5zsFABFrZP3ue1JtCtl5Vxs+VCtbw0Pap+/EvgZjACoCngHqPVuQGkhmpUG5bZD94xYb
         qnHaU+tAFPq6CWoz/Wh9A7yWomue+XXU0z4TiDfwftJLvmvQKq43F30zVEMHMVSbPO1H
         7sRL/PXSSz8RMwGebXkXp2L2d6uXt+DJwiT0Xyqla9X5yTKfkmRAs0xa3Stokq1NKKyj
         CzohTCa1wAd1YSg575U5u4v3mR0CR1pPUcmOBZ+LvzwKX+pOWS4nvqPncqDjgjr8ZM3Y
         ChBw==
X-Forwarded-Encrypted: i=1; AKwUvBwgNLs9ITtZ82bDv20wiOvj4tp8K8ah6V1ytBRcxzEgZ5yOOca11C5dCCB25TJLp6D5G2GlDrDoCMox@vger.kernel.org
X-Gm-Message-State: AFuF++l1zaLeeDQqckXPyKE5LyCUn+HXwkv+czwrko2vBlzFcx+zeTB9
	DqaPPnf71OE3vFw0x31gX9j0NbEaf8e36jXhnf/vqHbirtK6c3CgBFNsArJaouGmuQ8DQWoKSE7
	TrgUOpFNFbWQZULHeJzEjHP2ydLzKQ4o=
X-Gm-Gg: AYBFou2XbASYB5kEb/IVrQY42OyFcL7uWHFH97xB6YlwEU1CsIvXt+nDBW7K+VTRk5f
	nIiwKJSHCA9DVrTkrytU/w0VthnNHzFxVNPTjT2o5hVb7TvwL9u5MLwFflLKt2b3il21RsTrK5I
	2quvRTtoh87IEuVKtlDf0q02LiWo6pLmp14rbktXXdphVE/bbL8r5Iy1eFjxEuH16eZMI60XJQt
	9L44YYun+5EmJbGdnuaoQPt2T1+HbnmcXK7pe1iH8c26tIahvBMwjQbI7V11sBy3bFgbb+9mNd+
	HDxAspgEWABXvTI/GsijnauHkSLnVDThmRsa/MRaW+XluHFtQadRlqAsU1HsVfljby6+eCZjPj+
	xagTZKvm9Z/jdBTv7I1UfIFEHfzVBvdtDPC/8hEYb8UOZfLP1Z0Bi/RKaQljRg8PjvcQBIw==
X-Received: by 2002:a05:600c:3152:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-4a01b12603amr36070955e9.31.1790787609394; Wed, 30 Sep 2026
 10:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124248.237032-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <arzVw02dIqn4M-VK@ashevche-desk.local>
In-Reply-To: <arzVw02dIqn4M-VK@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 17:59:43 +0100
X-Gm-Features: AclHuK8eJrFqm5LeaZJBMYeX86u8m2nZ2ZLVvt1JxRR4ALOvCiQsOu3O-zn_iL8
Message-ID: <CA+V-a8uUtqBCDJC=Gy60Jx=a3au+9ZN1Dbbi6uGbzvHA3GJsXg@mail.gmail.com>
Subject: Re: [PATCH 3/8] iio: adc: rzt2h: Add chip-specific configuration
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Wed, Sep 30, 2026 at 10:26=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 29, 2026 at 01:42:43PM +0100, Prabhakar wrote:
>
> > Prepare the driver for supporting SoCs with ADC IP that is similar to t=
he
> > RZ/T2H ADC but may have different channel configurations.
> >
> > Introduce chip-specific configuration for the channel template and numb=
er
> > of channels, and use it when setting up the IIO channels and DMA layout=
.
>
> ...
>
> > +struct rzt2h_adc_chip_info {
> > +     const struct iio_chan_spec *chan_template;
>
> __counted_by_ptr() ?
>
I don't think __counted_by_ptr() applies here. chan_template points to
a single struct iio_chan_spec, not to an array of num_channels
entries.

> > +     unsigned int num_channels;
> > +     u8 features;
> > +};
>
> ...
>
> > +     chip_info =3D device_get_match_data(dev);
> > +     if (!chip_info)
> > +             return -ENODEV;
>
> -ENODATA
>
Ok.

Cheers,
Prabhakar
