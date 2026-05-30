Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474E1F0E29
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780150961; cv=none; b=PN7dGliqiyy9l480g8F8nLUSKXnwQxqPXlHpag1xU5q1jmQeqOnrgimv3QJT3ByP8VRzkVL0XPrhfIpvhBTf1umJNKvzWCN+Vi26Sj7amIBo9WxbYl0j9J04Oq6Z3bmQLqHPG5vTU8PqHK+1gGwAwRsRsYMszRrVv7X+JVaL4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780150961; c=relaxed/simple;
	bh=3b/d714L+E7iL/7E37CN1uwH1a3wUKbDjqH2/3tyw7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=brkmVn++kDnDNL+2GIFf6WvyflnxjNSDUypUbu3uiDBPuuSFx0h4bXZYe4YVzCYi7BzgqjKjlWyMDV20lCKsLb/4xzeuTA4oHKUqOwynEcFHUi+de1XCZeTRniVAmkPJUbCSJVyTHY/4oV3oL4UU9kDYlDd7EpUbT0npGCquVvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exf+iCMW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exf+iCMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975DD1F00893;
	Sat, 30 May 2026 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780150959;
	bh=+GNDJFzwzTFfA0oEZE52ra+NRxmpIaM/fuZPxZEVzR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exf+iCMWwnTaBIQZShC+IthEWmMgVCCmS7seaX01VeZfya3IJSZSbQszEJgJ2ItNY
	 W/MfhDDLRGVrd4tqtGEwWSMBvfB6KgeuQiNTbG2JB2gpE7qTM5GFcn1ml4PVNdogAj
	 YhU3DgFSKYYXgqRl5MtMLBm3/lwfMPZtMosv7O89sAkdzq/MRGAgSR1dIgII1cJOOR
	 5vTfZAIRyCFt3Zem5DtvIPKJ09TdN1qSp4s2nCI4EKuiyBuPmygneuq9CkvNmHCPAA
	 CBarwdIceEyJQGIQu6f/BFDNQDbA/miCB20VprW21Q2ysWlWmS0/1nYE4FqzHMCqT9
	 40YLUF58yup3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] irqchip: add MSM8x60 MPM wakeup interrupt
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <9777c7b553b0858d4174101487330038d770fa44.1780148149.git.github.com@herrie.org>
References: <9777c7b553b0858d4174101487330038d770fa44.1780148149.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:22:38 +0000
Message-Id: <20260530142238.975DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] The driver requests an IPC mailbox channel to notify the RPM of co=
nfiguration changes but never sends any messages, rendering wake configurat=
ions ineffective.
- [High] Devres teardown sequence mismatch leaves the parent interrupt acti=
ve after the IRQ domain is freed, leading to a Use-After-Free.
- [High] Calling `regmap_read()` and `regmap_write()` on a syscon regmap fr=
om within an irqchip's raw spinlock context causes a sleeping-while-atomic =
bug on PREEMPT_RT.
- [High] The irqchip fails to implement `.irq_set_wake`, breaking wakeup ca=
pabilities for the MPM and its parent GIC.
- [High] Clearing edge-triggered pending interrupts after executing the int=
errupt handler will drop subsequent edges.
- [Medium] Missing bounds validation on MPM pin indices from Device Tree al=
lows arbitrary out-of-bounds register accesses.
- [Medium] Unsafe consumer API lacks reference counting or device links, le=
ading to UAF if the MPM driver is unbound.
- [Medium] Failure to check the return value of `regmap_read()` results in =
uninitialized stack memory being used as register state.
--

commit 73a7572c3031147f818620520a565acba0e95ad1
Author: Herman van Hazendonk <github.com@herrie.org>

irqchip: add MSM8x60 MPM wakeup interrupt controller driver

This commit adds a driver for the MSM Power Manager (MPM) on the MSM8x60
family. It implements an irqchip wrapper to configure wake pins and exposes
an API for consumer drivers to manage raw wake signals. The driver interacts
with the RPM via a syscon regmap and IPC mailbox.

> diff --git a/drivers/irqchip/irq-msm8660-mpm.c b/drivers/irqchip/irq-msm8=
660-mpm.c
> new file mode 100644
> index 0000000000000..c579d1476e01b
> --- /dev/null
> +++ b/drivers/irqchip/irq-msm8660-mpm.c
> @@ -0,0 +1,627 @@

[ ... ]

> +static u32 msm8660_mpm_read(struct msm8660_mpm *mpm, unsigned int reg)
> +{
> +	u32 val;
> +	regmap_read(mpm->regmap, mpm->regmap_offset + reg, &val);
> +	return val;
> +}

[Severity: Medium]
Will this return uninitialized stack memory if the register read fails?

The variable val is uninitialized. If the regmap_read() function fails, it
will not update val, and this function will return stack garbage.

This could result in corrupted state when the read value is treated as
hardware pending status or used in read-modify-write operations.

[ ... ]

