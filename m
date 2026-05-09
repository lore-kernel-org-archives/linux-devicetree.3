Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68522F8EBB
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328913; cv=pass; b=Xy5vUTKuNoE1tJL9LCAkjgNgQh6iGJtVvCguo8GeZSWin8hwlvcD6YHcXZi/C9h4DRFPfppcw+PYC5LCVZ95N/IPzwJ/BlIh/ymsclxgppszH09HP781C2wOtupGqyT9EiJ20Oyjcn9bO/i4qXGiQh9fQqXLS4QYZHFi8KHwsvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328913; c=relaxed/simple;
	bh=Itow17MzFukEt7ifHoaNsv4OPf3Ma4//CA5gLqy5YGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiRceKsXNdLZVcGHB/zdh38R2GqReNm+i4vWTFio1TXkyQ9l+a0apOjILtm0Miyl4zjgjnW9PB2HgP/tuOSgiq99uZdsJrJg46A/5ltSQ8/fvFOxRTwI3pXs9FIS1QMtrQ3sZeApqyFYEz+ahA1QB/eSFMDnqwZPBfhFIUo0vQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=AdW+ySo6; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="AdW+ySo6"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so3543655a12.3
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 05:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778328910; cv=none;
        d=google.com; s=arc-20240605;
        b=damUi0JgbCgf0DxD2zEE3DmFNKtml+ZwLcCsJnypa6lw+ou0/mfWU6Vnso4oLfJSFu
         XupADkXkIBkyIe8YrfOckEfSrnauIZ2XLhn2pJNlRryRFi9KI9QU96TeTnKJT4g3z8SN
         fHIIohtOYR6qk3fxDrdOVWyO7p6RH+/YGdbzcpc+NDDb9ak706CmKNnmgnYsfwguL2e9
         wH9qwi5uqY79MIUW0Z7w1O9dBPmUz6JiHSsblRwhsfVJrkDKSkC0MT18Gr8vDzsA8eYn
         ugYsNTPybCsrXE97jwG4g09lkalXVTr5sRAehn46tnZGImGjGqm5qJwmVDC6uVzS36qh
         Fhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Re63cumpinwgUi7Va5ZJHXAsgWoRotUfZvlC8g9cGW8=;
        fh=rwWsinKRqKevEkPzd4i13P7rEWsbqyCc8VrK1PLZK7o=;
        b=SnFjfsDBNYqByAzz0K5QqF1APuAutYlK3MeoaL1FEAl+hI4Ut86+zWXlV7wreS3Hgx
         mF+MTzl0G7VvB4FSqQ0b/mW5OHGSjwu3MXPqpjdP82HAYkipCmCYaw8xQsk4KSxy6d8W
         3YbYyI+B4krpJ+unIU+/oLiittzUdSjryzK2Ddrhpd+z/SGIhJ8Yollwq/aVdPv7jZlK
         7OEa6Eh7Rn9lteIe7Rr5+u0PFNqRsWodysYda26oRGSXSib6PTKTG4kvkmFvdWZ1Ikey
         547kPlbA5v1uSO8+iKqm4lr8zDdhbZ/V8tjmuu20+SixNIvC7fQ7sLuTFu6UP2MPxndC
         Vkdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778328910; x=1778933710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Re63cumpinwgUi7Va5ZJHXAsgWoRotUfZvlC8g9cGW8=;
        b=AdW+ySo6HUerOTjee6cOpeRICaSESANsZNgZH32ncr2XC+TqWSC45lYYzJzo03yXc6
         t8MsFCK7kuhjXfBtFdCJh7MnNTMdRv8FQAnBNDncc2e4YNnR1Vm5lZyj5i49P69tVK4x
         H1CYTtzFAxCl8tR4txYRBbHRdn9Dzrtl72lMucHE3aVm+ahyCnP8m+qqT84U1Od3VdPB
         jQ3guH6o56tRKT8MFLKIGuYWkRTzOuAJ84jN5dF3zUY10J3eB0lhS+eo96u68bN+FUAm
         f7pWgMz/3qg1IMYjNKZEkmgIMWWKbzUw8Pd+Hf2tWA+8tqpKGwnRJ3YByCfrociYtxUz
         ULRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778328910; x=1778933710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Re63cumpinwgUi7Va5ZJHXAsgWoRotUfZvlC8g9cGW8=;
        b=GIXl2IsQfKosWJmevyL58dgsnr04yQouFe8jZw2Akyw7sw+Xz//JXmaWIpTBXbr8q5
         ER7PgQoJr0UKuZOYgv+FMVPpqvHE8Pwfo0JiLGEt4TrV4geIDTY6no06EweoX5b+lnCw
         SfbaOSyxjZz9v9AhVB5LwtY5zx3cbKCD0R+7PvVppF562ZTcXdgtEv1oaf4bAd8t65WA
         oA90b6+zNLHZkNPAc8oAWEA9IuQGXJgWtjRZSmvpqqAS1HJSym7fPHpdmZZh0hff73gD
         uaP+xxAZ6oV1q9USyRy9B2AJfCjrdekbiM6eZAj+0EUI7bpXE/ewlJdGMiUj4q0Anq2C
         LJrg==
