Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428814;
	b=L4ivhaDkkAsrV8e1hl8lAhAlnrW4igMRFPg848kn3ob/qeTey6/Q+sSyQoLHULrhUHnd
	 gvr8+SaCyVjF4SrknX4A7xZJe77rT5SZ8jW47RlLNFTaijbwTQU65mvAAC7Z14qfNEGdQ
	 nnpcf0d/bomrWR23efw0g5FCkp90AWekMJH2UuwZew7HzRnOIapA2uKKf9I3ArmcaRk8W
	 rolUnbuZtZAekTkMDMD78fGlD3NzIyI8a/1VS6NH0RNICk6AcNss4LC3YtHf1QpmhxpFJ
	 vWivXXLXHLjDC3q7YBBtcetgvhMDFMeFaSQriRXnItvcvaoy2k4P90R7iZ/U6C4fQ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428814;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zXmhRuu3qU/nrFZpfy5nApewlG772sWeF42bB2VzjmU=;
	b=b09Gu/6xd/+mT9x33kfTKUSnVDCjjnJ1oBIxPfFQtl0tZTgA1N83/u6RNHSokwUz8xXs
	 1VIpEzBGURbM1eVSNnZlBLBFZjPld2SFSvFDa4lVE0YFL6ITASRKrtH2M7pA0sY7JNwCj
	 EBBOGfXqgTtgh2OgBEhvk8pRIDmIwdw+ihKYHEJclRFFQJbVB3B+CB9dMAYeN6VYxNrNS
	 n14g8XK5UAgKWWiapdgARWC8o+bF3gG/Cq0YVsZoH9gPzYGBrXav3nlVpVm1TLMZ4yjyH
	 37rTKWcoXLM5J0P6t/wDwe2Dd0V5xMik9/LDRP0YMNlOVGrdi1bP9VSdF+OxqsrBxpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AdXY9IUc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB334606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AdXY9IUc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2DA1F00A05;
	Wed, 11 Nov 2026 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428814;
	bh=zXmhRuu3qU/nrFZpfy5nApewlG772sWeF42bB2VzjmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AdXY9IUca6E6WDBnbDNR3hv7d+u145WBRzwax6dNwD0E918P7sVymQK1b5MtU6eL+
	 tbDsJNGV4u5rMFXQO/cfVPWdWot5lOQ1Dg5mdcpzet5T3Zs7HqtJwRmaQ5GuwmRENh
	 7he2hJnB0letyFkk5LUUCxU7OVBGwk+X02jqiVUsBoqJ1l6Kgq8L+XIB9/1W6FUI0s
	 OAUVcyJJcK71RuyeZRBsb13Fe9+OUq9hI4arECp1QBR1Pw4FH1dMtAGmRoXi57eHWr
	 28vqazW+UORx1tX7ZOrPWhNXwIjbJTI0KRG7fuC0A2y2I2J7/PbnxYc0F9kScyMUXt
	 rQ4xxywMYouKA==
Message-ID: <sashiko-outbox-209658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 07/13] dpll: sit9531x: implement input pin
 state on a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110202607.55744-8-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-8-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:26:53 +0000
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
- [Medium] dpll: sit9531x: sit9531x_prio_activesel_pick() latches
  lower-priority source
- [Medium] dpll: sit9531x: stale live_top after table commit causes
  spurious reselect
- [Medium] dpll: sit9531x: sit9531x_reselect() leaves PLL stuck in
  holdover
- [Medium] dpll: sit9531x: manual PLL priority table entries prevent
  disabling inputs
--

commit ace42e1765151d695e38e18abcdcf755dae0588e
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement input pin state on a DPLL

This commit implements getting and setting DPLL input pin state and
operational state by managing the per-PLL priority tables, input receiver
enables, and reference re-selection from holdover.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 209671e7917e2..af6d7918958dc 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -381,20 +486,460 @@ static u8 sit9531x_prio_slot_get(u8 val, u8 slot)

[ ... ]

