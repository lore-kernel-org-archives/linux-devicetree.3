Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2604229D0
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009241; cv=none; b=k6YHARDj20nP/D5JQybd+0UTV8xETrfvIDp1/PDysnCbgNLY5NAmtmZLF160NT9To/5F7S/28K4lK8eKLZU3mnvkyykpuqnD511+829TUCy93l3XpRGoUJ0V7urtScfp5ngb7YjVt+30fjL/3Zliyr/gWgdFMU8+AcKNmARiFTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009241; c=relaxed/simple;
	bh=QSr58JMbk4J6MUCIWN8/lX23S3rKd0rF8xP4PnAa9i4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q87ZllkkTOh2OIGTYSqy/W/XezPPZlgaW0y+1JwsBhpvp7XJSA+ZNsNr0hsxJd4WVgRrkc9ADJ8N0aUjeIfD5TY4mJ0On8VcGE5SR1jiYydUI7oWAgKRvHSRMmcMGgDNtIE42theKTCG3rNgpmiK0w2qntdsecdzjxDt14irk0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5M6IHdl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5M6IHdl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE071F000E9;
	Thu,  6 Aug 2026 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009239;
	bh=mBx0uwY8n9iF/jnJMgXNTRUoxZQYEbKFsuGXKB4g228=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X5M6IHdleiwIWvKeScXx0XcvGSnHRhn8E2RD2Ptjy9KfmrA+u7tgtI13r8GKxyt9A
	 Xs+XJ4ostp3f2gaYJJqRj2ZnWBQgOguZF7g5rgVrdxPYROqJwE2nTSWq9IzMGb2Jmi
	 ArY9nfcuJfS01HHe6l1EvpytqEf7JAl5VtEp1CMMQTmGrmp7BAePcISAdXMWl/ZYYy
	 LwqP5L6yNbA0GAmhdegkpNBEtri0XxNq8bK8mDt3c2YHqne3jXMWn8XRyhcxdZgHd+
	 xbaTGqHDhV5ppO+mQBofSxYHpcwLBRBT+GUIjk1BNsrFh7U63ZmCRwCXvXWFopMiDG
	 6ct0W4ONmGVNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: altera: agilex72: add clock manager
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <394c5838c535f939361da220ad94c9aec7fea973.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <394c5838c535f939361da220ad94c9aec7fea973.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:40:38 +0000
Message-Id: <20260806094039.3BE071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Clock gate operations (.enable, .disable, .is_enabled) are missing=
 from gateclk_ops, rendering clock gating non-functional.
- [High] Probe error path leaves non-devm clocks registered with CCF while =
their backing MMIO regions are unmapped, leading to a use-after-free panic.
--

--- Patch [5]: [PATCH 5/5] arm64: dts: altera: agilex72: add clock manager =
support ---
commit 9ede61d9f11826e0bfb7cdf0bab36155fec8e509
Author: Chiam, Evon <evon.chiam@altera.com>

arm64: dts: altera: agilex72: add clock manager support

Add the Agilex72 clock manager node and input reference clocks, and
wire the UART clocks through the clock manager instead of a fixed
clock. Set the SoCDK board-specific input clock frequencies.

> diff --git a/drivers/clk/socfpga/clk-agilex72.c b/drivers/clk/socfpga/clk=
-agilex72.c
> new file mode 100644
> index 0000000000000..e350d8a9bb4d9
> --- /dev/null
> +++ b/drivers/clk/socfpga/clk-agilex72.c
> @@ -0,0 +1,1181 @@
[ ... ]
> +static const struct clk_ops peri_cnt_clk_ops =3D {
> +	.recalc_rate =3D agilex72_clk_peri_cnt_clk_recalc_rate,
> +	.get_parent =3D agilex72_clk_periclk_get_parent,
> +};
> +
> +static const struct clk_ops gateclk_ops =3D {
> +	.recalc_rate =3D agilex72_gate_clk_recalc_rate,
> +	.get_parent  =3D agilex72_gate_get_parent,
> +};

[Severity: High]
Since gateclk_ops omits the standard clock gating callbacks like .enable,
.disable, and .is_enabled, won't this prevent the kernel from toggling hard=
ware
gates?

If a peripheral's clock was disabled by the bootloader, calling
clk_prepare_enable() from a driver will silently return success without
modifying the hardware. Subsequent register accesses to that peripheral cou=
ld
trigger a synchronous external abort.

[ ... ]
> +	init.ops =3D &gateclk_ops;
> +
> +	init.name        =3D clks->name;
> +	init.flags       =3D 0;
> +	init.num_parents =3D clks->num_parents;
> +	init.parent_names =3D clks->parent_names;
> +	socfpga_clk->hw.hw.init =3D &init;
> +
> +	hw_clk =3D &socfpga_clk->hw.hw;
> +
> +	ret =3D clk_hw_register(NULL, &socfpga_clk->hw.hw);
> +	if (ret) {
> +		kfree(socfpga_clk);
> +		return ERR_PTR(ret);
> +	}
> +	return hw_clk;
> +}

[Severity: High]
Individual clocks are registered into the Common Clock Framework using
clk_hw_register() here without being tied to the device's devres lifecycle.

If devm_clk_hw_register_fixed_factor() fails later during
agilex72_clkmgr_init(), the probe will abort and the devres framework will
automatically unmap the MMIO bases.

However, these non-devm clocks registered earlier will not be unregistered.
Could this leave dangling pointers in the CCF?

[ ... ]
> +	/*
> +	 * usb31_ref_clk is a 1:1 alias of usb31_suspend_clk. The DWC3
> +	 * controller uses the same source for both its suspend and reference
> +	 * clock inputs on this SoC. Register it as a fixed-factor (passthrough)
> +	 * clock so that enabling it propagates to the parent gate without
> +	 * touching any gate register of its own.
> +	 */
> +	clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK] =3D
> +		devm_clk_hw_register_fixed_factor(dev, "usb31_ref_clk",
> +						  "usb31_suspend_clk", 0, 1, 1);
> +	if (IS_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]))
> +		return dev_err_probe(dev,
> +			PTR_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]),
> +			"failed to register clock usb31_ref_clk\n");

[Severity: High]
This error path fails the probe without unregistering the previously regist=
ered
non-devm clocks.

If CCF later walks the clock tree (e.g., via a read of
/sys/kernel/debug/clk/clk_summary), it will invoke the .recalc_rate callbac=
ks
of these leaked clocks. Those callbacks will dereference the now-unmapped m=
emory
pointers, causing an external abort/kernel panic.

Is there a way to unregister them to avoid leaving dangling pointers, or sh=
ould
devm_clk_hw_register() be used for all clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786006669.gi=
t.evon.chiam@altera.com?part=3D5
