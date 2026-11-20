Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215514;
	b=qH+tCceap6HRNWzMTjTAiSrec1qKKy78W2zDilZx4R+/llqXERAcH/U469tSJDriDcsE
	 Kj1VU7WQMSjTwRpapbEw2Kl9duIh1CEq/xd3yr7KFpPKrqH7fD3ZAywOJg9Xkkt1sJPZ0
	 Dl7ASMe/XnAoA7bVrgpmrMmwhDlgRUSuHo8u/w3xjjEhCBBSMKDbwOKkQ8Wfe9wti8knl
	 LCmHT3qSaj3EJt54y04MuLp2CquicLb1eIfxbv83q4+RaRF6lvuo/9VIMk4G2yqIOeeK2
	 Ysf3zHKsffvHPAE/G+AQ6bFP11u5GNwxzuB2yYWmkKFhcfPVE0gzUXCr9CFj4+XXz+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vxWkYXynTQVLxl2PylPg0CKck46ydBFyAXKsxc2kgzk=;
	b=pDmeHctL2358Z627AKs3s8CFdE5Qgpa4d9VPlIrPcdr3RTiP461CkCpk0cnZJNeA2SRw
	 QA9GQXAFROe6Gq4m05FAXcfZVO9x775fytcQmphyGoJ4KpgqOyxAThvzE/2WzZK76SBNJ
	 v6a+FpE209GaGUtLbft6LlC02g5CEOWpNBQYjpLnnkh+JCr4HXmNR05lYEWvL09ITQqv1
	 KhkmbarIrkwth1A9Wsqw+NlaZIXltjfqfFgmmOxXBzv1ghKMfC+c2/zXWGTL1+fqYExtT
	 B6I+cChrL0Bru3FvsUIWKyoP61KXOxUue/Ir+Lh66pottkmAKQdrNiiKXxeI4758T5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbJYlMJt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590D1606A68F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbJYlMJt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC27B1F000C4;
	Fri, 20 Nov 2026 22:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215514;
	bh=vxWkYXynTQVLxl2PylPg0CKck46ydBFyAXKsxc2kgzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cbJYlMJtJQeWfQoWo2oBc0/mjKKZMprJSYagwwBfHNG/tNxzuEWeCIJiOw5vn8MHi
	 e9qsuoQy9lQd7l1uS0Y5kDEBiKa7gzhbt+CLLmRR2jx8te/IF509H17qVSQfWL1l3d
	 tqlfANvaVfGUbPidxo//BS2HLxTgw5ZMZNncIfSSkr+W/DaEutElcLvbpKh7a8N1oQ
	 R+IrR5nKyGToGcmkQ+UZH8Qjob7jAv6R0n2iRQBw8g6RVVWAqLpa7socnFaj+cnI9S
	 NAOh+2hcmYGXjQT5mQ32SGQeLq1eflKqiaLnqk2CiK4SUMdhKqebaovD7VXxhtU4Fe
	 RpgLwrNPFeLag==
Message-ID: <sashiko-outbox-226327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 11/13] dpll: sit9531x: add support to
 adjust output phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119225752.41846-12-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
 <20261119225752.41846-12-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:58:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] dpll: sit9531x: stale phase_adj cached when retime_pending is
  set on error
- [Medium] dpll: sit9531x: spurious pin notifications while
  retime_pending is set
- [Medium] dpll: sit9531x: phase flush marked fired before trigger is
  cleared low
- [Low] dpll: sit9531x: unsigned underflow in
  sit9531x_output_phase_read()
--

commit 143a1b7f99e490d4972a0786a10e854c727940fb
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to adjust output phase

