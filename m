Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897111;
	b=xKhedoYr10oE7gTZc6KbnRhkt/11F5PScD2az3UYslJaKWJ47df6DHQal4Hs440qHTUB
	 k2kTmOEPcKKOEZHToJZf8CFWagWQSHKkepRtzPTivwVm/JKi43kVQYd9GswiqzadosNxG
	 ItManaiGsALo+N9Prwokc41X5guh9oHGUGzi105wcT8TmXx8x3/lwhFDVIX5z7fITRqSE
	 gsUHBfJE39MWUKvhvrs2BIY98f6OPD2+kPaoBDXRJiRTNHQ5EFks8NVs0FDQzbIoQl2qt
	 AZn9fXaCfQsXsU0Ep5WP9kJcMXGKVCR3yAL3d6aWrIP5swa2m86Dz7Wx3WL5mCWYZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lcWS3mM7T+8n/U0+o4X26sVqge8x1PjsV6A6vYeShO4=;
	b=MKyr/sEg7AIYByPbcVVO4K4jMV5pHC4xuAr4WCIJBrOiBOwxGnKL8TrBGs9sv8yTiZhz
	 nm0evpW85YAhSKzFoaHZZdYd2CjHsuE/N6w4YqbkWsP3ONpdJxeb+a5hTgoGDFz0qYxlz
	 jY62DCaHXE2taXvGUv3Vx7yuOxyg3YHIp1vF5CR4j3w/mnlYvA+WRvOH6ROf5+9XyFpy/
	 KA11JSv/62032oyv0SR22FXRR6+zORQDDMi+WOeNwlh+DC/hvytoToIT1Z8Flert7yBXL
	 xEOWMM/U4Hhq12LDiBKpRGOjHDCTfZKlGgtwDNo0eY0KzS6+xWGM4lQXaCfH5NlFbFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mg/OuWZn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F629606A336
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mg/OuWZn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C277C1F00919;
	Thu,  5 Nov 2026 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793897111;
	bh=lcWS3mM7T+8n/U0+o4X26sVqge8x1PjsV6A6vYeShO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mg/OuWZnhYSnvU3+t1WtlQ1iFzTc9rSOFUX9vgTcCx9IscC3ljdAigGHkQM4Hek6q
	 b1Xi/ECkZGP5jTTMvGdeDf+lX4UnMhMzSx1UHJZzCiPe4ZHdz2CYtWNw9avXXJ/ak8
	 NgvgVEZAsGFv6dsEcie+USS4fZTWwOxggw48XskICy5rp1xcvUiIcmUQdnKq4gIlIW
	 WqsR5oRnkShHUmhO60Px6LS6KNXH6hL6F9de+MBPrEsvL8/rm+xcbx5VLhG1RXLP6P
	 4yIRevlyhMp0UKukqafbUZTQVClHfSXtQyYemoiovN0OWCyFBxBMoHsR2h7kbjTCCy
	 hoL3PYbDU/pNg==
Message-ID: <sashiko-outbox-199523@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 RESEND 5/6] firmware: smccc: lfa: Register DT
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102165421.3651202-6-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-6-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:45:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] firmware: smccc: lfa: probe success treated as error in lfa_sm=
ccc_probe()
- [High] firmware: smccc: lfa: invalid IRQF_COND_ONESHOT in lfa_register_dt=
()
- [High] firmware: smccc: lfa: infinite retry loop in prime_fw_component()
- [Medium] firmware: smccc: lfa: unconditional devm_free_irq() in lfa_smccc=
_remove()
- [Medium] firmware: smccc: lfa: missing kobject cleanup on lfa_smccc_probe=
() error
- [Low] firmware: smccc: lfa: missing linux/interrupt.h include in lfa_fw.c
--

commit 336251e18192897c278c68cc88128e6b0243d876
Author: Andre Przywara <andre.przywara@arm.com>

firmware: smccc: lfa: Register DT interrupt

This commit adds support for finding an arm,lfa devicetree node and
registering its threaded interrupt handler to trigger pending Live
Firmware Activation updates when ACPI is disabled.

> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c
> index 65f28ffc9d108..3ff368dca9497 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -46,6 +46,8 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/nmi.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/psci.h>
>  #include <linux/rwsem.h>
>  #include <linux/stop_machine.h>

[Severity: Low]
As reported by kernel test robot on v2 [1], does drivers/firmware/smccc/lfa=
_fw.c
fail to build when CONFIG_ACPI is disabled?

The new code uses irqreturn_t, IRQ_HANDLED, IRQF_COND_ONESHOT,
devm_request_threaded_irq(), and devm_free_irq(), which are declared in
linux/interrupt.h. When CONFIG_ACPI=3Dy, linux/acpi.h pulls in
linux/interrupt.h transitively, but with CONFIG_ACPI=3Dn neither linux/of.h
nor linux/of_irq.h includes it, resulting in implicit function declaration
and undeclared identifier errors. Should linux/interrupt.h be included
explicitly here?

[ ... ]

> @@ -913,6 +916,31 @@ static void lfa_remove_acpi(struct device *dev)
>  }
>  #endif
> =20
> +static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
> +{
> +	activate_pending_components();
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
When lfa_irq_handler_thread() invokes activate_pending_components() ->
prime_fw_component(), can prime_fw_component() get stuck in an infinite
loop if priming requires at least one retry?

In drivers/firmware/smccc/lfa_fw.c:prime_fw_component():

	bool retry =3D false;
	...
	do {
		...
		if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) {
			if (ktime_before(ktime_get(), end)) {
				if (msleep_interruptible(LFA_PRIME_DELAY_MS)) {
					ret =3D -EINTR;
					break;
				}
			} else {
				pr_err("LFA_PRIME for component %s timed out",
				       kobject_name(&comp->kobj));
				ret =3D -ETIMEDOUT;
				break;
			}
			retry =3D true;
		}
	} while (retry);

Once LFA_PRIME_CALL_AGAIN is set on an initial ARM_SMCCC_LFA_PRIME call,
retry is set to true. On a subsequent iteration where firmware finishes
priming and returns regs.a0 =3D=3D 0 with LFA_PRIME_CALL_AGAIN cleared in
regs.a1, the if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) branch is not entered
and retry is never reset to false, causing while (retry) to spin
indefinitely issuing SMC calls without sleeping or checking the timeout.

> +
> +static int lfa_register_dt(struct device *dev)
> +{
> +	struct device_node *np;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "arm,lfa");
> +	if (!np)
> +		return -ENODEV;
> +
> +	lfa_irq =3D irq_of_parse_and_map(np, 0);
> +	of_node_put(np);
> +	if (!lfa_irq)
> +		return -ENODEV;
> +
> +	return devm_request_threaded_irq(dev, lfa_irq, NULL,
> +					 lfa_irq_handler_thread, IRQF_COND_ONESHOT,
> +					 NULL, NULL);
> +}

[Severity: High]
As reported by Sashiko on v2 [2], will devm_request_threaded_irq() in
lfa_register_dt() always fail with -EINVAL on standard Arm GIC interrupt
controllers?

Passing NULL as the primary handler causes request_threaded_irq() to assign
irq_default_primary_handler. In __setup_irq(), IRQF_COND_ONESHOT only sets
IRQF_ONESHOT when joining an already-shared interrupt line whose existing
action has IRQF_ONESHOT set. Because this interrupt is not shared,
IRQF_ONESHOT remains unset, and __setup_irq() rejects the request:

	} else if (new->handler =3D=3D irq_default_primary_handler &&
		   !(desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)) {
		pr_err("Threaded irq requested with handler=3DNULL and !ONESHOT for %s (i=
rq %d)\n",
		       new->name, irq);
		ret =3D -EINVAL;
		goto out_unlock;
	}

Since standard Arm GIC irqchips do not set IRQCHIP_ONESHOT_SAFE, this
returns -EINVAL and aborts lfa_smccc_probe(). Should this pass IRQF_ONESHOT
instead of IRQF_COND_ONESHOT?

