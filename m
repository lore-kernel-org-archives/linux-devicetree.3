Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B14E1414
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010225; cv=none; b=qkpGhS95QDMj1o0RXtXisR7v1cegDP/Yyj1Q3iq5qyv15xw1b0e+4stCsz+XQtLuDuC5Ezp0eb9r5JtL7HvdgH9rvM8eXuyO7Om+eoEulUDGmNxlEVt7xAmftGYxxB00ilL5z3VMCg5IYyJBUZI+PrrBHfBpn3hS8dyZKRwqYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010225; c=relaxed/simple;
	bh=3YECXSmg3bFLSn3b4+lLT1Mxr6zvrBjvQ9VdEBc3Pjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NYKeWue/xv5Tp0eIgCe+ZfN22lsl3m0/4fdxQ4CqHPkz408Zu3TV7mf9g/jjq0e7O/XOzdnoCuNyiR6/fQPp+o0qTDDggc/K8RVVLuNVyOikvuC2ZIDivrBHLooPeiQuTm61/HAuFASKVLYU8S0sSvAyjfS9ue3wi7Sfp3vKBec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7q9xGCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7q9xGCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA421F000FF;
	Mon, 21 Sep 2026 17:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790010223;
	bh=3kKiJbmcpsyF6vA2mgmt4fU0xXz8ivEfRtUBBXtPNDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T7q9xGCee25mWv8BceNIwlJyIS22LTd5h14nID8GC9PuD8JNiCBCaRETJB165dMEQ
	 ILC2b28nNR9WCBD5spfdapdzBshdQjMhOpaFUOHdA540YdE/ZinzrRER6TcCyMJA7A
	 /ud+oPN8PJS3B3YHdpvE0Er6BOez5+g+ZbGsNeHvJ4Uk9IxuOIIAJLo8wx/N+GYC8x
	 ktrnGW3H4LUdfPQxVzdCzb22859jI/YGPhpCOB5PNHRIfMgpQgnCqaKl9aqFxlJPEL
	 VroGAbehOFYGNsthRbyy9LYrEefDQ9W/T6Nrb0UD57KWxhayKSjTlXf/AAMWEZw28/
	 +Z6kZP3sRvp3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 05/11] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: wsa+renesas@sang-engineering.com, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260920170116.3624104-6-coiaprant@gmail.com>
References: <20260920170116.3624104-1-coiaprant@gmail.com>
 <20260920170116.3624104-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 17:03:42 +0000
Message-Id: <20260921170343.4CA421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] DT style violation: non-reg nodes placed out of order
--

commit 1674fcfaeba70039871d92af0a02901f9d009886
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the Synopsys DesignWare XPCS and two fixed-clock nodes for
GMAC reference clocks to the RK3568 device tree. It places the nodes and ad=
ds
necessary properties for board-level configuration.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..227d03e336043 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
[ ... ]
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
>  		status =3D "disabled";
>  	};
> =20
> +	xpcs: ethernet-pcs@fda00000 {
[ ... ]
> +		xpcs_mii3: ethernet-pcs-mii@3 {
> +			reg =3D <3>;
> +			status =3D "disabled";
> +		};
> +	};
> +
> +	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac1_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

[Severity: Low]
According to standard Device Tree coding style guidelines
(Documentation/devicetree/bindings/dts-coding-style.rst), should nodes
without a 'reg' property be placed at the top of the file (or the top of
the root node) and sorted alphabetically, before any nodes with a 'reg'
property?

These clock-xpcs-gmac0 and clock-xpcs-gmac1 nodes in
arch/arm64/boot/dts/rockchip/rk3568.dtsi lack a 'reg' property but are
placed directly after ethernet-pcs@fda00000 and before syscon@fdc70000.

Could these be moved to the top of the root node alongside other non-reg
nodes like opp-table?

> +
>  	pipe_phy_grf0: syscon@fdc70000 {
>  		compatible =3D "rockchip,rk3568-pipe-phy-grf", "syscon";
>  		reg =3D <0x0 0xfdc70000 0x0 0x1000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920170116.3624=
104-1-coiaprant@gmail.com?part=3D5
