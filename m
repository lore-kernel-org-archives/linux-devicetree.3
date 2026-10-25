Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958485;
	b=aCQ/BLnkX0pDn7Vs7WGhB9FM+YceEyVC3nzM3Tg/94+DJf2+/9OkHdV7eLTZ0gK9tSRd
	 ydfxms4bI2F33ij7a2SEwgnbBShKvlIxgzd83v8GvGOnuUgvzjp6OEkgG0+mA5wSoHDOV
	 VQQ1O0VgpVjrJh1UJUyEj3SN3Cq/O0t6Xi7gtyZlaHa2H+Nvo8QbzRTRqwoqOEavnX+hD
	 ZfUMP0a13rVw4zzcf55hW4oK82zm4YXCwKPOD8duu//XePftrSfBpatZXOgu8lyGj/yY4
	 r4x+qSl/6BRT/GMpwZKWS0eqaWDrSNHj91FdXJQ+GpS1gF7xC5Wc6xaPwabr0dOMoiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EK9CyIM+K3hFZ84sslRcMH0oZvAsGQHlLpODIU1QdJQ=;
	b=5Uuh795JK4TJdoSrF7N2WsGbGfODECavY0yOxNa6h9kH03m5P3onOb+/EXm0YmciFy/F
	 BjU8stBymgfzFt0akeLbbb1sR7tVWXsfyagMqiGsUsO5HRN5Xc7JEfkSHlyQkZgJR7xrV
	 8DG3cKNiLGrC0ZYh+mGoPZNkGadXx6AGIREa3kBiXXJyr5roPe2hpKh+c8btEk5lOBpRH
	 t0SbA+pOUd5yuAtj333W/bNEfqmpGlMoaamoRLVjQ1tFiAec7eATGLs5CkNfSQqKCYEAC
	 Wr3J7VWHWdxwjyEyYhrVEykcGNYlSz61yw4FMJs5TY54sU7geOuO/zQi6Q4JdUUiLrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJsJieZt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7EB606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nJsJieZt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9CF1F01825;
	Sun, 25 Oct 2026 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792958485;
	bh=EK9CyIM+K3hFZ84sslRcMH0oZvAsGQHlLpODIU1QdJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nJsJieZtbE4axx1SZ2Dvnf66b2FDlXfxFT8u28s+cnQn9U6lO+zDMq3mJAGcSlD2r
	 DIUNg6saKKutIsRDfyd/XfQOobpYe4Fgb5LZWaCtqp9ETXSY81joIWzEmuPG3N4mjd
	 UGCyjpT9QMj+uXln65ovxYsUNY+kJ0BiYuPdhNGVtO9wKY2SwzhLOF+OPlqFyFu7vC
	 fL/I6nzssvtyGQz8BgV9ekH2zIQM/FcZQ5W1dbtGaGXUrkbCoKPMq6pjwh/XgeRKZR
	 H4pIyf1/kh0tSz5W6dMVodH1kuBzEczlUJ4iRWV1wo8eRrJy/ahMgsSOrMQs1zBmvs
	 mbp8gB5zflC+Q==
Message-ID: <sashiko-outbox-184396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:01:24 +0000
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
- [High] firmware: meson: sm: broken CPU offlining via freeze_secondary_cpu=
s()
- [Medium] firmware: meson: sm: build and link failure calling freeze_secon=
dary_cpus()
- [Medium] firmware: meson_sm: missing cleanup on error in meson_sm_registe=
r_power_off()
--

commit 520b94ab82581e32dd9c97ba0f810c53f3ecadaf
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

firmware: meson: sm: make power-off work on S4

This patch adds power-off prepare and power-off handlers for the Amlogic S4
secure monitor to offline secondary processors and set the firmware shutdown
flag prior to system power-off.

> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/m=
eson_sm.c
> index ab9751a59b552..5410386603c70 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c

[ ... ]

> @@ -303,6 +306,45 @@ static struct attribute *meson_sm_sysfs_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(meson_sm_sysfs);
> =20
> +/*
> + * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
> + * power key it jumps back to the kernel instead of booting, which hangs=
 the
> + * board. Setting the shutdown flag first makes it cold-boot instead, an=
d the
> + * secondary CPUs must have been taken down through PSCI CPU_OFF beforeh=
and,
> + * otherwise the wake-up path hangs as well.
> + */
> +static int meson_sm_power_off_prepare(struct sys_off_data *data)
> +{
> +	if (freeze_secondary_cpus(0))
> +		pr_warn("meson-sm: failed to stop secondary CPUs\n");

[Severity: Medium]
Does calling freeze_secondary_cpus(0) in meson_sm_power_off_prepare() in
drivers/firmware/meson/meson_sm.c break the build when this driver is built
as a module or when sleep support is disabled?

In drivers/firmware/meson/Kconfig, the driver is tristate and does not
depend on sleep or symmetric multiprocessing support:

drivers/firmware/meson/Kconfig:
	config MESON_SM
		tristate "Amlogic Secure Monitor driver"
		depends on ARCH_MESON || COMPILE_TEST
		default ARCH_MESON
		depends on ARM64_4K_PAGES

However, include/linux/cpu.h only declares freeze_secondary_cpus() under
the sleep configuration guard and provides no stub in the else branch:

include/linux/cpu.h:
	#ifdef CONFIG_PM_SLEEP_SMP
	extern int freeze_secondary_cpus(int primary);
	extern void thaw_secondary_cpus(void);
	...
	#else /* !CONFIG_PM_SLEEP_SMP */
	static inline void thaw_secondary_cpus(void) {}
	static inline int suspend_disable_secondary_cpus(void) { return 0; }
	static inline void suspend_enable_secondary_cpus(void) { }
	#endif /* !CONFIG_PM_SLEEP_SMP */

In addition, freeze_secondary_cpus() in kernel/cpu.c is not exported for
loadable modules:

kernel/cpu.c:
	#ifdef CONFIG_PM_SLEEP_SMP
	static cpumask_var_t frozen_cpus;

	int freeze_secondary_cpus(int primary)

When sleep support is disabled, compiling drivers/firmware/meson/meson_sm.c
fails with an implicit function declaration error. When the driver is built
as a module (for example in an arm64 allmodconfig build), linking fails at
modpost with an undefined symbol error for freeze_secondary_cpus().

> +
> +	return NOTIFY_DONE;
> +}

