Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480854;
	b=2xC3i8PEF/WjTkGi9bWJj9rgdcFq54ify4JELvhO6wvYA6lsrsNkRbqCYwzDf/cmKxgO
	 exMMeKwhEmKKdIEKdLDuXV/lVQTF1U9OssP5RE94do8EPhOo859ccv6lcnWAuiYqll43p
	 K/xxcTQXJmM1ydve8/uGG+4NmC6divTIsr6edwMLS+hQ7xCuJlBhc7dpvIOei6h8sUYYw
	 8FJCYyUb4iKFTakXV64NlGyIIs8GpPurbupP6cpSCc5ZvEY9w7OfNf2Gcv/vnokzT/5qp
	 hIqKGUgxWx5AAjdKtkp+LHZ/qXz+Ijpu+68DwqsRRfAtx04PZxRdX7/tUIpYMZgDAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480854;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=660cVJz2FyoPFBqUPJfu3vhLRWotnbc3/ciWR9rVbQg=;
	b=5CWIn9ns5+HLsUiQCGBGnD0VEswPjlO+RygGCdlXzUVghDz4+zXqF/bSBwGuKqN+PeUd
	 wef0Uh1mHoCqxy0W8VVJHR4AZ8MCX7z+mX3HYBAVFzyBD0jH21AkfcuhaKk3HinPEAQjv
	 wrJjTN7DNxGRFRs93XcWw5b4p8Dnvm5W2gF9twdXKlpQEW19jzkbOsk2ljuH0cAmpw09J
	 EUC7DzjEGEpurWfWvDyVuSgrA1pnXrwKMKJTUa7QxRyxirNKq2iAuFHjkV7sQIaxxy/6+
	 IgvWNHwsCFJ1mRFVwjq8v9id0RI7NZfHeSGAlEpTCbQXv4Tz4ROzMq7xQtHsf9W1E1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctDq5+Kv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4960A3801;
	Tue, 24 Nov 2026 00:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctDq5+Kv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7421F01568;
	Tue, 24 Nov 2026 00:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480853;
	bh=660cVJz2FyoPFBqUPJfu3vhLRWotnbc3/ciWR9rVbQg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ctDq5+KvwM4fdy3F8o/Lj8MJTUXPHWwwKK5B4Qo316GtJ/gLHN2DIeK1SacmuumtA
	 XUs5Hq6PykB2a5ywILAWqDQsI5kGfWOx5FW5N9EZphfCnA54qG0fpO0rbnR93X/YuC
	 nHRKSM8UTUjQ6e3KLiYQWceV+5pIf9QtWcuyeJ40Y2D40lQLOpVibRSMQU3dOyw/Nf
	 K+VAnr0NzYtgCDBC7pTjF9+uk2/RVzEJwle1MnpR2ZIqSGgn/Wj8Nkd1nNbeeh3jof
	 POCzf2uo1LWJoOwPkoNMZNZuZMv7YKWpWu24CQCu9Tojhd+z1nWLopnGzUpBx1QJ0J
	 eGao6YAYVddEQ==
Subject: Re: [PATCH net-next v16 11/13] dpll: sit9531x: add support to adjust
 output phase
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:52 +0000
Message-ID: <179548085215.3135.14880597585808987732@kernel.org>
In-Reply-To: <20261119225752.41846-12-arouhi@sitime.com>
References: <20261119225752.41846-12-arouhi@sitime.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 12 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 6 · Low: 6

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] A user request to restore the old delay can be dropped, and
  the poll then applies the earlier request that failed.
- [Medium] Output pins advertise DPLL_A_PIN_PHASE_ADJUST_MIN/MAX =
  -/+SIT9531X_OUT_PHASE_ADJUST_MAX_PS (1e9 ps).
- [Medium] While a pending re-time keeps failing, every poll sends a
  spurious DPLL pin-change notification.
- [Medium] sit9531x_output_phase_flush() sets fired = !rc as soon as
  DIVO_PHASE_TRIG has been written high, and that clears…
