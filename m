Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2E32F7F0C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199256; cv=pass; b=EHw6J2Nb1BCbsFJXfzEzl4Go+DDeB6u+mL+bk1yx38HlR3xdc0nxBVDeHnh5uVMXUmLnCoWUCRXnnQxYFsej1qQDMW4xWfGRo+WzJmDYrnU7p9yAO3uD65TOUco3N1TpplHqSxM4sTu3Pm5J9Hpt/Zs9Wsq5XiFlGOyIvZUmULo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199256; c=relaxed/simple;
	bh=3j/moiupjcRobjxa4ND+wmxO9Q9vks2r/SEqOUGkRGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYUes6TGVhfalS83h1f1gAnbgwe199gGrhbTNCGIDtJiUtXWHKxKbOzbiUXvscMBGnJPC8+fSUq4pyeaTGdhhgrjaudOb1V0JvSFGCYnxEGqmiV2cMwzXSVnvj3DO6ZAEe73cKfkWXzMLLx6vNWoY1qhwuJnTHsCHgsam05VNHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f6SqFLJM; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f6SqFLJM"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664a09bc459so10081023d50.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 03:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784199253; cv=none;
        d=google.com; s=arc-20260327;
        b=lcg15sbVa9lg2HYIPPMedWEPumKIVQTY5BZDS925L5dRByfLoYs2D7Dp1QJCA2RZYV
         RyJX7U4oDdvOMicRHAyw8BC/sKWH1d3l2rGQTU0ipeXuBFgvHaaWAe+EsjEkWGIrc7yn
         o+Bdl40L7jd1amPWl3fgxBOSF2urnT3oWz6UU8MwdY1JpCvvjqnSrzNa3FPA59YfKnr8
         vM8ysMX0B4AJiz2smnGyQKGFK3zWKIuEzyPMN08orIMbiBa/ogXH/rW0Ez4fvAm5rarK
         aJxXmz8QGYQzapKertlIDcKVclEMMafg/I8CIGqJp+urln6hX1e3JyiQddQRHKyKrhDT
         wjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        fh=AIzN/SBUb8zA89HV3XI6dIT2/97pYH+rlIqvGYI6/rI=;
        b=PuQVeholYGbPfHwYQmGAekfr8XXiaKjPRjYhKjc4Cnj1KYQHHm/udGp8IpygX5/ftn
         Dmme0yPOA3Jd4QEXChkIleLGuydkAPXu+7fE+lCE4eEW0DTWMmzTPRlUvhrubyYNce8D
         Ebai/2OAYCSfc0HIh7GkZM7TSc5YQv6hLqKdzblLwNL9VPRM6GT7G2GCLy+9S6dwWtJc
         ijIitQNGpks2iCepB+wLWocORE4rJOIq6bn/I/nTNByD99TS+bAWNXXGj0gif7SjoaBe
         qw/sSvYlUz/Ka5+1RdWGphAkNrMNigGyTl1Yr/7HfM5fbREz2C1RJOz4QFd/Xs8e6eGc
         K0Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784199253; x=1784804053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        b=f6SqFLJMBNv2J9+tN/SD+Mr0yiaGb7JzeUKkBHV6RygNbuQRQ+NCsySqqILI9W7nIw
         x6RX3bYWzZ3ddMN6lpYiMZp6cYmrxXGOs2ZgTnKPiAbfnXEessYVbPaPRRRdKua5cQKr
         eigeNCk5drspqqnuGpUZCzI9t8ifNG6qq4nV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199253; x=1784804053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ye5TWESdXypHFnrQA4hoOjMY+BQZKzclNsOPs6Xfx3c=;
        b=cIpjo3c8QU1El+PGdy5DNesr0Zv0aAQGZqAEkk7VaM/jIp08/H+/X0U9W0qoS3SxFM
         SsWsfwG4Jkk7Ax9inDmapZqDcJE7cFG+ZnpE1/2h6k9kK6+ld0kL7C/1l2+J0ErkJM8w
         0Me5oK2oP+bfmLYMf6BQoGk0ZZaUPslxN6AbgRMx2Z6yTD9JL41BAxLGzuSYDV4yr/uQ
         ITNB2PAnYqo8PRMHoLGQjRQ8FMAaHKN5JtSXJp+HhnMJzt6eY+hY7pJLicAVRt1P5oN5
         outUyfWYg3Xky1555tK1yuEdcOBDaFZqSpZm3/yhYkOMw9PWM7tYuomjISMMYkc2tCjp
         A8vg==
X-Gm-Message-State: AOJu0YwsbmyWm0FOKzp2RQ33GUFP63aAZ+Ia2kpIw5SZbYFf4CcDF3K+
	sZ3uA4L78O02eEpCz214699XshxbgsNwDqDwSFh4FWQh1TTNq++fyI/3ah0BwclYAJcxd3pzmFX
	yuNUzqjT4znt1jWkYeP6iENM+xkJEE+JJNOChbeji
X-Gm-Gg: AfdE7cnWnfG857fiQnEWmfznB3B7H0Ay0V67M7AnmKafuk/hryaOQvRP7qcFo4cZ5w3
	T7DXzRDEsrkqsKmFnQ0HfEvD7epVvImLdFdwzeM7kxe8NTiHdHw2Kj/y0nbknWefvDVHKUq3p+R
	a8cCutJCZNTx/ZDb13oAunETKFvi9zhCBcdaCVbrlvzwojxz/XxdIDx9VvXVRkulgyhAi3jOyvV
	IbWEeZOD5+TQsav5EZfJNd0/FD5F0VK84n0TjeFlyMOyL4UwhGwaLRsZakYEKPMiMvnn6eahIJ9
	SfKNe3sL32Er9E9ItMe9h7Nb9Es=
