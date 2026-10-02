Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384E47F772
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932463; cv=none; b=jUdUMuMiR1D13GOHMO5zzQMFumOOKO7RV+tQidVqrSA1eBqcBQcm/umEU4d4tLywlwD4hWI5XqIKNtHESoJY1FH+BguIWO0CGYJUt6uMOJ8b19VaAnD4E5M6CYWge6yGyhCcObMQempMtJKwR3KWeMg90GF2cQUvMMPPwrMIVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932463; c=relaxed/simple;
	bh=h7GSOaC2WU+ocZF35bTD7sv6/h8HVvo/Q5HIsJbgzPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sj/kceA3H8GTibhRS1EpNytjVkbokd7L5THVJWl/KTMBs02PK+Ba2b9rU1ElvLdwHmpnAUIWLJdYoH0EW+5DPO80y8Uvn5hTJmv12DMyUdqEgkFIuRUnPf8olxt0UMXghLuvxpwDATMjfbl6JEexyN15FFU7pL2URkBkZ2FzxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD562Z10; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD562Z10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AA51F000FF;
	Fri,  2 Oct 2026 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932462;
	bh=ds2BTFJVcqYjJOFsckiVmnHc0G6DBfI+IFMyVf3mBb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lD562Z105O9smRkQqA0KC25IEefCIzmWtA5XpF5vMSeTaCSqazU6wOqpvhOjOxKcG
	 hNmw1CZYh4NCLwL5BjXEHcNXq8uGHnCWXjS9o4cbjVehkzq2eu9z6fKszuRA9FMXit
	 RfAyEFOFmmxskpfwFxy6xxIxQhgTC8/Z6GzLofWbqeA6PIAQowpun3xiiDLBO6nGJ9
	 dDb9jqV1uohsyXMgfFQqHvU3oRCz5JMWCX8OUQZNpnwlyKdhLXVOvRH7B8bZAu6D3i
	 yJPUBTVsR/bp5eFW97+VUmu5y9UXhiVxT4whIAhltdKBCYR6QTV8j+1YkqOYwbyHW5
	 ixJrVzUDSQwlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 13/13] dpll: sit9531x: model the inter-PLL
 sync net as a pair of pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930233714.87679-14-arouhi@sitime.com>
References: <20260930233714.87679-1-arouhi@sitime.com>
 <20260930233714.87679-14-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:21 +0000
Message-Id: <20261002091422.10AA51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll/sit9531x: partial INTSYNC enable state prevents retry from =
succeeding
--

commit 04b8069f0eb6eee7c1faf966517e2a726ccd2acc
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

    dpll: sit9531x: model the inter-PLL sync net as a pair of pins
   =20
    The device has an internal net by which one PLL can drive the others: t=
he
    source PLL puts its output on it, and any other PLL can select it as a
    reference instead of an external input.  The two ends are nothing alike=
 --
    one is driven, the other is selected -- so they are two pins rather than
    one: an output pin on the source and an input pin on each destination.
   =20
    That keeps each pin honest about what its state means.  The source pin
    reports whether this PLL is the one driving the net, and setting it tak=
es
    the net over or gives it up; a destination pin reports whether its PLL =
has
    selected the net, and behaves like any other selectable input.  A single
    pin would have had to answer both questions at once and could only have
    been right about one of them.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 45baa703aa45b..6b607f3d5fc31 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +		} else if (n_en && n_dis &&
> +			   n_en + n_dis =3D=3D ARRAY_SIZE(intsync_config) &&
> +			   partial < 0) {
> +			/*
> +			 * Every register holds one of the two patterns and both
> +			 * occur: the residue of an enable or a disable that
> +			 * stopped part way, and nothing a profile writes.
> +			 */
> +			partial =3D pll;
> +		}
> +	}
> +
> +	/*
> +	 * A disable that stopped part way leaves a PLL holding a mix of the
> +	 * two patterns.  Treat it as the owner, so that a repeated disconnect
> +	 * on that PLL runs the disable again and another PLL cannot be
> +	 * enabled on top of the leftover configuration.
> +	 */
> +	if (src < 0 && partial >=3D 0) {
> +		dev_warn(sitdev->dev,
> +			 "PLL%c holds a partial INTSYNC source configuration\n",
> +			 'A' + partial);
> +		src =3D partial;
> +	}
> +
> +	sitdev->intsync_src =3D src;

[Severity: Medium]
Could caching the partially-configured PLL as the active owner of the
INTSYNC net cause issues during a retry?

> +
> +	return 0;
> +}

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 6bf4efd3c6334..52d5b1a6e36f7 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

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
> +	int rc =3D 0, detect_rc =3D 0;
> +	bool changed =3D false;
> +	u8 hw_src;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +
> +	switch (state) {
> +	case DPLL_PIN_STATE_CONNECTED:
> +		if (sitdev->intsync_src =3D=3D sitdpll->id)
> +			break;

[Severity: Medium]
Does this short-circuit condition prevent repairing the partially-configured
hardware?

If a transient bus error during sit9531x_intsync_enable() triggers a rollba=
ck
via sit9531x_intsync_disable(), and the rollback also fails, the
INTSYNC_GLOBAL bit is restored and the hardware is left partially configure=
d.

The subsequent call to sit9531x_intsync_src_detect() then caches this PLL as
the net owner (sitdev->intsync_src =3D partial) as noted above.

When userspace retries the failed connect request, it seems this check in
sit9531x_dpll_intsync_src_state_on_dpll_set() might erroneously assume the
PLL is already fully enabled based on the cached partial state, returning
success without actually repairing the hardware.

> +		if (sitdev->intsync_src >=3D 0) {
> +			NL_SET_ERR_MSG(extack,
> +				       "INTSYNC is already sourced by another PLL");
> +			rc =3D -EBUSY;
> +			break;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930233714.8767=
9-1-arouhi@sitime.com?part=3D13
