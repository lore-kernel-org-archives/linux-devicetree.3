Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480846;
	b=EaABwhZk+1T/0ppLfmOfViKsX7ywEcblPbD7rseM5fTjHhrPFzX6bGI+sWgC0Qg1BQ1E
	 U28zntZw37y/GaZjD2vxY56RJnbA/m+Mm/oa43UVCcw708fMK49u+h6Aeq8hC10qQTqWI
	 D33UXgtGcg471fw8OgWewatyNd4CRIQ+U7RpcKc/unpc5KfJ90c7hVLKtgUwLQLeHMkJv
	 hH2aWrYXpPEiei1gmO+mlI2Yp2i1ChSA7xllodzcslIZ79wQWEudwIFjRL9mMqfcL2Owq
	 JPz72j0Ixrc0a8SFSHlGi47zOwvx6bnXtDNrCMnEOw8T6mMfnpxDZsPkT7EuHimIObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480846;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UxAk27qf1Gk099IyvH+3L6Kvw/r6p4DEhslmzFrzte4=;
	b=4KMdHvpN15yCjssO6ECUPbYMAuHChIyEPsLSkTDVmsrjwqJ1cx3mgx7cb3Mz5JDvDl4Q
	 5YnoPpU26cibxQoiPdx7PajOI2rcgYJMeWE9oxM9jkUDqTBLjseF5uR4o9ktTuJeJinps
	 21AlUcFEByLgbrFiwv/at9CB1SDuhipizUpayHxrtNMx8rfcgC/30aRuydr5tVOXr7fEj
	 vBMIR1Ly6bUyDZL/SfW0tet4NotCt+Qe+MYuI8GOxwdGfJTro8c8Z2nOs2GjbYm9N4QQ3
	 usCleVyJ6tOgULLGG9Xs3M2TPgzVfpJHth4QGyURg6ZwwKgjXmEtgbAVraH+cWixFPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hU1D/SzD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210DA606A32E;
	Tue, 24 Nov 2026 00:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hU1D/SzD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1091F00ACF;
	Tue, 24 Nov 2026 00:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480845;
	bh=UxAk27qf1Gk099IyvH+3L6Kvw/r6p4DEhslmzFrzte4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hU1D/SzDAAjBXQ1ejMWyimHzRjJkiS/D2c8/FsftP9IAFDMpFTGWzj9ilAM0KsmxM
	 jezG7EgQWVG4ZZ7i8L7MxnwYgbsGfCIi6nXeIBUCXNZBV1KUldDu/LXfKapZwCkSBt
	 +oiA4OJIAqR6ta6SYAB1a+nQKuBZlCPFkdskN3m4f+8nivAHBnO1eOyaul+l+lJ7/V
	 7Qyy4eWTDz0jL99H4Sm1TCrVwkFfXJPhF9Tj2IkQzQ9h8+wnDF+bygjIOUypy2ziLB
	 QUXuF3NUoqO3JDHt/+wZB0PXvAcUYNiyf230GGh+H6CWq8ME3rC4DrAL4EPf+ReMT+
	 yecAxJzw9G1TQ==
Subject: Re: [PATCH net-next v16 08/13] dpll: sit9531x: add support to get and
 set priority on input pins
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:44 +0000
Message-ID: <179548084402.3135.10043442329542996745@kernel.org>
In-Reply-To: <20261119225752.41846-9-arouhi@sitime.com>
References: <20261119225752.41846-9-arouhi@sitime.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The OCXO is ordered in the priority table, but its priority
  cannot be seen or changed, and it lives on a different scale from user…
- [Medium] sit9531x_prio_table_commit() now passes `routed =
  sit9531x_input_hw_src(chan->routed_ref)` to…
- [Low] prop.c now advertises DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE
  on every reference input pin and on the INTSYNC destination pin,…

--

dpll: sit9531x: add support to get and set priority on input pins