This commit adds output phase-adjust support to the sit9531x DPLL driver,
including register encoding/decoding, re-timing on output frequency changes,
and deferred retries for failed phase flushes and re-time writes.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index eb1d10e1fde2e..fd8f0df9116d6 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -1559,6 +1576,65 @@ static int sit9531x_pll_small_update(struct sit953=
1x_dev *sitdev, u8 pll_idx)
>  				     SIT9531X_SMALL_UPDATE_CMD);
>  }
> =20
> +static int sit9531x_pll_small_update_close(struct sit9531x_dev *sitdev,
> +					   u8 pll_idx)
> +{
> +	return sit9531x_write_pll_close(sitdev, pll_idx,
> +					SIT9531X_PLL_REG_SMALL_UPDATE,
> +					SIT9531X_SMALL_UPDATE_CMD);
> +}
> +
> +/*
> + * Undo a phase flush: restore the trigger select and the flush enable o=
f @plls
> + * from @armed.
> + */
> +static int sit9531x_phase_flush_undo(struct sit9531x_dev *sitdev,
> +				     bool ctrl_back, u8 ctrl, u8 plls, u8 armed)
> +{
> +	const u8 en =3D SIT9531X_PLL_PHFL_ON_DEMAND_EN;
> +	int rc =3D 0, ret;
> +	u8 i;
> +
> +	if (ctrl_back) {
> +		rc =3D sit9531x_write_close(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,
> +					  ctrl);
> +		sitdev->flush_ctrl_pending =3D !!rc;
> +		sitdev->flush_ctrl =3D ctrl;
> +	}
[ ... ]
> @@ -1638,40 +1725,19 @@ static int sit9531x_output_phase_flush(struct sit=
9531x_dev *sitdev, u8 pll_idx)
>  	 */
>  	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,
>  			       ctrl | SIT9531X_DIVO_PHASE_TRIG);
> -
> -restore:
> -	ret =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, orig);
> +	fired =3D !rc;
> +
> +undo:
> +	touched =3D parked;
> +	if (armed_here && !(armed_mask & BIT(pll_idx)))
> +		touched |=3D BIT(pll_idx);
> +	ret =3D sit9531x_phase_flush_undo(sitdev, ctrl_back, orig, touched,
> +					armed_mask);
>  	if (ret && !rc)
>  		rc =3D ret;
> =20
> -disarm:
[ ... ]
> +out:
> +	sitdev->chan[pll_idx].flush_pending =3D !fired;
> =20
>  	return rc;
>  }

[Severity: Medium]
As reported by Jakub Kicinski on v15 [1], if the write in
sit9531x_phase_flush_undo() to restore SIT9531X_REG_GPIO_FUNC_CTRL1 fails,
does sit9531x_phase_flush_undo() disarm the target PLL and re-arm the
parked sibling PLLs while SIT9531X_DIVO_PHASE_TRIG is still asserted high?

Because fired is already true, sitdev->chan[pll_idx].flush_pending is also
cleared, so when sit9531x_phase_flush_undo_retry() later writes
SIT9531X_REG_GPIO_FUNC_CTRL1 low, the pulse can complete with the sibling
PLLs armed instead of the target PLL and the target PLL's flush is not
retried.

[ ... ]

