Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480857;
	b=W4seKRrczHOLfx+x0n91ji1jVhmbbZ1//EMmghT+pXqcJuxOIXA2O2KvrfcPfmnyb0g7
	 ReLTvzn3WfYauAajQhMvs7fyPmiQzodkN3qJdeOvUpFm1ycVIzidRrnF2/JFGU6k/bfkA
	 1Vub9acjUEJqHSS/NuNPCriO+lyytUrRTap9UUevzd4V1ihW3aAfVGaJtSITU+qJerCmY
	 wo3rAdr32hWgFPDOJsWGTpbCej3efFkD8+8wDFLsjMNI9/D5sDbcOSSW3s+53Ay0avrgF
	 2dKwCBakllhY4e5hLtQQU68TEIarmAmpJa3IiMhUutFTOzaJdUyXHEMFuuLwTTJzzbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480857;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3+CoINo29AaMTB8reeDKXz9V5E8P50HrTJChPACT9Uw=;
	b=wLZlytNQrH4k/3E9p2X8kSDb6MLGi2Fj4Tze2rMYNVHQX+6PKUQqrbkhbHzE0aqhn5M+
	 8L1FmoPluSdKzRmsBUM4tZNRyA/05g6farrh56raV/668kdIVh6pNki6b68SZwYojmiYQ
	 rzc+/EuVst6OXaHrCd6fQ51fNHqtugmz5VPhylNnhcBO0mWYEricCsEMqXBoKc8Y2fHpl
	 dv7V+WEgY2FeppxrkS8XoJKJhGqjIqEITDj5EtK0dqz9klxA5NgcdGydma35/gmUXWoVP
	 eG5sd7OfjnNI2wVzKB4Glv7C7E/YP9Bp1JkwAnG7bzMGCXwaLu7qFDSW0mI70SmS2Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HqMM+DkK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FABD606A689;
	Tue, 24 Nov 2026 00:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HqMM+DkK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D37E1F0089E;
	Tue, 24 Nov 2026 00:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480857;
	bh=3+CoINo29AaMTB8reeDKXz9V5E8P50HrTJChPACT9Uw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HqMM+DkK7D7zRhLrH80b81ovrllIW0SzzQ8b9rvoJEcwNsNsxXrN1Lfmo8HUVbHeR
	 qdulIkoBaMkcEtmQ7QqVMfrjK/fMscooiBSTMb6NOsXxoJmSB2fafbIRvddNlQvhUp
	 YWqYGr3ljrt6nCmBQV9XPWpf7YfRwhVf4JVEQxonKjSCkTk/rdUjKQn//MTotPj5IG
	 QQLRNVvLjAYRzXtGJR8QMyYn01K8s4Nf237lEC2viE1NLGfAZvBITX60ayoISxy4o/
	 FdlubBXTsyNZO/F2uO2jQXgB9gTiOaJR1VojzdqMeUXXn+n+j7CVKr68mPWV7YyYlf
	 nBfa5JHrhiUiw==
Subject: Re: [PATCH net-next v16 13/13] dpll: sit9531x: model the inter-PLL
 sync line as a pair of pins
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:55 +0000
Message-ID: <179548085598.3135.2881887396981027757@kernel.org>
In-Reply-To: <20261119225752.41846-14-arouhi@sitime.com>
References: <20261119225752.41846-14-arouhi@sitime.com>
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

Critical: 0 · High: 0 · Medium: 5 · Low: 7

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] sit9531x_intsync_readback() keeps an earlier partial record
  even when the new scan finds the same PLL with the whole pattern and…
- [Medium] This patch makes sit9531x_dpll_pin_is_registrable() return
  true for SIT9531X_INTSYNC_PIN_ID and SIT9531X_INTSYNC_OUT_PIN_ID,…
- [Medium] sit9531x_dpll_intsync_src_state_on_dpll_get(),
  sit9531x_dpll_intsync_dst_state_on_dpll_get() and…
