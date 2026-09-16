Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B6A4A263F
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567810; cv=none; b=pwd6puveBOhZAFTA5FwvF1+BH1k3YqDoeuvh5tnKGTgDIXppu6/RyjdCwu9E8wijwzcokQnyk/vKQl5S787QM7Z/FKXH12ZL/E1mFyzYb31kzRZcubl5jV9Y4G482nNZf+jofQHeOBRf+aqD+8AyCIGiV0FqFXVchcvXIn+f+As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567810; c=relaxed/simple;
	bh=bQ48GSGP+uxmZqZiQIWY29WmAcFYg2CEfkgdTaXzA/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C3UbOYFSnJ23TrokxNkm2WcOFqOo64pCBuTVahiJSkoN3176Q+4xnN+e1ojQQBoYCAb+12t62Z3ndhjr8dpQPjMW+HUtwTJjwgKLI09k/aWNq3LZK+rypDXUHIk6rR1MIb1xZ+mCWJfB7wYTVjhG0FuLPi1B3DqnOaCA3b7iiQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDVFr8V3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDVFr8V3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BDB1F000FF;
	Wed, 16 Sep 2026 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789567808;
	bh=Eb9RLm0rBUGvePfknQga2L0yRHw9iwQimPXqmSx/NnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DDVFr8V3RCeW+nYF7TOvX0zP+8TfxC8r5BtLUzzJViwOtpGAKw/l2hI4CFE68uSwO
	 itZ+aIZBrnAijENxlHNXTp6KeM4EP4W2hasS6NfD8XqTUkBUCQzmzUN2w/6lmFnpfg
	 7w0cL5A6FmKEA5M7KQNoPvyh88baYYVmv9WTYpUAP9dF20nlJkQJ2Mnno0gLkuqgWD
	 NIw3HQRRjMryFdZ8xWx+hUFTazQmjHL1D2+Ka35KexF678mjTrV7VYgz8Nzrw2e4Nc
	 C2vb4eJcu2hrUZRILnO1r7mI1295fF04rNGG2h1ubsItTxnDzX/BY6Yr1Q4zP7aO4/
	 AGLahz7g2aIYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: Add onsemi FUSB15201 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916135918.1017527-3-shengchao.guo@oss.qualcomm.com>
References: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
 <20260916135918.1017527-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:10:07 +0000
Message-Id: <20260916141008.49BDB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: typec: fusb15201: unhandled interrupt bits cause interrupt st=
orm
- [Medium] usb: typec: fusb15201: data race in probe allows spurious -ENOTC=
ONN
--

commit d7feaab14acc6ee944a785f261bfb7dd837de605
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

usb: typec: Add onsemi FUSB15201 driver

The FUSB15201 is a dual-port USB Type-C and Power Delivery controller. This
driver handles Type-C detection, registers a Type-C port for each connector,
and forwards role swaps to the controller.

> diff --git a/drivers/usb/typec/fusb15201.c b/drivers/usb/typec/fusb15201.c
> new file mode 100644
> index 0000000000000..ab3b07368bdf1
> --- /dev/null
> +++ b/drivers/usb/typec/fusb15201.c
[ ... ]
> +static irqreturn_t fusb15201_irq(int irq, void *data)
> +{
[ ... ]
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port =3D &chip->ports[i];
> +		unsigned int pending;
> +
> +		if (!port->port)
> +			continue;
> +
> +		if (regmap_read(chip->regmap, FUSB15201_REG_INTERRUPT(i), &pending))
> +			continue;
> +
> +		pending &=3D FUSB15201_INT_ALL;
> +		if (!pending)
> +			continue;
> +
> +		/* Write one to clear */
> +		regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i), pending);

[Severity: High]
Could masking the pending interrupts before writing back cause an interrupt
storm?

If the hardware asserts any bit outside of FUSB15201_INT_ALL (such as a
reserved bit or a new status bit in newer firmware), the driver masks it out
and writes 0 for that bit, failing to clear it.=20

If only unknown bits are asserted, pending becomes 0, and the handler retur=
ns
IRQ_NONE without clearing anything. The unhandled interrupt will then fire
continuously and lock up the CPU.

[ ... ]
> +static int fusb15201_hw_init(struct fusb15201 *chip)
> +{
[ ... ]
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port =3D &chip->ports[i];
[ ... ]
> +		/* Discard anything that happened before we got here */
> +		ret =3D regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i),
> +				   FUSB15201_INT_ALL);

[Severity: High]
Similar to the interrupt handler, this only clears known bits. Will any
pre-existing unhandled bits remain asserted and immediately trigger an
interrupt storm once the IRQ is requested?

Should this write a full mask to clear any unexpected bits during
initialization?

[ ... ]
> +	/* Seed the Type-C class with the current state before arming the IRQ */
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		if (chip->ports[i].port)
> +			fusb15201_hw_update(&chip->ports[i]);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Can this lockless initialization race with sysfs commands?

Because typec_register_port() is called before fusb15201_hw_init() in probe,
sysfs attributes and uevents are already active. When fusb15201_hw_update()
is called locklessly here, it invokes typec_register_partner(), which can
trigger additional uevents before port->status is updated.

If userspace reacts to these uevents and requests a data or power role swap,
fusb15201_command() will acquire chip->lock and read port->status. Since
this hardware update does not hold the lock, fusb15201_command() could obse=
rve
a stale port->status =3D=3D 0 and spuriously reject the valid swap request =
with
-ENOTCONN.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916135918.1017=
527-1-shengchao.guo@oss.qualcomm.com?part=3D2
