Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9235674A
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931006; cv=none; b=TSNfxdqjMpOI1uEGzBPU2wy0XrACkbUaJpw3XQZB50rsvNQYiUiPKsqgwQnbLs4pC5e3sQEirEgbwE3aeFvvvKI3bjyf+eyo4GNPBSZNCYHYRJ72W5JByHy8qMJKlOo7cp2xyJV3MN82VG38d8TfRJ9De5p+9AM2bTM3edJ86cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931006; c=relaxed/simple;
	bh=oRHDxyOsq+Oav2d9Zkeiup5QJBXT9p39UOPOD4OJWqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KwzSctPn8b3wdzGr9tQMdh5WSV52oLDrbpNhCo7fCbr+5LfSEFuz40swnlEYe8yHKO4N98+gquCqmLQnk3LGgtRg+sXmhul+2Df0lVEDQBUL58f/qNJmyulADLgzbmMfCx+lJfrkaXs1nVK5GsXewnOmTmGvHdzGyvUwMMBdV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaqXmbg0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaqXmbg0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4045E1F000E9;
	Fri, 28 Aug 2026 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787931004;
	bh=bepVBFyA/L6gV+/W49VxF8D4+QtKUSTRjSOlh6kDbVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PaqXmbg0EsdzFzOwckX3QkwIFx2qwUW4i4DoTXTMOArLs7Qo1j7MahWxhlg2Sq2fO
	 7/weItmt0SC7fJ8giKORdMqYvSUXLeWjou/eu1FWPjuihk69v8340DinIGjBvLdBFp
	 lUIVFMFhJyySKyQP9sStabZKRqS09EnpIybxhAAZvvLci1/CMsxk3gDbIZwMYpbEqI
	 9sqbuKaAX3nARjUD5VXJxCheMzW03HGwKbAqy8x2VAB44z3Hvzd3cLpsfZ3LIa28oS
	 27SAQO6Bi9yVvzb9aMlrFzke2weVl0gjwR+pJRHctbFhri1s/Co9x7zYxptRS6jNu6
	 sCjrVk4rysm/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add ST STM32MP2
 DWC3 xHCI USB controller glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828150937.174735-2-marex@nabladev.com>
References: <20260828150937.174735-1-marex@nabladev.com>
 <20260828150937.174735-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:30:03 +0000
Message-Id: <20260828153004.4045E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] STM32MP25 USB3 syscfg register configuration is permanently lost=
 after a suspend/resume cycle.
--

commit e3287a65c05b7a190b49e2a633f70e39f4bce365
Author: Marek Vasut <marex@nabladev.com>

usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller glue
   =20
The ST STM32MP2 SoC contains one instance of DWC3 USB controller with
a glue logic wrapper around it controlled by syscon. This commit extends
the generic DWC3 platform driver with ST STM32MP2 glue logic specifics.

> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index ca69ac0eb07ce..bb2be75a82875 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c

[ ... ]

> @@ -85,6 +92,38 @@ static int dwc3_spacemit_k1_init(struct dwc3_generic *=
dwc3g)
>  	return 0;
>  }
> =20
> +static int dwc3_stm32mp25_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev =3D dwc3g->dev;
> +	bool ovrcur_polarity_low =3D device_property_read_bool(dev, "over-curre=
nt-active-low");
> +	bool prt_pwr_ctrl =3D device_property_read_bool(dev, "st,enable-port-po=
wer-control");
> +	bool usb2only_conf =3D device_property_match_string(dev, "phy-names", "=
usb3-phy") < 0;
> +	bool vbusen_polarity_low =3D device_property_read_bool(dev, "st,vbusen-=
active-low");
> +	struct regmap *regmap;
> +	u32 drcr;
> +
> +	regmap =3D syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscf=
g", 1, &drcr);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "No st,syscfg phandle speci=
fied\n");
> +
> +	return regmap_update_bits(regmap, drcr,
> +				  STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT |
> +				  STM32MP2_USB3DRCR_OVRCUR_POLARITY |
> +				  STM32MP2_USB3DRCR_VBUSEN_POLARITY |
> +				  STM32MP2_USB3DRCR_USB2ONLYD |
> +				  STM32MP2_USB3DRCR_USB2ONLYH,
> +				  FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
> +					     prt_pwr_ctrl) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_OVRCUR_POLARITY,
> +					     ovrcur_polarity_low) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_VBUSEN_POLARITY,
> +					     vbusen_polarity_low) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYD,
> +					     !!usb2only_conf) |
> +				  FIELD_PREP(STM32MP2_USB3DRCR_USB2ONLYH,
> +					     !!usb2only_conf));

[Severity: Medium]
Will this STM32MP25 USB3 syscfg register configuration be permanently lost
after a system suspend and resume cycle?

This function configures vital USB hardware behaviors (over-current polarit=
y,
VBUS polarity, power control, USB2-only mode) via a syscfg regmap update
during probe.

However, dwc3_generic_resume() does not appear to re-invoke the initializat=
ion
callback or provide a mechanism to restore this state on resume:

static int dwc3_generic_resume(struct device *dev)
{
...
	ret =3D clk_bulk_prepare_enable(dwc3g->num_clocks, dwc3g->clks);
...
	ret =3D dwc3_pm_resume(dwc);
...
}

If this configuration is lost during deep sleep, could this regression
cause the USB port to fail to function correctly after resuming?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828150937.1747=
35-1-marex@nabladev.com?part=3D2