This patch adds prio_get and prio_set callbacks for sit9531x input pins.
Each input keeps a priority from 0 to 255 per PLL, and a set rebuilds the
hardware priority table from those values. When the best live source does
not change, a table commit now latches the routed source as the active
selection. The poll also compares each pin's state, operstate and priority
with a baseline taken at registration and sends a notification when one
changes.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index d61c2a8e24f39..bbc17a514c5ce 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -745,6 +773,12 @@ static u8 sit9531x_prio_activesel_pick(struct sit9531x_dev *sitdev,
>  	    top != sit9531x_prio_top_live(sitdev, old))
>  		return top;
>  
> +	if (sit9531x_prio_src_usable(routed) &&
> +	    sit9531x_prio_src_live(sitdev, routed))
> +		for (i = 0; i < SIT9531X_PRIO_MAX_SLOTS; i++)
> +			if (srcs[i] == routed)
> +				return routed;
> +
>  	cur = sit9531x_prio_src_canon(sitdev, cur & SIT9531X_PRIO_NIBBLE_MASK);
>  
>  	if (sit9531x_prio_src_usable(cur) &&
> @@ -827,12 +861,19 @@ static int sit9531x_prio_table_commit(struct sit9531x_dev *sitdev, u8 pll_idx,
>  
>  	if (!empty) {
>  		u8 sel = sit9531x_prio_slot_get(val, slot + 1);
> +		u8 routed = SIT9531X_PRIO_SRC_NONE;
>  
> +		/*
> +		 * The pick needs the signal state now, not as of the last poll;
> +		 * the routed source is the last poll's sample.
> +		 */
>  		rc = sit9531x_input_mon_fetch(sitdev);
>  		if (rc)
>  			goto rollback;
> +		if (!chan->stale && chan->routed_ref != SIT9531X_REF_INVALID)
> +			routed = sit9531x_input_hw_src(chan->routed_ref);

[Severity: Medium]
Is chan->routed_ref recent enough to latch here? It is only set in
sit9531x_chan_state_fetch(), once per poll or after an earlier commit, and
the comment above says it is the last poll's sample. Before the pick,
sit9531x_input_mon_fetch() refreshes only the LOS monitors.

Take this sequence within one poll period:

poll: chan->routed_ref = B
B has a brief LOS, the device falls back to C (and does not revert)
B recovers before the next poll
prio_set or state_set on an unrelated input
  sit9531x_prio_table_commit()
    sit9531x_prio_top_live() is unchanged
    sit9531x_prio_activesel_pick() returns routed (B): live and listed

Would the commit then write B into CLK_ACTIVESEL and move the PLL off C,
the reference it is actually tracking? That looks like the acquisition
restart the commit message says this change avoids:

  "A commit that leaves the best live source unchanged keeps the routed
  source as the active selection, so the PLL does not restart
  acquisition for it."

Could the routed source be sampled with sit9531x_chan_routed_ref_read()
before HO_FORCE is written, and that value latched instead?
sit9531x_chan_state_fetch() only reads it while the PLL is tracking and not
frozen, so the cached copy can't be refreshed through that path here.

>  		sel = sit9531x_prio_activesel_pick(sitdev, chan->prio_srcs,
> -						   srcs, sel);
> +						   srcs, sel, routed);
>  		val = sit9531x_prio_slot_set(val, slot + 1, sel);
>  	}
>  

[ ... ]

> +int sit9531x_input_prio_set(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			    u8 input_idx, u8 prio)
> +{

[ ... ]

> +	chan = &sitdev->chan[pll_idx];
> +	old_prio = chan->cfg_prio[input_idx];
> +	old_known = chan->cfg_known;
> +	chan->cfg_prio[input_idx] = prio;
> +	chan->cfg_known |= BIT(input_idx);

[Severity: Medium]
How does a user priority compare with the OCXO's place in the table?

sit9531x_prio_cfg_seed() sets the OCXO's configured priority from its slot
index in the profile table:

drivers/dpll/sit9531x/core.c:sit9531x_prio_cfg_seed() {
    ...
		chan->cfg_prio[src] = slot;
		chan->cfg_known |= BIT(src);
    ...
}

That value is in 0..10, but this function accepts 0..255 for the other
inputs. sit9531x_prio_table_build() then sorts every member by cfg_prio,
the OCXO included:

sit9531x_dpll_input_pin_prio_set()
  sit9531x_input_prio_set()
    sit9531x_prio_table_apply()
      sit9531x_prio_table_build()

Suppose a profile, or an external table rewrite that the poll accepts as
configuration, lists the OCXO at slot k. Any input given a priority above k
(20, 50 or 100, all normal-looking DPLL priorities) is then sorted behind
the OCXO.

sit9531x_prio_src_live() always treats the OCXO as live:

	if (index >= sitdev->info->num_inputs)
		return true;

The device also falls back down the table without reverting. Can that
input ever be selected while the OCXO is listed?

Userspace also has no way to see or change the OCXO's priority, or to drop
it from the table:

static const struct dpll_pin_ops sit9531x_dpll_xo_pin_ops = {
	.direction_get		= sit9531x_dpll_input_pin_direction_get,
	.state_on_dpll_get	= sit9531x_dpll_xo_pin_state_on_dpll_get,
};

The xo branch in sit9531x_pin_props_get() also leaves capabilities at 0.
On this point the commit message only says "The range is 0 to 255 over
eleven slots".

Should the OCXO's priority be exposed, or should user priorities be mapped
relative to its position?

[ ... ]

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> index b9405eba49a39..69877fc940284 100644
> --- a/drivers/dpll/sit9531x/prop.c
> +++ b/drivers/dpll/sit9531x/prop.c
> @@ -146,6 +146,7 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
>  		/* INTSYNC destination: a reference the PLL can lock to. */
>  		props->dpll_props.type = DPLL_PIN_TYPE_INT_OSCILLATOR;
>  		props->dpll_props.capabilities =
> +			DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE |
>  			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
>  		curr_freq = 0;
>  	} else if (sync_out) {
> @@ -161,6 +162,7 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
>  	} else if (dir == DPLL_PIN_DIRECTION_INPUT) {
>  		props->dpll_props.type = DPLL_PIN_TYPE_EXT;
>  		props->dpll_props.capabilities =
> +			DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE |
>  			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
>  		curr_freq = sitdev->ref[index].freq;
>  	} else {

[Severity: Low]
Is PRIORITY_CAN_CHANGE accurate when every PLL uses manual input select?

For a manual PLL, sit9531x_dpll_pin_ops_get() returns
sit9531x_dpll_input_pin_manual_ops, which has neither prio_get nor
prio_set:

	if (sit9531x_chan_state_get(sitdev, pin->dpll->id)->manual_input)
		return &sit9531x_dpll_input_pin_manual_ops;

All four PLLs share one dpll_pin per index, and capabilities are per pin.
So with mixed modes the bit has to be advertised, and the DPLL core's
per-ref ops checks handle the manual PLLs.

The driver reads manual_input at probe, before any pin is registered, so
it knows when all four PLLs are manual. In that case the reference pins
and the INTSYNC destination pin still advertise PRIORITY_CAN_CHANGE. They
report no priority, and every set fails in dpll_pin_prio_set() with a bare
-EOPNOTSUPP and no extack message.

Could the bit be left off when no PLL can take a priority?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
