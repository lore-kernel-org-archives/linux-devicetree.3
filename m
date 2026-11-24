Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480855;
	b=Sv1OFaPV8PysJDFZ9DypmY9f7ckpWeo6kbVkYpZ/CBuNXcJLM3zWrX5N1J6YE2FI7JXS
	 hFX/l0Z6wAkHZJkKXtwX7OxiW1J4cIV8b5jDEGpOLXtZ9VyoylBz6XXkSIU/Ah1FPj8wQ
	 qKr7TplHQONIdZPWNutMAjswRfaCn8+8nZ/0bQ3qvgCc2I7MKGugKr5uh2fVRqJQMEYrD
	 7o2RtOQg8uGItQqnqiQcUTy281Pj4smqLkWjYWE4fHQhCzDjkGGIGVCKULT1xFq3/eRQ4
	 7e0zxXQk5hVmU19twraH+idhs6oX1nX6Fx8OZMQDExgj55L/Gq0c63lT3a7xR1hL9rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480855;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Zsurr0ZpZlgGnVVv3AAABEZKR1DCTB8SdUlRsUevkb8=;
	b=ib4am5D/WS7LxFjLQ4Hpnu/SHK3NiSyT35muDg8eeVPAQrd/d/54TZy+5CfxTRGQJPGk
	 O7E24nFbTcDSUopBQjpd+VcVzp3sqnJ+HotAB1EzCt3+sS+WNLuH2T6GNy/O6KueEkdbU
	 G1uDIOb9sDqfFVMZego0V1i+xcib/5MWldjGi/kwm0gpByOAIHWW8LlKESAv/QdzUt+La
	 /WwJtLiplkByqMm5EaBdp6s7OCEqP8oGq6m92b3Z1ms8TS6CRSmlkDFzA4g+p/N96/Xq+
	 7yL4+C+lb+yIDcMqR8lob8Ya/q5XgblHWWsLKoKajY1Mdsu86b81+a+QnPxqHWAqUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqKnDUWz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CC0606A32A;
	Tue, 24 Nov 2026 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jqKnDUWz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCE91F000E6;
	Tue, 24 Nov 2026 00:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480855;
	bh=Zsurr0ZpZlgGnVVv3AAABEZKR1DCTB8SdUlRsUevkb8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jqKnDUWz5KVsMxN66vWZ+pITXdTtOD50GM31Bv0qAkzO+/MzfaZc2xEptNmNPvb14
	 6sXqdF2jHQgSqEIAXz1BGWMfc3V/7eZkx8lC4h79MJzGcyUFcWQxojlLpUSzA56udq
	 9nayzBw3O+y8es15bjdtlgdjpYeaWkfT89R8yPiTV1YQmm0K/tKcD9s+bnMdDcHiRD
	 mlp70RDH22a83cd/tV1gTU3Nmg7DZtQORmDEiXZr+85c8rVd0hbeCmnqNv6Eg0LtDK
	 HZqMP/vc26D/hMIdS1oDlH8vClKaBoOsMqujpNuuZcsKW7PzFV3mbEOTLadSPFybmm
	 m697RGn8zv05g==
Subject: Re: [PATCH net-next v16 12/13] dpll: sit9531x: add support to get
 phase offset on the connected input
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:54 +0000
Message-ID: <179548085403.3135.8775847073019311030@kernel.org>
In-Reply-To: <20261119225752.41846-13-arouhi@sitime.com>
References: <20261119225752.41846-13-arouhi@sitime.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] sit9531x_phase_offset_read() (drivers/dpll/sit9531x/core.c)
  turns the TDC code into picoseconds by dividing by the Fvco that…
- [Low] The commit message says "The offset is sampled when asked for,
  not by the poll: a sample is several dozen transfers per PLL." That is…
- [Low] The patch adds `sitdev->chan[pll_idx].key_pending = !!lock_rc;`
  to the existing helper sit9531x_chan_routed_ref_read()…

--

dpll: sit9531x: add support to get phase offset on the connected input

This adds a phase_offset_get callback to the sit9531x input pins. It reads
the PLL's on-chip TDC through the debug window and converts the code to
picoseconds using the PLL's Fvco. The debug taps are saved and restored
around each sample, and a failed restore or relock is retried by the
poll, at removal and on the probe failure path.

> The offset is sampled when asked for, not by the poll: a sample is
> several dozen transfers per PLL.

[Severity: Low]
Is this accurate for notifications?

The poll worker calls sit9531x_dpll_changes_check(). That function calls
dpll_pin_change_ntf() for every selection pin whose state, operstate or
prio changed. The core then builds the full pin message for that
notification:

sit9531x_dpll_changes_check()
  dpll_pin_change_ntf()
    dpll_pin_event_send()
      dpll_cmd_pin_get_one()
        dpll_msg_add_phase_offset()
          sit9531x_dpll_input_pin_phase_offset_get()

So when the poll notifies the active input of a PLL (for example, the new
reference after a switch), the poll worker does two input monitor
fetches, two routed reference reads and a full TDC sample. A failure there
can also set tap_pending or key_pending from the poll.

This only happens on change notifications, not on every poll tick. The
callback also maps errors to -ENODATA, so the notification still goes
out. Could the commit message be reworded to say this?

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index fd8f0df9116d6..5ec9d2a48fcbf 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -2594,6 +2620,176 @@ static int sit9531x_clear_notifications(struct sit9531x_dev *sitdev)
>  	return 0;
>  }
>  
> +/**
> + * sit9531x_phase_offset_read - read phase difference via TDC

[ ... ]

> +int sit9531x_phase_offset_read(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			       s64 *phase_offset)
> +{

[ ... ]

> +	/*
> +	 * Read Fvco first; without it there is no reason to open the debug
> +	 * window.
> +	 */
> +	rc = sit9531x_get_fvco(sitdev, pll_idx, &fvco);
> +	if (rc) {
> +		if (rc == -ENODATA)
> +			dev_dbg(sitdev->dev,
> +				"PLL%c: Fvco unknown, skip TDC\n",
> +				'A' + pll_idx);
> +		return rc;
> +	}

[Severity: Medium]
Is an out-of-band Fvco safe to use here?

sit9531x_get_fvco() returns 0 even when Fref * DIVN falls outside the
PLL's VCO band. It only warns once:

drivers/dpll/sit9531x/core.c:sit9531x_get_fvco() {
    ...
	/*
	 * Outside the PLL's VCO band, Fref * DIVN is usually not the rate the
	 * PLL runs at, as for a PLL fed from another PLL.
	 */
	if (!sit9531x_fvco_in_band(pll_idx, *fvco) &&
	    !(sitdev->fvco_band_warned & BIT(pll_idx))) {
    ...
	return 0;
}

This value has two other users, sit9531x_output_divo_calc() and
sit9531x_output_phase_adjust_set(). Both return -EINVAL when
sit9531x_fvco_in_band() fails ("rate not settable" and "delay not
settable").

This function only checks rc, and then divides the TDC code by that Fvco:

	mag = mul_u64_u64_div_u64(tdc_signed < 0 ? -tdc_signed : tdc_signed,
				  1000000000000ULL * DPLL_PHASE_OFFSET_DIVIDER,
				  fvco);

The "one code is 203.45 ps at 4.9152 GHz" comment suggests one TDC code is
one period of the real VCO. If so, wouldn't the reported phase offset be
off by the ratio of the computed VCO rate to the real one?
sit9531x_dpll_input_pin_phase_offset_get() would then return 0, and user
space would receive the wrong value as a valid attribute.

Should this return -ENODATA when sit9531x_fvco_in_band() fails, so the
attribute is left out?

[ ... ]

> @@ -2768,6 +2972,7 @@ static int sit9531x_chan_routed_ref_read(struct sit9531x_dev *sitdev,
>  	lock_rc = sit9531x_write_pll_close(sitdev, pll_idx,
>  					   SIT9531X_PLL_REG_DEBUG,
>  					   SIT9531X_PLL_DEBUG_LOCK);
> +	sitdev->chan[pll_idx].key_pending = !!lock_rc;
>  
>  	return rc ? rc : lock_rc;
>  }

[Severity: Low]
This line also changes the existing poll path.
sit9531x_chan_routed_ref_read() runs from sit9531x_chan_state_fetch() on
every poll and at probe, so a failed relock there now sets key_pending.

The next poll's sit9531x_tap_back_retry() then retries it. At removal,
sit9531x_tap_pending_retry() warns "left with its debug taps moved or
window open". Before this patch, that relock failure was never retried.

The retry itself looks reasonable, but the documentation only describes
the phase-offset path. The kernel-doc in core.h says:

 * @key_pending: debug key not locked again after a phase-offset read or tap
 *   retry

The comment above sit9531x_tap_back_retry() says "after a failed
phase-offset read", and the commit message only mentions the taps moved
for a sample.

Could the kernel-doc, the sit9531x_tap_back_retry() comment and the
commit message also mention the routed reference read?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
