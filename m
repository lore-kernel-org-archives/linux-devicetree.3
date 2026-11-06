Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973658;
	b=AcKBS5ZZdUjMC4r/Isa9GFYQeuMYkSsC+x59ZkdhHY3XoJW7UzfAf9+zyyFzxa2wlY/Y
	 hvuCVPXNDeo9ykNetuZwb6mc/O3MLJfDqGGtg5GE4irpTWcOdXETbMpR/rkp7t/PiRHeH
	 Bh6fUKLaE6OeJuWZz5LFaUzJfPrLYQfuz1ilY6CWYNgjADZ0OpQ8D/BF5RWDnala8PEU/
	 hAOQ7l4VvsKrN30kj5eC2E0a7oTIUSw5YBt8lWR+WVGafal1DaeRKlqpBFkbVtYoOzoqc
	 YOcjzAamWmcxipIsTpSNy360caQZHfjjbep8DHsHXNhFc/COE+igEnSiYRvAcJ+BWeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
	b=oVsHEpfk86FAVZIOKykUWBgH6fZaHk5U4T8V7sjj2LIfBVcBSsrEEBSmT2gnr8p+0jew
	 SXBtReCV8jsBD9k/GJJZ5mHkltLKaZheldw75Bpd9//hXqCNMWxeBs9ig432LvDg9fx3m
	 rXUaha12E8HNkgRO1x1ra3b2pIeFdzD8jDWB+PCaBBkpJKgORoBjiFnP6821hUzFBQV3u
	 nsDpTZ1gtW1trhbKd4TTtaDMj/4Dki3GdIBhvXpdgPc3JOMgDPV7e1sV+p9v1uaByng4s
	 5rk8Ykn66g1Lu6bu6cKEURo+YlL1H+jlvicDC6GHm/nuP1dSf3yyGBs9IzRSeiC81Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6KMw97z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E0606A33D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8E0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6KMw97z
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso940799eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973657; cv=none;
        d=google.com; s=arc-20260327;
        b=WJAtwxw5tH9nOo2959vWC/GjdNyFnzK1qmZNgkPJWU7RX/RQ83z+w9LKeIOGRpjTKx
         zcxynmY4dimjDvVvzNKVeKCb7CT9Loipri3zcjeZPgkfbP2BSaIFeuZI8i5xOTv5rglx
         aew6ISQgA0Ezi1bR2YTB7KwEJXdFicnZ6iif+wFjcYDDYU8yBdCCDZRTaY16KVKRdYRK
         lPZpMIJ79QttcwArviJjXd4amOXYtGpnvuASv/uXtOcURM9/UsCNul4uG/59+0faiR5y
         CtwL4/72Bcoi/E7sxuju9+ZMs3vL/Cbc2F/VDseBlqxfjW3hsbxQu9xdZA8ju7fWLp+V
         Ljrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        fh=z5GOdMConJEN1+DxwVJ9DJwpXFRq6rl/od6u62Ry/XY=;
        b=OfA9vrb8mQlc/FKC3b4drKwYS9WGGJsorscur02Qr8TcgeNAa7AegedVHeMw4x2UnT
         g1V83cqyLWgYgN1u1yFye6QM+E2UAIEY1TOwfkrTGG5IuH9FcWQGOBAMbjUz+yuF2+8+
         rSvco5t9q1LRrOhFtHhOq+uQz5WzmylprGI0Hygq4my33qtN7hJMjSyvwE1LOpusQOBs
         0ViIvyTwa4EO3NhRxhC/++IaEg9gd7WYbzwwy68pzXaM/FKdwagdF6XRr2vkQeEkURq/
         oyBaUTxdFG9SZkvtDHjjaegGM9tTzWttdd5nBYJKceli+js+p9+N1XpagwMY2rljVfss
         Cppg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973657; x=1794578457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        b=X6KMw97zBJaLw9npQYgU+zPk0K55Bo5Binv+n7TNlrFsT2AIDpjJCw0Bs3eZJWBmZE
         AuDXQ9oIz5ILpGb5NnE+alzi7Cm0hhxrj0ujTu4uJRW9Cc9ZkwRw6Z0lgpkedPsfaU14
         JiiMFe4lRA7aKQWZIeaohEye7HoPjWY2m4Sk2TwQl+/anOOx3q7if9Pue4V/qcxQIZhc
         4wxHg6qZK9E39Nc6aqtzlsU7PqE2EC8I5wgAiQOm8etFopaFn1F1q3XOPTGMFYvf287y
         Jpym/YDs0EnBCTTjIBfIyKN9Js/qzq0oqqfI7k2I6Ivk5MG+erpAZCbmSdNdBRRPWOnr
         buFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973657; x=1794578457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        b=Y3ORoyWh/Scf1YWSIVpv990eI9xrqlj+1dUOwrhk3QcMDvSVIEbt1SwBl/o1p5Fiqz
         o5GY96SAyd1nlyexuGaG/qTmd0efheBO6MnvLmpjDz7k28wICdQD4veqSZ/eBf/4e3AZ
         L1nE8fDWtleRXrGe71jzpBUyyK4OjyhCWYK9RPaO5J2SxuNVrM9KDpfFMEtxMRSnlXdx
         eedT+DZFvXHNLcWJq45O/tbecEA8i9H8kZhPPxrLhJaeAy2vW0Ym7zULIs4RsUSnGdb7
         pQ6IvFEwseVwRClPNKRx7UrNSlJT193alUdZ2+GP2r2xCUFW8i5v4r70JR5TX/KynLca
         usSg==
