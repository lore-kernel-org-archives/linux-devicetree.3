Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480851;
	b=vOYBfKGCgnPuy5VsLYJqk4kB8h/3MPNxkwl4r7NzfqTgv6FVNO4eeNEOH6UPJmF0xxER
	 SZUTOrc/D7t8K7wqN+GaSzGz6BNuoYWcv0IvJav/A1plPCbg/xqHgEzz9jiKC0G2RsI5w
	 LiOeoZxHYR4h5IIteLciz5H/OW6FpgyfFHswj9jHdXr+YZ7s5x4U4FW6+smFhPQWv9So2
	 EZ7/6zuBTEunmYkOSbFP18TWyhWdYeL+bX+wfN0efsrJCCH8VuG1qeklBV5/FNxSa4VgM
	 bWF0gU/JPER0Fwoql6prilC7FK7q2Dvt3cYxuxZ/xK5iGc1JKHsTcb/Jch4E+zofzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480851;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Yhc3pZ2t7HV873THc33t0f85CY4X5Kt+iC5hAmBxKKM=;
	b=JS/10DnIFYmw9KgQk+L9V8uC+MJYdQcEtQxkUL4ezGrQJzsqTQV4AQMz1ibY7qJ+DdsF
	 W82VWVzcWdIM88oxOT2urk6+s81PRPMI5NzR2tajhJZaRQ0qDo7utmOGHB9UsyPefLst0
	 Hb8XtLRFGx/N6pqlLjlzmO+Ji6dQ4iK/Ezb1ybkmqSA2dh5qhK/lWCEQTvu44nRj2/ZYw
	 MZpfUhwfzBbIEJnlIkP5OE/cGhCACigOqmmuCJxNEm5hp1ot3Mffzra/copC9XjsucETj
	 i+rUV6+n7HZ/9uN1QArRrbXIA/D5Vnyh4pcmFe7go4Y3YdyUFbzshC1bWpFnfwz9tSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVGRbwAw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69E606A6BC;
	Tue, 24 Nov 2026 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVGRbwAw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A107B1F000E6;
	Tue, 24 Nov 2026 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480851;
	bh=Yhc3pZ2t7HV873THc33t0f85CY4X5Kt+iC5hAmBxKKM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JVGRbwAwm8uGAD12Z3TWzPudOxIlPI/dBTvuO/XRr1sbLRt6+p9RlwcjqmKBDM7kU
	 7pYHaNu9XOMOBuT2PP3meUg0gq8eDp1rjmwhPfeOkusMhmIAN0Iu2a2465kgZ9dq2A
	 t2yV8Rz/Oa+QRguD56TeXwbym8ZgCLQLpaXI6rceRqvrVOYq0Ibublfz1rmxGo9OJm
	 PJOT5yepxkT/fO05Kobwp+qcgdzulq39fT6HyuqOFKEUPOrdWFE1JE1rhFoqZLGIiQ
	 Pin+ATZRh3NtgfFkig5DTp5sN8pcXViL3RcY6P0ViAxK9SfyGI5jwb63BUQtbHfkma
	 +QQRQjeL5jb5w==
Subject: Re: [PATCH net-next v16 09/13] dpll: sit9531x: add support to get and
 set frequency on pins
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:50 +0000
Message-ID: <179548085020.3135.4311909833990050378@kernel.org>
In-Reply-To: <20261119225752.41846-10-arouhi@sitime.com>
References: <20261119225752.41846-10-arouhi@sitime.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 5 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The output frequency getter reports Fvco/DIVO even when the
  driver itself says that Fvco is not the PLL's real rate.
- [Medium] The loops_open retry sends the loop-lock command with the Page
  3 debug key locked.
- [Medium] The reported output frequency can fall outside the frequency
  range the pin advertises.
- [Medium] In sit9531x_output_phase_flush(), the register-triggered phase
  flush is documented in regs.h as 'DIVO_PHASE_SEL_REG selects the…
- [Medium] dpll: sit9531x: unretried NVM update in sit9531x_prg_commit()
  on error
