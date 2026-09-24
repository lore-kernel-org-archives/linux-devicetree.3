Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E9F34D389
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254811; cv=pass; b=uSyd+varrBH70IC/eL/nD0zRCWMl9hV7CY8lrVKVayj2cqNaXA9qgQf44XcxfoUVlrcBXHu14iQH+7rbeDLyy14YT3qROxfWl6SkKCT5Qrn1BZiNY5NUFUNPjNcG8ky3KIr+avFRK5TMY8pgGPRAVZc59r7uZDx7774qo+UmP68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254811; c=relaxed/simple;
	bh=Fft85CxVPSnz/lnplUZXgtIisv+sBJwICxGw7T+3TE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdx8AObQYyeBqdajPReZC0Kfi65+tTVB5cOGgy+MgnYz4jR/GfdND6SCNtJdp1QT2CbDktzV7K8nX++4l5mxOEwrCzxiiufkA/JE9M2b4jj7PiXodbDYlj+AmAILlE+9Cd6DDS5wwNExvoI6WDCL5UJA4+uu/GcV9D5WJRZwgC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UswVJq7k; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UswVJq7k"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso1276224f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790254807; cv=none;
        d=google.com; s=arc-20260327;
        b=YLwzmy7AKh74R/6tYFGSkCiV1K+IG71tdKU5i7XtVnPNygmTwQBr8zXuButxLUTc6B
         kT6qwkM9uMhmTEph2yLUNq5OBnf+7oKBvFXwlqpNGbT7miUIhLzSJQr+0/U1k/oeUPYu
         Sj5yHSgJOTuY0NmVtOXkcKrEuoDYRAHPmYOS9M8UfxL+x7OZiASMZvUPrA71hvNIRPMG
         h7h5quoODnNaZ4U9OQpGc9+pMZvqDgYwPRCRpb6loHrNZETRzvSj6jjRH9LYdyDs2o9i
         wOgmR3Nr05q4RvFekrKso54FKXoSknQtwQmCi5rPpJthNemofXVp12XpnPjT/yyyjHvV
         4QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7OSLVS9HvHJYI6SUB/JDf6BpBvGujsk4TT0HCcRv1qs=;
        fh=6gpS8JHmKB6FvB7kF4gH6UCDe167sp7gxOoc4gfdmXY=;
        b=pOGVse5awT6BQodNVYQekyVv9rVJgWQn7Vgx1R6pmzFZ5nRSqBz+bm3Mt0ZYpJutVb
         ULSa5ju/9oSfaNJ4cXXQ5m2kaHrGN61+WFW1EVwaxX1ocZc/k26lPFwgxroIzHPYrzFJ
         c7PKzfVLtvICy6Er0Iumyjz8xBt5E3E3SUmub/g0Sgx2p6f+lKCCQRqSQXKRR378eTci
         G5522f5hPuFUUV+fiUFnbNdDIGEdN9x1oUAZD0duSWK85cx6v67sbTf7vvc0tAOXSi/O
         6d/KjFDgK9nWA9fFWIRgt0eFAzbA3MhdPXE8hkfgye3BaZPM6es+zeimorxi4S6LbwC9
         0gvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790254807; x=1790859607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7OSLVS9HvHJYI6SUB/JDf6BpBvGujsk4TT0HCcRv1qs=;
        b=UswVJq7k8Rbd+kkGvAhOqweNCFxxyPDN06Tg5crj4CeRvm9VsyB7BRjrWXBHKMqAeP
         kz60tJhBLB5EkWrGjzOPbtD0XUT83zo5znxaTFc1K+GxMBBdmUhGcU5pxkmCyOtaCIcY
         DhGlcI03U0VLXuBSQ3/9vxHen/1jEqDuwusZ9DGJxUuygUcL7aTOD6rOl7ZS7YtPU7GT
         kW9VAPAyLNLYwdKV4DuzZPWVtiPKeP5DMz7MRG2qSSAMgSGvSEY44MSQYAnuhiAUArm7
         wFLALjasmTin8VFB/h+oDFRsbP5kPPLLt7zEOaUZSDqIt++95HH5i9zEcNfG1gqcfGfL
         O3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790254807; x=1790859607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OSLVS9HvHJYI6SUB/JDf6BpBvGujsk4TT0HCcRv1qs=;
        b=OVy2uhZ4u9TIAOjZHc0qFOciTo6J0XpLtszlDWPi4O+5xpOq6LYz6B2/okoLB+SX8x
         VgYDu/n58yAwz/WbMCld9Nvj6emXBcDGoKIQwM3Dz89+ZJ2PYbm7SZEB4g6UsiLqureT
         AZXJylCjKH9oAl9plTMxyZMf5CLrF05fFvPf7Deat/4D9OhzygV5ObdrsnMZMR3y8vy5
         IzNklH+28KuRG0G4H05XSPa29wISQb/ndS876oSl7Mzw2At4z4PcIku9t7W/Pe/BPwAx
         wATY52l0UJ4ICtREEZhJTtIGv7e+8deswP+UT+VqjrQQ5U/DXeIffLowzHEnnI9KeTgc
         8JHg==
