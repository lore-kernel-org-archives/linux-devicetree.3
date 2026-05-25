Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BCD38228B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716177; cv=none; b=hgDWTrpOcwHWj857TZreAfQsh8ZHj+Pyir/W1LqPK3XwenMm3dz0vVVJXuSdmm622klQmcH1oUg/iEShIRJNil1YcKtslOkbd5ZZc7UkYXQ+UbyKrfIMFgWbnnyPt8VDDUGRJlL6XOTG6iQBQthjDHOCsWSrXRv3NTsMSOZ2oP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716177; c=relaxed/simple;
	bh=RRhPkxE4SFGxOKOkz86PJ4O+CcCCrkrHlHtLfUUJrRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XujsWKMdxvu1YKUVn26nmEpsx+BDsdb16wif+5rIYdlrX05+jSnTwvHjfK5bi/Dy1eWbpuDrAfQBmoGmqIW2MPlo1m4bZsKPpWMX+EqgU2WrnZgPuMJIylNuDfspRurEi9ezAlOXOwg+jFTuBzrfBsghsjUzXdAFnYtg3PZ3L1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnkQlvcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnkQlvcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7D71F000E9;
	Mon, 25 May 2026 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779716175;
	bh=gftYTTFDNsPwN7s0Yy6eQKqBmuaqL2hrZvImmvb3NQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CnkQlvcl/2OAALvDj1tRM6rwaQih43BIsDyrIVaoCjRtc7KiBugs+YARpSrm1DB6O
	 uuKcIlY9mq3vPJLCBI50I0OMkZunCDRh7uQltwqhZmM8aopDbAI4s7uYl8Cjr0ixy3
	 wgr9l0s9r7BwFvttacQpA0Z75wx+nxkOTYZexpAryUmnZ10RASRcPeGnFXA5YrTUwk
	 H0ksmmIcWNdlIvr2qTWZYg9XAOHZ5LYxT51irUfNtU+PDMikJCG4myvEMjuZ2hqbWe
	 b6KKmbA0gXmz0AiPABHyanW10XhKBgHwE3d+qQBHdgQI9dL1n3Y/vNlWNJ0qo25ZMu
	 E2dNeoB261sCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/10] drm/rockchip: analogix_dp: Add support for
 RK3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525125331.140059-11-damon.ding@rock-chips.com>
References: <20260525125331.140059-11-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:36:14 +0000
Message-Id: <20260525133615.5D7D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `rk3576_edp` chip data table omits `.edp_mode` GRF register fi=
eld initialization, which may prevent the combo PHY from being properly con=
figured.

Pre-existing issues:
- [Critical] A `sprintf` call formats a potentially long device node path i=
nto a fixed 32-byte stack buffer `name`, causing a stack overflow vulnerabi=
lity.
--

commit d5d21d53d47c2f7f634710afc76442e39aeaf0f8
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Add support for RK3576

This commit adds dedicated chip data and a device tree matching entry to
bring up basic eDP functionality for the RK3576 platform. It notes that
the hardware blocks fully match the proven RK3588 design.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index d2af5eb29dbb5..d4c5dd61e95bb 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -522,6 +522,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[=
] =3D {
>  	{ /* sentinel */ }
>  };
> =20
> +static const struct rockchip_dp_chip_data rk3576_edp[] =3D {
> +	{
> +		.chip_type =3D RK3576_EDP,
> +		.reg =3D 0x27dc0000,

[Severity: High]
Does this missing .edp_mode initialization prevent the combo PHY from
being properly configured?

The commit message states that the RK3576 hardware blocks fully match
the RK3588 design. However, the RK3588 implementation uses .edp_mode to
configure the combo PHY via GRF when powering on the DP controller.

Because .edp_mode is left uninitialized here, when rockchip_dp_poweron()
calls rockchip_grf_field_write(), it will silently return 0 since .valid
is false, skipping the GRF configuration entirely.

[ ... ]

This isn't a bug introduced by this patch, but while reviewing this file
I noticed a pre-existing issue in rockchip_dp_drm_encoder_enable():

drivers/gpu/drm/rockchip/analogix_dp-rockchip.c:rockchip_dp_drm_encoder_ena=
ble() {
    char name[32];
    ...
    if (remote_port_parent) {
        if (of_get_child_by_name(remote_port_parent, "ports")) {
            ...
            sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id=
);
    ...
}

[Severity: Critical]
Since remote_port_parent->full_name points to the device tree node's full
name (which can exceed 32 characters), can this unbounded string write
overflow the 32-byte name buffer on the stack?

Additionally, it appears the name variable is never actually used for
anything after being formatted, meaning this vulnerability exists purely
in dead logic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525125331.1400=
59-1-damon.ding@rock-chips.com?part=3D10
