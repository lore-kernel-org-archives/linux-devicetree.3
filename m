Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258023DB335
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786918782; cv=none; b=Euh86ZEE5lB1cz+73QRNRPDrz3i89dNsnPLQ39uxxEhwU/AWEJ/OCyd2aQ3jqBs1ZleinDPL+Cu/NppUdmHvGlynHJwB79YPurpHe6P89XSSL6is3tnTpM7ONejrf+/1QMPyJkY0/ixlprYnSeLmIDb/djXHQTJRaE+shf+QOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786918782; c=relaxed/simple;
	bh=3Bt9nlgsAriBXt5uBu37A2zq2lRMuC/47PGVbwsHKyE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QXvKR1FkQOoy26GmIXLZDUo9S8upMW4rRTXwjwWYfwpT8jlAdf2nnDPI/9W+4N0rS95YFHue/aNa5hg5kP//YWQ+20XJ5vXKO/kkLB2KZTN7fOMNBXXgr/jjUV6aynPtTewcdpSA5Mq7GqlSHw3gwQC9ZMqCxBvAt8J9Lp8TpBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6UB2xaM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6UB2xaM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806F11F00A3A;
	Sun, 16 Aug 2026 22:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786918780;
	bh=k5eHwPdXnQPekvQg3mZmHfdNMaMrS4CpmuvFWQdZoRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z6UB2xaMst4uQxMT8wiE+m7YNY2XbSK2Q+hWAKA5ZjS9K7z9/kVG6b8hQkOabqa0h
	 7JfAhRAqG509lrSNw6ZpGu4T/kJbb939qiuztM2xi+HpRCiWtkwvp5mPgnW9PB5ctv
	 U9EBuDjGTprqaQBG+HR/0t65bM4bD5v3jp5cZbhilEdAdBmXQfx2jEqySWx1Ft0rwe
	 UCQplhJOaH9Vxm91BUgwxg3aunn30uh2aW7KFhWfQG92vuyHwqpdb2Zl4eMiPIP7Kj
	 QpS3ao6vNRbLc9mA3p0M0KTbcHzGPIa7Z6fHwK0QG9Ifgd5RPiibCpUbOuxa5dGYrQ
	 zPkj1OjvGGy/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260815221919.64226-4-arouhi@sitime.com>
References: <20260815221919.64226-1-arouhi@sitime.com>
 <20260815221919.64226-4-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 22:19:40 +0000
Message-Id: <20260816221940.806F11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Unconditional insertion of DISCONNECTED pins into the hardware pri=
ority table.
- [High] Disconnecting INTSYNC as the last source fails to stop it from bei=
ng tracked.
- [Medium] INTSYNC destination state reporting ignores the hardware priorit=
y table.
- [Medium] The INTSYNC destination pin incorrectly accepts DPLL_PIN_STATE_C=
ONNECTED without enforcing it.
- [Medium] Input and INTSYNC destination pin states report CONNECTED and hi=
de SELECTABLE pins during free-run mode.
- [Low] Input pins falsely advertise phase adjustment capabilities by provi=
ding phase_adjust_get and configuring a phase_range.
- [Low] Undefined macro `kzalloc_obj` used for memory allocation.
--

--- Patch [3]: [PATCH net-next v7 3/3] dpll: add SiTime SiT9531x DPLL clock=
 driver ---
commit 5e338b25e73b0731bfca9ec0093c0c9753e2503c
Author: Ali Rouhi <arouhi@sitime.com>

dpll: add SiTime SiT9531x DPLL clock driver

