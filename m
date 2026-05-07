Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12E31618B
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171168; cv=pass; b=dtHDM2TrmpdSn66yVZC5lV1oqtMcCQ0gpxUGzxOAQkr/LKb7K+Lo+eHjJ92VeUR1CC3fMst61AOdKj8XiKGED3FAr7CaUzNXxNUdatcU7uGkEnxQNb60dKfxj3ZJu9B3Aq8PaaeL0RyQRB1mZdGkH+gWSO0bmU2+ClGYqs5Vjno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171168; c=relaxed/simple;
	bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBlU//VU4ooqCEbA5aSQC19iH9/E+a7oo0OG/3yJtnxv9yCrxQkymvlkgrI923s9iWgi6Ipp5/F1IqL8/cMmnmKCADeS+wnsYgjpvF45Fv6GHyUBJMhrbwxvGiw7XBwCIGlUaIisXPkp5tSLCHrsB7wGNb5PzRkP0xJFLam9F7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWhRo7nl; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWhRo7nl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso10908595e9.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 09:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778171165; cv=none;
        d=google.com; s=arc-20240605;
        b=fUL27u/Z1PXyRheD0pyBGAJey4hPy27UYSTS5Wrx0OXRvzvxAlnCfzLV0NrcF770d4
         IPjctE30iRx0fr2CEX+zLuHuMeibeqsUsPmNGCH/uxobfZlDME/2IyXWHYCaSRltSb5e
         BCDJIA696ld0z2dayIKGg6cBzwbs35Z5ZZBUrjO6qVXujuY3ujKvdhFny89Tu82N9+w3
         ZRqFCCgpswnVSsB4pg/iU8gqjpIpnnaYeXmBcUK9w7HSxp5ttsXtqpWI4ZNdEEjJ/pgV
         X1F1lGSVIj4cIzQ2L2FHvhUNGAZRTaYpuC41V/YU6uvHaNi2Bs30ZjMJDpzrjL3omP6z
         ccEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
        fh=YnKjtJbGTRiMprLeF9QjlS9dliUBDdctwaNjLch7Egw=;
        b=crqxTgiCmmEyjooCEgRWMRll+0q4gW0OhV67CPIRyO0XLA+YD1hjms0dHoRv4GsZET
         iici0T2n2nvGZon+A+IZym9T49IhQ4yUTqmmLXNx7/0vaLySh7h00I/7Q+XQvENPnDB7
         mA3C0D3ktYaIG60FG5p7LuzfoU+equXQQj3ij6Qa67iuMueeAjCihSIORXXjpMUkUF6p
         9KL4RcvG8IxyG03UcPCPizezOD5d707ngU9HEDmtVHNKqfNVOG05B5dVO15qssOnj9LJ
         d0GSQw8tnhC5kXfkIidxlPa69hNe0CdT4TtXTiLvX8W4WZLNGM0FqQWCnZGGlkV2mAkQ
         d+pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778171165; x=1778775965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
        b=QWhRo7nlanh63aQrdcptKhtbqHChOXNiWce4lgF4p9EiJSmvaecbBMtLoqKFJpg36q
         sWbShc0OX1O+GqbdildFa7tp4SSlvx6pdqu/JpAXfsuK7oYsGa3xRmUt5Lyx2OJdEHaM
         jsTfUOUK9gkruraxaQSHPO0KYLu6jeAQxOwb2nIeaI4iTeXbJg3duv8I2jXuaI/Pvgqp
         kchZlOSZpROSp60T1dUh1cKpFizG5oxBxMK7U6Fdb/d0ciO06QuVawBuLmtUMtF0z7io
         yFz42IAOigasD2ewr+fQ4soZ2CVY3Q2yNMqye9YuQRSIaT5Hb+G6ZAKhOU7so9i9C7bW
         njzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171165; x=1778775965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Int/Ioom6uDImBPOoRcQOfqmGnwZxp9cr18IQ5rmQ0A=;
        b=EpRLkUJrsKAosyyZARsEWmFA9yD/yQn154oIVboTGhv4AZUkesJPLKc8VOSA43s0sd
         uBQLzt9oImptXB+kt8hZVtek2Myt3Nkd0h/Y7YXVKByOjsOz9mJDQ37RirZ5WvTss4/2
         MP3xUh4S83y5WoYjfIFLqbgVdUnn2KKH4scg5wEwIlE9Co/rv56CYJaPC+uEBBLpIZ+c
         sfWJkg0+CSwJZNBjCt21sogjMvK4FRQBnfaC43iraJxBBeTP/EKXvTImYTyb0h4MeGbB
         vKHnn+aXm11a/upsQqAKTR/f8rAjSpG80rIWbHh2tC+qAFbWqA5tT298hnc9V/HCaILz
         6QMA==