[Severity: High]
Can calling the suspend helper freeze_secondary_cpus(0) from
meson_sm_power_off_prepare() during kernel_power_off() ->
do_kernel_power_off_prepare() fail to offline secondary processors after a
prior wakeup event?

Inside kernel/cpu.c:freeze_secondary_cpus(), the loop checks
pm_wakeup_pending() before taking down each processor and aborts if a wakeup
is pending:

kernel/cpu.c:freeze_secondary_cpus() {
	...
		if (pm_wakeup_pending()) {
			pr_info("Wakeup pending. Abort CPU freeze\n");
			error =3D -EBUSY;
			break;
		}

		trace_suspend_resume(TPS("CPU_OFF"), cpu, true);
		error =3D _cpu_down(cpu, 1, CPUHP_OFFLINE);
	...
}

In drivers/base/power/wakeup.c:pm_wakeup_pending(), the check returns true
whenever pm_abort_suspend is positive:

drivers/base/power/wakeup.c:pm_wakeup_pending() {
	...
	return ret || atomic_read(&pm_abort_suspend) > 0;
}

void pm_system_wakeup(void)
{
	atomic_inc(&pm_abort_suspend);
	s2idle_wake();
}

Because pm_abort_suspend is incremented by pm_system_wakeup() during a
suspend or s2idle wakeup event and is only cleared by pm_wakeup_clear(0) at
the start of a subsequent suspend or hibernate cycle (in pm_sleep_fs_sync()
and freeze_processes()), it remains positive after resume and is never
cleared along the kernel_power_off() path.

Furthermore, freeze_secondary_cpus(0) passes tasks_frozen =3D 1 to
_cpu_down(), which sets cpuhp_tasks_frozen during shutdown even though
tasks are not frozen.

Would powering off after any suspend/resume cycle or wakeup event cause
freeze_secondary_cpus(0) to abort with -EBUSY before offlining secondary
processors, leaving them parked in the kernel and reintroducing the
firmware wake-up hang?

> +
> +static int meson_sm_power_off(struct sys_off_data *data)
> +{
> +	meson_sm_call(data->cb_data, SM_SET_POWEROFF_FLAG, NULL, 1, 0, 0, 0, 0);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int meson_sm_register_power_off(struct device *dev,
> +				       struct meson_sm_firmware *fw)
> +{
> +	int ret;
> +
> +	ret =3D devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPA=
RE,
> +					    SYS_OFF_PRIO_DEFAULT,
> +					    meson_sm_power_off_prepare, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Run before the PSCI handler, which never returns */
> +	return devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
> +					     SYS_OFF_PRIO_HIGH,
> +					     meson_sm_power_off, fw);
> +}
> +
>  static const struct of_device_id meson_sm_ids[] =3D {
>  	{ .compatible =3D "amlogic,meson-gxbb-sm", .data =3D &gxbb_chip },
>  	{ /* sentinel */ },
> @@ -343,6 +385,10 @@ static int __init meson_sm_probe(struct platform_dev=
ice *pdev)
>  	if (devm_of_platform_populate(dev))
>  		goto unmap_out_base;
> =20
> +	if (of_device_is_compatible(dev->of_node, "amlogic,meson-s4-sm") &&
> +	    meson_sm_register_power_off(dev, fw))
> +		dev_warn(dev, "failed to register power-off handlers\n");

[Severity: Medium]
If the second devm_register_sys_off_handler() call in
meson_sm_register_power_off() fails (for example, if registering at high
priority via register_sys_off_handler() ->
atomic_notifier_chain_register_unique_prio() returns -EBUSY or -ENOMEM),
meson_sm_probe() logs a warning and still returns 0.

Because meson_sm_probe() succeeds, devres cleanup does not run, leaving
meson_sm_power_off_prepare() registered on power_off_prep_handler_list
without its companion meson_sm_power_off() handler.

Should meson_sm_register_power_off() or meson_sm_probe() clean up the
prepare handler when registering the power-off handler fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025192144.2089=
54-1-christian.koever-draxl@student.uibk.ac.at?part=3D2