This commit adds a DPLL subsystem driver for the SiTime SiT95316 and
SiT95317 clock generators. It provides support for lock monitoring,
input priority management, frequency offset measurement, and output
phase adjustment using the device's I2C interface and NVM.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> new file mode 100644
> index 0000000000000..cd283922e7ffa
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -782,31 +782,31 @@ int sit9531x_input_prio_set(struct sit9531x_dev *si=
tdev, u8 pll_idx,
>  int sit9531x_input_prio_remove(struct sit9531x_dev *sitdev, u8 pll_idx,
>  			       u8 input_idx)
>  {
>  	u8 srcs[SIT9531X_PRIO_MAX_SLOTS];
>  	u8 kept[SIT9531X_PRIO_MAX_SLOTS];
>  	u8 slot, count =3D 0;
>  	bool found =3D false;
>  	int rc;
> =20
>  	lockdep_assert_held(&sitdev->multiop_lock);
> =20
>  	if (pll_idx >=3D SIT9531X_NUM_PLLS)
>  		return -EINVAL;
> =20
>  	rc =3D sit9531x_prio_table_read(sitdev, pll_idx, srcs);
>  	if (rc)
>  		return rc;
> =20
>  	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++) {
>  		if (srcs[slot] =3D=3D input_idx)
>  			found =3D true;
>  		else
>  			kept[count++] =3D srcs[slot];
>  	}
> =20
>  	if (!found || count =3D=3D 0)
>  		return 0;

[Severity: High]
If userspace requests to disconnect the INTSYNC pin when it is the only
source in the priority table, the count becomes 0 and this function
aborts without modifying the table.

Since the INTSYNC net lacks a physical buffer that can be disabled, does
this leave the hardware actively tracking the INTSYNC reference when it was
commanded to disconnect?

[ ... ]
> @@ -2526,17 +2526,17 @@ void sit9531x_dev_stop(struct sit9531x_dev *sitde=
v)
>  }
> =20
>  static struct sit9531x_dpll_pin *
>  sit9531x_dpll_pin_alloc(struct sit9531x_dpll *sitdpll,
>  			enum dpll_pin_direction dir, u8 id)
>  {
>  	struct sit9531x_dpll_pin *pin;
> =20
>  	pin =3D kzalloc_obj(*pin, GFP_KERNEL);

[Severity: Low]
Does this macro exist in the kernel headers?

The use of kzalloc_obj appears to be an undefined identifier that will cause
a build failure here, and in a few other allocation sites throughout the
driver (such as sit9531x_dpll_alloc and sit9531x_pin_props_get).

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> new file mode 100644
> index 0000000000000..e258beceffdd4
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> @@ -258,35 +258,35 @@ sit9531x_dpll_input_pin_state_on_dpll_get(const str=
uct dpll_pin *pin,
>  					  void *pin_priv,
>  					  const struct dpll_device *dpll,
>  					  void *dpll_priv,
>  					  enum dpll_pin_state *state,
>  					  struct netlink_ext_ack *extack)
>  {
>  	struct sit9531x_dpll_pin *dpin =3D pin_priv;
>  	struct sit9531x_dpll *sitdpll =3D dpll_priv;
>  	struct sit9531x_dev *sitdev =3D sitdpll->dev;
>  	const struct sit9531x_chan *chan;
>  	const struct sit9531x_ref *ref;
> =20
>  	chan =3D sit9531x_chan_state_get(sitdev, sitdpll->id);
>  	ref =3D sit9531x_ref_state_get(sitdev, dpin->id);
> =20
>  	mutex_lock(&sitdev->multiop_lock);
> =20
>  	/*
>  	 * Report CONNECTED only when the PLL is genuinely locked to this
>  	 * input.  chan->locked already excludes a PLL the configuration
>  	 * leaves unused, which would otherwise claim its default source as
>  	 * connected right after probe; the inner loop has to be locked as
>  	 * well before the reference can be called connected.
>  	 */
>  	if (chan->locked && !chan->inner_lol &&
>  	    chan->selected_ref =3D=3D dpin->id)
>  		*state =3D DPLL_PIN_STATE_CONNECTED;
>  	/*
>  	 * Selectable means this DPLL may choose the input, so it has to be
>  	 * in this DPLL's priority table -- ref->enabled only says the
>  	 * receiver is powered, which is shared by every DPLL fed from the
>  	 * same lane.  Signal quality is reported through the pin's own
>  	 * attributes rather than by demoting the state, so a lane that is
>  	 * routed here but momentarily in LOS stays selectable.
>  	 */
>  	else if (!chan->mode && (ref->pll_mask & BIT(sitdpll->id)))
>  		*state =3D DPLL_PIN_STATE_SELECTABLE;

[Severity: Medium]
When the PLL is in free-run mode (outer loop disabled), the state getters
can still see chan->locked as true if the outer loss-of-lock bit is clear.

Without verifying !chan->mode here, won't this incorrectly report the pin
as connected while the PLL is actually freely running and ignoring the
reference?

Additionally, because the subsequent branch for the selectable state requir=
es
!chan->mode, are other eligible pins erroneously reported as disconnected
instead of selectable during free-run mode?

[ ... ]
> @@ -433,26 +433,26 @@ static int
>  sit9531x_dpll_input_pin_prio_set(const struct dpll_pin *pin, void *pin_p=
riv,
>  				 const struct dpll_device *dpll, void *dpll_priv,
>  				 u32 prio, struct netlink_ext_ack *extack)
>  {
>  	struct sit9531x_dpll_pin *dpin =3D pin_priv;
>  	struct sit9531x_dpll *sitdpll =3D dpll_priv;
>  	struct sit9531x_dev *sitdev =3D sitdpll->dev;
>  	int rc;
> =20
>  	if (dpin->dir !=3D DPLL_PIN_DIRECTION_INPUT) {
>  		NL_SET_ERR_MSG(extack, "Priority applies only to input pins");
>  		return -EINVAL;
>  	}
> =20
>  	if (prio >=3D SIT9531X_PRIO_MAX_SLOTS) {
>  		NL_SET_ERR_MSG(extack, "Priority out of range (0-10)");
>  		return -EINVAL;
>  	}
> =20
>  	mutex_lock(&sitdev->multiop_lock);
>  	rc =3D sit9531x_input_prio_set(sitdev, sitdpll->id,
>  				     sit9531x_input_hw_src(dpin->id),
>  				     (u8)prio);
>  	mutex_unlock(&sitdev->multiop_lock);

[Severity: High]
This logic updates the priority table unconditionally.

If a pin is currently in the disconnected state, will inserting it into the
hardware priority table cause the PLL to start tracking it automatically if
higher-priority sources fail?

[ ... ]
> @@ -585,18 +585,18 @@ static int
>  sit9531x_dpll_input_pin_phase_offset_get(const struct dpll_pin *pin,
>  					 void *pin_priv,
>  					 const struct dpll_device *dpll,
>  					 void *dpll_priv, s64 *phase_offset,
>  					 struct netlink_ext_ack *extack)
>  {
>  [ ... ]
>  static const struct dpll_pin_ops sit9531x_dpll_input_pin_ops =3D {
>  	.direction_get		=3D sit9531x_dpll_input_pin_direction_get,
>  	.frequency_get		=3D sit9531x_dpll_input_pin_frequency_get,
>  	.state_on_dpll_get	=3D sit9531x_dpll_input_pin_state_on_dpll_get,
>  	.state_on_dpll_set	=3D sit9531x_dpll_input_pin_state_on_dpll_set,
>  	.prio_get		=3D sit9531x_dpll_input_pin_prio_get,
>  	.prio_set		=3D sit9531x_dpll_input_pin_prio_set,
>  	.phase_adjust_get	=3D sit9531x_dpll_input_pin_phase_adjust_get,
>  	.phase_offset_get	=3D sit9531x_dpll_input_pin_phase_offset_get,

[Severity: Low]
Is it intentional to advertise phase adjustment on input pins?

Phase adjustment appears to be an output-only feature in this driver, and
the lack of a phase_adjust_set callback means setting the adjustment
is not supported for inputs.

[ ... ]
> @@ -744,22 +744,22 @@ sit9531x_dpll_intsync_src_state_on_dpll_set(const s=
truct dpll_pin *pin,
>  static int
>  sit9531x_dpll_intsync_dst_state_on_dpll_get(const struct dpll_pin *pin,
>  					    void *pin_priv,
>  					    const struct dpll_device *dpll,
>  					    void *dpll_priv,
>  					    enum dpll_pin_state *state,
>  					    struct netlink_ext_ack *extack)
>  {
>  	struct sit9531x_dpll *sitdpll =3D dpll_priv;
>  	struct sit9531x_dev *sitdev =3D sitdpll->dev;
>  	const struct sit9531x_chan *chan;
> =20
>  	chan =3D sit9531x_chan_state_get(sitdev, sitdpll->id);
> =20
>  	mutex_lock(&sitdev->multiop_lock);
>  	if (sitdev->intsync_src =3D=3D sitdpll->id)
>  		*state =3D DPLL_PIN_STATE_DISCONNECTED;
>  	else if (chan->locked && !chan->inner_lol &&
>  		 chan->selected_ref =3D=3D SIT9531X_INTSYNC_PIN_ID)
>  		*state =3D DPLL_PIN_STATE_CONNECTED;
>  	else if (!chan->mode && sitdev->intsync_src >=3D 0)
>  		*state =3D DPLL_PIN_STATE_SELECTABLE;

[Severity: Medium]
This unconditionally reports the INTSYNC pin as selectable as long as
another PLL is driving INTSYNC and this PLL is in automatic mode.

If userspace previously set the INTSYNC pin to a disconnected state (removi=
ng
it from the priority table), shouldn't this reflect the disconnected state
rather than bypassing the priority table check?

>  	else
>  		*state =3D DPLL_PIN_STATE_DISCONNECTED;
>  	mutex_unlock(&sitdev->multiop_lock);
> =20
>  	return 0;
>  }
> =20
>  /*
>   * sit9531x_dpll_intsync_dst_state_on_dpll_set - lock a PLL to INTSYNC
>   *
>   *   CONNECTED/SELECTABLE -> add INTSYNC to this PLL's priority table
>   *   DISCONNECTED         -> drop INTSYNC from this PLL's priority table
>   *
>   * INTSYNC is an internal net with no physical receiver, so only the
>   * per-PLL priority table is touched; the source pin controls generation.
>   */
>  static int
>  sit9531x_dpll_intsync_dst_state_on_dpll_set(const struct dpll_pin *pin,
>  					    void *pin_priv,
>  					    const struct dpll_device *dpll,
>  					    void *dpll_priv,
>  					    enum dpll_pin_state state,
>  					    struct netlink_ext_ack *extack)
>  {
>  	struct sit9531x_dpll *sitdpll =3D dpll_priv;
>  	struct sit9531x_dev *sitdev =3D sitdpll->dev;
>  	u8 hw_src =3D sit9531x_input_hw_src(SIT9531X_INTSYNC_PIN_ID);
>  	int rc;
> =20
>  	mutex_lock(&sitdev->multiop_lock);
> =20
>  	switch (state) {
>  	case DPLL_PIN_STATE_DISCONNECTED:
>  		rc =3D sit9531x_input_prio_remove(sitdev, sitdpll->id, hw_src);
>  		break;
>  	case DPLL_PIN_STATE_SELECTABLE:
>  	case DPLL_PIN_STATE_CONNECTED:
>  		if (sitdev->intsync_src =3D=3D sitdpll->id) {
>  			NL_SET_ERR_MSG(extack,
>  				       "PLL cannot lock to the INTSYNC it drives");
>  			rc =3D -EINVAL;
>  			break;
>  		}
>  		rc =3D sit9531x_input_prio_add(sitdev, sitdpll->id, hw_src);
>  		break;

[Severity: Medium]
Is it correct to handle DPLL_PIN_STATE_CONNECTED identically to
DPLL_PIN_STATE_SELECTABLE here?

For physical inputs, the driver explicitly rejects connected states because
the device selects references by priority. Accepting it here silently leaves
the hardware in automatic selection mode, mismatched with the userspace
request for an exclusive connection.

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> new file mode 100644
> index 0000000000000..8a0105c8c6472
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/prop.c
[ ... ]
> @@ -245,15 +245,15 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
>  		props->dpll_props.type =3D DPLL_PIN_TYPE_GNSS;
>  		props->dpll_props.capabilities =3D
>  			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
>  		curr_freq =3D sitdev->out[index].freq;
>  	}
> =20
>  	/* Allow phase-adjust over +/-1 ms window.  The subsystem rejects
>  	 * pin_set(phase-adjust, X) when X falls outside [min, max], so
>  	 * leaving these at 0 silently blocks every netlink call.  1 ms is
>  	 * well beyond the DCO dynamic range but costs nothing.
>  	 */
>  	props->dpll_props.phase_range.min =3D -1000000000; /* -1 ms in ps */
>  	props->dpll_props.phase_range.max =3D  1000000000; /* +1 ms in ps */

[Severity: Low]
This unconditionally configures phase range limits for all pins, including
inputs. Since inputs do not support phase adjustment, should these limits
be restricted to output pins?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815221919.6422=
6-1-arouhi@sitime.com?part=3D3
