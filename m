Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11049349B19
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471680; cv=none; b=mr8E09rIrqgfn1URhj+HYPuRiyMJOYJy1zGYiFg3BoMpu4B7qA+S6Brm3ydYwqRl/y6Z+lLv7nxgH9i0DXNwcjd4oUM0pzYmEVGpSF3QPVoFcLs+lLn0fcLaj6+cjc1XVEEOE7WJg0wD9Ow9QOsOWqXvICWrdEJspPoviraiPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471680; c=relaxed/simple;
	bh=l37I9wFRshnoIskZKE3FUQfzpACSTN8BiVP/mdO37tY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWXvnS4GahcnMtJ0y0LRfP/0WUh3/9vRSNT3ftEPzQi6Jql35VcMm5Dybg/vLNibMt8xTdXW96tNhc5B/ovzyjc+j4xnB0c/Pq0hd9foZsIB7KnJT910apt3ASXEnCjhDRPg5TsIwGPItJzh+SAsT22+EGQ2iKV1rLt99LcK+8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tx50TGE2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tx50TGE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FD21F00A3F;
	Thu,  3 Sep 2026 21:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471678;
	bh=oQqDvqYfwToYGjtvcJo2aGs1ejr8bsc+mr+hGnziUCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tx50TGE2KvxA6LfCbMiTN5DNERwk0faP3mOORgB8micI8wLYYoN321GIlaXNLeb8c
	 I6xAndSbDnw62J8zZRG6JPPP1tHgX4ixqy1eF5F5f4q9wa8+9hE0n/U0iB7dsRJ3qq
	 z9o2MYJ4nQUnc1Ccsh2ps0XcEXxHpH9oSmV92OIcXab6vxWeS95e8dm09N8m0Gs0Pt
	 f4xV82yAQSyIRgEF7pE464mWKGWqFr46+BCOFqgx5EiUugiFAG01G77cTqEIQNj/yT
	 VhK21FKre0YgB2ZheFlW1aaAOZPl4mhsLtM3I2NMAdzxszsBO4t0FZmk9BaMUvXCzI
	 AIbE0i/nPpqag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 08/15] dpll: sit9531x: add support to get
 and set frequency on pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902214030.20955-9-arouhi@sitime.com>
References: <20260902214030.20955-1-arouhi@sitime.com>
 <20260902214030.20955-9-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:41:18 +0000
Message-Id: <20260903214118.63FD21F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Committing a partially written output divider (DIVO) to active har=
dware state on I2C error.
- [Medium] Unprotected read of `freq` outside of multiop_lock in `sit9531x_=
dpll_output_pin_frequency_get`.
- [Medium] Truncation of computed output frequency to `u32` without bounds =
checking.
--

commit bdcd1ac4baf714d757ae6dd92091f8153272b818
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

    dpll: sit9531x: add support to get and set frequency on pins
   =20
    Both directions in one patch, since they share everything that matters.
   =20
    An input's frequency is what the board presents, so it is reported from
    the firmware description rather than read back: the chip has no divider=
 on
    an input whose rate it merely qualifies.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index e706f6942f654..721b2c451d599 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -735,6 +769,414 @@ int sit9531x_input_prio_add(struct sit9531x_dev *si=
tdev, u8 pll_idx,
[ ... ]
> +int sit9531x_output_freq_set(struct sit9531x_dev *sitdev, u8 out_idx,
> +			     u8 pll_idx, u64 frequency)
> +{
[ ... ]
> +	for (j =3D 0; j < 5; j++) {
> +		rc =3D sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(page, base_reg - j),
> +				       divo_bytes[j]);
> +		if (rc)
> +			goto commit;
> +	}
> +
> +commit:
> +	/*
> +	 * Step 4: NVM update + loop lock.  Always run prg_commit() so the chip
> +	 * leaves the PRG_CMD state with the output loops re-locked, even when a
> +	 * write above failed; keep the first error to return.  It also carries
> +	 * the required post-lock settling sleep.
> +	 */
> +	ret =3D sit9531x_prg_commit(sitdev);

[Severity: High]
Does this code commit a partially written hardware state to the active NVM?

If any of the byte-by-byte writes to the 5-byte DIVO register fail, the goto
commit path unconditionally calls sit9531x_prg_commit(). That helper issues
a SIT9531X_UPDATE_NVM command, which transfers the corrupted shadow registe=
rs
into the active hardware state, making the output frequency unpredictable.

Can this safely abort the update instead?

> +	if (ret && !rc)
> +		rc =3D ret;
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * Step 5: flush the PLL's output phase so the new DIVO starts
> +	 * aligned instead of keeping the arbitrary phase the divider
> +	 * happened to be at.
> +	 */
> +	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);
> +	if (rc)
> +		return rc;
> +
> +	sitdev->out[out_idx].freq =3D (u32)div64_u64(fvco, divo);

[Severity: Medium]
Could this assignment truncate the actual output frequency?

The function div64_u64(fvco, divo) returns a u64, but the result is cast to=
 a
u32 without any maximum frequency bounds checking. If an extremely high
frequency is requested and divo is evaluated as small, the calculated result
might exceed U32_MAX, resulting in an incorrectly truncated cached frequenc=
y.

> +
> +	return 0;
> +}
[ ... ]
> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 67b9fbba9f2e8..a7510ca721b61 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> @@ -576,8 +600,79 @@ sit9531x_dpll_output_pin_direction_get(const struct =
dpll_pin *pin,
[ ... ]
> +static int
> +sit9531x_dpll_output_pin_frequency_get(const struct dpll_pin *pin,
> +				       void *pin_priv,
> +				       const struct dpll_device *dpll,
> +				       void *dpll_priv, u64 *frequency,
> +				       struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	int rc;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_output_freq_get(sitdev, dpin->id, frequency);
> +	mutex_unlock(&sitdev->multiop_lock);
> +
> +	if (rc)
> +		*frequency =3D sit9531x_out_state_get(sitdev, dpin->id)->freq;

[Severity: Medium]
Is it safe to perform this fallback read outside of the multiop_lock?

If sit9531x_output_freq_get() fails, the code drops the lock and reads the
cached freq value. This read can race with concurrent writers updating the
cache under the multiop_lock (e.g., sit9531x_output_freq_set()), potentially
leading to load tearing on 32-bit architectures.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214030.2095=
5-1-arouhi@sitime.com?part=3D8
