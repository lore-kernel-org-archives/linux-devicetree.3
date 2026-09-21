Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653A3AFD16
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027816; cv=none; b=KtbW9HNBNDmSJleUk+2vYKiw/BC9EPPCgX4FwDYSLT0j9FHQfgutsMIi39pHFqjMnVe5sE8+uAw2rhYREf1q/n0vNwATQrC2jtyCCKttK37GvP1h6ytM3T0LRzhJOOasOGNooJPV68nI7WzA398OIvpFXiqVsEoDIKkaycLgJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027816; c=relaxed/simple;
	bh=RxwA7RDTA8LzXnh6W8Rsp0fcfilQen7ZKYLDVdQcm2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EXbtlY+Z9Wld4wstJ9MQOlr29HvGfthiezWfRoXmo+wP1DMLICm1NlRxF6w1yQ5s+YvpNRiaYS7M2kZwItDU82e2b3lzDFsBNNgbBjem7s57a2EOiyyQine9cQtAMWe9UC/edGX0gNoKxBYsRoGjP1dhaq9sWwcQ0epOTWm1JGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ/COO+e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ/COO+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F631F000FF;
	Mon, 21 Sep 2026 21:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790027814;
	bh=Q0jGCqsTkMZkahkCz7nppaJNyuzST6hfXuJczgBszMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jZ/COO+eL5WkAbvrGYDlKpLy8acUzPiyEQnAKSyijiI0eQ30NcUHbDbAtknrhVA/U
	 2Hgq/oiH8kJSCLp+abloJF0bFNc9uphglvWIk0/jjNu+2Hod1atvYtAsS07PR8sdUs
	 AUfDeiPNUnUnzSPKgu8hjA409u5vk4lGfAdDd7SmyiPdOLOTIBR2IB2kahoHEJ33CT
	 RytKZG164owOky2Zf6rEWGGbecguHiXnqkbS1Tqo8hSZem2dubhOVJAp4hP25ANNbS
	 vxa/neyMsB+/QzVgsrRsCMriHJI/47OOV9D+w7Qjoo2npdd5uCw7133MWtkt5tGrrU
	 lvMbDLzpQDDSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/2] ARM: dts: broadcom: model USB VBUS power with
 regulator-fixed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921214133.16519-3-rosenp@gmail.com>
References: <20260921214133.16519-1-rosenp@gmail.com>
 <20260921214133.16519-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 21:56:54 +0000
Message-Id: <20260921215654.A4F631F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: bcma: silent power down of USB ports due to unmanaged vbus-su=
pply
- [Medium] usb: bcma: suspend and shutdown power savings broken by missing =
GPIO
--

commit c18abcaaf29836cfc87135468c83037df7b8de36
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: broadcom: model USB VBUS power with regulator-fixed

Replace the undocumented "vcc-gpio" property on the usb2/usb3 controller
nodes with the standard vbus-supply/regulator-fixed model. Boards now
declare a regulator bound to the chipcommon GPIO that bcma-hcd used to
poke directly, one per power rail.

> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b=
/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
> index f5c95c9a712ec..80414c72f9129 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
> @@ -101,6 +101,16 @@ led-usb {
>  			trigger-sources =3D <&xhci_port1 &ehci_port1 &ohci_port1>;
>  		};
>  	};
> +
> +	usb_power: regulator-usb {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb-vcc";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-boot-on;
> +		gpios =3D <&chipcommon 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
>  };

[Severity: High]
Since this regulator lacks the regulator-always-on property, and no driver
claims it, will the regulator core forcibly disable it shortly after boot?

Looking at bcma_hcd_probe() in drivers/usb/host/bcma-hcd.c, the driver
still expects a vcc-gpio property and lacks the logic to request or consume
a vbus-supply regulator:

drivers/usb/host/bcma-hcd.c:bcma_hcd_probe() {
	...
	usb_dev->gpio_desc =3D devm_gpiod_get_optional(&core->dev, "vcc",
						     GPIOD_OUT_HIGH);
	...
}

Because the regulator is never claimed, it will be automatically disabled by
the regulator core via regulator_late_cleanup(), which would cut off power
to all USB ports and break attached devices.

[ ... ]

> @@ -130,7 +140,7 @@ port@4 {
>  };
> =20
>  &usb3 {
> -	vcc-gpio =3D <&chipcommon 10 GPIO_ACTIVE_HIGH>;
> +	vbus-supply =3D <&usb_power>;
>  };

[Severity: Medium]
Since the bcma-hcd driver was not updated to handle vbus-supply and still
looks for vcc-gpio, does this break USB power toggling during system suspend
and shutdown?

Because usb_dev->gpio_desc now evaluates to NULL, the power-toggling
function silently returns without asserting the hardware state:

drivers/usb/host/bcma-hcd.c:bcma_hci_platform_power_gpio() {
	...
	if (!usb_dev->gpio_desc)
		return;

	gpiod_set_value(usb_dev->gpio_desc, val);
	...
}

This means when system suspend calls bcma_hcd_suspend(), which subsequently
calls bcma_hci_platform_power_gpio(dev, false), VBUS power won't actually
be turned off, resulting in a loss of power savings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921214133.1651=
9-3-rosenp@gmail.com?part=3D1
