Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE64C77CF
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322359; cv=none; b=eeXFu70So3t674NMY61UrbNruYKkhjfUCwDSeXYTAYtZFbWpMlxFCeDTW2xBKu5Poen4ID3pAGmcEZstcp5P1yTd+2uAHubfnYp64pwcPOpt3wo1kUlgUEdiU7wEmCbw21vzMOOIfd+bFXAQjNP8F+mSRcNFmXdQSYstPLLMj2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322359; c=relaxed/simple;
	bh=PmBl+8ud7w6fSqXXYktqoln+l3RWqSRt57z5aR/8ICA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HKEqfazptSBUYB5fDlQqGs6RHClewCN75SvOzEDDiPje83Sv/7JQEHmEBsW4X/HBODi5TJIsmLbiEGUduSR6noAWeOeccpATZrw5x+kEOJOjOZQQYo104WgxvzoM/qxWyLHDGr5bAJ/ZyXzeKoIRdD6gj++oVxhtqtjjS1E3RJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHlquK69; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHlquK69"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195141F00A3A;
	Fri, 21 Aug 2026 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787322358;
	bh=VHw/ST75GXAFHXuCK13BJDwv4lv+hYF/WZKhFMWDpPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GHlquK69f+3HLGdTCaAXWD3CvkBP07PoWfBdT1utvRLOO8k3K1udX4nq41eywwOJx
	 Er2jWBWYSZJWJzmkiUf9YpWQRZCXGZM8AgPN1usmbR/j3tfIqQlKO7TTiNacnMtGmg
	 aRx6ke9bwION0l4ksKt2oN+HDPQtCPf4tgaIkYdsGcNu4c3iitXvLrbBEd6LEPXHLY
	 ligBkGzNqSlIsU4B+vEMT8s24E0T5PLY+t/Nxg0dkKCC5KJDEQq70zIEO+U4exNBQT
	 i2WDlGnlEnP00hGeM2iyQn8Eqw+HuEarUtOFuINydB3+G5PzgYPWVcoa8LL7X6mkpi
	 grKgZllB7Y1xA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next v2 2/2] net: pse-pd: Add LTC4266 PSE
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Swenson" <kyle.swenson@est.tech>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820142429.2285172-3-kyle.swenson@est.tech>
References: <20260820142429.2285172-1-kyle.swenson@est.tech>
 <20260820142429.2285172-3-kyle.swenson@est.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 14:25:57 +0000
Message-Id: <20260821142558.195141F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] I2C read failures in the IRQ handler silently discard clear-on-rea=
d hardware events and return 0, risking an IRQ storm.
- [High] Incorrect devres registration sequence exposes the PSE controller =
before initialization completes and induces use-after-free during teardown.
- [Medium] Admin power limit configuration is inappropriately bounded by th=
e currently connected PD class, preventing configuration on idle ports.
- [Medium] `ltc4266_pi_get_voltage` returns the voltage in microvolts (uV) =
instead of millivolts (mV).
- [Medium] Routine PD disconnections trigger an unconditional `dev_err` log.
- [Medium] Premature rounding in power calculation causes unnecessary preci=
sion loss.
--

--- Patch [2]: [RFC PATCH net-next v2 2/2] net: pse-pd: Add LTC4266 PSE con=
troller driver ---
commit 5319fc10897e2c97c798780d619129c31798bf5a
Author: Kyle Swenson <kyle.swenson@est.tech>

net: pse-pd: Add LTC4266 PSE controller driver

Add a new driver for the Linear Technology LTC4266 I2C Power Sourcing
Equipment controller and integrate with the PSE controller core. The
LTC4266 supports Type 1 and Type 2 Powered Devices.

> diff --git a/drivers/net/pse-pd/ltc4266.c b/drivers/net/pse-pd/ltc4266.c
> new file mode 100644
> index 0000000000000..2f9c37ebf1d29
> --- /dev/null
> +++ b/drivers/net/pse-pd/ltc4266.c

[ ... ]

> +static int ltc4266_pi_get_voltage(struct pse_controller_dev *pcdev, int =
id)
> +{
> +	return ltc4266_read_iv(ltc4266_pi_port(pcdev, id), READ_VOLTAGE);
> +}

[Severity: Medium]
ltc4266_read_iv() returns the voltage in microvolts. Does the PSE core API
expect this value in millivolts instead?

Returning microvolts here might cause ethtool to display a voltage 1000 tim=
es
larger than the actual value.

[ ... ]

> +static int ltc4266_pi_get_actual_pw(struct pse_controller_dev *pcdev, in=
t id)
> +{
> +	struct ltc4266_port *port =3D ltc4266_pi_port(pcdev, id);
> +	int uA, uV;
> +	u64 uW;
> +
> +	uA =3D ltc4266_read_iv(port, READ_CURRENT);
> +	if (uA < 0)
> +		return uA;
> +
> +	uV =3D ltc4266_read_iv(port, READ_VOLTAGE);
> +	if (uV < 0)
> +		return uV;
> +
> +	/* Convert uA to mA and uV to mV; mA * mV =3D uW */
> +	uW =3D DIV_ROUND_CLOSEST_ULL(uA, 1000) * DIV_ROUND_CLOSEST_ULL(uV, 1000=
);
> +
> +	return (int)DIV_ROUND_CLOSEST_ULL(uW, 1000);
> +}

[Severity: Medium]
Could this calculation cause unnecessary precision loss?