> +/*
> + * Pick the active selection to latch; after a latch the PLL uses that s=
ource
> + * until it loses signal.
> + */
> +static u8 sit9531x_prio_activesel_pick(struct sit9531x_dev *sitdev,
> +				       const u8 *old, const u8 *srcs, u8 cur)
> +{
> +	u8 top, i;
> +
> +	top =3D sit9531x_prio_top_live(sitdev, srcs);
> +	if (top !=3D SIT9531X_PRIO_SRC_NONE &&
> +	    top !=3D sit9531x_prio_top_live(sitdev, old))
> +		return top;
> +
> +	cur =3D sit9531x_prio_src_canon(sitdev, cur & SIT9531X_PRIO_NIBBLE_MASK=
);
> +
> +	if (sit9531x_prio_src_usable(cur) &&
> +	    sit9531x_prio_src_live(sitdev, cur))
> +		for (i =3D 0; i < SIT9531X_PRIO_MAX_SLOTS; i++)
> +			if (srcs[i] =3D=3D cur)
> +				return cur;
> +
> +	if (top !=3D SIT9531X_PRIO_SRC_NONE)
> +		return top;
> +
> +	for (i =3D 0; i < SIT9531X_PRIO_MAX_SLOTS; i++)
> +		if (sit9531x_prio_src_usable(srcs[i]))
> +			return srcs[i];
> +
> +	return srcs[0];
> +}

[Severity: Medium]
Can sit9531x_prio_activesel_pick() re-latch a lower-priority source instead
of top when called from sit9531x_reselect()?

sit9531x_reselect() calls sit9531x_prio_table_commit(sitdev, pll_idx,
chan->prio_srcs), which passes old =3D=3D chan->prio_srcs and srcs =3D=3D
chan->prio_srcs.  Because old and srcs are the same array (and
sit9531x_prio_top_live() evaluates both against the freshly fetched
sitdev->ref[].los state), top !=3D sit9531x_prio_top_live(sitdev, old) is
always false.

If the previous CLK_ACTIVESEL_PLL nibble (cur) names a lower-priority entry
in srcs[] whose loss-of-signal bit is clear (such as OCXO, or a second sour=
ce
that recovered in the same poll interval) while the PLL is not tracking it,
sit9531x_prio_activesel_pick() returns cur instead of top.  sit9531x_resele=
ct()
then sets chan->live_top =3D top, leaving the PLL locked to the lower-prior=
ity
source without re-selecting top on later polls.

In addition, cur is canonicalized with sit9531x_prio_src_canon(), whereas
chan->prio_srcs[] holds uncanonicalized nibbles when read from hardware in
sit9531x_prio_mask_build(), so srcs[i] =3D=3D cur and the fallback return s=
rcs[i]
do not canonicalize differential N-lane codes.

[ ... ]

