Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777546;
	b=BUJeYzGU3R8aqSDKuymXtIBBv6M2z/gyo0Nj8RoiEbPZuSEFq3foRWUfztwqbDMRmZL/
	 w1HLeQM8XF0xceDa+kkENyRJcOBZTLaM5RU4QlGCSrxR1bjAWGKJdRgcx++ae0lWd01yK
	 LgfSwtGaiDvEr0OQq4jmRKFeiD4McWWfdFHPaMPTj/zFp3NU6l5xhNGtNbsyjAf9cs9v6
	 az77qtG2t0IKCojPvFyOYCkRCryO/ZZt3wmMJylL3VMbrgD0okf/PifxWm2HmoPqs5gpR
	 XaxCM5T1QCIEkk+/CU/K6sCI2pIzl6zwC3++gMerJ1B9qKRInY3glMnL/C+uIESng6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777546;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aF2PLK+N7bYUmYRTUbpUc827ulh7/qlQReRTHsGn8lE=;
	b=eWVc0JTWY6TFGYluc0EMvY7DfzYbwUCbcCYCgL6unhhmy7MjovfgGCxq0ffGR2nDmmPz
	 Pjm58bK+ikCyynigU5+lqv0xdIf8Rsc2i7ftg2eWCejjjtSSQZ558eVW9XQUFvTuMeaeu
	 A6fM/k5lwOS1cpTz0rV7lCyHIHBnzNWjuUm0B78wL18Q5vIcjQ2THFNxR6CNTDfwtAIzM
	 2kEny1D6U142vJgq4z3xm1o618v0LSdYqicJjv0v45373PtrVW9KnxeDK0GyzMeyW0Eo8
	 WKUdPLvFGYF4Gd3xCikmcJ8MgOUzS3pl0LNwf+ce3H2wHlSpbb6RJ9z1yE/Io3kLV5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4L1AjCh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE011606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4L1AjCh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A551F0089F;
	Fri, 27 Nov 2026 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777545;
	bh=aF2PLK+N7bYUmYRTUbpUc827ulh7/qlQReRTHsGn8lE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M4L1AjCh6Wj+eT+43vkq1oISt05FcN7nMWup6ggbTqJjKF7adNUHoco1Rauwasvkb
	 3gnfhu6PRACYW9P2gk/vABW6AMflu1IgqoFKet8SPlNyn5j1wHL7a47est34GWqOZK
	 SjTgnfrJtoLiPGS5w7mS+J1kRmTNTLTO5pZV00j3qQ2L4JTKlQ8BH4J+7kz/WbPhTG
	 T8vXl4+3IGq2zaC7xzQXa7dquR4Q/liQxfsYP1cSs1bcP41yMegi32uhNGm0JL29as
	 gHwB/c268t+fB8kSiY5lZhRK2SErHdB7LoSq5LLvxMXhSs/kd6p8dn2ghjx3S0mnKm
	 E9vzBUntz9glA==
Message-ID: <sashiko-outbox-237212@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] arm64: dts: rockchip: Add USB-C DP AltMode for
 RG-Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-8-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
 <20261127-rockchip-usb-c-dp-altmode-v2-8-77ee78869307@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:05:43 +0000
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
- [High] arm64: dts: rockchip: connecting vp2 on RK3576 fails in
  vop2_create_crtcs()
--

commit 99a502d224b0a9ebbacac11ac289a2bf3c184e45
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

arm64: dts: rockchip: Add USB-C DP AltMode for RG-Vita-Pro

This commit enables DisplayPort over USB-C AltMode on the Anbernic
RG-Vita-Pro and updates the USBDP PHY and USB-C connector port graphs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> index 85576a437f7bf..5da90f3792a14 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> @@ -469,6 +469,22 @@ mipi_out_panel: endpoint {
>  	};
>  };
> =20
> +&dp {
> +	status =3D "okay";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp2: endpoint {
> +		remote-endpoint =3D <&vp2_out_dp0>;
> +	};
> +};

[ ... ]

> @@ -1221,6 +1240,13 @@ vp1_out_dsi: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
>  	};
>  };
> =20
> +&vp2 {
> +	vp2_out_dp0: endpoint@a {
> +		reg =3D <ROCKCHIP_VOP2_EP_DP0>;
> +		remote-endpoint =3D <&dp0_in_vp2>;
> +	};
> +};

[Severity: High]
Does enabling vp2 alongside vp0 (HDMI) and vp1 (DSI) cause
vop2_create_crtcs() to fail with -ENOENT ("no primary plane for vp 2")?

In rk3576_vop_win_data[], only Cluster0-win0 and Cluster1-win0 have
DRM_PLANE_TYPE_PRIMARY, and their possible_vp_mask is BIT(0) | BIT(1).
All four windows that can feed vp2 (Esmart0-win0 through Esmart3-win0,
with BIT(2) in possible_vp_mask) are marked DRM_PLANE_TYPE_OVERLAY:

drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:rk3576_vop_win_data[] {
	{
		.name =3D "Cluster0-win0",
		...
		.possible_vp_mask =3D BIT(0) | BIT(1),
		...
		.type =3D DRM_PLANE_TYPE_PRIMARY,
	}, {
		.name =3D "Esmart0-win0",
		...
		.possible_vp_mask =3D BIT(0) | BIT(2),
		...
		.type =3D DRM_PLANE_TYPE_OVERLAY,
	...
}

drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:vop2_create_crtcs() {
	...
			if (win->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
				possible_crtcs =3D BIT(nvp);
				vp->primary_plane =3D win;
				ret =3D vop2_plane_init(vop2, win, possible_crtcs);
				...
				break;
			}
		}

		if (!vp->primary_plane)
			return dev_err_probe(drm->dev, -ENOENT,
					     "no primary plane for vp %d\n", i);
}

When vop2_create_crtcs() reaches vp2, no window matches
DRM_PLANE_TYPE_PRIMARY, so vop2_bind() fails and breaks all display
outputs on the board.  In addition, because vop2_plane_init() has already
linked the primary planes for vp0 and vp1 onto
drm->mode_config.plane_list, freeing the devm-allocated vop2 struct on
component_bind() failure leaves dangling plane pointers that trigger a
use-after-free during drm_mode_config_cleanup().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-rockchip-u=
sb-c-dp-altmode-v2-0-77ee78869307@collabora.com?part=3D8
