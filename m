Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5574397942
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716002; cv=none; b=PRg55O41DfLdnMzyv9PRIzcYbJGCOlD9Xh1NYLkcuoB69HCl9WUuubTcBSM+TNiieWbxTLBgS19Dp/RBKNTy0blBxlYxDcpMhEnPn1QakTzVK7iAYksaLznpspKNY1WxjboK5wCQpVUD/be0EffGDoAWssIO7r9mYQ8bsxQe0NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716002; c=relaxed/simple;
	bh=Q+rjJ5Sk+dp2ICYQxcU/YXqb2MZEqskp3/sW0AnvTMA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ae0R70WJUxh3xtqOoxhkisuw7Y5fQp5pcNWPOdOr0cZdZ8caGUaH/vWd4HGJevdzNwKddtxlB0f8vEH4EQkZ1CJ6SJE1mUTfHZtH0w54nXPhKSlv+YxfhIm5LlJkw2IxXhPbiqi/R1dW6yyqu7bdx323iZD4wyCp+83uYEvsaQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dshkosVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dshkosVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1628E1F000FF;
	Fri, 18 Sep 2026 07:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789715997;
	bh=cwoGWBRrHN8uBYJSQHae7XZKhWRBR5aaaLd7if0VBZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dshkosVekSrIlX3x++ikR39mnOH97U9iF9BjmRb8xfHOcoP9IiP4CF7ally4D1iVF
	 orI4XB1/WHJi+D6I9Dx2RaBEFazhl7yCMOrAS5FcprD61ZzrLuhrUBG4Mjz/bVRu5o
	 HUZGn7SF0W0v6rbcyRzFtSOmY4ZcMWQKHNOZ5igkt0hB/BpaehgswOAFMJa3sOMH6V
	 E5yu4KvSq3TZAItX+Sz+zgpw0nouPclRHpvmqZ+5sSY8cI2MKVOvpKy8SOVcYdLwpr
	 /AMTqriKV6W8qFF+feMKDXILXwzH8wbPbYfrInCy//5X/S7C6Teo8/e6JHhY3nEf9I
	 jVB8XkrTOfe6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] usb: dwc3-generic: Add Starfive JHB100 USB 2.0
 device controller and adapter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918071103.24482-4-minda.chen@starfivetech.com>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
 <20260918071103.24482-4-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 07:19:56 +0000
Message-Id: <20260918071957.1628E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] usb: improper handling of optional adapter resource masks legiti=
mate errors
- [Low] usb: missing static keyword on jhb100_glue_ops causes namespace pol=
lution
--

commit e26d59375d5e4555d239557e241788e437655348
Author: Minda Chen <minda.chen@starfivetech.com>

usb: dwc3-generic: Add Starfive JHB100 USB 2.0 device controller and adapter

This patch introduces the Starfive JHB100 USB 2.0 device controller and
its associated PHY adapter settings to the generic DWC3 driver. It adds
io memory mappings for the adapter and implements pre-run/stop operations
to appropriately toggle the adapter port enable bit during gadget enumerati=
on.

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-g=
eneric-plat.c
index ca69ac0eb07ce..e3394205a5197 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c

[ ... ]

> +static void dwc3_jhb100_pre_run_stop(struct dwc3 *dwc3, bool start)
> +{
> +	struct dwc3_generic *data =3D to_dwc3_generic(dwc3);
> +	u32	val;
> +
> +	if (start) {
> +		val =3D readl(data->phy_regs);
> +		val |=3D JHB100_ADAPTER_PORT_EN;
> +		writel(val, data->phy_regs);
> +	} else {
> +		val =3D readl(data->phy_regs);
> +		val &=3D ~JHB100_ADAPTER_PORT_EN;
> +		writel(val, data->phy_regs);
> +	}
> +}
> +
> +struct dwc3_glue_ops jhb100_glue_ops =3D {

[Severity: Low]
Could this struct be marked static and const?

Since jhb100_glue_ops is only assigned to dwc3g->dwc.glue_ops locally within
drivers/usb/dwc3/dwc3-generic-plat.c, leaving it globally exposed might lead
to link-time symbol collisions or sparse warnings.

> +	.pre_run_stop =3D dwc3_jhb100_pre_run_stop,
> +};
> +
> +static int dwc3_jhb100_init(struct dwc3_generic *dwc3g)
> +{
> +	struct platform_device *pdev =3D to_platform_device(dwc3g->dev);
> +
> +	dwc3g->phy_regs =3D devm_platform_ioremap_resource_byname(pdev, "adapte=
r");
> +	if (IS_ERR(dwc3g->phy_regs)) {

[Severity: Medium]
Will this error handling mask legitimate failures?

The adapter resource appears to be optional here since dwc3_jhb100_init() f=
alls
back to generic behavior when it is missing. However, using
devm_platform_ioremap_resource_byname() on an absent resource will
unconditionally log an invalid resource error via dev_err_probe(), potentia=
lly
spamming the kernel log on platforms where it is intentionally omitted.

Additionally, checking IS_ERR() here will catch all other errors like -ENOM=
EM
or -EBUSY and silently downgrade capabilities by returning 0, instead of
propagating the real failure to the caller.

> +		dwc3g->phy_regs =3D NULL;
> +		/* Generic bmc USB with PHY*/
> +		return 0;
> +	}
> +
> +	/* usb device controller with adapter */
> +	dwc3g->dwc.glue_ops =3D &jhb100_glue_ops;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918071103.2448=
2-1-minda.chen@starfivetech.com?part=3D3
