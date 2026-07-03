Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2EF3BCD33
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077374; cv=none; b=UJuJ+zolQfQzcom4h5B/swJpKq4CaQhYM/7ZrWV+LrpI709lu7gbuMAzrPur37CSvBUFvV7spYrnr7iXxWX2tQKfN3CuSxD5UZCcCEs37z1a35bRMr4GHRim1uPCJfdEjlqX2Jm7oPKhwNUzPTRyu93jBH+INTZ7HCGcu+lKptc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077374; c=relaxed/simple;
	bh=qR8Z8mfcCWpOhOHlVB6udkXseW1bEhKnL/HnKmin5Yo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q+QTigpvYCEwzhfEcbrsBEILfVaaG4n96igCXeGbFr6apCJId/rYwWi8KxyGNn5NWo+kZwHbXbm2driu8z5LPFzHHBKw1+yMikAsC8h5amR7U3ZWMEMQhyZIjSgG6Xfeh55MPGUNeKruSXQtrLKM9lG+iaWDmpRwkTwgBf/HV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5zJaOBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5zJaOBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA471F000E9;
	Fri,  3 Jul 2026 11:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783077372;
	bh=sWQ5ukA7crvN7Xofjd6i1sjzuHAF/KO53nOPnpW5xK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V5zJaOBS2uKhFE2vLGkpUgFy45CyJsYRtslnLCj7MOjpax4l23ANyD8x9quOxRI/s
	 i3kFIflq76jHh4PMBsyVOrqqJtMtNe4PCqcq88VoSvcd/nB0a1rS2ISIQuXVLhbcb+
	 MLqjNL8GLjWDAj8gIDPnVglifK47Cz1MTaJ76q+vf0xPMMpYdS0/kQuC+C2oxad1kg
	 +5Pqj/gxP2y2vaXa8IZ/T3CW56Fm1TuZquitxP7RSeDsCFMIRqT5xYT+JaQcAtwkQP
	 pbA6+bcG9l6RRVkWe2kUiOhWrZBaou3fhJW5iNfVxpdQVDngY3gQTsc7tGFuhBu2XS
	 ZoXwu8JrtDV4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703110317.1283411-4-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:16:11 +0000
Message-Id: <20260703111612.5EA471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] pwrseq_power_is_on() returns -EINVAL for a NULL descriptor, whic=
h evaluates to true in a boolean context and breaks the optional resource p=
attern.
- [Low] The patch forgets to add the dummy implementation of pwrseq_power_i=
s_on() for when CONFIG_POWER_SEQUENCING is disabled.
- [Low] Lockless read of desc->powered_on introduces a data race.
--

commit c1fd36a14061ff4c3c20d9f5699bb342ce2b052d
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: Add pwrseq_power_is_on()

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/c=
ore.c
> index 02f42da915985..72b96d36920e5 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(pwrseq_power_off);
> =20
> +/**
> + * pwrseq_power_is_on() - Queries the last requested state of the power =
sequencer.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * This returns the last requested state of the power sequencer.
> + *
> + * Returns:
> + * On success, 1 for on and 0 for off; negative error number on failure.
> + */
> +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> +{
> +	if (!desc)
> +		return -EINVAL;

[Severity: Medium]
Since pwrseq_power_on() gracefully handles an optional sequencer by
returning 0 when desc is NULL, should pwrseq_power_is_on() also handle a NU=
LL
descriptor without returning an error?

Because -EINVAL is non-zero, returning it for a NULL descriptor will
evaluate to true in a boolean context. Consumers querying the state of an
optional sequencer using if (pwrseq_power_is_on(desc)) could falsely
evaluate this as powered on.

> +
> +	return desc->powered_on;

[Severity: Low]
Is it safe to read desc->powered_on locklessly here?

Because desc->powered_on is mutated dynamically by pwrseq_power_on() and
pwrseq_power_off() under pwrseq->state_lock, concurrent calls to
pwrseq_power_is_on() could result in a data race. Could this read use
READ_ONCE() (along with WRITE_ONCE() during updates) or be protected
by the state_lock?

> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> +
>  /**
>   * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
>   * @desc: Descriptor referencing the power sequencer.

[ ... ]

> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consu=
mer.h
> index 3c907c9e1885d..5a5eaf85d5db9 100644
> --- a/include/linux/pwrseq/consumer.h
> +++ b/include/linux/pwrseq/consumer.h
> @@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
> =20
>  int pwrseq_power_on(struct pwrseq_desc *desc);
>  int pwrseq_power_off(struct pwrseq_desc *desc);
> +int pwrseq_power_is_on(struct pwrseq_desc *desc);
> =20
>  struct device *pwrseq_to_device(struct pwrseq_desc *desc);

[ ... ]

>  #else /* CONFIG_POWER_SEQUENCING */

[ ... ]

>  static inline int pwrseq_power_on(struct pwrseq_desc *desc)
>  {
>  	return -ENOSYS;
>  }
> =20
>  static inline int pwrseq_power_off(struct pwrseq_desc *desc)
>  {
>  	return -ENOSYS;
>  }
> =20
>  static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
>  {
>  	return NULL;
>  }
> =20
>  #endif /* CONFIG_POWER_SEQUENCING */

[Severity: Low]
Does this patch miss a dummy implementation of pwrseq_power_is_on() for when
CONFIG_POWER_SEQUENCING is disabled?

Any consumer driver using this function when the config is disabled will
cause a build failure due to an undeclared function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703110317.1283=
411-1-wenst@chromium.org?part=3D3
