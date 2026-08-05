Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED3470E9B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935046; cv=none; b=VA+kpU4ZWNdz4YlAMzxVwpXHKaTDQ2miylg4rbT0KovMZRL5nJuk0gC/p8x8lktFpBfzCbnR9l5dleCW6VyORygxNp939O46HiQsaUxwUYUon2Ze//4bh+CJNOuddJnaeixr/WH45ve1BV1t9KFXZBlZy4hWX2KdAaZXWHKO6cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935046; c=relaxed/simple;
	bh=qzZPbDgj3996iDRm1oYbyw+754cdI1Wk/9wo2u/2oH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jc572pQJwFflGWC+DR2UnybHMy5rUJ9FDejtTgplHHsZJlgp5lUa1/4erGzswhKH+HgZhXNuYYVDzUSSU8zuW9w8QtYF3ggY0Lv2FZ962wGgTB8gbO++sWn25VnqFNMyX0H9Qu6ALt8KrR8kv3NLXsRrAetmbrNOIrSmgybKKnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZWIKElr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZWIKElr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2D11F000E9;
	Wed,  5 Aug 2026 13:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785935042;
	bh=nKRNSok+LBBsVqwpoXlvHX18BS8wh2XQ6Hp6/xyqjWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RZWIKElr9Ea08gkx6uYwUGEP7yRgF2vveGCm4MzIr62raBVlP8WWHodniR+biXP01
	 lxBrl5F6Siu6hviRvUV+xIwCTgCM5XuJF1OAGFZWyYAPEHjnkI6Pf51sJtemuB4+hH
	 RnDlHF+uaCQLuQ0ue6jUx2BbAiEsxmcemakHFj4ZTvJ3Hv01gyMWJe75evXfNpXJkm
	 qrG/MBUGkgQffN9jANYbDiML8kF7PFZBUhvRZmEJp/a78Py8hNaQ+Yvk+QZNzxEH4S
	 Mn22LtzU25wndJjMJk7+a8NBCcmkihAuECPLOWMUWh8s6G9hWVgh4LrJAD7NVigTTb
	 zzf/AxcZRAgfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 30/36] pinctrl: airoha: an7583: add support for olt
 pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-31-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-31-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:04:01 +0000
Message-Id: <20260805130401.CE2D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `olt` and `pon_alt` pin functions share the same physical pins=
 but do not mutually clear each other's configuration bits, potentially cau=
sing hardware multiplexing conflicts.
--

--- Patch [30]: [PATCH v10 30/36] pinctrl: airoha: an7583: add support for =
olt pinmux ---
commit ce9b28cb0ea433c895d9e6cfad60de0854d4d8c3
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Date:   Wed Aug 5 12:34:02 2026 +0000

pinctrl: airoha: an7583: add support for olt pinmux

Add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 2e145ef5a224c..031a8b36e0024 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c

[ ... ]

> @@ -651,6 +655,19 @@ static const struct airoha_pinctrl_func_group pon_fu=
nc_group[] =3D {
>  	},
>  };
> =20
> +static const struct airoha_pinctrl_func_group olt_func_group[] =3D {
> +	{
> +		.name =3D "olt",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_OLT_MODE_MASK,

[Severity: High]
Will this mask configuration leave conflicting bits set if the pins were
previously configured for pon_alt mode?

Since the olt and pon_alt functions share the same physical pins (36
through 40), they appear to be mutually exclusive. When this mux
configuration is applied, it will set GPIO_OLT_MODE_MASK but won't clear
GPIO_PON_ALT_MODE_MASK or GPIO_PON_MODE_MASK if they were left set by the
bootloader or a previous runtime state.

Should the mask field include GPIO_PON_ALT_MODE_MASK and GPIO_PON_MODE_MASK
so they are properly cleared when olt is selected?

Additionally, does the existing pon_func_group need to be updated so that
selecting pon or pon_alt clears the newly added GPIO_OLT_MODE_MASK?

> +			GPIO_OLT_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +};
> +
>  static const struct airoha_pinctrl_func_group tod_1pps_func_group[] =3D {
>  	{
>  		.name =3D "pon_tod_1pps",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D30
