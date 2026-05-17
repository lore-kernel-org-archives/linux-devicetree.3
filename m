Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EEF349AF6
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014085; cv=pass; b=BCd8opXhQNhugGdGur1H7A77fKg5bDdzS5h1SY6FtICCky3q9E9sng9lRHAEBuwNWTCOoGF9lmkiG5r/oBexXfo+hgN5nm+k4ifnQ9ovabFlpS6BuM7l+kdxXMFdpOeBEodApFIG4NM67JMyX0ilyQuaulB/aTiLlLlnHhfIGG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014085; c=relaxed/simple;
	bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPgiYhxCtdWg9AkUeU6Ctf2rs2umALFYdNVZBcbcNT012QvndE8TohDdv65qzk7EfuhOMc6UwbTlm/xMRWPsjsetkgwkeu0IBGssC4LN8pv+m/CQdsPdIto1empODSxHVL2hyy9Cq7P+rXVMz8F6yHZ68ydUsgX647sGS25R9SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcJJW2TY; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcJJW2TY"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f7020a928eso1707100eec.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779014083; cv=none;
        d=google.com; s=arc-20240605;
        b=ARLrM7cdU7T7Rq+sqgP/tUREabh2pu6FAv2d8Q6+H+pJYkvwNfLzyVGcqXLQtXWH/R
         LKfiViBt+n9wbSHItc5xccSKdaVUck1nXN/o1PC4ZiRrUvQdZad/9E6qoohq0DlbcQMQ
         bodm2GnugLrsTNLNPBfhk9deLG6f4dIzh4PBv8LaGT7xZ159hm34kimqawYn6rFbeyHo
         Wk/A3Jdfks7UvTPthvWfKqG/ySIGGRdPPRxwaUcoGkzmMc1tnDZcUpoQkQkb+GGKAxRb
         PNyW4qw3jJXQsd23l9YD0VgVvRQ6JQkYn6Nnre+mibC5hwYZTAAQa9XF+Yn/xEJRaJcq
         8XVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
        fh=AkWx3fERHwO6wIr9bIDjrJ0puJzBR1CdKyak+uAsAjA=;
        b=MCfrqbpAx8mEkJ4kDpjucMLLePskNHD/JJebgqQeMBR7UsENgkQPoKVRY7hd6o49rK
         MFP0OrN7OU+5V4sPZ2JlGunZWXfqjLCa/oeu+wFH6uWzj1sTmpj7BYUu/gEy7OLj5hzK
         q82dRp9mnLss9Hpqq4mIUfWKJ3iDjQqUdh8UQcQcIg9TU7g720BR/idmCF/Mru6S6kIw
         2qBziqI7zPdXeNlvYLf1IXyvpye9LeSHNtYsCqMfvC4YHD4zlpOIr/kzhIeOJW3CKk79
         6MX3XWCPUCY1PgHRyU6TkbkOYA+grXlEXENnGXFjxwWO+ElkJJC76MYnbLtnRM14lx1D
         a1cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779014083; x=1779618883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
        b=NcJJW2TYmk9QsK4GzkxjqOBIQ7SsvqUYeBfbkpTrUHcbjLIxIUNtdkTIECFVixcjAr
         RsbRx2qlJRCuvt6/lnOjF1W1e9Kh36ZvRDOZcID+7XF469K6XV97DVe2yCqfNGAS9Bnp
         x09bP5L7iMYHWb2JYhoRRxVCkkWME1Y6WQR4hGOB8gnaexhCLJKz3F7/YFH2iuRX3XkO
         aT9gPuCbMiHGojqQJA03TQoLw2KuM+FUHy+2nTMp5L/opA44BDn4IYWOMciGESFemCuI
         6lT2S4qw4bSj+BnhUI1Z4U8qQXj0NH1ygxxi6PnE1Kb29SxliQNyxvytn5escOHKtHjj
         4j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779014083; x=1779618883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
        b=k01AC7Zwai4xDEo5VhtKItNB4xnUOo9H7RXgIDZzxVHyYlCL43NRahAaQQdvU545AU
         qM6jrg5tqiu8RUlREiwzWmGmEHM5PvndtZmDBqz9yZMx62swN2hxol2ugM0XHDd/ryO/
         8NHx8ChqYmerL9sItezpm2oyDRQqxHvxlMwFUmJAD15sTMOFYf78vv6CEptc3nHjLEgH
         PfKNyG4USe/CL79oP0ogHkj0GQRhfzau9Jd0wdIezXZ8p5YMhxSgNBSumTB7HsaN7L9c
         /mCKrKjRH97Eg6BJO3hWS+oVCedSmP75e/0dakGYvTVfg2qK4BjtJIwnrcDsKaOflSzP
         BFVA==
