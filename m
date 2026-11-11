Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428816;
	b=y7X/yAbHGrYV0QYuv+7xGpFOgcqUp/n6JhJoR0yMv2HRtmJoULr0hK3PEEcIqomusYiO
	 8HeV+ZS0TZjUC87+pNAJVyJ57lrnwU3o7euLUqOvqfA3FgDZHQVVPTidqwGxULOXz42Je
	 JGXmSqg+fmjWlX9RAi2VgA4G6DbqItEDfB1GF++HHtz0OTb836thuiKwWiu4/QTMhU/9q
	 /3anhf88xpHv8DZVoruMTwp2h3AS3qtnWU5VuTPPGdbCTcCsuu7CgJSNL2iNr16vqtshZ
	 hOufB62NOp1o6xErj9+SOLmRceVUAqVqZDU/5sOukBSFsEgPx9zcw3O7W68W2yTBu8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b457zrlIpI93fBcgwW4nrbVacp1+qcu4SeChJ8yb4OQ=;
	b=tOwwPiUUZ8n2+Nki9vdweojWSFJHPSeSii+EPY6lticS2gQ953yeVB8Eosp+61mQIAGV
	 LXTX4RLQ1mXgO1YYM4dJIICcrcVPHKAXW77wx8CmZPT/ZdexVnFBenYP5yDZ69VpHjgPf
	 70EgLN7HG5RaJdx8E42wHTRbL4x/wiytq5XzVJrsnppdHGnl2EBnsjF107qkkfXfKXD+M
	 +mNleodlCvDefWZzRDOwpkXSPwdPnYYIl7EwVw1EhZuPhEEdQ9kuvAGIHWoKGt6dguSPS
	 rnNeoMRRmVjLpBZ8RLDDJu+/uz8Grs2JdG80dz+iIxxn8UsotAmQV0bymmIm3xgiCag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hu5rNzMc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028A9606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hu5rNzMc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E06C1F00A08;
	Wed, 11 Nov 2026 20:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428815;
	bh=b457zrlIpI93fBcgwW4nrbVacp1+qcu4SeChJ8yb4OQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hu5rNzMc0NLlo6WWZhZoawt3BBJAukVw6bgxq/PIcOj8F+TRPfiAzRqcjsOZ4nIMA
	 Y0rJApjvjYdq8w4rSKjZaWEDQD6hFi66zLPdFimceGABcSxUHGoY3R0b0HZyNLGAZM
	 IEI8J6yRYqpklj2WaenEf0/mzGsU4izZUcXHVOKDFoZfKNWqv0WcVGBs8DHymxS5Ky
	 V/hRPw/d4SsCbHBmk829wqmaAbieZgaST/d+7sgD1miYnNMQFavVZzggu+OOkkvSVe
	 WLefaKb8ekeUOMouPTsfACDbp3HxiHz7hh7YjhwpvbY88vg6rsAuclxk4yv3i6UA84
	 WberXzgwOsQaQ==
Message-ID: <sashiko-outbox-209662@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 11/13] dpll: sit9531x: add support to
 adjust output phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110202607.55744-12-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-12-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:26:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] dpll: sit9531x: phase flush into open loops in
  sit9531x_output_phase_adjust_set()
- [Medium] dpll: sit9531x: broken beyond and retime_pending state
  tracking on freq change
- [Medium] dpll: sit9531x: misordered phase flush undo and loop commit
  in sit9531x_dev_stop()
--

commit b81ddf969266a9670cf4d33bb4abc4443cce505f
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to adjust output phase

