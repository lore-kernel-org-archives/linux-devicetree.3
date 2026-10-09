Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF23C9EE4
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532023; cv=none; b=N65hSEkgkEXclslutJZ+MQ/uF6d0JOhMCn6TqWPu6vjNjI7mMAl611tf8WzkNuLmMKQx3McajmqCqWvoyOooFgBzsTXvjb9V1j90uTOf0wxt5B3CCt+odIqzICMEu2YtZe268r+yIxyu6BgzGnTQuiOtWKaXGMDzFkDe+wPAmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532023; c=relaxed/simple;
	bh=agLANXd4sx6ggSP0ttKjsfkYrpUPRS265lWMf3lr/eA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PmFf7sRsiKeASDSPec4uw4ZscVxaia6V+mj74ELFl5fwLYNqFmIoLDjdTHjLnFrljottzUTAdOUs3FPKccxrtYfJgS6E9sfFEgvGdYtDYGxh4v4mhKTaqwcmlsUxZidU7ntUlQnltcysGDaZJz9e8YD8TRKloy8N2ZF2erCtqxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikj+Hi5w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikj+Hi5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FB61F000FF;
	Fri,  9 Oct 2026 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791532020;
	bh=GCYUNNkgIXeUQnJpOaw9QQFmM3W5R2Y9IhOFHQX18k8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ikj+Hi5wBe7WLEKOC9qo+xAz1eQjC4JVyBqUhFct3TFZwEAZ8iR8dD2rk+mVxSedM
	 MvgumX/fURs3pzeLOzfMR/sXZQxktzIGC+Mb/nArTRKvx9RclmKy55S0iscbGWyPk6
	 faH7YSzG9qWgjN2I5ZfSGU9A57nMNhTq5n/uk88VXJvwkUEKcVAr1t2K5jKYRt2T1d
	 R9BCCdw0S++xLcNx9vyyq+ZQKltn3RZ7QDKiGjfFZUc8GI3GVHL3mBZq7BGHUu+uB2
	 NHDuEJx6EyuWztVxGzlhaYVQ5+7HyzBgY9mADR9MzaOh5jqJPZNmriUlw2i4X6++6t
	 cC5VZ8UMdi0Pg==
Message-ID: <sashiko-outbox-165032@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] PM / devfreq: add Airoha SoC Subsystem devfreq
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009073330.18175-3-ansuelsmth@gmail.com>
References: <20261009073330.18175-1-ansuelsmth@gmail.com>
 <20261009073330.18175-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:46:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] devfreq: target callback fails to update *freq to actual applied=
 rate
--

commit ef9292d19d56ca62518a03cc0a714b29d6101475
Author: Christian Marangi <ansuelsmth@gmail.com>

PM / devfreq: add Airoha SoC Subsystem devfreq driver

Add simple Airoha SoC devfreq driver. This simple driver register a
driver from a given clock and register a passive governor to scale the
frequency with the CPU frequency.

> diff --git a/drivers/devfreq/airoha-subsystem-devfreq.c b/drivers/devfreq=
/airoha-subsystem-devfreq.c
> new file mode 100644
> index 0000000000000..4b89121f7b8ec
> --- /dev/null
> +++ b/drivers/devfreq/airoha-subsystem-devfreq.c
[ ... ]
> +static int airoha_devfreq_target(struct device *dev, unsigned long *freq,
> +				 u32 flags)
> +{
> +	struct airoha_devfreq_data *data =3D dev_get_drvdata(dev);
> +
> +	return clk_set_rate(data->clk, *freq);
> +}

[Severity: Medium]
Does this target callback need to update the freq pointer to the actual
frequency applied?

When the devfreq core or governor requests a frequency transition, it calls
the .target callback with the requested frequency in the freq parameter. Th=
is
happens on every frequency transition triggered by the governor.

The devfreq core's internal state (devfreq->previous_freq) and statistics
track the frequency returned in the freq pointer. If the unrounded or
interpolated requested frequency is blindly passed to clk_set_rate() and
left unchanged instead of being updated to the actual frequency applied to
the hardware, this can cause -EINVAL lookup errors in devfreq_get_freq_leve=
l()
and break statistics.

Could devfreq_recommended_opp() be used here to constrain the requested
frequency to a valid OPP and update freq before applying it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009073330.1817=
5-1-ansuelsmth@gmail.com?part=3D2
