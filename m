Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160594DBD9B
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452061; cv=none; b=MV84Ev1ZUnFI2O9IcDFJHENwhtMHOFU2X8SZiwrYmroXqSXOdIDaPZzlX91n9raFDI6x6D6cNnorWWBBVMVvF5lkno+ZyNrbEiopduwjPtwe2jDTWObZpTLfirxum240ge6CHdJDtopyEEqkHC5e9yVhJacRzYjESSP3QCNmf78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452061; c=relaxed/simple;
	bh=k38En5qCUhYNr1uACRibR2JEcc/SheissVDFhxerkaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nXGE1E7sS8vYLEuwCrbENAyc8cOpeICQgN99FZgfwXXw2fqSIao6pEZGG801Db+SOmIB2Q9aiRbPT4XO3gn2vHXHmsWi2A715KmZn2pdojMwGzMMWQuseDzTvhickQ2qQz5fvDvVhRd35vofNGqPToUN7GBd9JSeBK5D3py0gaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUFl24WK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUFl24WK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780761F000E9;
	Thu,  3 Sep 2026 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452059;
	bh=2F8H+I/xlism86VXCHGQl93DXW8f/bZ/1J2Nr0y3W3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUFl24WK1MN7O0w9jQhoplEKkLV19N2iNCFIDt+cgqNDeHs/ii5xLfXpUXXTw5ptd
	 mOWz8gHk84j7Z5ueXGePNLl6xn6e0XareCUdWy1mOhuSqBb+or0GmUx+4YhEA0ngtg
	 3KjMu6Pav91DQNbJijOEmn2v4P9cJ/0mv1qYZh8UVReeWTIFHGnB5ouBoGcGP5AeyM
	 yCIcFcWuqBPQJ2z4WFzlcs8YdLP8JvLgHYdutSl6qF7Cv4pCHJjShg/gXLZlpxdDrM
	 QeNhAWcqqypLlHlwDaQguf1ajPsqw885qp3pWyKu2eOnK5fLRupMKcRZZ3hab+gv3B
	 BsNVoRTKq2Nkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] usb: dwc3: qcom: Support firmware-managed
 resource states for power management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Faisal Hassan" <faisal.hassan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903153827.3463313-8-faisal.hassan@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-8-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 16:14:19 +0000
Message-Id: <20260903161419.780761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] System suspend fails to release the 'power' domain if the device i=
s already runtime suspended, causing a power leak.
- [High] Early return in dwc3_qcom_domains_put() on -EAGAIN leaks the 'powe=
r' domain vote and corrupts PM state.
- [High] Double pm_runtime_disable() in remove causes a permanent PM state =
corruption.
- [Medium] Probe error paths bypass the newly added reset_control_assert() =
hardening.
- [Medium] PM domain runtime usage count leak in the remove() error path.

Pre-existing issues:
- [High] Skipping dwc3_core_remove() on resume failure leaves child devices=
 active, causing a Use-After-Free.
- [High] Hardware registers are accessed while the power domain is disabled=
, causing a synchronous external abort.
--

commit 322ab32f12f7861ac5e4f76813db99fd65efad09
Author: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

usb: dwc3: qcom: Support firmware-managed resource states for power managem=
ent

This commit adds support for firmware-managed resource handling in the
Qualcomm DWC3 USB controller driver via SCMI-backed power domains ("power"
and "bus"). It coordinates runtime and system suspend state through domain
voting and attempts to harden the driver's probe error-unwind and remove
paths.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e58a9ca23b009..7139eadbfb1e3 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c

[ ... ]

