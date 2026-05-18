Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560943E3C40
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095621; cv=pass; b=Ge8jlYHlueShxVZYyvqg/67ifoXZjMgCiD+CayduhT978vafX0WifjK9ZoZ50s1jiOImLNJG3nX9dQsvm9EcgCsjmExDGa7aLvqqE0ca9J4mPT98uGSV4oYD24Zf561vBOXpAnYdMRWitqo7D3fYgveHx6Ezt9U5W2LUl06gzhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095621; c=relaxed/simple;
	bh=kw2FaFkRYggKmHsD3zbceTzDrnmQSt6sP83wo4d+5i0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZ/lGuIboSlay0lecdRTOngKt9Wm240fJC3Vlnq/pmB86oYnA/fL7w5zZYDa5PQiYYeIriOftHRD+sJfVUSEpV8X+u/1RkRGf+tu2a4wb+xW5xa8BwCBUo6C1lnIKk9Ts35Fm+Wztw1IWztaEifa7eiXEh69aKef2csvwUwdZJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lb8gyKoT; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lb8gyKoT"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-393925cb1baso24477131fa.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779095617; cv=none;
        d=google.com; s=arc-20240605;
        b=IBnymB5YP5a8atcMWHL+X3AjUUY6q+FXaZomD0nMeLZq/S/ICm/6Ft6KrV7PsddKdq
         uSV3oBLd8EKHJd0Zsh4cNN7pMKZRN3v53zGdJ75e8vFxiWPgPELUf4FbOPXiE4I4NjPI
         7bRF2H8hSnhyiZkKkQCsoTGDQcHoC4ZuTSkkqVk0YsKYdrqeofHLcc2fpbR+BwU+gi4t
         5gbmGnQp1V0saJAjUKP66GYC20H5R7PwdIIrfO7dF8HUGdFkRAtQOdnzI5fj1DVxdnwA
         wthh/jLL17wmEmfng9E+DoEYAHkHqm01mMnVaWMWexI76PLMKokiC6eBhzZjfvYd6gj2
         hAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        fh=AXGwyacTBEHclIpMs1TcnOGpFrKeJDnQtR2T4jUUBXI=;
        b=H8ove34mJPtSuxvg5U+1ezDy9HASreFwVtsakTUPvRZzqsH1zGhSjhyFVud49fEurm
         8ir0+dPZwiLcNg84quyW57yAlc0PV0mzIsyxoAPvl1MEbwt1Fx7u733namdyiTHV9+VB
         Z82wuaBBi4JdP32kVBfz6Xa/T2Xz9fUVef5WX3XXDJVY8kTZBM4rc3J0tFR9hMByjBOJ
         PjnMLWEemBFfgGoy+ppKl1yIXlbWos+3kcCHq8VCHJKPlWT9B3EANhA2suluXwYc/R5V
         nvC3ynpg7WryPq27+aZbe0E+OOnctseCWj9sBbU7cDnlxwjShyG4wglMJAGP9cB2Mn8x
         Wa7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779095617; x=1779700417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=lb8gyKoTz8xgS7Qazjy5aUwN2O4ArUjZLFFTjz51Zxa+HqpxkgdWCuQcWDT3CV7kz0
         /0Ab7DqWd0KBtaDVkhXsrRNCUMd2Wn2P1Iz/9IhNFDmxayZt+qPXICrhD2/GWMcu+YGL
         H8o9Ze1FKuf1Y6xRu2C5AI0oRUhdC9Emk5CwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095617; x=1779700417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=N5isQBt9SIL+Tu1CyoqGfSjsqkCzro5f9MY+x5v03eMhZwFLnAvEzJf0m3xV7hcyMT
         wKD1RGs+7J7AgUJrBIwKtJjACXypd7xc5fUzPybG9izSiQnMX7AUgS/08NLXBAd/fV48
         oyLZeaDIlQc0FpxXNAX0/XhVGACl+ey6h1sHOcNtM5hLjUSsJ0BMcMotmc1jwJbOfdP9
         xvxyNTD+qFylE2mKdXq2R2rzdJt1J29m6pjTbcggeRAsYK8L+QH3y9aq4ZQ7mMl1G+74
         N85aS6rNPDP4iop7zlbsP6shFvmX39dEo0NxQy5ZLEN9jBlOirt5UONwqEpUWtnn3zoY
         Ipqw==
X-Forwarded-Encrypted: i=1; AFNElJ+Wd10YNqCduKM8YjtUruB60Heg/oquaid522JJ0HqMS+PShXQLR2+/1W4WX9oanWhgQPYvCYiRW0OE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+wRe2yq8371hMKWJjmNHrpBIDNJtKWirdKCaP+GpH7BGtg6sH
	o6KgAGMT3HUW8gShxzmG+FpsqI9KQPDMpIS9ijveIgbUzIqqfbWwGc63p3yu18rD0rcTgrSUt6L
	9CuynsiuBQND0gdtdqOMomByG/YDJkhL7iv+8b3aY