X-Forwarded-Encrypted: i=1; AFNElJ89zZ4kF/n7clBeDtq09IsDkuDcQ9+69ryrN3H7VgZl8tF+igvX0mlJaSMwSoIvCbgxV5Nx6m7SFIy2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+StHtCjTuNP4JMZ/ES5BLwTZ7JkFGNpgRrY2nYW7xY2+2s0p
	exDY6mVuzPBCJY7GcAS8HcI9kyYjvi16viog9S5RuJLuRwjvjy7uCifI6hmn42f1OZJq+L0O6LI
	Q3xzoDyscg14FgKzI5A7xG3r5jMqB0MU=
X-Gm-Gg: AeBDiev51ZGwGwcRMKfN8d/AGyCAiA3QOBU1zvEMCgdnm1xBjpFCVIArSyWdNWIY+L5
	y0E9Iptn104jSj4z07Usooi5cUlBf+o1e2OfRQGAuBqLqeLQIjdaBjku+RQkkFcrZUneFkx9ZtS
	XRnauCEEu+XASoS5Zb1H+Hx0kspic6bmey9gHu53EGTrdDWuB0wHh11hjP5STILbBjoMQk+Sdv9
	tgnHPNmhaX6PkNcTZTYMzi8PG5dGk370rQye1wGqXy70y6GwcOO9ePl9y4FJl8WndcdPkVX+7wk
	O8ajdlViyQyC6tnKaF3Xbmsj4iVyz7Vrq2p1Qim28zRS5NxuHBfu7AfIi0+5axQOW8LTqbdxV+1
	NqHr2
X-Received: by 2002:a05:600c:3548:b0:48a:7aad:4425 with SMTP id
 5b1f17b1804b1-48e51e097fcmr139299195e9.3.1778171165189; Thu, 07 May 2026
 09:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260429170012.366537-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260506200826.GB1652535@killaraus.ideasonboard.com>
In-Reply-To: <20260506200826.GB1652535@killaraus.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:25:38 +0100
X-Gm-Features: AVHnY4J0DaxPufqdFXqftS14umWBtVlA89V6qUT2eHHlB5Fn79fAtb5gBsvy_HQ
Message-ID: <CA+V-a8vKuDzJ-ZCZFohDm2nTur4wvnQEQnZsZc0OUaJh=MwVSA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm: renesas: rz-du: Make DU reset control optional
 for RZ/T2H support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Wed, May 6, 2026 at 9:08=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 29, 2026 at 06:00:10PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the DU CRTC initialisation to request the reset control using
> > devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block d=
oes
> > not expose a reset line, and treating the reset as mandatory prevents t=
he
> > driver from probing on those platforms.
>
> This assume a device tree compliant with the bindings. In case of a
> non-compliant device tree on platforms other than RZ/T2H, the driver may
> silently fail to work as it won't complain about the lack of reset. I
> think that's acceptable, as the reset should be specified in the SoC's
> .dtsi. If if was the responsibility of board DT authors I would be a bit
> more concerned.
>
I agree. Since the reset is expected to be defined in the SoC-level
.dtsi and dtbs checks do complain if it is missed.

Cheers,
Prabhakar