This commit adds output pin phase adjustment support to the sit9531x DPLL
driver, programming coarse VCO-cycle and fine 30 ps delay registers,
triggering PLL output phase flushes, and re-timing delays on rate changes.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 458de502bc8f7..9896d5aa40f56 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -1829,28 +2241,117 @@ int sit9531x_output_freq_set(struct sit9531x_dev=
 *sitdev, u8 out_idx,
>  	if (rc)
>  		return rc;
> =20
> +	if (out->phase_stale && !out->retime_pending) {
> +		s64 phase_ps;
> +
> +		rc =3D sit9531x_output_phase_read(sitdev, out_idx, &phase_ps,
> +						&beyond);
> +		if (rc)
> +			return rc;
> +		out->phase_adj =3D phase_ps;
> +		out->phase_armed =3D !beyond && phase_ps;
> +		out->phase_stale =3D false;
> +	}
> +
> +	/*
> +	 * The reset delay counts VCO cycles; an advance is stored as T_out -
> +	 * |advance| and must be re-encoded for the new period. Write it in the
> +	 * divider's programming window; a second flush would restart the PLL's
> +	 * dividers.
> +	 */
> +	rc =3D sit9531x_output_phase_bytes_read(sitdev, out_idx, old_bytes);
> +	if (rc)
> +		return rc;
> +	sit9531x_output_phase_bytes_decode(old_bytes, &coarse, &fine);
> +	beyond =3D !out->phase_armed && out->phase_adj;
> +	if (out->retime_pending || out->phase_armed ||
> +	    ((coarse || fine) && !beyond)) {
> +		held =3D out->retime_pending ? out->retime_ps : out->phase_adj;
> +
> +		rc =3D sit9531x_output_phase_encode(fvco, divo, held, &coarse,
> +						  &fine, &phase_adj);
> +		if (rc)
> +			return rc;
> +		encoded =3D true;
> +		sit9531x_output_phase_bytes_build(old_bytes, coarse, fine,
> +						  new_bytes);
> +		retime =3D memcmp(old_bytes, new_bytes, sizeof(new_bytes)) !=3D 0;
> +	}
[ ... ]
>  	ret =3D sit9531x_prg_commit(sitdev);
>  	if (ret && !rc)
>  		rc =3D ret;
> -	if (rc)
> +	if (rc) {
> +		if (bytes_in || (encoded && !retime && divo_in)) {
> +			out->phase_adj =3D phase_adj;
> +			out->phase_armed =3D phase_adj !=3D 0;
> +			out->phase_stale =3D false;
> +			out->retime_pending =3D false;
> +		} else if (retime && landed) {
> +			out->retime_ps =3D held;
> +			out->retime_pending =3D true;
> +			out->phase_stale =3D true;
> +		} else if (encoded && landed) {
> +			out->phase_stale =3D true;
> +		} else if (beyond) {
> +			out->phase_stale =3D true;
> +		}
> +		if (landed)
> +			chan->flush_pending =3D true;
>  		return rc;
> +	}
[ ... ]
> +	if (encoded) {
> +		out->phase_adj =3D phase_adj;
> +		out->phase_armed =3D phase_adj !=3D 0;
> +		out->phase_stale =3D false;
>  	}
> =20
> -	sitdev->out[out_idx].freq =3D div64_u64(fvco, divo);
> +	/*
> +	 * A delay beyond the range was not re-timed and now decodes against the
> +	 * new divider.
> +	 */
> +	if (beyond)
> +		out->phase_stale =3D true;

[Severity: Medium]
Can out->retime_pending and beyond both become true here, causing
sit9531x_output_freq_set() to mark a newly re-timed delay stale?

If DIVO lands in sit9531x_output_freq_set() but writing the re-timed delay
bytes fails, the error path sets out->retime_pending =3D true and
out->phase_stale =3D true, and sit9531x_dpll_output_pin_frequency_set() sen=
ds
a change notification. Because sit9531x_dpll_output_pin_phase_adjust_get()
does not check out->retime_pending:

drivers/dpll/sit9531x/dpll.c:sit9531x_dpll_output_pin_phase_adjust_get() {
	...
	if (sitdev->out[dpin->id].phase_stale) {
		bool beyond;
		s64 phase_ps;

		rc =3D sit9531x_output_phase_read(sitdev, dpin->id, &phase_ps,
						&beyond);
		...
		sitdev->out[dpin->id].phase_adj =3D phase_ps;
		sitdev->out[dpin->id].phase_armed =3D !beyond && phase_ps;
		sitdev->out[dpin->id].phase_stale =3D false;
	}
}

it reads back the un-retimed delay against the new divider while
out->retime_pending is still set. If that readback sets beyond =3D true (so
out->phase_armed is false and out->phase_adj > 0), a subsequent
sit9531x_output_freq_set() call computes beyond =3D true while also entering
the out->retime_pending branch (encoded =3D true). At the end of
sit9531x_output_freq_set(), "if (beyond)" overwrites out->phase_stale =3D t=
rue
after the re-timed delay was just programmed, so the next getter readback
decodes a negative advance from hardware as a positive delay whenever
T_out - |advance| exceeds 1 ms.

Also, because sit9531x_dpll_output_pin_phase_adjust_get() overwrites
out->phase_adj and clears out->phase_stale while out->retime_pending is
true, a user request for that reported phase_adj is treated as a no-op by
dpll_pin_phase_adj_set() and then overwritten with out->retime_ps when
sit9531x_retime_retry() runs on the next poll.

Finally, in the error path of sit9531x_output_freq_set(), "else if (beyond)"
sets out->phase_stale =3D true without checking landed, causing
sit9531x_dpll_output_pin_frequency_set() to see moved =3D=3D true and send a
change notification even when the divider register was not modified.

[ ... ]
> @@ -1893,20 +2394,130 @@ int sit9531x_output_freq_get(struct sit9531x_dev=
 *sitdev, u8 out_idx,
[ ... ]
> +	/*
> +	 * Skip the write if the quantized bytes are unchanged; a rewrite
> +	 * restarts the divider phase of every output on the PLL.
> +	 */
> +	same =3D !memcmp(old_bytes, new_bytes, sizeof(new_bytes)) &&
> +	       !out->phase_stale;
> +	if (same && !chan->flush_pending) {
> +		rc =3D 0;
> +		goto cache;
> +	}
> +
> +	if (!same) {
> +		/*
> +		 * Output-system registers take effect only inside PRG_CMD,
> +		 * committed to the NVM shadow.
> +		 */
> +		rc =3D sit9531x_prg_enter(sitdev);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D sit9531x_output_phase_bytes_write(sitdev, out_idx,
> +						       new_bytes, old_bytes,
> +						       &bytes_back);
> +		bytes_in =3D !rc;
> +
> +		ret =3D sit9531x_prg_commit(sitdev);
> +		if (ret && !rc)
> +			rc =3D ret;
> +		if (rc) {
> +			if (bytes_in) {
> +				out->phase_adj =3D phase_adj;
> +				out->phase_armed =3D phase_adj !=3D 0;
> +				out->phase_stale =3D false;
> +				out->retime_pending =3D false;
> +				chan->flush_pending =3D true;
> +			} else if (!bytes_back) {
> +				out->phase_stale =3D true;
> +				chan->flush_pending =3D true;
> +			}
> +			return rc;
> +		}
> +	}
> +
> +	/*
> +	 * Restart the divider phase so the delay applies against a known edge.
> +	 */
> +	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);

[Severity: Medium]
Can sit9531x_output_phase_adjust_set() fire sit9531x_output_phase_flush()
while sitdev->loops_open is still true?

If writing new_bytes succeeds (bytes_in is true) but sit9531x_prg_commit()
fails to lock the loops, sitdev->loops_open stays true, out->phase_stale is
set to false, and chan->flush_pending is set to true. If
sit9531x_output_phase_adjust_set() is called again before the poll worker
runs and the request quantizes to the same register bytes (or targets
another output on the same PLL whose bytes match), same is true and
chan->flush_pending is true. The "!same" block that calls
sit9531x_prg_commit() is skipped, and sit9531x_output_phase_flush() runs
into open loops and clears chan->flush_pending. As noted in
sit9531x_dev_chan_states_update(), a flush pulse sent into open loops may be
lost when they re-lock, and because chan->flush_pending was cleared, the
poll worker will not retry the flush after locking the loops.

[ ... ]
> @@ -2925,15 +3596,46 @@ static void sit9531x_dev_stop(struct sit9531x_dev=
 *sitdev)
>  			dev_warn(sitdev->dev,
>  				 "PLL%c left in forced holdover\n", 'A' + i);
>  	}
> +
> +	sit9531x_phase_flush_undo_retry(sitdev);
> +	if (sitdev->flush_ctrl_pending)
> +		dev_warn(sitdev->dev,
> +			 "phase flush trigger source select not put back\n");
> +	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {
> +		if (!(sitdev->flush_arm_pending & BIT(i)))
> +			continue;
> +		dev_warn(sitdev->dev, "PLL%c: on-demand phase flush left %s\n",
> +			 'A' + i,
> +			 (sitdev->flush_armed & BIT(i)) ? "parked" : "armed");
> +	}
>  	mutex_unlock(&sitdev->multiop_lock);
> =20
> +	/*
> +	 * Re-time first, since it re-locks the loops; the flush runs only into
> +	 * locked loops.
> +	 */
>  	mutex_lock(&sitdev->multiop_lock);
> +	for (i =3D 0; i < sitdev->info->num_outputs; i++) {
> +		sit9531x_retime_retry(sitdev, i);
> +		if (sitdev->out[i].retime_pending)
> +			dev_warn(sitdev->dev,
> +				 "out%u: delay left not re-timed to its rate\n",
> +				 i);
> +	}
>  	if (sitdev->loops_open) {
>  		sit9531x_prg_commit(sitdev);
>  		if (sitdev->loops_open)
>  			dev_warn(sitdev->dev,
>  				 "output loops left unlocked at removal\n");
>  	}
> +	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {
> +		if (!sitdev->loops_open)
> +			sit9531x_flush_retry(sitdev, i);
> +		if (sitdev->chan[i].flush_pending)
> +			dev_warn(sitdev->dev,
> +				 "PLL%c: output dividers left unaligned\n",
> +				 'A' + i);
> +	}
>  	mutex_unlock(&sitdev->multiop_lock);
>  }

[Severity: Medium]
Should sit9531x_phase_flush_undo_retry() and its warnings run after
sit9531x_retime_retry() and sit9531x_flush_retry(), and should
sit9531x_prg_commit() run before sit9531x_retime_retry()?

Both sit9531x_retime_retry() and sit9531x_flush_retry() call
sit9531x_output_phase_flush(), so if sit9531x_phase_flush_undo() fails
during either retry, flush_ctrl_pending or flush_arm_pending is set after
sit9531x_phase_flush_undo_retry() and the teardown warnings have already
executed. In addition, if sitdev->loops_open is true when
sit9531x_retime_retry() calls sit9531x_output_phase_adjust_set() and the
delay bytes already match (same is true), sit9531x_output_phase_flush() will
fire into unlocked loops before the "if (sitdev->loops_open)" block commits
and locks them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202607.5574=
4-1-arouhi@sitime.com?part=3D11
