Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897613;
	b=hbELM/TlNOcTgSe+nhPx+iAwM6E4WwBOsxJ9FeMZNHnWHJz8B49M9vhPImczKMy3vZAU
	 N2hQeKPrY0UjjAr0GvQ6PW6T+w2P7sxRxdhUFmQx4NdlxwdjEMJjlrAlfuof0Kn+CU9JP
	 opXkm8nk0eVjyFdiuUgaJ5r/eMWhFb0pkeW0bDg+41aRX2QTqGeXNokAUJv5vCr+B92Oa
	 EafiOaBtbMyH8vAECMiOGJR9WS8Ne2AQ3VX0Wh86bZW+OShCM5VElb9d80NAlwrA8XpuE
	 YFXcIWp68qL3/JS9B2QMCfYqmM78UhrfaSpbB/U/7m2zmyc+xkI2X4aj3+owHqtMd1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mOgWS0LxOVwzh95//CcafbB0nPjvCd14ZTWt4Po7xm0=;
	b=IhAPOGpdPaE6F9wO73QBkdkCs45X+DQOuJ5KHmDL4X7l2M2HxgThgNkB8yUpubG/dt2t
	 aMiCjdbBeL7a7clRnCZ0ihKrzNvbNEvk9EptV9R0gj9DLlFXoOsercptbCVnprEyb3bi0
	 smR5xTZyVC0W+r5FK9eJcKDCHfaEhbwHMPbU6eYuNvloqOF1yDsqc8EGlA1gVjmywiDp3
	 Lsj6hQrZIfQMZVbopFeC2t9lY+ZukZarZ9RKp+q0lp+kzxHp+sL0hF6DV/xxtR4JeDQE5
	 XdvsOpZLc3ONqXDtm8bIctlDJtBQL5yXXaDhJrvLqlAa0nB5hOlZeZtV8vEL/D+Snbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MbyTS7dp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B9606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MbyTS7dp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017F61F000C1;
	Thu,  5 Nov 2026 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793897612;
	bh=mOgWS0LxOVwzh95//CcafbB0nPjvCd14ZTWt4Po7xm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MbyTS7dpV6gk0zZ6hYCOdHEEpSOhXpnsVhDLd61M65hI1yHX4uoScSaC62rI6WaKW
	 qN+RR0B+SlXJ6TQ0ejIc0Ey6nwgmt88rCOITapFAB6+V3ZK0u93T9xECEqt6NidEO7
	 jVFnfsiCLqjxOXuaLEZd0t6a7TXD+cAekqnX3wxproAadxSeWfmA0vvOgEYAnQq9Rz
	 4529BdtBBE9HmsH9z0Cz7wOhrfivHjr+B7LK1wAIkyFmYAqlYpWEpViFKIw9lZ4bF+
	 nO/CBPVCbKfI9zPt4y3sqkQ6MKdbl1dctGnGWsNxUJ6oO0Qh8hZeFXLJKAD+13DoTU
	 +oCaShvu3aaZA==
Message-ID: <sashiko-outbox-199554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 RESEND 6/6] firmware: smccc: lfa: add sysfs ABI
 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102165421.3651202-7-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-7-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:53:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] firmware: smccc: lfa: premature teardown on success in lfa_smccc_p=
robe()
- [High] firmware: smccc: lfa: infinite loop in prime_fw_component() on ret=
ry
- [Medium] firmware: smccc: lfa: unconditional devm_free_irq() in lfa_smccc=
_remove()
- [Low] firmware: smccc: lfa: make file-local smc_lock static
--

commit 93a930701ee9d0e354315cd9d9c704901ce6e5c2
Author: Andre Przywara <andre.przywara@arm.com>

firmware: smccc: lfa: add sysfs ABI documentation

This series adds support for the Arm Live Firmware Activation (LFA)
specification over SMCCC, including sysfs attributes, ACPI notifications,
devicetree interrupts, and ABI documentation.

> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c
> new file mode 100644
> index 0000000000000..3ff368dca9497
> --- /dev/null
> +++ b/drivers/firmware/smccc/lfa_fw.c

[ ... ]

> +static struct kset *lfa_kset;
> +static struct workqueue_struct *fw_comps_update_wq;
> +static struct work_struct fw_comps_update_work;
> +static struct attribute *component_default_attrs[LFA_ATTR_NR_IMAGES + 1];
> +static unsigned int lfa_irq;
> +
> +/*
> + * A successful component activation might change the number of available
> + * components, leading to a re-order and thus re-assignment of the seque=
nce IDs.
> + * The lock protects the connection between a firmware component (throug=
h its
> + * user visible UUID) and the sequence IDs. Anyone doing an SMC call with
> + * a sequence ID needs to take the readers lock. Doing an activation req=
uires
> + * the writer lock, as that process might change the assocications.
> + */
> +struct rw_semaphore smc_lock;

[Severity: Low]
This isn't a bug, but since smc_lock is only used within
drivers/firmware/smccc/lfa_fw.c, should it be declared static like the
other file-scope variables above?

