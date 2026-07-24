Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B4444161A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904338; cv=none; b=MuzufK/BQxboRwMwUh+gVAQqxLHJSnH6qendatqXp9yCxgTEXXP5XZQbHdy4yl3pkNoRWWVT9gSp9Yi9I5wM6B+RMNblq2sgfdVcQivsIAqd4zlpdUYaEqA4qD3dzRtmbU8S+8I2Z+vnaau5aknX6c6pyY7UfJesY1VbIO1FLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904338; c=relaxed/simple;
	bh=CNyx/7RgrJjnS1HPPGOlJq0dTESHHuG7+TRh6XnsYjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o+d8FYklJiQjUCynKdF2B/Q4WUA9HcfHhJGszSImmEhlo29IL1ecJz/CEMGS7uB0glzth+iZOYW2/0QGUEJFP/OA3TLbyg0tclvY9NVL2vGAqonXmdPdUo8G5ZPWa3JBEZJ9h5wG7vLqwzfP6NuncJM8vPGMdWs0TYKYf5o2ZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUhBVkqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUhBVkqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB851F00A3A;
	Fri, 24 Jul 2026 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784904329;
	bh=Jw3YyIacRf5CLOlMf5C4TuxDeXjwRxzMY11UdFw3BfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BUhBVkqyGEEL8Vgs7VFFWmZsrmSXzZHLX/gnHVxZSkv/iweO9arwjNBR8f7HkbNSk
	 107ISc1IKcGWR4HVYiUH0ITW8yPr9OJ4/fUKAMHNcQaDO8NiGJqfru2VqQynt16EPT
	 H5kuDgyPHF6p3g4iGGVUhBFNOo5BFWdpcjA+JsXiAA3/2EqWhFPnpOc15qReDsP5xF
	 Vh8h0cRtOJFVihaO98iUa5s2g/bba97jzRWmN2KXNDJkMMIbe0wxyvF8HbmKTWKEje
	 hbUDSHd0dd2L603GMKxaiZfzK1DgqTCc56zM2biGneJxu5OudYeCHG6CkFslq6tfbz
	 cGZcC9ie/09Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS
 LPI TLMM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724141708.2212057-6-prasad.kumpatla@oss.qualcomm.com>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <20260724141708.2212057-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 14:45:28 +0000
Message-Id: <20260724144528.9EB851F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature mutex destruction in the driver removal path creates a p=
otential use-after-destroy race condition.
--

--- Patch [5]: [PATCH v6 5/5] pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS=
 LPI TLMM ---
commit c233c0ac41f2bc46bdca1d1c9ea5842fe1fcc867
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

pinctrl: qcom: hawi-lpass-lpi: add Hawi LPASS LPI TLMM

This commit adds the pin controller driver for the Low Power Audio
SubSystem (LPASS) Low Power Island (LPI) of the Qualcomm Hawi SoC.
The controller supports 23 GPIOs and utilizes the LPI_PINGROUP6 macro
for certain pins due to a test_bus entry.

> diff --git a/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c b/drivers/pinc=
trl/qcom/pinctrl-hawi-lpass-lpi.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c
[ ... ]
> +static struct platform_driver lpi_pinctrl_driver =3D {
> +	.driver =3D {
> +		.name =3D "qcom-hawi-lpass-lpi-pinctrl",
> +		.of_match_table =3D lpi_pinctrl_of_match,
> +		.pm =3D pm_ptr(&lpi_pinctrl_pm_ops),
> +	},
> +	.probe =3D lpi_pinctrl_probe,
> +	.remove =3D lpi_pinctrl_remove,

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition in t=
he
shared removal path being used here.

Can this lead to a use-after-destroy race condition when the device is
unbound?

Looking at the shared lpi_pinctrl_remove() in pinctrl-lpass-lpi.c:

void lpi_pinctrl_remove(struct platform_device *pdev)
{
	struct lpi_pinctrl *pctrl =3D platform_get_drvdata(pdev);
	int i;

	mutex_destroy(&pctrl->lock);
	...

Since devres is used to manage the GPIO chip and pinctrl interfaces=20
(devm_gpiochip_add_data and devm_pinctrl_register), these interfaces remain
active until the devres release phase, which occurs after lpi_pinctrl_remov=
e()
returns.=20

If a concurrent request (such as a userspace process accessing the exported
GPIO via sysfs while unbinding) attempts to operate on the GPIOs, won't it
try to lock this destroyed mutex before the devres cleanup has unregistered
the interfaces?

> +};
> +
> +module_platform_driver(lpi_pinctrl_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724141708.2212=
057-1-prasad.kumpatla@oss.qualcomm.com?part=3D5
