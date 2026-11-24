Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480847;
	b=ACaS21eENTBUEqJsh210cPjPYg2y3cfvHw6yJl/LzkaBS0G6ZcacYA3/HoO5rCxSR8N7
	 EDnE8JWlRCKOSl9QrFt6U06emXBkDcm5MIdN7ov12NNcH8eKEqyHKlKDEGHIf1sEkv9hL
	 troHx/AA6imNRhtA+oPTn6iuP153kEnUTN7lIETnjfyQjQrr/9nU7TD4doj3yWVyBoewf
	 9lfashyUrTzVMLwFtzTc86ymUwPPnc8LDu8PVRufrwrJsQoA2Vxe8dC7rootLl3EI0mLc
	 WNjb71J/UEYmdx6k0cPex5N7DXBirwjClhEhD+D443F+2+fL/H7pH4Hsj11TNQ8r2sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480847;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=j0AP/tOfNaNmqtC2Oo/J6hs0hXGWRh3Ux8cO7KWXH/A=;
	b=kQ/7kCXPg6vMxWNFlvv6ya5xLqES2XDDecSEYhGQT2A/P7JDhd41WsQtYuNHJDwQW3a6
	 vRIf0nlU2nfiSqrL/4y4FLUaJQh+LLaaG3Stzam/XqdSeZs3ooPIj0LRMiheeznQiqxSI
	 22oDm6P1OSrdMhxGZWzibRnHjN4faa/Bw3hs7IV/GacWd34ox3uwFHSX/Uu+OtUHBZtun
	 xYtXlnFxlzMhHLPt3k4X6gI5LXzvQXvAJaKuSSPxv1/MMhMX9Zd2QMMczKQEHYhRJy3p0
	 3XAaYty+0ewS6PA6DpN6pZImlM8qhUrCK2DXscwgGuri7b/LfGydjbBgt8u2AY9jYiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G8yaUtNV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C1F60A2611;
	Tue, 24 Nov 2026 00:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G8yaUtNV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608791F000F0;
	Tue, 24 Nov 2026 00:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480847;
	bh=j0AP/tOfNaNmqtC2Oo/J6hs0hXGWRh3Ux8cO7KWXH/A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G8yaUtNVurYKbMXUe9BBCeqFT23QtBK6zewYmEkw59ZAtZMtv0k9YK9WGYmvEN4IS
	 OzKvMXm3x5lRIBaq6CrDtxR6FsAnnXLZwN+NUU6BSP2ZbUPVydikQOMOr3G8dPvzOr
	 DODJjfO0csXdhwzWqmutH3WOu0iGFcs00+QlTcfhgtZniZzQr0N2ylEG33q5kbO5tl
	 XXemtbinZa76ul51LNCpO8yppBEPoc1CibPYwoKvt71kUz0J/1ONEPUFUfwjPad5+9
	 71nbLeFVV+1TokIxc1FVjoy/uXnWRWwhTUfj4TTPhKBwO9JJkHsD/5AEg1bCFapHKk
	 QNU5+XYUC1z9g==
Subject: Re: [PATCH net-next v16 07/13] dpll: sit9531x: implement input pin
 state on a DPLL
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:45 +0000
Message-ID: <179548084590.3135.1130493643566818608@kernel.org>
In-Reply-To: <20261119225752.41846-8-arouhi@sitime.com>
References: <20261119225752.41846-8-arouhi@sitime.com>
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

Thank you for your contribution! Sashiko AI review found 13 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 9 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message does not say that setting an input pin to
  DISCONNECTED can power down the input receiver for the whole device.
- [Medium] The commit message describes the table write as 'the
  documented procedure: force holdover, write the slots, latch with a…
- [Medium] The driver can lose track of a forced holdover it set itself.
- [Medium] For a PLL on manual input select,
  sit9531x_dpll_selection_state_get() returns CONNECTED only when…
- [Medium] Receiver gating does not protect the input of a PLL whose
  manual input select comes from the select pins.
- [Medium] sit9531x_prio_activesel_pick() (core.c:738) tries to keep the
  current source, but in this patch it reads that source from the…
- [Medium] sit9531x_reselect() (core.c:1699) returns early for manual,
  empty-table, free-run and pending-write PLLs, but not for an inactive…