> +static irqreturn_t msm8660_mpm_irq(int irq, void *data)
> +{
> +	struct msm8660_mpm *mpm =3D data;
> +	unsigned long pending[MSM8660_MPM_REG_WIDTH];
> +	unsigned long enable[MSM8660_MPM_REG_WIDTH];
> +	int i, j;
> +
> +	for (i =3D 0; i < MSM8660_MPM_REG_WIDTH; i++) {
> +		pending[i] =3D msm8660_mpm_read(mpm,
> +			MSM8660_MPM_STATUS_OFFSET + i * 4);
> +		enable[i] =3D msm8660_mpm_read(mpm,
> +			MSM8660_MPM_REG_ENABLE + i * 4);
> +	}
> +
> +	for (i =3D 0; i < MSM8660_MPM_REG_WIDTH; i++) {
> +		unsigned long bits =3D pending[i] & enable[i];
> +
> +		for_each_set_bit(j, &bits, 32) {
> +			int pin =3D i * 32 + j;
> +			int hwirq =3D msm8660_mpm_pin_to_hwirq(mpm, pin);
> +
> +			if (hwirq >=3D 0) {
> +				dev_dbg(mpm->dev, "wake pin %d -> hwirq %d\n",
> +					pin, hwirq);
> +				generic_handle_domain_irq(mpm->domain, hwirq);
> +			}
> +		}
> +
> +		if (bits)
> +			msm8660_mpm_write(mpm,
> +				MSM8660_MPM_REG_CLEAR + i * 4, bits);

[Severity: High]
Does clearing the pending bits after executing the handler drop subsequent
edges?

If a new edge interrupt arrives on any of these pins while the handler is
executing in generic_handle_domain_irq(), the hardware will latch it again.

Because the write to the CLEAR register is delayed until after the handler
finishes, it will wipe out the newly latched interrupt, permanently losing
the new edge so it is not serviced.

> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void msm8660_mpm_enable_hwirq(struct irq_data *d, bool enable)
> +{
> +	struct msm8660_mpm *mpm =3D irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +	int i, pin =3D -1;
> +	u32 val;
> +
> +	for (i =3D 0; i < mpm->pin_map_count; i++) {
> +		if (mpm->pin_map[i].hwirq =3D=3D d->hwirq) {
> +			pin =3D mpm->pin_map[i].pin;
> +			break;
> +		}
> +	}
> +
> +	if (pin < 0)
> +		return;
> +
> +	raw_spin_lock_irqsave(&mpm->lock, flags);
> +
> +	val =3D msm8660_mpm_read(mpm,
> +		MSM8660_MPM_REG_ENABLE + (pin / 32) * 4);

[Severity: High]
Can this sleepable syscon regmap access while holding a raw spinlock cause a
locking violation?

The core IRQ subsystem invokes irqchip callbacks like irq_mask() and
irq_unmask() with the descriptor's raw_spinlock_t held and preemption
disabled.

Inside these functions, the driver explicitly acquires another raw_spinlock=
_t
and calls msm8660_mpm_read(), which invokes regmap_read() on the syscon
regmap.

Syscon regmaps use a standard spinlock_t for synchronization, which on
PREEMPT_RT is a sleepable rt_mutex. Attempting to acquire a sleepable lock
while holding a raw_spinlock_t is a locking violation.

> +	if (enable)
> +		val |=3D BIT(pin % 32);
> +	else
> +		val &=3D ~BIT(pin % 32);
> +	msm8660_mpm_write(mpm,
> +		MSM8660_MPM_REG_ENABLE + (pin / 32) * 4, val);

[Severity: High]
Should this register update be followed by a mailbox notification to the RP=
M?

The driver requests an IPC mailbox channel in msm8660_mpm_probe() to signal
configuration changes to the MPM. However, the driver never calls
mbox_send_message() after updating the hardware state here.

Without the doorbell ping, the RPM hardware will not re-evaluate the wake
configuration, which prevents the device from successfully waking the system
from suspend.

> +
> +	raw_spin_unlock_irqrestore(&mpm->lock, flags);
> +}

[ ... ]

> +static int msm8660_mpm_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct msm8660_mpm *mpm =3D irq_data_get_irq_chip_data(d);
> +	unsigned long flags;
> +	int i, pin =3D -1;
> +	u32 detect, polarity;
> +
> +	for (i =3D 0; i < mpm->pin_map_count; i++) {
> +		if (mpm->pin_map[i].hwirq =3D=3D d->hwirq) {
> +			pin =3D mpm->pin_map[i].pin;
> +			break;
> +		}
> +	}
> +
> +	if (pin < 0)
> +		return -ENOENT;
> +
> +	raw_spin_lock_irqsave(&mpm->lock, flags);
> +
> +	detect =3D msm8660_mpm_read(mpm,
> +		MSM8660_MPM_REG_DETECT_CTL + (pin / 32) * 4);

[Severity: Medium]
Could this result in an out-of-bounds register access if the pin index is
invalid?

The pin value is parsed from the Device Tree in msm8660_mpm_probe() without
any bounds checking. If a malformed or malicious DT specifies a large pin
index, calculating the register offset using (pin / 32) * 4 will result in =
an
out-of-bounds read and write inside the RPM syscon block.

[ ... ]

> +static struct irq_chip msm8660_mpm_chip =3D {
> +	.name			=3D "msm8660-mpm",
> +	.irq_mask		=3D msm8660_mpm_mask_irq,
> +	.irq_unmask		=3D msm8660_mpm_unmask_irq,
> +	.irq_set_type		=3D msm8660_mpm_set_type,
> +	.irq_eoi		=3D irq_chip_eoi_parent,
> +	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
> +	.flags			=3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE,

[Severity: High]
Does this missing irq_set_wake callback break system wakeup functionality?

The commit message states the driver "overrides ->irq_set_wake() to enable
the MPM mirror of the same interrupt".

However, the .irq_set_wake callback is omitted here and the flag
IRQCHIP_SKIP_SET_WAKE is applied instead.

When a consumer driver calls enable_irq_wake(), the generic IRQ core will
return 0 and stop propagating the wake request. Neither the MPM hardware nor
the parent GIC will receive the wake configuration.

> +};

[ ... ]

> +struct msm8660_mpm *msm8660_mpm_get(struct device_node *np,
> +				    const char *propname)
> +{
> +	struct device_node *mpm_np;
> +
> +	if (!msm8660_mpm_global)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	if (np && propname) {
> +		mpm_np =3D of_parse_phandle(np, propname, 0);
> +		if (!mpm_np)
> +			return ERR_PTR(-ENOENT);
> +		of_node_put(mpm_np);
> +	}
> +
> +	return msm8660_mpm_global;

[Severity: Medium]
Does returning the devm-managed pointer here create a use-after-free risk?

This consumer API returns a direct pointer to the devm_kzalloc allocated
structure without establishing a device_link, incrementing module refcounts,
or suppressing bind attributes.

If the MPM driver is unbound, devres will immediately free the structure.
Consumer drivers like mmci will retain a dangling pointer, leading to a
use-after-free when they later call msm8660_mpm_enable_pin().

> +}
> +EXPORT_SYMBOL_GPL(msm8660_mpm_get);

[ ... ]

> +static int msm8660_mpm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct msm8660_mpm *mpm;
> +	struct irq_domain *parent_domain;
> +	struct device_node *parent_np;
> +	int ret, i;
> +	u32 offset;

[ ... ]

> +	for (i =3D 0; i < mpm->pin_map_count; i++) {
> +		u32 pin, hwirq;
> +
> +		of_property_read_u32_index(np, "qcom,mpm-pin-map",
> +					   i * 2, &pin);
> +		of_property_read_u32_index(np, "qcom,mpm-pin-map",
> +					   i * 2 + 1, &hwirq);
> +
> +		mpm->pin_map[i].pin =3D pin;

[Severity: Medium]
Should the pin value be validated against MSM8660_MPM_PIN_COUNT before use?

The pin value is extracted from the Device Tree and stored directly. Missing
bounds validation here allows arbitrary out-of-bounds register accesses lat=
er
in functions like msm8660_mpm_set_type() and msm8660_mpm_enable_hwirq().

[ ... ]

> +	ret =3D devm_request_irq(dev, mpm->parent_irq, msm8660_mpm_irq,
> +			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND,
> +			       "msm8660-mpm", mpm);

[Severity: High]
Does registering the IRQ handler with devm create a teardown mismatch?

This registers the parent interrupt handler with devm_request_irq(), meaning
it remains active until the devres cleanup phase executes. The devres clean=
up
happens after the remove() callback returns.

> +	if (ret) {
> +		dev_err(dev, "failed to request IRQ %d: %d\n",
> +			mpm->parent_irq, ret);
> +		goto err_remove_domain;
> +	}
> +
> +	/* Mailbox channel for poking MPM to re-read its config (writes to
> +	 * GCC + 0x008 bit 1 via the qcom-apcs-ipc mailbox).
> +	 */
> +	mpm->mbox_client.dev =3D dev;
> +	mpm->mbox_client.knows_txdone =3D true;
> +	mpm->mbox_chan =3D mbox_request_channel(&mpm->mbox_client, 0);

[Severity: High]
Is the mailbox channel requested here actually used to send messages?

The channel is requested for the purpose of signaling the MPM, but the driv=
er
never calls mbox_send_message() after updating the vMPM registers to trigger
the IPC ping.

[ ... ]

> +static void msm8660_mpm_remove(struct platform_device *pdev)
> +{
> +	struct msm8660_mpm *mpm =3D platform_get_drvdata(pdev);
> +
> +	msm8660_mpm_global =3D NULL;
> +	if (mpm->mbox_chan)
> +		mbox_free_channel(mpm->mbox_chan);
> +	irq_domain_remove(mpm->domain);

[Severity: High]
Can freeing the irq domain manually here cause a use-after-free crash?

The irq_domain_remove() function immediately frees the domain memory, while
the devm-managed msm8660_mpm_irq() handler is still active.

If a hardware interrupt fires between the return of msm8660_mpm_remove() and
devres teardown, the active handler will execute and access the freed domain
pointer in generic_handle_domain_irq().

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780148149.gi=
t.github.com@herrie.org?part=3D2
