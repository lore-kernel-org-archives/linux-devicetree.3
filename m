Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB6648DB49
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 18:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174628; cv=none; b=H1YmPG3gBj5qn4QXh15VSEk4lXBZu2RKmt7ER2QeHkrjsnR1Ioi8jGuNqzs+N1XRjh8zyL8EIKaHOQfux+F0wDo6Kn9HyWMtBiio/JH83jGUQmnH4C9v0ZyPOPAOzdVegLBpUFJEPxzl4RyVTlY2qpyt51raD3QSoMju1CLYEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174628; c=relaxed/simple;
	bh=aYibyYX10JFBwLbNh+SZologgrssPCHvnHc4w+I1obk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZL0JG5BhW4VRQu0cICPGolBxE8Kp4bgts3MleFtrupdXfyGNU/o3wXajgi7GXudJPKwd66tYZcTY0CNSBcDDJMdHbiCYkUxGA71tRwNoGsmVjiOhfDW3yHrkwse2mvADnCne1KgtGETgVZehiOrOdmLJgwxX7IPTvDeRz6cnOGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzkvPTHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzkvPTHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6D31F000C4;
	Fri, 16 Oct 2026 18:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792174627;
	bh=qhzTzwfxB4FUI9NuybMbOBFVPvM3VMC+au2duGOGqm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nzkvPTHCuAXE1zqei4dPE4TdUY5j7BsRb+iV0wp+VeiQr8FRenHiJI64ri2nHvd8W
	 yNvdA775FRMYpCbYi7m4ANoWLZk8CsLUHX//ZAxtYS6icQbuW2rWQpHOtx5/hrfFrn
	 2wCtDeXUUVzff5kDEEhMQ9fIMlesvjFZ+dWOIArvLQK9BoGTi4Scn1Ma4gdOlrxoHi
	 OSyVbgoB0nJ2dVnxXrTBhkyW5HzrqbQI1OUAJ1f3Ccp94bbVOaaopId/N9GZg8bVSu
	 QHKA5hURg0D8/iSAcXbuka6Gvt6M5O6w5O4OQCusFjuKRfwB+4oT81oTxxzkWHAxvt
	 CSvtJ9weiYwRQ==
Message-ID: <sashiko-outbox-174762@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/6] phy: realtek: usb2: add support for RTL9607C
 USB2 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rustam Adilov" <adilov@disroot.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016180314.31760-6-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-6-adilov@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:17:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phy: realtek: missing of_iomap() check leads to NULL dereference
--

commit 69e22da529f3cad44ca97c0c6f0a80e03f43ad7e
Author: Rustam Adilov <adilov@disroot.org>

phy: realtek: usb2: add support for RTL9607C USB2 PHY

This commit adds support for the USB2 PHY on RTL9607C series SoCs. It
includes new macros, configuration structures, big-endian access functions,
and logic to clear a force host disconnect bit during initialization.

> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy=
-rtk-usb2.c
> index 2ddad7be73534..64076938c821d 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c

[ ... ]

> @@ -600,6 +617,23 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, =
int index)
>  		goto do_toggle;
>  	}
> =20
> +	if (phy_cfg->force_host_disconnect) {
> +		const struct phy_reg_desc *reg_desc =3D phy_reg->desc;
> +		void __iomem *vstatus =3D phy_reg->reg_wrap_vstatus;
> +		u32 temp;
> +
> +		temp =3D reg_desc->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);

[Severity: High]
Can this result in a NULL pointer dereference?

If of_iomap() fails to map device memory, it returns NULL which is stored
without validation:

drivers/phy/realtek/phy-rtk-usb2.c:parse_phy_data() {
    ...
    phy_parameter->phy_reg.reg_wrap_vstatus =3D of_iomap(np, 0);
    ...
}

This new code in do_rtk_phy_init() relies on this pointer by dereferencing
vstatus via the read function. Does this need an error check during the
initial mapping or before this dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016180314.3176=
0-1-adilov@disroot.org?part=3D5