> +	if (!rc) {
> +		sit9531x_prio_mask_build(sitdev, pll_idx, srcs);
> +		memcpy(chan->seen_srcs, srcs, sizeof(chan->seen_srcs));
> +		chan->seen_valid =3D true;
> +		chan->table_pending =3D false;
> +	} else if (pending || pending_before) {

[Severity: Medium]
Does committing a new priority table leave chan->live_top stale?

When a user adds or removes an input pin or changes priorities via
sit9531x_prio_table_apply() -> sit9531x_prio_table_commit(), chan->live_top
is not updated to match the newly latched table.  If the next poll tick runs
while the PLL is still acquiring lock (chan->locked is false),
sit9531x_reselect() sees top !=3D chan->live_top and calls
sit9531x_prio_table_commit() a second time, forcing the PLL back into
holdover and restarting lock acquisition.

[ ... ]

> @@ -851,34 +1615,211 @@ static int sit9531x_dev_state_fetch(struct sit953=
1x_dev *sitdev)

[ ... ]

> +/*
> + * Rebuild pll_mask from the cached priority tables and the manual-select
> + * inputs. Caller must hold sitdev->multiop_lock.
> + */
> +static void sit9531x_ref_pll_mask_rebuild(struct sit9531x_dev *sitdev)
> +{
> +	u8 pll_idx, src, index;
> +
> +	for (index =3D 0; index < sitdev->info->num_inputs; index++)
> +		sitdev->ref[index].pll_mask =3D 0;
> +
> +	for (pll_idx =3D 0; pll_idx < SIT9531X_NUM_PLLS; pll_idx++) {
> +		u16 mask =3D sitdev->chan[pll_idx].prio_mask;
> +
> +		for (src =3D 0; src < SIT9531X_PRIO_NUM_SRC; src++) {
> +			if (!(mask & BIT(src)))
> +				continue;
> +
> +			index =3D sit9531x_hw_src_input(src);
> +			if (index < sitdev->info->num_inputs)
> +				sitdev->ref[index].pll_mask |=3D BIT(pll_idx);
> +		}
> +	}
> +
> +	sit9531x_manual_claims_add(sitdev);
> +}

[Severity: Medium]
Should sit9531x_ref_pll_mask_rebuild() and sit9531x_ref_pll_mask_fetch() sk=
ip
PLLs with chan->manual_input set?

A manual-select PLL ignores its priority table and registers
sit9531x_dpll_input_pin_manual_ops without state_on_dpll_set, while
sit9531x_manual_claims_add() claims chan->manual_ref.  Because
sit9531x_ref_pll_mask_rebuild() (and sit9531x_ref_pll_mask_fetch(), which
also runs before sit9531x_chan_select_fetch() in sit9531x_dev_state_fetch())
folds chan[pll_idx].prio_mask into ref->pll_mask for manual PLLs too, any
input left in a manual PLL's unused priority table keeps BIT(pll_idx) set in
ref->pll_mask and cannot be disabled by sit9531x_input_disable() when
disconnected from all automatic PLLs.

[ ... ]

> +/*
> + * Rewrite the priority table when a listed source returns to a PLL with=
out a
> + * reference; the latch restarts acquisition. Caller must hold
> + * sitdev->multiop_lock.
> + */
> +static void sit9531x_reselect(struct sit9531x_dev *sitdev, u8 pll_idx)
> +{
> +	struct sit9531x_chan *chan =3D &sitdev->chan[pll_idx];
> +	u8 top;
> +	int rc;
> +
> +	/* A PLL on manual input select uses no priority table */
> +	if (chan->manual_input || !chan->prio_mask || chan->mode ||
> +	    chan->ho_release_pending || chan->table_pending)
> +		return;
> +
> +	top =3D sit9531x_prio_top_live(sitdev, chan->prio_srcs);
> +	if (chan->reselect_armed) {
> +		if (top =3D=3D SIT9531X_PRIO_SRC_NONE || !chan->ho_freeze) {
> +			chan->reselect_armed =3D false;
> +			chan->live_top =3D top;
> +			return;
> +		}
> +	} else {
> +		if (top =3D=3D chan->live_top)
> +			return;
> +		/*
> +		 * Tracking is locked and not frozen; the two bits are read
> +		 * independently.
> +		 */
> +		if (top =3D=3D SIT9531X_PRIO_SRC_NONE ||
> +		    (chan->locked && !chan->ho_freeze)) {
> +			chan->live_top =3D top;
> +			return;
> +		}
> +	}
> +
> +	rc =3D sit9531x_prio_table_commit(sitdev, pll_idx, chan->prio_srcs);

[Severity: Medium]
Can returning early on top =3D=3D chan->live_top leave the PLL stuck in hol=
dover
when a listed source is live?

If the PLL is locked to a fallback source IN1 when a higher-priority source
IN0 regains signal, sit9531x_reselect() sees chan->locked && !chan->ho_free=
ze,
records chan->live_top =3D IN0, and returns without re-latching.  If IN1 la=
ter
loses signal and the PLL enters holdover while IN0 is still live, subsequent
polls see top =3D=3D chan->live_top (both IN0) and return before committing=
 the
table, leaving the PLL in holdover indefinitely.  The same happens if the
active top source briefly drops signal (setting chan->ho_freeze) and recove=
rs
between two polls so that top matches chan->live_top when polled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110202607.5574=
4-1-arouhi@sitime.com?part=3D7