> +static int dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
> +{
> +	struct device *power_dev =3D qcom->pd_list->pd_devs[0];
> +	struct device *bus_dev =3D qcom->pd_list->pd_devs[1];
> +	int ret;
> +
> +	ret =3D pm_runtime_put_sync(bus_dev);
> +	if (ret < 0) {
> +		dev_err(qcom->dev, "failed to disable bus domain: %d\n", ret);
> +		return ret;
> +	}

[Severity: High]
When pm_runtime_put_sync() is called for the bus domain, could it return
-EAGAIN if the device is kept active by another thread? If it does, this
early return treats it as a failure, skipping the power domain put and
propagating the error back to the PM core. The PM core aborts the suspend
and marks the device as active, but the bus domain usage counter was
already decremented. If the bus physically suspends later, does this lead
to accessing unclocked hardware and causing a synchronous external abort?

[ ... ]

> @@ -386,11 +521,23 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom=
, pm_message_t msg)
>  		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>  			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>  	}
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> =20
> -	ret =3D dwc3_qcom_interconnect_disable(qcom);
> -	if (ret)
> -		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +	if (!qcom->fw_managed) {
> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +
> +		ret =3D dwc3_qcom_interconnect_disable(qcom);
> +		if (ret)
> +			dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +	} else {
> +		/*
> +		 * Runtime suspend only needs to drop the bus domain; power
> +		 * stays voted on so register accesses remain possible for
> +		 * whatever briefly resumes it. System suspend drops both.
> +		 */
> +		ret =3D dwc3_qcom_domains_put(qcom, PMSG_IS_AUTO(msg));
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	/*
>  	 * The role is stable during suspend as role switching is done from a
> @@ -450,13 +597,25 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom=
, pm_message_t msg)
>  	if (dwc3_qcom_is_host(qcom) && wakeup) {
>  		for (i =3D 0; i < qcom->num_ports; i++)
>  			qcom->ports[i].usb2_speed =3D dwc3_qcom_read_usb2_speed(qcom, i);
>  		dwc3_qcom_enable_interrupts(qcom);
>  	}

[Severity: High]
This is a pre-existing issue, but by the time we reach this point during
system suspend, dwc3_qcom_domains_put() has already disabled both the bus
and power domains. If the device is a wakeup source, this code accesses
hardware registers by calling dwc3_qcom_read_usb2_speed() and
dwc3_qcom_enable_interrupts(). Because the power domain (GDSC) is off,
will accessing these registers cause a hardware exception or bus fault?

[ ... ]

>  static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
>  	int ret;
>  	int i;
>  	bool wakeup;
> =20
>  	if (!qcom->is_suspended)
>  		return 0;

[Severity: High]
If the device is already runtime suspended, qcom->is_suspended is true and
this returns early during system suspend. However, during runtime suspend,
only the bus domain vote is dropped and the power domain vote is kept. By
returning early here, does system suspend fail to release the power domain,
causing a permanent power leak of the PM domain usage counter?

[ ... ]

>  	/*
>  	 * For runtime resume, always assume wakeup was enabled.
>  	 * For system resume, check device wakeup capability.
>  	 */
>  	if (PMSG_IS_AUTO(msg))
>  		wakeup =3D true;
>  	else
>  		wakeup =3D device_may_wakeup(qcom->dev);
> =20
>  	if (dwc3_qcom_is_host(qcom) && wakeup)
>  		dwc3_qcom_disable_interrupts(qcom);

[Severity: High]
This is a pre-existing issue, but this code accesses hardware registers
by calling dwc3_qcom_disable_interrupts() before the power and bus domains
are enabled by dwc3_qcom_domains_get() below. Does accessing these registers
while the power domain is disabled cause a synchronous external abort?

> -	ret =3D clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> -	if (ret < 0)
> -		goto enable_irq;
> +	if (!qcom->fw_managed) {
> +		ret =3D clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> +		if (ret < 0)
> +			goto enable_irq;
> =20
> -	ret =3D dwc3_qcom_interconnect_enable(qcom);
> -	if (ret)
> -		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +		ret =3D dwc3_qcom_interconnect_enable(qcom);
> +		if (ret)
> +			dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +	} else {
> +		/*
> +		 * Runtime resume only needs to re-vote bus (power was left
> +		 * on across runtime suspend). System resume votes both.
> +		 */
> +		ret =3D dwc3_qcom_domains_get(qcom, PMSG_IS_AUTO(msg));

[Severity: High]
If the device was runtime suspended prior to system suspend,
dwc3_qcom_suspend() returned early and skipped dropping the power domain
vote. During system resume, dwc3_qcom_resume() does not return early, and
this unconditionally calls dwc3_qcom_domains_get() for both domains. Doesn't
this increment the power domain usage counter a second time, leading to a
permanent resource leak where the power domain never turns off?

[ ... ]

> @@ -741,9 +905,31 @@ static int dwc3_qcom_probe(struct platform_device *p=
dev)
>  		goto err_remove_swnode;
>  	}
> =20
> -	ret =3D clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> -	if (ret < 0)
> -		goto err_remove_swnode;
> +	if (!qcom->fw_managed) {
> +		ret =3D clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> +		if (ret < 0)
> +			goto err_remove_swnode;

[Severity: Medium]
If early probe functions like clk_bulk_prepare_enable() fail, this jumps
directly to err_remove_swnode. Since err_remove_swnode is located after
the newly added reset_control_assert() block, doesn't this bypass the
intended hardware cleanup and leave the hardware controller out of reset?

[ ... ]

> @@ -829,15 +1034,63 @@ static void dwc3_qcom_remove(struct platform_devic=
e *pdev)
>  {
>  	struct dwc3 *dwc =3D platform_get_drvdata(pdev);
>  	struct dwc3_qcom *qcom =3D to_dwc3_qcom(dwc);
> +	bool pm_resumed =3D false;
> +	bool domains_suspended =3D true;
> +	int ret;
> =20
> -	if (pm_runtime_resume_and_get(qcom->dev) < 0)
> -		return;
> +	ret =3D pm_runtime_resume_and_get(qcom->dev);
> +	if (ret < 0)
> +		dev_warn(qcom->dev, "Failed to resume. Perform critical cleanups only.=
\n");
> +	else
> +		pm_resumed =3D true;
> =20
> -	dwc3_core_remove(&qcom->dwc);
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> -	dwc3_qcom_interconnect_exit(qcom);
> +	/*
> +	 * Disable runtime PM to prevent any automatic PM operations during rem=
oval.
> +	 * This prevents race conditions where interrupt handlers or other subs=
ystems
> +	 * might trigger runtime PM operations while the device is being torn d=
own.
> +	 */
> +	pm_runtime_disable(qcom->dev);

[Severity: High]
This adds an initial pm_runtime_disable() on the shared device. However,
when dwc3_core_remove() is called immediately after, the core unconditional=
ly
calls pm_runtime_disable() on the exact same device. Doesn't this double
disable increment the disable_depth twice, permanently corrupting the PM
state and preventing the device from ever runtime suspending or resuming
again after a driver unbind/rebind cycle?

> +	if (pm_resumed) {
> +		/* Only perform operations that require device to be active */
> +		dwc3_core_remove(&qcom->dwc);

[Severity: High]
This isn't a bug introduced by this patch, but if pm_runtime_resume_and_get=
()
fails, pm_resumed evaluates to false and dwc3_core_remove() is skipped.
Because the qcom structure is devres-managed, the memory backing it (includ=
ing
the dwc3 struct) is unconditionally freed upon return. Does skipping core
removal leave the USB gadget, xHCI platform device, and notifiers active,
causing a use-after-free when these subsystems attempt to access the freed
memory?

> +		if (!qcom->fw_managed) {
> +			dwc3_qcom_interconnect_exit(qcom);
> +			clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +		} else {
> +			ret =3D dwc3_qcom_domains_put(qcom, false /* bus_only */);

[Severity: Medium]
If the device fails to resume, pm_resumed is false and this skips calling
dwc3_qcom_domains_put(). However, a few lines down, dwc3_qcom_domain_detach=
()
is called unconditionally. Does this destroy the virtual domain devices whi=
le
the underlying genpd provider still holds an active PM vote from probe,
stranding the domain in the powered-on state indefinitely?

> +			if (ret) {
> +				dev_err(qcom->dev, "Failed to disable power domains during remove: %=
d\n",
> +					ret);
> +				domains_suspended =3D false;
> +			}
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903153827.3463=
313-1-faisal.hassan@oss.qualcomm.com?part=3D7
