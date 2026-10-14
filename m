Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B124D09E6
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017712; cv=none; b=VyoycN9Mq1f/iPsRqUoBPXQcA79Gg4z9/TEyyVaFB9TC8rV1mzvK6ksBooLY5ZhtyNdQ/7u0nNhI5NF2pM+L8CNjpnCIrQhWAWzU7L1mTXGPfDKA6N9m7aqAF7zi6Xky83/4iGzaM+QM/iGK1sntwEntUTWncy0/6ThNgls/d2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017712; c=relaxed/simple;
	bh=Wo+Zxp6ZPmFQ0YyfAhhmNPd/XgWa87obg5uJ8G1+lkM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=itSj/tYO53IV17EvvnVNO3F/+b/XHwrGfIiCOFDbA5/PhPeJ16J0RmUMxHOm3wV3xy0Zq3aBdAC/o5noUsqnSASxMHGFX1ILVMB2fZQKjgyghXtHF9GrppX7Bi7n/mjXXmBf95xZPj2CtAXyqidK1oPOmaTWmE18VThEAiDfV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiYNKkvZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiYNKkvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C091F000C8;
	Wed, 14 Oct 2026 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017709;
	bh=4RoE+qIxYnSs1ghDDKNvxH9po1s2nz0nTjXnTjxpBsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YiYNKkvZ61VURxWY0gtwfUn3jn8/W2pYuCbcVNKiqoby+c3bBPy22hmuSiW65JK0i
	 XZxUkCG9bQi+sIpZKVjTseI7YR9UjKeQ8ZnxhGfpnz4k5XMUfjvAwETE7wvVtZcFj8
	 z9MIVRYA29xl3GSeCALFBZVaXBGmNQ9365AvQUKbf9PHceoON7zeN0j6XDpeSBz3oH
	 58SaXE7+isLs2y1GskKmBjCl05OlBlUurSk/2+aedxMomlkI2GbtN3QrxFWPMq65O+
	 pcnFP1iXLtW9q8iE/NnoN0p+pzy6EbYcAnCg/Kyup/+dq0wz6hHHzhxFNdVjQlWtYV
	 1wiKGWL/YFpvA==
Message-ID: <sashiko-outbox-171998@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 10/12] dpll: sit9531x: add support to
 adjust output phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013224131.27149-11-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-11-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 22:41:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dpll: operations on unrouted outputs disrupt PLL 0 by flushing its=
 phase
- [Medium] dpll: sit9531x: missed flush_pending update strands unaligned ou=
tput
--

commit 0ba6c14ce491dafce857ce27044cf9f711bbf95f
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to adjust output phase

This commit adds support to adjust the output phase for the SiT9531x DPLL
driver. It allows shifting an output in time against others driven by the s=
ame
PLL by configuring the programmable reset delay registers.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 9aa0d327b6bf6..e15070ea2ae69 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -2294,8 +2748,22 @@ int sit9531x_output_freq_set(struct sit9531x_dev *=
sitdev, u8 out_idx,
>  	ret =3D sit9531x_prg_commit(sitdev);
>  	if (ret && !rc)
>  		rc =3D ret;
> -	if (rc)
> +	if (rc) {
> +		/*
> +		 * The divider may have changed all the same: a failed update
> +		 * can have reached the part, a loop lock can fail after it
> +		 * took effect, and a failed rollback leaves whatever landed.
> +		 * An advance is held as T_out - |advance| against the period
> +		 * that was, and the re-timed bytes may or may not be in, so
> +		 * the cache no longer says what the output does.  Mark it for
> +		 * a read-back: the core drops a retry of either request,
> +		 * the rate because it reads the new one first and the phase
> +		 * because it would match the stale cache.
> +		 */
> +		if (sitdev->out[out_idx].phase_armed)
> +			sitdev->out[out_idx].phase_stale =3D true;

[Severity: Medium]
When prg_commit() fails, the driver marks phase_stale =3D true but omits se=
tting
flush_pending =3D true (unlike the equivalent error path in
sit9531x_output_phase_adjust_set()).

Could this leave the output divider permanently unaligned? If the driver st=
ate
tracking loses the pending flush requirement, a subsequent manual phase set
request could be falsely treated as a no-op and dropped, preventing recovery
without setting a dummy phase first.

>  		return rc;
> +	}
> =20
>  	/*
>  	 * Step 5: flush the PLL's output phase so the new DIVO starts
> @@ -2308,19 +2776,31 @@ int sit9531x_output_freq_set(struct sit9531x_dev =
*sitdev, u8 out_idx,
>  	 * divider on its old phase, which is a realignment that did not
>  	 * happen rather than a rate that did not change -- and reporting a
>  	 * failure would be doubly wrong, because the core asks for the
> -	 * current rate first and would drop an identical retry.
> +	 * current rate first and would drop an identical retry.  A re-timed
> +	 * delay is then committed but not applied either; mark it for a
> +	 * read-back rather than cache a value the flush did not realize.
>  	 */
>  	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);

