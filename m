Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211B63E4C6B
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277180; cv=pass; b=pHk+FDYs2bp3xGdp7GCBwiOt7S/SZrZyfTPzo1TlOyYcGC33Vqw9ksd52xCCEJUi53Kh2c+DjGuXRtE3Im8fGrQfFuZBMjsyXHIExb+ueA6sTanpONreb0iNylrGUOVsC72YUUXmubrxtw9uPEuqm2GPv2OvjPlD9MDOs9S2Y9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277180; c=relaxed/simple;
	bh=K1k6G6+5zpiLdWHibg60JQFt+WiCSRiOFiAgjC0rwxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GysQWkhr2ZxzaSdk3PNd/+qRLhE49c1depQvtz7g4pwYZ6M24WkILQJrUtfZMf5r4pukt3JTABUfosekg8dDsI+xRldbynzDgnGn7IgYtJrgSIpP7aiujHls9gj1UFcffeyoWD+Wkc2OdQ5wE7NIGo6I140RC+5UA5qzgob6LmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l2kCj847; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l2kCj847"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664ce3000e6so3690209d50.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784277177; cv=none;
        d=google.com; s=arc-20260327;
        b=hQv9Da209qjNU0vrlk2Ces80MrYPEPW5H9L1op/TsZh8f0xiJOUU8ko8V8LEMCvy44
         TGAczQIPDbTHMDCfof3mvpLXDeL7sWDDxhLojjfsnJYpj+ae6QLiKvO2UFSuQtkeRjUX
         5eVW0XxQlvX+RysNa0+rtMMSQGRGmbnUbn26cgtMcunumcUrwDxorlj+TDlhy3vLAV/S
         2WjlEGRcwfFwZbEa/fhuSMvg3fbis1IxcivBXio2whv8lSKO2YEXMTgPdsR5erVLESzZ
         PQWZ31+gf03a8jKCrKMBd9PZTo6wA3oa4sDAyPttNZlHfMwi+nkIsdjBX4WRQqun9Vc5
         Os1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        fh=//0kRPeotAoVu9bnMVUlej47AZ2lw+YHLsw/JwWuHdc=;
        b=d/MGzG/vpyGOKRfZ0tOW7VJ4ueF4waa19s9Hud8b5XsfaC/KeBPzSDYTUZ/qIh0Gwb
         8axJ6vmaTvJBpnSL3qJJqlg6yJkrEauN6qavgyknLHm7nKs9YDtdpnG6BjBrYpCZmkrF
         BdjcNS0yChxDMvWZnZ8H3td+mfc9/7xn3ACzD8URyBpGoiddOu6i4xGHAsCcvClVkPKJ
         fXMAoqi97GQHeG9KDf7tlVzsn8jdUauDow3dXp30w5FAmuaJgpcgXNnWV6aNP/VM76Wu
         +4SKO4mVfj55S10ciyBie6i03bcI7OTEfhEXWOoGQYw4n/fD7aPpyRp07Lg1BqG9YnFa
         nrPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784277177; x=1784881977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=l2kCj847J02c+DpoVjLzUfMi5eK3O+d8hOmWkSba4h1OeBWn02zqqnCMEZfsFR5NnQ
         6uZVDWY9PNLRBlnnAmmS6gLMB0U8yjYxTt+730Xfts+gWiaiJKGEVNhsD8oG+Br5IV/K
         S4Vwq0BI0f/o8pRRZ4vw9ouPi0UFxLlEPUi5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277177; x=1784881977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=rXy085kmxz6DTHSBUfu0AQhisGxaildnQ6SsSfiOMMFckIEqYNnVhcycIEOanbKlcu
         k4LomwtQjF+FPNfOve1ip+0igR5RjoUnAAnUq9YrccfS3Gf1Qw/0Hj8xawegG82+aEl1
         +0E04l+jC1F1olMBqHAnbhoRewwAqZDbw4eoPljmJuQ8Rm1RXu+V+Nj5KIiwRq9x8UXN
         lEm0pfu0EXGXfRdyghbEGzHxcvM7/T0WLxfzR/HB3JHbON7dNJeFOop4L0Y28ZHXzE0V
         8NjFAY3xoVfSd3Bj94PGHU1AnDUGktq2UoZdwuKAOZ5Ik6GiLavH50g6Gk0FPotqTX1q
         4xCA==