X-Forwarded-Encrypted: i=1; AL+hErGivNFjhqonFcDcCjKCAjaKnoRLvCGbLTvc9Jv2Z/LVUrBCt6k1Rz7Nk/YbQoeWzlixpzyHfEPtrSp9@vger.kernel.org
X-Gm-Message-State: APuU4Z+0/yVPODxCSH0mtpizliEyNSITqc+bHHSC/6PJGlXj+m5tcyPB
	gZrTrESuHESsGJSCF04kGbbWMbUA4INCEDg4DDeDiGEAzaQB6ns8OgJ/0Vry7DSU4HeahiK8stT
	jW5EdV41tRfsRrb5nMGzgGvBRjbbbhRc=
X-Gm-Gg: AYBFou2OdQRxHfhvZ8o69mOZpaVa/UlDKSubZsFkJGcwG4mIh4rb9I+ABk6/peymsDD
	LxRbxjF4+B2e3cn9PlmnHd9GW0zVYqGJI2WVNidOs6ahrsOChqymDaZwQ+b/9L2esyknggnwe3J
	NWW2o8ctRzFIaQ3nMubt0IUgY2/oJPEp+Ibe23ElQyig1Xay12WCE/WRA5frAlH381+YXlbTUvo
	UBPcXmYcc0uuISRKqjj6ghTNGjSLnqIMQBLLxVNm4TyutzVfSM6Gkb6knXj6Cs4YzkT/o7XwOfN
	xQDXnzFrKE7Kd8ZCp5Qz1YRknmepDtPWIEm7+UrR+ho7ZNqhHYFrAIoOHBAae+lUm4k/EUWNqMH
	USLRDAORD4Q0DsR5xI0H8Zy8tnjG/3Sr4mqL894qdlLVQ+5hR/O+6cCucASRo7vPgsdNBMEGaoa
	wiLg/W6nzWKZznsXLEY2re6frsljONAQ==
X-Received: by 2002:a05:7301:c88:b0:36e:1fbe:357a with SMTP id
 5a478bee46e88-36f75443c1cmr3326733eec.13.1793973656931; Fri, 06 Nov 2026
 06:00:56 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-3-clamor95@gmail.com>
 <au3TcHXFt5Yhs_V8@orome>
In-Reply-To: <au3TcHXFt5Yhs_V8@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:00:45 +0200
X-Gm-Features: AclHuK_Yq17ZZfT-X8-aPL0HIpgqp80MKKwHsNn8Kpc_N4CDrvvxE70OSsxRMSo
Message-ID: <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:19=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:02PM +0200, Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++----------
> >  1 file changed, 78 insertions(+), 89 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > index 83c2af1be9755..d5d7ba2096608 100644
> > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > @@ -14,6 +14,7 @@
> >  #include <video/mipi_display.h>
> >
> >  #include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dbi_bus.h>
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d=
07vm0baa_supplies[] =3D {
> >
> >  struct hitachi_tx10d07vm0baa {
> >       struct drm_panel panel;
> > -     struct mipi_dbi *dbi;
> > +     struct mipi_dbi_device *dbi;
>
> It's somewhat difficult to exactly see the difference between mipi_dbi
> and mipi_dbi_device. Maybe that should be explained better in the cover
> letter of patch 1? Or the documentation added in patch1.
>

It is already documented in detail in the drm_mipi_dbi.h

> >
> >       struct regulator_bulk_data *supplies;
> >       struct gpio_desc *reset_gpio;
> > @@ -36,13 +37,12 @@ static inline struct hitachi_tx10d07vm0baa *to_hita=
chi_tx10d07vm0baa(struct drm_
> >       return container_of(panel, struct hitachi_tx10d07vm0baa, panel);
> >  }
> >
> > -#define panel_dbi_command(priv, cmd, seq...) \
> > +#define panel_dbi_command(dbidev, cmd, seq...) \
> >  ({ \
> >       const u8 d[] =3D { seq }; \
> > -     struct drm_panel *panel =3D &(priv)->panel; \
> > -     struct device *dev =3D panel->dev; \
> > +     struct device *dev =3D &(dbidev)->dev; \
> >       int ret; \
> > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SI=
ZE(d)); \
> >       if (ret) \
> >               dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> >       ret; \
> > @@ -54,10 +54,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_=
panel *panel)
> >       struct device *dev =3D panel->dev;
> >       int ret;
> >
> > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > -     if (!priv->dbi)
> > -             return -ENODEV;
> > -
> >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> >
> >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_su=
pplies), priv->supplies);
> > @@ -79,123 +75,116 @@ static int hitachi_tx10d07vm0baa_enable(struct dr=
m_panel *panel)
> >  {
> >       struct hitachi_tx10d07vm0baa *priv =3D to_hitachi_tx10d07vm0baa(p=
anel);
> >
> > -     panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x=
03, 0x1f);
> > -     panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x0=
3, 0x20,
> > +     panel_dbi_command(priv->dbi, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x0=
0, 0x03, 0x1f);
> > +     panel_dbi_command(priv->dbi, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00=
, 0x03, 0x20,
> >                         0x00, 0x00);
>
> The majority of the changes in this file are s/priv/priv->dbi/, so maybe
> just make it so that priv =3D priv->db and keep the changes to a minimum?
>

I will consider this.

> Thierry
