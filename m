Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480849;
	b=nY+dyAfoY6o6rqdG1zi6Yf1Ie6Pru4hXlC97ZRTYB9etMgRmmZQ6r9cm7ja8RqfQnmNA
	 YdO/C87dw1lX/8AM5YFSLu9+nz/a7drBiP3B091hHfI37gzkaImR/XmKvSXFEQpFBfDwK
	 JHEgKGKck/mqd5arfdxK3MdNAZ+By1jTGgtp/ONuu3W6bf8OWD4ggBFeEqsR7F3/SntYW
	 1qGedNhsHsY1ckz/GrjgQtq6hH/1ZWHqr8AT3bpDgjku8/ERwTZQdWSOdTw/aIo4QSKWF
	 pskDyaDX2LMDnxDdNA5EZlNI7ZsWH+lt7BoWoVCzt90imBEyiLWlxl955UZQa3Udg5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480849;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EwOQwYTng8sUwTh7NN8iBsNWr+IdgbRyGsJTVVhqXqg=;
	b=Gy33zrfPLow2qlkywRqRvx/MJYarJIrojHlkhNwLfFKMqskOdSGPd6GLUiblKmU4Ud2T
	 UPhoOGtJ4H7KCCPVG8+WY7TSrs1w8gyK6eiPKXL/j/zYUJ2TdwACjeSYJGrq6U7hBIp6L
	 zewCynHYpOUYVZsjJ2XggxmLQ9vnRNykRpEDSkYIdwWKGHM8ne0WkWCgRFjh3hUrL/ZYi
	 0IJ0YmoG3qEQ/bT+3vyFrT1NhRiQBn4smHKtEbEnU2ImBB0uSk1Ukkd/dOXacELkHrzOF
	 XDhMdUaL2SIg4ZpHUFkJ0pg1ikD3/h+lOJBgHE/exu8Vp/LvCvgCj/IGN3PHHvUJ7Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBjEl8R0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB9606A68D;
	Tue, 24 Nov 2026 00:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBjEl8R0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A38F1F01803;
	Tue, 24 Nov 2026 00:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480849;
	bh=EwOQwYTng8sUwTh7NN8iBsNWr+IdgbRyGsJTVVhqXqg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dBjEl8R05yEfOelqUHU0mVkhYmlw7HnOe4CBB1BDngR79adVz6ZSkBg+htC2h/C2G
	 YHcguXLZDkCTSChifJ4FLnjgfGQq79vo9U3c459u3eApEdU9zSD4s8PtMY5a+MNU0d
	 KNKj33o7fGGv4AVJJ7IOe5D1WOXmerStnosPgVm1wyrQJ2SinGiktvSKH556Fg9+dh
	 GZZ8WxPs/Z9MbdZollb5mpr8ndmoMZHiyNtf89ZsvXLsgORbWYdAkO91zBbkFqXI3I
	 iaAeNMWoateZuoIDKvVybhKbsrrageoRxrflsYuYAAhdqc5tWp+l4JiDe/Ug2YH86K
	 r954eO1VzKHdQ==
Subject: Re: [PATCH net-next v16 10/13] dpll: sit9531x: implement output pin
 state on a DPLL
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:48 +0000
Message-ID: <179548084817.3135.17016387216869997566@kernel.org>
In-Reply-To: <20261119225752.41846-11-arouhi@sitime.com>
References: <20261119225752.41846-11-arouhi@sitime.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Unmuting does not put back the Hi-Z override that was there
  before the mute.
- [Medium] The driver keeps the record of which pads the loaded
  configuration forces (out->hiz_keep) only in driver memory, and…
- [Medium] The programming sequence opens the Page 3 debug key
  (0x03:0xBD) before it writes PRG_DIR_GEN (0x03:0x0F) with…
- [Low] The commit message describes only the output mute through the
  Hi-Z force registers.
- [Low] The get side and the set side disagree on what a part-muted
  output is.
- [Low] When the write of SIT9531X_DEBUG_UNLOCK_VAL to
  SIT9531X_REG_OUTSYS_DEBUG fails, sit9531x_outsys_debug_open() tries to…
