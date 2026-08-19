Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0EA34AB1D
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150993; cv=none; b=FQTfo9eOMwYzRJ9+L9aGOcZdKvF6V/dz15leofa7Zqtc+a6F8Cfgv1prkXcj1rPSD+Bu+O0Qtu1CGtJQrqzvRGRTOsQqkI41mkUmWOoBEYEn6GPiVx32sZKNW4JPLUYcxIVz7JJDIxVYehXD4D4VbB76CSekKlQ8eRs5tScN9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150993; c=relaxed/simple;
	bh=lUHeqQmL7gVdIXIN2cytVerwPQk0FOEak+e9YnKPqVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WCU39R2I6TMR2C3OEzIVP59w6q9T1C7PQXJlvsq8kNhmKT8k7a0Rdq5t5eqH1FYPTKgxPzF7RltjbiH8D8roGBa/9EcbgdnZHp6qti3wxOu3Ylv59Ja/iXNFMmX8RLoRWLD0IXucow/8Q+8mcK1XjKTFbHXrLOWC/YsNgAlzFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4ZdgRYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4ZdgRYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633981F00A3A;
	Wed, 19 Aug 2026 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787150991;
	bh=pI6UKdIqtKWx6CrnCrPbUagt8cMwG5heMWjl/0IDcjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F4ZdgRYk981aRGoYGjeWYNqyTJROfWh1ECNBGlQWi82ZyrIGS5Fr1bGiHH/0FRKOc
	 MmWeS4L05AvETNOC514JQI3bmbVSQigeD49Wmtf4OYZZuTpZN9B6UXUoGVJwtEXASI
	 J3UeS/M/F5iyFnwSVLf3hPyYEJJr9VWEPCi7s2CJWrtVHXEcaFmZqmUneS3txCYwzc
	 J6UjyWgVZkxdYu22laJgS33GzjioimL9+7rBgP7i1N3X/FpzRH5coghPHJXru1CEej
	 /h2Gs8h2+zO4+C0QH2pjON2izH2CIL5tTimFF9QvtHd09I5Z8lueG0xT5x2iz5mkVI
	 v+l09Ug5s0jjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 14:49:51 +0000
Message-Id: <20260819144951.633981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Requesting an unsupported 3.3V power source for an I3C pin is si=
lently accepted and misconfigures the hardware to 1.8V.
--

--- Patch [5]: [PATCH v5 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support f=
or selecting the I3C power source ---
commit 0ea5cf7346d186b66e9a09433c5157725bc0936d
Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power sou=
rce

The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
pin controller provides a register to select between these two options.
Update the Renesas RZ/G2L pin controller driver to allow selecting the
I3C power source on RZ/G3S SoC.

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index bab7bd73a4328..41ca18aeeb0fa 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
[ ... ]
> @@ -463,6 +474,10 @@ struct rzg2l_pinctrl_ps_desc {
> =20
>  /* Keep the entries with .caps set in the first positions. */
>  static const struct rzg2l_pinctrl_ps_desc available_ps[] =3D {
> +	/* I3C I/O domain voltage 1.2V */
> +	RZG2L_PINCTRL_PS_DESC(1200, 1, PIN_CFG_IO_VMC_I3C, RZG2L_IOLH_IDX_NA),
> +	/* I3C I/O domain voltage 1.8V */
> +	RZG2L_PINCTRL_PS_DESC(1800, 0, PIN_CFG_IO_VMC_I3C, RZG2L_IOLH_IDX_NA),
>  	/* Ethernet I/O domain voltage 2.5V */
>  	RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH=
1,
>  			      RZG2L_IOLH_IDX_2V5),
>  	/* I/O domain voltage 1.8V */
>  	RZG2L_PINCTRL_PS_DESC(1800, 1, 0, RZG2L_IOLH_IDX_1V8),
>  	/* I/O domain voltage 3.3V */
>  	RZG2L_PINCTRL_PS_DESC(3300, 0, 0, RZG2L_IOLH_IDX_3V3),
>  };

[Severity: Medium]
If a device tree incorrectly requests a 3.3V power source for an I3C pin,
will this silently accept the configuration and set the hardware to 1.8V
instead of returning an error?

Looking at RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(), it treats entries
with .caps =3D=3D 0 as wildcards:

drivers/pinctrl/renesas/pinctrl-rzg2l.c:RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DES=
C_FUNC() {
	...
			if (available_ps[i].caps) {
				if (available_ps[i].caps & _caps) {
					desc =3D &available_ps[i];
					break;
				}
			} else {
				desc =3D &available_ps[i];
				break;
			}
	...
}

Since the 3.3V entry above has .caps =3D 0, it seems rzg2l_ps_to_desc() wou=
ld
match it for an I3C pin requesting 3300mV, returning pwr_reg_val =3D 0, whi=
ch
configures the hardware to 1.8V.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819143553.2478=
984-1-claudiu.beznea+renesas@tuxon.dev?part=3D5