X-Forwarded-Encrypted: i=1; AKwUvBzTmwUl/YGaCa1ad19u0CgDoSsHsVoGW5D1A9dkvQj9RFbBAPYYab0f0wypQz+HHBulOzAR8kDyoyqk@vger.kernel.org
X-Gm-Message-State: AFuF++nEMfJ6j/akiZSb9QmrMaEmwAY7akmrd8Q5qV8O8UG+yE7x6Wjw
	9I53xMUV1CihkVqp+6cACGd6/WmcoBWFW0tICpmD+OYTgelKHAR35snu7ouYWzmGYLYMP0pYmFl
	6Svk5yFMU75ZB/nfXe9W3fM0VPF623HE=
X-Gm-Gg: AYBFou0SYR902iI98zXwh9mql9BReNcI+75kJab9P2oSTXjHiNYcGvBUZVgKpqOr7g+
	xHGo8cpG3lXQ7B9cImnoxyIY2JY6TEnVVLs2jXSvpsSL2RtWWiS3PxuR+l+91fkXW9pAIlj4g2o
	35rXWCxeSstcz+gmHWL4p3Q2jFG9sQI5+2IBtDdscSML58HDghb8OaZPgliKR3s1h7BY4CM0D9V
	oNY/j+/ZGGEG0FeHJ0MvVG2ebJUjp9O1fCOxAu242Q6uht2BmS521kChEnDN5G2pdX22fwaDJ1V
	VHXeyDq3q0tyjgQNB56r5qwxMeOYVtHZL2f7JOe1Ztv1i7Y54ZJFxvVIQnutc22cDFlDBdwpbX7
	sc/ohfYgOBStOV2WPpq7eDsaObwfs04LPOm2cmDkTHgp++EWPxv0/kDaU9IsO7aRdurpMB/mdrL
	AqoqXT3bnM
X-Received: by 2002:a05:600d:486:20b0:49f:e8bf:221a with SMTP id
 5b1f17b1804b1-49fe8bf24fbmr20880375e9.22.1790254807252; Thu, 24 Sep 2026
 06:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <fb5f25b4-33e4-4cb1-b790-3fd078c61e5d@roeck-us.net>
In-Reply-To: <fb5f25b4-33e4-4cb1-b790-3fd078c61e5d@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Sep 2026 13:59:40 +0100
X-Gm-Features: AclHuK_mJiW_h0plHxsrZUqtTl9fiP-i-QY5tzFIt3qEf9WQXBFyizNrQLINkmc
Message-ID: <CA+V-a8vXd2pzw+e7GAoLTXPtSqTnij8mrT40D5zB09ToXvsqig@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] watchdog: rzv2h: Propagate WDTDCR access errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review.

On Wed, Sep 23, 2026 at 10:17=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Wed, Sep 23, 2026 at 11:40:50AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The WDTDCR helpers access the register directly using readl()/writel() =
and
> > therefore cannot report failures to their callers. WDTDCR is located in=
 a