X-Forwarded-Encrypted: i=1; AFNElJ80suJX5GICrC9XGS4WvPZbzTHqKp8S1y3IMod3GaUL0sAGKfn2d9SZ5MPKhs7BGr9qd4oQ6eq1tg0k@vger.kernel.org
X-Gm-Message-State: AOJu0YwppCzEzn/EAKvLlJHWk+2f9lgsN5Iw7Sfp/Q2KrBYakyRYfWkI
	E0MUwnnuS+ApBjyUBR6hOH0IP2cCBrdTAnpF6M2bB+g6tNK6BS0GUqTFoHfUCJPz8BgFYSxURb2
	vQVrbu5Umq9h7Sh7d3rNSWrlkaBfy0eVk9qj8xBIeLw==
X-Gm-Gg: Acq92OF5jpII7tDOrlUdTO9DYzJwXOhzRzRKryvPwHdDeiZ7EKBLpp2T85nQGx6tBKS
	SWM+6jg7PiD4pJdVlFL2WHD97ecl0ZrSACk81L4BVaasXjh/o4oLjJTjwewoFY8H1VEGtBXPEhQ
	SRFQ1nJyZSDR1gifJoWr2G3TJvuKJiW4+/AaFPC6IXoIzEzpuGLgnN126hgDSOXOwrk+5rLA59c
	vKBsSqeywZ9qyNxugxTVD76Ydq/JKyRMMaC6f9ahh2LVEihVx+9loIKjx6bdoDkz6AJqdSgR/p9
	OoxWI6Ol4SGurlK5Au87D035pd9pv1+4Fc5oxK31/73posi9DNu1FjQ0rNM8WA==
X-Received: by 2002:a05:6402:28c5:b0:672:c169:606a with SMTP id
 4fb4d7f45d1cf-67f718d8069mr970288a12.23.1778328909636; Sat, 09 May 2026
 05:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507104720.262641-1-robert.marko@sartura.hr>
 <20260507104720.262641-2-robert.marko@sartura.hr> <af3RiyMRM56b3DJM@pengutronix.de>
In-Reply-To: <af3RiyMRM56b3DJM@pengutronix.de>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sat, 9 May 2026 14:14:58 +0200
X-Gm-Features: AVHnY4LMl0Qq0M5DdTOnDlRqvm30Pk81M5SDvEFE3NF8fMkUdJxNh9fk2GhKd4A
Message-ID: <CA+HBbNFwL+BsOoVpP4zTS14W2aZweiM1=52L8FTXxCBaiAGqXw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: pse-pd: pd692x0: support disabling
 disable ports GPIO
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kory.maincent@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 2:06=E2=80=AFPM Oleksij Rempel <o.rempel@pengutronix=
.de> wrote:
>
> On Thu, May 07, 2026 at 12:46:55PM +0200, Robert Marko wrote:
> > Microchip PSE controllers have a dedicated disable ports input that lik=
e it
> > name says disables PoE on all ports.
> >
> > So lets support parsing that GPIO and using the GPIO flags to set it to
> > output high by default and enable PoE on all ports during probe.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/net/pse-pd/pd692x0.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.=
c
> > index 44cf9f97be67..670656abd16f 100644
> > --- a/drivers/net/pse-pd/pd692x0.c
> > +++ b/drivers/net/pse-pd/pd692x0.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <linux/delay.h>
> >  #include <linux/firmware.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -1781,6 +1782,7 @@ static int pd692x0_i2c_probe(struct i2c_client *c=
lient)
> >       static const char * const regulators[] =3D { "vdd", "vdda" };
> >       struct pd692x0_msg msg, buf =3D {0}, zero =3D {0};
> >       struct device *dev =3D &client->dev;
> > +     struct gpio_desc *disable_ports;
> >       struct pd692x0_msg_ver ver;
> >       struct pd692x0_priv *priv;
> >       struct fw_upload *fwl;
> > @@ -1808,6 +1810,11 @@ static int pd692x0_i2c_probe(struct i2c_client *=
client)
> >       priv->client =3D client;
> >       i2c_set_clientdata(client, priv);
> >
> > +     disable_ports =3D devm_gpiod_get_optional(dev, "disable-ports", G=
PIOD_OUT_HIGH);
>
> I guess this signal is active low. Since gpio framework operates with
> logical values, more natural would be here to use GPIOD_OUT_LOW to
> signal that disable-ports mode is disabled. And in the devicetree use
> GPIO_ACTIVE_LOW.

Yeah, you are correct, the signal is active LOW, I will update to your
suggestion in v2.

Regards,
Robert
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