X-Forwarded-Encrypted: i=1; AFNElJ/4GI7BOJvHlObMATgOQD6gC3Ue+1eNdGcMazykONLZGRtrbpTKxLDVU6jwEpxPRXBsimLa7+5BtLVn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz40QbwwjYxhJh+eIvYhBG1GiM8aTXc9abmBFnyVd7XcCxCdFZ
	RC0gaPE9/93GklH3/QI/cuNEyl4gGyjtqx73Y/noowISOwTb1yKYTqYYQwvF4QB5OMeGw9GM4o4
	8gM75RQZYv++qjA/XsYhu0Lis1Z1KQfM=
X-Gm-Gg: Acq92OHf0EMZWiYX9M/m6vfDUVr/67pLP9XXX5spPB5AQuLrchxt5F1g9i/6ZAreMNc
	gAkgaEjvx2YjNV2QODXsNqmRmyEx9MpVpNowEJDkWQRcA73JJGU7q0D0ZUSrghOwThqkrhpI8vu
	qBm6sKoxDub1a6e4p1aNY6c6ejFdFx7KfMqedJU4gPS7mBCLfOyqbhcmcO3nKQTK9al3tp/fQVE
	AXKCPYFpFtZ3lzoINGi5umydZLs4XJGexWyv0aewvE+wOYMOiDyG6spPqPeGMbkAKaWmbpWph5U
	IUZcSal3Ki2Z8/Y5wvE=
X-Received: by 2002:a05:7300:b586:b0:2e1:e5c0:7992 with SMTP id
 5a478bee46e88-303982ac675mr4634265eec.8.1779014083372; Sun, 17 May 2026
 03:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <agl1T8O6kwP7SFZ1@ashevche-desk.local>
 <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com> <agmWVdi3TkBb2cxV@ashevche-desk.local>
In-Reply-To: <agmWVdi3TkBb2cxV@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:34:32 +0300
X-Gm-Features: AVHnY4L5_rkIuV0CHLrjLCbs5l5KmhnavBVglVDy6x95ohpe8OW3F3iZSgNhyEI
Message-ID: <CAPVz0n3Kn5VVxWxCgq2EcRiOaLWnB85hD+-S2Eou=H1PyycJCQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:2=
0 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 01:13:22PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
10:59 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > > > Convert LM3533 to OF bindings, add missing VIN supply, add support =
for
> > > > setting mapping mode and LED sources based on device tree.
> > >
> > > How is this being different to
> > > https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gmail.c=
om/
> > > ?
> >
> > I have decided to have a fresh look, this is continuation.
>
> Then it should be something like v4?
>

That was more than a year ago, lets start fresh. Those patches are
gone, though I did add many of suggestions from there.

> > > What about this comment
> > > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> > > ? Have you talked to Bjorn A and Johan?
> >
> > No, but since grep -r "lm3533_platform_data" * gives 0 results there
> > are no platform_data users of lm3533.
>
> Johan was against driver removal (while it sounds logical due to above) a=
nd
> referred to some other patches from somebody else. I think you need to
> synchronise with the people to have a clear roadmap that all stakeholders
> are agree with. With that, the split and other technical issues can be so=
lved
> during the normal process.
>

And this discussion was 2 years ago, and

"This device is used in a bunch of Sony phones and Bjorn A posted a
series adding devicetree bindings a few years ago"

They have had more than enough time, don't you think? You would
definitely know if there were any activity since you are IIO reviewer
and would be included, were there any activity?

> --
> With Best Regards,
> Andy Shevchenko
>
>
