Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107553;
	b=x7s9PYLvnTVk5RoYY4q+jFEFdd5W/QmCJ0yPLm3UmfE7i+H4tOu3d/mUBBTf3M8Krzte
	 GFP2ZQa35PbGqcbQU2gE5L2px4LQ3+FxYcwqn0PEeC3ue0zwqMobASDOrh57EPo9Xvj5R
	 7Yat/79qL4o7W9+EprLMXFUW+BrOdul0DRC+YCFbeyF2hSJNM+01eU2ieHieOhX7P5l4F
	 YNUx2eas8mV7ohM1PJQabeH2h68z12fFP9b5/Tqiae+1FBHjcC2PSdoxh/cd3Aw/r/NJ6
	 3Al0oh2h1W5c7TqJs1oZaDQEHM3TgMjH3SqcWxxcaaQ2KAtoHG0Ec8palOs9ybz5Z5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107553;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RrW2+4s9LaLUmo+x0DSUTXYUFQyq89sdLbzYakuLhUk=;
	b=CD78BpmpkEDu1XF8Ri+76XQMhHQLjaR1+Eohk+Vk8OrESMTfxEbWFV4Kfe/xPlby0ic+
	 0dYerj/M/k2vHyOADh8zS6Ll/WkGBPPuB8b9tPJauAcqr76AFERRx5j/Z3IWw7oKHCGIw
	 CkT7UpzDsBn/+PsEnE30tVvTBjckoxkEcJ/LciLK4M6hOA0Wlofe3ucY6Qcp4/o3xYBhU
	 aAf1k7bIfsMct2e/sGuXAHfZoKc4DiZIy7IXHy0Xm3zeSpKBpKHVCguf6IRLkqKaxbw3C
	 Lw7kY33GbCoWbFUilXNf2u/bwNUXraCrAY5fFHLELiKElkWikd443wD+E4ILE/BAfHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxnPGKIo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026C3606A322
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxnPGKIo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FFA1F031E4;
	Tue, 27 Oct 2026 13:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107552;
	bh=RrW2+4s9LaLUmo+x0DSUTXYUFQyq89sdLbzYakuLhUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QxnPGKIo9pbovC12apdevsPlJdMcFKchFtxxuhaq+qN4Qr6pdnfIA+jCItBo1srwp
	 XBN4BATvvzz8eMNZSAZ4qcMZJYdTKmz+SVC1Ci3viIvUD/3rZIMETTQX2DbUn5FMi2
	 Urd5+rsiiBnc9h6ggjaDfNVIP0WLOqYE+RZEqOdjqhAftelFZljZl0QTkSZvSrWXTv
	 Eld0MzQ3KAoIfO5jCyGqMmjcjhwOaz5JbUoQOCkEHrrFMtNfRbSB9XE448uVMx9wZv
	 0Qi4xC/TYfIicLo3BUwdz0IlI9D4FQCPVNzJ7TOHGTmY+5t4zquzPsQguc6wdet3Vr
	 1p4dx5o3IHNLg==
Message-ID: <sashiko-outbox-186618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add CPU idle states
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-2-424abcdcf824@oss.qualcomm.com>
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
 <20261027-b4-shikra_lpm_addition-v3-2-424abcdcf824@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:25:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] irqchip/qcom-mpm: uninitialized genpd and notifier UAF in qcom_mpm=
_probe()
- [High] arm64: dts: qcom: shikra: invalid lock nesting and premature MPM n=
otification
- [Medium] irqchip/qcom-mpm: cpus_in_pm counter leak on error in mpm_cpu_pm=
_callback()
--

commit bc4ed1a6ee147014bad47b72745f44c888126bd9
Author: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add CPU idle states