- [Low] The unmute branch of sit9531x_output_hiz_write() releases MASK
  bits in order (DIFF, CMOS_P, CMOS_N) and returns on the first failed…

--

dpll: sit9531x: implement output pin state on a DPLL

This patch adds state_on_dpll_get/set for output pins and registers the
output pins routed to each DPLL. An output is muted by forcing its
differential and CMOS Hi-Z override pairs while the Page 3 debug window is
open. The patch also folds the PRG_CMD helpers into sit9531x_prg_relock()
and adds outsys_key_pending tracking for the output-system debug key.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index d3f6955b3bbd0..eb1d10e1fde2e 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -460,12 +460,78 @@ static int sit9531x_output_forced_hiz(struct sit9531x_dev *sitdev,

[ ... ]

> +static int sit9531x_outsys_debug_open(struct sit9531x_dev *sitdev)
> +{
> +	int rc;
> +
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
> +			       SIT9531X_DEBUG_UNLOCK_VAL);
> +	if (rc)
> +		sit9531x_write_close(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
> +				     SIT9531X_DEBUG_LOCK_VAL);
> +
> +	return rc;
> +}

[Severity: Low]
When the unlock write fails here, the result of sit9531x_write_close() is
dropped and outsys_key_pending is never set. Is that intended?

The only place that updates the flag is sit9531x_outsys_debug_close():

    sitdev->outsys_key_pending = !!rc;

sit9531x_dev_chan_states_update() and sit9531x_dev_stop() retry the close
only when that flag is set.

A failed I2C write can still latch the unlock byte, for example when the
error comes after the data phase. If all SIT9531X_CLOSE_TRIES lock attempts
then fail as well, could the Page 3 debug window stay unlocked with nothing
ever retrying the close?

sit9531x_output_disable(), sit9531x_output_enable() and
sit9531x_prg_enter() all reach this path. Would it work to call
sit9531x_outsys_debug_close() in the failure branch, or to set
outsys_key_pending from the sit9531x_write_close() result?

[ ... ]

> +/*
> + * Leave PRG_CMD: re-lock the loops and close the debug window. The sleep is
> + * the settling time after loop lock.
> + */
> +static int sit9531x_prg_relock(struct sit9531x_dev *sitdev)
>  {
> -	int rc = -EIO;
> +	int rc = 0;
>  	u8 attempt;
>  
>  	for (attempt = 0; attempt < SIT9531X_LOOP_LOCK_TRIES; attempt++) {
> @@ -477,30 +543,49 @@ static void sit9531x_prg_abort(struct sit9531x_dev *sitdev)
>  	}
>  	if (rc)
>  		dev_err(sitdev->dev,
> -			"output loops left unlocked after a failed entry: %d\n",
> +			"output loops left unlocked after programming: %d\n",
>  			rc);
>  
> -	sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
> -			  SIT9531X_DEBUG_LOCK_VAL);
> +	sitdev->loops_open = !!rc;
> +
> +	msleep(100);
> +
> +	sit9531x_outsys_debug_close(sitdev);
> +
> +	return rc;
>  }

[Severity: Medium]
sit9531x_prg_relock() always closes the debug key, even when every
LOOP_LOCK attempt failed and loops_open was set. The later retries call
sit9531x_prg_relock() directly. In sit9531x_dev_chan_states_update() and
sit9531x_dev_stop():

    if (sitdev->loops_open)
        sit9531x_prg_relock(sitdev);

These retries write LOOP_LOCK to SIT9531X_REG_PRG_DIR_GEN while the key at
0x03:0xBD is locked, and nothing reopens it first.

Everywhere else, the driver opens the debug key before it writes
PRG_DIR_GEN. Suppose the device ignores PRG_DIR_GEN writes while the key is
locked. The retry would still be ACKed, loops_open would be cleared, and
the output loops would stay in PRG_CMD. Can that happen?

loops_open = !!rc reflects only the I2C status, and nothing reads the loop
state back. Later in the series, the phase offset code also gates on
loops_open.

This patch also adds a new way into this state. A failed PRG_CMD_STATE
write in sit9531x_prg_enter() now goes through sit9531x_prg_relock() and
can set loops_open. The removed sit9531x_prg_abort() never queued a retry.

