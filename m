Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C51912F585
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067624; cv=none; b=il6gAMCXd0MK8yTEV8Gd6jgl6iqGcE63hGBCFrud9XMyft2lBTCW1aeP2vYpDgKdBUVJkGL/RLVjh9IIDIDlPO6dW+9MSH+d/dpzd6sYGTFc7SjgrQmEtAwQErbBhmVCOcCW1nbD0ctEqo4c34GJ9n0IdRZlgjMC11cuoCzSXGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067624; c=relaxed/simple;
	bh=54rhqPwSfCX1lhphPNyU1BJJOGlxR+YN3BqlLxoSgnQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WOunhI1q33irsuASQp/2iMbVgoqK6gGosLWRjoSDiiq02DnGj30XNmD5SP8QHNZMbYFsyGsiFm1p2tDxWjwoNLtN9vvz0G8iI11Jjx/N3869Wny+0zLFpP7BDklOSn+fTriL001LI8WWhYnLNhGETHb96Xvoj7yQVBlqdAg3aTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2+RcjW6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2+RcjW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13DA1F00893;
	Fri, 29 May 2026 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780067623;
	bh=8kfEqScAplCk6ub4bmSQiLCAy4ZZ21YWmsaJSbrbIRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B2+RcjW6HZWh9c35XgZLvqdQXEm7VIOkf/VcSLw0z4EHJnZBDUEn9RaJ4Lx+SyvxC
	 bzUay1Q22MXFzcX0pPYhoBuvNSI+eog20/z4Zwxnw9Ynk18rmrRQtkV/hpTR9mW9E8
	 DjkuOt4TpNTlIJE7AmNksTSLxw+wiyGQwTaVnlJQrzvwAGTS+OVWmWtGJQJnRq3Ft4
	 2wBtAWFEhq+Oh7EOPfQkdZeHWBfXv+RNihWAA8UpMENL3kZ5EKkASdZ4Rc2Uoa5pB7
	 qx0z4VUpFHtOOs9W7yNjAJ+tckS57EDAK/uYF021uhdtQwT7wqZZi1gXKqGDcXRdyg
	 aWRoAzb+0SUiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: meson-axg-s400: Enable
 pcie_phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529140605.1070764-4-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 15:13:42 +0000
Message-Id: <20260529151342.E13DA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit enables `&pcie_phy` to support PCIe on the `meson-axg-s=
400` board, but fails to enable its required analog PHY dependency `&mipi_p=
cie_analog_dphy`, leaving PCIe completely non-functional.
--

commit 655f261362c29dc56c1723f3469b32281d8fffb8
Author: Jun Yan <jerrysteve1101@gmail.com>

arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

This commit enables pcie_phy on the meson-axg-s400 board to support PCIe
functionality, as it is now disabled by default in the meson-axg dtsi.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/=
boot/dts/amlogic/meson-axg-s400.dts
> index 285c6ac1dd613..7ba249cc3d569 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -448,6 +448,10 @@ &pcieB {
>  	status =3D "okay";
>  };
> =20
> +&pcie_phy {
> +	status =3D "okay";
> +};

[Severity: High]
Does this node also need to enable the mipi_pcie_analog_dphy dependency?

In meson-axg.dtsi, the pcie_phy node depends on mipi_pcie_analog_dphy via
the property phys =3D <&mipi_pcie_analog_dphy>. Because the analog PHY is
disabled by default, the core driver model does not instantiate its platform
device and no PHY provider is registered.

This causes devm_phy_get(dev, "analog") to return -EPROBE_DEFER during
the probe of pcie_phy, which in turn causes the PCIe controllers (pcieA
and pcieB) to infinitely defer probing as well.

> +
>  &pwm_ab {
>  	status =3D "okay";
>  	pinctrl-0 =3D <&pwm_a_x20_pins>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529140605.1070=
764-1-jerrysteve1101@gmail.com?part=3D3
