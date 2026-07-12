Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D12E414
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783865920; cv=none; b=XPxmqFjvPCQZw5HOmKFWpdLzvXNI5Jsmi3iM+fWMESDQyX+HOceYjyPs7meu2qQodFNPa6HijTZ2MU7oVxkwLhZqTiO7X8gjmDSJiJEuzh26Bihau2Bb5r5Pz3frTiIrN5U5fkXBjNn1A5mdXl3OGd6WnC0/rMBznuin8alaSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783865920; c=relaxed/simple;
	bh=4FojxHMe+VTR1kjfu67UB94iNF+WXwtqZgnCgizrJLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qtgboZ9l5opN137wo7xRyAFbYLGVrhyXt8pLlusRVm7YJbVoLnOlYFYjwE5XlxkqqYsfsHene6G+T4IXwc9bvc08y7zMoe4ilFvf5wqn120erPgsesxen3AnnRQKoUsMb/HpZlCD8T/KWjE/7UdURO3xwzFulpEqMIkzwP3LnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2EyTsvb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2EyTsvb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518EA1F000E9;
	Sun, 12 Jul 2026 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783865918;
	bh=HgIUrzDTaE46GVoDIRyzn+SQ9Sf2xKMF3LTUmPd7nLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M2EyTsvblpLyd/W078jm7ZA8xCyajt/YBhvFUfWe3b7QN/R62PZp3gFW02MwBqdVT
	 iyNpGUZn2CMiLuFw6RqocCCfstvtjaJeOCelZugRQZFoBmN0eqHh+InmGsQJFkZvXc
	 6dh58YBA+JvdNItpLqBXNFJiUD0NwB06jhssT6JRAGpL+V9o0tRVR/am9wfjIwjSmP
	 meqaeO9pLmpM9QzRQPQe1sO/m7D9rUIHmbHy1vEPJWvg7Y4U0CFrYP/u3XWRLZhM+k
	 zxpsuBGSp23Q/MZYhDoa8KfEvkIph7x1zpK9ScVG4JM6f1w0X69JMEnkUoyXH38k8g
	 NY9DoQpMS3VFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: ti: var-som-am62: Add support for
 Variscite Symphony Board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <42decef4f84db8fc0474675a23e157b68b3b1a1b.1783864932.git.stefano.r@variscite.com>
References: <cover.1783864932.git.stefano.r@variscite.com>
 <42decef4f84db8fc0474675a23e157b68b3b1a1b.1783864932.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 14:18:37 +0000
Message-Id: <20260712141838.518EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Driver probe failure due to unsupported interrupt trigger type
- [Medium] Pinmux configuration error for RGMII2 transmit pins
--

--- Patch [3]: [PATCH v4 3/3] arm64: dts: ti: var-som-am62: Add support for=
 Variscite Symphony Board ---
commit eae5a6eae63323e628c7dec958171ae3d0b8c5fd
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-AM62 system on module.

Link: https://www.variscite.it/product/single-board-computers/symphony-boar=
d/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts b/arch/=
arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
> new file mode 100644
> index 0000000000000..24e67a131a7ec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts

[ ... ]

> +&main_i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c0>;
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	/* GPIO expander */
> +	pca9534: gpio@20 {
> +		compatible =3D "nxp,pca9534";
> +		reg =3D <0x20>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_pca9534>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-parent =3D <&main_gpio1>;
> +		interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>;

[Severity: High]
Will this interrupt trigger type cause the pca9534 probe to fail?

The parent interrupt controller main_gpio1 uses the gpio-davinci driver, wh=
ich
only supports edge triggers in its gpio_irq_type() callback. Requesting a
level-low trigger here will return -EINVAL during IRQ setup.

If the probe fails, could it also break the secondary Ethernet PHY
(cpsw3g_phy1) since it relies on this expander for its reset GPIO?

[ ... ]

> +	pinctrl_rgmii2: main-rgmii2-default-pins {
> +		bootph-all;
> +		pinctrl-single,pins =3D <
> +			AM62X_IOPAD(0x184, PIN_INPUT, 0) /* (AE23) RGMII2_RD0 */
> +			AM62X_IOPAD(0x188, PIN_INPUT, 0) /* (AB20) RGMII2_RD1 */
> +			AM62X_IOPAD(0x18c, PIN_INPUT, 0) /* (AC21) RGMII2_RD2 */
> +			AM62X_IOPAD(0x190, PIN_INPUT, 0) /* (AE22) RGMII2_RD3 */
> +			AM62X_IOPAD(0x180, PIN_INPUT, 0) /* (AD23) RGMII2_RXC */
> +			AM62X_IOPAD(0x17c, PIN_INPUT, 0) /* (AD22) RGMII2_RX_CTL */
> +			AM62X_IOPAD(0x16c, PIN_INPUT, 0) /* (Y18) RGMII2_TD0 */
> +			AM62X_IOPAD(0x170, PIN_INPUT, 0) /* (AA18) RGMII2_TD1 */
> +			AM62X_IOPAD(0x174, PIN_INPUT, 0) /* (AD21) RGMII2_TD2 */
> +			AM62X_IOPAD(0x178, PIN_INPUT, 0) /* (AC20) RGMII2_TD3 */
> +			AM62X_IOPAD(0x168, PIN_INPUT_PULLDOWN, 0) /* (AE21) RGMII2_TXC */
> +			AM62X_IOPAD(0x164, PIN_INPUT, 0) /* (AA19) RGMII2_TX_CTL */

[Severity: Medium]
Should the RGMII2 transmit pins (TD0-TD3, TXC, TX_CTL) be configured as
outputs rather than inputs?

Using PIN_INPUT_PULLDOWN on RGMII2_TXC enables an active pull-down resistor
on the 125MHz transmit clock. Does this force the MAC output driver to
constantly fight the pull-down and degrade the high-speed signal integrity?

> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783864932.gi=
t.stefano.r@variscite.com?part=3D3