The out-of-window retry first appeared earlier in this series, in "dpll:
sit9531x: add support to get and set frequency on pins" (through
sit9531x_prg_commit()). This patch rewrites it into sit9531x_prg_relock().
Whether the debug key gates 0x03:0x0F depends on the datasheet.

Should the retry path reopen the debug window before it writes LOOP_LOCK?

[ ... ]

>  static int sit9531x_prg_enter(struct sit9531x_dev *sitdev)
>  {
>  	int rc;
>  
> -	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
> -			       SIT9531X_DEBUG_UNLOCK_VAL);
> +	rc = sit9531x_outsys_debug_open(sitdev);
>  	if (rc)
>  		return rc;
>  
>  	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,
>  			       SIT9531X_PRG_CMD_STATE);
>  	if (rc) {
> -		sit9531x_prg_abort(sitdev);
> +		sit9531x_prg_relock(sitdev);
>  		return rc;
>  	}

[Severity: Low]
This isn't a bug, but the commit message only describes the output mute
through the Hi-Z force registers. The patch also reworks the PRG_CMD
helpers that "dpll: sit9531x: add support to get and set frequency on
pins" added for the output divider write.

sit9531x_prg_abort() is removed. A failed PRG_CMD_STATE write here now goes
through sit9531x_prg_relock(), which sets loops_open, sleeps for 100 ms and
records the result of the key close in outsys_key_pending. Before this
patch, a failed loop lock on this path was never retried.

The poll retry in sit9531x_dev_chan_states_update() and the removal path in
sit9531x_dev_stop() now call sit9531x_prg_relock() instead of
sit9531x_prg_commit(). A retry therefore no longer re-issues
SIT9531X_UPDATE_NVM, and only a code comment explains that.

There is also a new background retry that closes the output-system debug
key after a failed close:

    else if (sitdev->outsys_key_pending)
        sit9531x_outsys_debug_close(sitdev);

Together these change how sit9531x_output_freq_set() behaves on failure.
Could these changes go into the frequency-set patch, or at least be
described in this commit message?

[ ... ]

> @@ -508,51 +593,144 @@ static int sit9531x_prg_enter(struct sit9531x_dev *sitdev)

[ ... ]

