Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A8D41A56D
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142899; cv=none; b=RUWacp3zl8xHJt5imsCoEjYYZKQnAlLhdt8VnGSt8cq6hRalvNMhKfopQwl+gs2mIAshmxJPeWZND7delNmLh4g5SNE2R9+ip2aRSQ33JR7vGuNCTAD+v5mhieUDf5HoZEvoOFdzSjnSY/MlkSZZzPEWDShSdHfA5tzcmNaROsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142899; c=relaxed/simple;
	bh=oyszTGkmqP0pSnxSF+Y70XsfZRG3OfqC2UZlMd0PPdg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rtw7spCn96De2nqsdu10cVLvEFfK/v4G2wUue6wz9Jh9o5R087BgI2kGyzWdNOIgyXvK0cNO3dfnD0BigCnWv7ArGVJcWtWIvEj0PewIu7QWiByJ/Lt90a1VSqx6syRmMidOxykCQZLDGwxRZXfV23RPkSQ28NFpOp5bXueTwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cT/ZWzWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cT/ZWzWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4821F00A3F;
	Wed, 15 Jul 2026 19:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142892;
	bh=amNxNsxiYD+UwtXtFy7mITJnpHsCeZnOsPz7hH07J1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cT/ZWzWZll5TSuMVtPS0/WWMwmU6AZeAWjX8sYp3qGg1by485NnMCYPhhT9yHO44N
	 9sJbfXWiRBvGWw1ZsP2vKmj1wKsa9Sxuo2NgHsxzYnQA22tF0KXVLXJ3n1I5UJCub7
	 z9GU7UzdqiURi3/Wla6R/uJqz/gnoXviib1qMh2fL3rKOtC3FXv1z4uSggVO9ydzXO
	 M/F8JHD8Lo/+PYwBucuqlVhdRsWzw+udWg8msgNL0EbHq8GJoaSY3f4jhrEECf/fh9
	 mEfg2f1htC/7c/PZ3Cngmw3s3Y/CqKFjQgf9beaEZMY03n0QHp41evXKJwqJQBDyFV
	 bbKay+RVlGQwA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 05/10] arm64: dts: rockchip: rk3568: add XPCS and
 fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org
In-Reply-To: <20260714191341.690906-6-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:14:51 +0000
Message-Id: <20260715191452.4A4821F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Devicetree anti-pattern: dummy fixed-clock nodes used for internal =
SoC clocks and left unassigned.
- [Low] State mismatch: fixed-clock nodes are enabled by default despite co=
mmit message claims.
--

--- Patch [5]: [RFC PATCH 05/10] arm64: dts: rockchip: rk3568: add XPCS and=
 fixed-clock nodes ---
commit b47e1fcebd43374d6431fc20ffa64a0397513d68
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports. Add the XPCS device node and
its pcs-mii sub-nodes to the SoC device tree.

> Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
> providing the 125 MHz reference clock for the GMACs when operating
> with XPCS.  These clocks are used as the assigned-clock-parents
> for the respective GMAC nodes.

[Severity: Low]
The commit message states these clocks are used as assigned-clock-parents
for the respective GMAC nodes, but the patch doesn't appear to add the
assigned-clock-parents properties to the gmac0 or gmac1 nodes. Are these
assignments missing?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..989e164c0eb39 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi

[ ... ]

> +	xpcs_gmac0_clk: xpcs-gmac0-clock {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

[Severity: Low]
Should this internal SoC clock be modeled as a clock provider from the
generating XPCS IP node using #clock-cells, rather than using a dummy
fixed-clock?

Additionally, the commit message states "All nodes are left disabled by
default", but this node is missing the status =3D "disabled" property. Will
this leave the clock unconditionally enabled?

> +
> +	xpcs_gmac1_clk: xpcs-gmac1-clock {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac1_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

[Severity: Low]
Similarly, does this node also need a status =3D "disabled" property to ali=
gn
with the behavior described in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714191341.6909=
06-1-coiaprant@gmail.com?part=3D5
