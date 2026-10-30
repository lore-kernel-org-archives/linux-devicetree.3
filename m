Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346977;
	b=yw/b6OGKTV7YsquT41JIY/6iBjnunCbPNIfHAypwr3YnEXnuw5pJGrsYKK8w1QgH5lNI
	 XUmzNWCG74fNoCAccvN6+vorTSxvriPkrD+1ajqMC0LmJVDHTGBxQ7JjiwYoeeWfhUN1J
	 LfVNchgerJk+1NA4tmJcyB7agtHrOOpbpfCulaxNzL0nZZ0XeGnn0qSa1MwJ9oiJKp9Gw
	 O3Q+LXK3gn5yBJ6IE4yPyKyx0Xnv8udk0biU2FyoKvrhrO0F/3LR0ZsxJdE9qqZURz3zS
	 2PV4mqJ0de7OOQEUAiR+9CqF49/oCeujjPEojih3CGgbFatcDrPivs3Ob9/dr6C5d5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346977;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Abu3ddKTTXe/ixDDRA5g4+pU1RtH142rNVRWCRepPwc=;
	b=qgaQgxVtQ3Kq9ASvZdTuRV71PeRJjSyxQIgIbuaQI45AKGB15HXJ4500utaMiGHVMFQf
	 5kN8uVWkRMXmGWDAM5avI+EGp0OtebFqFUJLnxNh6lWM9+ZHsckfjdpiL6LAe+dkGqOHs
	 h3KDO4rIdeSWXxow+Y34m3MpTdbXZTHf/4HNjcYIZfdVVXE+6xt7POXhgS8sVHd0UM7vv
	 1wSGa5QCUv3YEWAA7VSA0gemiufbdv7wd6Xl4OC3Ejy/g11jNPLwDrcCz9DNBJxcQ84cW
	 wBKpVRmqIAHKx9GGukqW1RDwW2t7fz0mSpeEY3LCwu93UiX1/d12M107jaTmwyJHRqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEfNRyaR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431A606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEfNRyaR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26EA1F000C1;
	Fri, 30 Oct 2026 07:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793346977;
	bh=Abu3ddKTTXe/ixDDRA5g4+pU1RtH142rNVRWCRepPwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QEfNRyaR8fP3AjKw+JEmThGfCKimiacSMhzPGd1NV+DT5DYwP+OzHJY55t4y/AA3h
	 AtShlgfE6WFNrI6yE4L+fCvli7Wq0Yn9RSMRqIuBbo86u8h5Pv2Bh8/8fetk5GMJ3s
	 L3BPMWeO7PYxhFIyCJupdUlK44Qi8hhCJeTfBcyPu70RpJStufsiw2GdPTRmkug0qJ
	 pB7BnTE9dB7B3b5+bjRoXIjvFSPbJKTe/jqLCUxHfGjIpNPONu59CnNMLDYUrTDOw2
	 CpuD4EB6GGPtlQFfwA3cwVp+EBWIsI/U8PodThyEqNC+Sj9CuInIO2H8BbmLLORelf
	 JIcEd5xvjrqLw==
Message-ID: <sashiko-outbox-190668@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] drm/bridge: dw-mipi-dsi: add PHY write function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030-th1520-dw-mipi-dsi-v1-2-753f34fd304f@iscas.ac.cn>
References: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
 <20261030-th1520-dw-mipi-dsi-v1-2-753f34fd304f@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:56:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/rockchip: dsi: uninitialized dsi->dmd in dw_mipi_dsi_dphy_powe=
r_on()
--

commit bdfb343509e10a4a68b931e1345f0a0c640cfd6f
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

drm/bridge: dw-mipi-dsi: add PHY write function

This commit moves dw_mipi_dsi_phy_write() from the Rockchip glue driver
to the common dw-mipi-dsi bridge code and updates the Rockchip DSI driver
to call the shared helper using its struct dw_mipi_dsi pointer.

> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 268d4993a04fd..469123620f302 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c

[ ... ]

> @@ -1224,6 +1203,7 @@ static int dw_mipi_dsi_dphy_configure(struct phy *p=
hy, union phy_configure_opts
>  static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
>  {
>  	struct dw_mipi_dsi_rockchip *dsi =3D phy_get_drvdata(phy);
> +	struct dw_mipi_dsi *dmd =3D dsi->dmd;
>  	int i, ret;
> =20
>  	DRM_DEV_DEBUG(dsi->dev, "lanes %d - data_rate_mbps %u\n",
> @@ -1273,15 +1253,15 @@ static int dw_mipi_dsi_dphy_power_on(struct phy *=
phy)
>  	 * Configure hsfreqrange according to frequency values
>  	 * Set clock lane and hsfreqrange by lane0(test code 0x44)
>  	 */
> -	dw_mipi_dsi_phy_write(dsi, HS_RX_CONTROL_OF_LANE_CLK, 0);
> -	dw_mipi_dsi_phy_write(dsi, HS_RX_CONTROL_OF_LANE_0,
> +	dw_mipi_dsi_phy_write(dmd, HS_RX_CONTROL_OF_LANE_CLK, 0);
> +	dw_mipi_dsi_phy_write(dmd, HS_RX_CONTROL_OF_LANE_0,
>  			      HSFREQRANGE_SEL(dppa_map[i].hsfreqrange));
> -	dw_mipi_dsi_phy_write(dsi, HS_RX_CONTROL_OF_LANE_1, 0);
> -	dw_mipi_dsi_phy_write(dsi, HS_RX_CONTROL_OF_LANE_2, 0);
> -	dw_mipi_dsi_phy_write(dsi, HS_RX_CONTROL_OF_LANE_3, 0);
> +	dw_mipi_dsi_phy_write(dmd, HS_RX_CONTROL_OF_LANE_1, 0);
> +	dw_mipi_dsi_phy_write(dmd, HS_RX_CONTROL_OF_LANE_2, 0);
> +	dw_mipi_dsi_phy_write(dmd, HS_RX_CONTROL_OF_LANE_3, 0);
> =20
>  	/* Normal operation */
> -	dw_mipi_dsi_phy_write(dsi, 0x0, 0);
> +	dw_mipi_dsi_phy_write(dmd, 0x0, 0);

[Severity: High]
Can dsi->dmd be NULL or an ERR_PTR when dw_mipi_dsi_dphy_power_on() is
called?

In dw_mipi_dsi_rockchip_probe(), the PHY provider is registered before
dsi->dmd is initialized:

drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c:dw_mipi_dsi_rockchip_probe(=
) {
	...
	phy_set_drvdata(dsi->dphy, dsi);
	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
	if (IS_ERR(phy_provider))
		return PTR_ERR(phy_provider);

	dsi->dmd =3D dw_mipi_dsi_probe(pdev, &dsi->pdata);
	if (IS_ERR(dsi->dmd)) {
	...
}

Previously, dw_mipi_dsi_dphy_power_on() wrote through dsi->base, which is
already mapped before devm_of_phy_provider_register(). With this change,
dw_mipi_dsi_dphy_power_on() passes dsi->dmd to dw_mipi_dsi_phy_write(),
which dereferences dmd->base.

If a PHY consumer (such as rkisp1 on RK3399) acquires the PHY and calls
phy_power_on() -> dw_mipi_dsi_dphy_power_on() while dw_mipi_dsi_probe() is
still running, or after dw_mipi_dsi_probe() fails and before devm unwinds
the PHY provider registration, wouldn't dw_mipi_dsi_phy_write() dereference
a NULL or ERR_PTR dmd?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-th1520-dw-=
mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn?part=3D2
