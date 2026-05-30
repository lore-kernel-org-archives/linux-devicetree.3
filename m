Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F62C11E6
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101922; cv=none; b=JbFVuecG5CRzDUbkc37vawq6pmjr0bVIfiq5mnJgD+xy7NoLnmfh+JakiFzWAQTgf9W6Wf2ZwyehZNKQQx5no/YknYnTWOxFHP6bfrZ/14NIlcvpFY9nSzWh2HoBimJw5i6k5yaKOaP7DSucdc/CVfXQ1tjHvVNcJlJF5Z3n/hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101922; c=relaxed/simple;
	bh=40zVVWqBGFNPH2WhAZxmKOrXOHDg4hPOTEIgcXN3KII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OC94DUtmahLgtTsziDWdXJhPgR42TTeqpyvz2bwDeVj7sroWK/+jlP/bi70g9fy+RcqXHZ/GCCBAfI6B4j5VMr+J32BGSdpz8/UUxZLo/0Mgp4msKpzhBTPb6HC04JSWQuQzCsGnKO1akSizbEvjAY0QicZDFAxf9twZxaW6YQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auzJfPWs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auzJfPWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3B41F00893;
	Sat, 30 May 2026 00:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101921;
	bh=IGPe67mqYsB/tMFWPrjLvyfQ883VGvkfxJgAZlaet3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=auzJfPWshC5o1XhOFflhlPI9I5OYXvCrr1B/bu7ILHkEHU5nornntqsOEfE48yZqH
	 utrH7Go+T34lqacOOosVXWziCcdWiQgUront55QZSW/mPJXRIzlvb7UX3hqan/n33a
	 Wtn1mEKfyWHyeqD7zx3G1oKgsfwLNMiuT0SO2lafd+NQTAOk7NoS4nekWrMGugSKKe
	 Heljkd2twYRjqCTOny+8DEEWJxz27gfavCKk5dOyxo/KbTfoRQ1V5o4olXbbpPLw5Y
	 niTRIYaRp+pZmHeEsen7GHjIt/CvBaVCDXWisI5czA9L0f/akRNjYLiUVF92bjzTdK
	 TYmnf2lU3BSFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <rouhi.ali@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520191943.73938-4-arouhi@sitime.com>
References: <20260520191943.73938-4-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:20 +0000
Message-Id: <20260530004520.CE3B41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] Missing translation between logical input pin indices and the hard=
ware's input multiplexer encoding.
- [High] Missing Kconfig dependency on CONFIG_NET causes build failures.
- [High] Threaded IRQ handler causes an IRQ storm by not clearing the inter=
rupt condition.
- [High] 64-bit modulo operator causes build failures on 32-bit architectur=
es.
- [High] Mathematical errors in DCO frequency calculations cause severe int=
eger overflows and corrupted adjustments.
- [High] The driver ignores explicit DPLL_PIN_STATE_CONNECTED requests.
- [High] I2C communication occurs before acquiring and deasserting the hard=
ware reset GPIO.
- [High] Dangling pointers in DPLL pin properties lead to a Use-After-Free.
- [High] Output state fetching uses logical indices instead of physical slo=
t mapping.
- [High] Unconditional self-rearming kthread work causes a use-after-free d=
uring device teardown.
- [High] The input pin phase offset readback incorrectly returns the active=
 reference's TDC value for any queried pin.
- [Medium] Data race on software state variables (`chan` and `ref` structur=
es).
- [Low] Implemented hardware features for DCO tuning, SYSREF/SYNCB modes, a=
nd inter-PLL synchronization are completely unreachable dead code.
- [Low] The `change_work` workqueue structure is declared and initialized, =
but never scheduled.
--

commit ff884ee4fc91e867177f9d6d746fb3c4463737ac
Author: Ali Rouhi <rouhi.ali@gmail.com>
Subject: dpll: add SiTime SiT9531x DPLL clock driver

Add a DPLL subsystem driver for the SiTime SiT95316 and SiT95317
clock generators. These devices provide low-jitter clock outputs
commonly used in telecom, networking, and data center timing
applications.

> diff --git a/drivers/dpll/sit9531x/Kconfig b/drivers/dpll/sit9531x/Kconfig
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SIT9531X_DPLL
> +	tristate "SiTime SiT9531x DPLL driver"
> +	depends on I2C
> +	select DPLL