X-Forwarded-Encrypted: i=1; AHgh+RpUVPJsXcGGfeSQPHQS+JV1e59RxZKXlo5OHLqPoi81Oaq3YhAMu+bYjDZK1Hoo0eqV8hjtMT5Oc5TI@vger.kernel.org
X-Gm-Message-State: AOJu0YxBI4bzhx4L6YBQpRFl1NJ1RwFtYTY3Ey+ZZg5YVJnW7HvMLv0Q
	Nmb5aafpYNuoc59VDWFlD8fE/bJ+9HJJObshYNdVdI2EpJMe98JXamKeFawaTEobd85VPXfF9rc
	PGm9Ow7cGL3wq0gKLb1APhSCXHF67EyOefJdwUvB5
X-Gm-Gg: AfdE7cm73/g+FR8obzNI4F0MK2/mJf1MbjDixNrySTDGxRC/ciy7r1x1TvRxhARreCB
	VhF8ljwwPv+ZVHYHAGfkxPb3TCrCaRTVze+aC9QM/YsGnOEPu3P5U7SSMOIBJv7WiAC6nNMsqo5
	x/XmU/S4rs9lIIyD9lnj8CdD1dU06N+o8HdD/TaN5/vlmMz9ptaOn/sZKwpoCeK2BLeZbENgd+m
	NH+8AmfcGQ1BuWZkHcwvB7a5D/LHDB351OiwRbhDGOFU5CSvyokuzRSQLYh/L29HYupRCLXE3gr
	xfaIfODpnx3R
X-Received: by 2002:a05:690e:1644:b0:667:af05:2e8d with SMTP id
 956f58d0204a3-6683bde30b0mr341998d50.79.1784277176987; Fri, 17 Jul 2026
 01:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local> <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
 <alkWE-bQ9gGIXIJj@ashevche-desk.local>
In-Reply-To: <alkWE-bQ9gGIXIJj@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jul 2026 16:32:46 +0800
X-Gm-Features: AUfX_mzoGIeMcv7EV_g3RqR3VRvLvguofP9ZSODwjiLGO0JAlL2g0unPo14vZls
Message-ID: <CAGXv+5FJkmOJgpwRBp4nAea6_moF=gH6wGmNpP+g8URNd--jbQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 06:02:38PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
>
> > > >       fwnode_handle_put(dev_fwnode(dev));
> > > > +     /* usb_hub_create_port_device() could leave an error value */
> > > > +     if (!IS_ERR(port_dev->pwrseq))
> > > > +             pwrseq_put(port_dev->pwrseq);
> > >
> > > Hmm... I would rather make pwrseq_put() NULL and error pointer-aware,=
 so
> > > it will be no-op in such cases. But I think Bart has his own opinion =
about
> > > this.
> > >
> > > >       kfree(port_dev->req);
> > > >       kfree(port_dev);
> > > >  }
> > >
> > > >               put_device(&port_dev->dev);
> > > > +             hub->ports[port1 - 1] =3D NULL;
> > > >               return retval;
> > > >       }
>
> ...
>
> > > > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
> > >
> > > > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > > > +     if (IS_ERR(port_dev->pwrseq)) {
> > > > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port=
_dev->pwrseq),
> > > > +                                    "failed to get power sequencin=
g descriptor\n");
> > > > +             goto err_put_kn;
> > >
> > > OTOH, how pwrseq can be non-NULL and at the same time port be created=
?
> >
> > I assume by non-NULL you mean returning an error?
> >
> > device_register(&port_dev->dev) is called some lines above this.
> >
> > usb_port is weird in that usb_hub_create_port_device() does a bunch
> > of stuff that is normally done in a driver's probe function. However
> > usb_port's driver is just a stub driver add for userspace compatibility
> > reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects=
").
> >
> > So at this point the usb_port device has been added to the driver model=
.
> > Or we can just zero out port_dev->pwrseq instead? I guess that is clean=
er
> > than having some weird check in the release function.
>
> So, why do we need to assign the error pointer to the field directly then=
?
> Make a local variable and assign it if and only if there is no error poin=
ter
> in it. Would it work?

That's the next thing to do on my list. :)


ChenYu