- [Low] The patch deletes the inline comments on struct sit9531x_dev's
  two mutexes ('/* Serializes multi-step register sequences */' above…

--

dpll: sit9531x: add support to get and set frequency on pins

This patch reports an input pin's frequency from the firmware description
and an output pin's frequency as Fvco / DIVO. It sets an output's
frequency by writing a new DIVO inside the programming state. The write
is followed by a loop lock, a settling delay and a per-PLL phase flush.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index bbc17a514c5ce..d3f6955b3bbd0 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -1139,6 +1239,504 @@ int sit9531x_input_prio_add(struct sit9531x_dev *sitdev, u8 pll_idx,
>  
>  #define SIT9531X_DIVO_MAX			GENMASK_ULL(33, 0)
>  

[ ... ]

> +	/*
> +	 * Outside the PLL's VCO band, Fref * DIVN is usually not the rate the
> +	 * PLL runs at, as for a PLL fed from another PLL.
> +	 */
> +	if (!sit9531x_fvco_in_band(pll_idx, *fvco) &&
> +	    !(sitdev->fvco_band_warned & BIT(pll_idx))) {
> +		sitdev->fvco_band_warned |= BIT(pll_idx);
> +		dev_warn(sitdev->dev,
> +			 "PLL%c: Fref * DIVN = %llu Hz is outside its VCO band\n",
> +			 'A' + pll_idx, *fvco);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
If Fref * DIVN is above the low-band minimum but outside this PLL's own
band, sit9531x_get_fvco() warns once and still returns 0. The comment
above says such a value is usually not the rate the PLL runs at.

For that PLL, sit9531x_output_freq_get() then reports and caches
div64_u64(fvco, divo). sit9531x_output_divo_calc() rejects the same
Fvco:

	if (!sit9531x_fvco_in_band(pll_idx, fvco)) {
		dev_dbg(sitdev->dev,
			"out%u: PLL%c Fvco %llu Hz is outside its VCO band, rate not settable\n",
			...
		return -EINVAL;
	}

So would a cascaded PLL report a nonzero DPLL_A_PIN_FREQUENCY that the
driver itself treats as wrong?

The commit message says "An output whose divider chain does not resolve
reports 0 Hz". Should sit9531x_output_freq_get() apply the same band
check and return -ENODATA?

The later patch "dpll: sit9531x: add support to adjust output phase"
adds the comment "Fref * DIVN outside the VCO band is not the rate the
PLL runs at" in sit9531x_output_phase_adjust_set(). Even so,
sit9531x_output_freq_get() still has no band check at the end of the
series.

[ ... ]

> +	orig = ctrl & ~SIT9531X_DIVO_PHASE_TRIG;
> +	ctrl = orig | SIT9531X_DIVO_PHASE_SEL_REG;
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, ctrl);
> +	if (rc)
> +		goto restore;
> +
> +	/*
> +	 * No delay between set and clear; one I2C transfer is longer than the
> +	 * minimum pulse width.
> +	 */
> +	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,
> +			       ctrl | SIT9531X_DIVO_PHASE_TRIG);
> +
> +restore:
> +	ret = sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, orig);
> +	if (ret && !rc)
> +		rc = ret;

[Severity: Medium]
regs.h describes the flush as "DIVO_PHASE_SEL_REG selects the register
trigger; pulsing DIVO_PHASE_TRIG high then low flushes".

Here, the final write of orig clears DIVO_PHASE_TRIG and restores
DIVO_PHASE_SEL_REG in the same transfer. Suppose the profile had the pin
trigger selected, so SEL_REG is clear in orig. Then the register
trigger's high-to-low transition happens at the same moment the mux
switches back to the external pin.

If the flush acts on the falling edge, can the flush be missed while
sit9531x_output_freq_set() still reports success? Would it help to write
ctrl (SEL_REG set, TRIG clear) before restoring orig?

The same ordering is still there at the end of the series in
sit9531x_phase_flush_undo(), which writes the original ctrl straight
after the TRIG-high write.

[ ... ]

> +	rc = sit9531x_get_fvco(sitdev, pll_idx, &fvco);
> +	if (!rc)
> +		rc = sit9531x_output_divo_read(sitdev, out_idx, &divo);
> +	if (rc) {
> +		if (rc == -ENODATA)
> +			sitdev->out[out_idx].freq = 0;
> +		return rc;
> +	}
> +
> +	*frequency = div64_u64(fvco, divo);
> +	sitdev->out[out_idx].freq = *frequency;

[Severity: Medium]
Suppose the UPDATE_NVM write fails here but one of the LOOP_LOCK
attempts that follow succeeds. sitdev->loops_open then ends up false,
and nothing records that the bank update was never issued. Neither the
retry in sit9531x_dev_chan_states_update() nor the one in
sit9531x_dev_stop() will run, since both key on loops_open.

sit9531x_output_freq_set() returns the error, but the five DIVO bytes
from sit9531x_output_divo_write() stay in the registers. The back flag
that sit9531x_output_divo_write() fills in is never checked.

On that error, sit9531x_dpll_output_pin_frequency_set() calls
sit9531x_output_freq_get(). That reads the new DIVO bytes back through
sit9531x_output_divo_read() and caches Fvco / DIVO in
sitdev->out[].freq. If the result differs from the old value, the
setter then sends __dpll_pin_change_ntf().

If the divider only takes effect once UPDATE_NVM is written, user space
gets an error together with a notification for a rate the part is not
running. The cached freq follows the uncommitted register contents
rather than the hardware.

Should a failed UPDATE_NVM be tracked as pending and retried by the
poll worker? Or should sit9531x_output_freq_set() restore the old DIVO
bytes before it closes the programming state?

At the end of the series the retry path is sit9531x_prg_relock(), which
does not repeat the bank update either.

[Severity: Medium]
Can this value fall outside the range the pin advertises? For an output
without supported-frequencies-hz, sit9531x_pin_props_get() advertises:

	ranges[j].min = 1;
	ranges[j].max = 1000000000ULL; /* 1 GHz */

Fvco is at least SIT9531X_FVCO_LOWBAND_MIN (4.9152 GHz). A profile with
DIVO of 4 or less therefore gives a reported frequency above 1 GHz. When
there is a DT list, the truncated Fvco / DIVO also need not match any
listed value.

dpll_pin_freq_set() in the core calls dpll_pin_is_freq_supported() before
its freq == old_freq shortcut. Writing back the value just read would
then fail with "frequency is not supported by the device". Is that
intended?

The 1 GHz cap is unchanged at the end of the series.

[ ... ]

> @@ -1845,6 +2443,10 @@ sit9531x_dev_chan_states_update(struct sit9531x_dev *sitdev)
>  	bool answered = false;
>  	int i, rc;
>  
> +	/* Retry pending writes first so the reads below see their result */
> +	if (sitdev->loops_open)
> +		sit9531x_prg_commit(sitdev);
> +
>  	sit9531x_input_off_retry(sitdev);

[Severity: Medium]
Does this retry run with the Page 3 debug key locked?

When every LOOP_LOCK attempt fails, sit9531x_prg_commit() sets
loops_open but still relocks the key at the end:

	sitdev->loops_open = !!rc2;

	msleep(100);
	...
	rc3 = sit9531x_write_close(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
				   SIT9531X_DEBUG_LOCK_VAL);

This retry calls sit9531x_prg_commit() directly, and so does the one in
sit9531x_dev_stop(). Neither does the unlock that sit9531x_prg_enter()
performs before every other PRG_DIR_GEN write:

	rc = sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,
			       SIT9531X_DEBUG_UNLOCK_VAL);

