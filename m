Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107975;
	b=N+SuhpMRuhq+VNjvS6OM2Y1TMostAwjtBKUfmIGz6G9mrejEWyyCwkbdiFfIQpaqPuAJ
	 iYJUJJo/oP0ovLCcjY2JH0xU/2gsJ5ted0XDvzTuh7MNrVBcL9yZv1O585LP1hIjw5j/L
	 jcUxEhoCmY7f/r/b5l9RYt1F47lGd11RIqwL/LF9qG/g1u6RPho0SUGlTCeBsV2paJhFx
	 I8jdP+cDw7/+UXPuSfIip+ffSODc+RE8rkmCbkL7b2Kd7HdtYZgFzfMmdDiF3aTkEmV9L
	 f+tmU0BZJIPffb4DyK+tA+ghyYWtQS2Q7qewte8JOx8cNu3C9CsXvrhjIzEI5OvGOpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107975;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UEy0TcRX1S5R+bnhfbOCObv9bkeLjZMqmT4NQiwxL1w=;
	b=DFULxJokUz0/fq2YffNmAAfY1Q3nzNjhi8K6EdUZjLKmQb3UQ14bXTx4T36dqTxNH1dk
	 wtz8bu94ukC6u1hYMMpragMoJl16L0TOlWXN+TkWQ+pcVIfv23StuIfr10sZy/e5Gihcv
	 4qj//lAwWI19t9GxEjD0+TTo8xqW3/e8AQ6rmpteape9t9oPvDAOqgkVfT1VqUl4sWkDx
	 T13/wck/ZXeTRsu+VUIH2rBX8GbNui+qqAdfof4aWmgY7qGYcPGwkoODYMnhca7uBmQDL
	 W59tAiBE3jwvF5G53dGbzH8BkfFzlK+OnAoc4r5KfNRRfc7kI8L8lK0hX1nGWcrLBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDAj9y7L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F53606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDAj9y7L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353E11F01825;
	Tue, 27 Oct 2026 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107974;
	bh=UEy0TcRX1S5R+bnhfbOCObv9bkeLjZMqmT4NQiwxL1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NDAj9y7LfXkDCUIdcfJP7w95+VqnI8kkeZyWddOMcnvY7dQFZ/4M5Q+ThA/rYmexa
	 pvBAuPw30ithI/8ND5A2snnrIBgafpr62gvFCXObmgAHcajZHuMsjQcJTIcfxpJZrT
	 oNv/m8ldhrlF1utZ0ilPnuFk2Sf+qH+iAgbx44jXkKyQKKUHGtHRZRMZLDI3jR/Ccb
	 GJGdc4Ku8s8KDXolG3G150HqThO8a9EtJdknx3YbMEB/iIApZLqTEhu/yd3OG8TyQA
	 iQeOKU2wccrXh74Qjb2N82rjC//z5oZM3qaOqOb+dTEIke6vmi4r5Vc/caeav2acBc
	 Q7s8q+lGGCrig==
Message-ID: <sashiko-outbox-186627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
References: <20261027-b4-shikra_lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com>
 <20261027-b4-shikra_lpm_addition-v3-1-424abcdcf824@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:32:53 +0000
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
- [Critical] irqchip/qcom-mpm: broken error handling and UAF in qcom_mpm_pr=
obe()
- [High] irqchip/qcom-mpm: cpus_in_pm not decremented on failure in mpm_cpu=
_pm_callback()
- [High] irqchip/qcom-mpm: invalid spinlock_t nesting in mpm_cpu_pm_callbac=
k()
- [High] irqchip: irq-qcom-mpm: cpus_in_pm underflow when probing with idle=
 CPUs
--

commit 0b0c9281cd528ac3d6a6f2d4a69ee74beee11616
Author: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification

This commit updates the Qualcomm MPM irqchip driver to register a CPU PM
notifier when the device tree node does not specify #power-domain-cells,
notifying the RPM processor when the last online CPU enters idle.

> diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mp=
m.c
> index 8c575d7ce8a17..b6caea90e9f41 100644
> --- a/drivers/irqchip/irq-qcom-mpm.c
> +++ b/drivers/irqchip/irq-qcom-mpm.c

[ ... ]

> @@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domai=
n *genpd)
>  		return ret;
> =20
>  	mbox_client_txdone(priv->mbox_chan, 0);
> -
>  	return 0;
>  }
> =20
> +static int mpm_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +	struct qcom_mpm_priv *priv =3D container_of(genpd, struct qcom_mpm_priv,
> +						  genpd);
> +
> +	return handle_rpm_notification(priv);
> +}
> +
> +static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long=
 action, void *v)
