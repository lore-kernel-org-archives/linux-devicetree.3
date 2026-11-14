Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794634142;
	b=QnRw3tYu44eICgetvOJ7+P9PAra2wew1roIkf0fn8He88Ig+x2JiMfe46YPcIz1/OMQL
	 ry5QlpsiklkUjGC1og3UhPIPyXTnH1CaE3PK14QO3v17K9biJRan4BP4bP6hiX/4Kkk6y
	 v2Ggbzg2ZTs1JQ7jut6o6us8fCzpOGuLwosrmT+yoJEXKH7GO0MKr0ZqcWG254JsGjiKz
	 q9LlcBuBv+r7awg8HJ+fzsDyDlQlYXldBAZWkdGj7j30B8iShS3VoH2v7ncDAIJUQtYH5
	 hXXMhth9VVWYco6NZC7UE/6/YvpLaYE+haKr3ykRSIbiNAKmsBIiPMupF9yYFUxab3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794634142;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=auABPaom4rilh+GHLkAfmnNjj1XppDNBxPN7xHXigAw=;
	b=VbvYd38MoPrUF6nEXNBEaGq4CgkdxA+j2hNiZxZQ0782c9RGYiXWa/ZGD8ydR898eAek
	 hR742zTuNaHNVDTVNwqPKVVF7WrlSgobYJVIr50QIf5pQ+udpf4zlNXG48p2S1ucyJGSx
	 QS6/c7eh0uqbhF7B3VgKWHXw0SqE4e4jwUK8kieWk6YHDX4loOdcwEZ+n81kNaU/9CK2h
	 OiNIuAclSoooZIMFaMaPvYPrsoq0NjZYh1y6x1NG1jzjqNH/cxiybTwKj3ZdhVgm5LSba
	 t6w6qxwByMhWqAgpHNfrFydMN35M03PFj0TaXQw2T2BO/UCs5p+FtjBBNcUD0FkODcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSMgIfIm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78C606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSMgIfIm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5C61F000C4;
	Sat, 14 Nov 2026 05:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794634141;
	bh=auABPaom4rilh+GHLkAfmnNjj1XppDNBxPN7xHXigAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RSMgIfImRFkmXVHvtcOoOEcUdDzvNZ+YFuZY/bbqQdQLEWrsgZ+muqZ1EA4nxUfw8
	 WI78s6llb2LAcThL/XDGopTtp4DiGI9QjQq939CMAYZXRAj/Vo2TlBnPEeUp0SNh7w
	 ma/ZiVx6UWrKCyx5oBwt8yHT7AwIMwzXrDZZAVYm3aVwDLlXDIcXM/AtlkDKsEqwqF
	 e+fQwm1zTNrmV2VL8Ku72VtLeefkhGCW0fcHCJHsxcOgOL8keU8yy9ub8Hv43/owpQ
	 NsXXW14xypkcs4dziwcSjd5K8QmsniYrM4I3yxZXeWwd7ZDw/nbex9o7GVPSpH/yez
	 y5tdaiJ5rpkMQ==
Message-ID: <sashiko-outbox-214176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 15/23] drm/rockchip: dw_dp: Add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-15-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
 <20261114-synopsys-dw-dp-improvements-v12-15-d42d3dc5bdd4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 05:29:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/rockchip: dw_dp: unguarded phy_power_on() in
  dw_dp_bridge_edid_read()
--

commit 7986dcc1b84b1f1885c1e7812534566eeb9a1c10
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Add runtime PM support

This commit enables runtime PM with a 500ms autosuspend delay and wires up
runtime suspend and resume callbacks for the Rockchip DesignWare DisplayPort
driver.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index 1cc6cfad41042..99d948a7c51f9 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
[ ... ]
> @@ -229,6 +230,7 @@ static int dw_dp_rockchip_probe(struct platform_devic=
e *pdev)
>  	if (IS_ERR(dp->vo_grf))
>  		return PTR_ERR(dp->vo_grf);
> =20
> +	plat_data->autosuspend_delay =3D 500;
>  	plat_data->max_link_rate =3D plat_data_const->max_link_rate;
>  	plat_data->pixel_mode =3D plat_data_const->pixel_mode;
>  	plat_data->hpd_sw_sel =3D dw_dp_rockchip_hpd_sw_sel;
> @@ -251,6 +253,24 @@ static void dw_dp_rockchip_remove(struct platform_de=
vice *pdev)
>  	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
>  }
> =20
> +static int dw_dp_rockchip_runtime_suspend(struct device *dev)
> +{
> +	struct rockchip_dw_dp *dp =3D dev_get_drvdata(dev);
> +
> +	return dw_dp_runtime_suspend(dp->base);
> +}
> +
> +static int dw_dp_rockchip_runtime_resume(struct device *dev)
> +{
> +	struct rockchip_dw_dp *dp =3D dev_get_drvdata(dev);
> +
> +	return dw_dp_runtime_resume(dp->base);
> +}
> +
> +static const struct dev_pm_ops dw_dp_pm_ops =3D {
> +	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_r=
esume, NULL)
> +};

[Severity: Medium]
Does enabling runtime PM with autosuspend allow dw_dp_bridge_edid_read() to
call phy_power_on(dp->phy) while dp->dev and its VO power domain are
suspended?

Unlike dw_dp_bridge_detect() and dw_dp_bridge_atomic_enable(),
dw_dp_bridge_edid_read() powers on the PHY without first acquiring a runtime
PM reference on dp->dev, which is only resumed later inside
drm_edid_read_ddc() -> dw_dp_aux_transfer():

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_bridge_edid_read() {
	...
	ret =3D phy_power_on(dp->phy);
	if (ret)
		return NULL;

	edid =3D drm_edid_read_ddc(connector, &dp->aux.ddc);
	...
}

In USB-C mode, dp->dev autosuspends when idle.  If dw_dp_bridge_edid_read()=
 is
reached while dp->dev is suspended (for example, when the connector is forc=
ed
on so drm_helper_probe_detect() is skipped, or if autosuspend expires before
the EDID read starts), phy_power_on(dp->phy) on RK3576 and RK3588 calls
rk_udphy_dp_phy_power_on() -> rk_udphy_dp_lane_select(), which writes to
udphy->vogrf while the VO power domain is off and triggers an SError crash.
Even without the fault, resuming dp->dev later in dw_dp_aux_transfer() powe=
rs
on the VO domain and resets vo_grf, wiping out the lane mux settings written
by rk_udphy_dp_lane_select().

Should dw_dp_bridge_edid_read() acquire a runtime PM reference on dp->dev
before calling phy_power_on(dp->phy)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-synopsys-d=
w-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com?part=3D15
