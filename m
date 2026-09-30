Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F84A33EA
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765307; cv=pass; b=OrLsydSaFhdE5mcJWwdHrbrusGAwfwlBzHeMv4k+VDUyTPLQV4kBV2lx0VV7S9JcjyQjbJ7fU0Kqwme1zV2tSl8OxAKU5dPGONVpYwtYZ2DRBn2SFCUzYA5dj6VixT1j95kY6SkBMw2hI4KY7n8UJclSxzlUYungGyAXs6w8g9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765307; c=relaxed/simple;
	bh=Xq3N2ANyfb+Xloxo9AydxI9XEgKscgcw1LYegzbSXnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUACK1jtqaMCkQh3cLfjH91c8eg31GWKzmgFFRF4DgQnyW3O8du5Ul1ntomjXsicDgqtYGFvUhxH5Vgag2IxDm3SuGRmgET+Lp2GnRd/4OFRrCYWwRJkZXENeO/v5W45jszDKbV2h6AkajDUYVA7E8zWUvRhhMW1BU7WjfdHP2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsF8hbIW; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsF8hbIW"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b223602d7so1281465eec.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765294; cv=none;
        d=google.com; s=arc-20260327;
        b=I5zb1dvf/FipWIYIcqwQo0B1mlixppHLwMqWv9FJAzdS61VFrKGZk2ev9o4T50G45L
         5h4nfBBlmCCmDjkY8UVAfgv5B9XZYsYPfHle4OHajxisV1OGIQ0DwBa5On9JubsufAkv
         SxN2tkitP0pQQlP1K/TfaDvk+nPM3U+F9991VqNKN8OJLmMkvkjUwedq3+dR+9rFHSaB
         dzYkjEW8UpbjYIqfTvUQ22h7V2oQCXZbKXLdnw/IxH9BQyrXLJh9dQ4pxaypNmXO3iQY
         R7n25FgjszCOpQL5vDwlWzOi2DzpRUYpIFljpKibzKziPZxugMb3rc+TKVPRzoxIrwm0
         LOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        fh=Vf8kypoc3geZ9xH+8aebT0V1iwFivtFMCMWwvfa9SCI=;
        b=c0KWrT5LLXC8j6vjIX0QO2VhMLi/6B1btKFAKqZ8pkRaQ+S56UcU59KT2c7RMCJc+s
         d66TFzF7ynlhsaguZ/SH4sFgIKxOhg9lxi2Sko2u1wusoSAn5JDcZR+SHJNf1p3JMPqc
         woWJ9FsNVn6YnerprSWv0zdTkYEjSJJYB4U9Kg7gfXF5xD2YBFTSBknwsYKQgsW/IRHt
         g8rsrmzwf7N9pVoaiZg9pkKTrjBieiyo1fUfp36qW0EeIB0QdbD/ukRXf4E0jxqcwUE3
         6v7gZXSTjbLliqPblHWILicg07vs9hcpHu4Xpx4h/bZzOla5mS+CFO3yq5FIZ6ahSchq
         DRvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765294; x=1791370094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        b=TsF8hbIW1wCjRIaE1hxC8EltOeQXMMzpqgPXV2bU0nnvx+Tf/4GdlEB81RvTNXR/yS
         jEBvPXrQoQr5B0/f6jaMROpj2A8VS5iJzOh0/JBSGgyb5EUUeWr4fwC8IHY0OSgwK4GN
         UW98f6TS3At3O3F3UQhO4nyR269M3KuP0oeuk33UObOHvjXr4lMXTzXpJqhK2hW886iu
         RIubJ7BmIpqkclSK5yylILIyKeS9QX8AWbTmeU7wtxX0Xp62e6ZM1EqX6A0yrUqSXMoP
         5mTRmv9+rA2BPmzgbkPV0U36fAQZQQDRQKTAK+7bpvAUktlIIDpRSbdxWVfHOK4LKuzA
         RUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765294; x=1791370094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        b=d2/PQiZyGwENbXvZ+BWyWWXHVbb+w35z7AHAHszUgd/17ErBQNYc3kcnevzDacsdCg
         s7HrnL8YJEdtYswDlAzT9p+V2tnZAZghcs8/YvsJ7bHjU2gtOtUBvlbQqNIqdirBSLM3
         0DLK/eUGzhhGI8qFOR92B4qrTKRyl+4P9peJovNG5KGaIi41oawwzYymkCmoVEe4U0Nm
         dKZ/KGFBXKUXtQJFWs2YtaLs5U7OmFt1+YmceiMQOSO/bUeJkh0GQgR7KCsPgoXGO3is
         8YhJbUSi+kriW7BNThLKAAZQv2nbSDZ4aDRZJ/v0BNhv08w1vn6Vlak7LF4+soG7Hvs6
         AbVg==
X-Forwarded-Encrypted: i=1; AKwUvByxIVTywWvnMFmG6qUZ+zQC2w7KZWlwjmakWp59t38Hq0Y8q8MHBz3hXy/3S9/IaTcYXq7iXXhPSaKI@vger.kernel.org
X-Gm-Message-State: AFq9FYJWSukdXzP5cxG1g64orjdHBi+e7L8WiAmvLk1kcaEwWaYLCF3Y
	yT4/dFJMQudD/kFPYPF5hcaYu94JvJju4ENUvNI959CRqr3JI3a3HxL4Qnz/qwrYAMmEb0aGjPj
	Tvxf9FLXC6dK+SqowGJyYZQamy7Zx2Mc=
