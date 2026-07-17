Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C233D9544
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290391; cv=none; b=KhZcAE/klzsxy1PYO1DyxNfa7anMuge+b5Kxvth9xb+i/e7ZkM5gtPJPyy8gWXHzYp2QgvAK72bfDgZqZPZQxK95TK6BaSJuhT3tuquh4v9DDSl0RqHLZX+4SD5T8Ypl7p0mzS2wD8JFWZUcQ+u/28i4vdMwlNk0UuWumqO+7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290391; c=relaxed/simple;
	bh=6MqCjwlRWDh+7PHHRm+HoGeayjbE16nrhVvT5x12nPg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RPmuYMN2TrRgwheukIVo0WJprB4tFGO4jrCNgI4US+N1Yxv9p1iqKGp6081MywrAMfb0gbaiD+FKzyYTtErASYSBkQD0wz1AxVq0EWfRCGvvsLZJ7Fm2MLEZUt2SNRqMtoJ0zgkqGqcwkfdU9O6ZVoBIeKk5E+tUX4405z6cdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcU97OMj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcU97OMj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516801F00A3A;
	Fri, 17 Jul 2026 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784290389;
	bh=ElezS0WYB0NgqrALvkL3x+t5At485IQls53FF30xxlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NcU97OMjZHE7k7siyYU72SJu3vMM170/KTGIOkqMjS6LTuHgP+iKxz7/pXlxeVH1S
	 EbHOQmCa8g1RJeuOGWyCw3mUmyx/2iOppFKn1Nt/hzWSip/1kXmbULGg+Ey5H/xh4C
	 +45U2tvqcpk7LZRZJR5JJwaP/UxvUMjngbuSu9H1fh2PRyrstLR/CYMxb8+HfQi7/O
	 tIwczj+hP7CVoBRVlIB0wYX3gyNFW9XvtGSs5bg6zfzjVnCAiShbBcifjnJspDHJXe
	 J56FyRL8xNhSJfatgrAxIYNe+pqefKK/LczYGlkItpzLafLa5A6im9TYFnMEg8CLap
	 f98Le0gxpnaiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: rk356x: add LVDS node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rok Markovic" <rok@kanardia.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260717120005.2087386-5-rok@kanardia.eu>
References: <20260717120005.2087386-1-rok@kanardia.eu>
 <20260717120005.2087386-5-rok@kanardia.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:13:08 +0000
Message-Id: <20260717121309.516801F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing Hardware Clock Initialization for RK3568 LVDS
- [Medium] Unbalanced Hardware Resource Teardown in Error Paths
--

--- Patch [4]: [PATCH 4/4] arm64: dts: rockchip: rk356x: add LVDS node ---
commit bfe12cef9ca639b004d58e050ef9175743345f7b
Author: Rok Markovic <rok@kanardia.eu>

arm64: dts: rockchip: rk356x: add LVDS node

This commit adds the LVDS transmitter node for the RK356x SoC, assigning
its clock, physical interface, and power domains. It is left disabled by
default, to be enabled by specific board files.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd392..2b3beab5507b1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -879,6 +879,31 @@ hdmi_out: port@1 {
>  		};
>  	};
> =20
> +	lvds: lvds {
> +		compatible =3D "rockchip,rk3568-lvds";
> +		clocks =3D <&cru PCLK_DSITX_0>;
> +		clock-names =3D "pclk_lvds";

[Severity: High]
Does the driver actually use this clock?

Looking at rk3568_lvds_probe() in drivers/gpu/drm/rockchip/rockchip_lvds.c,
it seems to completely omit fetching the required pclk_lvds clock from the
device tree:

drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_probe() {
    ...
    lvds->dphy =3D devm_phy_get(&pdev->dev, "dphy");
    if (IS_ERR(lvds->dphy))
        return PTR_ERR(lvds->dphy);

    return phy_init(lvds->dphy);
}

Because lvds->pclk is left NULL, the clk_enable() call in
rk3568_lvds_poweron() acts as a no-op:

drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_poweron() {
    ...
    ret =3D clk_enable(lvds->pclk);
    if (ret < 0) {
    ...
}

Will this cause hardware registers to be accessed without a running clock,
potentially leading to system hangs on device probe or modeset?

> +		phys =3D <&dsi_dphy0>;
> +		phy-names =3D "dphy";
> +		power-domains =3D <&power RK3568_PD_VO>;
> +		rockchip,grf =3D <&grf>;
> +		rockchip,output =3D "lvds";
> +		status =3D "disabled";
> +
> +		ports {

[Severity: Medium]
Will enabling this hardware expose an unbalanced resource teardown in the
driver's error paths?

If intermediate steps like phy_set_mode() fail in
rk3568_lvds_encoder_enable(), the function returns early without rolling
back earlier successful calls:

drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_encoder_enable() {
    ...
    ret =3D phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
    if (ret) {
        DRM_DEV_ERROR(lvds->dev, "failed to set phy mode: %d\n", ret);
        drm_panel_unprepare(lvds->panel);
        return;
    }
    ...
}

Because .enable() returns void, the DRM core assumes it succeeded and will
later call .disable(). The rk3568_lvds_encoder_disable() function
unconditionally tears down all resources:

drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_encoder_disable() {
    struct rockchip_lvds *lvds =3D encoder_to_lvds(encoder);

    drm_panel_disable(lvds->panel);
    phy_power_off(lvds->dphy);
    rk3568_lvds_poweroff(lvds);
    drm_panel_unprepare(lvds->panel);
}

Could this cause refcount underflows for PHY, PM runtime, and clocks,
resulting in kernel warnings if they were never successfully enabled?

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			lvds_in: port@0 {
> +				reg =3D <0>;
> +			};
> +
> +			lvds_out: port@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717120005.2087=
386-1-rok@kanardia.eu?part=3D4