X-Gm-Gg: Acq92OFjDeRqZkpGtP5p1KXY8Z/v2WyYz8gLWVqXL8Bq8AlRno0RNgJUspZr9UCG8wT
	G6gWu2jvCvJkPvL+NinfHP6O83wYAXwtmZ304y8tDJc3AxSHxkWrd1srJj2z5Zzc8dZ9pEk7Ou6
	4mTRsOmbt1asvYGPodf5O5k4q4dhLygi4JwP3yjXTST5+dqpWVi8YOKICdCnmEJppHDsgBbr4wp
	ojvNfa1alHWc5hlgcHhUWPst9agkMp62VOI/FCDI4ts87ePD/lUDUfLUeNvBA0CK9J9IVDEoFrq
	cXAxOaO1pTHdtd04KNlSoX9+U9IQrLuUT3epqYGcqb1Ncg0b
X-Received: by 2002:a05:6512:3e14:b0:5a8:9f6f:3212 with SMTP id
 2adb3069b0e04-5aa0e741fd0mr3969603e87.34.1779095617441; Mon, 18 May 2026
 02:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <20260515090149.3169406-6-wenst@chromium.org>
 <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
In-Reply-To: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 May 2026 17:13:25 +0800
X-Gm-Features: AVHnY4KWMoq2C1egFaF2o_wZ2pbZmcxOkUhi_AoDtPCF3Cwz3jQrR0zfOzxPPG4
Message-ID: <CAGXv+5GT8vS87owuNJvMxWBnwCELCV28SbwsUXFr-Ne5O3EgsQ@mail.gmail.com>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key connectors
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 10:39=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 90ea597d42ae..4165f71e212b 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -31,7 +31,9 @@
> >  #include <linux/minmax.h>
> >  #include <linux/mutex.h>
> >  #include <linux/random.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/kobject.h>
> >
> >  #include <linux/bitfield.h>
> > @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hde=
v, struct usb_hub *hub,
> >  {
> >       int ret;
> >
> > +     if (set)
> > +             ret =3D pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (set)
> >               ret =3D set_port_feature(hdev, port1, USB_PORT_FEAT_POWER=
);
> >       else
> >               ret =3D usb_clear_port_feature(hdev, port1, USB_PORT_FEAT=
_POWER);
> >
> > -     if (ret)
> > +     if (ret) {
> > +             if (set)
> > +                     pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +             else
> > +                     pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> >               return ret;
> > +     }
> >
> >       if (set)
> >               set_bit(port1, hub->power_bits);
> > @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, =
const struct usb_device_id *id)
> >       struct usb_host_interface *desc;
> >       struct usb_device *hdev;
> >       struct usb_hub *hub;
> > +     int ret;
> >
> >       desc =3D intf->cur_altsetting;
> >       hdev =3D interface_to_usbdev(intf);
>
> This change is totally useless.  Didn't you get a warning from the
> compiler when you built it?

Apologies. This should have been part of the previous patch.

> > diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> > index 9ebc5ef54a32..6039e5f5dcd7 100644
> > --- a/drivers/usb/core/hub.h
> > +++ b/drivers/usb/core/hub.h
> > @@ -85,6 +85,7 @@ struct usb_hub {
> >   * @port_owner: port's owner
> >   * @peer: related usb2 and usb3 ports (share the same connector)
> >   * @connector: USB Type-C connector
> > + * @pwrseq: power sequencing descriptor for the port
> >   * @req: default pm qos request for hubs without port power control
> >   * @connect_type: port's connect type
> >   * @state: device state of the usb device attached to the port
> > @@ -104,6 +105,7 @@ struct usb_port {
> >       struct usb_dev_state *port_owner;
> >       struct usb_port *peer;
> >       struct typec_connector *connector;
> > +     struct pwrseq_desc *pwrseq;
> >       struct dev_pm_qos_request *req;
> >       enum usb_port_connect_type connect_type;
> >       enum usb_device_state state;
>
> The fact that hub.h uses struct pwrseq_desc indicates that it ought to
> #include <linux/pwrseq/consumer.h>, instead of making the .c files do
> so themselves.  Then you wouldn't have to add the #include lines to
> hub.c and port.c.

I couldn't tell if the existing pattern in this file was to include
the headers or not, as it's missing a whole bunch.

Regardless of whether this header file includes linux/pwrseq/consumer.h
or has a forward declaration or nothing, I think that if the .c files
use the API, then they should include the corresponding header file
directly.

> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..2d09037fee93 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,11 +7,14 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/cleanup.h>
>
> Why is this needed?

For the __free() in usb_hub_port_pwrseq_get() below:

    struct device_node *np __free(device_node) =3D NULL;


Thanks
ChenYu


> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> >  #include <linux/sysfs.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/component.h>
> >  #include <linux/usb/of.h>
> >
>
> Alan Stern