- [Medium] sit9531x_output_phase_adjust_set() decides whether to skip the
  write by comparing raw bytes ('same = !memcmp(old_bytes, new_bytes,…
- [Medium] After writing the PRG_RST_DELAY bytes,
  sit9531x_output_phase_adjust_set() issues the small-change update only…
- [Low] On a rate change, sit9531x_output_freq_set() re-encodes the
  cached out->phase_adj.
- [Low] Output pins advertise DPLL_A_PIN_PHASE_ADJUST_GRAN = 1 ps
  (prop.c), but the hardware grid is whole VCO cycles (about 128-203 ps)…
- [Low] The comment on sit9531x_retime_retry() ('Re-time the output delay
  after a failed rate change') and the core.h kernel-doc for…
- [Low] sit9531x_dpll_output_ntf_pending() returns false on any
  sit9531x_output_phase_read() error when 'out->phase_stale &&…
- [Low] In the teardown retry path the last retry of the output-system
  debug-key close runs before the new per-output sit9531x_retime_retry()…
- [Low] sit9531x_output_phase_read() converts the PRG_RST_DELAY cycle
  count to picoseconds, and folds it by the output period, using the…

--

dpll: sit9531x: add support to adjust output phase

This adds phase_adjust_get/set callbacks for sit9531x output pins. A delay
is programmed as whole VCO cycles plus 30 ps fine steps, and an advance is
stored as the complementary delay within the output period. A rate change
re-times a programmed delay, and partly failed writes (flush, flush
restore, re-time) are recorded and retried from the poll and at removal.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index eb1d10e1fde2e..fd8f0df9116d6 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -1638,40 +1725,19 @@ static int sit9531x_output_phase_flush(struct sit9531x_dev *sitdev, u8 pll_idx)
>  	 */
>  	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,
>  			       ctrl | SIT9531X_DIVO_PHASE_TRIG);
> -
> -restore:
> -	ret = sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, orig);
> +	fired = !rc;
> +
> +undo:
> +	touched = parked;
> +	if (armed_here && !(armed_mask & BIT(pll_idx)))
> +		touched |= BIT(pll_idx);
> +	ret = sit9531x_phase_flush_undo(sitdev, ctrl_back, orig, touched,
> +					armed_mask);

[Severity: Medium]
Is it safe to mark the flush as fired here, before the falling edge of the
pulse? regs.h describes the flush as pulsing DIVO_PHASE_TRIG high then low.
The low write now happens in sit9531x_phase_flush_undo(), through
sit9531x_write_close().

