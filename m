Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902D355F57
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150967; cv=none; b=g+70vtFPguDNuMAgEqg5Bp3Abkr7XfKPVqdEdIo6qKANb95fonOGMymuRAexaenBNFVRbu5KY4aoF4xj08OoJvevU+gECCNdJpv371W0BygJSl4lUB2lWwe8iGShspiVZo6y7HASg9nxtvDlX++wepkXaUBf/di2hPSGtRjcAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150967; c=relaxed/simple;
	bh=IgvOFYM9LxiTQJwXdyY77xaNsE/uPrTV4UJp7BeFSiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zu02YD/y0agczxb2a7hmg2cciDU82uHZC+6qZ8ccSI4bB/OCn7Eya15FXg5JMZIglwwdOWAiG1O2HBlIXJD1j7DFva4EVbliNJgKPpgpHkZeGNjgRJDDz5b8XGfjb4NO/apeRMqjGPRWPCiQv6KPVq3lM0nBQ+5ZSVCd1OaWBbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEQVMB5L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEQVMB5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38811F000E9;
	Wed, 19 Aug 2026 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787150966;
	bh=upWmjo2oVLtBgjVMzI/6cxvR6YIk3kLlCo5bA4NISdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEQVMB5LFxfzMMQit+L/Eefd2LIWT8sS+061iB86V4ki8wWII1WHX40Jl3D03pLXH
	 o3QtMGy2q2logrIIP1t0n4k3IEWOV+cdoCyNrX0IFbTBPlxm/VqTbtxmkxP56gru/U
	 b0uo9t3QMDSsAcXsF3VjWPw1IqZIehlEs1nMCB8ssb2Lrqucm4IzY9Zy7CGlJ30sEH
	 5bh+kg9SIexn+1vvw6LfKbkxRmAeqdrvXdUgQqp1lbAejlQRYlxLK/eG55ve+sVkma
	 RHcq0QMyjQxhsryhGOLV42s3tiY8hpLgR35MowZV8WIIE4ZA+8P/5WTnrUyELRXZGx
	 2KnY0jd1piXNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] pinctrl: renesas: rzg2l: Unify the power source
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 14:49:25 +0000
Message-Id: <20260819144925.B38811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Regression preventing software-configured (`PIN_CFG_SOFT_PS`) pins=
 from using a 2.5V power source.
- [Medium] Wildcard capability matching in `RZG2L_PINCTRL_PS_DESC_MEMBER_TO=
_DESC_FUNC` can cause silent hardware misconfiguration.
- [Low] Macro hygiene violation in `RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FU=
NC` forces callers to use a specific identifier.

Pre-existing issues:
- [High] Drive strength hardware register (`IOLH`) is not updated when the =
pin's power source changes.
--

--- Patch [3]: [PATCH v5 3/5] pinctrl: renesas: rzg2l: Unify the power sour=
ce handling ---
commit 359b67b0750f9cab682964830c50121ec1ab0ad9
Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: pinctrl: renesas: rzg2l: Unify the power source handling

The previous code handled power sources using a mixture of power
source specific definitions and lookups in the available_ps[] array.
Unify the power source handling by introducing
struct rzg2l_pinctrl_ps_desc.

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index 9c935dc475557..bab7bd73a4328 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
[ ... ]
> @@ -440,7 +439,65 @@ struct rzg2l_pinctrl {
>  	u32				clone_offset;
>  };
> =20
[ ... ]
> +#define RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(_name, _desc_member, _=
caps)	\
> +static const struct rzg2l_pinctrl_ps_desc *_name(u16 _desc_member, u32 _=
caps)	\
> +{										\
> +	const struct rzg2l_pinctrl_ps_desc *desc =3D NULL;			\
> +										\
> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(available_ps); i++) {		\
> +		if (available_ps[i]._desc_member =3D=3D _desc_member) {		\
> +			if (available_ps[i].caps) {				\
> +				if (available_ps[i].caps & caps) {		\

[Severity: Low]
This isn't a bug, but does this use the wrong variable? The macro takes
_caps as a parameter, but caps is used here. Will this cause compilation
failures if callers use a different variable name?

> +					desc =3D &available_ps[i];		\
> +					break;					\
> +				} else {					\
> +					continue;				\
> +				}						\
> +			} else {						\
> +				desc =3D &available_ps[i];			\
> +				break;						\

[Severity: Medium]
Does this else block act as a wildcard for capabilities equal to 0? If a
caller requests an unsupported voltage for a restricted domain (like an
anticipated I3C domain that does not support 3.3V), will the lookup
falsely match the generic descriptor and return its register value
(e.g., 0)? Could this silently misconfigure the hardware to an incorrect
voltage instead of safely returning -EINVAL?

> +			}							\
> +		}								\
> +	}									\
> +										\
> +	return desc;								\
> +}
[ ... ]
> @@ -1797,7 +1839,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl=
_dev *pctldev,
> =20
>  	/* Apply power source. */
>  	if (settings.power_source !=3D pctrl->settings[_pin].power_source) {
> -		ret =3D rzg2l_ps_is_supported(settings.power_source);
> +		ret =3D rzg2l_ps_is_supported(settings.power_source, cfg);
>  		if (!ret)
>  			return -EINVAL;

[Severity: High]
Does this check inadvertently break pins configured via software
(PIN_CFG_SOFT_PS) that require a 2.5V power source?

The only available 2.5V descriptor explicitly requires Ethernet capabilitie=
s:

    RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH=
1,
                          RZG2L_IOLH_IDX_2V5)

Would a PIN_CFG_SOFT_PS pin requesting 2500 fail this capability check and
be rejected with -EINVAL, breaking backward compatibility?

[ ... ]
> @@ -1812,7 +1854,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctr=
l_dev *pctldev,
>  		enum rzg2l_iolh_index iolh_idx;
>  		int val;
> =20
> -		iolh_idx =3D rzg2l_ps_to_iolh_idx(settings.power_source);
> +		iolh_idx =3D rzg2l_ps_to_iolh_idx(settings.power_source, cfg);
> +		if (iolh_idx =3D=3D RZG2L_IOLH_IDX_NA)
> +			return -EINVAL;
> +
>  		ret =3D rzg2l_ds_is_supported(pctrl, cfg, iolh_idx,
>  					    settings.drive_strength_ua);
>  		if (!ret)

[Severity: High]
This is a pre-existing issue, but is the drive strength hardware register
(IOLH) left out of sync if only the power source changes?

Looking at rzg2l_pinctrl_pinconf_set(), the hardware register update is
skipped if the requested drive strength has not changed:

    if (settings.drive_strength_ua !=3D pctrl->settings[_pin].drive_strengt=
h_ua) {
        ...
        iolh_idx =3D rzg2l_ps_to_iolh_idx(settings.power_source, cfg);

Because the physical mapping between the IOLH register index and the actual
microamp output depends heavily on the selected power source, will keeping
the old IOLH index at a new voltage yield an incorrect drive strength?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819143553.2478=
984-1-claudiu.beznea+renesas@tuxon.dev?part=3D3