X-Gm-Gg: AYBFou0ksm+JwiGIt5i5mOnVEuaTCiFMgOYX1BiKnrxtuHaipthPtBbqKUyFKkXY4Xw
	g2ie5DC1CmBA/lVncLOCxAokg20ZE7cbhuTvqjzJk8c5kCdz1D6czvYOUvanUMWqNJNoXK7aqwc
	SILsJRDY2tgDT+c4I62RBL4ezT7KIwAu1x/95pnoDzxvABFd7vZiEnY5xuMC4nGLae9b/w0x9c4
	bqu1nWKJCaCBLpAPf7ziRnOAxT7syx/UH/VO1BZ0NpahyfZHaw++7wYKpsHLSpJLNpF6ME9rh4o
	LacIUDBbxBff4Fjadmg52tWgNkKYVqsYne6SzJnLsBzaG+NfPaDHznMY6OtqV2asu16qt6BsNxo
	3nfsBHulLNXg+
X-Received: by 2002:a05:7300:8296:b0:34b:7e89:997 with SMTP id
 5a478bee46e88-34cdd69689dmr1294076eec.38.1790765294291; Wed, 30 Sep 2026
 03:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-7-clamor95@gmail.com>
 <arzNgbx465QIKYdX@orome> <CAPVz0n2QdSWL8=KBXnsQQkdNEJ9m6HSQ0+6mJji_RHZ8QgXN-g@mail.gmail.com>
 <arzilGz4akKvRF1K@orome> <CAPVz0n0-baCzHOXjWLOCLjv8fb5GbE9a2v=8tBYr3RgHkEu+qg@mail.gmail.com>
 <arznE4HKl9r_mPX2@orome>
In-Reply-To: <arznE4HKl9r_mPX2@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:48:02 +0300
X-Gm-Features: AclHuK-qGc3Psoay8x3hInLmhZCMxpDiJ3bmtWhyIJMqMqR4y3RvUdbuIDV09gs
Message-ID: <CAPVz0n2A8oU_yRFQ_u_YkXSa5x7PtK8sYZ_p2P+GNcphq-bP-w@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/panel: Add Hitachi TX10D07VM0BAA and LG
 LH400WV3-SD04 MIPI DBI panel driver
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:43 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 01:34:19PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:23 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 12:08:41PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12=
:02 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > On Wed, Sep 30, 2026 at 10:05:35AM +0300, Svyatoslav Ryhel wrote:
> > > [...]
> > > > > > +static const struct of_device_id panel_dbi_of_match[] =3D {
> > > > > > +     { .compatible =3D "hit,tx10d07vm0baa", .data =3D (void *)=
PANEL_DBI_TX10D07VM0BAA },
> > > > > > +     { .compatible =3D "lg,lh400wv3-sd04", .data =3D (void *)P=
ANEL_DBI_LH400WV3 },
> > > > >
> > > > > Why the detour through that PANEL_DB_* enum? You could just pass =
the
> > > > > panel funcs pointers directly via .data here.
> > > > >
> > > >
> > > > Passing API/OPS via .data is discouraged.
> > >
> > > No it's not. We do it all the time.
> > >
> >
> > I have had some controversial experience with MFD, with passing cell
> > composition. If DRM subsystem allows this, I am more then happy to
> > pass panel ops directly.
> >
> > > > > Also, looking at the enable/disable sequences these are in fact t=
wo
> > > > > different drivers, with the only commonality being that they happ=
en to
> > > > > be used in the same device. Rolling them both into one driver see=
ms a
> > > > > bit odd.
> > > >
> > > > I did this to simplify maintainance. Both panels are used in the LG
> > > > Optimus 2X. My assumption is that LG switched one to another at som=
e
> > > > point, hence they share same timings, controls and supplies, but
> > > > differ in en/disable sequence. Additionally, these are the the only
> > > > DBI Type B-only panels in the kernel, from what I can see.
> > >
> > > That's just one more reason to put them into more of a generic driver=
,
> > > which would allow people to find it and extend/improve it as needed.
> > >
> >
> > This driver cannot be "generic". Both panels don't fall into any
> > category of being "generic". They are grouped solely cause they share
> > same timings, controls and supplies (only these 2 panels, other will
> > definitely differ) and are used in the same device. I have no problems
> > in splitting them into 2 distinct drivers.
>
> The driver can still be mostly generic. And I suspect that the panels
> might have different names for the supplies and controls as well, they
> just happen to match in schematics or sources that you used as reference
> because they are for the same device.
>
> My point is, you can keep a lot of boilerplate in a generic DBI driver
> and then parameterize the things that aren't the same across them. That
> gives you the best of both worlds.
>
> The reason why I objected is that you have a very specific name for the
> driver file and the second panel doesn't match that at all, so it's
> confusing.
>

Noted. I will split them to remove confusion. I assume that schema can
remain common.

IMHO creating a generic DBI Type B panel driver does not wort it,
especially since these panels are more like non-simple DSI panels and
always require a dedicated en/disable sequence.

> Thierry