If every attempt of that write fails, flush_ctrl_pending is set and TRIG
stays high. sit9531x_phase_flush_undo() still goes on to re-arm every
parked PLL:

	if (ctrl_back) {
		rc = sit9531x_write_close(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,
					  ctrl);
		sitdev->flush_ctrl_pending = !!rc;
		sitdev->flush_ctrl = ctrl;
	}

	for (i = 0; i < SIT9531X_NUM_PLLS; i++) {
		...
		ret = sit9531x_update_pll_close(sitdev, i,
						SIT9531X_PLL_REG_PHFL_CTRL, en,
						(armed & BIT(i)) ? en : 0);

The deferred write of orig then runs from the poll, or at the start of the
next sit9531x_output_phase_flush() before any parking. At that point every
PLL the profile arms is armed.

If the hardware acts on the falling edge, could this restart the dividers
of PLLs that nobody asked to flush? The target PLL's chan->flush_pending
would also already be cleared.

Before this patch, a failed restore was completed by the next flush's
"orig | SIT9531X_DIVO_PHASE_SEL_REG" write, which runs after parking.

>  	if (ret && !rc)
>  		rc = ret;

[ ... ]

> +int sit9531x_output_phase_read(struct sit9531x_dev *sitdev, u8 out_idx,
> +			       s64 *phase_ps, bool *beyond)
> +{

[ ... ]

> +	rc = sit9531x_get_fvco(sitdev, sitdev->out[out_idx].pll_idx, &fvco);
> +	if (rc)
> +		return rc;

[Severity: Low]
Should this readback apply the same sit9531x_fvco_in_band() check that
sit9531x_output_phase_adjust_set() does?

When the PLL is out of band, sit9531x_get_fvco() only warns. Its comment
says Fref * DIVN is then usually not the rate the PLL runs at, but it
still returns 0.

As written, sit9531x_dev_state_fetch(), the getter, the notification path
and sit9531x_output_freq_set() all cache and report a delay converted with
that rate. They also set phase_armed from it.

[ ... ]

> @@ -1851,28 +2267,118 @@ int sit9531x_output_freq_set(struct sit9531x_dev *sitdev, u8 out_idx,

[ ... ]

> +	/*
> +	 * The reset delay counts VCO cycles; an advance is stored as T_out -
> +	 * |advance| and must be re-encoded for the new period. Write it in the
> +	 * divider's programming window; a second flush would restart the PLL's
> +	 * dividers.
> +	 */
> +	rc = sit9531x_output_phase_bytes_read(sitdev, out_idx, old_bytes);
> +	if (rc)
> +		return rc;
> +	sit9531x_output_phase_bytes_decode(old_bytes, &coarse, &fine);
> +	beyond = !out->retime_pending && !out->phase_armed && out->phase_adj;
> +	if (out->retime_pending || out->phase_armed ||
> +	    ((coarse || fine) && !beyond)) {
> +		held = out->retime_pending ? out->retime_ps : out->phase_adj;

[Severity: Low]
The comment above says only an advance needs re-encoding. However,
out->phase_adj holds the nearer-to-zero form from
sit9531x_output_phase_encode():

	if (abs_ps > t_out_ps - abs_ps)
		*phase_adj = -(s32)(t_out_ps - abs_ps);

Take T_out = 10 ns and a request of +7000 ps. About 7 ns of cycles is
programmed, and phase_adj is cached as -3000 with phase_armed set.

If the rate is then halved (T_out = 20 ns), held = -3000 is re-encoded as
an advance: abs_ps = 20000 - 3000 = 17000 ps. Leaving the cycle count
alone would have kept the 7 ns.

Is it intended that any positive delay above half the period becomes an
advance on the next rate change? If so, could the comment be updated? The
code re-encodes delays and advances the same way.

> +
> +		rc = sit9531x_output_phase_encode(fvco, divo, held, &coarse,
> +						  &fine, &phase_adj);

[ ... ]

> @@ -1915,20 +2421,138 @@ int sit9531x_output_freq_get(struct sit9531x_dev *sitdev, u8 out_idx,

[ ... ]

> +int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,
> +				     u8 out_idx, s32 phase_ps)
> +{

[ ... ]

> +	same = !memcmp(old_bytes, new_bytes, sizeof(new_bytes)) &&
> +	       !out->phase_stale;
> +	if (same && !chan->flush_pending) {
> +		rc = 0;
> +		goto cache;
> +	}

[Severity: Medium]
Does this raw-byte comparison match the decoder?
sit9531x_output_phase_bytes_decode() treats register values from 0 up to
SIT9531X_OUT_PRG_DIVO_CYCLES as no delay:

	*coarse = (prg_coarse > SIT9531X_OUT_PRG_DIVO_CYCLES) ?
		  prg_coarse - SIT9531X_OUT_PRG_DIVO_CYCLES : 0;

sit9531x_output_phase_bytes_build(), however, always writes coarse + 2.

Suppose the profile left PRG_RST_DELAY at 0, which is reported as 0 ps. A
request that quantizes to zero, such as 10 ps, builds PROG2 = 2 and fails
the memcmp.

Would this then rewrite the bytes and call sit9531x_output_phase_flush()?
That restarts the divider phase of every output on the PLL, or issues
SIT9531X_PLL_DIRECTIVE_RESTART when PHFL is off. The realized delay does
not change.

dpll_pin_phase_adj_set() short-circuits an exact 0 ps request, because the
getter reports 0. Small non-zero requests still reach the driver.

Would comparing the decoded coarse and fine values avoid this?

> +
> +	if (!same) {

[ ... ]

> +		rc = sit9531x_output_phase_bytes_write(sitdev, out_idx,
> +						       new_bytes, old_bytes,
> +						       &bytes_back);
> +		bytes_in = !rc;
> +		if (!rc)
> +			rc = sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
> +					       SIT9531X_SMALL_UPDATE_CMD);
> +		sit9531x_outsys_debug_close(sitdev);

[Severity: Medium]
The small-change update goes only to page 3's copy of PRG_Directives
(SIT9531X_REG_PRG_DIR_GEN). This includes slots 6-11, whose delay bytes
are on page 4, and regs.h notes that every page has a copy at offset 0x0F.

Does the page 3 update cover the page 4 delay registers?

The flush also follows right after the key is closed, with no wait. The
INTSYNC paths sleep 1-2 ms after a small update.

If the flush lands before the update latches, would the dividers restart
against the old delay? phase_adj would still be cached as the new value,
with neither phase_stale nor flush_pending set.

This depends on hardware behaviour that the source doesn't show, so it may
be fine if Dely_program_output.py does the same.

> +		if (rc) {
> +			if (bytes_in) {
> +				out->phase_stale = true;
> +				out->retime_ps = phase_ps;
> +				out->retime_pending = true;

[Severity: Medium]
In this branch the bytes landed but the small update failed. retime_ps now
holds the new request and retime_pending is set, while out->phase_adj
keeps the old value.

sit9531x_dpll_output_pin_phase_adjust_get() skips the readback while
retime_pending is set, so it returns the old value.

If userspace then asks for that old value, for example to revert,
dpll_pin_phase_adj_set() returns before calling the driver:

	if (!ret && phase_adj == old_phase_adj)
		return 0;

retime_pending and retime_ps are never cleared, so the next poll runs:

sit9531x_dev_chan_states_update()
  sit9531x_retime_retry()
    sit9531x_output_phase_adjust_set(sitdev, out_idx, out->retime_ps)

Can this program the request the user had just replaced, even though the
replacing request returned success?

The getter comment "Bytes waiting for a re-time are for the old rate"
fits the freq_set path. Here the bytes are already for the current rate.

[ ... ]

> @@ -2559,6 +3203,25 @@ static void sit9531x_ho_release_retry(struct sit9531x_dev *sitdev, u8 pll_idx)
>  		 'A' + pll_idx);
>  }
>  
> +/*
> + * Re-time the output delay after a failed rate change. Caller must hold
> + * sitdev->multiop_lock.
> + */

[Severity: Low]
This isn't a bug, but this comment and the @retime_pending kernel-doc in
core.h ("re-timed delay not yet applied") only cover the failed rate
change case.

sit9531x_output_phase_adjust_set() also sets retime_pending and retime_ps
when the small update fails after a plain delay write. In that case the
poll applies a new user request rather than re-timing an existing delay.

Could the comments cover that case too?

> +static void sit9531x_retime_retry(struct sit9531x_dev *sitdev, u8 out_idx)
> +{

[ ... ]

> +	was = out->phase_adj;
> +	if (!sit9531x_output_phase_adjust_set(sitdev, out_idx, out->retime_ps))
> +		dev_info(sitdev->dev, "out%u: delay re-timed\n", out_idx);
> +	if (out->phase_adj != was || out->phase_stale)
> +		out->ntf_pending = true;

[Severity: Medium]
retime_pending is only ever set together with phase_stale = true.

sit9531x_output_phase_adjust_set() can fail before it reaches the cache
label. Examples are -ENODEV from get_fvco or divo_read, -ERANGE from the
encode, a bus error, or the bytes_in branch, which sets phase_stale again.
In each case phase_stale stays true, so this condition is always true.

sit9531x_dpll_output_ntf_pending() skips the re-read while retime_pending
is set, clears ntf_pending and returns true. sit9531x_dpll_changes_check()
then calls dpll_pin_change_ntf().

Does this send a pin-change notification on every poll for as long as the
retry keeps failing, even though nothing on the pin changed?

[ ... ]

> @@ -2977,6 +3666,32 @@ static void sit9531x_dev_stop(struct sit9531x_dev *sitdev)
>  	} else if (sitdev->outsys_key_pending) {
>  		sit9531x_outsys_debug_close(sitdev);
>  	}
> +	for (i = 0; i < sitdev->info->num_outputs; i++) {
> +		sit9531x_retime_retry(sitdev, i);

[Severity: Low]
The last retry of the output-system debug key close runs before this
loop.

Each sit9531x_retime_retry() can call sit9531x_output_phase_adjust_set().
That opens the key again with sit9531x_outsys_debug_open() and closes it
with sit9531x_outsys_debug_close().

If that close fails, only outsys_key_pending is set. Nothing later in
sit9531x_dev_stop() closes the key again.

Can the device be left at removal with the output-system debug registers
unlocked? The same ordering seems to carry over to
sit9531x_dev_pending_retry() later in the series, which the probe failure
path also uses.

> +		if (sitdev->out[i].retime_pending)
> +			dev_warn(sitdev->dev,
> +				 "out%u: delay left not re-timed to its rate\n",
> +				 i);
> +	}

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index e19eb123d0247..8589019b4b436 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -740,12 +749,105 @@ sit9531x_dpll_output_pin_state_on_dpll_set(const struct dpll_pin *pin,

[ ... ]

> +	/*
> +	 * A profile delay on a slow output can exceed the s32 attribute; leave
> +	 * it out.
> +	 */
> +	if (phase_adj > S32_MAX)
> +		return -ENODATA;
> +	*phase_adjust = phase_adj;

[Severity: Medium]
sit9531x_pin_props_get() advertises a phase_range of
+/-SIT9531X_OUT_PHASE_ADJ_MAX_PS (1e9 ps), but this check only drops
values above S32_MAX.

sit9531x_output_phase_read() flags a decode above 1e9 ps in *beyond but
still returns it. Take a profile delay between 1 ms and about 2.147 ms on
a slow output, such as 1.5 ms on a 1 PPS output. It would be reported
above the DPLL_A_PIN_PHASE_ADJUST_MAX sent in the same message.

Writing that value back then fails in dpll_pin_phase_adj_set():

	if (phase_adj > pin->prop.phase_range.max ||
	    phase_adj < pin->prop.phase_range.min) {

Should the getter filter on the advertised range, or on the beyond flag,
instead of S32_MAX?

[ ... ]

> @@ -828,6 +930,17 @@ sit9531x_dpll_output_ntf_pending(struct sit9531x_dev *sitdev,
>  		return false;
>  	if (out->state_stale && sit9531x_output_state_refresh(sitdev, pin->id))
>  		return false;
> +	if (out->phase_stale && !out->retime_pending) {
> +		bool beyond;
> +		s64 phase_ps;
> +
> +		if (sit9531x_output_phase_read(sitdev, pin->id, &phase_ps,
> +					       &beyond))
> +			return false;

[Severity: Low]
On any sit9531x_output_phase_read() error, this returns false before
out->ntf_pending is cleared.

phase_read returns -ENODATA when the output is not routed, or when
sit9531x_get_fvco() returns -ENODATA. Both can last indefinitely: a state
refresh can clear routed, and an outside reconfiguration can change DIVN.
In that state phase_stale is never cleared.

Would a pending pin-change notification for this output then never be
sent, even one for an unrelated state change? Elsewhere the patch treats
-ENODATA as an absent value.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> index 85b446a4b38f0..b9bd62ed473ef 100644
> --- a/drivers/dpll/sit9531x/prop.c
> +++ b/drivers/dpll/sit9531x/prop.c
> @@ -170,6 +170,20 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,

[ ... ]

> +		/*
> +		 * The 30 ps fine step is not advertised; requests are rounded
> +		 * to the nearest achievable delay.
> +		 */
> +		props->dpll_props.phase_gran = 1;

[Severity: Low]
Is 1 ps the right value for DPLL_A_PIN_PHASE_ADJUST_GRAN?

The hardware grid is whole VCO cycles plus 30 ps steps, folded modulo the
output period. sit9531x_output_phase_encode() rounds every request to that
grid, so a request the core accepts as a multiple of 1 ps reads back as a
different value.

dpll.rst describes the attribute as the granularity the pin handles, and
zl3073x advertises its real step (half the synth period). The grid here
is not uniform, so there may be no single exact value. Userspace could
still assume 1 ps resolution from this.

>  	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
