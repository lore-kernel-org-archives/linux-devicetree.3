Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A964646A5FE
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933898; cv=none; b=VmPK2XNA5MjKn9wKcLdwtsC6vZjiZZzeTtyEGezkEok0gxQFWkdGiCRbUw53H3YjiUFlBAP2juOaIkVHm3bJ2fy/bHZYSdmkVyub1m0PdvEk5B6g7kd5bjSOCXSMW+21AxE22q3MHUvl2MMq7AWtf4mlphZJYQ2RVCABP4l2SOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933898; c=relaxed/simple;
	bh=RggdgY4Q+yk2iJQf8ZWtFTEnt5hmsDtb5A27cebRFNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VcJ7+ohwth16wuTUca4p4K1gpGlgyppbKnDP++KxlmEnNgo4riSmD0f5I7XfLHiIliZwpK2C5q/NJa97R4ZjAntG6Ca65L09Qsy0tqSD4XyZq+ceyCsC5K8hMla/iegfOOhkxmABQ6v+0lzINUMfgGfNOn6j2LKXdwqA3k/BQ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJwsUFhr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJwsUFhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152C61F000E9;
	Wed,  5 Aug 2026 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933897;
	bh=PhWOY5RLmDaoMmdMBm0PuQwwIPbyWmnX/qIjQ6hyw9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJwsUFhr7Ae9AiM+dyHJjSwEKLBCm3/CnuvIVAAwWt2MAYKZ2h0iEq1hTA1/vspjw
	 X2vtd4u8069a0qb7qvhrCReJ/tj19KnZAuZuhDMF+AHCKyhBG237lfGhHGDdgS683y
	 trqE+43/1yfSkWLNmizHXQTuatfx6+O+53hdX/1jDPZOfH+B0hFYQA35dLhQsBYrw1
	 l8hIcPxazbm5bqJn6aRGhAdFla8nQBmyYaeBeNgPbzeUZ5pV3Sd330wykgqxuS/RWB
	 nGX3qg2jBh9SThtzStY6DyZHMtmyEOb4g7I7KTOA4mkE/J2WWFzcBQM7BavAN2Vozi
	 N+QwEXq3LodnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 12/36] pinctrl: airoha: fix AN7583 MDIO pin mux
 config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-13-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-13-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:44:56 +0000
Message-Id: <20260805124457.152C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `mdio1` pin group is orphaned, completely unmapped =
to any pin function, and points to pins that actually belong to `i2c1`, mak=
ing it useless dead code.
--

--- Patch [12]: [PATCH v10 12/36] pinctrl: airoha: fix AN7583 MDIO pin mux =
config ---
commit 7aba565954d9e66108d9e018ec2a6fd970bf13e4
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

pinctrl: airoha: fix AN7583 MDIO pin mux config

This commit fixes the MDIO pin multiplexing configuration for the AN7583 So=
C.
It updates the MDIO pins to use the correct indices (53, 54) instead of the
I2C1 pins. It also corrects the register mask values written by the function
group.

> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -724,7 +724,8 @@ static const int an7583_pon_tod_1pps_pins[] =3D { 32 =
};
>  static const int an7583_gsw_tod_1pps_pins[] =3D { 32 };
>  static const int an7583_sipo_pins[] =3D { 34, 35 };
>  static const int an7583_sipo_rclk_pins[] =3D { 34, 35, 33 };
> -static const int an7583_mdio_pins[] =3D { 43, 44 };
> +static const int an7583_mdio_pins[] =3D { 53, 54 };
> +static const int an7583_mdio1_pins[] =3D { 43, 44 };

[Severity: Low]
Is this mdio1 pin array intended to be used?

Since pins 43 and 44 are already covered by the I2C1 pins (as noted in the
commit message), it appears this might just be leftover dead code from
renaming the original mdio pins rather than an intentionally usable array.

[ ... ]

> @@ -809,6 +810,7 @@ static const struct pingroup an7583_pinctrl_groups[] =
=3D {
>  	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
>  	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
>  	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
> +	PINCTRL_PIN_GROUP("mdio1", an7583_mdio1),

[Severity: Low]
Does this mdio1 group need to be mapped to a function to be useful?

As currently implemented, the group is registered here but is completely
unmapped to any pin function in the driver, which makes it unusable for
multiplexing.=20

Could this registration be safely removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D12
