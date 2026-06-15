Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4D3914F0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525693; cv=none; b=nmiJvz+iq4rXeY/fPii2rGSXjZhbeI9DK+T0vPFBxVVayQDjZSdlaga/rjr7j+8qgmCmlz3iPrtrp2+Dd4cT8tnhNMULaoJVfXr2j+3QylWO3dSstQ/x0lv+Vm7UW/OJO4viCJ7A/THFvx6RV2nVqigjN41VQxJSgPVmG3k2on8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525693; c=relaxed/simple;
	bh=FdLuSSHZkVWcZjabLtDOD/nDtljDgpaZ26CfHTFgG7s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RN+5LSHpvsry5Dp19MH3OXFsn6M1fksZoW6OLMO7sNT3rR36XCPiyfZ7dqGY0nT/rpe6ryWCaH1d0eIQYw3Hr0dprIPimSJwG3oFgG2EGFWbrk20Mxa5e6qmP+BaRMSrykELVAW8nbqzTiAsZgh7y5jl0Cx1Yz469ovd1hfCmD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCzNE1j+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCzNE1j+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41BF1F000E9;
	Mon, 15 Jun 2026 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781525692;
	bh=uc+DsrAyS8DeARVhBUxBve2rQ30R+zAM1yEBT5wLam0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cCzNE1j+lCqv0QyQnv17cmZuYhxmts4J1JW6A6JUzgRfOIz1oJd9ww/FJ8IoGOTNp
	 3SAcuVQG4/t9iMWTp8c6d81ztI4Cq5/eXebv0dbrNEsBbPXVPw00P2rUh+NDj+2E11
	 Ph/0pLysTrldH5fBtW0rCrLafJcDgRFDaU4mRitRksx/Iyn2euYS0hATMtp0vCs4yO
	 NquQwD3jb7gA977d9ZM1Zx2tyA/ddLe7MjEPLbNSMwglkm7ETSAGeexQ4326NmcrUi
	 4D80k/epT5XTiNa/QeE/t+hBUMZqYID+rabmCGxqKyci+VDLfwizEN05bhWZZfYker
	 wExozssaAYcnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S
 board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Milas" <josh.milas@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615120324.1527881-4-josh.milas@gmail.com>
References: <20260615120324.1527881-4-josh.milas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 12:14:51 +0000
Message-Id: <20260615121451.D41BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Contradictory eMMC voltage configuration artificially restricts =
eMMC speed capabilities
--

commit 9d652e59c7623b46a5dd7a0a5954061467e5aea7
Author: Joshua Milas <josh.milas@gmail.com>

riscv64: dts: sophgo: add initial Milk-V Duo S board support

This adds initial riscv support for the Milk-V Duo S board
making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/ris=
cv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 0000000000000..f56bfddeacc40
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

[ ... ]

> +&pinctrl {
> +	emmc_cfg: emmc-cfg {
> +		emmc-rstn-pins {
> +			pinmux =3D <PINMUX(PIN_EMMC_RSTN, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp =3D <10800>;
> +			power-source =3D <1800>;
> +		};

[ ... ]

> +&emmc {
> +	bus-width =3D <4>;
> +	no-1-8-v;

[Severity: Medium]
Is this contradictory eMMC voltage configuration intentional?

The pinctrl node emmc_cfg explicitly configures the eMMC pins to
operate at 1.8V (power-source =3D <1800>), but the &emmc node here
specifies the no-1-8-v property.

Since the hardware pads are physically configured for 1.8V, the interface
actually does support 1.8V signaling. Specifying no-1-8-v here artificially
restricts the eMMC to legacy, slower modes instead of negotiating
faster modes like HS200.

> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	pinctrl-0 =3D <&emmc_cfg>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615120324.1527=
881-1-josh.milas@gmail.com?part=3D3
