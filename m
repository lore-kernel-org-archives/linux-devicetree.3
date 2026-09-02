Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E952882AB
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 03:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788318304; cv=pass; b=NUto2Tv6p4SkEdmUx06edBWaxZSBYephJRyHqE6vCBleysV5wfmAFojw6vK6nFMc7M8yuGWHv4iUKZ7NQyunwPazgr7zDD26I59U4ttCC5JikaHtEp4XhoDzaQ2g+nGkL3aOM+Aez4R/+fPnItz3fi2+jAa6AZOF8/hvASxm8K4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788318304; c=relaxed/simple;
	bh=tKlFUl4gO64Nt8r+Br00nQwMqLEN+ESm9GrlMMPNTqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHsX9PNnWpzikLFTlG33OqdGOmTwHGvBV337TtouXZTiyB09ZF8wc7nU7MZn+ytw0iopV31SrfjPTdHlp4pDV2B71zUGIZtjR6nQAUM7gV4QoTo1lQPcgUuNYtYS6tH7dQwP59hnEXiqv2QexR29TECftQsNvNzYwCmu3GHpE4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9ZH6zSJ; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9ZH6zSJ"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b128dd0cb1so325538eaf.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 20:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788318300; cv=none;
        d=google.com; s=arc-20260327;
        b=Yx0Aom5dzqTMuUJaB4ZM1s5VSkMX2+kj5rP6p8Z+9cWPOjm21TQwz1j4I/YiIgTvhS
         wgoXs5YI3Zm4WglE3BXphMyedJC8/fWaC68+Pa+nolaixn+0LNvNmYIaSPCwWyk19Mw+
         mpipDN0k11QpuYmz9Wo5Q9R8gOtrHC0JtsuXDJ7zC8T1xZoq8zhdS99RMKNzHGOdepRP
         ZhGW0hGAqcSBZcwpJQE0ajgt+RggYYtn7AwOUnYeyvYM0PWmSbnH3Ye4ij3GjZDKZl0Y
         c8ANqdsrpJgT/KuL4CgLTEpHRiD81V4nQK0po/5gCWRxQwYGsfaBrlKtHG1KerM/pbGK
         CrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHsS7SbgSrvO8RKwHoQeoMibGdls6Is6EtcCRwB7f3o=;
        fh=uGVgQ+ej06DnHhRfgMsjyQWkofWVlPjPqRvOzth/Hjc=;
        b=sfQsd1yOGycToOE/Az+g6p4X+1qpV5Jo1xZ/vV0ONyBGIGIrJoDTdjnIgAKqJXqluY
         rFukFbw/+DA9IYwyZC1f3R3oXKJSBYLV4yljahkbsn+brVrivU1l7VTrF5UCiGs0pMTn
         ibr59FShqTLIVtSlNk8qH/DI7qlk0nrqcUFJ/XQFsQjqN02CR1yWb1fjbQsg0kYUaZuR
         jFxxpueHdK/swXzKFRh/i/5TG/4C1DKTGKSMlF9INBTf6an7rctQbSAKXYl6TDRdaqH/
         W05hpEtXGONLesjZZvQPCr2D5O+BuStWAnQjAjrFR4228/o/GezaNrsjz0oJO4+562wO
         3ZLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788318300; x=1788923100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHsS7SbgSrvO8RKwHoQeoMibGdls6Is6EtcCRwB7f3o=;
        b=N9ZH6zSJgNaybLGiwil7uk/6iZR8azlt786fvE1Whe3x3ia4qYUyqrKoaYagWOv4k7
         J3GGGFjIduze698hR3sLOAXled4Lio0C6rK10Gx8ZwRLIGOdoiylo08gp6GQdZYoDGaf
         jMiayf1tor1I4NQyziEJV59RuLuzz45KdQXJumYaZ58xTG2sb5YUae8Zimh/8UNU8Izm
         +XjWSTuLqhUSE22WYSPpBqW7/i2YmIUVCHH9/7hKFN7l84WGi9qwoa9RLj6bvnIKuQPW
         nXU/E0c0JccxP2YOKzR3YLdOj3b0x5Gq5S7vE75Y/7T004Kmp//AOgjFmT4kXUQYmXgM
         GE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788318300; x=1788923100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHsS7SbgSrvO8RKwHoQeoMibGdls6Is6EtcCRwB7f3o=;
        b=SpplJR+PStp/92SiPwLxkT3m9pPDcyN6+Kc9Sgsc2Nr4oEBxWQTyZ12jCfrr7riwDV
         m7nTilTW8MvkcVDshO+WamyZOyGmJolpAITl/qm568/6HULewpTLGGcomVj3qRaNL++r
         U+EBQJuRw2n7rE+773DotbrRHtFV7lMLJvL/8rof6dclR3po65xb0wwmKp0dBPw6zSML
         dy6nYAJwPlVHvKO1jGcMhyGfe38gfrtplKCIEwr4WeWuA2ZXZ1DsBGT3YBHKy8fbSSVY
         tgngUZWqgWrucnAvna/0CEoVn7FcBfMuAGNl8LcfK95n7plE+FQta/5fzuLUJ3iwodZK
         crGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeKMRUD4DHDVaRQCe+1IQF1owXZN9soVXwAmZBU9fYuYpPerx9wSIRtwTxkccwPKpmYIi5mthpIkcy@vger.kernel.org
