Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02AE23741
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633572; cv=none; b=iSfEk/uCHWPlusQ+iTMTiI3OeWhpJzwSM+frzdLbLsrYMYtHXhnmQp1DtRLwgLpGcvBajd9paREJEsbzKqNBPX693g0j9W3GSb2nQLzuJ9VeZ1bYMNM7NEssR/HGxOuN8+jTpCUloYw5QvhcLqo1aOYvVDxiteCv45Og+7LD6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633572; c=relaxed/simple;
	bh=wJNNyGRoskGRTQwG3Djx3WEEdYta/x/LZ/twAUBzmkY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s4iLsTM7lQ5J3H52zZAQdhlQkrYP9Qovt3cW5Chn2fDupqXnnlseLvhu+kBvqpIW0bCGIgKdzGgRJcx9u55K6VC/QyurRZHlCzpXJWdmHStus3YakhuyHSr2qKkdx4j8teGJIM97Hzi6i62eT2efn7h3JNyrXROm2go0dTIc7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEV2BtqC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEV2BtqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EA0C2BCB0;
	Wed, 13 May 2026 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778633572;
	bh=wJNNyGRoskGRTQwG3Djx3WEEdYta/x/LZ/twAUBzmkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=vEV2BtqCDn4wnYzeM02Yngvtu0Omz7LeD1Lessz4tSHCcrVsUwxOXtu5j4VsJaBVd
	 NsdfMANj6D5dUbq7qlhRZC3GlP/rfptzVNC6OUCYRHkV4yNYaObpj+Mm4GMf4EOlOc
	 glmpCOZm0fYkcenHNSKMN5U31LjzGhyMCqAaMg9KkAJ5tAWYtEMHRY2BF8XnaMTIfK
	 W7abfEBRUlitPl0XiXPB8nAnPF5HAaA87oSeJSHG6bk7/sgshYnuIIeYmDp/JScU4/
	 z65cukjl79zKYSENklKstkjHQp9mBG+qit5boi+D9FDqMH2GTql7ktNSywST6zRgmQ
	 iRGhQyc1LD0Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <rouhi.ali@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511211453.20671-2-arouhi@sitime.com>
References: <20260511211453.20671-2-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:52:51 +0000
Message-Id: <20260513005252.34EA0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] DPLL pin properties (`package_label` and `freq_supported`) are=
 freed immediately after registration, causing a critical use-after-free vu=
lnerability.
- [High] The driver uses a non-existent macro `kzalloc_obj` for memory allo=
cation, causing a build failure.
- [High] The crystal oscillator frequency (`xtal_freq`) is never initialize=
d, permanently breaking core frequency and phase calculations.
- [High] The INTRB threaded IRQ is registered before the kthread worker is =
initialized and torn down after the worker is destroyed, causing a NULL poi=
nter dereference race.
- [High] The driver fails to clear hardware interrupt notifications, causin=
g an unhandled interrupt storm.
- [High] Phase adjustments are written to the wrong hardware registers beca=
use the logical output index is used instead of the physical slot.
- [High] Unsigned 32-bit hardware fractional numerators are read into signe=
d integers, causing a sign-extension bug that corrupts DCO math.
- [Medium] Hardware state cache arrays are updated and read concurrently wi=
thout locking, leading to data races.
- [Medium] DCO frequency adjustment and SYSREF/SYNCB output modes are fully=
 implemented but entirely unreachable (Dead Code).
--

commit 7809f8a3992ad8b550d7f2507263595d95f3b3d8
Author: Ali Rouhi <rouhi.ali@gmail.com>

dpll: add SiTime SiT9531x DPLL clock driver

Adds a DPLL subsystem driver for the SiTime SiT95316 and SiT95317
clock generators.

The driver exposes all inputs and outputs through the Linux DPLL
subsystem, supporting:
[ ... ]
 - DCO (digitally controlled oscillator) frequency adjustment
[ ... ]
 - SYSREF/SYNCB/Pulser output mode control

This isn't a bug, but the commit message indicates that the driver supports
DCO frequency adjustment and SYSREF/SYNCB output mode control. However,
these features do not appear to be hooked into sit9531x_dpll_device_ops or
otherwise exposed to the DPLL subsystem.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> new file mode 100644
> index 0000000000000..4c15a10aaa0ae
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> +static int sit9531x_dco_read_divn(struct sit9531x_dev *sitdev, u8 pll_id=
x,
> +				  u32 *int_part, s32 *fracn, u32 *fracd)
> +{
[ ... ]
> +	/* Numerator (4 bytes, little-endian) */
> +	*fracn =3D 0;
> +	for (i =3D 3; i >=3D 0; i--) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DIVN_NUM + i, &v);
> +		if (rc)
> +			return rc;
> +		*fracn =3D (*fracn << 8) | v;
> +	}

Could this left shift into a signed 32-bit integer result in a negative
value?

If the hardware fractional numerator represents a value greater than or
equal to 0.5, the most significant bit will be set. This might sign-extend
when cast later and alter the calculation in sit9531x_dco_calc_inner.

