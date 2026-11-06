Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973684;
	b=43dab9v/7CkGCldnyqPYEWioFBsKDxkyTkWamhacUDXJlmY8MsA4btHuQm0zonvOSH2f
	 C9vORK6Nw5dfdcXLE9Z2/jgRGhvemqDJib7SiXYmRwpgXv3iR/EV5qEbl2Tm545+4e1I/
	 HmjiaonFd2/Ex+oflLPVxhwP858qknINt9RxyMOqb8EJhNI9AQY/P8VQks/9FhV+22QxI
	 WTTmHHxQ0o17o8GbVkxV4DuoFH9iYDQgP5vKLX3roCKpbF6Zx3eZSVZxWwtQTtbfxSJY8
	 rCnpNkNFlrDlJHyrQPu3S4UhES/U5oaecwOmE233RFYBxwaPEbQCHHWOfB8GlW2EIvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
	b=2/lNzKPWf4UncfDxSrTcZhQFNrFj0qSm+9bmv/r1FOgvPkrkaR0PdmcIwMhD23OdHYEb
	 WIVAB+UqhqmlVWOuScSZPjnyiICgGJpG3dru+56wPjOCmB0PWPUEW4tCMBmOCXKTyK1QC
	 /GdBLjSMGas+bPIe5MSyU1Wv6b1z46Z9XZH231HjqxC7qU6xy6tU0LK7ow9choN6QSDal
	 gTZ/uh5rkhFPg8O5dUWt8SHC0L8zJWHIvaE/pPE7RxqcAz7mzgQ3/izHAXlFTY9vnzNfd
	 37MfYst2nT4zCYCFr4IGIfZr84oQLmUr1ire2yyUQ98+Hseo8pJYU0MGegSqNR22Gkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL4eyxbM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C33606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C33606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL4eyxbM
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2091290eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 06:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973683; cv=none;
        d=google.com; s=arc-20260327;
        b=WkLOkNa/1wy55cqu6nE+BW2kpkjYrF5ZrEW6NWN/QGcsOlqxfpx53ngOI86ofMQqdg
         fgQYQV5QNHxC7PPkudJxaTeCh6QBybs0S2qptM7wxTGcJzVQeGfIy25nlv0U7e7uiGAS
         Qmd2pUd1rqU9nY7xryeiFQ1wJmwdrUEl54gnMgWtSTKTXmNAMwAFN6VBiZbdZEicbH0h
         a5+LJff/tWxd4ngdJSfUDs1yxVUYBnAnp9XJuAD+oUGVZSpdKgpcdidHv8SOdvdfHxBG
         I0nDMvyoykWEgnka93FojAhYdBGMl8ORGSkI/cys8h1qTIaAXHs243V7lC43oFkxbgwe
         p1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        fh=k4RtKcAHO4+oXdscsA+fdEI/OA/2maf0tb4/oEuCYFs=;
        b=dbiZuXsCQM77/jDJhl/MJJ+5zESMIseXKdPZFWND01JprP7hHjGu6fdUOVGaoiUNeo
         Xxxw6YQ5Pi1jJn9+U/461IGBNzxyYjWYvX1PSJ9gz8a813z2LTSXKqupJZHhueWdNW7d
         HQ3vSKxv8Hug6XLLY8Xv+LAhR43Tn5ptd9mD5bNbcwhrROi+k2mfqZSOMtO2eM4+pzhF
         6Os/T6GXpq/i85zWboBhm9dIoYyiqi97RIXj4trXW0sUYqXkKQTS37hLjJfiw6ZzpAe8
         tMYcvciFGPNKILgzv4hUhPUvtFTiaofDKOr656GSjIGLD/wtqfWFDbnK3aeOszTz4io/
         r7yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973683; x=1794578483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        b=AL4eyxbM6ObsEeaa/2gazaSA6gok3iVwFeDJ35E8/pILPVLYgobruozBObA/E0Ggq5
         hgif8S8hZbEx6Bf3cNzY1Tf49lnz6zSVH2vYhKsCcXtuROB4SwwgNXynTcRx1UY8rXWs
         ZT8iGvsq1xD8mxC7xx7CJk9mXQ/QVDZpVdFxRcVhb+An9UbIfIHTryosu7EUoC55bce3
         UABoSch8O7ZkCBkxTYU07zOzKyzE/1uizzOd+nMoCH9YBaHJhPaz4lbnc9U/Cwo5LzJH
         NCF0QgV9ITR92fjzJdEuhrtNdzwbNBDNocuomHgP4b8dlaY3ZJocLbuZQpKtLwsdKCjt
         dOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973683; x=1794578483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXw7NOr17pjMQ7VC9050ylNljX4Kxe1Gs6cyljUb+Z8=;
        b=BDnRgSxCOU2TuQwxqlKIror3RR19VwKRnY8IPI3GtTvC/v0b9tGFQcC5QT9i4EQ3tI
         yKvsggc0gQAUlSWsKaf00R4pN0wmOmPcXhBAK7+Qd8kNZhKVFtTxJc/6pLM2CKoiAPHb
         2+pcclrF/myiVJg8PDwVOM+zOLhwcpca4lZ7aleGYvXKcmmwrh16YP8esjGaov0/qfZo
         kOkqi58kj4Itwbp//zRZ3b03FsAKqiHq0i/abyvEc8A6Tu0xdytklHgPTnL4KL25HrO8
         vryhnK7ys1FYA8peYReWe1AHo1hyd3YVnckePreRFLND9EElLDAQpSQih4TUBdE6Uh3D
         G+lw==