X-Gm-Message-State: AFuF++nlBcZSsi7FMZK4hVxMbYSeCB3eIvWK/wvWGoHqdwTJ3Jr1Ae7k
	rsKycrDIw7wSMFz1bNLQ4/4rehYDjD28CMbiC2BQsGUfMAZL6EMw2BFLTkS0q3k0LTDKIgqJjua
	7sIujrTL+gGdgzhkMt7iaeGc28jmBI5o=
X-Gm-Gg: AR+sD11x0Lrh27utXULat2fzg2+wM4cn4CeB28Ff3XEMOgFMOJ2ZkZV3UeNpPsVpHx9
	9OgnmOHcDVOYqXJdy0jiefsWuJYCnrsPkJhnmbgT2ObszkOk773hC3VuASlYKuSiYOxXEo4TLzI
	SLUFAaFMCJd7lla5tajFnlClzixI0fypJ1GGQ0XRHUlgCc16AaBpG5uPMPnGXAjPkpbtpos4dEx
	jA+7JXsWR3Eo1nmZiNaepm/YRqpat8EMe3UBgxm/E7sw3GhPL//S+7fNfhvPn1ZHm1n8BqFsIJn
	q3oPSqw5Op57UuEo5P3dFdLAqcIJulH4BVVUrt0qFKg5M9/MInk7TFN6YdSpJ6V5if88ml4TMng
	wzE3+YuckhI//zIJH+Q==
X-Received: by 2002:a05:6820:810:b0:6b1:a667:f0f5 with SMTP id
 006d021491bc7-6b47e0b1e95mr1246806eaf.20.1788318299846; Tue, 01 Sep 2026
 20:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831044818.4103477-1-mmyangfl@gmail.com> <20260831044818.4103477-5-mmyangfl@gmail.com>
 <20260901175618.28d81bd6@kernel.org>
In-Reply-To: <20260901175618.28d81bd6@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Wed, 2 Sep 2026 11:04:22 +0800
X-Gm-Features: AcwNN1X2ftXlE08zeXRlOv05TQkIJ2IrYAQHyYXEutFuNo5QfdhKFQNOaMCGn_0
Message-ID: <CAAXyoMOQf8oK3Z_TQKDmLvCQmgAjUR29VnFSFi+np4RtNNw_bg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 4/5] net: dsa: motorcomm: Add LED support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:56=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
> > @@ -4225,6 +4224,15 @@ static int yt921x_edata_read(struct yt921x_priv =
*priv, u8 addr, u8 *valp)
> >       return yt921x_edata_read_cont(priv, addr, valp);
> >  }
> >
> > +static void yt921x_dsa_teardown(struct dsa_switch *ds)
> > +{
> > +     struct yt921x_priv *priv =3D to_yt921x_priv(ds);
> > +
> > +#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
> > +     yt921x_leds_remove(priv);
> > +#endif
> > +}
> > +
>
> [Severity: Medium]
>
> Can removing the LEDs only from the DSA teardown callback leave the LED
> class devices registered after the port netdevs have been freed?
>
> net/dsa/dsa.c tears the tree down in this order:
>
> dsa_tree_teardown()
>     dsa_tree_teardown_ports()
>         dsa_port_teardown()
>             dsa_user_destroy(dp->user);   /* ends in free_netdev() */
>             dp->user =3D NULL;
>     dsa_tree_teardown_switches()
>         dsa_switch_teardown()
>             ds->ops->teardown(ds)        /* yt921x_leds_remove() */
>
> So between free_netdev() and the dp->user =3D NULL assignment, dp->user i=
s a
> dangling pointer while the LEDs are still registered and reachable from
> sysfs.
>
> yt921x_cled_hw_control_get_device() reads dp->user / dp->conduit with no
> rtnl_lock, no RCU and takes no reference:
>
>         if (dsa_port_is_user(dp))
>                 return !dp->user ? NULL : &dp->user->dev;
>
> and ledtrig-netdev dereferences the returned device immediately, with
> dev_name() in netdev_trig_activate() and to_net_dev() in
> validate_net_dev().
>
> Would an "echo netdev > /sys/class/leds/<led>/trigger" racing with switch
> unbind, or with the dsa_tree_setup() error path, touch a freed
> net_device here? Would removing the LEDs per port before the netdevs go
> away, or validating dp->user under rtnl_lock, avoid that?
>
> > @@ -4581,6 +4589,12 @@ static int yt921x_dsa_setup(struct dsa_switch *d=
s)
> >       if (res)
> >               return res;
> >
> > +#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
> > +     res =3D yt921x_leds_setup(priv);
> > +     if (res)
> > +             dev_warn(dev, "Failed to setup LEDs: %d\n", res);
> > +#endif
> > +

