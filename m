Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7067A3D669B
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307359; cv=pass; b=ItubWrdWE0kStgoVZqRaA0+KnS/Zz6DY8RtNJkLPBnXtBt9bHcgH+uxNDYHkUX7S/rXYZoUcmCLTYquYZKQkoUbpFaW1Nem8ww6IQNjLdXgaHvafvofbJ1qVUqjxzgr2Tqb7dLK3csTeI5R3SkoQYpDyqAwhneAAlPl8/buwqAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307359; c=relaxed/simple;
	bh=BgtaVTkKYB9i7M+jdhZZfelgFvXF+mEulzCdgRhnacw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVDxwJQMaQHQQNWbb8wnaLKTl4uGCD5k7Z+A68GDBjCv9TMqcCDac6PYYroLC2H7K2E9LetJptRaJlZS9z+gZIelYRQGEpydeOKwCEDHFTYqY3GNDYWsB3wTyP+VhX5I1EyRBP6vaeeE4Ki0mh2X4js/waKaKjnvGyzWn+CZnkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8pR8M2G; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8pR8M2G"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-977310532a7so2084440241.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786307356; cv=none;
        d=google.com; s=arc-20260327;
        b=I7L1ohU1hzNmW+2RkUuLz02WJZbr4KK5Dq7m3Oe3M6DdTHVUJXuVDDTf2fcXgxngPX
         9yo9F5ATz2R/5eUtz/3eEdf8dNRWL6Jgkc4VR1Rly/6OBhxZrTeLhooNNKqtsjoXhC47
         WCyJToSNICRvvi0k8uEilM1OGtkZvlOUU2VRbzWXrTgsIZV1KZ++s+o9tMzyKA6VlWr2
         qqriupj9/mRf2zDYhcGHBcGHVVgu6mx6kSAyMtcDTaM/QbLmX0rt1tZo2ca4DidiCERI
         olkeueHS+EIzGCxFH++wXEBewr056/+o/X//1LUQK9slBQx79kyJOQzK8+3WfIpLxtNA
         h0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lqI6t42BdKQforakdSoj5zqucwIqAbx3+vYL6ZUGAQM=;
        fh=zDjpBidq0v7XbQHIKJuYABem3K4/slNNmulM3dlV/ok=;
        b=pelunkDfUBnQEx/89J9HWLr3R4IqaSXmf/cUrNosE6nN7DpAz3PgUCiJFlELaIuJOK
         KILZAN2nJwLJWMn5pKrLXee+uiqROGIbPcVThI1eGg7DaE6oZeoTQIJSmYbPH/uhZJjG
         5yKJyus6V2wmnE/nxO6f7pNTilp3cqvvN9KGtoCM8+bS/NnkNbymmc5qcqZVg0VHRjTE
         V7m+JVRgcqXnWg25+al4aIzSsu4sv5Qro/Cf33yJU3dBWSNNLAcFDdHQfwqKfOHDIX4j
         HVLvR7qznkLwB4eMyn1hzhvIWkZnCDncVNnffFwuraNRoFsNpGlPYGQzcTSJhTP2u/9l
         a7NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307356; x=1786912156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lqI6t42BdKQforakdSoj5zqucwIqAbx3+vYL6ZUGAQM=;
        b=P8pR8M2GzkfqiNcOrnUOpyo+yUDKKv+PcJucB/WPnHKJtvq4ctBed5uxHBu/Mk2yEb
         D4aLCurw7h/AtBCp2RoTyaM9p8xuPGEjS3bPkH6pp6Oc3VWQWxEqEcn6yYb1xVvtRz2o
         bdiD+yC/e72WKb6u4ByIeQDmoj8zrYDULCGZY4cTDhZuM5v5xnb9q4A+UgMM9W/7gAy5
         CeKe+uWdoKe+clslVugUHlugMiNqXK3KVGPiYyKMmoZuhCPlf1ARSgjvGAAGycJTKV/h
         5PVSMMRWSNRSXSrjX8IiHiNsaArnMG5/DMyemtNaPJGtEkr/2P9a4/Pxg1ZzgeLiO62f
         C4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307356; x=1786912156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqI6t42BdKQforakdSoj5zqucwIqAbx3+vYL6ZUGAQM=;
        b=akiPJ9EC0e2zvm7ywKL7dZZL5AvszS74y5wBShDRCflRP7lrhhyVOWnvUR8p287iQv
         KuuS4Pu2Um5XMyeO/2/CTlS1v52YxVH6oyzin2pQnbLC5Wcq93ieMODd46dep5xZ0H3D
         5n38DA029ukT89gP0CsJSxd5Ya/xClQJEvjFLVHjB0HK/1x7na/A8g6JsLXjZtG/Rq1H
         xX9RpiO+tfUfONIOnIFv87Hf2V0Cx9ZaDT5jXnwB56hg2UQdHLZE5F23UK4gglDAFWFl
         QIHPgZEzpX0v8DzkRwgwvdC9H7hoEKd0yDL8ovfZjFjwbxKd7AbtVJQ8t7zsHKCRHxXv
         yriQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7zH8goRlKsWUob+zVJNUDNgCq2V1SdiClxZRwDgdGECqOnp7UmBIgqijtVlDu63jN6TCcy9sLdRzC@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXIDyLTUEKfaxw3MUg2VLCVPP+158bGp9xss6DGh54AgASdlQ
	MKAEynsZ874Y5+i9pFVFrH2Jv7qJjLvcsfzstP8R6CnQXAbHvqBOpxhey9GVQkIWEoMChys8ytZ
	ztIhIio1VeOy2XA2nyNnGLZdbt7mfch8=