[ ... ]

> +static int prime_fw_component(struct fw_component *comp)
> +{
> +	ktime_t end =3D ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
> +	bool retry =3D false;
> +	int ret =3D 0;
> +
> +	if (comp->may_reset_cpu) {
> +		pr_err("CPU reset not supported by kernel driver\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * LFA_PRIME will return 1 in regs.a1 if the firmware priming
> +	 * is still in progress. In that case LFA_PRIME will need to
> +	 * be called again.
> +	 * regs.a1 will become 0 once the prime process completes.
> +	 */
> +	do {
> +		struct arm_smccc_1_2_regs regs =3D {
> +			.a0 =3D ARM_SMCCC_LFA_PRIME,
> +		};
> +
> +		touch_nmi_watchdog();
> +		down_read(&smc_lock);
> +		regs.a1 =3D comp->fw_seq_id;
> +		arm_smccc_1_2_invoke(&regs, &regs);
> +		up_read(&smc_lock);
> +
> +		if ((s64)regs.a0 < 0) {
> +			pr_err("LFA_PRIME for component %s failed: %s (%ld)\n",
> +			       kobject_name(&comp->kobj),
> +			       lfa_error_string((s64)regs.a0), regs.a0);
> +			return lfa_to_linux_errno((s64)regs.a0);
> +		}
> +
> +		if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) {
> +			if (ktime_before(ktime_get(), end)) {
> +				if (msleep_interruptible(LFA_PRIME_DELAY_MS)) {
> +					ret =3D -EINTR;
> +					break;
> +				}
> +			} else {
> +				pr_err("LFA_PRIME for component %s timed out",
> +				       kobject_name(&comp->kobj));
> +				ret =3D -ETIMEDOUT;
> +				break;
> +			}
> +			retry =3D true;
> +		}
> +	} while (retry);

[Severity: High]
Can prime_fw_component() enter an infinite loop when firmware priming
takes more than one call?

In prime_fw_component(), retry is initialized to false before the do-while
loop rather than being reset on each iteration. If the first
ARM_SMCCC_LFA_PRIME call returns LFA_SUCCESS with LFA_PRIME_CALL_AGAIN set
in regs.a1, retry is set to true.

When a subsequent ARM_SMCCC_LFA_PRIME call completes priming and returns
LFA_SUCCESS with LFA_PRIME_CALL_AGAIN cleared, the if block checking
LFA_PRIME_CALL_AGAIN is skipped while retry remains true. Because the
timeout check and msleep_interruptible() are inside that conditional block,
will the loop spin indefinitely calling ARM_SMCCC_LFA_PRIME?

[ ... ]

> +static int lfa_smccc_probe(struct arm_smccc_device *sdev)
> +{

[ ... ]

> +	err =3D update_fw_components_tree();
> +	if (err !=3D 0) {
> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_comps_update_wq);
> +		return err;
> +	}
> +
> +	if (!acpi_disabled) {
> +		err =3D lfa_register_acpi(&sdev->dev);
> +		if (!err)
> +			pr_info("registered LFA ACPI notification\n");
> +	} else {
> +		err =3D lfa_register_dt(&sdev->dev);
> +		if (!err)
> +			pr_info("registered LFA DT notification interrupt\n");
> +	}
> +
> +	/*
> +	 * An ACPI notification or an interrupt are optional, but we must
> +	 * handle errors that occurred during their setup.
> +	 */
> +	if (err !=3D -ENODEV) {
> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_comps_update_wq);
> +		return err;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
When lfa_register_acpi() or lfa_register_dt() succeeds in
lfa_smccc_probe(), err is 0. Since 0 !=3D -ENODEV evaluates to true, doesn't
this error path tear down lfa_kset and fw_comps_update_wq on a successful
registration while still returning 0 from probe, leaving child component
kobjects and the notification handler or interrupt active with freed
resources?

Also, if notification setup fails with a real error after
update_fw_components_tree() has populated component kobjects, should
clean_fw_components_tree() and flush_workqueue() be called before
destroying fw_comps_update_wq and unregistering lfa_kset?

> +
> +static void lfa_smccc_remove(struct arm_smccc_device *sdev)
> +{
> +	if (!acpi_disabled)
> +		lfa_remove_acpi(&sdev->dev);
> +	devm_free_irq(&sdev->dev, lfa_irq, NULL);
> +	clean_fw_components_tree();
> +	flush_workqueue(fw_comps_update_wq);
> +	destroy_workqueue(fw_comps_update_wq);
> +	kset_unregister(lfa_kset);
> +}

[Severity: Medium]
In lfa_smccc_remove(), devm_free_irq() is called unconditionally even when
running with ACPI enabled or when no arm,lfa DT interrupt was registered
during lfa_smccc_probe(). Will this trigger the WARN_ON in devm_free_irq()
when unbinding the driver or unloading the module on systems where no DT
interrupt was requested?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102165421.3651=
202-1-andre.przywara@arm.com?part=3D6
