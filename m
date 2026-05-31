Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA664AA4
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 04:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780201935; cv=none; b=KTtjrZTLuICVMGPVAVY3SX9HRc7iEF/0dsaQnK1lBx128AG5w8RYQt1jlPMeppyFUocGpCzP+iRsbOGPKnoRnZLtW2ni01nNdFqTA32yxfvLBPMZZlaDsGoj6732qxFWGvgEYsOdtRgDTzM675fn6BeiiCtyeoYpLPYZO0u5QTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780201935; c=relaxed/simple;
	bh=Fa7tewJGxZsb+VzcRCjDAs8s/vYFF+MSSLqEBi7i/oc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mpMKwF7RbyPW3x/p3x1mb8nxHxYqmTVamDlr+Fm/VMp7E0wuF/O/8J7PSKF7nA2d4hg/2NXav19gL1vCqohgkpg8+TO0TwqwFYNGjOxXkIyAx1+Ry8L4bLfHLCLrzfiXNc78e9/j3IjalCuRmdyFFNEMfkVUUHDUxNzmsftYKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxyL3Ybf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxyL3Ybf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18801F00893;
	Sun, 31 May 2026 04:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780201934;
	bh=XMu5HVE4tVyol+gkZ+QImbp7AiJS3C74Br9Y5kAcUCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxyL3Ybf1Vf0CFiTiI6bc9etkWTzT/vaHChgQd17m6wo59FSqosm0SAKV4RcDNp29
	 2M5B0y7t1pEJb76eKKzUsSowOCy0aITIDdF3YaAVBE6r0QvOEq0ixAmo2ZDZg4Mj3C
	 ps5PfEVpncyZ2bSm2p93iaUeQbafLYprcYnH1Ytof5qkW9pT10WVEHMPr6d9BR0EUC
	 ksXyHrdBd21XFGaLOjFK6uxmppsO+OBF5lS2gapTjAvlPEeuQ4abXl+HxL/SHg51jK
	 2bwLzb4ye9VlgsovWYzLARrdoQAdIxF7D3VxAkuA/mYp1qAJoQwbW+rFRJWYP3eU4p
	 65Az9yyj/fOIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] irqchip: add MSM8x60 MPM wakeup interrupt
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0133fce127c7507bbb907d0258ad69ac8d753218.1780195817.git.github.com@herrie.org>
References: <0133fce127c7507bbb907d0258ad69ac8d753218.1780195817.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 04:32:13 +0000
Message-Id: <20260531043213.D18801F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Unprotected read-modify-write operations on shared vMPM registers =
lead to lost configuration updates.
- [High] Calling mbox_send_message() from irqchip callbacks causes a sleepi=
ng-while-atomic deadlock on PREEMPT_RT.
- [High] Identity confusion between MPM pin numbers and parent GIC SPI numb=
ers leads to allocation failures or dropped interrupts.
- [High] Toggling the hardware ENABLE bit inside irq_set_wake inadvertently=
 disables unmasked interrupts upon resume.
- [High] Missing suppress_bind_attrs allows sysfs unbind, causing Use-After=
-Free via irq_domain_remove and concurrent probes.
- [Medium] Missing read-back flush after clearing MPM interrupt status usin=
g writel_relaxed.
- [Low] Phandle resolution ignores the actual target node, leading to incor=
rect device linking.
--

commit c09bf824269ef596633ac65838f83c2f22429764
Author: Herman van Hazendonk <github.com@herrie.org>

irqchip: add MSM8x60 MPM wakeup interrupt controller driver

Add a driver for the MSM Power Manager (MPM) on the MSM8x60 family
(MSM8260/MSM8660/APQ8060). The MPM latches edge-triggered interrupts
during APPS power collapse and signals the RPM to wake the APPS back up.

> diff --git a/drivers/irqchip/irq-msm8660-mpm.c b/drivers/irqchip/irq-msm8=
660-mpm.c
> new file mode 100644
> index 0000000000000..b8394d9c076d2
> --- /dev/null
> +++ b/drivers/irqchip/irq-msm8660-mpm.c
> @@ -0,0 +1,740 @@

[ ... ]