X-Gm-Gg: AR+sD13CTpKjFvt9poNlX1t4HFex/i5y6xMhg2Xt9Lr7VFHD7PkJDsjgafJod9E5QKH
	mQED39r+Ztqa/dlrcZupaYxo2HFzDRO9Puh/rdvNk/jNP2/I1g2R3747Im9x269i7kMZRwGOPLU
	l74zuS3rPZhgtxd8jpdBWBU0k4hFM/0y6IlXP0T3WUFdnjhOqVIW/IaYj31KgGgAz3FCOAxZ0G5
	InAs5u/QUUyIdmqZ4/0gtNgJq+TrcJDFXcrf+augUAlBOlgKnPyc0/wCvpYhB0d/C0jBKP/12cN
	P/NikOjxfkA0Iag5ZxmKr/S7u+j1wBuAgImyxuQA0lpPWKrmyW3UEc+ppqkOk73vHjIaCERVp3X
	orzkSMx6UVQw6mAY4iqY7fFaGXibHuIjC2wlg0hKNrZmipCb2ptAQORS0oUgNsEw3pYskDCR1Rj
	ma1hRX9O3bFJ4PP+BrglwXWob657F+ohsiijIfbA==
X-Received: by 2002:a05:6102:1510:b0:738:89ca:65a0 with SMTP id
 ada2fe7eead31-765213c1716mr1391331137.9.1786307356117; Sun, 09 Aug 2026
 13:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-4-9bf2f7441632@gmail.com> <c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.ch>
In-Reply-To: <c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 9 Aug 2026 14:29:04 -0600
X-Gm-Features: AUfX_myH4wks2-Q5Fk66AAdiXlKqq3NVL2fkKURJiEoPFq00IVVGviYpLv4QDTk
Message-ID: <CADvTj4q0=aBf=V=rXyKeVcR1ZZtBsTkkDZ58qLLbhkunsCzpKw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] net: phy: add X-Powers AC200/AC300 EPHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 9:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Aug 06, 2026 at 10:51:29PM -0600, James Hilliard wrote:
> > The AC200 and AC300 contain compatible Fast Ethernet link PHYs, but the
> > link endpoint is inaccessible until package-specific control registers
> > have powered and configured it.
> >
> > Add one PHY driver which binds the link child and joins its parent
> > Ethernet PHY package. Fixed package compatibles select the correspondin=
g
> > backend. The generic ACx00 compatible reads one packed configuration fi=
eld
> > and selects the backend before touching backend-specific resources. The
> > AC300 path therefore does not resolve or enable the candidate AC200 I2C
> > device.
> >
> > AC200 obtains the regmap of the referenced I2C MFD and keeps it bound
> > with a device link. If CONFIG_OF_DYNAMIC is available
>
> Please drop all the CONFIG_OF_DYNAMIC code.

