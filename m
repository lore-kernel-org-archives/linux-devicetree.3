Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8C2DF717
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282791; cv=none; b=bJwTzHttlAdFCRgpM3lW1U5p2gWfAWb8QBaWM3NNDesC5S71anSCIuTR8CK4p7LxVo2jDQOFyOqA6YXo3agb7mJQf78wHZ3xX/izEUIXIFwlWfAdpdWasRpzdDhwnrxJKyfptbdf19I0EMJcGN2x/UcVJIh5XTM68cbYogHKfeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282791; c=relaxed/simple;
	bh=78QOt3NvrVlHZbpwnpxR/of4IkveMDoHcahOmleIMng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jbhmlem4KAXTthcrEVQGsvG8mv0zCrApiEHN3I8vvVersDH9tpDq40eGdtfZG6cUcCqsCnW0Ht+zjNwkgwhrJTvryJ9Q6RHdvGvFLYbyXcPitllr2jydnwGKqcTbDRxzRRqPbw2uaU5CleEPd12t/7yIxWYDh8R4L6tYPasqxOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHt+T8Q6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHt+T8Q6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D391F000E9;
	Fri, 12 Jun 2026 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781282787;
	bh=UHdLI8VRDO0F5JtRLini6t2uCes9KsUFNFotlLp+HoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lHt+T8Q6BAe5WrT/w1MT8QyW2LVY1byJ8MIXqsO8dNfzOGFdf1ltzGZeygKWvWSYX
	 wNxVnqz8bYj07NkWlpjpP+PtfZPQsxVBry9bYFLWz0PSRsLJMkT9QVEKKtQTEFlXVL
	 3e16dSUB7owrQcjriRvDOfTzJUdQ6CnIHEf8GZW/3PDtsg6o0No4ewSCDcGrJi5YF0
	 +hmZjvs4+mgg8E7W542KkH+djitSsHCCyBn2LFs94ZHhIClI+ck+RU5yhSgP2h7IGh
	 q364RIx/eKWRFsKEvXQJRabbiGETae/RiaebiPSXvLBTo/5cZdAdotC167qyr6SnUB
	 TFcbOaPLYyr4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/18] phy: rockchip: usbdp: Add missing mode_change
 update
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-6-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-6-efc83069869f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:46:26 +0000
Message-Id: <20260612164627.23D391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] State loss on transient PHY initialization failure leaves hardware=
 permanently in reset.
- [High] Data race in `rk_udphy_dp_phy_configure()` reading shared lane map=
pings without holding the driver mutex.
--

commit 22525e2688f8ca90810542bfa2ad9f261c949f0b
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Add missing mode_change update
   =20
rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.
   =20
Fix this issue by introducing a new helper to update the available
modes.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 97e53b933225f..febc148a754e0 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -619,6 +619,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_=
udphy *udphy, bool hpd)
>  	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigg=
er, hpd);
>  }
> =20
> +static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
> +{
> +	if (udphy->mode =3D=3D mode)
> +		return;
> +
> +	udphy->mode_change =3D true;

[Severity: High]
This isn't a bug introduced by this patch, but it seems there is a
pre-existing issue with how this flag is handled in rk_udphy_power_on().

When the PHY is partially active and a new mode is being powered on, it
checks the re-initialization flag (also known as phy_needs_reinit in the
broader context). It unconditionally clears the flag to false before calling
rk_udphy_init():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
    } else if (udphy->phy_needs_reinit) {
        udphy->phy_needs_reinit =3D false;
        ...
        ret =3D rk_udphy_init(udphy);
        if (ret)
            return ret;
    ...
}

If rk_udphy_init() fails and returns an error (like -EPROBE_DEFER from a PLL
lock timeout), the flag is left as false. Would the next retry by the
consumer skip initialization and falsely return success, leaving the PHY
hardware permanently held in reset?

> +	udphy->mode =3D mode;
> +}
> +
>  static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>  {
>  	if (udphy->flip) {

[Severity: High]
This is a pre-existing issue, but I have a question about concurrent access
to the lane mappings.

This function mutates the lane selection arrays concurrently with
rk_udphy_dp_phy_configure() reading them:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
    ...
    for (i =3D 0; i < udphy->lanes; i++) {
        lane =3D udphy->dp_lane_sel[i];
        ...
        regmap_update_bits(..., LN_ANA_TX_SER_TXCLK_INV,
            FIELD_PREP(LN_ANA_TX_SER_TXCLK_INV, udphy->lane_mux_sel[lane]));
        ...
        rk_udphy_dp_set_voltage(udphy, udphy->bw, dp->voltage[i], dp->pre[i=
], lane);
    }
    ...
}

Since rk_udphy_dp_phy_configure() reads these arrays without holding
udphy->mutex, could a race condition result in reading partially updated
lane assignments if a Type-C switch event occurs at the same time?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-rockchip-u=
sbdp-cleanup-v5-0-efc83069869f@collabora.com?part=3D6
