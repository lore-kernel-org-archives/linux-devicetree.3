Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807014322E8
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862490; cv=none; b=VKP9xnpp4dTpV0qoEj70WYVote73hAdaNdCkBEF6Rn4did/NJUTM3ZPASZfjgrlbWnThNT87cE13cm5C3Vy2C409yLizN23v6003/GPL3+yTkmxHcW3bMZERStKiw91tGJBPLZD9J9ZCIDPd8VOUPNI2OWQydJIurgieoRAhN9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862490; c=relaxed/simple;
	bh=aI7jO9InTri3Lt2PDp8tHJLVvQYgJK9P88qNQyCpySE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BbNvQUlff3BZ8qaNkaAgTbQOabjrKv9WSldS/qzWqSWJCRCAmqvyHWO3FCGOoZUYSBPbZ9LKSqvypjgrohC6E+JCeMG1CG+4DSPlJOrnFMAZc5q3n5kWLa8wLhhL7lSivlK22aFFJf6fpf1Cpum53YnId14YFaSEE7V3Op5WXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwwJAcqq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwwJAcqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7039A1F000E9;
	Tue,  4 Aug 2026 16:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785862478;
	bh=rkzh+h2gaE5tBMWjZ45uKXxmaUZPDiIyXekQAB9Y4JE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RwwJAcqqGJz0hY3hUjb2v9Lit7dyYZERrSzpoNlvNmDy82IbFxS1RTlhhsqxotNBj
	 NnEZHZMmynlf/1rbGf0j8IDC3gWhOtYtUavbUTolcEDPobaL2OUozmnzkmN88ub4xk
	 aIrhTxc0gRPH93V2HlBltmoNkOSN7o/zXc3KDrOgw0PanPcc2ejLEE25ejkccLQs5n
	 1X7gMiakGOlpJUQJlzLqW3U73u7g+ksBtZObwsbX7uK3LkPpSA/gOJGxt225KgPMiu
	 rBXDzGuUPSGN94osHXfXplDfS2ZeeVR1PYf2Utm980QmhyBDq8bnI3QinzL1pOcutV
	 qaVHqMX3ouqUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 04/11] clk: realtek: Introduce common probe() and
 remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804163807.1285869-5-eleanor.lin@realtek.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:54:38 +0000
Message-Id: <20260804165438.7039A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition in rtk_clk_remove() leading to NULL pointer derefer=
ence
--

--- Patch [4]: [PATCH v12 04/11] clk: realtek: Introduce common probe() and=
 remove() ---
commit 3b0d9bad8da74951cdbfe60e9a47d2e11203aeb5
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Introduce common probe() and remove()

This patch introduces common probe and remove routines for Realtek clock
drivers. It handles setting up shared regmaps, registering clock hardware,
and conditionally creating an auxiliary device for reset controllers.

> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/c=
lk-rtk-common.c
> new file mode 100644
> index 0000000000000..e8422ecbad797
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
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
[ ... ]
> +void rtk_clk_remove(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc =3D platform_get_drvdata(pdev);
> +
> +	if (!desc)
> +		return;
> +
> +	for (int i =3D 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap =3D NULL;

[Severity: High]
Because rtk_clk_probe() registers the clocks using devm_clk_hw_register(),
the devres framework will unregister the clocks after rtk_clk_remove()
completes.

By clearing the regmap pointers to NULL here, does this create a window whe=
re
the clocks are still registered in the clock framework but their underlying
regmap pointers are missing?

If clock operations are invoked concurrently during driver unbind, such as
from reading clk_summary in debugfs, could the clock callbacks dereference
this NULL regmap and cause a crash?

> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_remove, "CLK_REALTEK");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804163807.1285=
869-1-eleanor.lin@realtek.com?part=3D4
