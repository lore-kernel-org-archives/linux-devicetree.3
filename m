Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427EA3B14C1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175588; cv=none; b=uhPNMEUsUeRgW9lwsLhQ+ygTfRZCgWCFD+oFLwjkBYfqjsuGHZRZbBwdLhEHrjBc5hG8bXXPZyOJLrrJ47WGs65uBZAvQqeHh2cTNafI0lsWDROTgqCqJm5oVi8Rvwzds73HK+/Nir+6jLkfVG02UmvzhmR8V5JW+woHfpRkDyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175588; c=relaxed/simple;
	bh=wiAVf0NVLG7dsdB/WMhXJB0oROSxgfasGpw6Q/Nf0rc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E/ad7HVdydJ4M4MjCuAEsWeaI5MsVKbsCdVaTJGhDFC11JuoJtDBXRWvsCJawmF2lzJqfBNb1VaAKNMekk16xZ8lTtJz4p/akO8gtrEpLmVhN7ycqMNyIaDtMfbeXMqF9DtwYg77e3eipPJJDU7qOwjmamDUqiXOb8tGZL30jDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsOXq6ln; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsOXq6ln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1C81F000E9;
	Mon, 27 Jul 2026 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175586;
	bh=2vnikrI3oGEF7f8Kn9hsDQOmcJmRIKljLsP+SnFzpkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsOXq6lnAU8PnJJx5kuEzxSETI3KumqqcUOrU4/eQ6Tmh+jbIXB8v8yE7IldNcTQf
	 piCkyVoP4yaBMMZIOL5k0Pgq+SbwGnv8sDvxr9Z/tKx5R8NSaFU3almqcQayqSsOAH
	 pidgdYe7vF+KVnAsoHwur8hkvKrpYNQ6ClFsjJph0UoPTixVG6enYr4mMmoCoiFWfe
	 xKEQ+F6zWA/VNR7YSgMrsesUkkxa7rCkY1kYPsB8w5FN4/0pyGM6g8XncpU4H/j9HI
	 MA4i6h+r3/GTe1uTxQ/c35Tc/g2vQAzlSq4++yo3ytB3yB0tQw/bGA32NFSI72/aHc
	 953WiU55zI3hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Drop data-mapping from Engicam
 PX30 Core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727175502.2585290-1-festevam@gmail.com>
References: <20260727175502.2585290-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:06:26 +0000
Message-Id: <20260727180626.9F1C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Removing the `data-mapping` property causes a regression in the Ro=
ckchip LVDS controller, silently defaulting the PHY format to 18-bit VESA i=
nstead of 24-bit VESA.

Pre-existing issues:
- [High] The `px30_lvds_grf_config` function incorrectly passes a dynamic v=
alue as the mask to `regmap_update_bits`, preventing it from clearing forma=
t configuration bits.
--

--- Patch [1]: [PATCH] arm64: dts: rockchip: Drop data-mapping from Engicam=
 PX30 Core ---
commit 9e01384e585886fe7dfe0bda8fec7f830eade509
Author: Fabio Estevam <festevam@gmail.com>

arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core

The commit removes the data-mapping property from the panel node to satisfy
the panel-simple DT schema. The commit message states this has no functional
effect because the DRM OF helpers translate the bus format, falling back to
the descriptor's format when the property is absent.

> diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-=
of10.dts b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10=
.dts
> index 47aa30505a42e..aa636ce45e3a9 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
> +++ b/arch/arm64/boot/dts/rockchip/px30-engicam-px30-core-ctouch2-of10.dts
> @@ -28,7 +28,6 @@ panel {
>  		compatible =3D "ampire,am-1280800n3tzqw-t00h";
>  		backlight =3D <&backlight>;
>  		power-supply =3D <&vcc3v3_lcd>;
> -		data-mapping =3D "vesa-24";

[Severity: High]
Does removing this property inadvertently break the host LVDS controller
configuration?

The commit message assumes only the panel-simple driver uses this property,
but the rockchip LVDS host controller driver bypasses the framework and
reads it directly from the remote panel device tree node:

drivers/gpu/drm/rockchip/rockchip_lvds.c:rockchip_lvds_bind() {
    ...
    if (of_property_read_string(remote, "data-mapping", &name))
        /* default set it as format vesa 18 */
        lvds->format =3D LVDS_VESA_18;
    ...
}

By removing the property, will this fallback to LVDS_VESA_18 be triggered,
causing a mismatch with the 24-bit VESA panel and corrupting the display
output?

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the rockchip
LVDS driver's format configuration, I noticed a potential issue with how
the register bits are cleared:

drivers/gpu/drm/rockchip/rockchip_lvds.c:px30_lvds_grf_config() {
    ...
    return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
                              PX30_LVDS_FORMAT(lvds->format),
                              PX30_LVDS_FORMAT(lvds->format));
}

Does this incorrectly pass the dynamic value PX30_LVDS_FORMAT(lvds->format)
as both the mask and the value?

Because regmap_update_bits() uses the mask argument to determine which
bits to clear in the lower 16 bits, passing the value as the mask means any
0-bits in the format will be 0 in the mask and ignored instead of cleared.=
=20

If the bootloader left the format in a different state (e.g., LVDS_JEIDA_18=
),
will the kernel fail to clear the necessary bits to switch it to LVDS_VESA_=
24?

> =20
>  		port {
>  			panel_in_lvds: endpoint {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727175502.2585=
290-1-festevam@gmail.com?part=3D1
