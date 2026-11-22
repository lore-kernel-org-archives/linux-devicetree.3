Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351491;
	b=U3IWgq2B3BdM7ZRr0gQrvog1p2aHPg9Yu/D6LZHLd38CmcRin7CklrYwQyGPi/S9jc0I
	 OUyhma+OG5c0bALsDD6scJ8P6KuJqvkdRLV0EqtNGTU6glumemwJb8DUrs4Tx7YyKJQll
	 ZXxuSa6f3KaAcCRUcQ5/LLNrJUS5oy28o2qgsVp+tpfRvYpUlPlf44ctjz9WJ8MH2dEMU
	 igKjX6cAA1VxssFNn5tGjFCJODQOoLJP3UaLzQ4uSyKI//CT7b/GPPFID7qnj5c1oD2+R
	 JIt2fT0HRuCDKTKoPRmEGIVlghSQKJEZrjKGcau7T5FmTEE5zb0ezDZIk/3y+wm/8qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351491;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M50sh4WSc/gULxm3e6G9o/daS1/iwU28A/reqPrB0QM=;
	b=XcwFQd0GRIcCe23Y8n1Cz3vaS0PaS/Fy1ZlHvVEsHBZTYv71Kj6JFCd757ir9iTYJrKR
	 xabWJ2HiHO20KqyrdQCQNR72Wo5fcuGR9vFPL32qKnwDORc+LRq6WTeZ4XTeMVdU3uetz
	 SXoZV6VyObLE4NaJWQKWGv4QToFK2/DKkXnu/C5PqAF3P/IfxeGpb5lOzwOhnrWBHreQ3
	 dW67RfbJYAVG9Q+WNBK2J8x/ZAxdLpvscFV14qqDydkkiAs3dYyzD0/TV0WmKz+LwuyTq
	 uH6m7zN7PoH+aUdcRHzxGy3+WllMCRS1AIndUzZkPM7ut0sjLjOtdmhjinvJs9d4cKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsi5xdIe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEA7606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xsi5xdIe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726651F000CF;
	Sun, 22 Nov 2026 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795351490;
	bh=M50sh4WSc/gULxm3e6G9o/daS1/iwU28A/reqPrB0QM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xsi5xdIeuVF5i8+VH2GaN8hZ1pNWZXFmrmbABpdT3IjZDroZRxncPDlVSyVHAvsEe
	 WUYub+oymc0avfg6qq69lF7IDb40IiB0HEmEb69lnLKIPOdQ7BAr3+gd8j00ZdojCn
	 kINoPY1d4D2cI46kKiMBO14qr2Ghl759P3t6Ws8YVsPudNNEuNPh9Z3qZN1OlfUPF/
	 PJAPJgRyHEnGcerlE5nWxJR9sNjt+puZbK4kXv/R24b8+TeWABGuXwtb25uLSitqlz
	 wiZwk6jWqKRtct9qPj0cVM6P0sB03p4yLhPzGQXGMUFIq/dQ1D4YRSYOPKRC6wrJhB
	 wpPqcidPXrdlQ==
Message-ID: <sashiko-outbox-227933@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] phy: apple: atc: Add T8122 DisplayPort support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261122-t8122-phy-v2-4-8d5c8fdf31ba@chaosmail.tech>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-4-8d5c8fdf31ba@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 12:44:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] phy: apple: atc: missing RCAL1 poll for DP mode in
  atcphy_wait_rcal1_done_t8122()
- [Medium] phy: apple: atc: incomplete lane reconfiguration in
  atcphy_sw_set()
--

commit 82ef5fe4b6ea8a9fcb315bd8a7aac593736df7fc
Author: Ramzi Abdiche <abdicheramzi@gmail.com>

phy: apple: atc: Add T8122 DisplayPort support

This commit adds DisplayPort AUX and link setup support for T8122-family
Type-C PHYs and stops active DisplayPort lanes before changing cable
orientation.

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 398b2be5dd116..647093bb70f1b 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
[ ... ]
> @@ -1931,10 +2483,8 @@ static void atcphy_configure_post_tunable_t8103(st=
ruct apple_atcphy *atcphy, enu
>  	udelay(10);
>  }
> =20
> -static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atc=
phy, enum atcphy_mode mode)
> +static void atcphy_power_on_common_t8122(struct apple_atcphy *atcphy)
>  {
> -	if (atcphy_modes[mode].pipehandler_state !=3D ATCPHY_PIPEHANDLER_STATE_=
USB3)
> -		return;
>  	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL);
>  	udelay(10);
>  	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);

