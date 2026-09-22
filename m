Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50A47A89E
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107922; cv=none; b=JL1JFD2+91gURMZyTo9768cEr9JnUzCBi70HJmN/j2mrL/IGzLggcy6NqJ8EsJ4z7RCEOW1VlGznGEOQeLbAFC8hEeSroce8r0a8d3IythIAqwt8TWywI8K/gx5WW0K+b26lmCXy3aobXKmjCZ/A7kS7ZxdpQmaKJFWNxN4fT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107922; c=relaxed/simple;
	bh=wEckPbSNde+1ZJJ9vR2Dp+PiRObtQ4HjKPOQBH8Mhx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k1Ndor8PfoTM89LaNakGHLGHuJ0GDOmdx651PI0t6FpwAq9FyacW1AJMetCgdEQX+TKdUoVNNoBL+vBQNd6uE+l/XMKLR7WrtayznqWR3URrDNEmQQa46QoSXMG5fo3HFdrqk80XLJIB0IQeo3V5zKf6WTsm01T7FnCOX/mzF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AATjKmHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AATjKmHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0041F0089A;
	Tue, 22 Sep 2026 20:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107907;
	bh=FCL4A7G91V4dFeKIQmv2vM81JataKfUJQlKPLWPW9e4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AATjKmHsIDMv3tN3YX3e9VAGVQ5hDQwZIQUvtKD+M9hwXsq4/lerM7C4wvmPNLRBf
	 uz4PEIWS44IN9GeVzwuyyKfHRZebkU/mCchFQXnRp6TfDRvC+y5ktuAEh55bOflO2N
	 T+PAS1qVUk+r/rLuq2/s+sVjpYeZ36cNCzKdNXE3EWgK4RBi916X9lrUs8+cZUrWWo
	 1UlXo7WBfjOV6qcafNgyLws6/1hvCey3tYGvGECAu6eY3k1PASCjyqUB372+0/arH4
	 rbIRRkjTnDj7qrEnkUzUDalvXmuaJSHuwcZueb4jj0PacIOew88b6pQKJG8EnFl6iI
	 kNZZSxj+ej8OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/14] dpll: sit9531x: add support to adjust output
 phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921201108.42676-11-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-11-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:46 +0000
Message-Id: <20260922201146.AE0041F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: sit9531x: missing phase_stale update on adjust failure
--

commit 133246fcb22569dda87bbed0ea13e64009ac8953
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to adjust output phase

Adds support to adjust output phase by shifting the output in time against
others driven by the same PLL. The requested offset is encoded into coarse
and fine fields, with delay wrapped to the output period when needed.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> +	/*
> +	 * Restart the output divider phase so the freshly programmed delay is
> +	 * applied against a known edge instead of the divider's arbitrary
> +	 * running phase.
> +	 */
> +	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);
> +	if (rc)
> +		return rc;
[ ... ]
> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> +sit9531x_dpll_output_pin_phase_adjust_get(const struct dpll_pin *pin,
> +					  void *pin_priv,
> +					  const struct dpll_device *dpll,
> +					  void *dpll_priv, s32 *phase_adjust,
> +					  struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	mutex_lock(&sitdev->multiop_lock);
> +	/*
> +	 * A request whose writes reached the device but whose commit or
> +	 * phase flush failed left the cache describing the delay before it.
> +	 * There is no poll of the delay registers to correct that, so read
> +	 * them here rather than report a value the output is not using.
> +	 */
> +	if (sitdev->out[dpin->id].phase_stale) {
[ ... ]
> +sit9531x_dpll_output_pin_phase_adjust_set(const struct dpll_pin *pin,
> +					  void *pin_priv,
> +					  const struct dpll_device *dpll,
> +					  void *dpll_priv, s32 phase_adjust,
> +					  struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	int rc;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_output_phase_adjust_set(sitdev, dpin->id, phase_adjust);
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	if (rc) {
> +		NL_SET_ERR_MSG(extack, "Phase adjust failed");
> +		return rc;
> +	}

[Severity: Medium]
Does this error path leave the software cache permanently out of sync
with the hardware state?

When sit9531x_output_phase_adjust_set() is called, it can succeed in writing
the new configuration to the device but fail later on (for example, during
sit9531x_output_phase_flush() as shown above). When this happens, it returns
early without updating the cache.

Since sit9531x_dpll_output_pin_phase_adjust_set() does not set
sitdev->out[dpin->id].phase_stale =3D true on failure, a subsequent call to
sit9531x_dpll_output_pin_phase_adjust_get() will evaluate phase_stale as
false. This bypasses the mechanism intended to read back the delay registers
and correct the stranded cache values.

Should phase_stale be set to true in this error path, similar to how it is
handled in sit9531x_output_freq_set() during rate changes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D10
