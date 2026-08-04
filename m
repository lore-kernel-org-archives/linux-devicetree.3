Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B38A3750C4
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860917; cv=none; b=CLpU80+TSlLrdZgR9fRZMvg6/CMRxyjHbuZRD5Njtp+4YN8FY0SriTO06MNj/2LObbgsRWjQcxloCFJRxVJsw1gFobe1Q/2ZquHwnbrqjzSiQMeCBmDQyMn2gMg9J5S6wv5Ay1MfoTcNfwK5mILRLclvyGRHdI3bSyzET1s1RDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860917; c=relaxed/simple;
	bh=F+jpVJunVB5TI5B2g9StbNTNP9xHGGkS+8HnmrZHnvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t/GeoSkIeVRIadlek8mgqAzzy1UXzXidaDGoZ39+fq+qHZzbUqf2ry7zxXRvYUoKTqcLfA8UpEiWJtP1KlSAP4l/r8wGo8hPeN2fCqwwnTKZh7NFI1X2zt2FCY/sAhSncgNmYTXergeL2XjkAgxwVbnl4weMbxcExOEEbbtfMnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITCwCQHY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITCwCQHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C281F000E9;
	Tue,  4 Aug 2026 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860916;
	bh=nHp821eVqoZQcezM5T2GWCrSPmBV9W0jynpZp+DiDVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITCwCQHY5u5iHY9e5Syexh6/EILYhYLjwthysKQXbRmb6PPq/D9+WwH9JWwVfKi5C
	 FYVg5jqqaLu8/+pg/Z8Xd4xw5uAA5siqP8mtTlllfir7/3U+/O2fZN1u6+O+U/Ye7C
	 /Wz7STbqW+UdTVLZ7jub2mnnyaJUOs1N+UA9pZDtdHj3sadKyFnpz4PRx+BShHsjvx
	 sdYgIPfWWOgxgGKAoVNNtk2yuItNgjtTAhuktQ7isBPnA5tVhRG+Z2dyoNWew0FRGC
	 KytMSYWtLw/GnayZm9vUm/ed/z2yQiDehSjw5qUYBGA25IUtQjaNGaUd2cOq0+8QgI
	 GZ4Bi1SQLGn7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 12/36] pinctrl: airoha: fix AN7583 MDIO pin mux
 config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804160419.3592327-13-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-13-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:28:34 +0000
Message-Id: <20260804162835.42C281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added `mdio1` pingroup is exposed to the pin control fram=
ework but is entirely unusable for pin multiplexing because it is not mappe=
d to any function.
--

--- Patch [12]: [PATCH v9 12/36] pinctrl: airoha: fix AN7583 MDIO pin mux c=
onfig ---
commit 0c3820088ec10b5bbb9e1c12cf81f5aa308d9ff7
Author: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

pinctrl: airoha: fix AN7583 MDIO pin mux config

This commit corrects the AN7583 MDIO pin mux configuration by updating the
pins array to point to pins 53 and 54 instead of 43 and 44. It also updates
the MDIO function group to clear the correct hardware initialization bits in
the PON mode register.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
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
>  static const int an7583_uart2_pins[] =3D { 34, 35 };
>  static const int an7583_uart2_cts_rts_pins[] =3D { 32, 33 };
>  static const int an7583_hsuart_pins[] =3D { 30, 31 };

[ ... ]

> @@ -809,6 +810,7 @@ static const struct pingroup an7583_pinctrl_groups[] =
=3D {
>  	PINCTRL_PIN_GROUP("sipo", an7583_sipo),
>  	PINCTRL_PIN_GROUP("sipo_rclk", an7583_sipo_rclk),
>  	PINCTRL_PIN_GROUP("mdio", an7583_mdio),
> +	PINCTRL_PIN_GROUP("mdio1", an7583_mdio1),

[Severity: Low]
Are these new pins intended to be mapped to a function?

The new mdio1 group is registered with the pin control framework but does
not appear to be mapped to any function in the driver's function array. If
a device tree attempts to configure a function for this group, the pinctrl
core will reject it with -EINVAL.

Since pins 43 and 44 are already covered by the i2c1 group as mentioned in
the commit message, is this mdio1 pingroup leftover cruft that can be
safely removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D12
