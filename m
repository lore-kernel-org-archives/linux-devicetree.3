Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059849;
	b=y3KpL2RkLhGQrqHyfeU4vZRArAVJERW+nhKhE8VLGx0kIzfUiVsl2LB0c4La3NHdg6DV
	 LK/mnmUEmpMEGsnIXxOnZCTyOp4fUPHe439L2QcjPlpCgCgbr6h4o0F5sKjjbcwiyovCT
	 hAfBw0HvdxHWbQ5Z1oUwImf+Cy9js943jCiM6/0RRaD/3HHt7+rIFdGGvgI+9N3rjTN4W
	 H8tTA96ywogaqg1AGPsSVmVvodvOwPxwMWhT5Fj/PVCgwoE3w3LRniCVxm7d6ryxElbxS
	 opd8D8mZtg87ZOmXF10Wb9MPgOVk1Y+53UQlfDfN0VoVWI8h/As+3TWneVdmH+ctKrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
	b=5HYLRCA6kUNVg3hhx3ibFwBiWeF/n/BoLzJFPlvhv/clkyj60GzrbDuDvsGL2aJnCN1E
	 ee+dS9zT6QqM8G4wnqr9DmPxYPI+f1qRshET36c6BXpowYXt/GKH24Z8EcxWU71MIj4VW
	 V8QPzULEnwpKVVv10XzrdIc31wbhn2C6v9qxrbgGxppu87pd1sri4fKI/LrP6JKWSNxAX
	 OdslJZzWpBAfIoYNvPvsyWiBelqI64+NLwEd2Cc4lbEDC8JrjqF2Vdgpo0rVJ6qJLlIhq
	 k4119Ql8wUYQxLfwllTnqw6LQlZIIEYoIJI2hJ3LS+WXpBcGiwwg666rUeR++0U/x7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb9bekSB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B20606A32C
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 13:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B20606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pb9bekSB
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so3519823eec.0
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 05:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059848; cv=none;
        d=google.com; s=arc-20260327;
        b=A+G51HlUuAl/7UvLU0fmQvvc1DKB3O0QiFhn/frwihc0/CEBagmlE/vvQgo7bEgFQU
         EZrWIoPYf+uL2xD2dxf6G0W/1VJwQR8durEr0CZJONtzm2Cslk2sGg9YE3ccmPgXBdt8
         Q4/ojV+VTvze/fzR4xOf6xPOMuvMBGSkU2XN65ehdd66wC5gjfutoDUHzP7RfNVEDxeS
         SYzmas4b//5P32kYGhcBUkdNtfGYQGChRhB8FIbUL8rx4+tZ+SKdWKySY7FXonaOJsZe
         cqA+LZ2BX4OlwN7+5S8DMR4h5dtCgXUsEvzRcoafto4QkUDvKpjmjF5QrjnfWYdghGvP
         0n8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        fh=CM1nF1L+h/B3taszGbQnmez36SIAon2ATgBWzXF9Kso=;
        b=EWOvrEVKe50EOq/7JFnw5F6VyjUJxdAOzPn4Cpu0dSpzxPZbkL9yrfrbyxc21jd8Kk
         Oh++wYJq25Q3bK2JMM0tqBMmdIgsNglGZ0eXLySR2wpbwUgzsOluhNM7wRAvbXKqpiok
         iixUM44T1o/XykzXP6QtTtPtYpTOjsSWyNEChsTOL9PNAO99G+Qmk+TkFlbEf2Rze3tW
         QD/iCItBqj/x8Sur/WRdLA0H3m4agv4KnHdRz+OkptDqrqz+7UE55fl0Yi2ouWcCfAan
         iT/vgVxGr1HSZv7GDjgxCceFI2JFhXY+z2KnDWhQHebBRYPQ4F7fB8RMGueyaqUSVw2X
         VxVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059848; x=1794664648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        b=pb9bekSBbz+xu2u0EigR2q569gXg9ukKx33kFt4Ckm3Ze/Mke9vrgStZOPNUbfCp//
         8wISeU9KpKnLtk7SRVkReTXDwKntNDrB9EBfDBBy/K9HoUzRM/vQDJmKs6vc4GAdUYZB
         LG5/wAbO7AYvecwG/xABv7okDo7BxsEXCypsQm0H1ooKr0O30BhaNjGm7B7UZVQj+FQ/
         AKWowHbO7VQGLhDk/f5MCkcR9jPutmrzLE/acJalzITiNL1NDSFwCcCKgdKlVN57gl9Y
         1OrSlEYoZp6q1j9fZzt7+8MJIjvYxr0mMPoSiFNp/4VSSZ1C5QCm7l2HvFxz48zAgdtn
         IblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059848; x=1794664648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSA+r/b6fLNfVPbuiPSfEtMn8tpkLL7ESyzDno+8izU=;
        b=H2NsFPW3yzRTvw9w8lpwK9HrswbYmGGqir5RK9kX/P1Q82q9O3QNGZ874wnHao/SWg
         35zrL0AOsDEzQztI4E1ugsiVqgWc5dD6tyjRqHsb9HdnoqflkdlQjP9lWhR9CKDXHVl9
         OFik/x+TdzkebHGAPbmrIJOQQbwI0OsLRWQDK5jBndC26wrXy7dacTIdGIu8o1CB/r/Y
         87Yu5xkdM+obtNNZkKBzk086fmEaM7/R/31rGFOUvt9+wVPnmsf7v9VvprHQ70W99uy5
         KXFfex7mTsaldiyTllDPkE3ZrjQ/33feqA2j2cMRe22HeEXyFS76F8vXs4wol2MGVsoC
         1aKw==
