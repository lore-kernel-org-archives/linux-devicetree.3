Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B2352E061
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790193925; cv=none; b=Rmf0F8I34C1qOEgJL+U2U2kuGqRHHuivYNdWNproY9IXrazXyrPjVGjgoeOLnkOX0vT99MWgAvpkteLtazpOTfVhbivdBnV+aGvwYEgFOD83Sub3ZAj9npjqpcbaw6sPkNAjU6i7L2RluUZZDMuaHxnx7yQ3o8ROsCMBIIT8FZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790193925; c=relaxed/simple;
	bh=igne0htWy+F72qzN6azFE4j3sqt/9tXfoS+3HyoYFIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lo39ZxmHdXxOtVI73RBUT40JN4hI/LX67iIn/W3HxsIbcmJcxmQbEQWQjKZ39eyAp/pxOvfVeF2yOifuPBbK3iSUuJICKtMsc/T+ULrQPIDXUqBTOUH6Cg3/IJHXxHhHjvNzPSRRFfR/qWKXdMwjws+eUHqJpMQDcV1RsxZqsGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9RjOfR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9RjOfR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E766D1F00898;
	Wed, 23 Sep 2026 20:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790193924;
	bh=WdpJuFz3RQWOtX8bjMEYw+dYLsgVqM3pIQ9fiEeoXmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a9RjOfR3ZCRI/4IKWC4AMSKi1Oy4iXDwoZ7DBFyDsky8kf2FW1keVkd4ysCIc2g9U
	 fmMBBOdN8j5AMPY+q9UMtlnOOb9nRLmNRdesiTGCU1Lb2MfFrBGT52aJoAlymO172I
	 6fxLuL7LO231n/JwV1q4U/Fq5O7MIM2yyazJ9R4p+xrPqf1lxmmZMGMn6ukIrmah0K
	 aS58amAKbVVVV4WyioFwo2EEXDT3HcHuBOJNbL0XNedAs0SmaDzgXbchb25qCS36/g
	 JdzhGVCYb9i06MagZxrbLn8gXSyf6FHcNVtox1+dFxB02M9K/PDW8PGWpD6zftl2t2
	 I/TQZ454Wk97g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, wsa+renesas@sang-engineering.com, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260922200336.2201212-8-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
 <20260922200336.2201212-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:05:23 +0000
Message-Id: <20260923200523.E766D1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pm: unbalanced pm_runtime_enable on teardown
--

commit 43d28493f3eec64a96af219e5448ffe0efe56d58
Author: Coia Prant <coiaprant@gmail.com>
net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit introduces a new platform glue driver for the Synopsys DesignWa=
re
XPCS on Rockchip RK3568 SoCs. It implements an MDIO bus that translates
requests to APB3 memory-mapped registers. It also adds necessary clock and
power domain management for the device.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..35ee980a759e5
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
[ ... ]
> +static void xpcs_rk_exit_clk(void *data)
> +{
> +	struct dw_xpcs_rk *pxpcs =3D data;
> +	struct device *dev =3D &pxpcs->pdev->dev;
> +
> +	pm_runtime_force_suspend(dev);
> +	clk_disable_unprepare(pxpcs->eee_clk);
> +}

[Severity: Medium]
Could this lead to an unbalanced pm_runtime_enable?

In xpcs_rk_init_clk(), pm_runtime_enable(dev) is called, and this function
xpcs_rk_exit_clk() is registered as the devm teardown action. However,
pm_runtime_disable(dev) is not called here.

If the driver is unbound via sysfs or fails to probe later in the sequence,
the teardown action runs but leaves PM runtime enabled. This can trigger
kernel warnings about an unbalanced pm_runtime_enable and break subsequent
device binding PM state.

> +
> +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> +{
[ ... ]
> +	ret =3D clk_prepare_enable(pxpcs->eee_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable EEE clock\n");
> +		return ret;
> +	}
> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret =3D devm_add_action_or_reset(dev, xpcs_rk_exit_clk, pxpcs);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922200336.2201=
212-1-coiaprant@gmail.com?part=3D7