X-Received: by 2002:a53:bb82:0:b0:667:d905:3ff9 with SMTP id
 956f58d0204a3-66813443847mr3043941d50.88.1784199252963; Thu, 16 Jul 2026
 03:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <20260715092814.21C6C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260715092814.21C6C1F00A3A@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 18:54:00 +0800
X-Gm-Features: AUfX_mxnCgjcslak5RN3FLmB9cGAZkDHT2GeqTyJ6cvjjM1YOC7J0D8IvenEsBs
Message-ID: <CAGXv+5HM2ojf_+bbybfaNi5-TLC876-DRudnvQnOxMzHEpux8g@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Concurrent sysfs `disable` read or write can dereference an `ERR=
_PTR` if `usb_hub_port_pwrseq_get()` fails.
> - [High] usb_hub_set_port_power() accesses the dynamically allocated hub-=
>ports array, which can be freed concurrently by hub_disconnect().
> --
>
> --- Patch [10]: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key c=
onnectors with power sequencing API ---
> commit e0346a1be7fb5d1254f3498bb6d857dd5db5a9d7
> Author: Chen-Yu Tsai <wenst@chromium.org>
> Subject: usb: hub: Power on connected M.2 E-key connectors with power seq=
uencing API
>
> This patch integrates the power sequencing API with USB ports to support =
M.2
> E-key connectors. It manages power sequencing during port creation, remov=
al,
> and power state changes.
>
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 10f15b40fcc55..298fb68c6afc7 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
>
> [ ... ]
>
> > @@ -887,15 +898,22 @@ int usb_hub_set_port_power(struct usb_device *hde=
v, struct usb_hub *hub,
> >                          int port1, bool set)
> >  {
> > +     struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
>
> [Severity: High]
> Can this code trigger a use-after-free on the hub->ports array?
>
> The sysfs disable_store callback uses sysfs_break_active_protection()
> to avoid deadlocks, meaning it prevents device_unregister() from waiting
> for the callback to finish.
>
> If hub_probe() fails and triggers hub_disconnect() concurrently,
> hub_disconnect() will call device_unregister() which returns immediately.
> Then hub_disconnect() unconditionally frees the hub->ports array:
>
> hub_disconnect() {
>     ...
>     kfree(hub->ports);
> }
>
> Meanwhile, disable_store() can continue and call usb_hub_set_port_power()=
,
> which now accesses the freed hub->ports array. Prior to this change,
> usb_hub_set_port_power() only accessed inline fields of the refcounted
> hub struct.
>
> Is there a way to safely access the port here without racing against the =
array
> being freed?

Before calling usb_hub_set_port_power(), disable_store() already goes
through many steps to acquire the hub device, acquire the device lock,
check if the hub is going through the disconnect process. AFAICT there
is no race.

This review comment in a previous iteration led me to try to rewrite
parts of the patch in various ways. Maybe it's missing the broader
context from the existing code?

> > +     int ret;
> >
> > +     ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);
> > +     if (ret)
> > +             return ret;
>
> [ ... ]
>
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index 19913ad3598b3..430fc90232502 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
>
> [ ... ]
>
> > @@ -831,6 +879,13 @@ int usb_hub_create_port_device(struct usb_hub *hub=
, int port1)
> >               goto err_put_kn;
> >       }
> >
> > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > +     if (IS_ERR(port_dev->pwrseq)) {
> > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev=
->pwrseq),
> > +                                    "failed to get power sequencing de=
scriptor\n");
> > +             goto err_put_kn;
> > +     }
>
> [Severity: High]
> Could this temporarily expose an ERR_PTR to concurrent sysfs operations?
>
> The port device is registered earlier in this function via device_registe=
r(),
> exposing its sysfs attributes (like disable) before usb_hub_port_pwrseq_g=
et()
> is called.
>
> If acquiring the power sequencer fails and returns an ERR_PTR,
> port_dev->pwrseq will hold this ERR_PTR. Because sysfs unregistration wai=
ts
> for active callbacks on the error path, a concurrent read or write to the
> disable attribute could access port_dev->pwrseq while it holds an error v=
alue.
>
> This ERR_PTR would then be passed to usb_port_is_power_on() or
> usb_hub_set_port_pwrseq(), which call the power sequencer APIs:
>
> static int usb_hub_set_port_pwrseq(struct usb_port *port, bool on)
> {
>     if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
>         return 0;
>
>     if (on)
>         return pwrseq_power_on(port->pwrseq);
>     return pwrseq_power_off(port->pwrseq);
> }
>
> Since the pwrseq_power_* APIs do not check for ERR_PTR, would this cause
> a panic when dereferencing the pointer?

Similar to the other comment, the sysfs callbacks try to acquire the hub
device and its lock, and then checks the whether the hub is being
disconnected before even proceeding to read out the status. The hub
device lock is held for the entirety of the probe function, which
encompasses the creation of the USB port devices and hub_disconnect()
in the failure path.

So I believe such an issue can't happen.


ChenYu

> > +
> >       retval =3D component_add(&port_dev->dev, &connector_ops);
> >       if (retval) {
> >               dev_warn(&port_dev->dev, "failed to add component\n");
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.34=
57359-1-wenst@chromium.org?part=3D10
