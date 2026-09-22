Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0A3F54A0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107934; cv=none; b=Qk8y0XdJhgOcVx1v/6bJUYNwPxGtJzsv4zT1La53qWwFt+mKO9w2QvYPeErvkBeP2C/jGrekVffG8yNjG5Qx6ktoTEeGnJzFAN7gYRYL8PtQb9oF8NtVRJaMFtTcFSac/Rw/jlWHLK2wBrIt6j3qVogE0Eu/3Uur01c2t9IxyNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107934; c=relaxed/simple;
	bh=lJKg1sYMfssiIc2+SHcFSYmBWnXg5YnJvtl2IkLweVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X37kEvfX8ujz0bQzi6KMBzS0SZx6lBGcq/aJd7KLMa+aWyGys3AK2M1V+HeV3ECk8y/qV5VC9wpXOSlTv2yED55Lppt1bIuLS9UK4h8NjpXicoj1Tx1oaLvukTdrvyy7HAFcs7HqaV2MRnopPk2CkmLOVAHcs9iD8hY2lg1EsUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYLqx4X2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYLqx4X2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803701F0089B;
	Tue, 22 Sep 2026 20:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790107907;
	bh=AkXUWZtxi498USoTEuJpREQkYk63ObVrw4c9hs/P4fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RYLqx4X28Ag5mWaxd02SRv4VkP8AKZNy412Z0zcfEB6w/dGHOdFgTsUr2b6OHLftO
	 Gya1/L2ugoCKpY+NqJKa+Gog65IAXH/PGPHFLcnSRn4mcWCT5UhTi3HX7PzJLq2pVR
	 7YUJDhsg36uqeQnq70lvTuoHnnpCeRYSxHnPqUFicRAnbbPnjXPLoCKRltgDb8nHzC
	 0yibz8bvClIo0l9t6gqB7ujK3ZFZPjzowpCoylfOWlv1n1FCUnd8HJjfTH5S2/8Zm8
	 JUt1jq+/bzz1ctUdVQqGLFs8mNvUVcpxUU1wterNx5GY/EFkPwAfb9YXy2nRQdeskL
	 qZNZ2ACQg6tnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/14] dpll: sit9531x: add support to get phase
 offset on the connected input pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921201108.42676-12-arouhi@sitime.com>
References: <20260921201108.42676-1-arouhi@sitime.com>
 <20260921201108.42676-12-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:11:47 +0000
Message-Id: <20260922201147.803701F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: sit9531x: permanent debug tap state corruption on I2C read=
 failure
--

commit 86796ea4e61e041e1adcf2a7bb6d9a9966596b9a
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

    dpll: sit9531x: add support to get phase offset on the connected input =
pin

This patch adds support for reporting the phase difference between a PLL's
reference and the PLL itself in the sit9531x driver. It achieves this by
reading the on-chip time-to-digital converter through the debug window.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index c8c3cd6a64baf..8f6f8ffc8dc13 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> +/*
> + * sit9531x_phase_offset_read - read phase difference via TDC
> + * @phase_ps:	output phase difference in picoseconds
> + *
> + * Reads the Time-to-Digital Converter (TDC) signed 35-bit code from the
> + * PLL page registers, then converts to picoseconds using the VCO
> + * frequency: phase_diff =3D tdc_code / fvco.
> + *
> + * Caller must hold sitdev->multiop_lock.
> + */
> +int sit9531x_phase_offset_read(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			       s64 *phase_ps)
> +{

[ ... ]

> +	/* Unlock the debug page so the TDC registers are accessible. */
> +	rc =3D sit9531x_write_pll_u8(sitdev, pll_idx,
> +				   SIT9531X_PLL_REG_DEBUG,
> +				   SIT9531X_PLL_DEBUG_UNLOCK);
> +	if (rc)
> +		goto relock;
> +
> +	/*
> +	 * Remember the tap selection so it can be put back.  The key
> +	 * register is re-locked below, but the mux is not part of the key:
> +	 * leaving it parked on the TDC with a slow sampling clock selected
> +	 * is a state change the caller did not ask for, and the next reader
> +	 * of a different tap would have to know to undo it.
> +	 */
> +	if (!sit9531x_read_pll_u8(sitdev, pll_idx,
> +				  SIT9531X_PLL_REG_DBG_WRITE_CODE,
> +				  &old_write_code) &&
> +	    !sit9531x_read_pll_u8(sitdev, pll_idx,
> +				  SIT9531X_PLL_REG_DBG_READ_CODE,
> +				  &old_read_code))
> +		have_old =3D true;

[Severity: Medium]
What happens if the initial I2C reads fail here?

If a transient I2C read failure occurs when attempting to save the write
and read codes in sit9531x_phase_offset_read(), have_old remains false but
the function does not abort.

The function then proceeds to overwrite the registers, and eventually skips
the restoration during cleanup because have_old is false:

> +relock:
> +	if (have_old) {
> +		sit9531x_write_pll_u8(sitdev, pll_idx,
> +				      SIT9531X_PLL_REG_DBG_READ_CODE,
> +				      old_read_code);
> +		sit9531x_write_pll_u8(sitdev, pll_idx,
> +				      SIT9531X_PLL_REG_DBG_WRITE_CODE,
> +				      old_write_code);
> +	}

Could this permanently leave the debug tap state corrupted (parked on the T=
DC
with a slow clock enabled) and break subsequent reads of other taps?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921201108.4267=
6-1-arouhi@sitime.com?part=3D11
