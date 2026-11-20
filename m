Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215510;
	b=xLLrL1OdxV+yslxXRhDMj+jFpQnOASZuve3rJ4Uvp4fYkKNavwizBAiyQtvK7LlesSPY
	 82egpj2AIopB/NW8viDwPk8WI8t385NIoxEnT3J+k47HlWUhXr1GQdTRPJDZ/fXuqOxpT
	 3CbVREmSy5ZtvXilXFtAT6eqbYAsNH0tMmGq7IsevTMcu0svUqct0cBiK+6mXmHb5rQpG
	 bz+R6hOmyjoB2S2gklkpogOAVB0F8AMkHEWq4Obl+JqY8gf3nF+2gXMk2xLujOcaXjqZs
	 uiF6ZtSbD7pBk5iMXcm5d9+hBmGYAlfX7deVk57LL100M+mvIfN0meDXOOggrCFfu7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215510;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0pCD6xOr7m8eAp4C1rSDwepPRHJIF0mFO+pTI9X59nw=;
	b=2N3Beo24twqvhUJMMIFA654F+vRmqtZLPZvSH8XVkdtVl+K6MazKuoJTfd99S0ibyb3Q
	 v4tHA7BHP0fIA5XwKllfnOedkJEUY2KczDbyqKRNsneFxLPTYpDErNxWyienDQWVmV95/
	 pPzDM8N0uJSjq30a7k+hA8g+LLNP4HvVpzwD/RHLtIqMOAycJVd0nPv2lWdx7zg8Ef/gr
	 khV8l/cW9fk1O+Ai+tOaTQmNF5OC5tZPX1R05lv1ePULgFHxVeSL3XxW7RqRTG1RwkKjG
	 nt1d9i7M17EQrG+CSmcUKhOWi8HKAOMDHzy3MstDG/LZmWyaGPOTId91chcVctgUb8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dY/QpsCi";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6900606A6A5
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 22:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dY/QpsCi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A861F000C6;
	Fri, 20 Nov 2026 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215510;
	bh=0pCD6xOr7m8eAp4C1rSDwepPRHJIF0mFO+pTI9X59nw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dY/QpsCibGXdvXD23/x4UNxnph2D7eyD07YSNChkkBlK2DxxtbJk+laUcXnWHuacO
	 rU2wUkYYC0o2/kOz8VHWibiWzuu4VhiE79Vw4jzGYG8MGL4Tf08oc5Pz7olMi/bAFy
	 eH5DgZCfOFhqcIqPMHz+gBoj7RgiqnBB1P9FcrvtTQAHqdY9HLvNA+dhMRgRGkNg1X
	 ePtx94lF4kW+VE3vkE93BQ+92pLBORE4oSMTyslqCw9rC2KxJurZdlPNv5iyz3z1Qr
	 jsBmJrFVXJeUEiyTLZPT4I62pxdAFrQyb+OxhSWnnoUch6/XO6+Hp469FPdJzsLfEA
	 jqB3MXB9d8o3g==
Message-ID: <sashiko-outbox-226323@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 07/13] dpll: sit9531x: implement input pin
 state on a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119225752.41846-8-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
 <20261119225752.41846-8-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:58:30 +0000
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
- [Medium] dpll: sit9531x: sit9531x_prio_table_commit() releases
  unforced holdover on error
- [Medium] dpll: sit9531x: sit9531x_reselect() leaves PLL stuck in
  holdover
- [Medium] dpll: sit9531x: manual PLL priority table entries prevent
  disabling inputs
--

commit 2d816e6713729c64ab6242d9d6911d753a230377
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement input pin state on a DPLL

This commit implements DPLL input pin state and operstate reporting and
configuration by managing per-PLL priority tables, input receiver gating,
and holdover reference re-selection.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 8a63b92fb7d62..d61c2a8e24f39 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -382,20 +487,462 @@ static u8 sit9531x_prio_slot_get(u8 val, u8 slot)

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
Can sit9531x_prio_activesel_pick() re-latch a lower-priority cur source
instead of top when sit9531x_reselect() runs?

