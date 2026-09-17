Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57F44A64D5
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636236; cv=none; b=eei1EJBF1XYE7sV+jlcuTw6/kuQpzqm+GGgs0YBLUYGZQ4Fnb3d3GX4CYGBbv9uWUz7UXph1aDeW0+XFfWX7oqDr289nZAuFlsKT1GdrxIzJK+EnupvXjC/YHwy9XXTHorh32g53uVlv7R1rO8Z2GJquUwmJMa2SsWZWTuzhhrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636236; c=relaxed/simple;
	bh=+Zx9+brGp/f4a7aYJC9HDyMWCZS4Ta1IXIhMhZ3yysc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jlA3AiWReqiR3NqGyr8JMRUdYlr3xf1Cl6rVmLVZnvanYWkGNlVZxHB3Nj2yfb3+E1cowDgfiQ2vMVznbOG99zBsNKI4U6SHqFJ2gctwZ27c2NHInvtp046HWwTnzLhT50lTibO59QPzlSmWqA+M05lZ30I48APAyoh8pxVs/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUgCc7b5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUgCc7b5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B8D1F000FF;
	Thu, 17 Sep 2026 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636233;
	bh=25IQOXg3FYuXKqoDQOisEAMM5JOQ1dT9pJmTSSH8wy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUgCc7b5TIYroSC3TBJgbHsednqAM1QJB4Y7VsiuqVacG9ZBZoWrZxxNBj9XAiwCU
	 M67d1jFlhecUMIMJ7f9ZXRe8raEWyhTc2dHEYX8J1dW+rLdeHu721qcXQEmgjg53EN
	 Bb/EsjLwCZLt9fcyq22uMDDHM+kMbMwgja+z0YVRK5HlmHAxYH2tciBPk+cPBX4KJt
	 2ivpFsVde+cV5dq8o2u0ZzxjC6dbyyHl4wXk/gT20pAVXxyBiBADWAM/WLZYHwQxCF
	 odBjV86IbDA5dAoitrgXy5obyY6xXmYHtJCD1zW3W1m0yHBR8TuK6NGQQnFiDJMVDr
	 gmAnfGph52RSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i2c: mux: Add NXP PCA9641 I2C bus master arbiter
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shiv Prakash Gupta" <shivprakash.gupta@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917085852.552079-3-shivprakash.gupta@nxp.com>
References: <20260917085852.552079-1-shivprakash.gupta@nxp.com>
 <20260917085852.552079-3-shivprakash.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 09:10:32 +0000
Message-Id: <20260917091033.59B8D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] i2c: pca9641: missing interrupt clear in handler causes IRQ storm
- [High] i2c: pca9641: probe error path leaves IRQ active during polling fa=
llback
- [High] i2c: pca9641: select_chan() illegally sleeps in atomic context
--

commit 1eafadafa36c19cfd93cd95319667d5c31725ee1
Author: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>

i2c: mux: Add NXP PCA9641 I2C bus master arbiter driver

This patch adds a driver for the NXP PCA9641 2-to-1 I2C bus master arbiter.
It introduces support for interrupt-assisted arbitration to avoid busy-poll=
ing,
as well as a fallback to polling mode when interrupts are not configured.

