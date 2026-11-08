Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153783;
	b=Rys98S8YJzNDyaTOecNgN2C4q++MzXmYuwyHMYUB92q/2h8vPOOHy62fdsmPXv/hnTdT
	 DMi9tVYwaVbobfg2iqWf3mpZwNKQPp3eNJvK3tcPvSp7IdRgkd8N1fbLnDgm83WWmyjGp
	 z+6MO+yKOHMmN8BkH14gOjllr6enA7Xnrt/gGCAusu2njuXN4ahriJIZC+hzC4wprLMAg
	 bVL8Z04m2HWF/Xor78sX+hvL081ykcN5g41qayvJyUB8uYLEqUh0kM2DJuAeyxtl/o9Pe
	 zurGVQiDhUMwYv+iZTTQYXdSQWzL1CJbti9PP9tn+e5dfi7SchB35ygOnxbNjlJbj3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153783;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QwA29Jkx7PqEtl+PDFwVr73oNYDHlzSVXP4LuAvXbbQ=;
	b=i81+VMLPEPnTvYg4bXPAa32WHIZzpaiYLbVGBXk/P6KYd0xNYi4H8ElSOv0vMyQ9xk5g
	 wI0d6Ib8SctOHVjTNLh2LQ4s7TKkbAtrASpINv4qBI4XAodLzE3ghU6Etba00/BR37UiC
	 kcCDT4RIDA1D1ll+VGiz9NlpU1nBXPxaxNvNO7/OcjCcC6/gfG3ljB3f730zgj4pgvRGM
	 RTtDkpldyJaFa8y9Ga4UqnvE0XeQSfkTfDaSOeLgmU/UzmrwmekPCnJjANHIN6KjBMlWS
	 GFOKPPukBXmXRiMPVEpsjp/c+pwjp7oiTq1Pvd/0rnPIxUACDEGv3kns4zHYK8pXQFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PA9xRtjF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26A606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PA9xRtjF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406831F0089F;
	Sun,  8 Nov 2026 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153782;
	bh=QwA29Jkx7PqEtl+PDFwVr73oNYDHlzSVXP4LuAvXbbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PA9xRtjFgrmwVywaqMdROYgsdZxnQCoTEzVGfNUGXrezJ4J46O+DUMBcM+aj7cSSA
	 6AxBsDBkSC8LOIPR4OUBRYRzHo++8bgogFCWENvVIyKYgMruMlUdja4bTJoGcXq6CZ
	 pTneb2zvmkzQsrff0PwttNklMAbkd7ZRHGAc4zFE29DiDH5wcobDXoSAyQGMGYbAa/
	 mkcChGoRCo6F59FKNhfLIVnPEiblhSfQUNorjhRDGu7feQcaRT488kYIH7yIV1EDjG
	 xv2Nc20usqiuWlBXnW6WNrpARt1qFpA1jEQSHzWKJb6uchinGa+noBT2BN3LGbG+ck
	 4gwtzbzAMheCA==
Message-ID: <sashiko-outbox-203869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] phy: apple: atc: Add T8122 DisplayPort support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261108-t8122-phy-v1-4-c2783b2a53a8@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-4-c2783b2a53a8@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 16:03:01 +0000
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
- [Medium] phy: apple: atc: incomplete PHY reconfiguration on
  orientation change in atcphy_sw_set()
- [Medium] phy: apple: atc: missing RCAL1 poll for APPLE_ATCPHY_MODE_DP
  in atcphy_configure()
--

commit d63ba778ecb86e9dbceea7ed869d115d4530f29a
Author: Ramzi Abdiche <abdicheramzi@gmail.com>

phy: apple: atc: Add T8122 DisplayPort support

This commit adds DisplayPort AUX and lane configuration support for T8122
PHYs, introduces a DisplayPort operations table in struct atcphy_hw, and
stops active DisplayPort lanes before changing orientation or PHY mode.

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 256a084996469..068d985b62a6d 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c

[ ... ]

> @@ -1942,12 +2492,24 @@ static void atcphy_configure_post_tunable_t8122(s=
truct apple_atcphy *atcphy, enu
>  	udelay(10);
>  }
> =20
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atc=
phy, enum atcphy_mode mode)
> +{
> +	if (atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STAT=
E_USB3 ||
> +	    (atcphy->hw->dp && atcphy_modes[mode].enable_dp_aux))
> +		atcphy_power_on_common_t8122(atcphy);
> +}
> +
>  static int atcphy_configure(struct apple_atcphy *atcphy, enum atcphy_mod=
e mode)
>  {
>  	int ret =3D 0;
>  	u32 reg;
> =20
>  	lockdep_assert_held(&atcphy->lock);
> +	if (atcphy->hw->dp && atcphy->hw->dp->stop) {
> +		ret =3D atcphy->hw->dp->stop(atcphy);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
Should the AUS_COMMON_DIG_RCAL1 poll later in atcphy_configure() also run
when (atcphy->hw->dp && atcphy_modes[mode].enable_dp_aux) is true?

atcphy_configure_post_tunable_t8122() now powers on the common block for
APPLE_ATCPHY_MODE_DP (where pipehandler_state is
ATCPHY_PIPEHANDLER_STATE_DUMMY), but atcphy_configure() only waits for
AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE when pipehandler_state is
ATCPHY_PIPEHANDLER_STATE_USB3:

drivers/phy/apple/atc.c:atcphy_configure() {
    ...
	if (atcphy->hw->gen =3D=3D ATCPHY_GENERATION_T8122 &&
	    atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STATE_U=
SB3) {
		ret =3D readl_poll_timeout(atcphy->regs.core + AUS_COMMON_DIG_RCAL1, reg,
					 (reg & AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE), 10, 100000);
    ...
}

In 4-lane DisplayPort mode (Pin Assignments C and E), the PHY will proceed
with AUX and link training without waiting for resistor calibration to
finish.

[ ... ]

> @@ -2257,19 +2829,31 @@ static int atcphy_probe_rcdev(struct apple_atcphy=
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
> +	}
> +
> +	/* Cleanup needs the old lane configuration until shutdown succeeds. */
> +	if (swap_lanes !=3D atcphy->swap_lanes && atcphy->hw->dp && atcphy->hw-=
>dp->stop) {
> +		ret =3D atcphy->hw->dp->stop(atcphy);
> +		if (ret)
> +			return ret;
>  	}
> +	atcphy->swap_lanes =3D swap_lanes;
> =20
>  	return 0;
>  }

[Severity: Medium]
If orientation changes while atcphy->mode !=3D APPLE_ATCPHY_MODE_OFF, does
stopping only the DisplayPort link leave the crossbar, lane mode, and
tunable registers programmed for the old orientation?

When atcphy_sw_set() flips atcphy->swap_lanes while a mode is already
active (the case where dp->stop() here has an effect, since transitioning
through TYPEC_STATE_SAFE already calls dp->stop() in atcphy_configure()),
atcphy->mode is left unchanged.  A subsequent atcphy_mux_set() for the
same mode returns early because atcphy->mode =3D=3D target_mode, and
atcphy_dp_set_rate_t8122() then configures the DisplayPort PMA lanes for
the new swap_lanes while ACIOPHY_CROSSBAR, ACIOPHY_LANE_MODE, and
ATCPHY_MISC_LANE_SWAP remain set for the previous orientation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-t8122-phy-=
v1-0-c2783b2a53a8@chaosmail.tech?part=3D4