- [Medium] For a differential pair, the driver writes the P-lane code
  where the profile used the N-lane code.
- [Medium] dpll: sit9531x: sit9531x_reselect() leaves PLL stuck in
  holdover
- [Low] The patch includes changes unrelated to input pin state that the
  commit message does not mention: (a) exponential back-off of the poll…
- [Low] Every external input pin is registered with
  DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE (prop.c:164-166), and one…
- [Low] sit9531x_input_enable() (core.c:302) only clears the lane-pair
  FORCE bit so the lane 'uses the loaded configuration', then sets…
- [Low] sit9531x_input_disable() (core.c:266) read-modify-writes the
  FORCE bit first (core.c:284) and clears the STATE bit afterwards.

--

dpll: sit9531x: implement input pin state on a DPLL

This patch adds state_on_dpll_get/set and operstate_on_dpll_get for the
sit9531x input pins. SELECTABLE and DISCONNECTED map to whether the input
is listed in each PLL's priority table. Table writes force holdover,
rewrite the slots, latch with a small update and release holdover, and the
poll worker re-selects a PLL in holdover when a listed source returns.

> Report and set whether an input takes part in a PLL's reference
> selection. The PLL picks its reference from a priority table: an input
> in the table is SELECTABLE, one absent is DISCONNECTED, and setting the
> state adds or removes it.

[Severity: Medium]
Should the commit message say that DISCONNECTED can also power down the
input receiver for the whole device?

In sit9531x_dpll_input_pin_state_on_dpll_set(), once ref->pll_mask drops
to zero, the driver calls sit9531x_input_disable(). That sets the page
0x02 receiver FORCE bit and clears STATE for the whole lane pair.

SELECTABLE calls sit9531x_input_enable(), which clears FORCE. That also
releases any force-off the loaded profile had set. The poll worker also
retries a failed power-down on its own through sit9531x_input_off_retry().

The receiver is shared by all four PLLs and by both lanes of a pair. A
per-(pin, DPLL) operation therefore has a device-wide side effect.

> A table write uses the documented procedure: force holdover, write
> the slots, latch with a small update, release. The pin reported active
> is the one the part feeds the PLL while the PLL tracks it and the lane
> has signal.
>
> A PLL in holdover after losing its reference is re-selected when a
> listed source returns.

[Severity: Medium]
Does this match what sit9531x_prio_table_commit() does?

On every non-empty write it does one more thing than the four steps. It
reads the last priority register and replaces the CLK_ACTIVESEL nibble
with a source chosen by sit9531x_prio_activesel_pick(). So the driver does
decide which source the PLL latches. Yet the message justifies refusing
CONNECTED with "the driver does not program manual input select".

