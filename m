Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145739F166
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579444; cv=none; b=nFEoiIEqqOtTZERhLuockyS+bLeH5lJ/ndbwfcrV8/oWIf+6GIcHK5m4rx18bqzWFxPxqHvGYTkwv1TjEX0m8qKYFeWQHUHkKosn9YIrU+9V6g0+4FkfW9vcSXaBTsdudP0sLPojo7sGbHYDZUoGBXh4AtTsGA3fwkbrCkce0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579444; c=relaxed/simple;
	bh=QSZgORjh5SXspNdaWhCuXUzWpAzRV+j2tfoSouYK1TM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MBrrbLEMadyN6UVY+FSw1P/75L0LWUZ0DZ/+iGXDyDep7eL/cRIu837gkq/oUJB4h3dNH3qL/SDNJYvw2thcoR81M3wwa4i5hqHWd6Ru9bN6y6dBq3itmnZLK6RW/gZhnhcR8TMUdOhq2/UeqJEEc46ST6tCAOnlULX6f0gF/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZNDj+pD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZNDj+pD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F3F1F000E9;
	Mon, 20 Jul 2026 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579442;
	bh=crzqQaF0qXx7rQNoBPSjAnQ8jz1fR5JI7SxPnowg/9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fZNDj+pD2kY+GcDtaq3vTED+1/NGiWCsXVa9pkGYJlZ6qC2Scj3lWsId55xed9RrO
	 Zsooaqo+Hg4anFuUK7lzQsEBcHubmIYJiyDwVlz+j6QyYa/PsuY26fQ7PA6aiDZcgz
	 ClxYTIUQT/qREIZ4RSbzyfqjTJyySBNDUHDuOg9Pc+oh6ihRiRvcbF7daaJn56hYPr
	 +i7SZyZyU1jva53dGf7iiEjyyNSMQzTWkbMJD9APMEKcDQj5laCDu8TnMHdH9nghMf
	 FOxT07obreXB+ZFWSnw8irWX4SKRrYTlMIzO4LTrUkOvF6uie54cBK31QdlyLyKngW
	 n4Cq/EDlPMWLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] EDAC/altera: use flag to differentiate 64-bit
 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinh Nguyen" <dinguyen@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720201425.1538771-3-dinguyen@kernel.org>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
 <20260720201425.1538771-3-dinguyen@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:30:41 +0000
Message-Id: <20260720203042.59F3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] A syntax error prevents compilation due to a typographical error in=
 variable initialization.

Pre-existing issues:
- [High] The IRQ domain is leaked and chained IRQ handlers are left danglin=
g on probe error paths.
- [High] The driver registers a panic notifier but never unregisters it, le=
ading to a Use-After-Free on unbind.
--

--- Patch [2]: [PATCH 2/4] EDAC/altera: use flag to differentiate 64-bit pl=
atforms ---
commit 4db36eaf83f8ef9e44a35979b3fccecc08fabc69
Author: Dinh Nguyen <dinguyen@kernel.org>
Subject: EDAC/altera: use flag to differentiate 64-bit platforms

This commit introduces a flag to differentiate platforms like Stratix10 and
Agilex5 by storing it in the driver match data. It updates the device setup
and probe functions to check this flag instead of the boolean is_s10 field.

> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1507,7 +1507,7 @@ static int altr_portb_setup(struct altr_edac_device=
_dev *device)
>  	int edac_idx, rc;
>  	struct device_node *np;
>  	const struct edac_device_prv_data *prv =3D &a10_sdmmceccb_data;
> -	bool is_s10 =3D device->edac->is_s10;
> +	unsigned long flag =3D {unsigned long)device->edac->flag;

[Severity: Low]
Is there a syntax error in this type cast? Using a curly brace instead of a
parenthesis causes a build failure.

[ ... ]

> @@ -2152,8 +2152,8 @@ static int altr_edac_a10_probe(struct platform_devi=
ce *pdev)
>  	irq_set_chained_handler_and_data(edac->sb_irq,
>  					 altr_edac_a10_irq_handler,
>  					 edac);
> -	if (edac->is_s10)
> -	{
> +
> +	if (edac->flag =3D=3D SOCFPGA_S10) {

[Severity: High]
This is a pre-existing issue, but does this probe error path leak the chain=
ed
IRQ handler and IRQ domain?

In altr_edac_a10_probe(), irq_set_chained_handler_and_data() is called for
sb_irq. If a later step fails, like fetching db_irq:

	edac->db_irq =3D platform_get_irq(pdev, 1);
	if (edac->db_irq < 0)
		return edac->db_irq;

The probe function returns the error directly without unregistering the cha=
ined
handler. Since the edac structure is devm-allocated, it gets freed on probe
failure.

If the interrupt triggers later, could this cause a use-after-free when the
handler executes with a dangling edac pointer?

>  		int dberror, err_addr;
> =20
>  		edac->panic_notifier.notifier_call =3D s10_edac_dberr_handler;
>  		atomic_notifier_chain_register(&panic_notifier_list,
>  					       &edac->panic_notifier);

[Severity: High]
This is a pre-existing issue, but does this driver ever unregister its panic
notifier?

The edac structure is devm-allocated, but I don't see a devm action or a=20
.remove callback to unregister the panic_notifier.

If the driver is unbound via sysfs, devres will free the edac structure,
leaving a dangling pointer in panic_notifier_list.

Could a subsequent panic attempt to call the freed notifier block and trigg=
er
a nested panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720201425.1538=
771-1-dinguyen@kernel.org?part=3D2