sit9531x_reselect() calls sit9531x_prio_table_commit() with
srcs =3D=3D chan->prio_srcs, so old and srcs point to the same array and
top !=3D sit9531x_prio_top_live(sitdev, old) is always false (and during
sit9531x_prio_table_apply(), sit9531x_prio_top_live(sitdev, old) also
evaluates old against the newly fetched sitdev->ref[].los state rather than
chan->live_top).  If the previous active-selection nibble cur names a
lower-priority source in srcs[] whose loss-of-signal bit is clear (such as
OCXO or an input with qual_fail), sit9531x_prio_activesel_pick() returns cur
without checking whether the PLL is tracking it, and
sit9531x_prio_table_commit() updates chan->live_top to top so subsequent
polls never re-select top.

In addition, cur is canonicalized with sit9531x_prio_src_canon(), whereas
chan->prio_srcs[] holds uncanonicalized hardware nibbles from
sit9531x_prio_mask_build(), so srcs[i] =3D=3D cur and the fallback return of
srcs[i] do not match or canonicalize differential N-lane codes.

> +
> +static int sit9531x_prio_table_commit(struct sit9531x_dev *sitdev, u8 pl=
l_idx,
> +				      const u8 *srcs)
> +{
> +	u8 val, last_old, slot, attempt, written =3D 0, restored =3D 0;
> +	u8 now[SIT9531X_PRIO_MAX_SLOTS], back[SIT9531X_PRIO_MAX_SLOTS];
> +	struct sit9531x_chan *chan =3D &sitdev->chan[pll_idx];
> +	int rc =3D 0, prg_rc, ho_rc =3D 0;
> +	bool empty, ho_foreign, pending =3D false;
> +	bool pending_before =3D chan->table_pending;
> +	u16 reg;
> +
> +	empty =3D true;
> +	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++)
> +		if (sit9531x_prio_src_usable(srcs[slot]))
> +			empty =3D false;
> +
> +	memcpy(back, chan->table_pending ? chan->table_back : chan->prio_srcs,
> +	       sizeof(back));
> +
> +	/*
> +	 * Treat a forced holdover as set by this driver only when the table is
> +	 * empty or a release is pending; leave any other in place.
> +	 */
> +	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_HO_CTRL,
> +				  &val);
> +	if (rc)
> +		return rc;
> +
> +	ho_foreign =3D (val & BIT(SIT9531X_PLL_HO_FORCE_BIT)) &&
> +		     chan->prio_mask && !chan->ho_release_pending;
> +
> +	rc =3D sit9531x_write_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_HO_CTRL,
> +				   val | BIT(SIT9531X_PLL_HO_FORCE_BIT));
> +	if (rc)
> +		goto release;

[Severity: Medium]
Should this return rc directly instead of jumping to release when forcing
holdover fails?

When sit9531x_write_pll_u8() fails here, holdover was never forced by this
call, yet jumping to release tries to clear SIT9531X_PLL_HO_FORCE_BIT and
sets chan->ho_release_pending =3D true if that update also fails (which cau=
ses
later calls to treat an externally forced holdover bit as driver-owned and
clear it).

[ ... ]

> @@ -852,34 +1565,211 @@ static int sit9531x_dev_state_fetch(struct sit953=
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
Should sit9531x_ref_pll_mask_rebuild() and sit9531x_ref_pll_mask_fetch()
skip PLLs with chan->manual_input set?

A manual-select PLL ignores its priority table and exposes no
state_on_dpll_set callback to remove entries from it, so folding its
prio_mask into ref->pll_mask keeps those inputs claimed forever and prevents
sit9531x_input_disable() from powering down their receivers when they are
disconnected from all automatic PLLs.  Note that sit9531x_dev_state_fetch()
also calls sit9531x_ref_pll_mask_fetch() before sit9531x_chan_select_fetch()
has populated chan->manual_input.

[ ... ]

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
Can returning whenever top =3D=3D chan->live_top leave the PLL stuck in hol=
dover
when a live source is available?

If a higher-priority source IN0 recovers while the PLL is locked to a
fallback source IN1, sit9531x_reselect() sees chan->locked && !chan->ho_fre=
eze,
updates chan->live_top to IN0, and returns.  If IN1 later fails and puts the
PLL into holdover while IN0 is still live, top =3D=3D chan->live_top is tru=
e, so
sit9531x_reselect() returns early and never re-latches the table to acquire
IN0 (the same happens if the active top source drops into holdover and
recovers between two polls).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119225752.4184=
6-1-arouhi@sitime.com?part=3D7
