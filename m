Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E01D18B0A
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917038; cv=none; b=aQfFaW2XqWLF+J/h2XUrT21i1XAvGHyB3DMAJRsznMla+s+pJSZEHeNQwTuS6aoz4ZZDNGrYN6ImwlKjqQgUDBTlJOSXecPHHFz+6gnHgwKASRJmNiq9Ao9YThCYrC1MmnJV/J6hGsbC/wOL69x1oimnUl9i9Sa3PxF6iUHAsJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917038; c=relaxed/simple;
	bh=AokyGEsWDe25rk+O3JFU5VWP9vTr7PPojVGZ0D1tPJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lzNAH0AfKQn/RykRs0o6PtzARpLqWj5eyujRV8huEoQM9cex1fLyZnKRio+ukyMRy5RYqtI6U+1uN1yBfyIwiFzb3KsD4T54KD8lUZkYDnenZaUB0LwRQfnmwOYVw0/bJXVUwyG4LK8enTMBV2Ua9Z0UlRDsTI6YJ6zD+T2+4iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fX7SXMy2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fX7SXMy2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6271A1F000E9;
	Sun, 16 Aug 2026 21:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786917036;
	bh=N4w8xCOO8f09MDNwRouKUo/4lrrabVaO6mAI2vdo/sc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fX7SXMy2DC7XvRhc4e8yjQs4ULXJJT9ODLHKIxXaE1oTqzsW3GocHjvA8rAilVmN9
	 Ti8+9Akemz7gSKpCe/3vSIcTtydu46MoSkLoDLFA4gPFTRE5tHJ+e3KxlfzCXANXoe
	 cUSbas0FdT5o7qRAeKw/ywY46vB/SA+7v73YL4F+97YFXoHIFzTG3PDT/OKtKDMDSl
	 iDHQX5jQXOu/NQQqV6skyhVo2ZxyScrZbj+jsRR2Yzu1hAKaiUCrkN5Q5yyEdwBuBI
	 8NHld1+F7ymLBo/JkGLAjRw1+BkxcWmXKIBIt7Z7vACzDNkP5t1IPFDQ9/IRk9E5JY
	 8QmMwBEkwYYsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260816213849.1044073-3-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-3-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 21:50:35 +0000
Message-Id: <20260816215036.6271A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Error paths in `stm32_usb2phy_enable()` and `stm32_usb2phy_disable=
()` fail to unwind the `en_refcnt` atomic counter, leading to state corrupt=
ion and leaked resources.
- [High] Incorrect handling of `devm_regulator_get_optional()` return value=
 unconditionally fails probe on systems without the regulator.
- [High] Lockless `en_refcnt` check introduces a TOCTOU race condition allo=
wing concurrent callers to bypass hardware initialization.
- [Medium] Unchecked dereferences of `dev->of_node` and `phy_dev->hw_data` =
during probe allow a local Denial of Service (Oops) if bound without a Devi=
ce Tree node.
--

--- Patch [2]: [PATCH v2 2/9] phy: stm32: Add support for ST STM32MP25 USB2=
-FEMTO PHY ---
commit e1cc42ded5599cd15a5c991b72a87e2e909f244d
Author: Pankaj Dev <pankaj.dev@st.com>

phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY

Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
Two such PHYs in total are present in STM32MP25 SoC.

> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm3=
2-usb2phy.c
> new file mode 100644
> index 0000000000000..a5cc7b855c61f
> --- /dev/null
> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
> @@ -0,0 +1,361 @@
[ ... ]
> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
> +{
> +	const struct stm32mp2_usb2phy_hw_data *phy_data =3D phy_dev->hw_data;
> +	unsigned long rate;
> +	int refsel, ret;
> +
> +	/* Check if a phy is already init or clk48 in use */
> +	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
> +		return 0;

[Severity: High]
Is it safe to rely on this lockless check?

If two threads call stm32_usb2phy_enable() concurrently (for instance, via
phy_init and clk_prepare), the second thread will increment en_refcnt to 2
and return success immediately.

Will the second thread then proceed to use the hardware before the first
thread has actually finished enabling the regulators and clocks?

> +
> +	rate =3D clk_get_rate(phy_dev->phyref);
> +	if (rate =3D=3D 19200000)
> +		refsel =3D 0;
> +	else if (rate =3D=3D 20000000)
> +		refsel =3D 1;
> +	else if (rate =3D=3D 24000000)
> +		refsel =3D 2;
> +	else
> +		return -EINVAL;

[Severity: High]
Does this error path leak the en_refcnt?

If we return here, the counter remains incremented. Subsequent calls to
stm32_usb2phy_enable() will then see a value > 1 and instantly return
success without initializing the hardware.

[ ... ]
> +static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
> +{
> +	int ret;
> +
> +	/* Check if a phy is still init or clk48 in use */
> +	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
> +		return 0;
> +
> +	ret =3D reset_control_assert(phy_dev->rstc);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this error path need to restore the en_refcnt?

If reset_control_assert() fails, we return without disabling the clock
or regulator, and the counter remains decremented.

[ ... ]
> +static int stm32_usb2phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	phy_dev->vdd33 =3D devm_regulator_get_optional(dev, "vdd33");
> +	if (IS_ERR(phy_dev->vdd33))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->vdd33), "Failed to get vdd3=
v3 supply\n");

[Severity: High]
If this regulator is truly optional, shouldn't we handle the -ENODEV return
value gracefully instead of failing the probe unconditionally?

If it's missing from the Device Tree, devm_regulator_get_optional() will
return -ENODEV and cause the probe to fail on valid hardware configurations.

> +
> +	phy_dev->regmap =3D syscon_node_to_regmap(dev->of_node->parent);

[Severity: Medium]
Can dev->of_node be NULL here?

If a user manually instantiates the device via sysfs or software nodes
without an associated Device Tree node, this will result in a NULL pointer
dereference when accessing parent.

> +	if (IS_ERR(phy_dev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap), "Failed to get reg=
map\n");
> +
> +	offset =3D of_get_address(dev->of_node, 0, NULL, NULL);
> +	if (!offset)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get regmap offset\n");
> +
> +	phy_dev->cr_offset =3D be32_to_cpu(*offset);
> +
> +	phy_dev->hw_data =3D device_get_match_data(dev);

[Severity: Medium]
Should we check if phy_dev->hw_data is NULL before proceeding?

In a scenario without a Device Tree node, device_get_match_data() will
return NULL, which is later dereferenced in the enable and disable paths.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816213849.1044=
073-1-marex@nabladev.com?part=3D2
