Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376635AC03
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196176; cv=pass; b=JWbgIoUKh5REzh5COPhmg/jUsMi0k6YJdLTKjNu6jb+PR2Vhz+W7LTll5klEZZrU+LW2PkEEYE0zBnugQAAGaEErJ2R/AxrfznDs8BY7EMEK9fr4u3S79CKYMKBZcJ4p/0PevmeQoOvtN39T/0RIvD1mhNKYu2BRRRmG1MVlDDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196176; c=relaxed/simple;
	bh=wwzrrNyzpEPOxzsqP0CMmVuHMipqp7uhFBCNZZJQtZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUAjoyI6FcaaLUIDeQSw4ZSckH3mDxZ89wvEF/Z5Evjl999okxwXbLZ5jHH8In3SzVaBT0qtx1Unht7x4PD9L35o5S30TAnDw3pGPBUZ41tHjAyLGuCnUxW1V3RXs6XrsB9vm0L+rw5FNUoSrePuAXXEqlKJDKyHjl/AmOzbN0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ABV4D2iP; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ABV4D2iP"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66810946e63so2127409d50.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196170; cv=none;
        d=google.com; s=arc-20260327;
        b=NFXQM2hzEBMoZ/N03sY2bgd/PieeRrKoPkH4NOp57v3kSP7R4QaA4OGAKALn8QTvzl
         AlJMoTvL7lU7bJ+Ya/8fWBTZzYUxrU7basC9jprbilEgRR8Bqw53bsIUSjIuPLVcwQig
         un6R+ezaPoLkBha8jHYseSA9dHg7CSloTIzjjaUXuO7Rn477ZcYzYXeZNsOhqi9nml1j
         /HqyHAMICbbpoPAGAiIjbniRfc0e2eek/9T+fD4/qMQt0cMgcncRB+N87VKk0mERSlEX
         JL0hqQj6BjoYWd8AycNd+a7IjzdHwJ30EOxzY9VVOHgfPu9Pspy7Y/n0zcUZlO3iKANk
         GV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        fh=5B2nDwRNJKOKS94++S1JvLbDJCWeX7zNeeSwOPa9u2U=;
        b=jDh7I5GscjiebCI2LOBMRee/zWBwMKCXnUn/4OwEgWs+dDCbkZxFsLu+uBfZf6vWUq
         TE0dr/PrZJgK6l8L9lf8QXLDAi/o1ZikHa3uwsv+/p4Ui9sO8hV268ilCupkTDRhHuNi
         nthT3boI/oGTbgRUq5KDb3JyCL0rTunoIv7k9o6ZiLPFh1+abJraDWIh7X44Wi1X2s/f
         QjrDunEMvgrwjmw75s5chcaeWeqpvbwP/nBLcEFzN3AR/ZRrb8gZmcR+Aml29yJvQhBM
         EaZr9oc+Zncq5wHy9xom/9LFykEJRgy07N5L7Ncv6AyWowPsC0nfE/Zu0I2e/rJIbx29
         YPwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784196170; x=1784800970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=ABV4D2iPUtxj4CcbzBlkr/xHAvpZIb4jj0kT/KRDzYy6KcqyzPpz+oqjugqR6KHvb6
         H3vNIVspSuNhoRLCu5UB5DmdcIzU0a4D2lpG5zoZZ5sBQgktDEtbBbIreVT1dqACU7/e
         pc0YQRwD7r0jfGvDaZD/XKMs2V0DnOrid4EJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196170; x=1784800970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=VT8qpF6VrsdrrdfOqAKZ2PMmt2HxI6XWzK2f3euWZ1Yx4yFA+eIz7rw9ZcaIxApesc
         NDkWKByehUqNRbnLIpNif8OvQMJRuXFFQP44nTckooohl1e6MUYQjZ5lQ7mUG9cVjAPI
         o4MVShFfYiCgaqwqzAKMysyrlb40XQ+IQHq6A3MmuhyHTpILt/e4Cx2Cm1P4Sko/9X2D
         DVEoGidEeTV//UZZ3mUrHQfYJOmCWZ16AAvgCmDJxRavR7UgyVRhcglf+Rj0yoDPpDxQ
         CvrFU3/05h3GMkbWbey1nc/ysWTjiLFAFiAHW4dC3yq8OgVqRnOU7AbvCzS2koAX7EE6
         6Ulg==