Since uA * uV safely fits within a 64-bit unsigned integer, perhaps the
multiplication could happen before dividing by 1000 to avoid up to a 10%
mathematical error for smaller loads?

[ ... ]

> +static int ltc4266_pi_get_pw_limit_ranges(struct pse_controller_dev *pcd=
ev, int id,
> +					  struct pse_pw_limit_ranges *pw_limit_ranges)
> +{
> +	struct ethtool_c33_pse_pw_limit_range *c33_pw_limit_ranges;
> +	int class_pw_limit;
> +
> +	c33_pw_limit_ranges =3D kzalloc_obj(*c33_pw_limit_ranges);
> +	if (!c33_pw_limit_ranges)
> +		return -ENOMEM;
> +
> +	class_pw_limit =3D  ltc4266_port_max_pw(ltc4266_pi_port(pcdev, id));
> +	if (class_pw_limit < 0)
> +		class_pw_limit =3D 0;
> +
> +	c33_pw_limit_ranges[0].min =3D LTC4266_PW_LIMIT_MIN;
> +	c33_pw_limit_ranges[0].max =3D class_pw_limit ? class_pw_limit : LTC426=
6_PW_LIMIT_MAX;

[Severity: Medium]
This bounds the advertised maximum limit by the currently connected device
class. Will this prevent users from configuring an administrative power lim=
it
for a higher-class device on an idle port?

[ ... ]

> +static int ltc4266_pi_set_pw_limit(struct pse_controller_dev *pcdev,
> +				   int id, int max_mw)
> +{
> +	struct ltc4266_port *port =3D ltc4266_pi_port(pcdev, id);
> +	int class_pw_limit;
> +	int class;
> +	int icut;
> +	int ret;
> +
> +	class =3D ltc4266_port_get_class(port);
> +	if (class < 0)
> +		return class;
> +
> +	class_pw_limit =3D ltc4266_class_pw[class];
> +
> +	if (max_mw < LTC4266_PW_LIMIT_MIN || max_mw > class_pw_limit) {

[Severity: Medium]
Similar to the range function above, tying the administrative configuration
to the instantaneously connected device class seems to prevent configuring
limits on an idle port.

Should administrative limits be independent of the current PD state so
they can restrict future connected devices?

[ ... ]

> +static int ltc4266_map_event(int irq, struct pse_controller_dev *pcdev,
> +			     unsigned long *notifs, unsigned long *notifs_mask)
> +{
[ ... ]
> +	if (intstat & (LTC4266_INT_DIS | LTC4266_INT_TCUT)) {
> +		ret =3D regmap_read(ltc4266->regmap, LTC4266_REG_FLTEVN_COR, &fltevn);
> +		if (ret < 0) {
> +			dev_err(&ltc4266->client->dev, "Failed to read fltevn err=3D%d\n", re=
t);
> +			goto done;
> +		}
> +	}
[ ... ]
> +			if ((tsevn & (LTC4266_EVN_LO(chan) | LTC4266_EVN_HI(chan))) ||
> +			    (fltevn & LTC4266_EVN_LO(chan)))
> +				notifs[i] |=3D ETHTOOL_PSE_EVENT_OVER_CURRENT;
> +
> +			dev_err(&ltc4266->client->dev, "tsevn=3D0x%02X fltevn=3D0x%02X\n",
> +				tsevn, fltevn);
> +			continue;

[Severity: Medium]
Does this code unconditionally print a dev_err() for routine device
disconnections?

It seems like this might generate spurious error logs whenever a user simply
unplugs a cable from the device.

[ ... ]

> +done:
> +	ltc4266_enable_interrupts(ltc4266);
> +	return 0;
> +}

[Severity: High]
If the I2C read fails in the IRQ handler here, the clear-on-read interrupt
status register is not cleared at the hardware level.

Because the handler jumps to done and re-enables the top-level interrupts,
could this cause an immediate IRQ storm that locks up the system since the
hardware will continually reassert the unhandled event?

[ ... ]

> +static int ltc4266_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D devm_pse_controller_register(ltc4266->dev, &ltc4266->pcdev);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +						"Failed to register PSE controller\n");
> +
> +	if (client->irq) {
> +		struct pse_irq_desc irq_desc =3D {
> +			.name =3D "ltc4266-irq",
> +			.map_event =3D ltc4266_map_event,
> +		};
> +
> +		/* Enable the interrupt pin, and only report detect events on
> +		 * change (detchg) so idle ports continuously re-running
> +		 * detection in semi-auto mode don't flood the host with a
> +		 * detect event every cycle.
> +		 */
> +		regmap_update_bits(ltc4266->regmap, LTC4266_REG_MCONF,
> +				   LTC4266_MCONF_INTERRUPT_ENABLE | LTC4266_MCONF_DETCHG,
> +				   LTC4266_MCONF_INTERRUPT_ENABLE | LTC4266_MCONF_DETCHG);
> +
> +		ret =3D devm_pse_irq_helper(&ltc4266->pcdev, client->irq,
> +					  0, &irq_desc);

[Severity: High]
The controller is registered with devres before the IRQ helper. Since devres
tears down resources in reverse order (LIFO), wouldn't the IRQ be freed
before the controller is unregistered?

If pse_controller_unregister() tries to disable the IRQ using pcdev->irq
during teardown, it might operate on a freed IRQ descriptor. Could this lead
to a use-after-free or accidentally disable an unrelated IRQ?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820142429.2285=
172-1-kyle.swenson@est.tech?part=3D2