The re-select also covers more than "a PLL in holdover after losing its
reference". sit9531x_reselect_arm() runs from sit9531x_dev_state_fetch()
at probe and from sit9531x_resume(). On the first poll, sit9531x_reselect()
then commits for any PLL with ho_freeze set while a listed source has no
LOS:

    if (chan->reselect_armed) {
        if (top == SIT9531X_PRIO_SRC_NONE || !chan->ho_freeze) {
        ...

Nothing checks why the PLL is in holdover; it could be a profile-forced
holdover. If FORCE was already set, ho_foreign leaves the HO_CTRL force in
place. The table, the selection nibble and the global small update are
still written, and each commit forces holdover for at least 10 ms.

Could the message describe the active selection write and the re-select
at probe and resume?

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 8a63b92fb7d62..d61c2a8e24f39 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -223,6 +262,72 @@ static void sit9531x_input_get_regs(const struct sit9531x_dev *sitdev,
>  	}
>  }
>  
> +/* Caller must hold sitdev->multiop_lock. */
> +int sit9531x_input_disable(struct sit9531x_dev *sitdev, u8 index)
> +{

[ ... ]

> +	rc = sit9531x_read_u8(sitdev, force_reg, &val);
> +	if (!rc)
> +		rc = sit9531x_write_u8(sitdev, force_reg, val | BIT(pair));
> +
> +	ret = sit9531x_read_u8(sitdev, state_reg, &val);
> +	if (!ret)
> +		ret = sit9531x_write_u8(sitdev, state_reg, val & ~BIT(pair));

[Severity: Low]
Can setting FORCE first turn the receiver on for one I2C transfer?

Suppose STATE still holds 1 for this pair while the profile keeps the
receiver off. Writing FORCE first applies STATE=1 until the second write
clears it. sit9531x_output_hiz_write() orders its writes the other way for
this reason:

	/*
	 * STATE before MASK: enabling the override first can drive the pad for
	 * one I2C transfer.
	 */

Would clearing STATE before setting FORCE avoid the transient?

[ ... ]

> +/*
> + * Release the force so the lane uses the loaded configuration. Caller must hold
> + * sitdev->multiop_lock.
> + */
> +int sit9531x_input_enable(struct sit9531x_dev *sitdev, u8 index)
> +{

[ ... ]

> +	rc = sit9531x_read_u8(sitdev, force_reg, &val);
> +	if (rc)
> +		return rc;
> +	rc = sit9531x_write_u8(sitdev, force_reg, val & ~BIT(pair));
> +	if (rc)
> +		return rc;
> +
> +	ref->enabled = true;
> +	ref->off_pending = false;

[Severity: Low]
What happens here if the loaded profile itself keeps this receiver off?

Clearing FORCE hands the lane back to the profile, but ref->enabled is set
to true either way. sit9531x_ref_state_fetch() computes:

	ref->enabled = !((force & BIT(pair)) && !(state & BIT(pair)));

so the mismatch is never noticed.

A SELECTABLE request then succeeds and adds the source to the table,
forcing holdover and re-latching, while the receiver stays off. The pin
only shows NO_SIGNAL. Is it intended that the driver can never turn on a
receiver the profile disabled?

[ ... ]

> @@ -382,20 +487,462 @@ static u8 sit9531x_prio_slot_get(u8 val, u8 slot)

[ ... ]

> +/* Order the members by configured priority */
> +static void sit9531x_prio_table_build(struct sit9531x_dev *sitdev, u8 pll_idx,
> +				      u16 members, u8 *srcs)
> +{

[ ... ]

> +	for (i = 0; i < SIT9531X_PRIO_MAX_SLOTS; i++)
> +		srcs[i] = i < n ? order[i] : SIT9531X_PRIO_SRC_NONE;
> +}

[Severity: Medium]
Does the device treat codes k and SIT9531X_PRIO_SRC_N_BASE + k as the same
differential receiver output?

A profile may list a differential pair by its N-lane code. members comes
from prio_mask, which only holds canonical P-lane bits. Any table change
therefore rewrites that entry as k.

The memcmp() against the raw chan->prio_srcs in
sit9531x_prio_table_apply() then sees a change and forces holdover, even
when the members are the same.

In the re-select path, sit9531x_reselect() passes the raw
chan->prio_srcs. sit9531x_prio_activesel_pick() misses the N-coded entry
when it compares the canonical cur, and returns top instead.
sit9531x_prio_top_live() always returns a canonical code. The
CLK_ACTIVESEL nibble then gets a P-lane code that the latched table does
not contain.

The comment in sit9531x_chan_routed_ref_read() about "a differential pair
fed through its N-lane code" suggests the device does tell the two codes
apart.

[ ... ]

> +static u8 sit9531x_prio_activesel_pick(struct sit9531x_dev *sitdev,
> +				       const u8 *old, const u8 *srcs, u8 cur)
> +{
> +	u8 top, i;
> +
> +	top = sit9531x_prio_top_live(sitdev, srcs);
> +	if (top != SIT9531X_PRIO_SRC_NONE &&
> +	    top != sit9531x_prio_top_live(sitdev, old))
> +		return top;
> +
> +	cur = sit9531x_prio_src_canon(sitdev, cur & SIT9531X_PRIO_NIBBLE_MASK);
> +
> +	if (sit9531x_prio_src_usable(cur) &&
> +	    sit9531x_prio_src_live(sitdev, cur))
> +		for (i = 0; i < SIT9531X_PRIO_MAX_SLOTS; i++)
> +			if (srcs[i] == cur)
> +				return cur;

[Severity: Medium]
Is cur the right source to keep here? It comes from the CLK_ACTIVESEL
nibble. The driver's own comments say this nibble does not change when
the device falls back to another listed source.

Take table [A, B], with the nibble naming B and the device fallen back to
A. A user write that adds C re-latches B. That moves the PLL off the
higher-priority A it is tracking.

The next patch, "dpll: sit9531x: add support to get and set priority on
input pins", checks the routed source first, which fixes this tracking
case. Two problems remain at the end of the series.

First, when called from sit9531x_reselect(), the PLL is in holdover or
unlocked, so routed_ref is invalid. sit9531x_reselect() also passes the
same array as both old and srcs:

	rc = sit9531x_prio_table_commit(sitdev, pll_idx, chan->prio_srcs);

so the "top changed" branch above can never fire. If A and B both come
back in the same poll after a full outage, the pick latches B. live_top
is then set to A, and nothing corrects it afterwards.

Can the PLL stay on the lower-priority source indefinitely?

Second, srcs[i] == cur compares a canonical code against raw table codes.
If the table lists a differential pair by its N-lane code, the match
fails. The function then falls through to top, a canonical P code that
is not in the table.

[ ... ]

> +	ho_foreign = (val & BIT(SIT9531X_PLL_HO_FORCE_BIT)) &&
> +		     chan->prio_mask && !chan->ho_release_pending;

[ ... ]

> +release:
> +	/*
> +	 * An empty table keeps the forced holdover; the PLL uses the source in
> +	 * the selection nibble, which still names the old one.
> +	 */
> +	if (!chan->prio_mask) {
> +		dev_dbg(sitdev->dev,
> +			"PLL%c: no source listed, holdover kept\n",
> +			'A' + pll_idx);
> +		chan->ho_release_pending = false;
> +		goto out;
> +	}
> +
> +	if (ho_foreign) {
> +		dev_dbg(sitdev->dev,
> +			"PLL%c: holdover was forced before the write, left in place\n",
> +			'A' + pll_idx);
> +		goto out;
> +	}

[Severity: Medium]
Does the empty-table branch lose the record that the driver owns the
forced holdover?

It keeps HO_CTRL FORCE set but clears ho_release_pending. A normal re-add
is fine, because prio_mask is still 0 when ho_foreign is computed.

The table can also become non-empty without a driver write, for example
from an I2C tool. sit9531x_chan_state_fetch() accepts such a table and
re-seeds it through sit9531x_prio_cfg_seed(). Then:

sit9531x_dev_chan_states_update()
  sit9531x_chan_state_fetch()     /* prio_mask now non-zero */
  sit9531x_reselect()             /* top != live_top, ho_freeze set */
    sit9531x_prio_table_commit()
      ho_foreign == true          /* "left in place" */

live_top is updated after that, so the poll never retries. Later user
commits keep seeing ho_foreign as well.

Can the PLL then stay in forced holdover permanently while its table lists
live sources?

Teardown does not undo this either. sit9531x_dev_stop(), and
sit9531x_dev_pending_retry() at the end of the series, only call
sit9531x_ho_release_retry(). That does nothing unless ho_release_pending
is set, and no warning is printed for this case. Receivers forced off by
sit9531x_input_disable() are also never released on unbind.

The commit message also does not mention the new rule in
sit9531x_dpll_frozen_status(). A frozen PLL with an empty table and
invalid holdover memory is now reported as UNLOCKED.

[ ... ]

> @@ -793,11 +1471,39 @@ static int sit9531x_ref_pll_mask_fetch(struct sit9531x_dev *sitdev)
>  	return 0;
>  }
>  
> +/*
> + * Mark the input each manual-select PLL uses; its table need not list it.
> + * Caller must hold sitdev->multiop_lock.
> + */
> +static void sit9531x_manual_claims_add(struct sit9531x_dev *sitdev)
> +{
> +	const struct sit9531x_chan *chan;
> +	u8 pll_idx;
> +
> +	for (pll_idx = 0; pll_idx < SIT9531X_NUM_PLLS; pll_idx++) {
> +		chan = &sitdev->chan[pll_idx];
> +		if (chan->manual_input &&
> +		    chan->manual_ref < sitdev->info->num_inputs)
> +			sitdev->ref[chan->manual_ref].pll_mask |= BIT(pll_idx);
> +	}
> +}

[Severity: Medium]
What keeps the receiver on for a PLL that takes its manual select from the
select pins?

sit9531x_chan_select_fetch() sets manual_ref to SIT9531X_REF_INVALID and
leaves it there in the pin-select branch. The only later update is in
sit9531x_chan_state_fetch(), and it happens only while the PLL is
tracking and the debug-bus read succeeds. A PLL that is not tracking at
probe or resume claims nothing here.

Now take an automatic PLL that lists the same input:

sit9531x_dpll_input_pin_state_on_dpll_set(DISCONNECTED)
  sit9531x_input_prio_remove()
  ref->pll_mask &= ~pll_bit;      /* now 0 */
  sit9531x_input_disable()        /* shared receiver forced off */

The manual PLL can then never track that input, so it never learns
manual_ref. Its pins use sit9531x_dpll_input_pin_manual_ops, which has no
setter.

Can a request on one DPLL silently cut the reference of another, manual
one?

In the register-select branch, the low nibble of GPIO_INPUT_FUNC_CTRL5..8
is decoded as a plain source code. regs.h notes that bit 6 (indirect
choice) and bit 5 (active/spare) are not decoded. With bit 6 set, could
manual_ref protect the wrong receiver?

This code is unchanged at the end of the series.

[ ... ]

> +static void sit9531x_reselect(struct sit9531x_dev *sitdev, u8 pll_idx)
> +{
> +	struct sit9531x_chan *chan = &sitdev->chan[pll_idx];
> +	u8 top;
> +	int rc;
> +
> +	/* A PLL on manual input select uses no priority table */
> +	if (chan->manual_input || !chan->prio_mask || chan->mode ||
> +	    chan->ho_release_pending || chan->table_pending)
> +		return;
> +
> +	top = sit9531x_prio_top_live(sitdev, chan->prio_srcs);
> +	if (chan->reselect_armed) {
> +		if (top == SIT9531X_PRIO_SRC_NONE || !chan->ho_freeze) {
> +			chan->reselect_armed = false;
> +			chan->live_top = top;
> +			return;
> +		}
> +	} else {
> +		if (top == chan->live_top)
> +			return;
> +		/*
> +		 * Tracking is locked and not frozen; the two bits are read
> +		 * independently.
> +		 */
> +		if (top == SIT9531X_PRIO_SRC_NONE ||
> +		    (chan->locked && !chan->ho_freeze)) {
> +			chan->live_top = top;
> +			return;
> +		}
> +	}
> +
> +	rc = sit9531x_prio_table_commit(sitdev, pll_idx, chan->prio_srcs);

[Severity: Medium]
Can this early return leave a PLL in holdover while a listed source has
signal?

The top == chan->live_top test runs before anything looks at
chan->ho_freeze or chan->locked. live_top is also updated on the
"locked and not frozen" path without a commit. Two sequences seem to
end with no re-select.

First case: take table [IN0, IN1] with the PLL on IN1 after IN0 lost
signal. IN0 comes back while IN1 is still good. top becomes IN0, but
the PLL is locked and not frozen, so live_top is set to IN0 and nothing
is written.

If IN1 then loses signal and the PLL enters holdover while IN0 is still
live, the next poll computes top == IN0 == live_top and returns here.
sit9531x_prio_table_commit() is never called, so the active selection
is never re-latched to IN0.

Second case: the top source drops long enough for the PLL to enter
holdover, then recovers before the next poll samples the clock monitors
in sit9531x_input_mon_fetch(). From the poll's point of view top never
changed, so it still matches live_top and the frozen PLL is left alone.

The comment above sit9531x_prio_activesel_pick() says the PLL uses the
latched source until it loses signal. The commit message says a PLL in
holdover after losing its reference is re-selected when a listed source
returns.

Does the device leave holdover by itself in either case? Or does the
PLL stay frozen until something else rewrites the table?

If it stays frozen, should the re-select be driven by the PLL being
frozen with a live listed source, with live_top only limiting how often
a commit is repeated while a fresh latch is still acquiring?

[Severity: Medium]
Should an inactive PLL be excluded from the early return above?

sit9531x_chan_state_fetch() sets:

	chan->locked = active && !(outer_lol & BIT(pll_idx));

so an unused PLL always reads as not locked, and the locked guard never
stops the commit.

On an unused PLL with a non-empty table, every change of the top live
source runs sit9531x_prio_table_commit() from the poll worker. Each run
forces holdover and sleeps 10-12 ms under multiop_lock. It rewrites the
table and the active selection, and issues the page 0 global small-change
update. It also logs "re-selecting, a source is back".

sit9531x_dpll_lock_status_get() already treats !chan->active as a
separate state. This code is unchanged at the end of the series.

[ ... ]

> @@ -913,8 +1804,14 @@ static void sit9531x_dev_periodic_work(struct kthread_work *work)
>  				     "Failed to clear notifications: %d\n",
>  				     rc);
>  
> +	if (answered || !rc)
> +		sitdev->poll_fails = 0;
> +	else if (sitdev->poll_fails < SIT9531X_POLL_STRETCH_MAX)
> +		sitdev->poll_fails++;
> +
>  	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work,
> -				   msecs_to_jiffies(SIT9531X_STATUS_POLL_MS));
> +				   msecs_to_jiffies(SIT9531X_STATUS_POLL_MS <<
> +						    sitdev->poll_fails));
>  }

