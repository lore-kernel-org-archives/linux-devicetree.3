Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013D13B9DBB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471679; cv=none; b=exTTPJoP8dFZkr1nEsv2241gY8NAzCi2Dk/FDtMymQ4HeIuCW+/jyT+P/bHC0H7wXMuDOPlfDZGEIqn2qyCo24np/XxLZkIODwK/cGvMYJ5VtdVksere8G89xEBYpp3WXev62/jm/qR80npeapkaGEXEF8FuvF77h6OrAaJu16E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471679; c=relaxed/simple;
	bh=WmUMPnokgSeP6ZXZ8x8XN7Q7GQeW9k1cbT77lrRzGU8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mfvnkb+EucBUkckMPe81s5rve5gOiOaW+EBWdRiAYxyfxsWzG++yGJGy5xFpBYwnWEilBkYkzF9IolMFVSj9KZRS1QrtU0gskHL6NkmKUSZli6rXEO5UCRZymjzFgJqICvfNBJgzB20uLzCGjP3GPVk9gjdeO0rg/kXHXDinrtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCVJWzF7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCVJWzF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C3E1F00A3E;
	Thu,  3 Sep 2026 21:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788471677;
	bh=gSs0pNCaUFaLtDKNADKlHNAx11q8fTLJtWaOAhQzpx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PCVJWzF7SfoY0dgPqRw3pAj2gJCgLa1WbYBbSKkJhTzEnqD4+B8gCHnQ8x+CmvHAJ
	 /cNnp67dLV5EmZwW3dXUec0jktyl4/It4FHUmu2bLXV9Kr0lOZPBIWZOh9PByZESGP
	 IwmM94nNvYGWKXeEK0jguVIQ26SH6suKdzlo2tdJZZj9KmZhmU3Lxli2N3WqJcg/SX
	 rWj8yH8hnno6ucrUQNqnRBMuVLtMYwv7L2j6SIkScTjugv7aI4A+OC8BrIRe/3hl2H
	 8WWZnGl/Qknti7RctGCXHfnbHGOBzCr6PI6xqPKQKx0FcOWAYMWFnG6RAzk55gk1TY
	 bfUsEia7EDHEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 06/15] dpll: sit9531x: implement input pin
 state on a DPLL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902214030.20955-7-arouhi@sitime.com>
References: <20260902214030.20955-1-arouhi@sitime.com>
 <20260902214030.20955-7-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 21:41:17 +0000
Message-Id: <20260903214117.97C3E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing hardware rollback in `sit9531x_dpll_input_pin_state_on_d=
pll_set` leaves the physical receiver powered on if adding to the priority =
table fails.
- [Medium] Overwriting the last priority slot in `sit9531x_input_prio_add` =
drops a unique source and leaks its hardware enable state.
--

commit 30ff5313804d1b26035265c46d0a4c6573cce4d4
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: implement input pin state on a DPLL

This commit implements pin state reporting and configuration for the DPLL.
It sets or removes inputs from a priority table that the hardware uses for=
=20
reference selection, translating DPLL connected/disconnected states to=20
table membership.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 1394ea1077d9c..f42c41d8a42e4 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> +/*
> + * sit9531x_input_prio_add - make an input eligible in a PLL's table
> + * @input_idx:	input source in hardware encoding
> + *
> + * Ensures the source appears in the priority table so it can be picked
> + * by automatic reference selection again after a disconnect.  If the
> + * source is already listed the table is left untouched; otherwise it is
> + * placed in the lowest-priority slot.  The original priority is not
> + * restored -- use sit9531x_input_prio_set() to reassign it.
> + *
> + * Caller must hold sitdev->multiop_lock.
> + */
> +int sit9531x_input_prio_add(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			    u8 input_idx)
> +{
> +	u8 srcs[SIT9531X_PRIO_MAX_SLOTS];
> +	u8 slot;
> +	int rc;
> +
> +	lockdep_assert_held(&sitdev->multiop_lock);
> +
> +	if (pll_idx >=3D SIT9531X_NUM_PLLS)
> +		return -EINVAL;
> +
> +	rc =3D sit9531x_prio_table_read(sitdev, pll_idx, srcs);
> +	if (rc)
> +		return rc;
> +
> +	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++)
> +		if (srcs[slot] =3D=3D input_idx)
> +			return 0;
> +
> +	srcs[SIT9531X_PRIO_MAX_SLOTS - 1] =3D input_idx;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Does unconditionally overwriting the last slot in the priority table risk
dropping a unique source?

If the source in slot SIT9531X_PRIO_MAX_SLOTS - 1 is unique and removed from
the table here, does its ref->pll_mask become permanently out of sync with =
the
hardware, leaking its physical receiver?

> +
> +	return sit9531x_prio_table_commit(sitdev, pll_idx, srcs);
> +}

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 821370ddeab00..29088707a3e62 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> +/*
> + * sit9531x_dpll_input_pin_state_on_dpll_set - set input pin DPLL state
> + *
> + * Enables or disables the physical input receiver via Page 0x02
> + * force/state registers (sit9531x_input_disable/enable()) and updates
> + * this DPLL's Page 1 priority table so the state is honoured by the
> + * PLL's automatic reference selection, not just at the input buffer.
> + * Selection role; see the pin-state contract above for the states.
> + *
> + * The priority table is per PLL, so it is always updated for this DPLL.
> + * A single physical input feeds every DPLL, so the hardware receiver is
> + * only cut off once the last DPLL has released it: ref->pll_mask tracks
> + * which DPLLs currently claim the input, and the physical disable
> + * happens on the transition to an empty mask.
> + */
> +static int
> +sit9531x_dpll_input_pin_state_on_dpll_set(const struct dpll_pin *pin,
> +					  void *pin_priv,
> +					  const struct dpll_device *dpll,
> +					  void *dpll_priv,
> +					  enum dpll_pin_state state,
> +					  struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	case DPLL_PIN_STATE_SELECTABLE:
> +		rc =3D sit9531x_input_enable(sitdev, dpin->id);
> +		if (rc)
> +			break;
> +		rc =3D sit9531x_input_prio_add(sitdev, sitdpll->id, hw_src);
> +		if (rc)
> +			break;
                        ^^^^^

[Severity: Medium]
If sit9531x_input_prio_add() fails, should the physical receiver that was j=
ust
enabled by sit9531x_input_enable() be disabled again on the error path?

Since ref->pll_mask is not updated before breaking out, could this leave the
receiver powered on indefinitely?

> +		/*
> +		 * Claim the input for this DPLL only once it is both enabled
> +		 * and present in the priority table.  Setting the mask before
> +		 * prio_add would leak the claim if prio_add failed, keeping the
> +		 * shared input receiver powered even after every DPLL released
> +		 * it.
> +		 */
> +		ref->pll_mask |=3D pll_bit;
> +		break;
> +	default:
> +		rc =3D -EINVAL;
> +		break;
> +	}
> +
> +	mutex_unlock(&sitdev->multiop_lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902214030.2095=
5-1-arouhi@sitime.com?part=3D6
