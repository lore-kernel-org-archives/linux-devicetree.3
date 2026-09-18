Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9A52759D
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764536; cv=none; b=QeJpKW6v+GNmrBD5Se1/al8VNvod1P5zoZgV7q93P9DnrWMs8p1KU0mXdDCZAyy19LUxKigl/do1KJUBwj4+h32uzf0mHgo6zLABct0P+qTSTF/oXmUXVPtWYYXaQxsDk+c5JqNGOhgSRrl37BNIDqthtmzPqRhmO72AWSN2H0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764536; c=relaxed/simple;
	bh=xNkLUgZWFr3nE9Lqsve0H6y3JUyW7fS3sCW8Lu8ZduA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QO9biVqdfzRYim5JNfsiIHY2EGwvZT4WaZjM3BluArUYnihYjwpyffhvavXtoYCkTsTV2276/E8S+WhAckRPvAYLpHa/7klLDw8klLtPOtH30PziSRmuCPhAuWANDF3e9c8RZXxFAKr8MIcV3wI94gr0SkZYic2+Lf1+1XkdAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qkibi1k0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qkibi1k0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6441F00898;
	Fri, 18 Sep 2026 20:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789764527;
	bh=OtisZjymYY36XGuS/uxRgwWJQmpSC3oGaySCRIJ7ZK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qkibi1k0JgABOdhlgVIPnLMoQzTlq81GgIcxZqhm2i3EnuSIgtBmcQG80ay4ceUK5
	 YBEwpgxlXJJ3TMMP6OA98OUKWDqyVnFGV/X4pg3c7Prwbev6nU+/N4JKxuzVdQYxmY
	 1XVGRkwCPboULBm7RfG5B8BQGwG8LRSZpLLVldrrKxsI1EWruRMP1SM0jEY4WN26Ba
	 lfubdS0hTa7RfF1f/P3jeNcrQMfoW93af2MN3drAoVFTXKYfc6sPza5MtIqYmymDLF
	 91VL+GpUUJa3p/iJ69LHc2BDvAAk2w/lAdWuK4J8/5nDL1rsykEO/h9270urRzxd1w
	 Dk8+JxFUdaX1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917204624.2427486-8-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
 <20260917204624.2427486-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 20:48:46 +0000
Message-Id: <20260918204847.2B6441F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: pcs: use-after-free in xpcs_rk_create() during concurrent sup=
plier unbind
- [Low] kconfig: unmet dependency warning due to PM_GENERIC_DOMAINS select =
without PM
--

commit 7e2d67535ce6f3173f2984680b0a77b61caaf964
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit adds a platform glue driver for the Synopsys DesignWare XPCS
on Rockchip RK3568 SoCs. It implements a virtual MDIO bus to translate
MDIO operations into APB3 memory-mapped register accesses.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> --- a/drivers/net/pcs/Kconfig
> +++ b/drivers/net/pcs/Kconfig
[ ... ]
> +config PCS_XPCS_ROCKCHIP
> +	tristate "Rockchip XPCS controller support"
> +	default ARCH_ROCKCHIP
> +	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select PM_GENERIC_DOMAINS

[Severity: Low]
Will this cause a Kconfig unmet direct dependency warning during compilation
when PM is not enabled?

Because PCS_XPCS_ROCKCHIP has a COMPILE_TEST fallback in its depends on
list, it can be enabled on architectures without CONFIG_PM. Forcefully
selecting PM_GENERIC_DOMAINS (which depends on PM) without inheriting
that dependency could lead to a configuration mismatch.

Could this Kconfig entry add a dependency on PM, or only conditionally
select PM_GENERIC_DOMAINS?

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
[ ... ]
> +	/*
> +	 * Pin the supplier before reading its drvdata: device_link_add()
> +	 * refuses to create a managed link while the supplier is being
> +	 * unbound, so if it succeeds the drvdata cannot be freed under us.
> +	 * The link is released automatically when the consumer device is
> +	 * destroyed (DL_FLAG_AUTOREMOVE_CONSUMER), which covers all probe
> +	 * failure paths, so no explicit device_link_remove() is needed.
> +	 */
> +	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	pxpcs =3D platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {

[Severity: High]
Is this sequence in xpcs_rk_create() safe against a concurrent supplier
unbind?

The comment assumes device_link_add() returns NULL if the supplier is
unbinding, but it actually succeeds and creates a link with a state like
DL_STATE_SUPPLIER_UNBIND or DL_STATE_DORMANT.=20

If userspace concurrently unbinds the XPCS supplier device while this
consumer MAC driver is probing, reading the drvdata via
platform_get_drvdata(pdev) might yield a pointer to devres memory that
has already been freed by the supplier's remove path.

Should this code acquire the device lock on the supplier, or otherwise
verify the device is fully bound before dereferencing its drvdata?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917204624.2427=
486-1-coiaprant@gmail.com?part=3D7
