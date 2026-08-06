Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE12424D58
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054890; cv=none; b=cDtR9F0hTGoANTnYbWTgH1lSHNBJb9Ni527xs2xMcCLj41rMa2ja3SxU4uh9IqFHcc/xUsqYHfrry6orgEfHZ90W59HZH5Qm+tTFt/E3J7H9JGB/xVTA0ErWTAeqL6qw3rv6MpFvSqu3YBsSU/7rxlFXCLQXHJtjjybHJ4qMHY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054890; c=relaxed/simple;
	bh=ZMnUZnSpImvTPdPVj7DDzNKzkrXounpi/76O7iZ1oHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BUJVRgOI1FgacNaJPXB/73Kz8poklF+X9Pc34pC5CVNKWxQ2dgb0PyvSWJ8hgv51Q+7dunplxQiBIJfwkR/QrKXP1ofo65A9iRfCAKMc2v9sQtxZUtVIXfNbtsAVH7mta7/a3BH4Hq4UU1KakOfZ9IKkuPyPHCZQsxrwZr9Urr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkvL/amL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkvL/amL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FA51F000E9;
	Thu,  6 Aug 2026 22:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054888;
	bh=3yW/3eTvi4tU7NdqvF3Dvf5ePEcdEJCXnYBfVPCcgCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QkvL/amLkkuaylg8uqwbtKU3tOHsuJH8kLz5LVjZTsDTVLd/ybSwsLYehRJA6F8zy
	 gVBzbVGsjCntBifAkYqZ70fKanjGOrIriqVUYJUG8WWI4X/VQB+FCJKENQvHQ8o9um
	 RrzHLeoiC97BTg+OZB77o42ceYQdooIlU50xgEZC6cKmL5i0kWtLZMWUDaA/U3tV1B
	 yXILaM4x0KBBiEOchW/4YIY731GxpuVKeugoXvlYG3kAZQ5Eh7HhwyIPdRMysD9sFU
	 VuSxyslhoTgQtZPutnRLQql9by/Sr+4GCcIY3bhsrgQyR1uaWajntM3Euu/d2k6nLs
	 ymjMQn3++oSTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 13/37] pinctrl: airoha: fix AN7583 MDIO pin mux
 config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806220615.4078303-14-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-14-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:21:28 +0000
Message-Id: <20260806222128.80FA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced `mdio1` pin group is orphaned, unmapped to any=
 multiplexing function, and redundant since its pins are already covered by=
 the `i2c1` group.
--

--- Patch [13]: [PATCH v11 13/37] pinctrl: airoha: fix AN7583 MDIO pin mux =
config ---
commit a5b09e70184114d2a027b043ce8c8831ef4960fb
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

pinctrl: airoha: fix AN7583 MDIO pin mux config

This commit corrects the pin numbers and register masks for the AN7583 MDIO
mux configuration. It updates the MDIO pin array to use pins 53 and 54, and
modifies the function group to clear the correct hardware initialization bi=
ts.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 7de07d002d05f..6dff1d01f4b51 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -724,7 +724,8 @@ static const int an7583_pon_tod_1pps_pins[] =3D { 32 =
};
[ ... ]
>  static const int an7583_sipo_rclk_pins[] =3D { 34, 35, 33 };
> -static const int an7583_mdio_pins[] =3D { 43, 44 };
> +static const int an7583_mdio_pins[] =3D { 53, 54 };
> +static const int an7583_mdio1_pins[] =3D { 43, 44 };

[Severity: Low]
This isn't a bug, but is this new mdio1 pin array necessary? Pins 43 and 44
are already covered by the i2c1 group.

>  static const int an7583_uart2_pins[] =3D { 34, 35 };

[ ... ]

> @@ -809,6 +810,7 @@ static const struct pingroup an7583_pinctrl_groups[] =
=3D {
>  	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
>  	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
>  	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
> +	PINCTRL_PIN_GROUP("mdio1", an7583_mdio1),

[Severity: Low]
Does this new group need to be mapped to a multiplexing function?=20

It appears to be orphaned since it is registered here but never added to any
function group mapping arrays, making it unrequestable by the pinmux
framework.

>  	PINCTRL_PIN_GROUP("uart2", an7583_uart2),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D13
