Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B935A39D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516843; cv=none; b=UuUoX9v6yTSxt4sQmv7ngSrykfzdnspLl1UhSIiHI61aWsJynf0b8KjNRT6EAoTCJzFgdlkaAqsHsMJBhnVQfto248wk0yVwLB3T+6mM5/hTLUyPjIOP+/UwXZEy67j+nySotTmTN1RFNYSFRhwANqmJ76suS/XFwesMsWEV+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516843; c=relaxed/simple;
	bh=k8PMv2pzOYbHFmyIAtduLATxN657zmRfpQqDLwxHUEE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBxQsYrYeJDasuO8RDAzdLR4vOxvHwkX/w0j1VKf0epMmMuxHV5NgokAbszYV3EAuh1hhTe/v350izIpF5mycleRD9uW5q+7WVeTqet0v4B8UsR14MsbMt6bwoON5xxH9jHMcewzn73eeyOpZEN7wq4qAc2i+wSQjsvgeCIUDOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Los1I9B+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Los1I9B+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6C91F00898;
	Wed, 16 Sep 2026 00:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789516841;
	bh=VrYDEjmOiJYWeGTCXbIjNfmcLaq1RBD/meM4NLpkhSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Los1I9B+tYhMtbfU+NkjnTiP45l7Hu0RXlwmONcHVrikt4T2hQLZjcRgq7grDfR7P
	 Uk4po1+QzG3L92rTVa8vyjYfZdEn5rUpqh4Qj9417nk52GcT3aEZw33HgSx5fPqEij
	 qzLr7eLkRpPFcVfAAsnyvHpe3iTpZIbiR/1i9PVChw58ZkcF8a43eP9cgaZ9rB9W2z
	 iu8KpwFsV3862QDkti+jVK05sptzyfbNvbAeEygq5HavWEkl1EgqzKUKdk7uX5XviM
	 JE7EhIKBpY3D0FmvQqHz1gqgDrXkWpqnVMuXS+Ky2v7sDODLM5XgUNClFGhBNBp1BA
	 691okz4iAbAhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 06/15] dpll: sit9531x: implement input pin
 state on a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915000015.80480-7-arouhi@sitime.com>
References: <20260915000015.80480-1-arouhi@sitime.com>
 <20260915000015.80480-7-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:00:40 +0000
Message-Id: <20260916000041.5C6C91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dpll: sit9531x: software mask corruption on failed priority table =
writes
- [Medium] dpll: sit9531x: physical receiver leak on partial disconnect fai=
lure
- [Medium] dpll: sit9531x: shadowed priority register read-modify-write haz=
ard
--

commit e8bad210eb8820741e20c84614e6f523002797e2
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement input pin state on a DPLL

This patch implements the reporting and setting of input references for a
DPLL. It introduces mechanisms to rewrite the selection priority table and
manages enabling or disabling the physical inputs based on membership.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 6dfb1b31d4913..25418485e9757 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -365,6 +538,90 @@ static void sit9531x_prio_mask_build(struct sit9531x=
_dev *sitdev, u8 pll_idx,
[ ... ]
> +static int sit9531x_prio_table_commit(struct sit9531x_dev *sitdev, u8 pl=
l_idx,
> +				      const u8 *srcs)
> +{
> +	u8 val, slot, attempt;
> +	int rc, prg_rc, ho_rc =3D 0;
> +	u16 reg;
> +
> +	rc =3D sit9531x_update_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_HO_CTRL,
> +				    BIT(SIT9531X_PLL_HO_FORCE_BIT),
> +				    BIT(SIT9531X_PLL_HO_FORCE_BIT));
> +	if (rc)
> +		return rc;
> +
> +	usleep_range(10000, 12000);
> +
> +	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++) {
> +		reg =3D sit9531x_prio_reg(pll_idx, slot);
> +
> +		rc =3D sit9531x_read_u8(sitdev, reg, &val);
> +		if (rc)
> +			goto commit;
> +
> +		val =3D sit9531x_prio_slot_set(val, slot, srcs[slot]);
> +
> +		rc =3D sit9531x_write_u8(sitdev, reg, val);
> +		if (rc)
> +			goto commit;
> +	}

[Severity: Medium]
Does this read-modify-write sequence run the risk of clobbering unlatched
shadow registers? Since two slots share one register, if the hardware
returns the latched active state on read rather than the uncommitted shadow
state, wouldn't the read for the next slot fetch the old value for the prior
slot and overwrite the uncommitted write?

