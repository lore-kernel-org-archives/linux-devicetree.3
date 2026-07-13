Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61337A85E
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939135; cv=none; b=n9a5s26N/gjZwvENW6GFjbkgCygFMRzP8FU3r1L3ezfTCHPPOtCyXavPsJg29TzrVmDUcNw0GOelHHB+dVV1l70fVwIa8VmqITmJ6Jd8ufhu4JEsXHwBlJKKvUKCVmwNVEvdGClGR25q490ynheaV9HMISPdfcVBKfFdY6Xf2pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939135; c=relaxed/simple;
	bh=apGXhsQgHfSypttIgKW6sHhOVtDZqyTu/JDHg6Gktbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h3pFzz1amWZuHNIBPenYhCvBb+FWpLTvLE35OSHw594PgjKtQU7qmATd1B1p9UylmgnDZ8WfauO2NJ2mRXdEVMGSCIsBIsgwYXyfRGZZ3s9rrCdAlQWzYLeIoOiwiJNIGBURivFzEgg0Bg5YndEDyCi3mYuSzmqDzLRBLZ8XmJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfNcH83K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfNcH83K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152831F000E9;
	Mon, 13 Jul 2026 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939133;
	bh=LNvrlMDi3TtasZKUw4zO6yNoevaQajY0oRiWmip4h/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EfNcH83KBrAoSl17If3r7mmtoV6qmzm7d+EmLaVR9VCApSA2RcujvM/f+q9EL7gnX
	 LhRvK1CoUkfitw1LEhdArvnkQko7t4wdxf8EoCzYYe8wSTo9sCeoL5fW6+FrXqNUw+
	 muopuc/3VAIhuAnKUP82iIKfn/etTlZhVQasCuwDIIUWlSIOnaxKQP1TntI1V3jtMx
	 w6B3Zq8iWG1oL14Hoo0hS1VPLfO47OvxYf3VjrvL07sbvmudWr5b+fTmc91x7mda80
	 gANXmkXQM/wUXFDTxqIY1THjc9RrgXfi+K+eP52w6J9Zul2LGLKEgCA4yrM+55gr1O
	 f/N2tXzwc8hCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] irqchip/irq-qcom-mpm: Program wakeup timer when CPU
 cluster goes to LPM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-4-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-4-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:38:52 +0000
Message-Id: <20260713103853.152831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Data race between the AP and RPM processor due to incorrect orderi=
ng of mailbox notification and timer programming.
- [High] Unhandled KTIME_MAX from unscheduled timers causes massive integer=
 overflows and random hardware wakeups.
- [High] Expired timers produce negative relative times that underflow when=
 cast to unsigned u64.
- [High] Invalid USECS_TO_CYCLES conversion macro uses CPU delay loop calib=
ration instead of arch timer frequency, and truncates to 32 bits.
--

--- Patch [4]: [PATCH 4/7] irqchip/irq-qcom-mpm: Program wakeup timer when =
CPU cluster goes to LPM ---
commit c68a3cdf8bf38bac4bbcdaf3ea878c066a1246a0
Author: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to LPM

This commit adds support for programming the next wakeup time into the MPM
timer when the CPU cluster enters power collapse. This allows the RPM proce=
ssor
to set the hardware timer and wake up the SoC when the architectural timer
interrupt cannot do so during deep low power states.

> diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mp=
m.c
> index 763eddee99dc4..f43c4a1c35f78 100644
> --- a/drivers/irqchip/irq-qcom-mpm.c
> +++ b/drivers/irqchip/irq-qcom-mpm.c

[ ... ]

> @@ -77,6 +80,13 @@ enum qcom_mpm_reg {
>  	MPM_REG_STATUS,
>  };
> =20
> +#define USECS_TO_CYCLES(time_usecs)	xloops_to_cycles((time_usecs) * 0x10=
C7UL)
> +
> +static inline unsigned long xloops_to_cycles(u64 xloops)
> +{
> +	return (xloops * loops_per_jiffy * HZ) >> 32;
> +}

[Severity: High]
Does this macro use the correct frequency for the conversion, and is there a
risk of overflow?

In xloops_to_cycles(), loops_per_jiffy represents the CPU-specific delay
loop iterations rather than the fixed frequency of the architectural timer.

Also, the calculation (xloops * loops_per_jiffy * HZ) can overflow a 64-bit
integer for sleep times exceeding 25 seconds. Finally, returning an unsigned
long truncates the result to 32 bits on 32-bit ARM systems, which would
further cap the maximum sleep duration.

[ ... ]

> @@ -320,6 +331,36 @@ static irqreturn_t qcom_mpm_handler(int irq, void *d=
ev_id)
>  	return ret;
>  }
> =20
> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
> +{
> +	ktime_t now, wakeup =3D KTIME_MAX;
> +	u64 wakeup_us, wakeup_cycles =3D ~0;
> +	u32 lo, hi;
> +
> +	/* Set highest time when system (timekeeping) is suspended */
> +	if (system_state =3D=3D SYSTEM_SUSPEND)
> +		goto exit;
> +
> +	/* Find the relative wakeup in kernel time scale */
> +	wakeup =3D dev_pm_genpd_get_next_hrtimer(priv->dev);
> +
> +	/* Find the relative wakeup in kernel time scale */
> +	now =3D ktime_get();
> +	wakeup =3D ktime_sub(wakeup, now);

[Severity: High]
Could this overflow if there are no pending timers?

If dev_pm_genpd_get_next_hrtimer() returns KTIME_MAX, subtracting now from
KTIME_MAX in mpm_write_next_wakeup() yields a massive delta.

When this large delta is converted to microseconds and passed to
USECS_TO_CYCLES(), it seems it would overflow the 64-bit bounds during the
multiplication, leading to a randomized or incorrect wakeup time being
programmed into the hardware.

> +	wakeup_us =3D ktime_to_us(wakeup);

[Severity: High]
How does this handle expired timers where the scheduled wakeup is in the pa=
st?

If the scheduled wakeup is earlier than now, ktime_sub() will return a nega=
tive
time delta. When ktime_to_us() returns this negative value, assigning it to
the unsigned u64 wakeup_us variable will cause it to wrap around to a massi=
ve
positive number, which then gets passed to the conversion macros.

> +
> +	/* Convert the wakeup to arch timer scale */
> +	wakeup_cycles =3D USECS_TO_CYCLES(wakeup_us);
> +	wakeup_cycles +=3D arch_timer_read_counter();
> +
> +exit:
> +	lo =3D wakeup_cycles;
> +	hi =3D wakeup_cycles >> 32;
> +
> +	qcom_mpm_write(priv, MPM_REG_TIMER, 0, lo);
> +	qcom_mpm_write(priv, MPM_REG_TIMER, 1, hi);
> +}
> +
>  static int handle_rpm_notification(struct qcom_mpm_priv *priv)
>  {
>  	int i, ret;
> @@ -332,6 +373,7 @@ static int handle_rpm_notification(struct qcom_mpm_pr=
iv *priv)
>  	if (ret < 0)
>  		return ret;
> =20
> +	mpm_write_next_wakeup(priv);

[Severity: High]
Is there a data race here between notifying the RPM and writing the timer?

In handle_rpm_notification(), the mailbox message is sent to the RPM
via mbox_send_message() before mpm_write_next_wakeup() is called to program
the new timer values into the shared registers.=20

Because the notification is sent before the write occurs, the RPM could read
the shared registers before the AP has actually written the updated wakeup
time, causing it to use stale or uninitialized values.

>  	mbox_client_txdone(priv->mbox_chan, 0);
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-shikra_=
lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com?part=3D4