> +
>  static bool lfa_smccc_has_all_functions(void)
>  {
>  	struct arm_smccc_1_2_regs regs =3D { 0 }, res;
> @@ -980,6 +1008,10 @@ static int lfa_smccc_probe(struct arm_smccc_device =
*sdev)
>  		err =3D lfa_register_acpi(&sdev->dev);
>  		if (!err)
>  			pr_info("registered LFA ACPI notification\n");
> +	} else {
> +		err =3D lfa_register_dt(&sdev->dev);
> +		if (!err)
> +			pr_info("registered LFA DT notification interrupt\n");
>  	}
> =20
>  	/*

[Severity: Critical]
When lfa_register_dt() or lfa_register_acpi() succeeds and returns 0 in
lfa_smccc_probe(), doesn't the immediately following error check tear down
lfa_kset and fw_comps_update_wq while still returning 0 from probe?

In drivers/firmware/smccc/lfa_fw.c:lfa_smccc_probe():

	/*
	 * An ACPI notification or an interrupt are optional, but we must
	 * handle errors that occurred during their setup.
	 */
	if (err !=3D -ENODEV) {
		kset_unregister(lfa_kset);
		destroy_workqueue(fw_comps_update_wq);
		return err;
	}

When err is 0, (err !=3D -ENODEV) is true, so lfa_smccc_probe() unregisters
lfa_kset, destroys fw_comps_update_wq, and returns 0. Because probe returns
0, the device remains bound with the DT interrupt or ACPI notify handler
registered, leading to a use-after-free on lfa_kset and fw_comps_update_wq
when a notification fires or when lfa_smccc_remove() runs. Should the
condition be if (err && err !=3D -ENODEV)?

[Severity: Medium]
As reported by Sudeep Holla on v4 [3], when lfa_smccc_probe() fails after
update_fw_components_tree() (for example when lfa_register_dt() or
lfa_register_acpi() returns a real error, or if update_fw_components_tree()
fails after adding components), does the error path leak the allocated
fw_component kobjects and race with fw_comps_update_work?

Unlike lfa_smccc_remove(), the error cleanup in lfa_smccc_probe():

	if (err !=3D -ENODEV) {
		kset_unregister(lfa_kset);
		destroy_workqueue(fw_comps_update_wq);
		return err;
	}

does not call clean_fw_components_tree() to drop the child fw_component
kobjects added under lfa_kset, and it calls kset_unregister(lfa_kset)
before flushing and destroying fw_comps_update_wq while
remove_invalid_fw_components() may still be accessing lfa_kset.

> @@ -999,6 +1031,7 @@ static void lfa_smccc_remove(struct arm_smccc_device=
 *sdev)
>  {
>  	if (!acpi_disabled)
>  		lfa_remove_acpi(&sdev->dev);
> +	devm_free_irq(&sdev->dev, lfa_irq, NULL);
>  	clean_fw_components_tree();
>  	flush_workqueue(fw_comps_update_wq);
>  	destroy_workqueue(fw_comps_update_wq);

[Severity: Medium]
In lfa_smccc_remove(), won't calling devm_free_irq() unconditionally
trigger a WARN_ON() when ACPI is used or when the optional DT interrupt
was not registered?

On ACPI systems (!acpi_disabled) or DT systems where the arm,lfa node or
its interrupt is absent, devm_request_threaded_irq() is never called and
lfa_irq remains 0. Calling devm_free_irq(&sdev->dev, lfa_irq, NULL) in
lfa_smccc_remove() causes devres_release() in kernel/irq/devres.c to fail
to find a matching devres entry and trigger WARN_ON(). Should
devm_free_irq() only be called when lfa_irq is non-zero (or omitted since
the IRQ is managed via devm on &sdev->dev)?

[1] https://lore.kernel.org/r/202603181913.NFRwBsN4-lkp@intel.com
[2] https://lore.kernel.org/r/20260317103336.1273582-8-andre.przywara@arm.c=
om
[3] https://lore.kernel.org/r/20260921-aloof-sympathetic-python-54aa7d@sude=
epholla

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102165421.3651=
202-1-andre.przywara@arm.com?part=3D5