> +static void msm8660_mpm_doorbell(struct msm8660_mpm *mpm)
> +{
> +	int ret;
> +
> +	if (!mpm->mbox_chan)
> +		return;
> +
> +	ret =3D mbox_send_message(mpm->mbox_chan, NULL);

[Severity: High]
Does calling mbox_send_message() from within an irqchip callback cause a
sleeping-while-atomic deadlock on PREEMPT_RT?

The irq_mask, irq_unmask, and irq_set_type callbacks run with the
raw_spinlock_t irq_desc->lock held.

The mailbox core conditionally waits and takes chan->lock, which is a spinl=
ock_t
that gets converted to a sleepable RT-mutex on PREEMPT_RT.

Deferring the mailbox communication using irq_bus_lock and irq_bus_sync_unl=
ock
could avoid this deadlock.

[ ... ]

> +static irqreturn_t msm8660_mpm_irq(int irq, void *data)
> +{

[ ... ]

> +		/*
> +		 * Clear before dispatching: a new edge latched on this pin
> +		 * after this point will set the pending bit again and we
> +		 * will service it on the next IPC IRQ. Clearing AFTER the
> +		 * handler would race with that new latch and silently lose
> +		 * the new edge.
> +		 */
> +		if (pending[i])
> +			msm8660_mpm_write(mpm,
> +				MSM8660_MPM_REG_CLEAR + i * 4, pending[i]);

[Severity: Medium]
Can a delayed write in the CPU store buffer overwrite newly latched edges a=
nd
drop interrupts?

Using writel_relaxed does not flush the write over the interconnect. If a
child driver triggers a new edge on a peripheral during the handler, the MPM
hardware will latch it.

If the delayed REG_CLEAR write arrives afterward, it will incorrectly wipe =
out
the newly latched edge. Adding a dummy read from the MPM register space ens=
ures
the write completes before executing the handler.

[ ... ]

> +static int msm8660_mpm_hwirq_to_pin(struct msm8660_mpm *mpm, unsigned in=
t hwirq)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < mpm->pin_map_count; i++) {
> +		if (mpm->pin_map[i].hwirq =3D=3D hwirq)

[Severity: High]
Is the GIC SPI number being confused with the MPM pin number here?

When msm8660_mpm_set_type calls msm8660_mpm_hwirq_to_pin(mpm, d->hwirq),
it searches for mpm->pin_map[i].hwirq =3D=3D hwirq.

Because d->hwirq is the MPM pin and pin_map[i].hwirq is the GIC SPI, this l=
ookup
will fail and return -1, causing set_type to return -ENOENT.

> +			return mpm->pin_map[i].pin;
> +	}
> +	return -1;
> +}
> +
> +static void msm8660_mpm_enable_hwirq(struct irq_data *d, bool enable)
> +{
> +	struct msm8660_mpm *mpm =3D irq_data_get_irq_chip_data(d);
> +	int pin;
> +	u32 val, mask;
> +
> +	pin =3D msm8660_mpm_hwirq_to_pin(mpm, d->hwirq);
> +	if (pin < 0)
> +		return;
> +
> +	mask =3D BIT(pin % 32);
> +	val =3D msm8660_mpm_read(mpm,
> +		MSM8660_MPM_REG_ENABLE + (pin / 32) * 4);

[Severity: High]
Could this concurrent read-modify-write corrupt the shared register state?

The driver manipulates shared 32-bit registers (ENABLE, DETECT_CTL,
POLARITY) to configure individual pins.

Because the IRQ subsystem calls irq_mask and irq_unmask with the per-interr=
upt
irq_desc->lock held, concurrent mask/unmask operations on different interru=
pts
within the same bank will execute without mutual exclusion.

A driver-local raw_spinlock_t is needed to serialize these accesses.

> +	if (enable)
> +		val |=3D mask;
> +	else
> +		val &=3D ~mask;
> +	msm8660_mpm_write(mpm,
> +		MSM8660_MPM_REG_ENABLE + (pin / 32) * 4, val);
> +
> +	msm8660_mpm_doorbell(mpm);

[Severity: High]
Is it safe to invoke the doorbell from a context where a raw_spinlock_t
is held?

The irq_mask and irq_unmask callbacks execute with irq_desc->lock held.

Calling msm8660_mpm_doorbell() here will invoke mbox_send_message(), which
sleeps on PREEMPT_RT, causing a scheduling-while-atomic deadlock.

[ ... ]

> +static int msm8660_mpm_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct msm8660_mpm *mpm =3D irq_data_get_irq_chip_data(d);
> +	u32 detect, polarity, mask;
> +	int pin;
> +
> +	pin =3D msm8660_mpm_hwirq_to_pin(mpm, d->hwirq);
> +	if (pin < 0)
> +		return -ENOENT;
> +
> +	mask =3D BIT(pin % 32);
> +	detect =3D msm8660_mpm_read(mpm,
> +		MSM8660_MPM_REG_DETECT_CTL + (pin / 32) * 4);

[Severity: High]
Does this unlocked read-modify-write of the DETECT_CTL and POLARITY registe=
rs
race with other set_type calls?

Similar to the ENABLE register, these are shared across multiple pins and
need mutual exclusion to prevent lost configuration updates.

[ ... ]

> +static int msm8660_mpm_set_wake(struct irq_data *d, unsigned int on)
> +{
> +	struct msm8660_mpm *mpm =3D irq_data_get_irq_chip_data(d);
> +	int pin;
> +
> +	pin =3D msm8660_mpm_hwirq_to_pin(mpm, d->hwirq);
> +	if (pin < 0)
> +		return -ENOENT;
> +
> +	msm8660_mpm_enable_hwirq(d, !!on);

[Severity: High]
Will toggling the hardware ENABLE bit here cause the interrupt to remain
permanently disabled after the first system resume?

When the system suspends, IRQCHIP_MASK_ON_SUSPEND ensures non-wake
interrupts are logically masked. During resume, device drivers call
irq_set_wake(..., 0) to disable wakeup.

Since this writes 0 to the hardware ENABLE bit, but the IRQ core assumes
the interrupt is still logically unmasked, it will not call irq_unmask()
and the hardware state will remain disabled.

[ ... ]

> +static int msm8660_mpm_domain_alloc(struct irq_domain *domain,
> +				    unsigned int virq, unsigned int nr_irqs,
> +				    void *data)
> +{

[ ... ]

> +	parent_fwspec.fwnode =3D domain->parent->fwnode;
> +	parent_fwspec.param_count =3D 3;
> +	parent_fwspec.param[0] =3D 0;
> +	parent_fwspec.param[1] =3D hwirq;

[Severity: High]
Does passing the MPM pin number directly to the parent GIC domain map the
wrong interrupt?

The parent GIC domain expects a GIC SPI number in param[1], not the MPM pin
number extracted from fwspec->param[0]. The correct mapped SPI should be
looked up and passed here instead.

[ ... ]

> +struct msm8660_mpm *msm8660_mpm_get(struct device *consumer,
> +				    struct device_node *np,
> +				    const char *propname)
> +{
> +	struct device_node *mpm_np;
> +	struct device_link *link;
> +
> +	if (!msm8660_mpm_global)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	if (np && propname) {
> +		mpm_np =3D of_parse_phandle(np, propname, 0);
> +		if (!mpm_np)
> +			return ERR_PTR(-ENOENT);
> +		of_node_put(mpm_np);

[Severity: Low]
Should this function verify that the resolved mpm_np actually matches
msm8660_mpm_global->dev->of_node?

If a consumer's DT property points to a completely different node by mistak=
e,
it appears this code will still drop the reference and successfully return
the global MPM handle anyway.

> +	}
> +
> +	if (!consumer)
> +		return msm8660_mpm_global;
> +
> +	link =3D device_link_add(consumer, msm8660_mpm_global->dev,
> +			       DL_FLAG_AUTOREMOVE_CONSUMER);

[Severity: High]
Can msm8660_mpm_global->dev be dereferenced safely here without a lock?

If this races with a sysfs unbind of the MPM driver, msm8660_mpm_global
could be set to NULL or freed, leading to a use-after-free.

[ ... ]

> +int msm8660_mpm_enable_pin(struct msm8660_mpm *mpm, unsigned int pin,
> +			   bool enable)
> +{
> +	u32 val;
> +
> +	if (!mpm || pin >=3D MSM8660_MPM_PIN_COUNT)
> +		return -EINVAL;
> +
> +	val =3D msm8660_mpm_read(mpm,
> +		MSM8660_MPM_REG_ENABLE + (pin / 32) * 4);

[Severity: High]
Does this raw-pin consumer API modify the ENABLE register without locking?

Concurrent calls from different consumer drivers could overwrite each other=
's
enable states without mutual exclusion.

[ ... ]

> +static void msm8660_mpm_remove(struct platform_device *pdev)
> +{
> +	struct msm8660_mpm *mpm =3D platform_get_drvdata(pdev);
> +
> +	/*
> +	 * Tear down in strict reverse order: drop the singleton so new
> +	 * consumers cannot grab a handle, free the IRQ so the handler
> +	 * cannot fire again, free the mailbox channel, then remove the
> +	 * domain. Consumer device_links established in msm8660_mpm_get()
> +	 * prevent the parent device from being unbound while a consumer
> +	 * still holds a handle.
> +	 */
> +	msm8660_mpm_global =3D NULL;
> +	free_irq(mpm->parent_irq, mpm);
> +	if (mpm->mbox_chan)
> +		mbox_free_channel(mpm->mbox_chan);
> +	irq_domain_remove(mpm->domain);

[Severity: High]
Does allowing sysfs unbind lead to a use-after-free in the core IRQ subsyst=
em?

While consumer drivers are unbound due to the device_link, their virtual IRQ
mappings persist in the core IRQ subsystem because they do not automatically
call irq_dispose_mapping().

Removing the domain here frees the domain memory, but the core IRQ subsystem
retains dangling pointers to it in irq_data structures.

> +}

[ ... ]

> +static struct platform_driver msm8660_mpm_driver =3D {
> +	.probe		=3D msm8660_mpm_probe,
> +	.remove		=3D msm8660_mpm_remove,
> +	.driver		=3D {
> +		.name	=3D "msm8660-mpm",

[Severity: High]
Should this driver set .suppress_bind_attrs =3D true?

Without it, the driver can be unbound via sysfs, which triggers the
irq_domain_remove() use-after-free issue described above.

> +		.of_match_table =3D msm8660_mpm_of_match,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780195817.gi=
t.github.com@herrie.org?part=3D2
