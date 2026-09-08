Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4808153ED1F
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871963; cv=none; b=u7tTez8SmOWeNGe+F+ptTyFGiedjstjNS7lJQZJm/sD8z2WrWMSaDO6n3SKf73D4mO0TrczbPjujtND7fxaGBd+GOUuHwfTeg1jGZr6Lgv8eF0vRbIyRJrAR61u4zfeHTUir/i3q+pVJrFca4Rsrthhni2WIKmway05y7RJqzfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871963; c=relaxed/simple;
	bh=TfOZGp3CcJXvWeSY+eQooIYpSTF/hSg5dVY5/9ePKyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/ghzVQtWcTT2BXqy7OLm9mX4VJYTa/gXm9gg0r9KcexvBnRA5R2EKZvqTSd9GttiN2B6cyXx9GQMrjNiVDf/4qNkHAMsJm3sSGNFb3+Metc7WCcda88ZYOL7IUnIp9/T4HgVr+0ygm8To9FV7wYpdiV8OIj1Tn9X9AySXyD4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtAko6vC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtAko6vC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7FF1F00A3A;
	Tue,  8 Sep 2026 12:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788871962;
	bh=PcW2YGzy6SOLBvc3AFEgZKdHOgH3owsKOw+orwxQq5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LtAko6vCY2T9QbGOmH0xQnj1I9KFMb8zWkr1yAXBSvjO9nr/Z8WVv0OEqGa7lAm6A
	 8XptGP7eZ3sA9VRBzVhlmUWqkWq69vEamWzzH8doZPFePGOU36ACM8nlqqeIQwcFJr
	 liluysklJdQdDC1hXbCe1bfgtz3BTsdqkdCCmC6pJKUYiyD+TFG1p44URylaLZgr9T
	 YG+RHayXjliByxzucfWKMROCrTrMhD+2RLRSSPQGuQ0008KX9kCgmsnfN8zqMX9qR8
	 mdCY0STul2Bml5FDZpG9kSxa/x7HwnNsEbHU3f3VLGwySy1hqkXMsuw/JJuihfRQLG
	 lk58pqqxKxliQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i2c: mux: Add NXP PCA9641 I2C bus master arbiter
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shiv Prakash Gupta" <shivprakash.gupta@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908123146.1839854-3-shivprakash.gupta@nxp.com>
References: <20260908123146.1839854-1-shivprakash.gupta@nxp.com>
 <20260908123146.1839854-3-shivprakash.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 12:52:41 +0000
Message-Id: <20260908125241.EB7FF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The interrupt implementation is fatally flawed: it requests a shar=
ed IRQ with a NULL primary handler (which fails unconditionally), fails to =
clear the hardware interrupt source (causing an infinite IRQ storm), blindl=
y consumes shared interrupts (stealing from other devices), and instantly a=
borts I2C transfers upon spurious wakeups.
- [High] Missing clearing of LOCK_REQ on error paths leads to permanent bus=
 lockout.
- [High] pca9641_probe fails to re-mask interrupts if i2c_mux_add_adapter f=
ails, leading to an unhandled IRQ storm.
- [Medium] Incorrect teardown order in `pca9641_remove()` masks hardware in=
terrupts before unregistering child adapters, causing concurrent transactio=
ns to stall.
- [Medium] The driver unmasks hardware interrupts before registering the IR=
Q handler, risking immediate spurious interrupts and disabled IRQ lines.
- [Low] The `i2c_device_id` array fails to use named initializers.
--

commit 2d4a239fba3344246dc50ddca835d1ac1501417b
Author: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>

i2c: mux: Add NXP PCA9641 I2C bus master arbiter driver
   =20
This patch adds a driver for the NXP PCA9641 2-to-1 I2C bus master arbiter.
It supports interrupt-assisted arbitration when INT0/INT1 is connected to a
GPIO, and falls back to polling mode when an interrupt is not configured.

> diff --git a/drivers/i2c/muxes/i2c-mux-pca9641.c b/drivers/i2c/muxes/i2c-=
mux-pca9641.c
> new file mode 100644
> index 0000000000000..c12aa88dcf560
> --- /dev/null
> +++ b/drivers/i2c/muxes/i2c-mux-pca9641.c

[ ... ]

> +static const struct i2c_device_id pca9641_id[] =3D {
> +	{ "pca9641" },
> +	{}
> +};

[Severity: Low]
Is it possible to use named initializers here? I2C subsystem guidelines
typically expect initialized arrays of type struct i2c_device_id to use
named initializers.