[Severity: High]
Does this trigger an unintended phase flush on PLL 0 when a frequency
change is applied to an unrouted pin?

When an output pin is not routed to any PLL by the boot configuration,
sit9531x_out_state_fetch() initializes it with routed =3D false and pll_idx=
 =3D 0.
Since sit9531x_output_freq_set() does not check if the pin is routed,
pll_idx =3D 0 is passed to sit9531x_output_phase_flush(), which will forcef=
ully
restart the dividers for all active outputs driven by PLL 0.

>  	if (rc) {
>  		dev_warn(sitdev->dev,
>  			 "out%u: rate changed but the divider phase was not realigned (%d)\n",
>  			 out_idx, rc);
> +		if (retime)
> +			sitdev->out[out_idx].phase_stale =3D true;

[Severity: Medium]
Similarly to the commit failure above, if sit9531x_output_phase_flush()
fails, the cache is marked stale but the pending flush requirement is not
recorded.=20

Will a subsequent retry with the same target phase incorrectly hit the cache
path in sit9531x_output_phase_adjust_set() and skip the required flush?

>  		rc =3D 0;
> +	} else {
> +		/* Whatever flush was owed from before has now run. */
> +		sitdev->out[out_idx].flush_pending =3D false;
> +		if (retime) {
> +			sitdev->out[out_idx].phase_adj =3D phase_adj;
> +			sitdev->out[out_idx].phase_armed =3D phase_adj !=3D 0;
> +			sitdev->out[out_idx].phase_stale =3D false;
> +		}
>  	}
> =20
[ ... ]
> @@ -2374,27 +2854,140 @@ int sit9531x_output_freq_get(struct sit9531x_dev=
 *sitdev, u8 out_idx,
>  	return 0;
>  }
> =20
> +int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,
> +				     u8 out_idx, s32 phase_ps)
> +{
> +	u8 old_bytes[SIT9531X_OUT_PRG_BYTES], new_bytes[SIT9531X_OUT_PRG_BYTES];
> +	const struct sit9531x_chip_info *info =3D sitdev->info;
> +	u64 fvco, divo, coarse;
> +	u8 pll_idx, fine;
> +	s32 phase_adj;
> +	int rc, ret;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	if (out_idx >=3D info->num_outputs)
> +		return -EINVAL;
> +
> +	pll_idx =3D sitdev->out[out_idx].pll_idx;
> +	if (pll_idx >=3D SIT9531X_NUM_PLLS)
> +		return -EINVAL;
> +

[Severity: High]
Does this logic fail to verify sitdev->out[out_idx].routed before
proceeding with pll_idx =3D 0?

Getter functions like sit9531x_output_phase_read() correctly check
!sitdev->out[out_idx].routed and abort with -ENODATA, but this function
proceeds to calculate and write register values against PLL 0 for unrouted
pins.

> +	rc =3D sit9531x_get_fvco(sitdev, pll_idx, &fvco);
> +	if (rc)
> +		return rc =3D=3D -ENODATA ? -ENODEV : rc;
[ ... ]
> +flush:
> +	/*
> +	 * Restart the output divider phase so the freshly programmed delay is
> +	 * applied against a known edge instead of the divider's arbitrary
> +	 * running phase.
> +	 */
> +	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);

[Severity: High]
Since the hardware lacks a per-output flush mechanism, triggering this phase
flush with pll_idx =3D 0 for an unrouted output will forcefully restart the
dividers for all active outputs legitimately driven by PLL 0.

Could a user interacting with an unrouted, disconnected DPLL pin trigger
visible edge jumps and hardware disruption across unrelated active outputs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013224131.2714=
9-1-arouhi@sitime.com?part=3D10
