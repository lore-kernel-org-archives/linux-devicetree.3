Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58127FD49
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516844; cv=none; b=QCBbjiNKwhjeOYC0GXySWZP6frAHlqGDhF0mXuNRtHlfZm2L26C8Sx3jJUxJC/mySuilQv2h2Nm/KMXX9EdrKMguDK4WXkqnn8rDRMoZZyerq1DMGu7Pv2hrJ2mvBK9XIVDzkBoSKiftXDTMm4Him+KObpdV1JOC7lbkissu/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516844; c=relaxed/simple;
	bh=3wcgsSIPtKdHXWEZBHQqaqGTUStJCsYf5A788Y/SvB0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LDxO7E5wNjVTzYx9dWhH0sdS/BwPl8/8TH/3aLrX1Gk8oUoIsv1ap/T+aGlvFZg1SbAtTZ0XdIfrrBqT2AeE8cEF+Gg2wJ8huNxVKQkwNtvbbdcDx7CvhWukc14NvW0ObGOfPZuxkHAmF9ZK7YpfVG0SpQbjYfhesGn4fqfbrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuFQRsEO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuFQRsEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274591F000FF;
	Wed, 16 Sep 2026 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789516842;
	bh=qgmMiW+rhmiLswBIt2OyLxrRYhfCJbMJ3eZWYCuty+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OuFQRsEO2aDt7HnzrW/DeA5tQMRdzZAfgFLvRb4Qt9QheLbL3cUJWaHF+hAOQasy1
	 w3AIZycgViO1sAYWmYo073nREADSxbw16pJkcRyqMxxQlvZDu4I49NQvuAEeg1TGZc
	 awL69WNXd169EbjBvhgaTet2ZMfMyxCB3i8uFH+f6Kad9xxJ4qNUoRU3xlQ0K9rRaK
	 zmdMtKCGS9E9elhMPegEkiz4rzBEDegS97igGB8qsTWjkTCKMo4V1JJXLrThCcNQaP
	 s2jrVBvMjyU6gyDxfoXyRjIEweCSg9LoAwHgdLmgTAobsLwBB/QmIAC2wMcya+Em4k
	 iExdCePLZgjvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 10/15] dpll: sit9531x: add support to adjust
 output phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915000015.80480-11-arouhi@sitime.com>
References: <20260915000015.80480-1-arouhi@sitime.com>
 <20260915000015.80480-11-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:00:41 +0000
Message-Id: <20260916000042.274591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dpll: sit9531x: stale hardware delay causes spurious phase shift o=
n frequency change
- [High] dpll: sit9531x: integer overflow in phase_adj cache corrupts phase=
 on frequency change
--

commit 71a00c5eb4f21406ee20e81e9a6aad131896b711
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to adjust output phase

This commit adds support to shift output in time against others driven by
the same PLL, allowing adjustment of output phase. It handles coarse and fi=
ne
delay steps and folds delays modulo the output period.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index bba42fe302a3b..8d857f1a0c890 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -1641,7 +1641,17 @@ int sit9531x_output_freq_set(struct sit9531x_dev *=
sitdev, u8 out_idx,
> =20
>  	sitdev->out[out_idx].freq =3D div64_u64(fvco, divo);
> =20
> -	return 0;
> +	/*
> +	 * The programmed reset delay counts VCO cycles against the output
> +	 * period in force when it was written, so a rate change silently
> +	 * re-times a previously requested phase adjust.  Re-encode the
> +	 * cached picosecond request against the new rate.
> +	 */
> +	if (sitdev->out[out_idx].phase_adj)
> +		rc =3D sit9531x_output_phase_adjust_set(sitdev, out_idx,
> +						      sitdev->out[out_idx].phase_adj);

[Severity: High]
Does this logic fail to clear stale delay registers if the cached offset was
rounded to exactly one output period?

If a user previously requested a very small negative phase offset (e.g., -1=
 ps),
hardware quantization could round the required delay up to exactly one outp=
ut
period (t_out_ps). The hardware registers would receive this non-zero physi=
cal
delay (which functionally equals 0 degrees), and the driver correctly caches
phase_adj =3D 0.

However, when the frequency is later changed, sit9531x_output_freq_set() sk=
ips
calling sit9531x_output_phase_adjust_set() because phase_adj evaluates to 0.
Does this leave the hardware delay registers retaining the old t_out_ps del=
ay,
which is no longer one full period at the new frequency, resulting in an
arbitrary and spurious phase shift?

[ ... ]

> @@ -1731,6 +1741,206 @@ int sit9531x_output_freq_get(struct sit9531x_dev =
*sitdev, u8 out_idx,
[ ... ]
> +	/*
> +	 * Cache what the registers realize, and only once every step has
> +	 * succeeded: the core drops a repeated request with the same value,
> +	 * so a cache updated by a failed call would make the retry a no-op.
> +	 *
> +	 * Quantizing to whole VCO cycles plus 30 ps steps can land a few
> +	 * picoseconds past the end of the period, which would wrap the
> +	 * subtraction below; one period is the most a delay can be.
> +	 */
> +	coarse_ps =3D mul_u64_u64_div_u64(coarse, 1000000000000ULL, fvco);
> +	abs_ps =3D coarse_ps + (u64)fine * SIT9531X_OUT_PRG_FINE_STEP_PS;
> +	if (abs_ps > t_out_ps)
> +		abs_ps =3D t_out_ps;
> +	if (phase_norm_ps < 0)
> +		sitdev->out[out_idx].phase_adj =3D
> +			abs_ps ? -(s32)(t_out_ps - abs_ps) : 0;
> +	else
> +		sitdev->out[out_idx].phase_adj =3D (s32)abs_ps;

[Severity: High]
Can this downcast to s32 overflow and corrupt the cached phase adjustment?

If a user requests a phase offset near INT_MAX (2,147,483,647 ps) or INT_MI=
N,
hardware quantization in 30 ps steps could round the absolute delay (abs_ps)
up by up to 15 ps, pushing it over the 32-bit signed integer limit (e.g., to
2,147,483,660).

When caching this value, the direct (s32) cast truncates the upper bits and
flips the sign (e.g., to -2,147,483,636). When the frequency is later chang=
ed,
the driver feeds this corrupted opposite-sign value back into
sit9531x_output_phase_adjust_set(), programming the hardware with an incorr=
ect
physical delay. Should there be saturation bounds checking before this cast?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915000015.8048=
0-1-arouhi@sitime.com?part=3D10