X-Forwarded-Encrypted: i=1; AKwUvBw8Qde58IjxEl8uKHso6Ic+6iRJzmE+kKC3NEhEPX6jdE7wDRGCTNudMN0CoMzACCvrXIqX9XsSSK9Q@vger.kernel.org
X-Gm-Message-State: APuU4Z8wkv72QSaEURyvzMUg0a5w25LJsjS8OLyfZSapqiCyvzFluiM5
	6igcXD5+UKxfVYts1qxZdIbPqyJO+tGJ7j4lGzexZ2TNAWd7VQawIBZLe6FPLltV38Q7IPt1TGZ
	SXWA4Ch5ZZQxZiyy1v7l9UV5869X6344=
X-Gm-Gg: AYBFou3RLHsRni5DcBB35VqQNm2Oyv0zf2ujAQd4XTvY38eCvMrLYzBTql5wwOe5xkG
	t4CrTCIuV7SXssWqR6IKkqBsX2Kgjkp8dfSiVBBJfH5Oj1hAfxXvqy223z0UBd+qkY1Z7LhFTdn
	kCKjwN1MGid9HKFwpV3JLBm9t6T+Her4TptFv3uPHDkKEDXLjvZgDSpJa35H66D7uG7Mj3y5DT5
	2KEaIiYQb3uAJ4Iq/LV/o0gMv1g6k5RQDKqSdEvDcsxL6Omtt+MENBhfEH95L3xCWHVowAngcda
	rfD97bEK0HmtsQ0hiQJIF458Bj8wUeNYX/A8JtLWKw7HG2wXaZkybi/Ov+KLPiRCiFJdSZUG7Dw
	2bRFlqICK5gNHsNrdDDv9U2WWFAgzQPv1wRR9n9VV9dcH1/Pt20FdFGU37ZW0nRQmGLBLvt6st+
	i+qUFkAorMKIdrqz5eVDY1M28WiFruGf33lLyQlEPYv07kjUJ4crs=
X-Received: by 2002:a05:7301:5044:b0:36d:4570:a32d with SMTP id
 5a478bee46e88-36f727d41ecmr8063214eec.2.1794059847565; Sat, 07 Nov 2026
 05:57:27 -0800 (PST)
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
 <au3TcHXFt5Yhs_V8@orome> <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>
 <au3w5Euhy-DyY5qQ@orome>
In-Reply-To: <au3w5Euhy-DyY5qQ@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 15:57:16 +0200
X-Gm-Features: AclHuK-rhOpUYmipYorAqU7OgtCn1M9P26bKqsgHA68BQBZ6wF3WXusKjqauthE
Message-ID: <CAPVz0n3JghP_XxiS22htU_uydhtzrTPKHJsJ4uR2iF12ogsXfw@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:26=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 04:00:45PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
5:19 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:02PM +0200, Svyatoslav Ryhel wrote:
> > > > Switch from a generic platform driver to a dedicated MIPI DBI drive=
r.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++------=
----
> > > >  1 file changed, 78 insertions(+), 89 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/=
drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > index 83c2af1be9755..d5d7ba2096608 100644
> > > > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <video/mipi_display.h>
> > > >
> > > >  #include <drm/drm_mipi_dbi.h>
> > > > +#include <drm/drm_mipi_dbi_bus.h>
> > > >  #include <drm/drm_modes.h>
> > > >  #include <drm/drm_of.h>
> > > >  #include <drm/drm_panel.h>
> > > > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_t=
x10d07vm0baa_supplies[] =3D {
> > > >
> > > >  struct hitachi_tx10d07vm0baa {
> > > >       struct drm_panel panel;
> > > > -     struct mipi_dbi *dbi;
> > > > +     struct mipi_dbi_device *dbi;
> > >
> > > It's somewhat difficult to exactly see the difference between mipi_db=
i
> > > and mipi_dbi_device. Maybe that should be explained better in the cov=
er
> > > letter of patch 1? Or the documentation added in patch1.
> > >
> >
> > It is already documented in detail in the drm_mipi_dbi.h
>
> That documents what the struct mipi_dbi is. I'm asking about the
> difference between mipi_dbi_device and mipi_dbi and mipi_dbi_dev. It's
> not clear to me why we have both mipi_dbi_device *and* mipi_dbi_dev,
> especially since they're very similarly named. People are going to
> easily confuse where to use which.
>

May anyone among DRM maintainers clarify if this explanation is
required? If yes, please point what and where I should add. Thank you.

> Thierry