[ ... ]

> +static irqreturn_t pca9641_irq_handler(int irq, void *dev_id)
> +{
> +	struct pca9641 *data =3D dev_id;
> +
> +	complete(&data->lock_grant_comp);
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Does this handler need to clear the hardware interrupt source before
returning IRQ_HANDLED? Since this is a shared interrupt, claiming the
interrupt without checking or clearing the hardware source could lead to
an IRQ storm, and might consume interrupts meant for other devices sharing
the same line.

[ ... ]

> +		if (!wait_for_completion_timeout(&data->lock_grant_comp,
> +						 client->adapter->timeout)) {
> +			ctrl =3D pca9641_reg_read(client, PCA9641_CONTR);
> +			if (ctrl < 0)
> +				return ctrl;
> +			if (!(ctrl & PCA9641_CTL_LOCK_GRANT)) {
> +				dev_warn(&client->dev,
> +					 "Timed out waiting for bus grant\n");
> +				return -ETIMEDOUT;
> +			}
> +			goto set_bus_connect;
> +		}

[Severity: High]
If this wait times out, do we need to clear the PCA9641_CTL_LOCK_REQ bit in
the control register before returning? Bailing out here without clearing it
seems like it might permanently lock out the downstream I2C bus for the
other master.

> +
> +		ctrl =3D pca9641_reg_read(client, PCA9641_CONTR);
> +		if (ctrl < 0)
> +			return ctrl;
> +
> +		if (!(ctrl & PCA9641_CTL_LOCK_GRANT)) {
> +			dev_warn(&client->dev,
> +				 "Interrupt fired but LOCK_GRANT not set\n");
> +			return -ETIMEDOUT;
> +		}

[Severity: High]
Since this IRQ is requested as shared, could a spurious wakeup or an
interrupt from another device cause us to take this path? If so, this would
instantly fail the transfer instead of safely resuming the wait.

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
> +	} while (time_is_after_eq_jiffies(timeout));
> +
> +	dev_warn(&client->dev, "Failed to acquire I2C bus, timed out\n");
> +	return -ETIMEDOUT;

[Severity: High]
Similar to the interrupt wait timeout, if this polling loop times out,
should we clear the PCA9641_CTL_LOCK_REQ bit before returning -ETIMEDOUT?
Otherwise, the lock might be held indefinitely.

[ ... ]

> +	/* Optional interrupt mode; fall back to polling on failure. */
> +	if (client->irq > 0) {
> +		ret =3D i2c_smbus_write_byte_data(client, PCA9641_INT_MSK,
> +						PCA9641_INT_MSK_ARB);

[Severity: Medium]
Are hardware interrupts unmasked here before the IRQ handler is successfully
registered? If the device asserts an interrupt before the OS handler is
ready, could the kernel permanently disable the shared IRQ line?

> +		if (ret < 0) {
> +			dev_warn(&client->dev,
> +				 "Failed to set interrupt mask (%d); using polling\n",
> +				 ret);
> +			goto add_adapter;
> +		}
> +
> +		ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> +						NULL, pca9641_irq_handler,
> +						IRQF_ONESHOT | IRQF_SHARED,
> +						dev_name(&client->dev), data);

[Severity: High]
Will this request succeed? Requesting a threaded IRQ with IRQF_SHARED and a
NULL primary handler usually fails unconditionally with -EINVAL, which would
prevent interrupt mode from working entirely.

[ ... ]

> +add_adapter:
> +	ret =3D i2c_mux_add_adapter(muxc, 0, 0);
> +	if (ret)
> +		return ret;

[Severity: High]
If i2c_mux_add_adapter fails here, should the error path re-mask the
interrupts? Returning an error while hardware interrupts are left unmasked
could lead to an unhandled IRQ storm.

[ ... ]

> +static void pca9641_remove(struct i2c_client *client)
> +{
> +	struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
> +	struct pca9641 *data =3D i2c_mux_priv(muxc);
> +
> +	if (data->irq > 0)
> +		(void)i2c_smbus_write_byte_data(client, PCA9641_INT_MSK,
> +						PCA9641_INT_MSK_ALL);
> +
> +	i2c_mux_del_adapters(muxc);
> +}

[Severity: Medium]
Could this teardown order stall concurrent transactions? Masking hardware
interrupts before unregistering the child adapters via i2c_mux_del_adapters
means that if a downstream transaction is waiting for a bus grant during
removal, the completion might simply time out instead of finishing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908123146.1839=
854-1-shivprakash.gupta@nxp.com?part=3D2
