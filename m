Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AEB3F2100
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643768; cv=none; b=NjC+xY44L18+E194LdC/8o1Ev3UZQY6IacHiXqRtUeY465Ek5Cy1sviPlBi1RWG4M6VdkwOikNbLI1MZ0lBXSQtVPXqEuKTGbeee6sC+HjBtB1AxiouCJKq4XofySpG6f0KUU1AYVuEXvZm6eRLsm4bSaZJ5HYGQyi67511VkpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643768; c=relaxed/simple;
	bh=/MG4w5vYohnVZiZCpla+/LhOQuPeP192SwY7ui51dd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QdVsVGD19jt3sFC4NDXEoQxm2nkNhs0QMcPqrjJu8b3jNbONW3/EiJlP3Dypx2OuqOw4es6w4cAst7t3wqKo7eJTO3966IKLAVGFSGbY5JflUkxSMju553Nt12JWKq4mZIVRp/ah5rSKVcFqPdLDOI1/Exop3IWpgBF8H673XVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlR17Jzi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlR17Jzi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57C31F000E9;
	Thu, 13 Aug 2026 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786643762;
	bh=9WWI1pH3buMCCv7ZhpPO4JiErDXVMw7b3muT9Z0Rav4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UlR17JziW3SjIxsRwQnU0o21moBkulzrC6R51BghB74ZGfpsIMs4B2Iec6Q/VgnKP
	 1IH0a38+ETTnytRnI9DgMAW0+1tAa//WOla1g52EgPyBrlWXv8k17tAPP3s/Srq6BN
	 UtpJuzqezQY2RpOknf6NRRxYdVUxLo6VoEnIKg+CzBecpAJr9DXcBrkYrj8iwgZSOW
	 9CkQ7j8/FXk5dScopDBcpGvsQV+0ESIQBnSDoSfsY+wplAht6cokSTsFyd/zn14sma
	 nLD/EfXcI5aS9VfZEzb7B6aZZP6gkx5sKyry12sFXo5DxrQjtBddmNqonTjdI1B8wK
	 99LX+0ZMKh01A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260812175337.18155-4-arouhi@sitime.com>
References: <20260812175337.18155-1-arouhi@sitime.com>
 <20260812175337.18155-4-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 17:56:01 +0000
Message-Id: <20260813175601.D57C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Use-After-Free of Pin Properties and Frequency Arrays
- [High] State Mismatch / Logic Flaw in Pin Getters
- [High] Destructive Priority Overwrite in Hardware Table
- [High] Use-After-Free on Probe Error Path Due to Missing DPLL Unregistrat=
ion
- [Medium] Silent Failure on Manual Pin Connection Request
- [Medium] Missing SYSREF/SYNCB/Pulser Features
- [Medium] Hardware Routing Loop via INTSYNC
--

--- Patch [3]: [PATCH net-next v6 3/3] dpll: add SiTime SiT9531x DPLL clock=
 driver ---
commit 841a91aff3f30b8a2e2bee8952633134d7bbdee2
Author: Ali Rouhi <arouhi@sitime.com>
Subject: dpll: add SiTime SiT9531x DPLL clock driver
Summary: This commit adds a DPLL subsystem driver for the SiTime SiT95316
and SiT95317 clock generators. It supports hardware state monitoring, prior=
ity
management, and frequency/phase configuration.

>  - SYSREF/SYNCB/Pulser output mode control

[Severity: Medium]
Is this functionality fully exposed to userspace? The commit message mentio=
ns
support for SYSREF/SYNCB/Pulser modes, but looking at the driver,
sit9531x_output_pulse_ctrl_set() only appears to be called with a hardcoded
default during embedded sync setup. It looks like the other modes might not
be reachable.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 0000000000000..711ab16b0897a
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/core.c

[ ... ]