Removed in v5.

>
> >  drivers/net/phy/Kconfig               |  11 +
> >  drivers/net/phy/Makefile              |   3 +
> >  drivers/net/phy/xpowers-acx00-ac200.c | 388 ++++++++++++++++++++++++
> >  drivers/net/phy/xpowers-acx00-ac300.c | 404 +++++++++++++++++++++++++
> >  drivers/net/phy/xpowers-acx00-main.c  | 536 ++++++++++++++++++++++++++=
++++++++
> >  drivers/net/phy/xpowers-acx00.h       |  28 ++
>
> Since there are 4 files, i would suggest a subdirectory.

Moved to xpowers subdirectory in v5.

>
> > +struct ac200_ephy_ctl {
> > +     struct acx00_ephy_control control;
> > +     struct regmap *regmap;
> > +     struct device *dev;
> > +     struct mutex lock; /* Serializes power sequencing and state. */
> > +     u16 ephy_ctl;
>
> What is this locking against?

In v2, the AC200 backend was a separate control device. The PHY driver
obtained its callback table from the supplier and invoked power,
interface, and LED operations from probe, reset, PM, and LED paths. The
control driver could independently invoke power_off() from its remove
and shutdown callbacks.

The mutex therefore serialized calls crossing those two driver
lifecycles. It prevented, for example, supplier shutdown from running
power_off() halfway through a PHY power_on() sequence, and protected
cached state such as powered, phy_addr, interface, and LED
configuration. The device link protected lifetime and removal ordering,
but did not serialize every callback.

When v3 removed the standalone control devices and made each backend
private to its PHY instance, that second entry domain disappeared. The
mutex then became an unnecessary carryover through v3/v4 and has been
removed in v5.

>
> > +     client =3D of_find_i2c_device_by_node(ac200_node);
> > +     of_node_put(ac200_node);
> > +     if (!client) {
> > +             ret =3D IS_ENABLED(CONFIG_I2C) ? -EPROBE_DEFER : -ENODEV;
> > +             return ERR_PTR(dev_err_probe(dev, ret,
> > +                                          "AC200 device is not registe=
red\n"));
> > +     }
> > +
> > +     if (!device_link_add(dev, &client->dev,
> > +                          DL_FLAG_AUTOREMOVE_CONSUMER)) {
> > +             ret =3D dev_err_probe(dev, -EINVAL,
> > +                                 "failed to link AC200 device\n");
> > +             goto out_put_client;
> > +     }
> > +
> > +     if (!device_trylock(&client->dev)) {
> > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> > +                                 "AC200 driver is not ready\n");
> > +             goto out_put_client;
> > +     }
> > +
> > +     if (device_is_bound(&client->dev))
> > +             priv->regmap =3D dev_get_regmap(&client->dev, NULL);
> > +     device_unlock(&client->dev);
> > +     if (!priv->regmap) {
> > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> > +                                 "AC200 driver is not ready\n");
> > +             goto out_error;
> > +     }
>
> Please take a look at syscon, and syscon_regmap_lookup_by_phandle().
> I think it will make this code a lot simpler.

That does simplify the consumer. I have converted the AC200 path to use
syscon in v5. The AC200 I2C driver creates its paged regmap as before and
publishes it for the AC200 OF node. The PHY resolves x-powers,ac200
with syscon_regmap_lookup_by_phandle(), so the device_trylock(),
device_is_bound() and dev_get_regmap() sequence is gone. The lookup
returns -EPROBE_DEFER until the provider has published its regmap.

Since this is an I2C-backed regmap rather than a generic MMIO syscon, and
the AC200 driver can be unbound, I added managed registration for
externally created syscon regmaps. It removes the syscon entry before
devres releases the regmap, avoiding a stale global entry after provider
removal.

The PHY still resolves the I2C device to establish a device link and
obtain the chip-wide input clock. The device link provides supplier
lifetime and teardown ordering; syscon is now used for the regmap lookup.

>
>     Andrew
>
> ---
> pw-bot: cr
