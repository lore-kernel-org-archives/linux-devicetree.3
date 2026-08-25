Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C62361947
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635409; cv=none; b=bHo43wM8n44ZY/S05ys6jGv3fV11WAYk8zeczgN3dVQf+3K/BE9/Y5pOQTvMQ8GUxTplV88F/FmNhT7IJLxf8WT9Z9ozB/19uNDjKL4I8zFpGh7/F/5Qvc9+Kf/jOrHLWfmZOqOKowKwk/49V0pG/rksogqnDyFRz/VsjtlsWT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635409; c=relaxed/simple;
	bh=4j2WP0VBXtLgZPPtRyOeY1pzJaCVOMAATpQzasTkFPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mWy8cYtaMu4J9F4xHR/ag84ROcaNSOzjpsAmnI93tHSBvxVyE9Q45OvpsXKDzZDGe0XkzS0b5MgS2NxrSsbqNcA76h1kcWOVM5S9adKlurTaUVneCaIT4VE+O/GgHha3z0blO3uxZkvGNvDugKJZsWaS765PTiXP7qvofal1Y44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HObv6UF6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HObv6UF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BECB1F000E9;
	Tue, 25 Aug 2026 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787635407;
	bh=ZXoRiD5bYvAZxXygBaNfGM0OaRBjx37u1Hj3HD0YhRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HObv6UF68Re30e+9pPee3YBe6qW0x35OuXJe0DuZSgY0oCCBK5Pf6HpO5ejJWnHMq
	 ribDeVhzuI7CCirLuCeZvHeubwxZ6/IiebNNrx2Pxj5Ues7yP2WbB1TVjEmq8BaomP
	 5/JUQ1Y/SIMX1dwf/+BnfvPRL8qi8yyx8BtLXVWCNjaT6R2hJL3PDg39FLS+2vm3EV
	 33qVXm1T0BNZpoCOJkDPXb1HeHw+wlLWXXll/uALiIq20r8xZcJFytYlgdfBjjTzzt
	 7oo+6RYsHUQAnyab7yCP6Iro43WB7HcKQNluC1mb/vVRMw+AZ7fsyfhEUIVdf925ER
	 d6Cj0hU0X8UPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass
 ref_clk to the core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
 <20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 05:23:27 +0000
Message-Id: <20260825052327.6BECB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Masking of legitimate errors (like -EPROBE_DEFER or -ENOMEM) from =
devm_clk_get_optional() by using IS_ERR_OR_NULL().
- [High] Passing ref_clk to the DWC3 core causes a reference count leak tha=
t leaves the clock physically enabled during runtime suspend.
- [Low] Spammy dev_info() log on every boot for platforms without the optio=
nal clock.
--

--- Patch [2]: [PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass re=
f_clk to the core ---
commit 0c1a156683fd6c3e4e8f63adc608d4af8b20c95e
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core

The dwc3-qcom glue layer sets probe_data.ignore_clocks_and_resets before
calling dwc3_core_probe(), preventing the DWC3 core from acquiring ref_clk.
This patch allows the Qualcomm glue driver to provide ref_clk to the core f=
or
platforms that need it.

> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56b..2d6de6469c1ea 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -705,6 +705,13 @@ static int dwc3_qcom_probe(struct platform_device *p=
dev)
>  	probe_data.res =3D &res;
>  	probe_data.ignore_clocks_and_resets =3D true;
>  	probe_data.properties =3D DWC3_DEFAULT_PROPERTIES;
> +
> +	qcom->dwc.ref_clk =3D devm_clk_get_optional(dev, "ref_clk");

[Severity: High]
Does this code leak a clock reference count during runtime suspend?

The glue driver gets and enables all clocks via devm_clk_bulk_get_all(), wh=
ich
includes ref_clk. By passing ref_clk to the DWC3 core here, dwc3_clk_enable=
()
will increment the clock's enable count a second time.

During HOST runtime suspend, dwc3_suspend_common() intentionally skips
disabling clocks:

drivers/usb/dwc3/core.c:dwc3_suspend_common() {
...
		if (!PMSG_IS_AUTO(msg) &&
		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
			dwc3_core_exit(dwc);
			break;
		}
...
}

Because of this, when the glue driver suspends and calls
clk_bulk_disable_unprepare() in dwc3_qcom_suspend(), the enable count for
ref_clk drops from 2 to 1 instead of reaching 0. Will this leave the clock
physically powered on and cause a permanent power management regression?

> +	if (IS_ERR_OR_NULL(qcom->dwc.ref_clk)) {

[Severity: High]
Does masking the error return from devm_clk_get_optional() with IS_ERR_OR_N=
ULL
discard legitimate errors?

If the clock provider is not yet ready, devm_clk_get_optional() will return
-EPROBE_DEFER. Masking this error means the driver silently proceeds withou=
t the
required clock, leading to incorrect hardware initialization instead of def=
erring
the probe.

> +		qcom->dwc.ref_clk =3D NULL;
> +		dev_info(dev, "NOT setting dwc.ref_clk\n");

[Severity: Low]
Will this dev_info() cause unnecessary log spam on every boot?

When the optional clock is naturally absent from the device tree,
devm_clk_get_optional() returns NULL. This logs unconditionally on platforms
without the optional clock. Could this be removed or changed to dev_dbg to =
avoid
dmesg spam?

> +	}
> +
>  	ret =3D dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret =3D dev_err_probe(dev, ret, "failed to register DWC3 Core\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-ctrl-v1-0-=
609e2291814d@oss.qualcomm.com?part=3D2