> @@ -596,32 +596,25 @@ int sit9531x_input_prio_set(struct sit9531x_dev *si=
tdev, u8 pll_idx,
> =20
>  	usleep_range(10000, 12000);
> =20
>  	/*
>  	 * Write the requested slot on Page 1, then fill the remaining
>  	 * slots with the same source, matching the procedure script's
>  	 * backfill behaviour.
>  	 */
>  	for (slot =3D prio; slot < SIT9531X_PRIO_MAX_SLOTS; slot++) {
>  		reg =3D sit9531x_prio_reg(pll_idx, slot);
> =20
>  		rc =3D sit9531x_read_u8(sitdev, reg, &val);
>  		if (rc)
>  			goto commit;
> =20
>  		val =3D sit9531x_prio_slot_set(val, slot, input_idx);

[Severity: High]
Does this loop unintentionally wipe out fallback configurations? When users=
pace
sets a priority, this loop fills not only the requested slot but also all
lower-priority slots with the exact same input source. This appears to dest=
roy
any other fallback inputs the user might have configured in the hardware ta=
ble.

[ ... ]

> @@ -2496,25 +2496,15 @@ int sit9531x_dev_start(struct sit9531x_dev *sitde=
v)
>  	if (rc)
>  		return rc;
> =20
>  	list_for_each_entry(sitdpll, &sitdev->dplls, list) {
>  		rc =3D sit9531x_dpll_register(sitdpll);
>  		if (rc) {
>  			dev_err_probe(sitdev->dev, rc,
>  				      "Failed to register DPLL%u\n",
>  				      sitdpll->id);
>  			return rc;
>  		}
>  	}

[ ... ]

> @@ -2825,18 +2815,10 @@ static void sit9531x_dpll_list_free(struct sit953=
1x_dev *sitdev)
>  {
>  	struct sit9531x_dpll *sitdpll, *next;
> =20
>  	list_for_each_entry_safe(sitdpll, next, &sitdev->dplls, list) {
>  		list_del(&sitdpll->list);
>  		sit9531x_dpll_free(sitdpll);
>  	}
>  }

[Severity: High]
Could this error path leave the DPLL subsystem with dangling pointers? If
sit9531x_dpll_register() succeeds for the first DPLL but fails for the next,
sit9531x_dev_start() returns an error without unwinding the already
registered DPLLs. The error handler in sit9531x_devm_dpll_init() then calls
sit9531x_dpll_list_free() to free the backing memory directly, bypassing
dpll_device_unregister() and dpll_pin_unregister().

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index 0000000000000..364f870ac3041
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -259,32 +259,25 @@ static int
>  sit9531x_dpll_input_pin_state_on_dpll_get(const struct dpll_pin *pin,
>  					  void *pin_priv,
>  					  const struct dpll_device *dpll,
>  					  void *dpll_priv,
>  					  enum dpll_pin_state *state,
>  					  struct netlink_ext_ack *extack)
>  {

[ ... ]

>  	if (chan->locked && !chan->inner_lol &&
>  	    chan->selected_ref =3D=3D dpin->id)
>  		*state =3D DPLL_PIN_STATE_CONNECTED;
>  	/* In auto mode, enabled inputs with good signal are selectable */
>  	else if (!chan->mode && ref->enabled && !ref->los && !ref->oof)
>  		*state =3D DPLL_PIN_STATE_SELECTABLE;
>  	else
>  		*state =3D DPLL_PIN_STATE_DISCONNECTED;

[Severity: High]
Might this logic report an incorrect routing state? The ref->enabled flag
represents a global physical state for the pin. If DPLL A requests an input
and enables the receiver, DPLL B will also see ref->enabled as true and
report the pin as DPLL_PIN_STATE_SELECTABLE, even if that pin isn't in DPLL
B's priority table.

Additionally, if a signal is lost (ref->los becomes true), this drops the
state to DPLL_PIN_STATE_DISCONNECTED. Does the DPLL API expect degraded pins
to still show as logically connected or selectable rather than entirely
disconnected?

[ ... ]

> @@ -326,32 +319,25 @@ static int
>  sit9531x_dpll_input_pin_state_on_dpll_set(const struct dpll_pin *pin,
>  					  void *pin_priv,
>  					  const struct dpll_device *dpll,
>  					  void *dpll_priv,
>  					  enum dpll_pin_state state,
>  					  struct netlink_ext_ack *extack)
>  {

[ ... ]

>  	switch (state) {
>  	case DPLL_PIN_STATE_DISCONNECTED:
>  		rc =3D sit9531x_input_prio_remove(sitdev, sitdpll->id, hw_src);
>  		if (rc)
>  			break;
>  		ref->pll_mask &=3D ~pll_bit;
>  		if (ref->pll_mask)
>  			rc =3D 0;	/* another DPLL still uses this input */
>  		else
>  			rc =3D sit9531x_input_disable(sitdev, dpin->id);
>  		break;
>  	case DPLL_PIN_STATE_SELECTABLE:
>  	case DPLL_PIN_STATE_CONNECTED:
>  		rc =3D sit9531x_input_enable(sitdev, dpin->id);
>  		if (rc)
>  			break;
>  		rc =3D sit9531x_input_prio_add(sitdev, sitdpll->id, hw_src);

[Severity: Medium]
Should DPLL_PIN_STATE_CONNECTED enforce a manual lock here? It appears to
fall through to the exact same logic as DPLL_PIN_STATE_SELECTABLE, adding
the input to the priority table but leaving the hardware in automatic
selection mode instead of forcing a connection.

[ ... ]

> @@ -651,32 +637,25 @@ static int
>  sit9531x_dpll_intsync_src_state_on_dpll_set(const struct dpll_pin *pin,
>  					    void *pin_priv,
>  					    const struct dpll_device *dpll,
>  					    void *dpll_priv,
>  					    enum dpll_pin_state state,
>  					    struct netlink_ext_ack *extack)
>  {

[ ... ]

>  	switch (state) {
>  	case DPLL_PIN_STATE_CONNECTED:
>  		if (sitdev->intsync_src =3D=3D sitdpll->id)
>  			break;
>  		if (sitdev->intsync_src >=3D 0) {
>  			NL_SET_ERR_MSG(extack,
>  				       "INTSYNC is already sourced by another PLL");
>  			rc =3D -EBUSY;
>  			break;
>  		}
>  		rc =3D sit9531x_intsync_enable(sitdev, sitdpll->id);

[Severity: Medium]
Is there a protection missing here against hardware routing loops? While the
destination getter correctly prevents adding INTSYNC to a PLL's priority
table if that PLL is already the source, this function doesn't seem to check
if the PLL already has INTSYNC as a destination before making it the source.
Could userspace configure a PLL to source from INTSYNC and then drive INTSY=
NC
with the same PLL?

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> index 0000000000000..8a0105c8c6472
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/prop.c

[ ... ]

> @@ -357,10 +357,8 @@ void sit9531x_pin_props_put(struct sit9531x_pin_prop=
s *props)
>  {
>  	kfree(props->dpll_props.freq_supported);
> =20
>  	if (props->fwnode)
>  		fwnode_handle_put(props->fwnode);
> =20
>  	kfree(props);
>  }

[Severity: Critical]
Will this lead to a use-after-free when userspace queries the pin propertie=
s?
The sit9531x_pin_props_get() function dynamically allocates both the props
structure and the freq_supported array. When passed into dpll_pin_get()
in sit9531x_dpll_pin_register(), the DPLL core retains those pointers.
Since sit9531x_pin_props_put() immediately frees these allocations on the
success path, it looks like the DPLL core might be left holding dangling
pointers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812175337.1815=
5-1-arouhi@sitime.com?part=3D3
