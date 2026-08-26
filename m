Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507038F950
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738615; cv=none; b=J+lIPGprFBgFbh357ZIPTMRuDD2CZ2Tay4xskwDoxwMxnhaMRIyoR2lpaUgB3pBi98wJowM/TJxthajNrrUxGRAp61T9zKU+yDWCjXloFqkz5ePj2m+pMj6Dpuzjc4dke0OF6ew6PgdPANCinu+qih7TT/jALQwrCzgkCEFDCG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738615; c=relaxed/simple;
	bh=uP+sC8sCzGho9JlQbt90HAHDDCREz4hB37cNUztFXaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DLhp/jKfDrnuaRUK/3seP5vFJY/oXZi4tY6OcW6cVjzttG9coNTGhZU/oPYl0luM1GlBmj6kSqkzI33CkW6gZX1Hjz5F1IPuC5M2fVXqUOzlnMfIwIxkjhMyJBtA0yzwx9Dysxpb/n88Hk537PV7GdUPKK3D5U8a0rmb41lfIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqHnAOuC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqHnAOuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46FA1F000E9;
	Wed, 26 Aug 2026 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787738614;
	bh=EXmYKGG66EdDQpctYx731zYSm3xJcpa+mZi+HIVCK4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqHnAOuCtKEu0CGd8ovSb41Wh3BH/p8Xcid4Po/gv5CyTIWnBDX5410Jy5W4yiPNj
	 awIDsx7IqKo4fmkAPpK+dRohGpWYznx7SICTyeqv9CNY8z8F4Rop+5Hz/2cx8KfJlB
	 iMSOvhj5j+YRMVZnA5/vOTLVJxW8zKEPqkPt1/eJ5INT8q5KFFNKU3bo5hYzUk11K8
	 +eEXz6V1TNanVBfUhwyuweQTcdrB5G6NnvWeIsxUsAgkvzhJ4Njj/x0akwp+oycDkZ
	 BYM3p/xXKbErK7j5WoML7YGOHMV1PrZhhYLqXHaNIYbDpPL5/p3I7FPaHc+duqXiDL
	 aj0Au6OnHC9Nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: mux: gpio-sbu: enable when only used
 for orientation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826-usb-fusb340-v1-v2-2-994a03c9ae45@foss.st.com>
References: <20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com>
 <20260826-usb-fusb340-v1-v2-2-994a03c9ae45@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:03:33 +0000
Message-Id: <20260826100333.E46FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `mode-switch` property is probed after registering the Type-C =
switch, contradicting the v2 commit message and introducing a race conditio=
n where incoming callbacks might use uninitialized state.
--

commit c810037786c450b0d450c67a1bf5b0c47390d167
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: typec: mux: gpio-sbu: enable when only used for orientation

This commit modifies the GPIO SBU mux driver to enable the optional GPIO
when used purely as an orientation switch. It adds logic to check the
mode-switch property and adjust the GPIO state accordingly in the switch_set
callback.

> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux=
/gpio-sbu-mux.c
> index 1834f1a2dd9dd..120f1ab5dbcb3 100644
> --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
> @@ -40,19 +41,24 @@ static int gpio_sbu_switch_set(struct typec_switch_de=
v *sw,
>  		enabled =3D false;
>  		break;
>  	case TYPEC_ORIENTATION_NORMAL:
> +		if (!sbu_mux->mode_switch)
> +			enabled =3D true;
>  		swapped =3D false;
>  		break;

[ ... ]

> @@ -125,6 +131,8 @@ static int gpio_sbu_mux_probe(struct platform_device =
*pdev)
>  		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
>  				     "failed to register typec switch\n");
> =20
> +	sbu_mux->mode_switch =3D device_property_read_bool(dev, "mode-switch");
> +
>  	mux_desc.drvdata =3D sbu_mux;

[Severity: High]
Can this registration order introduce a regression where incoming callbacks
use uninitialized state?

If a Type-C switch event occurs immediately after typec_switch_register()
returns but before device_property_read_bool() executes, could the
gpio_sbu_switch_set() callback incorrectly evaluate sbu_mux->mode_switch as
false? The memory for sbu_mux is zeroed by devm_kzalloc, which might cause
the enable GPIO to be incorrectly asserted during this initialization windo=
w.

Additionally, the patch description mentions probing the mode-switch proper=
ty
before registering the Type-C switch to avoid a race condition. Should this
property read be moved above the typec_switch_register() call to prevent
this issue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-usb-fusb34=
0-v1-v2-0-994a03c9ae45@foss.st.com?part=3D2
