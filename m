Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A63BED2D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294001; cv=none; b=NQXjDhHx9UbxeCodvhk0bEyF1oZl6gfD2kGqiz47Yq6TtrYQ/J91hoBXOgdkJsDhhFeeV2tSjXt0N42st6954YNWAndv+M9LwK2MEjB0Lj29XUM/ZBJlwokg7b5cHxKagUyIxoF/IItdVgrKusyQ+rLTXtWDwTMFZ5QxLD7n9zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294001; c=relaxed/simple;
	bh=t3C9hnNFE46c1zX0F0F+qaWzqGs5a/ON0kZnktWdDQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Em/peCd5+N+cM8Dl+iyToO2a7tF+1rHyk0Qg7+R2B0jvRZOLKU4aZLACNvGqklvRDGqRghp3EMh0fHSUJEoBzF0ttLs79T4HKh4hB1IeyT7dEoWcrJtK8eLEYUYQNlT5iKAGx54xfm16gJ7ovzcgSxnqnDD3uHdal6Rs88lF55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ/rANRx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZ/rANRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50161F000FF;
	Thu, 24 Sep 2026 23:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790294000;
	bh=Jg769T8ZSwrrMe9n8KsCrrSEcNnX1KQWHeTIT8NohGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dZ/rANRx1U80Eni14wxXmPCXWXPYWiVN1fAxEck/LbV9/+tPNBkeLUR2s+Ng0BNjH
	 17VtM4JHCUMnOxjMTGf1M13qrrSFtMKeiZnqk7LPqBwVP/+G+L14knbpHZSiqJYq7D
	 Cwfa8J3oCwtXcXE7HDxQuQR0ZeBZCm2UB6nV8elfxxSX/YQEH5UIlr0wWI/i8SKAxR
	 yeRfW2yqu+H7f08zryvCqGVlRx/0PvEqsXtRAOX+3AiVS2MS6Lq7P2OmGzAb9uXDaD
	 AF4LznEec/D7O06y+ldLW+EMPpVJmg+9+vpEZpDPeAdeZhcq2Wn2oM88k5Go9W2v59
	 NQRQN0Tx1LQtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 2/2] ARM: dts: broadcom: model USB VBUS power with
 regulator-fixed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924233831.127617-3-rosenp@gmail.com>
References: <20260924233831.127617-1-rosenp@gmail.com>
 <20260924233831.127617-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 23:53:19 +0000
Message-Id: <20260924235319.B50161F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: bcma: unclaimed vbus-supply regulator disables USB power afte=
r 30s
- [Medium] usb: bcma: silent power management failure due to missing vcc GP=
IO
--

commit 5639b159d14f6b05d776251fb2e51af77ccdaf1b
Author: Rosen Penev <rosenp@gmail.com>
Subject: ARM: dts: broadcom: model USB VBUS power with regulator-fixed

This commit replaces the undocumented vcc-gpio property on usb2/usb3
controller nodes with the standard vbus-supply and regulator-fixed model.=20
Boards now declare a regulator bound to the chipcommon GPIO, preserving=20
polarity and using regulator-boot-on to mirror the CFE state.

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

[Severity: High]
Does this regulator definition need regulator-always-on?=20

The bcma-hcd driver in drivers/usb/host/bcma-hcd.c:bcma_hcd_probe() attempts
to fetch a raw "vcc" GPIO rather than claiming this vbus-supply regulator. =
As
a result, the new regulator remains unclaimed with a zero use count, and the
regulator core will automatically disable USB power 30 seconds after boot w=
hen
it disables unclaimed non-always-on regulators.

> +		enable-active-high;
> +	};
>  };
> =20
>  &srab {
> @@ -130,7 +140,7 @@ port@4 {
>  };
> =20
>  &usb3 {
> -	vcc-gpio =3D <&chipcommon 10 GPIO_ACTIVE_HIGH>;
> +	vbus-supply =3D <&usb_power>;

[Severity: Medium]
Will replacing the vcc-gpio property with vbus-supply break power management
for this device?

When bcma_hcd_probe() fails to fetch the vcc GPIO descriptor, the usb_dev
gpio_desc remains NULL. Later power management calls, such as during suspend
in bcma_hcd_suspend() which calls bcma_hci_platform_power_gpio(), will simp=
ly
return early upon seeing a NULL descriptor. This silently skips all hardware
power control operations on state transitions.

>  };
> =20
>  &usb3_phy {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924233831.1276=
17-3-rosenp@gmail.com?part=3D1
