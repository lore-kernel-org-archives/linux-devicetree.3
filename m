Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2247B384CCA
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720560; cv=none; b=PnudRTDjZGWujpivkBkmByHjtnibXjl+0EKb5fKYLK4F6uW0W5JVI2vZCB6VUaOP4mjH0B4RUTyb2+bsjGswUoWQt6ifMRg+Pa8SkpubAP2hsD/hHmw/XfNa6ioCUAXAgEDZzdQZuYZ8+vvhgPlYXvpYHy6S41enKpOnCVVSABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720560; c=relaxed/simple;
	bh=UrFSRVdGBmh9DUklZmSwUJeubdTX7wcI+aVIJWzATz8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E747BtpGoEeMhe6oI4tbA/+VEQ3SN2Bkp75K2THr/L3zn+aV/D9ac5avJOhA86qbeUFDs24gAPamY02zTasvC9m5fC9hIuC0FdWy6aA4IbOrjUJYgt836gzzSxdIZ80MfYwWLhuqWp68mB3+RJbsX59+YRrz442lFwcV4RJ4Vf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXEqcm/I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXEqcm/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B711F000E9;
	Mon, 25 May 2026 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779720558;
	bh=xLbBhNBtrcAFocX5iciV8jU+JEM2do+MXCyw+GJwDGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KXEqcm/I5bAV+alAyW2RnL93aVrR5pdvtnDTeOBpWyuizCS3HGSZZxFQAgr/QcIv5
	 vrSGaUIQUP2/CiEtmwriL077rZ9j3NNAEzlx/jLPE9nNC6Vpw0sjib8bkdUjDfc+pf
	 4W3iiakhbRc0CBvqrlfOXo+By3Ik1HBhfIfmkCbS3qkuJ/jh+R4WKEcsX/3dF9l3Va
	 wuY1PEPN+pW9ocF+mVAte9c27QLxUchI44gWeJZk6+x1TJYWyZUtVleQbQ2fNysn8V
	 DKZLRBDrT6zKdCFRJg7zD2sfp3TveOm09aQNyd6HGl0xcmBhRbrntIf2L6q4UjMs5q
	 t8V+S0n4ZrMtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] i3c: dw: Add apb reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525140018.19598-4-jszhang@kernel.org>
References: <20260525140018.19598-4-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 14:49:18 +0000
Message-Id: <20260525144918.86B711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Asymmetric reset assertion/deassertion order for APB and Core rese=
ts violates hardware sequencing rules.

Pre-existing issues:
- [High] Missing error handling for clock enablement and reset deassertion =
in runtime resume leads to potential kernel panics.
--

commit f0e43b6549a854c56bb22e329a26e4ad0bcd7e1c
Author: Jisheng Zhang <jszhang@kernel.org>
Subject: i3c: dw: Add apb reset support

This commit adds support for an APB interface reset in the DesignWare I3C
master driver. It fetches the optional reset during probe and updates the
runtime power management callbacks to assert and deassert it alongside the
core reset.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index a7593d6efac5a..03efd46db8d0c 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
[ ... ]
> @@ -1784,6 +1789,7 @@ static int __maybe_unused dw_i3c_master_runtime_sus=
pend(struct device *dev)
>  	dw_i3c_master_disable(master);
> =20
>  	reset_control_assert(master->core_rst);
> +	reset_control_assert(master->apb_rst);
>  	dw_i3c_master_disable_clks(master);
>  	pinctrl_pm_select_sleep_state(dev);
>  	return 0;
> @@ -1796,6 +1802,7 @@ static int __maybe_unused dw_i3c_master_runtime_res=
ume(struct device *dev)
>  	pinctrl_pm_select_default_state(dev);
>  	dw_i3c_master_enable_clks(master);
>  	reset_control_deassert(master->core_rst);
> +	reset_control_deassert(master->apb_rst);

[Severity: High]
Should the reset deassertion order in resume be reversed to follow standard
hardware sequencing?

Currently, the resets are asserted in the suspend path as core_rst followed
by apb_rst, and they are deasserted in the resume path in the exact same
order. Standard practice usually requires a last-in, first-out sequence.

Additionally, dw_i3c_common_probe() requests these resets in core_rst then
apb_rst order. This means the automatic devres teardown will assert them as
apb_rst then core_rst, which is the opposite of the manual runtime suspend
logic introduced here.

Could this asymmetric sequencing cause bus hangs or IP initialization
failures if a core is released from reset while its APB bus interface
remains in reset?

[Severity: High]
This is a pre-existing issue, but this patch extends the pattern to the new=
ly
added apb_rst. Are we missing error handling for the clock enablement and
reset deassertion?

The return values from dw_i3c_master_enable_clks() and both calls to
reset_control_deassert() are being discarded. If any of these operations
fail, the driver will proceed to configure the hardware by calling
dw_i3c_master_set_intr_regs().

Would it be safer to check these return values and return an error code to
the PM framework to avoid potential synchronous external aborts when
accessing inactive IP registers?

> =20
>  	dw_i3c_master_set_intr_regs(master);
>  	dw_i3c_master_restore_timing_regs(master);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525140018.1959=
8-1-jszhang@kernel.org?part=3D3