X-Forwarded-Encrypted: i=1; AL+hErGzOmT4NfNl+zGSHH7h7PY32JnRMvGqiKv6HLu3wHEUb5tbbulo+stkI/clv5jS8Kg2KwyyqBRSXhA1@vger.kernel.org
X-Gm-Message-State: APuU4Z+NRIuG+AoOYKZe2BDVmZZnW5zAAwMMjkIu0UU9FEO0W3ylyw/H
	vYqN21cdEv2+Nuvn6bDPnJjsbtPI+fkWepjW2ZCbQnmbpYcKgUarnnneg+KHjCidVUHFrE3Ex8r
	cJ0wYMcQDAapeg8sEbyshFoGZMerUji0=
X-Gm-Gg: AYBFou1+BA97mbyia0R7DgfRVdFdLZxTr2m2WlTmGxTQnr8S6FhjvCVBL0SorEjosQY
	n43Fv5VyXUX25+5ky/ZwlaFcpcgWbIEJftxNDv/9XLifQuKVD7Ak1bbXchP/CXMgcfrPljbC0Lt
	/MB575WCAYkBirPB4FTFWDVts5s0S20qi0st6poxxG9P+2BfkjUWp0gpS7kDGz1F3Bl/SS19QUp
	6WgZ+uloJ3/7oGi6BVNrPoytVySvyZFz3Wc9mXU4OeVlvQDyM5W/x95/RalK/8KvRiV2B6tUFDw
	U9AoLUPnGKGaqf+BvXXnG1EI6c3TDJCQRxQAy+hJ3ILUxPTZg3Hx/qyxjAkgFPswJlIGg0Q9WtE
	+7ihImZ+HXkx3PmA4yxUEuy3d5NbC+uKjj0HNakk6PteH4N6Dg7l+t4jPeatNH9Np41kgsLZE22
	iCoDGN8idfNWTjVRnp20ON3DTTGib0lg==
X-Received: by 2002:a05:693c:26cc:b0:36a:3005:aa65 with SMTP id
 5a478bee46e88-36f7611ec47mr2929151eec.15.1793973682246; Fri, 06 Nov 2026
 06:01:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-4-clamor95@gmail.com>
 <au3UDDpLUmeIOwEH@orome>
In-Reply-To: <au3UDDpLUmeIOwEH@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:01:10 +0200
X-Gm-Features: AclHuK-xODZ4BK6vgyhpVlnU3a_5DM9XqVLo8nBuS_cQ27Qs1NsbBJmpnu-OR1w
Message-ID: <CAPVz0n04Cuz8d+8m07oMVBpLGwcfVyMDu=uv=_U2zjoFVpfULQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] drm/panel: Convert LG LH400WV3-SD04 to use MIPI
 DBI bus
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

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:23=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:03PM +0200, Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 103 ++++++++++------------
> >  1 file changed, 46 insertions(+), 57 deletions(-)
>
> Same comments as for the previous patch.
>
> > diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/dr=
m/panel/panel-lg-lh400wv3.c
> [...]
> > -#define panel_dbi_command(priv, cmd, seq...) \
> > +#define panel_dbi_command(dbidev, cmd, seq...) \
>
> This probably also applied to the previous patch, but there seems to be
> no reason for this change and the related changes below.
>
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
> [...]
> > @@ -177,14 +166,13 @@ static int lg_lh400wv3_get_modes(struct drm_panel=
 *panel,
> >  static const struct drm_panel_funcs lg_lh400wv3_panel_funcs =3D {
> >       .prepare =3D lg_lh400wv3_prepare,
> >       .enable =3D lg_lh400wv3_enable,
> > -     .disable =3D lg_lh400wv3_disable,
> >       .unprepare =3D lg_lh400wv3_unprepare,
> >       .get_modes =3D lg_lh400wv3_get_modes,
> >  };
>
> It's not obvious, and also not documented, why .disable is removed.
>

Noted

> Thierry
