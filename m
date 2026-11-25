Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642780;
	b=WCOiDKobXUbwQ7j6q29fZEuFszd5k36ydsvVyM7MAj57qXV6WsOV8GgWViVUXtvt7Me1
	 GJOZPj1cpBgaQs7m5/RLJqJSotqVnqvnEG+I6ZW572ib6hHiCPXBeCoUhBlf80Gmgpj38
	 hbZQkbRp3e94C6hIyrvSmfpiLRWkZspG+oTNOxx/q8PL7ilbEE0lAsxLmL7XAQpH4xeTo
	 MFEkTfqgjwdrpdHOp9gWfg5XnxmQXjwqQmx0i+ZzHRTOIkJyQecKQ30247ZVmimNrzG9o
	 Xj89tu+a3Hlh/ywy0/2TWbZwmoC0q/1VVikIMpZsiCXXQ/Anj0x8faP1AMok9swx95w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642780;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k5O1FmX2sWRXr7+/EJd3ks/Dw+JHXX+Dzw+lFSnik5E=;
	b=n80KwUkoJlkLkPM62gWevNgvcHTQyQwi4i6kQBMzEulaLLapX8yD0W780cf4qYIFAPfp
	 TAq3l9g+WMy6qRdnRXiF3YLOoP9k2GZGpdT63j9VdKHbtbRSi3bvXLNBqAzijtJylTbXs
	 brQwdfsj8j2zdBtZM9vlZ0Bqys33jx5MItcJrdomb0fiF6ZZQkoEbm0W6iLmUCCldRVrs
	 voIL4Z3powTpODAAWLCbWz5EiBC163c7t4zInGhUAGYP+ejl9i3mn8qT0/H5zLUp1Gi1U
	 ET8OVEhcqJxnVjBpsQopXxR8eCCPTV/gTR0m5mt/cSS5CvENb+UE9DhLpED1ibISIfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AALQ47Kv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1631C606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AALQ47Kv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3106C1F000C0;
	Wed, 25 Nov 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795642779;
	bh=k5O1FmX2sWRXr7+/EJd3ks/Dw+JHXX+Dzw+lFSnik5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AALQ47KvAIGBrRNdKHJPiClCDaCiA0msn/lBi3NwJUnDZLWBLctcviVZG1mftF06o
	 k46woKWtkgZD6PU2+fAgsqqYu0onTcPGdHWcJnhYcFqIKDkbxWscWwhpzkVqLYdRS6
	 amgr0lQW+9gUMeWOAGUocIQHTeJhxaQ3WPaLU3mFsaBy/n6eSlefWz6NtYHw86ifRE
	 AJ+Oxcv+B5x6SKjdPWdO3m3lWYM+45Ec/DiuArlE4Qo2ll9pw6uDlk1zppsRv69pA0
	 1vD9E5c8HR0nGYQbl+9ljbqHmFAl6pca5cp5aSICo+zUbLsDa7x5QQG7UdYfNT956k
	 aUg9ogwuRMjcQ==
Message-ID: <sashiko-outbox-234193@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] phy: apple: atc: Add T8122 DisplayPort support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261125-t8122-phy-v3-4-196e20b3537e@chaosmail.tech>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
 <20261125-t8122-phy-v3-4-196e20b3537e@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 21:39:38 +0000
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
- [Medium] phy: apple: atc: incomplete lane reconfiguration in
  atcphy_sw_set()
- [Medium] phy: apple: atc: missing DP mode check in
  atcphy_wait_rcal1_done_t8122()
--

commit c4e8622c01c5077bdf8e1c63b98987b04ebc54bf
Author: Ramzi Abdiche <abdicheramzi@gmail.com>

phy: apple: atc: Add T8122 DisplayPort support

This commit adds DisplayPort AUX and lane setup support for T8122-family
Apple Type-C PHYs, including link-rate PLL/lane configuration and stopping
active lanes before mode or orientation changes.

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index 68fc93a88f41a..5c06883393539 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
[ ... ]
> @@ -1951,6 +2497,13 @@ static void atcphy_configure_post_tunable_t8122(st=
ruct apple_atcphy *atcphy, enu
>  	udelay(10);
>  }
> =20
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atc=
phy, enum atcphy_mode mode)
> +{
> +	if (atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STAT=
E_USB3 ||
> +	    (atcphy->hw->dp_enable_aux && atcphy_modes[mode].enable_dp_aux))
> +		atcphy_power_on_common_t8122(atcphy);
> +}

[Severity: Medium]
Should atcphy_wait_rcal1_done_t8122() also check
(atcphy->hw->dp_enable_aux && atcphy_modes[mode].enable_dp_aux)?

In 4-lane DisplayPort mode (APPLE_ATCPHY_MODE_DP), pipehandler_state is
ATCPHY_PIPEHANDLER_STATE_DUMMY while enable_dp_aux is true.
atcphy_configure_post_tunable_t8122() now powers on the AUS common block
for APPLE_ATCPHY_MODE_DP, but atcphy_wait_rcal1_done_t8122() still only
checks for ATCPHY_PIPEHANDLER_STATE_USB3:

drivers/phy/apple/atc.c:atcphy_wait_rcal1_done_t8122() {
	if (atcphy_modes[mode].pipehandler_state =3D=3D ATCPHY_PIPEHANDLER_STATE_U=
SB3) {
		ret =3D readl_poll_timeout(atcphy->regs.core + AUS_COMMON_DIG_RCAL1, reg,
					 (reg & AUS_COMMON_DIG_RCAL1_ALL_CODES_DONE), 10, 100000);
    ...
}

As a result, APPLE_ATCPHY_MODE_DP skips waiting for AUS_COMMON_DIG_RCAL1
calibration to complete after releasing PHY reset.

[ ... ]

> @@ -2283,19 +2851,31 @@ static int atcphy_probe_rcdev(struct apple_atcphy=
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
> +	if (swap_lanes !=3D atcphy->swap_lanes && atcphy->hw->dp_stop) {
> +		ret =3D atcphy->hw->dp_stop(atcphy);
> +		if (ret)
> +			return ret;
> +	}
> +	atcphy->swap_lanes =3D swap_lanes;
> =20
>  	return 0;
>  }

[Severity: Medium]
If orientation changes while atcphy->mode !=3D APPLE_ATCPHY_MODE_OFF, does
stopping DisplayPort without reconfiguring the PHY leave the crossbar and
lane routing out of sync with atcphy->swap_lanes?

atcphy_sw_set() stops the DisplayPort link and updates atcphy->swap_lanes,
but leaves the hardware crossbar, lane mode, ATCPHY_MISC_LANE_SWAP and
lane tunables programmed for the previous orientation.  If
atcphy_mux_set() is then called with the same target_mode, it returns
early because atcphy->mode =3D=3D target_mode, and a subsequent
atcphy_dp_set_rate_t8122() configures the DisplayPort PMA lanes for the
new orientation while the crossbar remains routed for the old one.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-t8122-phy-=
v3-0-196e20b3537e@chaosmail.tech?part=3D4