If PRG_DIR_GEN commands only take effect while the key is unlocked, the
LOOP_LOCK write would be ACKed but have no effect, and loops_open would
be cleared anyway. sit9531x_dev_stop() would then skip its "output loops
left unlocked at removal" warning, and later readers of loops_open would
treat the loops as closed.

This retry also sends UPDATE_NVM again, outside the PRG_CMD sequence.

The later patch "dpll: sit9531x: implement output pin state on a DPLL"
changes the retry to sit9531x_prg_relock(), which drops the UPDATE_NVM.
It still writes LOOP_LOCK without opening the debug window, though.

[ ... ]

> diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h
> index 57ba682b07a93..669f9f9b960c3 100644
> --- a/drivers/dpll/sit9531x/core.h
> +++ b/drivers/dpll/sit9531x/core.h

[ ... ]

>  struct sit9531x_dev {
>  	struct device			*dev;
>  	struct i2c_client		*client;
>  	struct regmap			*regmap;
>  	const struct sit9531x_chip_info	*info;
> -	/* Serializes multi-step register sequences */
>  	struct mutex			multiop_lock;
> -	/* Serializes a page select and the transfer it is for */
>  	struct mutex			page_lock;

[Severity: Low]
This isn't a bug, but removing these two comments looks unrelated to
frequency get/set, and the commit message doesn't mention it.

The block comment above the struct is not kernel-doc, so checkpatch
--strict will report "struct mutex definition without comment" for both
locks. The comments are still missing at the end of the series.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