[ ... ]
> +static u64 sit9531x_get_fvco(struct sit9531x_dev *sitdev, u8 pll_idx)
> +{
[ ... ]
> +	doubler =3D sit9531x_is_xo_doubler_enabled(sitdev);
> +	if (doubler < 0)
> +		return 0;
> +
> +	fref =3D (u64)sitdev->xtal_freq << doubler;

Where is sitdev->xtal_freq populated?

If it remains zero-initialized from the initial allocation, fref will
evaluate to zero. This would cause fvco to return zero and affect
subsequent frequency calculations and hardware state updates.

[ ... ]
> +int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,
> +				     u8 out_idx, s32 phase_ps)
> +{
[ ... ]
> +	page =3D (out_idx < 6) ? SIT9531X_PAGE_OUTSYS0
> +			     : SIT9531X_PAGE_OUTSYS1;
> +	base =3D SIT9531X_OUT_PRG_DELAY_BASE +
> +	       SIT9531X_OUT_PRG_SLOT_STRIDE * (out_idx % 6);

Should this use the physical slot mapping instead of the logical index?

Using out_idx directly here might cause the driver to write to the phase
delay registers of a different output port. sit9531x_output_freq_set() uses
info->clkout_map to resolve this correctly.

[ ... ]
> +static irqreturn_t sit9531x_irq_thread_fn(int irq, void *data)
> +{
> +	struct sit9531x_dev *sitdev =3D data;
> +
> +	kthread_mod_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +	return IRQ_HANDLED;
> +}

Does the hardware require interrupt notifications to be explicitly cleared?

The handler returns IRQ_HANDLED after waking the worker, but
sit9531x_clear_notifications() is never called. If this is a level-triggered
interrupt line, leaving the notification active might cause an interrupt
storm.

[ ... ]
> +int sit9531x_dev_probe(struct sit9531x_dev *sitdev)
> +{
[ ... ]
> +	if (sitdev->irq > 0) {
> +		rc =3D devm_request_threaded_irq(sitdev->dev, sitdev->irq,
> +					       NULL, sit9531x_irq_thread_fn,
> +					       IRQF_ONESHOT,
> +					       dev_name(sitdev->dev), sitdev);
> +		if (rc)
> +			return dev_err_probe(sitdev->dev, rc,
> +					     "Failed to request IRQ %d\n",
> +					     sitdev->irq);
> +		dev_info(sitdev->dev,
> +			 "INTRB IRQ %d wired (threaded handler kicks periodic poll)\n",
> +			 sitdev->irq);
> +	}
> +
> +	/* Register DPLL channels */
> +	rc =3D sit9531x_devm_dpll_init(sitdev);

What happens if the interrupt fires right after it is registered?

Since devm_request_threaded_irq is called before the kworker is initialized
inside sit9531x_devm_dpll_init, an early interrupt could cause the thread
handler to dereference a null pointer when interacting with the worker.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> new file mode 100644
> index 0000000000000..c766c7c2dd366
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> +static int
> +sit9531x_dpll_lock_status_get(const struct dpll_device *dpll, void *dpll=
_priv,
> +			      enum dpll_lock_status *status,
> +			      enum dpll_lock_status_error *status_error,
> +			      struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	const struct sit9531x_chan *chan;
> +
> +	if (status_error)
> +		*status_error =3D DPLL_LOCK_STATUS_ERROR_NONE;
> +
> +	chan =3D sit9531x_chan_state_get(sitdpll->dev, sitdpll->id);
> +
> +	if (chan->locked) {

Is it safe to read the channel state here without holding a lock?

The periodic worker locklessly updates the hardware state cache arrays.
Concurrent reads in the netlink callbacks could potentially see torn data
or mismatched state vectors.

[ ... ]
> +static struct sit9531x_dpll_pin *
> +sit9531x_dpll_pin_alloc(struct sit9531x_dpll *sitdpll,
> +			enum dpll_pin_direction dir, u8 id)
> +{
> +	struct sit9531x_dpll_pin *pin;
> +
> +	pin =3D kzalloc_obj(*pin, GFP_KERNEL);
> +	if (!pin)
> +		return ERR_PTR(-ENOMEM);

Does the macro kzalloc_obj exist in the tree?

It looks like this might cause a build failure since kzalloc is the standard
allocation macro. This same pattern seems to be used in sit9531x_dpll_alloc
and sit9531x_pin_props_get.

[ ... ]
> +static int sit9531x_dpll_pin_register(struct sit9531x_dpll_pin *pin,
> +				      u32 index)
> +{
[ ... ]
> +	/* Register the pin */
> +	rc =3D dpll_pin_register(sitdpll->dpll_dev, pin->dpll_pin, ops, pin);
> +	if (rc)
> +		goto err_register;
> +
> +	/* Free pin properties */
> +	sit9531x_pin_props_put(props);
> +
> +	return 0;

Are the pointers for package_label and freq_supported safely copied?

Looking at the DPLL core, dpll_pin_get() appears to perform a shallow copy.
Freeing the properties right after registration could result in a use after
free when the subsystem later attempts to read them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511211453.2067=
1-1-arouhi@sitime.com?part=3D3
