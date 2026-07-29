Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCD2ECD35
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305562; cv=none; b=fB1gLW12C0DueZ/cnXm+JVqf2TkhhaEbTlB3U6XMI6aadFqj2Eqj4v4X5U5jJTWouQl3+Mrg0b5XCiPFIS5C6lT/t9qffYeMHRFUpnH+H6j+P3oNbxgQmwYkMSxpUhdKXR3/WJFZ1hHD6vG1xNbS8zjllSwo7O0Gz0agWUexILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305562; c=relaxed/simple;
	bh=ohgbAMdQHLfKaSPyOpevqEbe/qZk6ra4+cYLtJgThDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Le6XtGNf2JNB5FIV1SkfaA6gBrxwQPD5xZscXW8QlWd55+CGjcQHucBekfegWn79jLxmoF6RUwS0hezQ4qT7fJHV3L3EU6hgdGYpxAWb4V8lVNpIc/vMgRkWR25mk51gmMmWZ1KimX3nZMMVoN5F4f43KhnBm2wUKweQFOwMKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nj+aQ0Cy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nj+aQ0Cy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDA71F000E9;
	Wed, 29 Jul 2026 06:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785305561;
	bh=j2wJv6DYvyfl3KY8T4Th4JwHLsqMPI++JdTEtGX/xwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nj+aQ0CyUIPRcickMBTdmlLjEKZeQBX8ANPXnen/s3k+fia/4lEyimiYmOxrhR4lJ
	 YfIo7UED/4u3CNGWw3sSwFex2VA1Vbv+rs9KE6xQGgxijtOFkiFVrP4MPS2KAu5lst
	 eYZTDhDTgptEi2Ot+qGPRXi7l8FQJZ3ggMb4G6Dz+6zA9j4Jp87LNjg6dhy2dF1jQc
	 gprEBZhfyb+1LsK3wRtLNxAInuFvjTQzL9ltQ8nYy67qSlwIegUoBPiahugd07YeZg
	 rsvwYuKGfinVO1ZROcyni57ZAwb3jw94/GiXiwYlagVJh73FIzHhejnxSeTeaz1i/+
	 ypnOL3dVTP3cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS5169 USB
 Type-C redriver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729-ps5169-bup-v2-2-203b0a49881a@proton.me>
References: <20260729-ps5169-bup-v2-0-203b0a49881a@proton.me>
 <20260729-ps5169-bup-v2-2-203b0a49881a@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 06:12:40 +0000
Message-Id: <20260729061240.9EDA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The Type-C switch and retimer are registered before their dependen=
cies are initialized, leading to potential crashes or lockdep splats.
- [High] Failed hardware configurations corrupt the cached software state, =
preventing future validation and retries.
- [Medium] Silent failures due to ignored I2C/regmap error returns during d=
evice configuration.
- [Low] Incorrect endianness macro used for memory-to-CPU conversion.
--

--- Patch [2]: [PATCH v2 2/2] usb: typec: Add support for Parade PS5169 USB=
 Type-C redriver ---
commit 63274a3d684029a0da1c1e47cb9856c0a759ba57
Author: Esteban Urrutia <esteuwu@proton.me>

usb: typec: Add support for Parade PS5169 USB Type-C redriver

Add driver for the Parade PS5169, an USB Type-C redriver capable of
handling 10Gb/s USB signals and 8.1Gb/s DisplayPort signals.

