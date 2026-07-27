Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FCA36DA14
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141032; cv=none; b=RlJzERcm9LwJ3GD77NzL46hmA8KcsngsjgZseV/QnwA7u/t0dgsH8+gZEnBuEG/2nYVbZ4Vpwh0o9XYJxPNMhOzh/pVXD2KKzRRWNrb/W/5IiuE0R1gQ/k/wTsgm2povrgJbhvyDt4KU9MUAni0vwjM4Y0RxIpp0aUSaGXouBC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141032; c=relaxed/simple;
	bh=tWbjQxGKB4HjbEflqNOhaNrg1IutW5Xb+ltLBLa533o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nQJ9hkY5TAaMbmhpB2iGWcPu2HPYaCdwJ4bDMuEvVtw11l3pcWdJXY2mte1wP2qazK+OLP8Gjt3UPPHFNlNIPwLYU3UIxhjyy6vds6/a5dNaAK+XId9mETLjrd/x4WO/58r4lPdDYIWNQp9kB43RvHMXaHq06pqGZQ+G1u1k64Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBBNWw8o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBBNWw8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895F31F000E9;
	Mon, 27 Jul 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141030;
	bh=pL4PNOe2c4AwJa+hN0nVWbgkG4iHmDWaDVYa4nqDsJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RBBNWw8ouienDaz0mBKV9zDUIJVAHVc0K2NcLu32dTRl8Nt3GXjNalZ8tXo3H+cME
	 TFBzZa9dO7qK8LVtvUrNugTmE8jd+dNfGob5dlVqBiC91j+UNl9j/7VjHVv2la1a82
	 D/ZPhLPI8HtTOWaV6vK+l/zkh9YmoLQG3ILMnM9KdRSeA91MXstpUGCbE0iGO8mZ7c
	 5jy6o822ve2cy3wTOCY3USY9ZvG8zIp6cKcH3dMqvqRkMkvZqzZw3vO2PVXX+2d7yZ
	 y7QPCGTtDO3WZSx1nQiAPkPtltiY07Zp5MEmrUXZQ94BzOG05llZddkx7LK9/U+Lcy
	 oAPitRG87QkYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727081859.1737223-3-zychennvt@gmail.com>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
 <20260727081859.1737223-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:30:30 +0000
Message-Id: <20260727083030.895F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Double pm_runtime_disable() due to mixing devres and manual goto c=
leanup on probe error paths.
- [High] Missing NULL checks and synchronization for `i2c->target` leads to=
 a kernel panic in the target ISR.
- [High] Data race on transfer state fields (`i2c->msg`, `i2c->msg_num`) le=
ading to spurious interrupts and transfer timeouts.
- [Medium] Handling bus errors or spurious interrupts while the controller =
is idle permanently disables target mode.
--

--- Patch [2]: [PATCH v7 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver su=
pport ---
commit 035b6bb91f9d1b731210ec6e2aa45306a8f7f5f8
Author: Zi-Yu Chen <zychennvt@gmail.com>

i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support

Add I2C support for Nuvoton MA35D1 SoC. The controller supports standard,
fast and fast-plus modes, and provides controller/target functionality.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..858cfc2a873fb
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c

[ ... ]

> +static void ma35d1_i2c_stop(struct ma35d1_i2c *i2c, int ret)
> +{
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STO_SI);

[Severity: Medium]
Does handling bus errors or spurious interrupts permanently disable target
mode?

ma35d1_i2c_write_ctl() clears the MA35_CTL_STA_SI_AA bits before applying t=
he
new control mask. Passing only MA35_CTL_STO_SI (or MA35_CTL_SI in the
spurious interrupt handler) leaves the MA35_CTL_AA bit cleared.

Will this prevent the I2C controller from acknowledging its own slave addre=
ss
until the next controller transfer is initiated?

[ ... ]

> +static void ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
> +				      unsigned long i2c_status)
> +{
> +	unsigned char byte;
> +
> +	switch (i2c_status) {
> +	case MA35_S_RECE_ARB_LOST:
> +		/*
> +		 * Arbitration lost during SLA+R/W (Address) phase.
> +		 * The hardware automatically switches to Target mode as our
> +		 * own slave address was detected.
> +		 */
> +		i2c->err =3D -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);

[Severity: High]
Is it possible for this to dereference a NULL pointer?

If an interrupt fires before a target is registered, or if
ma35d1_unreg_target() clears i2c->target concurrently without a
synchronize_irq() barrier, i2c_slave_event() could attempt to use a NULL
i2c->target.

[ ... ]

> +static void ma35d1_i2c_irq_controller_trx(struct ma35d1_i2c *i2c,
> +					  unsigned long i2c_status)
> +{
> +	unsigned char byte;
> +
> +	/* Ensuring messages are absolutely valid in Controller mode. */
> +	if (unlikely(!i2c->msg)) {
> +		dev_err(i2c->dev, "Spurious controller interrupt (status: 0x%02lx)\n",=
 i2c_status);
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);

[Severity: Medium]
As mentioned above, applying MA35_CTL_SI without MA35_CTL_AA strips the
assert acknowledge bit, which could silently break target mode.

[ ... ]

> +static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msg=
s,
> +			     int num)
> +{
> +	unsigned long timeout;
> +	unsigned int val;
> +	int ret, err;
> +
> +	i2c->msg =3D msgs;
> +	i2c->msg_num =3D num;
> +	i2c->msg_ptr =3D 0;
> +	i2c->msg_idx =3D 0;
> +	i2c->err =3D 0;

[Severity: High]
Are these transfer state variables safe from concurrent modification?

If an interrupt fires (such as target arbitration lost) while
ma35d1_i2c_doxfer() is setting up the transfer, the controller complete path
could execute:

ma35d1_i2c_controller_complete()
    i2c->msg =3D NULL;
    i2c->msg_num =3D 0;

This could unconditionally clear the state variables, leading to a
corrupted state and transfer timeouts. Should this setup be protected by
i2c->lock or have local interrupts disabled?

[ ... ]

> +static void ma35d1_i2c_pm_cleanup(void *data)
> +{
> +	struct device *dev =3D data;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +}

[ ... ]

> +static int ma35d1_i2c_probe(struct platform_device *pdev)
> +{

[ ... ]

> +rpm_put:
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	return ret;
> +}

[Severity: High]
Does this execute pm_runtime_disable() twice on error paths?

Since devm_add_action_or_reset() registers ma35d1_i2c_pm_cleanup() to run
automatically on probe failure, explicitly jumping to the rpm_put label will
call pm_runtime_disable() a second time.

Could this leave the device's disable_depth counter permanently incremented
if the driver undergoes probe deferral?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727081859.1737=
223-1-zychennvt@gmail.com?part=3D2
