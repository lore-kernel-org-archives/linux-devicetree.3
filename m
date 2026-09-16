Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB09527FD49
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516842; cv=none; b=cJE0+14AyCh3YM0gdPvj4BUNVol7ZAy+91ug2O6piQZQqY9cge0JMQVf/Qla/lpxqVmQqk8bh/gbrNc523APGDjvg9nVB+piGY3dwrcqhhMqTIlnPB1Hou6B0VeDy81CB69hWEYNWF/m3VDsbT297/vvg2uHedA1l7jzyHia45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516842; c=relaxed/simple;
	bh=a2uz/INCpEAinjWPXWGveeJrVCDIGAtFmjrddCG3B+8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=emGjn06gfnWd0eWDDjS2Kh+hIae/COteKoJqJkIjpw1xJt7fRno/jRh/4PV1hEoKdaM0MlpSdiNB/2dgVtjMA/J9cF2Af83YukGn43H+9OggHl3x1dNjSrHM1HraOkxp+lKNdGF2kpTSgVIjXoVzx3K4bBC9FUtyqFxgIveFYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcaLytXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcaLytXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB4A1F00893;
	Wed, 16 Sep 2026 00:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789516840;
	bh=ckC4gITUtSctZWTmy+RCCCq83OfiwjiodYk5kz/UneQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VcaLytXxpcT0Ysp3gswq30lKSvwHy8D6NsYRLc7t5vaG6TjoWSQKpksv+QXR13bxD
	 GM7mNNy+fbj3GWCOTkN6wmXHM8BOm7pkQGibOcgRyLYDWsj6Cneen6LZRLkmSHzgax
	 99s3wQhafWIBFNmE9H0agNrGa8rNZ0ZHAjrfFd6R693j9FiG3rXgUdStNj12okbRf2
	 yrQWP16JIXaIE1nqY/i0Z3vHJ7VAhYAWmy+nd1m2oPto2OAQevR9WBSoeYlOyXBbP9
	 /5ZLsng/f5vS1nIDzr8HkPbFYyj5WRjwwP8ObBhMSxQbufoFQpuBJQzHntRyj8Omwc
	 GN9+6nXlODblg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 09/15] dpll: sit9531x: implement output pin
 state on a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915000015.80480-10-arouhi@sitime.com>
References: <20260915000015.80480-1-arouhi@sitime.com>
 <20260915000015.80480-10-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:00:40 +0000
Message-Id: <20260916000040.8EB4A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: sit9531x: swallow error from sit9531x_output_state_refresh=
()
--

commit f159d5a1914892eafb68d095a92591412da0d7b2
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement output pin state on a DPLL

An output is driven by its PLL rather than selected by it, so its state
says whether it carries a signal: connected while it drives, disconnected
while it is muted. Setting the state mutes or un-mutes it by forcing the
pad to Hi-Z, the only per-output control the device offers that leaves the
divider alone.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -736,10 +736,91 @@ sit9531x_dpll_output_pin_frequency_set(const struct=
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
> +
> +	/*
> +	 * A mute whose read-back failed left the cache unconfirmed; there is
> +	 * no poll of output state to correct it, so read it here rather than
> +	 * report a value that may predate the request.
> +	 */
> +	if (sitdev->out[dpin->id].state_stale) {
> +		mutex_lock(&sitdev->multiop_lock);
> +		sit9531x_output_state_refresh(sitdev, dpin->id);
> +		mutex_unlock(&sitdev->multiop_lock);
> +	}
> +
> +	out =3D sit9531x_out_state_get(sitdev, dpin->id);
> +	*state =3D out->enabled ? DPLL_PIN_STATE_CONNECTED
> +			      : DPLL_PIN_STATE_DISCONNECTED;
> +	return 0;
> +}

[Severity: Medium]
Does this code swallow the error code returned by
sit9531x_output_state_refresh()?

Looking at sit9531x_dpll_output_pin_state_on_dpll_get() in
drivers/dpll/sit9531x/dpll.c, if a user requests the DPLL pin state via
netlink while the pin's state_stale flag is true, and the subsequent
I2C read fails in sit9531x_output_state_refresh(), it appears this
function will still return 0 (success) to userspace.

Should this propagate the I2C error instead of returning a potentially
stale and unconfirmed hardware state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915000015.8048=
0-1-arouhi@sitime.com?part=3D9