> +
> +commit:
> +	/*
> +	 * Latch unconditionally: slots written before a failed write are in
> +	 * the table regardless, so the latch keeps hardware and the mask
> +	 * rebuild below consistent with what was actually written.
> +	 */
> +	prg_rc =3D sit9531x_prio_prg_commit(sitdev);
> +	if (prg_rc && !rc)
> +		rc =3D prg_rc;
> +
> +	/*
> +	 * Refresh the mask from the table just written so a get that follows
> +	 * a set does not have to wait for the next poll.  Slots written
> +	 * before a failed write are in the table too, so this is closer to
> +	 * the truth than the pre-write mask either way, and the poll read-back
> +	 * corrects whatever a partial write left behind.
> +	 */
> +	sit9531x_prio_mask_build(sitdev, pll_idx, srcs);

[Severity: High]
If the I2C writes fail and execution jumps to the commit label, is it safe
to unconditionally rebuild the software mask using the intended srcs array?
If the mask reflects a successful write but the hardware doesn't, this could
permanently desynchronize the software state from the hardware and break
rollback error handling on later pin operations.

[ ... ]
> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index b4984335e6bfc..ab9aa7db1839c 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> @@ -300,8 +335,144 @@ sit9531x_dpll_input_pin_direction_get(const struct =
dpll_pin *pin,
> +static int
> +sit9531x_dpll_input_pin_state_on_dpll_set(const struct dpll_pin *pin,
> +					  void *pin_priv,
> +					  const struct dpll_device *dpll,
> +					  void *dpll_priv,
> +					  enum dpll_pin_state state,
> +					  struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	switch (state) {
> +	case DPLL_PIN_STATE_DISCONNECTED:
> +		rc =3D sit9531x_input_prio_remove(sitdev, sitdpll->id, hw_src);
> +		/*
> +		 * The table write, the latch and the holdover release are
> +		 * three steps behind one return code, so ask the table what
> +		 * actually happened rather than reading the errno as "no
> +		 * change".  A source that is gone from the table has been
> +		 * released whatever else failed.
> +		 */
> +		if (rc && sit9531x_input_prio_present(sitdev, sitdpll->id,
> +						      hw_src))
> +			break;
> +		ref->pll_mask &=3D ~pll_bit;
> +		if (rc)
> +			break;
> +		if (ref->pll_mask)
> +			rc =3D 0;	/* another DPLL still uses this input */
> +		else
> +			rc =3D sit9531x_input_disable(sitdev, dpin->id);
> +		break;

[Severity: Medium]
If sit9531x_input_prio_remove() succeeds in updating the hardware table but
fails a subsequent step (like releasing holdover), returning a non-zero rc,
doesn't this skip sit9531x_input_disable() and leave the physical receiver
powered on indefinitely while the software state considers it unused?

> +	case DPLL_PIN_STATE_CONNECTED:
[ ... ]
> +		break;
> +	case DPLL_PIN_STATE_SELECTABLE:
> +		if (!(ref->pll_mask & pll_bit)) {
> +			rc =3D sit9531x_input_enable(sitdev, dpin->id);
> +			if (rc)
> +				break;
> +		}
> +		rc =3D sit9531x_input_prio_add(sitdev, sitdpll->id, hw_src);
> +		if (rc && !sit9531x_input_prio_present(sitdev, sitdpll->id,
> +						       hw_src)) {
> +			if (!(ref->pll_mask & pll_bit) && !ref->pll_mask)
> +				sit9531x_input_disable(sitdev, dpin->id);
> +			break;
> +		}
> +		/*
> +		 * Claim the input for this DPLL only once it is both enabled
> +		 * and present in the priority table.  Setting the mask before
> +		 * prio_add would leak the claim if prio_add failed, keeping the
> +		 * shared input receiver powered even after every DPLL released
> +		 * it.
> +		 */
> +		ref->pll_mask |=3D pll_bit;
> +		break;

[Severity: High]
If sit9531x_input_prio_add() encounters an I2C error but the software mask
was corrupted in sit9531x_prio_table_commit() to look successful, won't
sit9531x_input_prio_present() incorrectly return true? This would bypass
the hardware rollback (sit9531x_input_disable) and incorrectly claim the
receiver in ref->pll_mask.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915000015.8048=
0-1-arouhi@sitime.com?part=3D6