> > shared syscon region and will be accessed through regmap in a subsequen=
t
> > change, where register accesses can fail.
> >
> > Make rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop()
> > return an error so their callers can propagate failures.
> >
> > Handle these errors in the watchdog start and stop paths and unwind the
> > resources acquired before the WDTDCR access, restoring the reset state.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v5->v6:
> > - No change
> >
> > v4->v5:
> > - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
> >   restart path.
> >
> > v2->v3:
> > - New patch, split from v2 patch #1 to make thing easier to review.
> > ---
> >  drivers/watchdog/rzv2h_wdt.c | 35 ++++++++++++++++++++++++++---------
> >  1 file changed, 26 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 9774fe8e441e..a65e5d6c48ad 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -87,18 +87,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *w=
dev)
> >       return 0;
> >  }
> >
> > -static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> > +static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> >  {
> >       u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> >
> >       writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> > +
> > +     return 0;
> >  }
> >
> > -static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> > +static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> >  {
> >       u32 reg =3D readl(priv->wdtdcr + WDTDCR);
> >
> >       writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> > +
> > +     return 0;
> >  }
> >
> >  static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> > @@ -148,8 +152,14 @@ static int rzv2h_wdt_start(struct watchdog_device =
*wdev)
> >       rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
> >                       WDTCR_RPES_0 | of_data->tops);
> >
> > -     if (priv->of_data->wdtdcr)
> > -             rzt2h_wdt_wdtdcr_count_start(priv);
> > +     if (priv->of_data->wdtdcr) {
> > +             ret =3D rzt2h_wdt_wdtdcr_count_start(priv);
> > +             if (ret) {
> > +                     reset_control_assert(priv->rstc);
>
> It seems to me this does way more than handling the error:
> it puts the module into reset and calls pm_runtime_put()
> on the parent. This is a substantial functional change
> that is not explained.
>
The intention was only to unwind what rzv2h_wdt_start() had already
done before the WDTDCR access (the runtime PM get and the reset
deassert), so that a failure would leave the module in the same state
as before the call. I agree this should have been explained, and that
it adds more churn than the change is worth.

> > +                     pm_runtime_put(wdev->parent);
> > +                     return ret;
> > +             }
> > +     }
> >
> >       /*
> >        * Down counting starts after writing the sequence 00h -> FFh to =
the
> > @@ -169,8 +179,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *=
wdev)
> >       if (ret)
> >               return ret;
> >
> > -     if (priv->of_data->wdtdcr)
> > -             rzt2h_wdt_wdtdcr_count_stop(priv);
> > +     if (priv->of_data->wdtdcr) {
> > +             ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> > +             if (ret) {
> > +                     reset_control_deassert(priv->rstc);
>
> Same here, and the logic behind taking the module out of reset
> in the stop function and putting it into reset in the start function
> isn't obvious to me.
>
Same reasoning as above.

> Frankly, I think it would be much better and risk fewer problems
> to just ignore the theoretic errors from the regmap functions.
>
Agreed. For the MMIO-backed regmap these accesses cannot fail in
practice, so in the next version I'll keep
rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop()
returning void, drop the error unwinding from the start/stop paths,
and ignore the return values of the regmap calls.

Cheers,
Prabhakar

> > +                     return ret;
> > +             }
> > +     }
> >
> >       pm_runtime_put_sync(wdev->parent);
> >
> > @@ -219,8 +234,10 @@ static int rzv2h_wdt_restart(struct watchdog_devic=
e *wdev,
> >       rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
> >                       WDTCR_RPES_75 | WDTCR_TOPS_1024);
> >
> > -     if (priv->of_data->wdtdcr)
> > +     if (priv->of_data->wdtdcr) {
> > +             /* best effort, ignore ret */
> >               rzt2h_wdt_wdtdcr_count_start(priv);
> > +     }
> >
> >       rzv2h_wdt_ping(wdev);
> >
> > @@ -251,11 +268,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_=
device *pdev,
> >       if (ret)
> >               return ret;
> >
> > -     rzt2h_wdt_wdtdcr_count_stop(priv);
> > +     ret =3D rzt2h_wdt_wdtdcr_count_stop(priv);
> >
> >       pm_runtime_put_sync(&pdev->dev);
> >
> > -     return 0;
> > +     return ret;
> >  }
> >
> >  static int rzv2h_wdt_probe(struct platform_device *pdev)
> > --
> > 2.55.0
> >