> @@ -1837,12 +1904,361 @@ static int sit9531x_output_divo_read(struct sit9=
531x_dev *sitdev, u8 out_idx,
[ ... ]
> +int sit9531x_output_phase_read(struct sit9531x_dev *sitdev, u8 out_idx,
> +			       s64 *phase_ps, bool *beyond)
> +{
> +	const struct sit9531x_chip_info *info =3D sitdev->info;
> +	u8 bytes[SIT9531X_OUT_PRG_BYTES], fine;
> +	u64 coarse =3D 0, fvco, ps, divo;
> +	int rc;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	if (out_idx >=3D info->num_outputs)
> +		return -EINVAL;
> +
> +	*beyond =3D false;
> +
> +	if (!sitdev->out[out_idx].routed)
> +		return -ENODATA;
> +
> +	rc =3D sit9531x_get_fvco(sitdev, sitdev->out[out_idx].pll_idx, &fvco);
> +	if (rc)
> +		return rc;
[ ... ]
> +	if (!rc) {
> +		u64 t_out_ps =3D mul_u64_u64_div_u64(divo, 1000000000000ULL,
> +						   fvco);
> +
> +		if (ps >=3D t_out_ps)
> +			ps -=3D t_out_ps;
> +		if (ps > t_out_ps - ps &&
> +		    t_out_ps - ps <=3D SIT9531X_OUT_PHASE_ADJ_MAX_PS) {
> +			*phase_ps =3D -(s64)(t_out_ps - ps);
> +			return 0;
> +		}
> +	}

[Severity: Low]
Can t_out_ps - ps underflow when sit9531x_get_fvco() returns an out-of-band
VCO frequency above SIT9531X_FVCO_HIGHBAND_MAX?

sit9531x_get_fvco() only rejects fvco < SIT9531X_FVCO_LOWBAND_MIN and warns
without returning an error when fvco is above the PLL's VCO band.  If fvco
is high enough that t_out_ps is less than half of the 210 ps maximum fine
delay (for example, divo =3D=3D 1 and fine =3D=3D 7 with fvco > 9.53 GHz), =
a single
ps -=3D t_out_ps leaves ps > t_out_ps, wrapping the unsigned subtraction
t_out_ps - ps and returning an unfolded *phase_ps larger than the output
period.

[ ... ]

> @@ -1915,20 +2421,138 @@ int sit9531x_output_freq_get(struct sit9531x_dev=
 *sitdev, u8 out_idx,
[ ... ]
> +	if (!same) {
> +		/*
> +		 * The delay bytes take effect on a small-change update, as in
> +		 * Dely_program_output.py; only a divider rewrite needs the
> +		 * programming state.
> +		 */
> +		rc =3D sit9531x_outsys_debug_open(sitdev);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D sit9531x_output_phase_bytes_write(sitdev, out_idx,
> +						       new_bytes, old_bytes,
> +						       &bytes_back);
> +		bytes_in =3D !rc;
> +		if (!rc)
> +			rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
> +					       SIT9531X_SMALL_UPDATE_CMD);
> +		sit9531x_outsys_debug_close(sitdev);
> +		if (rc) {
> +			if (bytes_in) {
> +				out->phase_stale =3D true;
> +				out->retime_ps =3D phase_ps;
> +				out->retime_pending =3D true;
> +			} else if (!bytes_back) {
> +				out->phase_stale =3D true;
> +				chan->flush_pending =3D true;
> +			}
> +			return rc;
> +		}
> +	}

[Severity: Medium]
As reported by Jakub Kicinski on v15 [2], when arming out->retime_pending
on error here (and in the `retime && landed` error branch of
sit9531x_output_freq_set()), does leaving out->phase_adj at its previous
value cause sit9531x_dpll_output_pin_phase_adjust_get() to report the old
delay while a re-time to out->retime_ps is queued?

Because sit9531x_dpll_output_pin_phase_adjust_get() skips
sit9531x_output_phase_read() while out->retime_pending is set, userspace
reads the old out->phase_adj; if userspace then requests that reported
value before the next poll, dpll_pin_phase_adj_set() treats the request as
a no-op and sit9531x_retime_retry() overwrites the pin delay with
out->retime_ps on the next poll tick.

[ ... ]

> @@ -2559,6 +3203,25 @@ static void sit9531x_ho_release_retry(struct sit95=
31x_dev *sitdev, u8 pll_idx)
>  		 'A' + pll_idx);
>  }
> =20
> +/*
> + * Re-time the output delay after a failed rate change. Caller must hold
> + * sitdev->multiop_lock.
> + */
> +static void sit9531x_retime_retry(struct sit9531x_dev *sitdev, u8 out_id=
x)
> +{
> +	struct sit9531x_out *out =3D &sitdev->out[out_idx];
> +	s64 was;
> +
> +	if (!out->retime_pending)
> +		return;
> +
> +	was =3D out->phase_adj;
> +	if (!sit9531x_output_phase_adjust_set(sitdev, out_idx, out->retime_ps))
> +		dev_info(sitdev->dev, "out%u: delay re-timed\n", out_idx);
> +	if (out->phase_adj !=3D was || out->phase_stale)
> +		out->ntf_pending =3D true;
> +}

[Severity: Medium]
Does checking out->phase_stale without `!out->retime_pending` here (and in
sit9531x_dpll_output_pin_phase_adjust_set() and
sit9531x_dpll_output_pin_frequency_set()) emit a pin change notification on
every failed retry while a re-time is pending?

Whenever out->retime_pending is set, out->phase_stale is also true.  If
sit9531x_output_phase_adjust_set() fails during sit9531x_retime_retry(),
out->phase_stale sets out->ntf_pending =3D true, and
sit9531x_dpll_output_ntf_pending() skips hardware readback because
out->retime_pending is true and returns true, sending a notification with
unchanged attributes on every failed poll tick.

[1] https://lore.kernel.org/r/20261117021822.2220376-1-kuba@kernel.org
[2] https://lore.kernel.org/r/20261117021822.2220376-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119225752.4184=
6-1-arouhi@sitime.com?part=3D11
