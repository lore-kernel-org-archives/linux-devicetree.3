Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEA211CBA
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558867; cv=none; b=t9+85GppfQ8sPOyjtlc0GegX9yUQc9/ZhizuQP7bjmekQqyUbxPUdniDW1Fpq7REnTc25vrYhunUqTvHYfknK1schU2DmwEEl3q+GxyzkH74cc0klcQqTeSxp5MPNOTpv6A0nxoL2SodNmWiEhNWOixYeKwKm5ke/HRI8CDpyJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558867; c=relaxed/simple;
	bh=kAqPxDxcGM5sXxDSoFzU22huPyHbRCBGiGjtwaKB40M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gWuPB5hlJHkMQlyRuNaKDbL+/si6vQDhvQ+GDnVOkG7Pb09S+PvPJCvzhZFtRsCQGuwgI0rXKrivTyadSiAz+dBhaXPnUa0B4783rBda8O4jFwo5CSHCf5d+SDxcKB1iWXkBKQJQMClDl0WIwQh5+jlilUXrGQRte96t0Kp6g+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciGCXXK1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciGCXXK1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64731F000E9;
	Thu,  9 Jul 2026 01:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558866;
	bh=js5WOA1fIgiz3k8MsumMaUyztn5UMzABU0wvZaMNB0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ciGCXXK1pDFP9a9vbyuNJBWY93XMhil3Ndt7FMFivlqSEsdis7tE3noLcMeN/3ntE
	 3sn8KGCTAUSqbbCuRQoZo92BT3OlpdK8e4p6V6FQc5t/2EJEW1BrrNEkkbHtTmv0jI
	 3OO5FB7c5yJ29P6ko3OMHZuajLxygP3Vyujwjhi9SEpqWGE+UuAU0By/2vN5LRWl3A
	 Thf39EQOJyPLbUkuYF/xOjPdpPV9pSe/cE2ohQJfUfw9QZ2ZKTfc4dAphB8osIVtVE
	 1+lKStSMTT5UMXYDGR5elpcrO29BQ09dohkAeEunmGsk81RG0kUmWe+w3N9/jGD2mR
	 lt1RxVIER/BtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable USB device mode on
 rk3588s-roc-pc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709005006.413145-1-festevam@gmail.com>
References: <20260709005006.413145-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 01:01:05 +0000
Message-Id: <20260709010105.D64731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding `usb-role-switch` nullifies existing `extcon` functionali=
ty, permanently breaking automatic OTG role switching.
--

--- Patch [1]: [PATCH] arm64: dts: rockchip: Enable USB device mode on rk35=
88s-roc-pc ---
commit 5791d34a99b00bf3d67aa350284aa7287f468661
Author: Fabio Estevam <festevam@nabladev.com>

arm64: dts: rockchip: Enable USB device mode on rk3588s-roc-pc

This commit configures the DWC3 controller on the rk3588s-roc-pc to act as a
USB role switch defaulting to peripheral mode. It also enables the USBDP PHY
to allow the controller to register as a UDC, enabling USB gadget drivers to
bind.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64=
/boot/dts/rockchip/rk3588s-roc-pc.dts
> index 7e179862da6e5..cf2e83664305d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
> @@ -813,6 +813,12 @@ &usb_host0_ohci {
> =20
>  &usb_host0_xhci {
>  	extcon =3D <&u2phy0>;
> +	role-switch-default-mode =3D "peripheral";
> +	usb-role-switch;

[Severity: Medium]
Will adding usb-role-switch here nullify the existing extcon functionality =
and
permanently break automatic OTG role switching?

During initialization, DWC3's dwc3_drd_init() unconditionally returns early=
 if
the usb-role-switch property is set, which skips the extcon_register_notifi=
er()
call entirely.

Because the board's PHY driver (phy-rockchip-inno-usb2) broadcasts ID pin s=
tate
changes exclusively via extcon and does not implement a usb_role_switch
provider, it appears DWC3 will never receive role switch events. Will this
cause the OTG port to be permanently locked into peripheral mode, preventing
USB host mode from functioning when an OTG cable is attached?

> +	status =3D "okay";
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709005006.4131=
45-1-festevam@gmail.com?part=3D1
