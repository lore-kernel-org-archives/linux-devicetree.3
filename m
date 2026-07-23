Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B782470101
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806193; cv=none; b=jXLlPP8JMTgE7tBQGLNpRGl4zU0m9GBr5kv9Y6p1ysktdN/grEyJYfcHxZ+VJMgSN6ycbF1n5JgcBEqzLvywOEuPhwdWMs5+vC6+Sw/D9w3IdMfsouGZEbjeR4+6b6eK2/M67uQYRes33cp4shd6ivDdlDkfRzgD87rwszQmvy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806193; c=relaxed/simple;
	bh=aFqDh0KO8+3gmnsHatkN5Bc72pTDY9SnTHDpJZX4oSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TyzEZzJkaSxzE3U4cp6RodK95tnrBEJoDA2oAVA1QNuR+QCQkNqkmOFx/tVqViUQmEVAigpo6971C8lpCzpsYL599unS1iqqq+BgQFDuNSvPl9w+Q9ycEDGCgGo6T3SkQYOSt3GXAgxW5yAZTHDoXPT3TzepjFvGw0fyOzuIXV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BR+f4kON; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR+f4kON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137351F000E9;
	Thu, 23 Jul 2026 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806192;
	bh=dnU99ERJ5Jljk5CqOok/wvUgdkSlskv0czSJm0SDhQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BR+f4kONcxVVJNzjQJyhrw/zukvnLUJNkz6mjqTyMkr2uyzUuTmCxVyOKbuZUDbUy
	 RDNttvANr2KXiD4X+JaWy0AY2xaQMCArXmOWR7wS6LakMAV8d1wXkQOk9ncQZP4iAf
	 J5wBKCwKn03R5EeawyvRYWHZubCNjdJAmy5tKyAC448xiVnMn51vwy+bmhk0jEgqJB
	 iyiSe+txH0GcwvAUx90UJy01mjvYQLRLxxXGXeNWT2iQk2GFSQQNRqzScbUYQBMCa8
	 WjnDxI42SLdSp3U43GOQ5yZCLFCfnpxds49FsB5Qj68MBJPyrg1fLQiKwbEG67acZS
	 fRT3iSwN9SiCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-master-v3-2-3d67b79b0515@oss.qualcomm.com>
References: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com>
 <20260723-master-v3-2-3d67b79b0515@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 11:29:50 +0000
Message-Id: <20260723112952.137351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing PM runtime enablement in lpass-va-csr causes a synchronous=
 external abort when CCF reads the hardware state.
--

--- Patch [2]: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse c=
lock ---
commit f6c6796cc5343493b52dddf79a9e09e549136b51
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

clk: qcom: Add LPASS VA CSR heartbeat pulse clock

Adds the LPASS VA CSR driver to model the rate generator as a clock provide=
r.
This synchronizes the start of DMAs and Codec Interfaces and can serve as a
periodic wakeup source for the DSP.

> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-=
csr.c
> new file mode 100644
> index 0000000000000..1d0805789e25a
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c

[ ... ]

> +static int heartbeat_pulse_is_prepared(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr =3D to_lpass_va_csr(hw);
> +
> +	return regmap_test_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL=
_EN);

[Severity: High]
Could this MMIO read cause a synchronous external abort?

When CCF calls the .is_prepared callback (e.g., during late boot via
clk_disable_unused() or a debugfs read from clk_summary), this executes an
unprotected MMIO read. If the LPASS hardware is power-gated at this time, t=
he
unpowered access can crash the system.

> +}

[ ... ]

> +static int lpass_va_csr_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	csr->hb_hw.init =3D &init;
> +
> +	ret =3D devm_clk_hw_register(dev, &csr->hb_hw);

[Severity: High]
Is a call to devm_pm_runtime_enable() missing before clock registration?

Without PM runtime enabled on the device beforehand, CCF's
clk_pm_runtime_get() sees core->rpm_enabled as false and skips acquiring the
power domain. This leaves the hardware unpowered and vulnerable to crashes
during the .is_prepared checks.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register heartbeat clock\n");
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb=
_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-master-v3-=
0-3d67b79b0515@oss.qualcomm.com?part=3D2
