Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281D63F165C
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 19:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886983; cv=none; b=rfyAprAoQ8i+OPeTNW4eBxcHr1NClHAbEZQCb5iHhKtXuk/1zW4EzHVybIgERR5yphrB/N63sqVRiyytvl//MxXMUuu7q2VXwIidJbuor/WMt9BaKFbuYyxFKQ1NWsP0EpMx//f0M2+LUNU/WqV2pEj4/W4oXhJYKvbGcyyVjiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886983; c=relaxed/simple;
	bh=1jDHS3//SVF2/A/vC8oT6/lwq+kdzpM3dPjKRF+cWNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gglQ8IBj1beImtZ4otlcybHLhNiatMTJafnzo9bxrak8n1wi9SoRniCdRl37jScE5bgvG1bk7RdULKDiRb+01THF5vKPZYjejohz4oj5/M5JQaDuff6tDO5Yx1sszc/r2uoRNaTf3EHnfpuPTecKlix+quVbE20rIlSZ3TDbyec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NdCNpE8U; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NdCNpE8U"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ba51e69988aso752183666b.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776886980; x=1777491780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=NdCNpE8UDlFjmeAWKvaw01o/bzzVLXAJwdR6WZp5nRM3OrgEfOSj78qvOJbLEzD+v6
         2jZ1mDxnuS4DNc8ZyjfDdsJYj41KWMRHYdCA9e8OoK+HLe+cWqlVELO5pNK1MFpLiph6
         4RjfQ1GYq90eYvh1t1rtnx42eKNzkib+qsRBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886980; x=1777491780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=tBVWPWnJEge/pazr2v1txIDKVlL+xfTjsMUlv0tGUTZG3EI1EPlOoKjSMMHUhfGX94
         fgJurOVTdCOkFDYnPF+MnGYO2UBLmuVGgeCmFAA6EuOARPECVYKDBW8SzVACLtNln6Jv
         FMh+uCilzGWX7SrFJ2z+Pl8FLUatSfYhiAOOqqIFKMnymRc0I3zAa2FxcbUiRLW4TxuE
         axbcGBs5HJo7sJGyRmHtUnbu+UtXroBPuzWlO2uV/dSoKWwAFpSv/iQUAKLHmlUU4Xy1
         fkNuXOi8z/hjIHFzLAlrv6cdvGQfkJXVLWXnghCkuJVDJyNPlkhzK4zn9RcdP2uE2ifb
         TRhg==
X-Forwarded-Encrypted: i=1; AFNElJ+KIA3AkmD1uUQusDb2noUqkMZz+LtvaUDXv/eM1LHI5g9sy5v7e2Wp4+eNtrinzTmLTv1DYgJV4uMo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5YwY6VO0zzLQOb5rEWM/HHo3tQOKsd2yrJnvEASN7nLuVVL4H
	4ex66i0Top+mNGXBPqgj1NiAoe/IAwS4ZjSST6c3saS3dKQj1Wk19Uw2LJR2VStSghU9O3SuSlf
	9PK74r1Va
X-Gm-Gg: AeBDievX+zUvLvHjCbEHkOo89JZazmdLehAtVRGdm4SfOfND8EttY/Ds1Zl7Uz7Fh41
	1bQzw2CuNLwAfOa2K1w0WCtUFqTtfHSBY2bbujikXmEuXSycUwwJu7PUZ+xGivF1F/+y43yQJT/
	//xvhcdSzhvdsk8AwtpOBifpdEybQ6FhTPTI0NYNTvb01MYXTUmFXWDwjbNPCYkQ5yFJfJOvubk
	6BiedIBG7GuzhkS4pqzIz2ON5eNfLAaHMMS6HwXcDvz9Wx9kzzwya7YDR3guG222gxxV2p+s/pR
	AvWC7zXSa6Ma6dUWBy68glUWfNMXzCGrU1QLBl8o8dRqBJOdlsIfJgQdQq/w/hB4JY+w7LVg245
	dmTDE12cZa4oyrHc9EsfZknWDr7IEunHknYqmVTsnX+/PdpN7JxLgwMhizXJQdyP7jP1OwpOKmw
	F9FOjP6YIrfxlZ7Ggse155jE7gHKOKPG6V1p8+GGCK8dX5p/sYndyJbTI/27IvSchqbiHWcqHi
X-Received: by 2002:a17:907:847:b0:b9d:fa94:3cf6 with SMTP id a640c23a62f3a-ba418e86cf1mr1217064266b.14.1776886980058;
        Wed, 22 Apr 2026 12:43:00 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455533b79sm581165466b.54.2026.04.22.12.42.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 12:42:59 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-671c5eb7fb0so7328253a12.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8G58bALYiLWv50mejWKHLHLzjlbW52RqPC9hfktcNYOV2chfGve57ed+SE8cphPu7uKfoL/Ei2PWoh@vger.kernel.org
X-Received: by 2002:a05:600c:4714:b0:48a:5574:3a5b with SMTP id
 5b1f17b1804b1-48a55743d05mr122645615e9.27.1776886533988; Wed, 22 Apr 2026
 12:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com> <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
 <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com> <aekg_IELc65BFrWp@ashevche-desk.local>
In-Reply-To: <aekg_IELc65BFrWp@ashevche-desk.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2026 12:35:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
X-Gm-Features: AQROBzBA2DSdR2HBaIYSKp4MrG-iWYSiPDxUw6OYCOPyJYNxN20LzPXgyZNheJI
Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Herve Codina <herve.codina@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 22, 2026 at 12:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Apr 22, 2026 at 11:51:36AM -0700, Doug Anderson wrote:
> > On Wed, Apr 22, 2026 at 10:44=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com>=
 wrote:
>
> ...
>
> > > > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
> > >
> > > After commit f72e77c33e4b5657 ("device property: Make modifications
> > > of fwnode "flags" thread safe"), this must be changed to:
> > >
> > >     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
> > >
> > > With this change my DT overlays are working again.
> > >
> > > I guess keeping the FWNODE_FLAG_* names, but changing their values
> > > from bit masks to bit numbers was probably not such a good idea,
> > > as it fails to catch missing conversions...
> >
> > Crud, I should have thought about that. :( Do you think it's worth it
> > to do a rename at this point to catch future problems?
>
> You can try locally with allyesconfig / allmodconfig and see the outcome.
> If there are missed cases, and their amount reasonably low, I won't bothe=
r
> in this case.

I believe I caught all of them at the time of my CL, but the problem
is in-flight stuff, right? I think the problem Geert is pointing out
isn't something I missed in my original patch but rather an
interaction between my patch and this in-flight patch.

> But for the future it's kinda rule of thumb to rename when
> semantics changed.

Noted. I've certainly done that before, but I didn't think about it in
this case.

-Doug