> diff --git a/drivers/usb/typec/mux/ps5169.c b/drivers/usb/typec/mux/ps516=
9.c
> index 0000000000000..74cc1504dd357
> --- /dev/null
> +++ b/drivers/usb/typec/mux/ps5169.c
[ ... ]
> +static void ps5169_write(struct redriver *ps5169, unsigned int reg, unsi=
gned int val)
> +{
> +	regmap_write(ps5169->regmap, reg, val);

[Severity: Medium]
Does this function need to handle errors from regmap_write? The error codes
are currently discarded, which might cause the hardware state to fall out of
sync with the software state if an I2C transaction fails.

> +
> +	if (val & PS5169_CONFIG_DP_EN) {
> +		/* Clearing this bit will enable the AUX channel */
> +		regmap_clear_bits(ps5169->regmap, PS5169_AUX_MONITORING_REG,
> +				  PS5169_AUX_MONITORING_BIT);
[ ... ]
> +static int ps5169_set(struct redriver *ps5169)
> +{
> +	bool reverse =3D (ps5169->orientation =3D=3D TYPEC_ORIENTATION_REVERSE);
> +	unsigned int val =3D PS5169_CONFIG_BASE;
> +
> +	switch (ps5169->mode) {
> +	case TYPEC_STATE_SAFE:
> +		ps5169_write(ps5169, PS5169_CONFIG_REG, val);
> +
> +		return 0;

[Severity: Medium]
Is it intentional to return success unconditionally here even if the underl=
ying
I2C writes in ps5169_write() failed?

[ ... ]
> +static int ps5169_switch_set(struct typec_switch_dev *sw, enum typec_ori=
entation orientation)
> +{
> +	struct redriver *ps5169 =3D typec_switch_get_drvdata(sw);
> +	int ret;
> +
> +	ret =3D typec_switch_set(ps5169->typec_switch, orientation);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&ps5169->lock);
> +
> +	if (ps5169->orientation !=3D orientation) {
> +		ps5169->orientation =3D orientation;
> +
> +		ret =3D ps5169_set(ps5169);
> +	}

[Severity: High]
If ps5169_set() fails here, ps5169->orientation is already updated. Will th=
is
prevent future validation and retries since the driver might skip hardware
configuration on a subsequent retry with the same orientation?

> +
> +	mutex_unlock(&ps5169->lock);
> +
> +	return ret;
> +}
> +
> +static int ps5169_retimer_set(struct typec_retimer *retimer, struct type=
c_retimer_state *state)
> +{
> +	struct redriver *ps5169 =3D typec_retimer_get_drvdata(retimer);
> +	struct typec_mux_state mux_state;
> +	int ret =3D 0;
> +
> +	mutex_lock(&ps5169->lock);
> +
> +	if (ps5169->mode !=3D state->mode) {
> +		ps5169->mode =3D state->mode;
> +
> +		if (state->alt)
> +			ps5169->svid =3D state->alt->svid;
> +		else
> +			ps5169->svid =3D 0; // No SVID
> +
> +		ret =3D ps5169_set(ps5169);
> +	}

[Severity: High]
Similar to ps5169_switch_set(), if ps5169_set() fails here, ps5169->mode and
ps5169->svid are already updated. Does this need to be reverted on failure =
to
prevent desynchronization?

Also, is it intentional that SVID updates are completely ignored if the mode
does not change?

> +
> +	mutex_unlock(&ps5169->lock);
[ ... ]
> +static int ps5169_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D regmap_raw_read(ps5169->regmap, PS5169_CHIP_ID_REG, &chip_id, s=
izeof(chip_id));
> +	if (ret) {
> +		dev_err(dev, "Failed to read chip ID\n");
> +		goto vcc_disable;
> +	}
> +	chip_id =3D cpu_to_le16(chip_id);

[Severity: Low]
Could this be le16_to_cpu() instead of cpu_to_le16()? While mathematically
identical, cpu_to_le16() assigns a little-endian type (__le16) back to a
CPU-native u16 variable, which might cause sparse warnings and semantic
confusion.

> +
> +	/* Compare chip IDs */
> +	if (chip_id !=3D PS5169_CHIP_ID) {
> +		dev_err(dev, "Unexpected chip ID 0x%04x\n", chip_id);
> +		ret =3D -EINVAL;
> +		goto vcc_disable;
> +	}
> +
> +	/* Read chip revision */
> +	ret =3D regmap_raw_read(ps5169->regmap, PS5169_CHIP_REVISION_REG, &chip=
_revision,
> +			      sizeof(chip_revision));
> +	if (ret) {
> +		dev_err(dev, "Failed to read chip revision\n");
> +		goto vcc_disable;
> +	}
> +	dev_dbg(dev, "Found PS5169 with chip revision 0x%04x\n", cpu_to_le16(ch=
ip_revision));

[Severity: Low]
Similar to the chip_id reading above, should this use le16_to_cpu() when
passing the value to the string format expecting a CPU-native unsigned int?

> +
> +	ret =3D drm_aux_bridge_register(dev);
[ ... ]
> +	/* orientation-switch */
> +	switch_desc.drvdata =3D ps5169;
> +	switch_desc.fwnode =3D dev_fwnode(dev);
> +	switch_desc.set =3D ps5169_switch_set;
> +
> +	ps5169->sw =3D typec_switch_register(dev, &switch_desc);
> +	if (IS_ERR(ps5169->sw)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(ps5169->sw), "Failed to register sw=
itch\n");
> +		goto vcc_disable;
> +	}
> +
> +	/* retimer-switch */
> +	retimer_desc.drvdata =3D ps5169;
> +	retimer_desc.fwnode =3D dev_fwnode(dev);
> +	retimer_desc.set =3D ps5169_retimer_set;
> +
> +	ps5169->retimer =3D typec_retimer_register(dev, &retimer_desc);
> +	if (IS_ERR(ps5169->retimer)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(ps5169->retimer), "Failed to regist=
er retimer\n");
> +		goto switch_unregister;
> +	}
> +
> +	/* Read properties from DT */
> +	ps5169->aux_rx_data_reverse =3D device_property_read_bool(dev, "parade,=
aux-rx-data-reverse");
> +	ps5169->tune_lfps =3D device_property_read_bool(dev, "parade,fine-tune-=
lfps-swing");
> +	ps5169->dp_set_gain =3D device_property_read_bool(dev, "parade,dp-set-g=
ain");
> +	ps5169->usb_rx_set_gain =3D device_property_read_bool(dev, "parade,usb-=
rx-set-gain");
> +	ps5169->usb_tx_set_gain =3D device_property_read_bool(dev, "parade,usb-=
tx-set-gain");
> +
> +	ps5169_init(ps5169);
> +
> +	mutex_init(&ps5169->lock);

[Severity: High]
Can the subsystem invoke a state change callback (like ps5169_switch_set or
ps5169_retimer_set) as soon as the switch and retimer are registered? If so,
could those callbacks execute before mutex_init(&ps5169->lock) is called he=
re,
leading to a crash or lockdep splat since they attempt to lock this uniniti=
alized
mutex?

> +
> +	i2c_set_clientdata(client, ps5169);
> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-ps5169-bup=
-v2-0-203b0a49881a@proton.me?part=3D2
