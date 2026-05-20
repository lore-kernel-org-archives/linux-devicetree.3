Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E7224E4A1
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779281923; cv=none; b=DPAMldiP2gtl9/kFWuZaynHYgykYQzQhka5X4bJ1HoydVIOoTu+OU2j04QeoaX9E+1q+k6418JDYbYFxftQAT44IS8U2dcgrPd508pK7jICiL7Po4WDwXlXL2LZnkVN6+XsW0of4wYyeZ+ySr7JtV29xqBISB7u+7OjRTlBkpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779281923; c=relaxed/simple;
	bh=iWkLxQT8eG5JD/yANK40cbDsfewiXq4s/r2/LlK8OsM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ORKTe4ZLgDuCzoj5QGf8p3GYMyCBCJvWqbMfhEd/C+M00dn2SqjhzsX/ZBwh3sYXto2bCNle8YOtVXBRr8PCBi8K72lRXzQgkjNLlJdiX4TN5OUHu7IR6v5GseqXY//+MukZWmCgMcScu26yXfuRZUc68GZ6BXRY+3NIt7eLX5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtwAxDvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtwAxDvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35631F000E9;
	Wed, 20 May 2026 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779281922;
	bh=jq7HAdQJ1JPNPsQYzBUMcqZ+BW+mjiGTekLVqTiAnQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gtwAxDvtmEMDzCfl1uSQGPrKfxSPlFAKRl6+iaaJ7ZrPuXJBxqLRunPEMg/DWjZ1Z
	 RsmMXcrD4fR13W8Ker5qjEsZMdwzKmduyA5aSqHsWwLWJkRN3Ed6goBlFUOueynvsB
	 kRJROjBDhcb09EgIQ0/qGqYYrY5dRBFQtMf/U2hV+f2e8dabTFOsA3wUxWWtkZ1o0a
	 RfwEu75kR82sKxvuMe+0TTejTlOmhjchdAuSfn5EocqNTBjRogXUKp/P1YMfYNOOz3
	 gUC4+zTZC+y7ZiLXoN65+Ed9xPd09poxB4G7ZZwexouwjz3eVtzC3xe1dJh7B6fP9c
	 yW0Pm3+joLYmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 11/17] media: cadence: csi2rx: add multistream
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520120022.539913-12-r-donadkar@ti.com>
References: <20260520120022.539913-12-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:58:41 +0000
Message-Id: <20260520125841.F35631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The hardware reference counter `csi2rx->count` counts API calls in=
stead of enabled streams, leading to premature hardware shutdown or resourc=
e leaks.
--

commit dc92c5b7cb43fb07195719c19a138fea74234e1c
Author: Jai Luthra <jai.luthra@linux.dev>

media: cadence: csi2rx: add multistream support

This commit adds multi-stream support to the Cadence CSI-2 bridge IP,
allowing for 1-to-1 mapping of virtual channels from sink to source pads.

> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index bba0e4c0a34da..8931e824c597c 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
[ ... ]
> @@ -471,18 +499,57 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
[ ... ]
>  static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  				 struct v4l2_subdev_state *state, u32 pad,
>  				 u64 streams_mask)
>  {
>  	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> +	u64 sink_streams;
>  	int ret;
> =20
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state, pad,
> +						       CSI2RX_PAD_SINK,
> +						       &streams_mask);
> +
>  	/*
>  	 * If we're not the first users, there's no need to
>  	 * enable the whole controller.
>  	 */
>  	if (!csi2rx->count) {
> +		csi2rx_update_vc_select(csi2rx, state);
>  		ret =3D csi2rx_start(csi2rx);
>  		if (ret)
>  			return ret;
> @@ -490,10 +557,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev=
 *subdev,
> =20
>  	/* Start streaming on the source */
>  	ret =3D v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->sourc=
e_pad,
> -					 BIT_U64(0));
> +					 sink_streams);

[Severity: High]
Since the V4L2 streams API allows enabling or disabling multiple streams
simultaneously using the streams_mask bitmask, does this create a tracking
issue for the hardware reference counter?

If a caller enables multiple streams in a single call (for example,
streams_mask =3D BIT(0) | BIT(1)), csi2rx->count will only increment by 1
because it counts API calls rather than the actual number of enabled stream=
s.

If the caller subsequently disables those streams sequentially in separate
calls (for example, disable_streams(BIT(0)) followed by disable_streams(BIT=
(1))),
the first call will decrement csi2rx->count to 0.

Would this trigger csi2rx_stop(csi2rx) and shut down the entire CSI-2
receiver hardware prematurely, while the second stream is still actively
streaming?

Could the driver track the actual number of enabled streams using
hweight64() on the active streams mask instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520120022.5399=
13-1-r-donadkar@ti.com?part=3D11
