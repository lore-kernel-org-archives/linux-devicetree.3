Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D68444DB95
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249713; cv=none; b=cHVzr0GUVmBpexEFizxbIXpcB30XrixgbPvDjf8CakWIkB2eCh4yr8dwAjmTLwOsru7wWMbdzhiM0lcNqIAnrG1mueiQ9UtUm1KvkL/nvBh9/y2mIjPwedHCcFUmb3wFePqAccmMgKIgBXa7pWpC37UtkE22x/eMLo8xH7v3MTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249713; c=relaxed/simple;
	bh=YoNMpISKXmt8fTKusUL8AmCpLE3tN32d3A4ddgaQLNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FItkYKjLdv0mIOYkq7JvC3eipa+yiSFA2B4GsG2FU5Sdetb+D+ouDvDTQHr5tJ5zQeVHBgxtvqg4zyNtXnPErATJ0BYp/Ne5vS67cEgxTAO8uYX/jag58LFKBXkvKQLn0a9HaRGo8+Pagp5Xy4CM8lT8F77s6nLXIpG3HxieeqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+EOyBm6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+EOyBm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96D21F00A3D;
	Tue, 28 Jul 2026 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249712;
	bh=GE+MUFOetG2GmBJ+PZteKczxTDBKTMALP0IaoO5AskY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+EOyBm61T3Kfc1NI7tLEs6Mu3qNfGcTzb43spA54FNcN89qzKfLxmWXU76tONCNu
	 1725w3vfPkowEotZZzu64/M69dGDQeZCh0U94C2NE1OYkU5UBCCvdieduLXul8hxt4
	 HFXoKvqv3Bj/GRssILBYIu53yPK5VlhzNdkiXLeq6rloAMRNCp2ydy9HZ8shoTlzWQ
	 10n9q3NQX/8USDz/iEcazP2WJinqkr90COaKcwKQ/ZIkjH/WIoYj2zSW+lmBuClOnX
	 7SQpePWy2LgXyeikcYCZSppzuVWFAK+P/jDb+rTlPYSI1+rAz2Rr9nZEywlE11eUPU
	 +kqPHWO3+HCxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 04/11] clk: realtek: Introduce a common probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728142806.1954638-5-eleanor.lin@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:41:51 +0000
Message-Id: <20260728144151.B96D21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The clock registration loop does not check for ERR_PTR values in t=
he hw array, which will cause a kernel panic if a clock is intentionally om=
itted.
- [Medium] The clock provider is exposed to the system before the probe is =
fully complete, risking exposure of an orphaned clock on error paths.
--

--- Patch [4]: [PATCH v11 04/11] clk: realtek: Introduce a common probe() -=
--
commit 1821fe944a61d09ec77d386cf175a9aadc142c21
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Introduce a common probe()

Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
and add the clock provider. It also creates an auxiliary device for the
reset driver if the "#reset-cells" property is present.

> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/c=
lk-rtk-common.c
> new file mode 100644
> index 0000000000000..86adeedbdeada
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c

[ ... ]

> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_des=
c *desc)
> +{

[ ... ]

> +	for (i =3D 0; i < desc->clk_data->num; i++) {
> +		hw =3D desc->clk_data->hws[i];
> +		if (!hw)
> +			continue;
> +
> +		ret =3D devm_clk_hw_register(dev, hw);

[Severity: High]
Will this loop crash if the hw array contains ERR_PTR(-ENOENT)?

In clock drivers, the clk_hw_onecell_data::hws array often contains
ERR_PTR(-ENOENT) for clock indices that are intentionally omitted or
unsupported on specific SoC variants.

Since the check only looks for NULL, an ERR_PTR would bypass this check and
be passed to devm_clk_hw_register(). This typically causes a panic when
clk_hw_register() attempts to dereference the pointer.

Would it be better to check for IS_ERR_OR_NULL(hw) here?

> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);

[Severity: Medium]
Is there a risk of exposing an orphaned clock on the error path here?

The clock provider is registered via devm_of_clk_add_hw_provider() before
rtk_reset_controller_register() is called. If the reset controller
registration fails, the probe aborts and devres unregisters the clock
provider.

During the window between registration and cleanup, concurrent consumers
could look up and acquire the clocks, only for them to be unregistered
immediately. This leaves consumers with orphaned clocks that cannot
properly control the hardware.

Would it be safer to make the clock provider registration the very last step
of the probe function?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728142806.1954=
638-1-eleanor.lin@realtek.com?part=3D4
