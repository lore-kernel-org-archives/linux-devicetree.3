Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDF23E1683
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107918; cv=none; b=K8jRb8RxLvE0ZFb6ScUrWKHjEEz+gps8q7z/MzlG9lXfF/9LFaGsL0MU/pIpz7WLWLohglaqANjkzvqfF9yMaKqOKqmBvDmAA9E4yh8EecKBlGhG/U8cMUZUKKkl3rev1Nn8D1rySe+crfdoJeGRZvTHqH3QX4LKGh+YShD6UAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107918; c=relaxed/simple;
	bh=7idxQj8d3nDxRQVqCny2vEJ2//NdX6SbX6VfNmEW790=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hW6nu5R6TGAs5XUXmIKNmdTBJRfTuApN7RknbwloXKed9gCxemI3/onq37eLG9MTPPemSVd5ix4ofRF47GofNtNyY07xkCtbpvg5s4veskKGuOpSNz5HgNRqAQjtGeVD1ddti2998g3f7Q+v9cNFSo2g7Td4J1oBU3Dfm/OsL+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvAs+fYW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvAs+fYW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3CD1F00899;
	Tue, 22 Sep 2026 20:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107906;
	bh=ZKmeS7GePcZUirHZPMoBzzE1zc9d2iXalvTjCRgc8pI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UvAs+fYWuBYf+W6g7GMpcYFDJtBwBJdPpIt5227ApL/lyVwvFii8tnTvbk81HLe3d
	 1dPIDtiO2y7dDUS4u/2T3pciu2bat1TO7Cg/537ANSerLMY7y3PVOQMwwH46a5VE0g
	 hvdwef0JH9M0599INNcHs9YyafWo7UvKtZSboRoiM1+riA4XTg9B/kNHEL9b8xQpMi
	 4kjjbUCio6XsfMWycvXsoHT0x7mB8R+iS7NA+lHwyuWz6QtDfevWUooa6qcdTSK0R8
	 AAwoqjhFIutFw/ujJPAIpKzAQg1+g6eO+M6TLVYgN/PewNDGyIYpvkx432okwclUqo
	 CuMKwtl1bXJfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 09/14] dpll: sit9531x: implement output pin state on
 a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921201108.42676-10-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-10-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:45 +0000
Message-Id: <20260922201145.DD3CD1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: lockless data race in sit9531x_dpll_output_pin_state_on_dp=
ll_get()
--

commit 52fe1edf88f74a955c8a6a22cda5f2c143e2d6c3
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement output pin state on a DPLL

This commit implements the output pin state logic for the sit9531x DPLL dri=
ver.
It allows reading and writing the connected or disconnected state (muting)
of the pins by controlling the per-output force and state bits.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 9f0678ddfe0ee..c1ab202bf2978 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
> @@ -783,10 +783,97 @@ sit9531x_dpll_output_pin_frequency_set(const struct=
 dpll_pin *pin,

[ ... ]

> +static int
> +sit9531x_dpll_output_pin_state_on_dpll_get(const struct dpll_pin *pin,
> +					   void *pin_priv,
> +					   const struct dpll_device *dpll,
> +					   void *dpll_priv,
> +					   enum dpll_pin_state *state,
> +					   struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	const struct sit9531x_out *out;
> +	int rc;
> +
> +	/*
> +	 * A mute whose read-back failed left the cache unconfirmed; there is
> +	 * no poll of output state to correct it, so read it here rather than
> +	 * report a value that may predate the request.
> +	 */
> +	if (sitdev->out[dpin->id].state_stale) {
> +		mutex_lock(&sitdev->multiop_lock);
> +		rc =3D sit9531x_output_state_refresh(sitdev, dpin->id);
> +		mutex_unlock(&sitdev->multiop_lock);
> +		if (rc) {
> +			NL_SET_ERR_MSG(extack,
> +				       "Output mute state could not be read back");
> +			return rc;
> +		}
> +	}
> +
> +	out =3D sit9531x_out_state_get(sitdev, dpin->id);
> +	*state =3D out->enabled ? DPLL_PIN_STATE_CONNECTED
> +			      : DPLL_PIN_STATE_DISCONNECTED;

[Severity: Medium]
Is there a data race here against concurrent state changes?

`state_stale` and `out->enabled` are checked and read without holding
`multiop_lock`. If `sit9531x_dpll_output_pin_state_on_dpll_set()` is
running concurrently via another netlink command, could this getter read
an intermediate or stale software state for `enabled` and miss concurrent
`state_stale` updates?

This might lead to an incorrect pin state being reported to userspace.

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D9
