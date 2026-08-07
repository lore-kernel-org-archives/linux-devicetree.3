Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314792D2397
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786145102; cv=none; b=Wc53ChsLE0Drgzju8zhrYzF1WWUOjCuzQfM1Hj2R0YMG+gKWjsh0jvVc56/PRSTwu+I5nzzoFAd5zCv+jhNQ3et2SAJjJBbHoRbTbCPZpaVsnEU9Dd+MClrftZBw6iIngySNYgrDCPAEku1YKmxP0f+nZusagju+hSTQpoQWhHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786145102; c=relaxed/simple;
	bh=5Jb63LovCuCOMXD1VXb8EAcw+CkU3oHRD76Hc1YYeJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AgcQZAsJELiH5ZVfACj8zMTN9jPfC+yvIru7kXw9A+o9Fb9oTqZAD5qqdQZkeEbm7v3gVDrU2TJQHyXliGC1BSHTT3gf+GYP3zZt7AOMN4OVxE1iVX295wPdAeZZj9IZRiGVXjxI62mBi1ATu1wwP2Q5Km1NwNNv3lcDCtQCNcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3AHZtXR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3AHZtXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A217C1F000E9;
	Fri,  7 Aug 2026 23:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786145100;
	bh=x5pgKMQ+rhM8PiLaBjonurXKxVcaZTz0jOI+f5trfkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J3AHZtXR38KEg0jczH/A2p/uWD1Eap2abYY8/Q2jzKWj6CN2nbdPOOhLRwcMqT20K
	 yq/VfNDpf+EkRiSMg5BSiFQUYlSAtVmM0Y+6A+VkiYVPKkd1KhqgQFMfy++5+vfRSl
	 4Cf4qf1kF+SZxU/Ci2gxJSw6W0Ty+J7/Q6jxXFiMpJ0Aw+UmpgiHZuJNv4fELmyrpk
	 rDCO4dqWx7qF1g2dbaiV6mRQvWG4Ff+5KyY1Rg6fWUl0pFfsNMFXDkJ6hykYuF9LXl
	 3j9NvcEmJbh2qzCFSFZ2Q4enRumr8NY2ZDG2OVBk7WLIzKl0yeZFPOjHxRZ6fgWAqX
	 8FJxLybHT7plA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806232439.27551-4-arouhi@sitime.com>
References: <20260806232439.27551-1-arouhi@sitime.com>
 <20260806232439.27551-4-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 23:24:59 +0000
Message-Id: <20260807232500.A217C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] The DPLL pin properties are freed immediately after registrati=
on, causing a Use-After-Free when the DPLL subsystem accesses them.
- [High] The embedded sync (esync) feature fails to activate because the ha=
rdware pulser mode is never enabled.
- [Medium] The DCO (digitally controlled oscillator) adjustment feature is =
implemented but never hooked into the DPLL subsystem, making it dead code.
- [Low] Comment falsely claims all outputs are bound to DPLL 0, contradicti=
ng the implemented logic.
- [Low] Comments erroneously describe byte order as 'big-endian' when the c=
ode correctly implements it as Little-Endian.
--

--- Patch [3]: [PATCH net-next v4 3/3] dpll: add SiTime SiT9531x DPLL clock=
 driver ---
commit 254cd6abf86b3bbdd7f42035ec2ed9c191f48a3b
Author: Ali Rouhi <arouhi@sitime.com>
Subject: dpll: add SiTime SiT9531x DPLL clock driver

Add a DPLL subsystem driver for the SiTime SiT95316 and SiT95317
clock generators. The driver reads all configuration from the device's
on-chip NVM at probe time.

diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
--- a/drivers/dpll/sit9531x/core.c
+++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> +static int sit9531x_dco_read_divn2(struct sit9531x_dev *sitdev, u8 pll_i=
dx,
> +				   s64 *n2_int, u32 *n2_fracn, u32 *n2_fracd)
> +{
> +	int rc, i;
> +	u8 v;
> +
> +	/* Integer part (5 bytes, big-endian: 0x42 is MSB) */
> +	*n2_int =3D 0;
> +	for (i =3D 4; i >=3D 0; i--) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DIVN2_INT + i, &v);

[Severity: Low]
Does this comment accurately reflect the byte order? The loop processes byte
0x42 first and stores it as the most significant byte, which means the MSB
is at the highest memory address. This matches little-endian rather than
big-endian byte order.

