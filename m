Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40304F4739
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471683; cv=none; b=bl+WvxudAmCbcgQ0CfebL1lVVUA2GcGUU1bRCftgIJ0lgoEGlQguq8ceX1krQhQwbx84HR77jJUBrDnU2X7gmgTRk798Jtzi0tTpL3lBhGHkmMzAEMZlmoOs3I4MezbgCubVdUZcBA2DSN4Ci5bNIaQe57Tfd/iGw238ZldkJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471683; c=relaxed/simple;
	bh=9UOLgQncpQbK8fDHKhzshrwQU/N2rKIGztL06CViJ1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FDh0a6eTD8Oqbuuj4SULgIGoRH87BkQ+c1LWrNs9PZ5VAyGxcGI2EH2nz0N3lASdrmcO5c/MJ5lmozki4r57QbdUOI6H7ukLtR0P2ZOczAdiTFytPRBcw6L7/780ilLmpVCQhLFSD7ytt7l4XQgXgtZIvLZVg7qUDD54/fZnUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTc1jsVx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTc1jsVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF5B1F00A3D;
	Thu,  3 Sep 2026 21:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471681;
	bh=rLUQO6hLQsdTwIpCO7coM61BWGNXM0giWBPrWU7NW1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTc1jsVxWUniax9zSZPEhR4zoAxl5o/02t8XgEuncEyJK+iPgX8Ei1ZX5BuoD1AOd
	 Tj9Yy4pTYNT9TooP7V2t8lzdEd3Re/drUqFCZfHLgy8MQVp4ujwgcWvz49pFVkr4pA
	 xHv/w0h1T8g8THAJPwCbClvMy/1/wSfNnKDrBshKZdQCH1arb4LOizSOyOXWiHS3Ou
	 XxOv84hi/paVEHQJqOh5f9Vn6WmhbY6lW9p95FXADoP0eBBGlfFb6IMty3WZUmjyaT
	 V6sJglfrEEmJ4rCo93DKf/XW5TU3AY1aggCsd9+8EfxyIHf+1AiRHijR/S7b2UVorn
	 cnkxlHLPAmVuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 14/15] dpll: sit9531x: model the inter-PLL
 sync net as a pair of pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260902214030.20955-15-arouhi@sitime.com>
References: <20260902214030.20955-1-arouhi@sitime.com>
 <20260902214030.20955-15-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:41:21 +0000
Message-Id: <20260903214121.8AF5B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The internal software tracking variable `sitdev->intsync_src` is=
 unconditionally initialized to `-1` without reading the hardware's actual =
INTSYNC configuration during driver probe, which can lead to hardware conte=
ntion.
--

commit 484ecadc39855015e8fd1f1cdcf1c007689b79ce
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: model the inter-PLL sync net as a pair of pins
   =20
The device has an internal net by which one PLL can drive the others: the
source PLL puts its output on it, and any other PLL can select it as a
reference instead of an external input.  The two ends are nothing alike --
one is driven, the other is selected -- so they are two pins rather than
one: an output pin on the source and an input pin on each destination.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 1a14255e89a8f..993a991d5b259 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> @@ -717,8 +731,214 @@ sit9531x_dpll_output_pin_direction_get(const struct=
 dpll_pin *pin,
>  				       enum dpll_pin_direction *direction,
>  				       struct netlink_ext_ack *extack);
> =20
[ ... ]
> +static int
> +sit9531x_dpll_intsync_src_state_on_dpll_set(const struct dpll_pin *pin,
> +					    void *pin_priv,
> +					    const struct dpll_device *dpll,
> +					    void *dpll_priv,
> +					    enum dpll_pin_state state,
> +					    struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	int rc =3D 0;
> +	u8 prio;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +
> +	switch (state) {
> +	case DPLL_PIN_STATE_CONNECTED:
> +		if (sitdev->intsync_src =3D=3D sitdpll->id)
> +			break;
> +		if (sitdev->intsync_src >=3D 0) {

[Severity: Medium]
Will this properly protect against a regression causing hardware contention
on the internal INTSYNC net if it is already active during boot?

Since the driver preserves pre-boot NVM state (by explicitly keeping the
reset GPIO deasserted), the hardware might already have a PLL driving
INTSYNC. However, during probe sitdev->intsync_src is unconditionally
initialized to -1:

drivers/dpll/sit9531x/core.c:sit9531x_dev_probe() {
    ...
	sitdev->clock_id =3D sit9531x_derive_clock_id(sitdev);
	sitdev->intsync_src =3D -1;
    ...
}

And sit9531x_dev_state_fetch() does not read the SIT9531X_REG_INTSYNC_GLOBAL
register to update it with the actual hardware state.=20

This means sitdev->intsync_src will remain -1 even if INTSYNC is being
driven. Can a user then successfully command another PLL to connect to
INTSYNC, bypassing this safety check and causing a regression where
multiple PLLs contend on the internal hardware net?

> +			NL_SET_ERR_MSG(extack,
> +				       "INTSYNC is already sourced by another PLL");
> +			rc =3D -EBUSY;
> +			break;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214030.2095=
5-1-arouhi@sitime.com?part=3D14