> +static int sit9531x_output_hiz_write(struct sit9531x_dev *sitdev, u8 slot,
> +				     bool mute, u8 keep)
>  {

[ ... ]

> +	if (!mute) {
> +		for (i = 0; i < SIT9531X_HIZ_PAIRS; i++) {
> +			/* A pad the loaded configuration forces stays forced */
> +			if (keep & BIT(i))
> +				continue;
> +			rc = sit9531x_hiz_set_bit(sitdev, p[i].mask, p[i].bit,
> +						  false);
> +			if (rc)
> +				return rc;

[Severity: Low]
If a read-modify-write fails partway through this loop, the pairs already
released stay released. Is that intended?

Take a CMOS output where CMOS_P was released and the CMOS_N pair then
fails. OutP is left driving and OutN is still forced to Hi-Z. Neither the
user nor the loaded configuration asked for that state.
sit9531x_output_enable() then reads back part_muted = true and
enabled = true and returns the error. The pin reports CONNECTED while the
request fails.

The mute branch below takes a snapshot of mask[] and state[] and rolls
back on failure. Should the unmute branch do the same?

> +		}
> +		return 0;
>  	}

[Severity: Medium]
The commit message says:

  An un-mute releases the force and the pads return to the loaded
  configuration.

Does this branch restore the loaded configuration? It only clears the MASK
bit of each pair not in keep, and STATE stays at the 0 the mute wrote.

The mask[] and state[] snapshot in the mute branch is used only to roll
back a failed mute. sit9531x_out_state_fetch() fills hiz_keep only for
outputs found part-muted at probe, and only for pairs forced to Hi-Z (MASK
set, STATE clear).

Consider a pair the profile had under a drive override (MASK=1, STATE=1),
or any override on a differential or fully driven output. After a
DISCONNECTED then CONNECTED cycle it comes back as MASK=0, STATE=0. Is
losing that override expected?

sit9531x_dpll_output_pin_state_on_dpll_set() never skips a CONNECTED
request while part_muted is set. So on an output that was part-muted at
probe, every CONNECTED request clears MASK on non-keep pairs the driver
never touched. The readback only checks mask && !state, so nothing reports
the lost override.

Whether MASK=0 behaves differently from MASK=1/STATE=1 depends on the
device's non-override output control. Could the unmute put back the saved
MASK/STATE values instead?

[ ... ]

> @@ -2085,6 +2263,24 @@ static int sit9531x_out_state_fetch(struct sit9531x_dev *sitdev, u8 index)
>  		return rc;
>  
>  	sitdev->out[index].part_muted = part;
> +	sitdev->out[index].state_stale = false;
> +
> +	/* Record the pads the loaded configuration forces on a driven output */
> +	out->hiz_keep = 0;
> +	if (part) {
> +		struct sit9531x_hiz_pair p[SIT9531X_HIZ_PAIRS];
> +		bool forced;
> +		int i;
> +
> +		sit9531x_output_get_hiz_regs(slot, p);
> +		for (i = 0; i < SIT9531X_HIZ_PAIRS; i++) {
> +			rc = sit9531x_hiz_pair_forced(sitdev, &p[i], &forced);
> +			if (rc)
> +				return rc;
> +			if (forced)
> +				out->hiz_keep |= BIT(i);
> +		}
> +	}

[Severity: Medium]
Does hiz_keep survive an unbind/rebind or a module reload?

It is rebuilt only for outputs found part-muted. The driver's own mute,
sit9531x_output_disable()->sit9531x_output_hiz_write(..., true, 0), forces
all three pairs. sit9531x_dev_stop() does not undo those forces, and the
force registers are outside the NVM, so they stay set while the part has
power.

After a rebind without a power cycle, this function sees muted = true and
part = false, and sets hiz_keep = 0. A later CONNECTED request then calls
sit9531x_output_hiz_write(slot, false, 0). That clears MASK on all three
pairs, including the pad the loaded configuration had forced to Hi-Z.

For example, a CMOS output whose profile drives only OutP would end up
with both OutP and OutN driving. Wouldn't that contradict "the pads return
to the loaded configuration"?

Resume, added later in the series, re-reads the mute state but does not
recompute hiz_keep. The gap is still there at the end of the series.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index c8c4aaaf719cf..e19eb123d0247 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> +static int
> +sit9531x_dpll_output_pin_state_on_dpll_set(const struct dpll_pin *pin,
> +					   void *pin_priv,
> +					   const struct dpll_device *dpll,
> +					   void *dpll_priv,
> +					   enum dpll_pin_state state,
> +					   struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	mutex_lock(&sitdev->multiop_lock);
> +
> +	/*
> +	 * Skip a request for the current state. One CMOS pad forced and the
> +	 * other not is neither state.
> +	 */
> +	if (!sit9531x_output_state_refresh(sitdev, dpin->id) &&
> +	    sitdev->out[dpin->id].enabled == enable &&
> +	    !sitdev->out[dpin->id].part_muted) {
> +		mutex_unlock(&sitdev->multiop_lock);
> +		return 0;
> +	}

[Severity: Low]
This comment seems to disagree with the get side. The @part_muted
kernel-doc in core.h says such an output is "reported as driven", and
sit9531x_dpll_output_pin_state_on_dpll_get() reports it as CONNECTED.

The skip test requires !part_muted, so a CONNECTED request on a pin that
already reports CONNECTED always runs sit9531x_output_enable(). On an
output part-muted at probe, the hiz_keep pads stay forced, the readback is
part-muted and enabled again, and the reported state does not change.

Each such request still does a read-modify-write of every non-keep Hi-Z
MASK bit. That can clear profile-set mask bits the driver never changed,
such as the DIFF pair of a CMOS output.

The exclusion also lets a retry finish an unmute that failed partway when
hiz_keep is 0. Could the skip treat the hiz_keep-only case as already
satisfied for CONNECTED, or could the comment match the @part_muted
documentation?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