[Severity: Low]
This isn't a bug, but some changes in this patch look unrelated to input
pin state, and the commit message does not mention them:

  the exponential poll back-off here, up to 8x the period
  dev_warn() turned into dev_warn_ratelimited() in the poll paths
  the new sit9531x_pin_nodes_check() pass over input-pins and output-pins
  the regmap precious_reg callback

SIT9531X_POLL_STRETCH_MAX was added unused in "dpll: sit9531x: register
DPLL devices and pins". That patch's message says the worker "polls the
status registers twice a second", and the first user only shows up here.
Could these changes be split out, or at least described?

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 6d676fabf13ee..56bdec4bcf67e 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -155,6 +168,120 @@ const struct dpll_device_ops sit9531x_dpll_device_ops = {

[ ... ]

> +/* Caller must hold sitdev->multiop_lock. */
> +static void
> +sit9531x_dpll_selection_state_get(struct sit9531x_dev *sitdev,
> +				  const struct sit9531x_dpll *sitdpll,
> +				  u8 pin_id, enum dpll_pin_state *state)
> +{
> +	const struct sit9531x_chan *chan;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	chan = sit9531x_chan_state_get(sitdev, sitdpll->id);
> +
> +	if (chan->manual_input) {
> +		if (chan->routed_ref == pin_id && !chan->stale)
> +			*state = DPLL_PIN_STATE_CONNECTED;
> +		else
> +			*state = DPLL_PIN_STATE_DISCONNECTED;
> +		return;
> +	}

[Severity: Medium]
Should the state of a pin on a manual PLL depend on routed_ref?

sit9531x_chan_state_fetch() fills routed_ref only while the PLL is
tracking: active, outer loop locked, not free-run and not frozen. In every
other case it is SIT9531X_REF_INVALID. So every input of a manual PLL
reads DISCONNECTED while the PLL is acquiring, in holdover after losing
its reference, or stale.

Documentation/driver-api/dpll.rst says the pin state "reflects the
administrative intent set by the user". In manual mode, CONNECTED means
the pin is selected to drive the dpll device. Hardware status belongs in
the operstate, which already reports NO_SIGNAL.

chan->manual_ref already holds the selected input. Could it be used here
instead? This code is unchanged at the end of the series.

[ ... ]

> @@ -167,8 +294,123 @@ sit9531x_dpll_input_pin_direction_get(const struct dpll_pin *pin,

[ ... ]

> +/*
> + * For a PLL on manual input select: the select pins or register choose the
> + * reference, so the pin has no state setter and no priority.
> + */
> +static const struct dpll_pin_ops sit9531x_dpll_input_pin_manual_ops = {
> +	.direction_get		= sit9531x_dpll_input_pin_direction_get,
> +	.state_on_dpll_get	= sit9531x_dpll_input_pin_state_on_dpll_get,
> +	.operstate_on_dpll_get	= sit9531x_dpll_input_pin_operstate_on_dpll_get,
>  };

[Severity: Low]
sit9531x_pin_props_get() registers every external input pin with
DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE, and the same dpll_pin is shared by
all four PLLs. On a manual PLL this ops table has no state_on_dpll_set, so
dpll_pin_state_set() returns early:

	if (!ops->state_on_dpll_set)
		return -EOPNOTSUPP;

Userspace gets no extack message with that. Would a setter that refuses
the request and explains why through NL_SET_ERR_MSG() be clearer?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
