Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C737A835
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939241; cv=none; b=SpmrIjMBP89T/h+6N8bOaKy6LqyAOERfCsX26qHaIYWY7DAew9jn0SQtk4bSH051QbhnoVaeGRzS6qhJGm/bpqyr4CIw4I+/V21i4l2Dla+k1cCbrJ4W8KoCx+yPRx+E5GIhLfrtfRWxBuPCg1kkiJKxRvfUi9KvRjV2muJmI4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939241; c=relaxed/simple;
	bh=YjtenJvu92kdZLHUe131L6tACROz9WO3Zw8mPi7n5w0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cnUwxYHA4t2BEp/4gw8i7eKq3RTrxS1Q1wc1MN83VQVkPOQTtrgqogd9BCKk94pjUHThTveEqObnLwGhITq7BSPBxEE/VzQDi0ZD8hEE1E7xc+wt4I63aMljAQfnqLtcjzHVy/Ow+B8Tu8ICRfwrNX6PvR3Jgbzg1XjPhmAc0LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZV05Mlh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZV05Mlh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3AD1F000E9;
	Mon, 13 Jul 2026 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939240;
	bh=k3731jxe80ypC0iYptrCiG2NwlLIVyKovRkVMtXIKig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AZV05Mlh+SpiR+C+ZFV8Xq0eg8PVPRroQB0uvkm9pY66bYEFuuYVxhl0/vDkvAW3Q
	 93Z5ZZZ23AfhoUO6fIEdnW6YGFXYYhUzh5mTahHek3nPsRV5v8TWK/EyZcjRbHiLlz
	 vYZ8khYsdemzz56F8MIvnvNpPIzY3ozbP8HLpr09jE6dDcAInR+2cW1IT6xnAcIwVf
	 J+HHm8QnGDxfDY3s4p3t4u6RVSg6Q2na6ipw1RAd7Lc929wyffZ6SIV7xk0lGSMLOr
	 DtcifVWwXRaxBgvVvinqyGdY2rX+4ZS8rkGSbpU1DSHuhmA9TqII58g//5IWmMnOyI
	 gSRLkUrXVFuxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6375: Make MPM device as part
 of CPU cluster domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sneh Mankad" <sneh.mankad@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-5-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-5-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:40:39 +0000
Message-Id: <20260713104039.BB3AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Severe integer overflow in `mpm_write_next_wakeup` when no hrtimer=
s are pending causes immediate spurious wakeups.

Pre-existing issues:
- [High] The MPM power domain probe dependency and DT validation bug fixed =
in sm6375.dtsi remains in agatti.dtsi and shikra.dtsi, permanently breaking=
 CPU idle states.
--

--- Patch [5]: [PATCH 5/7] arm64: dts: qcom: sm6375: Make MPM device as par=
t of CPU cluster domain ---
commit b04aa9c0b185843b6783d946292d656585dedf48
Author: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
arm64: dts: qcom: sm6375: Make MPM device as part of CPU cluster domain

This commit removes the power domain provider property from the MPM device
in the sm6375 device tree to prevent idle-state initialization failures.
It then assigns the MPM device to the CPU cluster power domain.

> diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/q=
com/sm6375.dtsi
> index ccf572bb1549b..5f729634e1d9b 100644
> --- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
> @@ -318,7 +318,7 @@ mpm: interrupt-controller {
>  		mboxes =3D <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_SMP2P>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <2>;
> -		#power-domain-cells =3D <0>;
> +		power-domains =3D <&cluster_pd>;

[Severity: High]
This is a pre-existing issue, but does the same problem still exist in other
device trees like agatti.dtsi and shikra.dtsi?

Because the qcom_mpm driver no longer registers a power domain, the cluster=
_pd
node in agatti.dtsi incorrectly relies on &mpm as a power domain provider:

arch/arm64/boot/dts/qcom/agatti.dtsi:cluster_pd {
    ...
	power-domains =3D <&mpm>;
    ...
}

Will this cause cluster_pd to perpetually fail to probe with -EPROBE_DEFER
and permanently break the CPU power-collapse idle state?

Also, both agatti.dtsi and shikra.dtsi incorrectly retain the deprecated
#power-domain-cells =3D <0>; property in their MPM nodes:

arch/arm64/boot/dts/qcom/agatti.dtsi:mpm {
    ...
	#power-domain-cells =3D <0>;
    ...
}

>  		interrupt-parent =3D <&intc>;
>  		qcom,mpm-pin-count =3D <96>;
>  		qcom,mpm-pin-map =3D <5 296>,  /* Soundwire wake_irq */
> @@ -505,7 +505,6 @@ cpu_pd7: power-domain-cpu7 {
> =20
>  		cluster_pd: power-domain-cpu-cluster0 {
>  			#power-domain-cells =3D <0>;
> -			power-domains =3D <&mpm>;
>  			domain-idle-states =3D <&cluster_sleep_0>;
>  		};
>  	};

[Severity: High]
Does this change trigger an integer overflow in mpm_write_next_wakeup() when
no hrtimers are pending?

If dev_pm_genpd_get_next_hrtimer() returns KTIME_MAX, it is processed witho=
ut
bounds checking:

drivers/irqchip/irq-qcom-mpm.c:mpm_write_next_wakeup() {
    ...
	wakeup =3D dev_pm_genpd_get_next_hrtimer(priv->dev);

	/* Find the relative wakeup in kernel time scale */
	now =3D ktime_get();
	wakeup =3D ktime_sub(wakeup, now);
	wakeup_us =3D ktime_to_us(wakeup);

	/* Convert the wakeup to arch timer scale */
	wakeup_cycles =3D USECS_TO_CYCLES(wakeup_us);
    ...
}

This evaluates to a massive value which causes xloops_to_cycles() to overfl=
ow
the 64-bit integer multiple times over:

drivers/irqchip/irq-qcom-mpm.c:xloops_to_cycles() {
    ...
	return (xloops * loops_per_jiffy * HZ) >> 32;
    ...
}

Could this result in the hardware being programmed with a pseudo-random tim=
er
value, triggering an immediate or severely premature wakeup that destroys d=
eep
sleep power savings?

Should mpm_write_next_wakeup() explicitly check for wakeup =3D=3D KTIME_MAX=
 to
avoid this overflow?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-shikra_=
lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com?part=3D5
