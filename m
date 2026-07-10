Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6433B42EB
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718200; cv=none; b=OjatLrEbNXMqtsv+Qrhpz52rFl4bg8Ggz0Ckd9v1rLmiwa/Cx6zuC84xPX44Fo8pTCd0C8nCmkCCrBiGjO3Fcd0oUISkKGROus/7ex7GJlNAUp0v0OiLNQryAGxTQeo1zaTE2b3O9WLCG9AUi/mhiEEZiv1CHNrP5kigCDZjebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718200; c=relaxed/simple;
	bh=lh8TPBtlJ5qVJLMYxhboKwcs68i/i2GNHdZp3pIe0w8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GWOQ9mdWHMBsiVoB3sxXMhU6Na0yb/k5bWNt4o1ohkmvnuwcSpGtLHU+Be1bzQyTasCPmdvQE48H7hcQv6S540yL5/hSzdq7RcqrqMv+I6Xm3YdiJaTWhEYQxQG1uQMQ4Fk+kDxtlN3QgEUg5hPcWc0nEBK9sADupOBz1mtpC3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+Zcr5tq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+Zcr5tq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1931F000E9;
	Fri, 10 Jul 2026 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718197;
	bh=12icJYmwYDzIIrN4/eccRU07QaJ0TSWVnjPP+v/7N/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+Zcr5tqmLObUI+tOj9IVzy5c0yeHCo/GRsXXOKcE1MMLECSrx2iL/FzaUthe+t2/
	 eYi7TEzjRNrx2IhI1YWyGKwCCMAWwtSKe3ru+1GLILdOHVMGRbrHNjHQr6H5LL78eb
	 LWtZhzjiYQzAq5NaZc/NMmSmyQSSFWKSXFQEGhpxrzeyf3IfNTG3jLCwTTfQlgBpgR
	 UOAkLEKJAMTXCpgZa+aCL1+eKlsU6HqlOhUZro3vxr/tRJKfvvNR4uqE3aGtgaHLjF
	 QrredE7ThSURttJt6KQoZBCJXAHsxmP0S00uXf2BWpFkNt7/yAzTfCUGxIYZ97vwoY
	 dMPcKRDClSbMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 20/36] phy: rockchip: usbdp: Factor out lane_mux_sel
 setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-20-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-20-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:16:36 +0000
Message-Id: <20260710211636.AB1931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Type-C states TYPEC_STATE_SAFE and TYPEC_STATE_USB incorrectly fal=
l through to TYPEC_DP_STATE_D configuration, leaving the PHY in UDPHY_MODE_=
DP_USB mode.
- [High] The `rk_udphy_dp_phy_configure()` callback accesses and modifies s=
hared PHY state without holding the `udphy->mutex`, leading to a race condi=
tion with concurrent Type-C events.
--

--- Patch [20]: [PATCH v12 20/36] phy: rockchip: usbdp: Factor out lane_mux=
_sel setup ---
commit 3727c9684937e2c6c25ea6548ada704fecefa99a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Factor out lane_mux_sel setup
   =20
Avoid describing the USB+DP lane_mux_sel logic twice by introducing
a helper function to reduce code duplication.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 4b454798c4ed4..4e54020d17551 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -582,6 +582,42 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy=
, u8 mode)
>  	udphy->mode =3D mode;
>  }
> =20
> +static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned lo=
ng state)
> +{
> +	u8 mode;
> +
> +	switch (state) {
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:
> +		udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[1] =3D PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
> +		mode =3D UDPHY_MODE_DP;
> +		udphy->dp_lanes =3D 4;
> +		break;
> +
> +	case TYPEC_DP_STATE_D:
> +	default:

[Severity: High]
This is a pre-existing issue, but does this default case correctly handle
TYPEC_STATE_SAFE and TYPEC_STATE_USB?

When the Type-C subsystem exits DP AltMode or transitions to a safe state,
the mux callback rk_udphy_typec_mux_set() receives state->mode set to
TYPEC_STATE_SAFE (0).

Because rk_udphy_set_typec_state() does not explicitly handle 0, it falls
into the default case here, incorrectly setting udphy->dp_lanes =3D 2 and
mode =3D UDPHY_MODE_DP_USB.

Should TYPEC_STATE_SAFE and TYPEC_STATE_USB explicitly disable the DP lanes
instead of defaulting to DP_USB mode?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing lock in
rk_udphy_dp_phy_configure() that could race with Type-C events?

Looking at rk_udphy_dp_phy_configure() in
drivers/phy/rockchip/phy-rockchip-usbdp.c:

    static int rk_udphy_dp_phy_configure(struct phy *phy,
                                         union phy_configure_opts *opts)
    {
        struct rk_udphy *udphy =3D phy_get_drvdata(phy);
        struct phy_configure_opts_dp *dp =3D &opts->dp;
        u32 i, val, lane;
        int ret;
   =20
        if (dp->set_rate) {

It appears to access and modify shared PHY state without holding udphy->mut=
ex.

Concurrently, a Type-C event such as rk_udphy_typec_mux_set() running in a
workqueue modifies udphy->dp_lane_sel and udphy->dp_lanes while holding
udphy->mutex.

Could rk_udphy_dp_phy_configure() read inconsistent values and cause
out-of-bounds register writes if it gets an invalid index from dp_lane_sel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D20