> +{
> +	struct qcom_mpm_priv *priv =3D container_of(nfb, struct qcom_mpm_priv, =
mpm_pm);
> +	int cpus_in_pm;
> +
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		cpus_in_pm =3D atomic_inc_return(&priv->cpus_in_pm);
> +		/*
> +		 * NOTE: comments for num_online_cpus() point out that it's
> +		 * only a snapshot so we need to be careful. It should be OK
> +		 * for us to use, though.  It's important for us not to miss
> +		 * if we're the last CPU going down so it would only be a
> +		 * problem if a CPU went offline right after we did the check
> +		 * AND that CPU was not idle AND that CPU was the last non-idle
> +		 * CPU. That can't happen. CPUs would have to come out of idle
> +		 * before the CPU could go offline.
> +		 */
> +		if (cpus_in_pm < num_online_cpus())
> +			return NOTIFY_OK;
> +		break;
> +	case CPU_PM_ENTER_FAILED:
> +	case CPU_PM_EXIT:
> +		atomic_dec(&priv->cpus_in_pm);
> +		return NOTIFY_OK;

[Severity: High]
Can priv->cpus_in_pm underflow if other CPUs are already in idle when
qcom_mpm_probe() registers this notifier?

Because MPM is no longer a power domain provider for the PSCI cluster domai=
n,
psci_cpuidle_domain_probe() and psci_cpuidle_probe() in
drivers/cpuidle/cpuidle-psci.c can initialize cpuidle before qcom_mpm_probe=
()
runs (for example, when CONFIG_QCOM_MPM, CONFIG_QCOM_SMD_RPM, or
CONFIG_QCOM_APCS_IPC is built as a module or defers probe).

If one or more CPUs have already entered idle via cpu_pm_enter() when
qcom_mpm_probe() calls cpu_pm_register_notifier(&priv->mpm_pm) with
priv->cpus_in_pm initialized to 0, those idle CPUs will later wake up and
invoke cpu_pm_exit() -> mpm_cpu_pm_callback(CPU_PM_EXIT) without a matching
CPU_PM_ENTER.

That decrements priv->cpus_in_pm below zero when all CPUs are active, so
subsequent CPU_PM_ENTER transitions will never reach num_online_cpus() and
handle_rpm_notification() will never be called.

> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	if (handle_rpm_notification(priv))
> +		return NOTIFY_BAD;

[Severity: High]
If handle_rpm_notification(priv) fails here in mpm_cpu_pm_callback() in
drivers/irqchip/irq-qcom-mpm.c, does priv->cpus_in_pm remain permanently
incremented by one?

On the CPU_PM_ENTER path, priv->cpus_in_pm is incremented before calling
handle_rpm_notification(priv). In kernel/cpu_pm.c, cpu_pm_enter() calls
cpu_pm_notify_robust(), which uses raw_notifier_call_chain_robust() to send
CPU_PM_ENTER_FAILED only to the callbacks that succeeded prior to the faili=
ng
callback:

kernel/notifier.c:notifier_call_chain_robust()
    ret =3D nb->notifier_call(nb, val_up, v);
    if (ret & NOTIFY_STOP_MASK) {
        notifier_call_chain(nl, val_down, v, nr - 1, NULL);
        ...
    }

Because mpm_cpu_pm_callback() will not receive CPU_PM_ENTER_FAILED (and the
caller aborts idle entry without calling cpu_pm_exit()), returning NOTIFY_B=
AD
without calling atomic_dec(&priv->cpus_in_pm) leaves priv->cpus_in_pm skewed
by +1, causing future idle entries to trigger handle_rpm_notification() whi=
le
a CPU is still active.

[Severity: High]
Also, is it valid to call handle_rpm_notification(priv) from
mpm_cpu_pm_callback() while holding the raw spinlock in cpu_pm_notify_robus=
t()?

In kernel/cpu_pm.c, cpu_pm_notify_robust() holds cpu_pm_notifier.lock (a
raw_spinlock_t) across the entire notifier chain:

kernel/cpu_pm.c:cpu_pm_notify_robust()
    raw_spin_lock_irqsave(&cpu_pm_notifier.lock, flags);
    ret =3D raw_notifier_call_chain_robust(&cpu_pm_notifier.chain, event_up=
, event_down, NULL);
    raw_spin_unlock_irqrestore(&cpu_pm_notifier.lock, flags);

Inside mpm_cpu_pm_callback(), handle_rpm_notification() invokes
mbox_send_message() and mbox_client_txdone() in drivers/mailbox/mailbox.c,
where add_to_rbuf(), msg_submit(), and tx_tick() acquire chan->lock (a
non-raw spinlock_t). In addition, msg_submit() calls
qcom_apcs_ipc_send_data() in drivers/mailbox/qcom-apcs-ipc-mailbox.c, which
calls regmap_write() on a regmap without use_raw_spinlock set, acquiring
map->spinlock (another non-raw spinlock_t).

Acquiring a spinlock_t while holding a raw_spinlock_t violates lockdep wait=
-type
nesting rules under CONFIG_PROVE_RAW_LOCK_NESTING=3Dy and sleeps in atomic =
idle
context on PREEMPT_RT kernels.

> +
> +	return NOTIFY_OK;
> +}
> +
>  static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 h=
wirq)
>  {
>  	int i;

[ ... ]

> @@ -444,6 +467,35 @@ static int qcom_mpm_probe(struct platform_device *pd=
ev, struct device_node *pare
>  		return ret;
>  	}
> =20
> +	if (of_find_property(np, "#power-domain-cells", NULL)) {
> +		genpd =3D &priv->genpd;
> +		genpd->flags =3D GENPD_FLAG_IRQ_SAFE;
> +		genpd->power_off =3D mpm_pd_power_off;
> +
> +		genpd->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
> +		if (!genpd->name)
> +			return -ENOMEM;
> +
> +		ret =3D pm_genpd_init(genpd, NULL, false);
> +		if (ret) {
> +			dev_err(dev, "failed to init genpd: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret =3D of_genpd_add_provider_simple(np, genpd);
> +		if (ret) {
> +			dev_err(dev, "failed to add genpd provider: %d\n", ret);
> +			goto remove_genpd;
> +		}
> +	} else {
> +		priv->mpm_pm.notifier_call =3D mpm_cpu_pm_callback;
> +		ret =3D cpu_pm_register_notifier(&priv->mpm_pm);
> +		if (ret) {
> +			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret=
);
> +			return ret;
> +		}
> +	}
> +
>  	parent_domain =3D irq_find_host(parent);
>  	if (!parent_domain) {
>  		dev_err(dev, "failed to find MPM parent domain\n");
> @@ -471,10 +523,10 @@ static int qcom_mpm_probe(struct platform_device *p=
dev, struct device_node *pare
> =20
>  remove_domain:
>  	irq_domain_remove(priv->domain);
> -free_mbox:
> -	mbox_free_channel(priv->mbox_chan);
>  remove_genpd:
>  	pm_genpd_remove(genpd);
> +free_mbox:
> +	mbox_free_channel(priv->mbox_chan);
>  	return ret;
>  }

[Severity: Critical]
Does the error cleanup in qcom_mpm_probe() in drivers/irqchip/irq-qcom-mpm.c
mishandle failure paths in both the genpd and cpu_pm branches?

There appear to be four related issues on probe failure:

1. In qcom_mpm_probe(), the local variable genpd is declared without
initialization:

    struct generic_pm_domain *genpd;

When #power-domain-cells is absent, the else branch is taken and genpd rema=
ins
uninitialized. If devm_request_irq() subsequently fails and jumps to
remove_domain, execution falls through to remove_genpd and calls
pm_genpd_remove(genpd) with an uninitialized pointer.

2. In the else branch, cpu_pm_register_notifier(&priv->mpm_pm) registers the
notifier block embedded in devm-allocated priv into the global cpu_pm_notif=
ier
chain. If irq_find_host(), irq_domain_create_hierarchy(), or
devm_request_irq() fails, cpu_pm_unregister_notifier(&priv->mpm_pm) is never
called before devres frees priv, leaving a dangling notifier in the global
chain.

3. Because remove_genpd now precedes free_mbox, if #power-domain-cells is
present and irq_find_host() or irq_domain_create_hierarchy() fails, jumping=
 to
free_mbox skips remove_genpd (and of_genpd_del_provider(np)), leaving
priv->genpd registered after priv is freed.

4. Because mbox_request_channel() is now called before the genpd and cpu_pm
setup, the direct return statements on !genpd->name, pm_genpd_init() failur=
e,
and cpu_pm_register_notifier() failure return without calling
mbox_free_channel(priv->mbox_chan), leaking the mailbox channel with a
dangling client pointer once priv is freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-b4-shikra_=
lpm_addition-v3-0-424abcdcf824@oss.qualcomm.com?part=3D1