- [Medium] sit9531x_resume() is written for a part that lost power and
  reloaded its profile ('A part that lost power returns with its…
- [Medium] sit9531x_intsync_enable() and __sit9531x_intsync_disable()
  write whole bytes from intsync_config[] into eight EXT-page registers,…
- [Low] Most of the sit9531x_resume() changes have nothing to do with the
  INTSYNC line.
- [Low] In sit9531x_resume() the old comment still says 'After power loss
  the part is on page 0, not the cached page.
- [Low] intsync_config[] is eight raw byte values for undocumented EXT-
  page debug registers (0x2D, 0x50, 0x51, 0x54, 0x55, 0x5C, 0x5D, 0x6C).
- [Low] When PLLx's EXT page holds a partial pattern,
  sit9531x_dpll_intsync_src_state_on_dpll_set() refuses a CONNECT on any…
- [Low] sit9531x_dpll_intsync_src_state_on_dpll_set() refuses SELECTABLE,
  and any other state that is not CONNECTED or DISCONNECTED, in its…
- [Low] The dpll.c pin-state contract says the INTSYNC destination is
  'SELECTABLE while listed in this PLL's priority table and DISCONNECTED…
- [Low] The INTSYNC code unlocks the debug key (0xBD = 0xC3) on each PLL
  EXT page (0x1A + n).

--

dpll: sit9531x: model the inter-PLL sync line as a pair of pins

This commit registers two pins for the internal inter-PLL sync (INTSYNC)
line. One is a source pin shared by every DPLL, whose state says whether
that PLL drives the line. The other is a selectable destination input on
each PLL. Connecting the source writes an enable pattern into the PLL's
EXT page under its debug key and then sets the global enable. Resume now
re-reads the line owner, output mutes and output delays, and drops some
writes that were pending from before suspend.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 5ec9d2a48fcbf..ca42940796d3d 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -2620,6 +2639,574 @@ static int sit9531x_clear_notifications(struct sit9531x_dev *sitdev)

[ ... ]

> +/*
> + * Values written to the source PLL's EXT page to enable or disable INTSYNC,
> + * which locks the frequency PLL to the phase PLL; they are the values of
> + * Intsync_enable_disable.py.
> + */
> +struct sit9531x_intsync_reg {
> +	u8 offset;
> +	u8 en_val;
> +	u8 dis_val;
> +};
> +
> +static const struct sit9531x_intsync_reg intsync_config[] = {
> +	{ 0x2D, 0x02, 0x00 },
> +	{ 0x50, 0x08, 0x00 },
> +	{ 0x51, 0x04, 0x00 },
> +	{ 0x54, 0x02, 0x00 },
> +	{ 0x55, 0x28, 0x20 },
> +	{ 0x5C, 0x0F, 0x00 },
> +	{ 0x5D, 0xFF, 0x00 },
> +	{ 0x6C, 0xDD, 0x00 },
> +};

[Severity: Low]
Could each of these eight registers get a short description? The only
reference is Intsync_enable_disable.py, which isn't public.
sit9531x_intsync_src_detect() decides source, partial and conflict only
by counting matches against these bytes.

The comment says the pattern "locks the frequency PLL to the phase PLL".
The commit message says "one PLL drives the others as a reference".
Which one describes the hardware? The second is the model this patch
exposes to user space, as a source pin plus a destination input.

[ ... ]

> +int sit9531x_intsync_readback(struct sit9531x_dev *sitdev)
> +{
> +	bool partial = sitdev->intsync_partial;
> +	s8 src = sitdev->intsync_src;
> +	int rc;
> +
> +	rc = sit9531x_intsync_src_detect(sitdev);
> +	if (rc)
> +		return rc;
> +
> +	if (partial && !sitdev->intsync_foreign &&
> +	    (sitdev->intsync_src < 0 ||
> +	     (sitdev->intsync_src == src && !sitdev->intsync_partial))) {
> +		sitdev->intsync_src = src;
> +		sitdev->intsync_partial = true;
> +		sitdev->intsync_foreign = false;
> +	}

[Severity: Medium]
Does this mark a source that is fully driving the line as partial again?
Suppose an earlier partial record exists for PLLx. If the new scan finds
the whole pattern on PLLx with the global enable set, the second half of
the condition is true and intsync_partial goes back to true.

That isn't one of the meanings core.h lists:

 * @intsync_partial: @intsync_src holds part of the source pattern, or the whole
 *   pattern under a clear global enable; not reported as the source

Both sit9531x_dpll_intsync_src_connected() and sit9531x_intsync_driven()
ignore partial records. So the PLL driving the line would show a
DISCONNECTED source pin. The other PLLs' INTSYNC inputs would show
NO_SIGNAL unless one of them is locked.

sit9531x_resume() uses this same readback for the power-loss case ("A
part that lost power returns with its profile's INTSYNC routing ... read
them back"). The partial record may be left by a failed connect or
disconnect (the owner_kept or rollback_failed paths). If the reloaded
profile then sources INTSYNC from that same PLL, would connects on other
PLLs be refused with "PLL%c holds a partial INTSYNC source"? The only
recovery would be a DISCONNECT, which turns off the profile's source.

[ ... ]

> +	rc = sit9531x_pll_small_update(sitdev, src_pll_idx);
> +	if (rc)
> +		goto relock_err;
> +
> +	lock_rc = sit9531x_intsync_debug_lock(sitdev, ext_page);
> +	if (lock_rc)
> +		dev_warn(sitdev->dev,
> +			 "PLL%c: INTSYNC pattern written but the debug window was left open: %d\n",
> +			 'A' + src_pll_idx, lock_rc);
> +
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,
> +			       val | BIT(SIT9531X_INTSYNC_EN_BIT));

[Severity: Low]
What closes the EXT page debug window if this lock fails? The other
debug windows have a pending flag that gets retried:

  - PLL page: chan->key_pending, retried by sit9531x_tap_back_retry()
  - OUTSYS page: outsys_key_pending, retried by the poll

The EXT page has no such flag.

Two other places have the same problem:

  - The relock label in __sit9531x_intsync_disable() only warns, and
    the function can still return 0.
  - sit9531x_intsync_src_detect() returns early on a failed lock and
    leaves that page open.

The setter's follow-up detect or readback re-locks each page. Some
failure cases don't set intsync_stale, for example:

  changed && !rc && detect_rc && !intsync_conflict

If that follow-up scan fails in one of those cases, nothing seems to
retry the lock. The EXT page INTSYNC registers would stay writable, and
the driver would have no record of it.

[ ... ]

> +static int __sit9531x_intsync_disable(struct sit9531x_dev *sitdev,
> +				      u8 src_pll_idx, bool restore,
> +				      bool *owner_kept, bool *touched)
> +{

[ ... ]

> +	in_window = true;
> +
> +	for (i = 0; i < ARRAY_SIZE(intsync_config); i++) {
> +		rc = sit9531x_write_u8(sitdev,
> +				       SIT9531X_REG(ext_page,
> +						    intsync_config[i].offset),
> +				       intsync_config[i].dis_val);
> +		if (rc)
> +			goto restore_global;
> +	}

[Severity: Medium]
Can this overwrite profile settings that are not part of the INTSYNC
switch? Enable and disable both write whole bytes from intsync_config[].
There is no read-modify-write, and the old contents are not saved.

sit9531x_intsync_src_detect() allows pages that hold "other values",
and a connect on such a PLL is not refused. The page then ends up with
the fixed dis_val bytes instead of the profile's values. This happens
after a connect followed by a disconnect. It also happens on the
enable-failure rollback, which goes through __sit9531x_intsync_disable()
with restore == false.

Offset 0x55 has bit 5 set in both en_val (0x28) and dis_val (0x20). That
suggests the register holds at least one other field, and this code
forces it to 1. Would it be better to save and restore the original
bytes, or to change only the INTSYNC bits?

[ ... ]

> @@ -4077,13 +4675,13 @@ static bool sit9531x_dpll_pin_is_registrable(struct sit9531x_dpll *sitdpll,
>  		if (index == SIT9531X_MAX_INPUTS)
>  			return true;
>  		if (index == SIT9531X_INTSYNC_PIN_ID)
> -			return false;
> +			return true;
>  
>  		return sit9531x_input_pin_is_registrable(sitdev, index);
>  	}
>  
>  	if (index == SIT9531X_INTSYNC_OUT_PIN_ID)
> -		return false;
> +		return true;

[Severity: Medium]
Once these pins are registered, user space can see their type.
sit9531x_pin_props_get() in prop.c gives both of them the same type as
the XO:

drivers/dpll/sit9531x/prop.c:sit9531x_pin_props_get() {
	if (sync_in) {
		/* INTSYNC destination: a reference the PLL can lock to. */
		props->dpll_props.type = DPLL_PIN_TYPE_INT_OSCILLATOR;
	...
	} else if (sync_out) {
		/* INTSYNC source: driving it is not a reference selection */
		props->dpll_props.type = DPLL_PIN_TYPE_INT_OSCILLATOR;
	...
	} else if (xo) {
		props->dpll_props.type = DPLL_PIN_TYPE_INT_OSCILLATOR;
	...
}

Is INT_OSCILLATOR the right type for a line driven by another PLL? User
space that finds the free-running oscillator by pin type would see three
INT_OSCILLATOR pins per DPLL, and two of them are not oscillators. Pin
type is uAPI and is hard to change after release.

[ ... ]

> @@ -4482,15 +5080,137 @@ static int sit9531x_suspend(struct device *dev)
>  static int sit9531x_resume(struct device *dev)
>  {
>  	struct sit9531x_dev *sitdev = dev_get_drvdata(dev);
> +	u16 outs_was = 0, outs_now = 0, outs_unread = 0, outs_moved = 0;
> +	bool src_moved;
> +	s8 owner;
> +	int rc;
> +	u8 i;
>  
>  	/*
>  	 * After power loss the part is on page 0, not the cached page. The
>  	 * configuration read at probe is not read again.
>  	 */

[Severity: Low]
This isn't a bug, but this comment now contradicts the code below. That
code re-reads probe-time configuration through
sit9531x_intsync_readback(), sit9531x_output_phase_read() ("read them
back as probe does") and sit9531x_output_state_refresh().

>  	sit9531x_page_cache_drop(sitdev);
> +
> +	/*
> +	 * A part that lost power returns with its profile's INTSYNC routing and
> +	 * output mutes, which the poll does not read; read them back. Arm one
> +	 * re-select for a source lost and restored between samples.
> +	 */
>  	mutex_lock(&sitdev->multiop_lock);
>  	sit9531x_reselect_arm(sitdev);

[Severity: Medium]
Is the part guaranteed to be ready here? This code assumes the part lost
power and reloaded its profile. It then immediately reads and caches
HO_CTRL, the output delay registers, all four EXT pages and the output
mute state.

Probe waits for internal boot after releasing reset:

sit9531x_dev_probe() {
	...
		fsleep(10000);	/* internal boot after release */
	...
}

Suspend and resume don't touch the reset GPIO or power, so nothing here
knows when the part came back. If this runs while the profile is still
loading, these fields could be cached from transient values:

  - intsync_src, intsync_partial and intsync_foreign
  - out->phase_adj and out->phase_armed
  - out->enabled

The poll does not re-read any of them. table_pending and
ho_release_pending could also be dropped based on a transient HO_CTRL
read.

[ ... ]

> +	for (i = 0; i < SIT9531X_NUM_PLLS; i++) {
> +		struct sit9531x_chan *chan = &sitdev->chan[i];
> +		bool retime = false;
> +		u8 j, ho;

[ ... ]

> +		if (!retime && !chan->flush_pending &&
> +		    !(sitdev->flush_arm_pending & BIT(i)))
> +			continue;
> +		dev_warn(sitdev->dev,
> +			 "PLL%c: pending before suspend, dropped:%s%s%s\n",
> +			 'A' + i, retime ? " delay re-time" : "",
> +			 chan->flush_pending ? " output realignment" : "",
> +			 (sitdev->flush_arm_pending & BIT(i)) ?
> +			 " on-demand flush enable" : "");
> +		chan->flush_pending = false;
> +		sitdev->flush_arm_pending &= ~BIT(i);
> +	}
> +	if (sitdev->flush_ctrl_pending) {
> +		dev_warn(sitdev->dev,
> +			 "flush trigger source select pending before suspend, dropped\n");
> +		sitdev->flush_ctrl_pending = false;
> +	}

[Severity: Low]
The commit message says resume "drops the writes left pending from
before suspend, logging each". This loop drops retime_pending,
flush_pending, flush_arm_pending and flush_ctrl_pending. It drops
table_pending and ho_release_pending only when HO_FORCE reads clear.

Several retries are left in place:

  - tap restore (tap_pending, key_pending)
  - input-off
  - the loops_open relock
  - the outsys_key_pending close

The poll queued at the end of resume then runs them from
sit9531x_dev_chan_states_update(), against a configuration that may
have been reloaded:

	if (sitdev->loops_open)
		sit9531x_prg_relock(sitdev);
	else if (sitdev->outsys_key_pending)
		sit9531x_outsys_debug_close(sitdev);
	...
	sit9531x_input_off_retry(sitdev);
	...
		sit9531x_tap_back_retry(sitdev, i);

Is that intended?

Separately, most of the resume work belongs to the output phase, output
state, flush and priority table code rather than to the INTSYNC line.
That includes the delay and mute read-back and the dropped flush, retime
and table writes. Could it go in its own patch?

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 0f2b3d446cb5f..d831bafacf107 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> +static int
> +sit9531x_dpll_intsync_src_state_on_dpll_get(const struct dpll_pin *pin,
> +					    void *pin_priv,
> +					    const struct dpll_device *dpll,
> +					    void *dpll_priv,
> +					    enum dpll_pin_state *state,
> +					    struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll = dpll_priv;
> +	struct sit9531x_dev *sitdev = sitdpll->dev;
> +	int rc;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc = sit9531x_dpll_intsync_refresh(sitdev, extack);
> +	if (rc) {
> +		mutex_unlock(&sitdev->multiop_lock);
> +		return rc;
> +	}

[Severity: Medium]
Can a failed refresh here end the pin dump for the whole system? While
intsync_stale is set, sit9531x_dpll_intsync_refresh() rescans all four
EXT pages over I2C. If that fails, the error (for example -EIO) goes
back to the DPLL core, and dpll_nl_pin_get_dumpit() only skips -ENODEV:

	ret = dpll_cmd_pin_get_one(skb, pin, cb->extack);
	if (ret) {
		genlmsg_cancel(skb, hdr);
		if (ret == -ENODEV) {
			ret = 0;
			continue;
		}
		break;
	}

The dump then stops, so the pins after this one are never listed,
including pins of other DPLL drivers. The same pattern is in
sit9531x_dpll_intsync_dst_state_on_dpll_get() and
sit9531x_dpll_intsync_dst_operstate_on_dpll_get().

Each INTSYNC pin is one dpll_pin shared by all four DPLLs. PIN_GET and
change notifications for it would fail too, and
sit9531x_drive_pins_ntf() would keep setting intsync_ntf_pending.

intsync_stale is set right after an EXT-page read has already failed,
in sit9531x_resume() or in the source setter. So this path runs when
the bus is already known to be failing.
sit9531x_dpll_input_pin_phase_offset_get() maps such errors to
-ENODATA for this reason.

sit9531x_intsync_driven() already treats a stale record as not driven.
Could these getters answer from the cached record instead?

[ ... ]

> +	switch (state) {
> +	case DPLL_PIN_STATE_CONNECTED:
> +		if (was_connected)
> +			break;
> +		if (sitdev->intsync_src >= 0 &&
> +		    sitdev->intsync_src != sitdpll->id) {
> +			if (sitdev->intsync_partial)
> +				NL_SET_ERR_MSG_FMT(extack,
> +						   "PLL%c holds a partial INTSYNC source; disconnect its source pin first",
> +						   'A' + sitdev->intsync_src);

[Severity: Low]
How would user space tell which pin needs disconnecting?
sit9531x_dpll_intsync_src_connected() returns false when
intsync_partial is set, so the partial owner's source pin already
reports DISCONNECTED.

A redundant DISCONNECTED write does reach sit9531x_intsync_disable(),
because the core doesn't short-circuit same-state requests. Nothing in
the reported state shows that the pin needs it, though, and tools that
skip no-op state writes would never send it.

[ ... ]

> +	case DPLL_PIN_STATE_DISCONNECTED:
> +		if (sitdev->intsync_src != sitdpll->id)
> +			break;
> +		rc = sit9531x_intsync_disable(sitdev, sitdpll->id,
> +					      &owner_kept, &changed);
> +		break;
> +	default:
> +		rc = -EINVAL;
> +		break;
> +	}

[Severity: Low]
Should this default case set an extack message? SELECTABLE ends up here
with a bare -EINVAL. The end of the function skips the generic "Failed
to set INTSYNC source state" message for -EINVAL, so user space gets no
explanation. The destination pin's CONNECTED refusal does set one
("Device selects its reference by priority; use selectable").

[ ... ]

> +static int
> +sit9531x_dpll_intsync_dst_state_on_dpll_get(const struct dpll_pin *pin,
> +					    void *pin_priv,
> +					    const struct dpll_device *dpll,
> +					    void *dpll_priv,
> +					    enum dpll_pin_state *state,
> +					    struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	if (sitdev->intsync_src == sitdpll->id)
> +		*state = DPLL_PIN_STATE_DISCONNECTED;
> +	else
> +		sit9531x_dpll_selection_state_get(sitdev, sitdpll,
> +						  SIT9531X_INTSYNC_PIN_ID,
> +						  state);

[Severity: Low]
The pin-state contract comment doesn't cover this case. It says the
INTSYNC destination is "SELECTABLE while listed in this PLL's priority
table and DISCONNECTED otherwise".

Here, and in sit9531x_dpll_pin_snapshot(), the pin is forced to
DISCONNECTED whenever intsync_src matches this PLL. That includes
partial records and owners detected at probe or resume.

A profile can list INTSYNC in the source PLL's own table.
sit9531x_dpll_intsync_selected() only refuses that combination for the
driver's own connect requests. In that case
sit9531x_dpll_input_pin_prio_get() still returns the live slot, so the
pin shows DISCONNECTED with a valid priority. Could the contract
comment and the reported state be made to agree?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
