Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A471307492
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803296; cv=none; b=b4nKT7AhJWFa0v+xBMri1umM1vZRahCAtObGW3K7INVDcgdSjCGuRZqlejAjZee+ulY/L2EZ41qEmonO4ZGqMBG5Vg/GyZMt5FP5HB/bIhYKG1cUgEPwsTjRZVn6aqr/dtNDsYjZp/qGwcmjKzLu88lT8BdbItRuPREXMY78Boo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803296; c=relaxed/simple;
	bh=gf9xNQV+r2taFIZNVTSHGW/t8IBeAG0lNNBowK6/3gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KFJ9GMVXzhnqfsQxDVcB6uew3rpjJALKo/pZbVdnh+kx6iy9tP7qWlhJD8orZdRzJDvSPp059qxLvz2vDkRLnRbSQwvA9e1cuPex80xWz3R24RHjJgbmXBcuSPwmORdsfaYHIDADt+HQVC6X5zUgT3zfVSqMCsTZb8xeD9IpnAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsMhuGRv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsMhuGRv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A691F000E9;
	Sat, 11 Jul 2026 20:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783803294;
	bh=BLc2TeOzuwwz6G4okBR4+1TV+SOCbTR5Sy6nyFfG2rU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsMhuGRvS5ELN8y7MfBvXqT+OWG97J2D+MCS7xNI+/LXjjrBXVZiRcZ0nl3Vro0yd
	 a4OasoztmuDD50hgQ4AGq2xQudnNPyg/u7MOfpWrn3tO7SI+PQFsLZRRbYSgK49MLk
	 dfc8EZ2GZU8QJqHe7jFH6ZyFYZqKGZd143zW5uhExr+bBMgFjbh++yoPZgsX1Mo9HC
	 0PjNSDuaQg9gD4G9P2hh0ZX1mVVR6WbarL5wP8QY8o/O9COPh+KR9olbo0GRq06zWM
	 I2KKCuo6RM+47TiMhj9QX0/xFoX+7/4OmFaUlvFxugvzdpbeb6jh3lN0WbsoSg2vo9
	 ntLxfeuvlgi5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] phy: cpcap-usb: add DCP detection and make UART
 idle mode optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260711204210.197144-5-ivo.g.dimitrov.75@gmail.com>
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
 <20260711204210.197144-5-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 20:54:53 +0000
Message-Id: <20260711205454.48A691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The new charger detection logic introduces an infinite connect/dis=
connect flapping loop for active USB peripheral connections and an infinite=
 polling loop for proprietary chargers.
- [High] Transitioning from idle mode to USB mode leaves the PHY transceive=
r improperly suspended because CPCAP_BIT_USBSUSPEND is not cleared.
--

--- Patch [4]: [PATCH v5 4/7] phy: cpcap-usb: add DCP detection and make UA=
RT idle mode optional ---
commit a10ef479eac91f75ee1175abda606fb7eaa3fb70
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

phy: cpcap-usb: add DCP detection and make UART idle mode optional

Handle DCP separately from USB host connections using CPCAP charger
detection status. Make the existing idle UART mode optional via the
"enable_uart" module parameter. Initialize the PHY into the baseline
configuration required for reliable charger detection during probe.

> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/=
phy-cpcap-usb.c
> index 741145c89e5bb..2d770ff19e934 100644
> --- a/drivers/phy/motorola/phy-cpcap-usb.c
> +++ b/drivers/phy/motorola/phy-cpcap-usb.c

[ ... ]

> @@ -292,38 +301,74 @@ static void cpcap_usb_detect(struct work_struct *wo=
rk)

[ ... ]

> -	/* Otherwise assume we're connected to a USB host */
> -	if (vbus) {
> -		dev_dbg(ddata->dev, "connected to USB host\n");
> -		error =3D cpcap_usb_set_usb_mode(ddata);
> +	/* Check if we're connected to a USB host or charger */
> +	if (vbus && ddata->mode !=3D CPCAP_USB_HOST) {
> +		enum cpcap_mode new_mode;
> +
> +		if (s.se1)
> +			new_mode =3D CPCAP_CHARGER;
> +		else if (!s.dm && !s.dp)
> +			new_mode =3D CPCAP_USB;
> +		else {
> +			error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC2,
> +						   CPCAP_BIT_USBXCVREN |
> +						   CPCAP_BIT_UARTMUX0 |
> +						   CPCAP_BIT_EMUMODE0, 0);
> +			if (error)
> +				goto out_err;
> +
> +			schedule_delayed_work(&ddata->detect_work,
> +					      msecs_to_jiffies(100));
> +			return;
> +		}

[Severity: High]
Does this else block create a regression with an infinite connect/disconnect
flapping loop for active USB peripheral connections?

When the device successfully enters CPCAP_USB mode, normal USB pull-ups or
traffic will assert D+ high (s.dp =3D=3D 1). Any subsequent interrupt trigg=
ers
detect_work(), and if s.se1 is false, it falls into this else block. It then
disables the transceiver (USBXCVREN =3D 0) and reschedules itself in 100ms,
repeatedly dropping standard PC connections or proprietary chargers.

[ ... ]

> @@ -424,43 +469,84 @@ static int cpcap_usb_gpio_set_mode(struct cpcap_phy=
_ddata *ddata,

[ ... ]

> +static int cpcap_usb_set_idle_mode(struct cpcap_phy_ddata *ddata)
> +{

[ ... ]

> +	val =3D CPCAP_BIT_USBSUSPEND;
> +
> +	if (enable_uart)
> +		val |=3D (CPCAP_BIT_UARTMUX0 | CPCAP_BIT_EMUMODE0);
> +
> +	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC2, 0xffff, val);
> +	if (error)
> +		goto out_err;

[ ... ]

> @@ -503,11 +578,23 @@ static int cpcap_usb_set_usb_mode(struct cpcap_phy_=
ddata *ddata)
>  		goto out_err;
> =20
>  	error =3D regmap_update_bits(ddata->reg, CPCAP_REG_USBC2,
> -				   CPCAP_BIT_USBXCVREN,
> +				   CPCAP_BIT_USBXCVREN |
> +				   CPCAP_BIT_UARTMUX0 |
> +				   CPCAP_BIT_EMUMODE0,
>  				   CPCAP_BIT_USBXCVREN);

[Severity: High]
When transitioning back to USB mode, does this cause a regression where the
PHY transceiver is left improperly suspended?

In cpcap_usb_set_idle_mode(), CPCAP_REG_USBC2 is updated with a 0xffff mask=
 to
explicitly set CPCAP_BIT_USBSUSPEND. When returning to USB mode here, the m=
ask
is limited to CPCAP_BIT_USBXCVREN | CPCAP_BIT_UARTMUX0 | CPCAP_BIT_EMUMODE0.
Since this mask does not include CPCAP_BIT_USBSUSPEND, it looks like it fai=
ls
to clear the suspension state, which could cause communication failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711204210.1971=
44-1-ivo.g.dimitrov.75@gmail.com?part=3D4