This commit adds PSCI CPU and cluster idle states for Shikra and removes
#power-domain-cells from the MPM node so the driver uses CPU PM
notifications instead of acting as a power domain provider.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 92d22e3b6931c..aeb608fd7180a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> @@ -334,7 +426,6 @@ mpm: interrupt-controller {
>  			mboxes =3D <&apcs_glb 1>;
>  			interrupt-controller;
>  			#interrupt-cells =3D <2>;
> -			#power-domain-cells =3D <0>;

[Severity: High]
When #power-domain-cells is removed from the mpm node, qcom_mpm_probe() in
drivers/irqchip/irq-qcom-mpm.c takes the else branch and registers the CPU
PM notifier instead of initializing genpd:

	struct generic_pm_domain *genpd;
	...
	priv->mbox_chan =3D mbox_request_channel(&priv->mbox_client, 0);
	...
	if (of_find_property(np, "#power-domain-cells", NULL)) {
		genpd =3D &priv->genpd;
		...
	} else {
		priv->mpm_pm.notifier_call =3D mpm_cpu_pm_callback;
		ret =3D cpu_pm_register_notifier(&priv->mpm_pm);
		if (ret) {
			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
			return ret;
		}
	}

If a subsequent step in qcom_mpm_probe() fails, the error cleanup path runs:

remove_domain:
	irq_domain_remove(priv->domain);
remove_genpd:
	pm_genpd_remove(genpd);
free_mbox:
	mbox_free_channel(priv->mbox_chan);
	return ret;

If devm_request_irq() fails, execution jumps to remove_domain and falls
through to remove_genpd, passing the uninitialized stack pointer genpd to
pm_genpd_remove().

Furthermore, if irq_find_host(), irq_domain_create_hierarchy(), or
devm_request_irq() fails after cpu_pm_register_notifier(&priv->mpm_pm)
succeeds, the error path never calls
cpu_pm_unregister_notifier(&priv->mpm_pm). When devres frees priv on probe
failure, &priv->mpm_pm remains linked in the global cpu_pm_notifier chain
and will be dereferenced after free on the next CPU idle entry. And if
cpu_pm_register_notifier() itself fails, returning directly leaks
priv->mbox_chan.

Could qcom_mpm_probe() initialize genpd to NULL, guard pm_genpd_remove(),
unregister the CPU PM notifier on error, and jump to free_mbox when
cpu_pm_register_notifier() fails before switching Shikra to this path?

[Severity: Medium]
Switching the mpm node to the mpm_cpu_pm_callback() path also exposes an
error handling issue in drivers/irqchip/irq-qcom-mpm.c when
handle_rpm_notification() fails:

static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long ac=
tion, void *v)
{
	struct qcom_mpm_priv *priv =3D container_of(nfb, struct qcom_mpm_priv, mpm=
_pm);
	int cpus_in_pm;

	switch (action) {
	case CPU_PM_ENTER:
		cpus_in_pm =3D atomic_inc_return(&priv->cpus_in_pm);
		...
		if (cpus_in_pm < num_online_cpus())
			return NOTIFY_OK;
		break;
	case CPU_PM_ENTER_FAILED:
	case CPU_PM_EXIT:
		atomic_dec(&priv->cpus_in_pm);
		return NOTIFY_OK;
	default:
		return NOTIFY_DONE;
	}

	if (handle_rpm_notification(priv))
		return NOTIFY_BAD;

	return NOTIFY_OK;
}

During cpu_pm_enter(), raw_notifier_call_chain_robust() invokes
notifier_call_chain_robust() in kernel/notifier.c:

	ret =3D notifier_call_chain(nl, val_up, v, -1, &nr);
	if (ret & NOTIFY_STOP_MASK)
		notifier_call_chain(nl, val_down, v, nr-1, NULL);

When a callback returns NOTIFY_BAD, CPU_PM_ENTER_FAILED is only sent to the
nr - 1 callbacks that preceded the failing one, and cpu_pm_enter() returns
an error so cpu_pm_exit() is not called.

If handle_rpm_notification(priv) fails (for example, if mbox_send_message()
returns -ENOBUFS), wouldn't returning NOTIFY_BAD without decrementing
priv->cpus_in_pm leave priv->cpus_in_pm permanently skewed by +1?

[Severity: High]
With #power-domain-cells removed from mpm while adding both per-CPU PSCI
idle states (little-power-down, little-pll-power-down, big-power-down,
big-pll-power-down) and a cluster idle state (cluster-power-down), the
call chain on CPU idle entry becomes:

cpu_pm_enter()
  -> cpu_pm_notify_robust()
       raw_spin_lock_irqsave(&cpu_pm_notifier.lock, flags);
       -> mpm_cpu_pm_callback()
            -> handle_rpm_notification()
                 -> mbox_send_message()
                      -> add_to_rbuf()
                           guard(spinlock_irqsave)(&chan->lock);

Because cpu_pm_notifier.lock is a raw_spinlock_t and chan->lock in
drivers/mailbox/mailbox.c is a non-raw spinlock_t, won't acquiring
chan->lock inside mpm_cpu_pm_callback() trigger an invalid wait context bug
under CONFIG_PROVE_RAW_LOCK_NESTING and sleep in atomic context from the
idle task on PREEMPT_RT?

In addition, cpuidle-psci calls cpu_pm_enter() for every non-WFI per-CPU
idle state (via psci_enter_idle_state()) and before
pm_runtime_put_sync_suspend() determines whether cluster_pd actually enters
cluster-power-down (in __psci_enter_domain_idle_state()). Won't
mpm_cpu_pm_callback() clear MPM_REG_STATUS and notify RPM whenever all
CPUs enter shallow per-CPU idle states, even when the cluster does not
power down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-b4-shikra_=
lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com?part=3D2
