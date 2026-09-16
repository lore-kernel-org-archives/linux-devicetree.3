Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66993115AE
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570220; cv=none; b=mU3wVoW5bW4BdvfuqWO5KBsQMztYcNajie9pv+ftHBq/esDlJnPauZEeffCvo4s6PgoVh9IVC3y9RFXQ1oUMb0YZkMEmPfokh2bSQ7stD6yY2BHt05juJUGwUTPtrqTgV1hX7JlRAGXouSxEOhuyq+5usm0NNfinb5M3AMUxInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570220; c=relaxed/simple;
	bh=ED118zbPhYXfnhkDpw5jbKjFZ1nQB2UORHwdqxXwJSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FICg2QhGSWtPEDIN72gm6oFlVPbWgIBznVL9h1XA3U6ONU1nWYgn3GBfc01cRRCf1dy1GfSESM3Zc8GEsqJlyiuwwf0tGNmYPEpilXRUshAWCyop2GNADW0l1V1db+X5lgS94grLB+pXWcxpnL9exqI92LV0387aUw5vk0z8XyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5iec88W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5iec88W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E901A1F00893;
	Wed, 16 Sep 2026 14:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570218;
	bh=Jo9RRN8mVnzQ+ecO+UBH1aOTFwFWiiuhUrh7wFlKOmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y5iec88WfRZLRHfBcIvn5BNE6oo4E9uU6oTiUS6JnYz48v/LGTpg11nOI7xyOBeHv
	 qI+80qYhG82FWIqHjcSxIJBEHdhzhfWsaTTj5ObvYaSTEAk0XA079JpQUkoRo8tCHD
	 6gZ2+0OrZQlu5c3ySlhdkdAhgc43yqyWwYLfJQlGtv3cUMJhCUKHa8mjjRs7oYF1vJ
	 JV7zBLqYt78ufD+9xfObWTo3QRygVdl3GbAqq7dZYe76Lfs5BwkAgpaDPOJuRFjAaD
	 9Bki8QRpDnHPd0jhv+dNFvLo8HxXkCJib2e+W31B0pD5csps92IjcZ68ahFFa6fns+
	 MtjlPGjL5A4og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260915123802.1561724-8-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
 <20260915123802.1561724-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 14:50:17 +0000
Message-Id: <20260916145017.E901A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: pcs: UAF in xpcs_rk_create due to lockless drvdata access
- [Low] kconfig: unmet PM_GENERIC_DOMAINS dependency via select
- [Low] net: pcs: integer underflow in EEE multiplier calculation
--

commit 45fa9f088b9d4ae656f2c67e864a462b4d229815
Author: Coia Prant <coiaprant@gmail.com>
net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit adds a Rockchip RK3568 platform glue driver for the Synopsys
DesignWare XPCS controller. It creates a virtual MDIO bus to translate MDIO
operations to APB3 register accesses and derives the EEE multiplier at runt=
ime.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf

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
Will selecting PM_GENERIC_DOMAINS without inheriting its PM dependency cause
unmet direct dependency warnings?

The config PM_GENERIC_DOMAINS has a strict dependency on PM. If
PCS_XPCS_ROCKCHIP is enabled on a platform where PM is disabled, won't this
force PM_GENERIC_DOMAINS on and trigger Kconfig warnings?

> +	help
> +	  Support for XPCS controller on Rockchip RK356x SoC.
[ ... ]
> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
[ ... ]
> +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> +{
[ ... ]
> +	/*
> +	 * Compute the multiplier for the EEE clock so that
> +	 * clk_eee_period * (mult_fact + 1) falls within 80..120 ns.
> +	 *
> +	 * On RK3568, clk_xpcs_eee is muxed between gpll200 (200 MHz, 5 ns)
> +	 * and cpll125 (125 MHz, 8 ns), selected by CRU_CLKSEL_CON29 bit 13.
> +	 * The reset value is 0 (200 MHz), but derive the value at runtime to
> +	 * stay correct if the mux is changed by a board.
> +	 *
> +	 * Use a 64-bit intermediate: on 32-bit builds, 100 * 200000000
> +	 * does not fit in unsigned long. Clamp to the 4-bit
> +	 * DW_VR_MII_EEE_MULT_FACT_100NS field.
> +	 */
> +	rate =3D clk_get_rate(pxpcs->eee_clk);
> +	if (!rate)
> +		return dev_err_probe(dev, -EINVAL, "Invalid EEE clock rate\n");
> +
> +	mult =3D DIV_ROUND_CLOSEST_ULL(100ULL * rate, NSEC_PER_SEC) - 1;
> +	pxpcs->eee_mult_fact =3D min_t(u64, mult, 15);

[Severity: Low]
Does this calculation underflow if the EEE clock rate is very low?

If the board configuration provides a clock rate under 5 MHz, the division
yields 0. Subtracting 1 causes an unsigned underflow to UINT64_MAX.

Won't the subsequent min_t() clamping logic evaluate UINT64_MAX < 15 as fal=
se,
incorrectly assigning the maximum multiplier of 15 instead of 0?

> +	return 0;
> +}
[ ... ]
> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *n=
p)
> +{
[ ... ]
> +	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	pxpcs =3D platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {

[Severity: High]
Can this lockless access to the supplier's drvdata cause a use-after-free?

If the supplier driver is concurrently unbound via sysfs, the supplier might
have already passed the consumer unbind checks before this device link was
established.=20

If the supplier then proceeds to devres cleanup and frees the pxpcs memory,
won't dereferencing pxpcs->bus access freed memory?

Should the consumer hold device_lock(&pdev->dev) while validating the suppl=
ier
state and reading its drvdata to prevent this race?

> +		device_link_remove(dev, &pdev->dev);
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123802.1561=
724-1-coiaprant@gmail.com?part=3D7