[ ... ]
> +int sit9531x_dco_adjust(struct sit9531x_dev *sitdev, u8 pll_idx, s64 ppb)
> +{

[Severity: Medium]
Is the digitally controlled oscillator (DCO) adjustment feature accessible
from userspace? The commit message mentions DCO frequency adjustment suppor=
t,
and this function implements the fractional divider steering. However,
sit9531x_dco_adjust() does not appear to be hooked into the DPLL subsystem
callbacks (such as .ffo_get / .ffo_set).

[ ... ]
diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
--- a/drivers/dpll/sit9531x/dpll.c
+++ b/drivers/dpll/sit9531x/dpll.c
[ ... ]
> +static int
> +sit9531x_dpll_output_pin_frequency_set(const struct dpll_pin *pin,
> +				       void *pin_priv,
> +				       const struct dpll_device *dpll,
> +				       void *dpll_priv, u64 frequency,
> +				       struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll_pin *dpin =3D pin_priv;
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +	u8 actual_pll;
> +	int rc;
> +
> +	/* Use the actual PLL that drives this output (populated by
> +	 * out_state_fetch from the chip's OUT_MAP registers), not the
> +	 * DPLL device id -- in our current registration all outputs are
> +	 * bound to DPLL 0 for convenience, but physically they may be
> +	 * driven by PLL A/B/C/D with different Fvco.
> +	 */

[Severity: Low]
Is the comment about all outputs being bound to DPLL 0 still accurate?
In sit9531x_dpll_pin_is_registrable(), output pins seem to be dynamically
bound to the DPLL device that physically drives them rather than being
statically bound to DPLL 0.

[ ... ]
> +static int
> +sit9531x_dpll_output_pin_esync_set(const struct dpll_pin *pin,
> +				   void *pin_priv,
> +				   const struct dpll_device *dpll,
> +				   void *dpll_priv,
> +				   u64 freq,
> +				   struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	rc =3D sit9531x_output_freq_set(sitdev, dpin->id, actual_pll,
> +				      SIT9531X_ESYNC_FREQ_10MHZ);
> +	/*
> +	 * Program the pulse generator (PROG0 PULSE_CTRL) so the embedded-sync
> +	 * pulse is actually emitted; without it the output carries the clock
> +	 * but no esync marker.  SIT9531X_ESYNC_PULSE_DEFAULT is the same duty
> +	 * the esync_get callback advertises.
> +	 */
> +	if (!rc)
> +		rc =3D sit9531x_output_pulse_ctrl_set(sitdev, dpin->id,
> +						    SIT9531X_ESYNC_PULSE_DEFAULT);
> +	if (!rc)
> +		rc =3D sit9531x_output_enable(sitdev, dpin->id);

[Severity: High]
Will the embedded sync feature emit pulses without enabling the pulser
hardware mode? The callback configures the pulse control byte, but does not
call sit9531x_pll_sysref_mode_set() to transition the underlying PLL into
the pulser mode and enable the SYSREF output buffer.

[ ... ]
> +static int sit9531x_dpll_pin_register(struct sit9531x_dpll_pin *pin,
> +				      u32 index)
> +{
> +	struct sit9531x_dpll *sitdpll =3D pin->dpll;
> +	struct sit9531x_pin_props *props;
> +	const struct dpll_pin_ops *ops;
> +	int rc;
> +
> +	/* Get pin properties from firmware nodes */
> +	props =3D sit9531x_pin_props_get(sitdpll->dev, pin->dir, pin->id);
> +	if (IS_ERR(props))
> +		return PTR_ERR(props);
> +
> +	/* Save package label and firmware node */
> +	strscpy(pin->label, props->package_label, sizeof(pin->label));
> +	pin->fwnode =3D fwnode_handle_get(props->fwnode);
> +	pin->esync_control =3D props->esync_control;
> +
> +	/* Create or get existing DPLL pin */
> +	pin->dpll_pin =3D dpll_pin_get(sitdpll->dev->clock_id, index,
> +				     THIS_MODULE, &props->dpll_props,
> +				     &pin->tracker);
> +	if (IS_ERR(pin->dpll_pin)) {
> +		rc =3D PTR_ERR(pin->dpll_pin);
> +		goto err_pin_get;
> +	}
> +	dpll_pin_fwnode_set(pin->dpll_pin, props->fwnode);
> +
> +	ops =3D sit9531x_dpll_pin_ops_get(pin);
> +
> +	/* Register the pin */
> +	rc =3D dpll_pin_register(sitdpll->dpll_dev, pin->dpll_pin, ops, pin);
> +	if (rc)
> +		goto err_register;
> +
> +	/* Free pin properties */
> +	sit9531x_pin_props_put(props);

[Severity: Critical]
Could this sequence cause a use-after-free when the DPLL subsystem accesses
the pin properties?

The sit9531x_pin_props_get() function dynamically allocates the
freq_supported array and stores it in props->dpll_props.freq_supported.
The dpll_pin_get() function performs a shallow copy of the struct, keeping
the raw pointers.

Immediately after dpll_pin_register(), sit9531x_pin_props_put(props) is
called, which frees the freq_supported array and the props struct, leaving
the DPLL core with dangling pointers.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806232439.2755=
1-1-arouhi@sitime.com?part=3D3
