Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0B4502A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280791; cv=none; b=Sj+hn4suWCrAxgcPzj3+egmfrF+tU+vHUxeX7qV6wIIiwZWr2nv26c4s84Pnq6rkyBj3wMitYH7suyXXXfZTz+/wKsylX59w6+bclj6iXGDECoAOfuM5/djH3KKYYIObtHc91OCve4hrcnmns6TvL2lq+/mRuPLUucHCAcMv0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280791; c=relaxed/simple;
	bh=cvB5kdB5ePd3GYBvq8UDuGY9YDi7GpZ6GOa6jn04Nns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jTFvAyozysnM4bfImUndBpNI+8VkfDUaBI/COviZ+Birih9bePZm845eSsyZyxXn2tEa+qzpNu86LQ7q3K5HuxrfX4oTDTggXRL28qFRPoilwJj92Jc/chVYBlIFFUiBZC7T9Fx1q49LJyGTwzGvyZsyrZFc5pQ3SYNOt6xDXA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu8SKi4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu8SKi4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B3F1F000E9;
	Wed, 20 May 2026 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779280789;
	bh=gEI8BH4w8DQR65mHpMprejPFzPEAn1Zk65pTipM6WGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eu8SKi4qKDY9t8TGT9iM9hu0ge+SfwtfZK1NnJVJ34FkS8kCbEtgjnTAvucqinRRt
	 2Lawp+1fbx7OgYw9WDMVR1UcGbTjtVCQMN4j9jKQNii75cK0G1m9Fgn1cbWNuT66PB
	 BDLY5xxujbcbvi7Hmmsb+1bTeXsu9bMZ0L1Ii3dR3WtEUYfd8eSH/CTRJJ/WURXQP4
	 XnuQiY6SotWgkr96YF3LjJmj2FDq737TR6qZiyNELMIeODVoyDBZ0eMhWwbn4iddqw
	 nwjw6VArU4wD/dWVNNVbBIrgLURl5JNAXBT1/1TzYrTEfJJTZ7LfUHedmsJzOVYwYa
	 U/JFX/ukTWwRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 07/17] media: cadence: csi2rx: Move to
 .enable/disable_streams API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520120022.539913-8-r-donadkar@ti.com>
References: <20260520120022.539913-8-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:39:48 +0000
Message-Id: <20260520123949.49B3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Source subdev streams are unconditionally enabled and disabled, br=
eaking multi-stream reference counting.

Pre-existing issues:
- [High] Accessing the D-PHY lane control register after its peripheral clo=
ck is disabled and reset is asserted.
--

commit 5179e5527e6b2b1932479629edc9186d143ce51c
Author: Rishikesh Donadkar <r-donadkar@ti.com>
Subject: media: cadence: csi2rx: Move to .enable/disable_streams API

This patch updates the cadence csi2rx driver to use the V4L2
enable_streams() and disable_streams() API rather than s_stream(). It
also drops the local stream start/stop mutex, relying instead on V4L2
core serialization.

> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index cde690c6fdee6..2b25314ba6ab0 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
[ ... ]
> @@ -459,9 +448,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->p_rst);
>  	clk_disable_unprepare(csi2rx->p_clk);
> =20
> -	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
> -		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> -
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);

[Severity: High]
This is a pre-existing issue, but can this sequence cause a bus hang?

This function asserts csi2rx->p_rst and disables csi2rx->p_clk, but then
subsequently writes to CSI2RX_DPHY_LANE_CTRL_REG. Writing to a memory-mapped
I/O register while its bus clock is turned off and the peripheral is held in
reset can cause synchronous external aborts on ARM platforms.

I notice this is resolved later in the series by commit a72fbe3bfad52
("media: cadence: csi2rx: Support runtime PM"), which moves the clock disab=
le
sequence into runtime_suspend() so the register is accessed while clocks are
still enabled.

> =20
> @@ -485,38 +471,56 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
[ ... ]
> +static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {
>  	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> -	int ret =3D 0;
> -
> -	mutex_lock(&csi2rx->lock);
> -
> -	if (enable) {
> -		/*
> -		 * If we're not the first users, there's no need to
> -		 * enable the whole controller.
> -		 */
> -		if (!csi2rx->count) {
> -			ret =3D csi2rx_start(csi2rx);
> -			if (ret)
> -				goto out;
> -		}
> +	int ret;
> =20
> -		csi2rx->count++;
> -	} else {
> -		csi2rx->count--;
> +	/*
> +	 * If we're not the first users, there's no need to
> +	 * enable the whole controller.
> +	 */
> +	if (!csi2rx->count) {
> +		ret =3D csi2rx_start(csi2rx);
> +		if (ret)
> +			return ret;
> +	}
> =20
> -		/*
> -		 * Let the last user turn off the lights.
> -		 */
> +	/* Start streaming on the source */
> +	ret =3D v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->sourc=
e_pad,
> +					 BIT_U64(0));

[Severity: High]
Will this break the ability to start multiple independent streams?

Since v4l2_subdev_enable_streams() is called unconditionally outside the
if (!csi2rx->count) block, a second stream start will call it again with the
exact same mask BIT_U64(0). Because the V4L2 core tracks enabled streams,
won't this second call fail and return -EALREADY?

I see this is fixed later in the series in commit dc92c5b7cb43f ("media:
cadence: csi2rx: add multistream support"), which translates pad-specific
stream masks into disjoint sink_streams masks to avoid the -EALREADY
collision, but does this intermediate patch break bisectability?

> +	if (ret) {
> +		dev_err(csi2rx->dev,
> +			"Failed to start streams %d on subdev\n", 0);
>  		if (!csi2rx->count)
>  			csi2rx_stop(csi2rx);
> +		return ret;
>  	}
> =20
> -out:
> -	mutex_unlock(&csi2rx->lock);
> -	return ret;
> +	csi2rx->count++;
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D7
