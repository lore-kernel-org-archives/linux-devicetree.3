Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FC422339
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779851504; cv=none; b=DDx+totRa9oys+d/clxEW7sRWe5DS2hqPqwpANdh9fhz2KnrbeaeYcqH9wCNX34nAMBP/dLJt8aGbFka0b1WoxilcVGfA7K3/cdw1Om/G/eUZPQspqI8i9AwK/FE3jXiRs0FHdVAXXeyL24w6j812rCHDFGzVlZHYiwSkdz2nxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779851504; c=relaxed/simple;
	bh=riyC3dh4TprbcQ1muIqhSL4r7tf4h9p1vOA2jRFlBZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nUZoGYvZBA4nhzSxMCg31gFhUjW78kTX5VoeiYEnS0OxWMkXiAXgmYlBry5OWGvdvDUkTVc1fG9ZaaSkxZsGZtHFAyynDtwi9XKiXfolTGt00IRtsoXhpBfX+cqWbUK3f7BF+R2/O5qyW/l7VSQQ3rA3sYnsbENNNC+HKVTZHgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbtqHIxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbtqHIxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389B81F000E9;
	Wed, 27 May 2026 03:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779851502;
	bh=ukYXNeWJtj7wf0VlPTK420TgCqwMxYs7P3g0uftaCyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kbtqHIxy5vOGHN/96ER5EKGbSUjuR3HH35VKOVzU7QgjgwgArGM32hguIQRGCJqbr
	 KH9w/DembkFigVLEdQkc3FqzVKY0sCUE1RgsYLA3p4UOUxdrHmJuHKs8dgUK6zFZjq
	 kZbbSYYZVywCaOOpUqrtSnYKoRRYMZR1TZFpPd2Jk6qW9RQuLmZKph6v2aOd3Ws90P
	 J5+xc3Ngjj3luQjnt4CUcSNq3meNU/9CqabYLXbO3p76hu9yuuq1SFF8wCGi9oZAGT
	 10zxJXYC33WQeK0VlasKKq/ru6StxAv68TogxkpPn/6Q2DwiSpCfOEdq2VT7RWx01o
	 ojxiLsfIiN81g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/10] drm/rockchip: analogix_dp: Enable hclk for
 RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527024336.191433-6-damon.ding@rock-chips.com>
References: <20260527024336.191433-6-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 03:11:41 +0000
Message-Id: <20260527031142.389B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] OF node reference leak from of_get_child_by_name().
- [High] Unbalanced clock disable in power down sequence due to ignored err=
ors in power on sequence.
--

commit 0a8f503a077ab1566879dcba7ea0ac8ea7edf25c
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Enable hclk for RK3588

Acquire and enable the HCLK_VO1 bus clock explicitly for the RK3588 eDP
controller. This replaces the implicit enable via the rockchip,vo-grf
phandle, aligning with updated device tree bindings and guaranteeing access.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 06072efd7fca3..d2af5eb29dbb5 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -311,6 +311,7 @@ static int rockchip_dp_of_probe(struct rockchip_dp_de=
vice *dp)
>  {
>  	struct device *dev =3D dp->dev;
>  	struct device_node *np =3D dev->of_node;
> +	struct clk *clk;
> =20
>  	dp->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>  	if (IS_ERR(dp->grf))
> @@ -327,6 +328,11 @@ static int rockchip_dp_of_probe(struct rockchip_dp_d=
evice *dp)
>  		return dev_err_probe(dev, PTR_ERR(dp->pclk),
>  				     "failed to get pclk property\n");
> =20
> +	clk =3D devm_clk_get_optional_enabled(dev, "hclk");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get hclk property\n");
> +
>  	dp->rst =3D devm_reset_control_get(dev, "dp");
>  	if (IS_ERR(dp->rst))
>  		return dev_err_probe(dev, PTR_ERR(dp->rst),

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the clock
management in this file, I noticed a potential issue with the power-on error
handling.

If rockchip_dp_pre_init() fails in rockchip_dp_poweron():

static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
{
	...
	ret =3D rockchip_dp_pre_init(dp);
	if (ret < 0) {
		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
		clk_disable_unprepare(dp->pclk);
		return ret;
	}

The core caller analogix_dp_resume() ignores the return value of power_on():

int analogix_dp_resume(struct analogix_dp_device *dp)
{
	...
	if (dp->plat_data->power_on)
		dp->plat_data->power_on(dp->plat_data);

When the device is later suspended, rockchip_dp_powerdown() unconditionally
disables the clock:

static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
{
	...
	clk_disable_unprepare(dp->pclk);

Since the clock framework tracks enable counts globally per clock core, will
this unbalanced disable decrement the enable_count of the shared clock?
Could this unexpectedly disable the clock for other peripherals and cause
hardware lockups?

[Severity: High]
This is a pre-existing issue, but I also noticed a reference leak in
rockchip_dp_drm_encoder_enable():

static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
					   struct drm_atomic_commit *state)
{
	...
	remote_port_parent =3D of_graph_get_remote_port_parent(endpoint.local_node=
);
	if (remote_port_parent) {
		if (of_get_child_by_name(remote_port_parent, "ports")) {
			remote_port =3D of_graph_get_remote_port(endpoint.local_node);

Since of_get_child_by_name() returns a device node with its reference
count incremented and requires a matching of_node_put(), does using the
returned pointer directly as a boolean condition cause the pointer to be
discarded? Does this leak the node reference every time the encoder is
enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527024336.1914=
33-1-damon.ding@rock-chips.com?part=3D5