[Severity: High]
Does this Kconfig need to depend on or inherit NET?

Selecting DPLL without a corresponding dependency on NET causes Kconfig unm=
et
dependency warnings and subsequent build failures if the kernel is configur=
ed
without networking.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> +int sit9531x_input_prio_set(struct sit9531x_dev *sitdev, u8 pll_idx,
> +			    u8 input_idx, u8 prio)
> +{

[Severity: High]
Does this incorrectly pass the logical input pin index directly to the
hardware instead of translating it to the hardware's multiplexer encoding?

The hardware priority table uses a 4-bit encoding for input selection.
Using the logical index will misprogram the hardware when selecting=20
N-polarity inputs.

[ ... ]
> +static int sit9531x_dco_read_divn(struct sit9531x_dev *sitdev, u8 pll_id=
x,
> +				  u32 *int_part, s32 *fracn, u32 *fracd)
> +{
> +	u8 v, pbyq;
> +	int rc, i;
> +
> +	/* Integer part */
> +	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_DIVN_INT,=
 &v);
> +	if (rc)
> +		return rc;
> +	*int_part =3D v;
> +
> +	/* Numerator (4 bytes, little-endian) */
> +	*fracn =3D 0;

[Severity: High]
Could reading the unsigned 32-bit fraction into an s32 variable cause
negative values for fractions larger than 2^31?

[ ... ]
> +static void sit9531x_dco_calc_inner(u32 int_part, s32 fracn, u32 fracd,
> +				    s64 ppb, struct sit9531x_dco_code *code)
> +{
> +	s32 frac_scaled;
> +	u64 divn_code;
> +
> +	if (!fracd)
> +		fracd =3D 1;

[Severity: High]
Should this implicit denominator be treated as 1ULL << 32 instead of 1?

[ ... ]
> +static void sit9531x_dco_calc_outer(s64 n2_int, s32 n2_fracn, u32 n2_fra=
cd,
> +				    s64 ppb, struct sit9531x_dco_code *code)
> +{
> +	u64 divn2_num, dco_int_u, adjustment_frac;
> +	u32 fracd_eff;
> +
> +	fracd_eff =3D n2_fracd ? n2_fracd : 1;
> +	divn2_num =3D (u64)n2_int * fracd_eff + (u32)n2_fracn;

[Severity: High]
Can this calculation overflow the 64-bit limit since n2_int is a 40-bit
value?

[ ... ]
> +int sit9531x_dco_adjust(struct sit9531x_dev *sitdev, u8 pll_idx, s64 ppb)

[Severity: Low]
Is this function ever called?

The implemented hardware features for DCO tuning, SYSREF/SYNCB modes, and=20
inter-PLL synchronization appear to be unreachable dead code.

[ ... ]
> +int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,
> +				     u8 out_idx, s32 phase_ps)
> +{
[ ... ]
> +		u64 t_out_ps =3D div64_u64(1000000000000ULL, freq);
> +		u64 advance =3D (u64)(-(s64)phase_ps);
> +
> +		if (t_out_ps =3D=3D 0)
> +			return -EINVAL;
> +		advance %=3D t_out_ps;

[Severity: High]
Will this 64-bit modulo operation cause linker failures on 32-bit
architectures?

Using the modulo operator with u64 operands generates an undefined reference
to __umoddi3.

[ ... ]
> +static int sit9531x_out_state_fetch(struct sit9531x_dev *sitdev, u8 inde=
x)
> +{
> +	struct sit9531x_out *out =3D &sitdev->out[index];
> +	u8 map_lo, map_hi;
> +	int pll_idx;
> +
> +	/*
> +	 * Determine which PLL drives this output by checking each PLL's
> +	 * output map registers (0x27 =3D outputs 8-11, 0x28 =3D outputs 0-7).
> +	 */
> +	for (pll_idx =3D 0; pll_idx < SIT9531X_NUM_PLLS; pll_idx++) {
> +		int rc;
> +
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_OUT_MAP_LO, &map_lo);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_OUT_MAP_HI, &map_hi);
> +		if (rc)
> +			return rc;
> +
> +		if (index < 8) {
> +			if (map_lo & BIT(index)) {

[Severity: High]
Does this logic need to translate the logical index to a physical slot?

The driver appears to use the logical index directly to query the hardware
registers, missing the translation using clkout_map.

[ ... ]
> +static void sit9531x_dev_periodic_work(struct kthread_work *work)
> +{
> +	struct sit9531x_dev *sitdev =3D container_of(work, struct sit9531x_dev,
> +						   work.work);
> +	struct sit9531x_dpll *sitdpll;
> +	int rc;
> +
> +	/* Update input references' states */
> +	sit9531x_dev_ref_states_update(sitdev);

[Severity: Medium]
Is there a missing lock when reading and writing the channel and reference
software state?

These state fields are modified locklessly by the periodic kthread, while
callbacks concurrently read them, potentially causing data races.

[ ... ]
> +	/* Run twice a second */
> +	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work,
> +				   msecs_to_jiffies(SIT9531X_STATUS_POLL_MS));

[Severity: High]
Can this cause a use-after-free during device teardown?

Since the worker unconditionally re-arms itself at the end of execution, if
kthread_cancel_delayed_work_sync() is called while this is running, it will
queue itself again.

[ ... ]
> +static irqreturn_t sit9531x_irq_thread_fn(int irq, void *data)
> +{
> +	struct sit9531x_dev *sitdev =3D data;
> +
> +	kthread_mod_delayed_work(sitdev->kworker, &sitdev->work, 0);
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Could this trigger an interrupt storm?

Since this threaded handler returns IRQ_HANDLED without clearing the hardwa=
re
notification registers, the level-triggered interrupt will immediately=20
re-fire before the asynchronous kworker gets a chance to clear it.

[ ... ]
> +int sit9531x_dev_probe(struct sit9531x_dev *sitdev)
> +{
> +	struct clk *xtal_clk;
> +	u8 variant_id;
> +	int rc;
[ ... ]
> +	/* Read variant ID byte */
> +	rc =3D sit9531x_read_variant_id(sitdev, &variant_id);
> +	if (rc)
> +		return rc;
[ ... ]
> +	sitdev->reset_gpio =3D devm_gpiod_get_optional(sitdev->dev, "reset",

[Severity: High]
Will the initial I2C read fail if the hardware is held in reset?

The reset GPIO should be fetched and deasserted before attempting to
communicate over I2C to read the variant ID.

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
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
> +		rc =3D sit9531x_input_disable(sitdev, dpin->id);
> +		break;
> +	case DPLL_PIN_STATE_SELECTABLE:
> +	case DPLL_PIN_STATE_CONNECTED:
> +		rc =3D sit9531x_input_enable(sitdev, dpin->id);
> +		break;

[Severity: High]
Should the driver enforce manual hardware selection when a user explicitly
requests a DPLL_PIN_STATE_CONNECTED state?

Currently, it handles CONNECTED identically to SELECTABLE by merely enabling
the input and allowing the hardware to auto-select.

[ ... ]
> +static int
> +sit9531x_dpll_input_pin_phase_offset_get(const struct dpll_pin *pin,
> +					 void *pin_priv,
> +					 const struct dpll_device *dpll,
> +					 void *dpll_priv, s64 *phase_offset,
> +					 struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	s64 offset;
> +	int rc;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_phase_offset_read(sitdev, sitdpll->id, &offset);

[Severity: High]
Will this return the phase offset of the currently active reference for any
queried pin?

The hardware TDC measures the phase difference of the selected active
reference. If an inactive pin is queried, this improperly returns the active
pin's phase offset instead of an error.

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

[Severity: High]
Could this cause a use-after-free when userspace queries the pin label or
frequencies?

The DPLL core retains the dynamically allocated package_label and
freq_supported pointers passed during registration, but this call frees them
immediately after.

[ ... ]
> +struct sit9531x_dpll *sit9531x_dpll_alloc(struct sit9531x_dev *sitdev, u=
8 ch)
> +{
[ ... ]
> +	sitdpll->lock_status =3D DPLL_LOCK_STATUS_UNLOCKED;
> +	INIT_LIST_HEAD(&sitdpll->pins);
> +	INIT_WORK(&sitdpll->change_work, sit9531x_dpll_change_work);

[Severity: Low]
Is this workqueue structure ever actually scheduled?

It appears to be dead code, as the driver calls dpll_device_change_ntf()
directly instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520191943.7393=
8-1-arouhi@sitime.com?part=3D3