[Severity: Medium]
Should atcphy_wait_rcal1_done_t8122() also poll AUS_COMMON_DIG_RCAL1 when
DisplayPort is enabled?

With atcphy_hw_t8122.dp set in this patch,
atcphy_configure_post_tunable_t8122() calls atcphy_power_on_common_t8122()
whenever atcphy_modes[mode].enable_dp_aux is true, including in 4-lane
APPLE_ATCPHY_MODE_DP where pipehandler_state is
ATCPHY_PIPEHANDLER_STATE_DUMMY:

drivers/phy/apple/atc.c:atcphy_configure_post_tunable_t8122() {
	if (atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STATE_U=
SB3 ||
	    (atcphy->hw->dp && atcphy_modes[mode].enable_dp_aux))
		atcphy_power_on_common_t8122(atcphy);
}

drivers/phy/apple/atc.c:atcphy_wait_rcal1_done_t8122() {
	...
	if (atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STATE_U=
SB3) {
		ret =3D readl_poll_timeout(atcphy->regs.core + AUS_COMMON_DIG_RCAL1, reg,
					 (reg & AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE), 10, 100000);
	...
}

Because atcphy_wait_rcal1_done_t8122() only checks for
ATCPHY_PIPEHANDLER_STATE_USB3, configuring APPLE_ATCPHY_MODE_DP powers on
the AUS common block and releases PHY reset without waiting for resistor
calibration to finish.

Also, the hunk introducing the new atcphy_configure_post_tunable_t8122()
that calls atcphy_power_on_common_t8122() and dereferences atcphy->hw->dp
was placed in the earlier commit "phy: apple: atc: Add initial M3 series
support", which breaks git bisect compilation at that commit.

[ ... ]

> @@ -2290,20 +2855,32 @@ static int atcphy_probe_rcdev(struct apple_atcphy=
 *atcphy)
>  static int atcphy_sw_set(struct typec_switch_dev *sw, enum typec_orienta=
tion orientation)
>  {
>  	struct apple_atcphy *atcphy =3D typec_switch_get_drvdata(sw);
> +	bool swap_lanes;
> +	int ret;
> =20
>  	guard(mutex)(&atcphy->lock);
> =20
>  	switch (orientation) {
>  	case TYPEC_ORIENTATION_NONE:
> -		break;
> +		return 0;
>  	case TYPEC_ORIENTATION_NORMAL:
> -		atcphy->swap_lanes =3D false;
> +		swap_lanes =3D false;
>  		break;
>  	case TYPEC_ORIENTATION_REVERSE:
> -		atcphy->swap_lanes =3D true;
> +		swap_lanes =3D true;
>  		break;
> +	default:
> +		return -EINVAL;
>  	}
> =20
> +	/* Cleanup needs the old lane configuration until shutdown succeeds. */
> +	if (swap_lanes !=3D atcphy->swap_lanes && atcphy->hw->dp && atcphy->hw-=
>dp->stop) {
> +		ret =3D atcphy->hw->dp->stop(atcphy);
> +		if (ret)
> +			return ret;
> +	}
> +	atcphy->swap_lanes =3D swap_lanes;
> +
>  	return 0;
>  }

[Severity: Medium]
If orientation changes while atcphy->mode !=3D APPLE_ATCPHY_MODE_OFF, does
stopping only the DisplayPort link leave the PHY crossbar and lane modes
programmed for the old orientation?

atcphy_sw_set() updates atcphy->swap_lanes without reconfiguring the PHY or
resetting atcphy->mode, and atcphy_mux_set() skips atcphy_configure() when
atcphy->mode already matches target_mode:

drivers/phy/apple/atc.c:atcphy_mux_set() {
	...
	if (atcphy->mode =3D=3D target_mode)
		return 0;

	...
	return atcphy_configure(atcphy, target_mode);
}

When atcphy_dp_set_rate_t8122() subsequently starts the DisplayPort link,
it selects PMA lanes from atcphy_get_mode_config() using the new
atcphy->swap_lanes value while aciophy_crossbar, aciophy_lane_mode,
ATCPHY_MISC_LANE_SWAP, and lane tunables remain configured for the previous
orientation, leaving DisplayPort and USB3 non-functional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-t8122-phy-=
v2-0-8d5c8fdf31ba@chaosmail.tech?part=3D4