Just a question: I don't see any protection against this in other DSA
led drivers, like mv88e6 or qca8k.

> [Severity: Low]
>
> Can this dev_warn() ever be reached? yt921x_leds_setup() in leds.c ends
> with an unconditional return 0 and drops the result of
> yt921x_leds_setup_port():
>
>         dsa_switch_for_each_port(dp, ds) {
>                 ...
>                 yt921x_leds_setup_port(priv, port);
>                 /* Allow partial configuration: LEDs are optional */
>         }
>
>         return 0;
>
> yt921x_leds_setup_port() in turn discards every yt921x_led_setup() return
> value, so the -EINVAL it produces for port >=3D YT921X_LED_PORT_NUM is al=
so
> thrown away.
>
> Should the error be propagated, or should this branch in yt921x_dsa_setup=
()
> be dropped?

Intended, explained in the response for the previous version.

> [Severity: Low]
>
> Is yt921x_led_trigger_get() intended to be the inverse of
> yt921x_led_trigger_set()?
>
> TRIGGER_NETDEV_LINK is encoded as the union of the two duplex masks, and
> this read-back loop ORs in the flags of every entry whose mask bits are a=
ll
> set, with no early break. yt921x_led_trigger_set() instead matches the LI=
NK
> entry first and breaks once the flags are consumed.
>
> So a LED programmed with only BIT(TRIGGER_NETDEV_LINK) appears to read ba=
ck
> as LINK | HALF_DUPLEX | FULL_DUPLEX. ledtrig-netdev keeps that value as t=
he
> trigger state at activation:
>
>         rc =3D led_cdev->hw_control_get(led_cdev, &mode);
>         if (!rc)
>                 trigger_data->mode =3D mode;
>
> Would /sys/class/leds/<led>/half_duplex and full_duplex then report 1 eve=
n
> though only link indication was requested?

Yes.

> > +     if (group >=3D YT921X_LED_GROUP_NUM) {
> > +             dev_err(dev, "Invalid LED reg %u for port %d\n", group, p=
ort);
> > +             return -EINVAL;
> > +     }
>
> [Severity: Low]
>
> This isn't a bug, but the device tree contract introduced here (a per-por=
t
> leds child node, a per-LED reg in 0..2, LEDs only on ports below
> YT921X_LED_PORT_NUM) is not described in
> Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml by this
> commit.
>
> The follow-on patch in the same series, "dt-bindings: net: dsa: yt921x: A=
dd
> LEDs definition example", adds the description text and a worked leds
> example, so this is only a question about ordering within the series.
>
> What the schema still does not express is a maximum for reg, so a device
> tree with led@3 validates cleanly and is rejected only at probe time by t=
he
> dev_err() above. Would adding that constraint to the binding be worthwhil=
e?

I don't see a good notation to impose the constraint (from sibling DSA
bindings).

> > +int yt921x_leds_setup(struct yt921x_priv *priv)
> > +{
> > +     struct dsa_switch *ds =3D &priv->ds;
> > +     struct dsa_port *dp;
> > +
> > +     /* LEDs are always enabled. There is no way to disable them altog=
ether
> > +      * (as far as I know).
> > +      */
>
> [Severity: Low]
>
> This isn't a bug, just a question about scope: the driver programs only t=
he
> per-port registers (YT921X_LED0/1/2_PORTn) and YT921X_LED_PAR_INV, and
> never reads YT921X_LED_CTRL, YT921X_LED_PAR_PORTS or the parallel/serial
> mapping registers declared in leds.h.
>
> As far as I can tell that is fine, since yt921x_dsa_setup() runs
> yt921x_chip_reset() (which writes YT921X_RST_HW, described in the code as
> almost the same as a GPIO hard reset) before yt921x_leds_setup(), so the
> LED block is back at the parallel mode plus 1:1 mapping default that the
> commit message names.
>
> Is a check of YT921X_LED_CTRL_MODE_M worth adding anyway, or is the reset
> considered sufficient?

Reset is sufficient.