X-Forwarded-Encrypted: i=1; AHgh+RpGgALxEJqd+7KsFmv7dCVKsm3drEBzP1RSYgrgtM4oawa+NB8ClVOLItCJhYvZqnIjVgRj+e2Rf49n@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQCmnVuXAKfjy2vH3sDIWaRVrGwp6BenPx+NCcgOi3Oqag3e6
	ATikh8xuMQHb7CcVBcJlZcoQ8x0SBxfEG10oyKCrdA5F0SZ5KWYOoys2BTVHIlTbZo25wkktcd8
	dTQm5xo7vrg29G9kYDpwjJr80e3Q3YlDmvuvpcjsT
X-Gm-Gg: AfdE7ckElLZIMEVsXf5AsqiUnuxvAZGUCb2Xkuuc/vd3PWRI+gfBHk0JWE6xn7nGice
	ZzbFXN2ck9yFi/RVm7rXlo4K1uz4eEXiToMls1GhT3bTnM4el9dZtqL48GHxrMTTUGeOQKn90Ce
	uBWe91HWAKFAIIupSRxJ7Xb/8CeuuaVBJn5nT179YZ8RTWWlx7zovAMZkNdfktxdxOrems2TH9v
	uD+TxZ5luzkKbqk9UpAZq2LG7VhKHvXt2jaBb0+9bDykGGuJ1mtD7oc7HMHAXWPX3pzqNjd7ERy
	ruTw1VZL7MkFprjK
X-Received: by 2002:a05:690e:d02:b0:668:15cc:bcc4 with SMTP id
 956f58d0204a3-66815ccc501mr4350974d50.53.1784196169785; Thu, 16 Jul 2026
 03:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local>
In-Reply-To: <aleKQKH2V-ck-SX6@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 18:02:38 +0800
X-Gm-Features: AUfX_mxuW_5D4-j7y5auPPMU8fitwu4GAwXYmX14uCHTJY4CutBJo0OlCAdX-_s
Message-ID: <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
> > The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
> > on this connector to work, its power must be enabled and the W_DISABLE2=
#
> > signal deasserted. The connector driver handles this and provides a
> > toggle over the power sequencing API.
> >
> > This feature currently only supports a directly connected (no mux in
> > between) M.2 E-key connector. Existing USB connector types are not
> > covered. The USB A connector was recently added to the onboard devices
> > driver. USB B connectors have historically been managed by the USB
> > gadget or dual-role device controller drivers. USB C connectors are
> > handled by TCPM drivers.
> >
> > The power sequencing API does not know whether a power sequence provide=
r
> > is not needed or not available yet, so we only request it for connector=
s
> > that we know need it, which at this time is just the E-key connector.
> >
> > On the USB side, the port firmware node (if present) is tied to the
> > usb_port device. This device is used to acquire the power sequencing
> > descriptor. This allows the provider to tell the different ports on one
> > hub apart.
> >
> > This feature is not implemented in the onboard USB devices driver. The
> > power sequencing API expects the consumer device to make the request,
> > but there is no device node to instantiate a platform device to tie
> > the driver to. The connector is not a child node of the USB host or
> > hub, and the graph connection is from a USB port to the connector.
> > And the connector itself already has a driver.
> >
> > Power sequencing is not directly enabled in the connector driver as
> > that would completely decouple the timing of it from the USB subsystem.
> > It would not be possible for the USB subsystem to toggle the power
> > for a power cycle or to disable the port.
>
> ...
>
> > static void usb_port_device_release(struct device *dev)
>
> >       fwnode_handle_put(dev_fwnode(dev));
> > +     /* usb_hub_create_port_device() could leave an error value */
> > +     if (!IS_ERR(port_dev->pwrseq))
> > +             pwrseq_put(port_dev->pwrseq);
>
> Hmm... I would rather make pwrseq_put() NULL and error pointer-aware, so
> it will be no-op in such cases. But I think Bart has his own opinion abou=
t
> this.
>
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
>
> >               put_device(&port_dev->dev);
> > +             hub->ports[port1 - 1] =3D NULL;
> >               return retval;
> >       }
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > +     if (IS_ERR(port_dev->pwrseq)) {
> > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev=
->pwrseq),
> > +                                    "failed to get power sequencing de=
scriptor\n");
> > +             goto err_put_kn;
>
> OTOH, how pwrseq can be non-NULL and at the same time port be created?

I assume by non-NULL you mean returning an error?

device_register(&port_dev->dev) is called some lines above this.

usb_port is weird in that usb_hub_create_port_device() does a bunch
of stuff that is normally done in a driver's probe function. However
usb_port's driver is just a stub driver add for userspace compatibility
reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects").

So at this point the usb_port device has been added to the driver model.
Or we can just zero out port_dev->pwrseq instead? I guess that is cleaner
than having some weird check in the release function.


ChenYu