> diff --git a/drivers/i2c/muxes/i2c-mux-pca9641.c b/drivers/i2c/muxes/i2c-=
mux-pca9641.c
> new file mode 100644
> index 0000000000000..6e6f29fdd6d49
> --- /dev/null
> +++ b/drivers/i2c/muxes/i2c-mux-pca9641.c
[ ... ]
> +static irqreturn_t pca9641_irq_handler(int irq, void *dev_id)
> +{
> +	struct pca9641 *data =3D dev_id;
> +
> +	complete(&data->lock_grant_comp);
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Does this threaded handler need to clear the device-level sticky interrupt
status before returning IRQ_HANDLED?

If the physical line remains asserted because the device-level interrupt
status isn't cleared here, returning IRQ_HANDLED will cause the generic IRQ
core to unmask the line, immediately triggering another hardware interrupt.
This would set up an infinite loop of RT-priority threaded handler executio=
ns,
starving the normal-priority task running pca9641_select_chan() and
potentially livelocking the system.

[ ... ]
> +static int pca9641_select_chan(struct i2c_mux_core *muxc, u32 chan)
> +{
> +	struct pca9641 *data =3D i2c_mux_priv(muxc);
> +	struct i2c_client *client =3D data->client;
> +	unsigned long timeout =3D jiffies + 2 * client->adapter->timeout;
> +	int ctrl, ret;
> +
> +	if (data->irq > 0) {
> +		reinit_completion(&data->lock_grant_comp);
> +
> +		ctrl =3D pca9641_reg_read(client, PCA9641_CONTR);
> +		if (ctrl < 0)
> +			return ctrl;
> +
> +		if (ctrl & PCA9641_CTL_LOCK_GRANT)
> +			goto set_bus_connect;
> +
> +		ret =3D pca9641_reg_write(client, PCA9641_CONTR,
> +					(u8)((ctrl & ~PCA9641_CTL_BUS_CONNECT) |
> +					     PCA9641_CTL_LOCK_REQ));
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!wait_for_completion_timeout(&data->lock_grant_comp,
> +						 client->adapter->timeout)) {

[Severity: High]
Can this unconditionally call a sleeping synchronization primitive in atomic
context?

When an atomic I2C transfer is requested, the i2c-mux core executes in atom=
ic
context with interrupts disabled and calls pca9641_select_chan(). Calling
wait_for_completion_timeout() here invokes schedule(), which explicitly
sleeps. This violates context constraints and would trigger a scheduling wh=
ile
atomic bug.

> +			ctrl =3D pca9641_reg_read(client, PCA9641_CONTR);
> +			if (ctrl < 0)
> +				return ctrl;
> +			if (!(ctrl & PCA9641_CTL_LOCK_GRANT)) {
> +				dev_warn(&client->dev,
> +					 "Timed out waiting for bus grant\n");
> +				/*
> +				 * Clear our latched LOCK_REQ so the arbiter is
> +				 * not left holding a request for a master that
> +				 * has given up, which would block the peer.
> +				 */
> +				pca9641_release_bus(client);
> +				return -ETIMEDOUT;
> +			}

[Severity: High]
Does this error path return without clearing the pending interrupt status?

If so, it would leave the unmasked line asserted, which also guarantees an
immediate IRQ storm.

[ ... ]
> +	do {
> +		ret =3D pca9641_arbitrate(client);
> +		if (ret)
> +			return ret < 0 ? ret : 0;
> +
> +		if (data->select_timeout <=3D PCA9641_DELAY_SHORT)
> +			udelay(data->select_timeout);
> +		else
> +			msleep(data->select_timeout / 1000);

[Severity: High]
Is it safe to unconditionally call msleep() here?

During an atomic I2C transfer, calling msleep() would sleep while interrupts
are disabled, violating context constraints. Additionally, this polling loop
relies on time_is_after_eq_jiffies(), but jiffies do not advance when timer
interrupts are disabled, leading to an infinite spin loop.

Could the driver check i2c_in_atomic_xfer_mode() and implement a safe delay
loop using udelay() for atomic context?

> +	} while (time_is_after_eq_jiffies(timeout));
> +
> +	dev_warn(&client->dev, "Failed to acquire I2C bus, timed out\n");
> +	/* Drop our latched LOCK_REQ so the peer master is not blocked. */
> +	pca9641_release_bus(client);
> +	return -ETIMEDOUT;
> +}
[ ... ]
> +static int pca9641_probe(struct i2c_client *client)
> +{
[ ... ]
> +		/* Handler is ready; now enable LOCK_GRANT + BUS_LOST. */
> +		ret =3D i2c_smbus_write_byte_data(client, PCA9641_INT_MSK,
> +						PCA9641_INT_MSK_ARB);

[Severity: High]
Does this unmask the BUS_LOST interrupt, which doesn't seem to be handled
anywhere in the driver?

If BUS_LOST fires, returning from the interrupt handler without clearing it
would guarantee an immediate and permanent IRQ storm.

> +		if (ret < 0) {
> +			dev_warn(&client->dev,
> +				 "Failed to enable interrupts (%d); using polling\n",
> +				 ret);
> +			goto add_adapter;
> +		}

[Severity: High]
Does this error path fall back to polling mode without freeing the previous=
ly
requested threaded IRQ handler?

If the hardware later asserts the IRQ line (e.g. from spurious noise or
because it was already enabled prior to probe), the active handler will exe=
cute
and return IRQ_HANDLED. Because pca9641_select_chan() operates in polling m=
ode
(data->irq =3D=3D -1) and never waits on the completion, the interrupt stat=
us is
never cleared, triggering a permanent IRQ storm and system lockup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917085852.5520=
79-1-shivprakash.gupta@nxp.com?part=3D2
