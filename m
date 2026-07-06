Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF70397B15
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326222; cv=none; b=Nm68Hby6IJx+al18Ec5/vbwg0Hz2NXX8nyxOiAPLljfYnhWbCS2AyvT8mELtj0u4YJyp08X1gatbY2CgLHcjDdhAMPuOtIUTg5pCiFNwM0y4DuY61K/AvmL7KQBXNW330dfmtRXe2cljt/0wgNfp7qsNtuQrkWTQ0fc39LyZzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326222; c=relaxed/simple;
	bh=aLRbGLcgt67L0CDYqnkih3RXxFWhp37dSTQfKT88sQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f/1TG9rqjoDGRKcrs0qHQzKwjfG4m32YwvGLiUo7sFgYF559BzWwidT2wa7dzSp5S9xecSSA+nKGEXUttKoLC4sl1cKBgPHB49ghbWswsLGBh8bOilBAmXIfrQhEIEl9VH7JzZ4LrV1dN9FIMljviC6gwhr2mnuls64dlDA6Dhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI3RJE1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI3RJE1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4351F000E9;
	Mon,  6 Jul 2026 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783326215;
	bh=PRx24CXn/f9P1lyD8pdLj94DsvEIZsUykREthp7GDNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BI3RJE1t+7JSsx+w/1XD81DAsQA1WtiuUJOAchJeTIS1LFn0jj0la9+k+ucCcSWCP
	 VtHPsJj1df60+5MLjyKxbjPoF7HdW36kdjOrFPjinQRVXY6fcDwFyKKZ1ZhDsccVOr
	 EgGtLPMnX4M8/heLnE/lo/mca8xtgoEqBlu7dy1JUa6frjyoEVWJsFqjBwdKWew0Iw
	 dVeo/KfksA7tDYzMJJBNJBqM8hn338EFX0ovlINgcw6TBI71RurIxcKaQZ00OEtxcf
	 9z0LhSozZE9542EMW2wyfAycMqUfjh0dH50ErODBosRIcC5HTt4Zd9QxbwSd41MM0y
	 izGdcxItc/vIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] riscv: dts: eswin: add hsp bus node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706081055.1126275-6-pinkesh.vaghela@einfochips.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-6-pinkesh.vaghela@einfochips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 08:23:34 +0000
Message-Id: <20260706082335.4C4351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `hsp_sp_csr` syscon node lacks a `clocks` property, causing un=
clocked MMIO accesses that can crash the system.
- [Low] Non-generic node name for syscon device.
--

commit 2f5171ba39f634bc5960f8f8754a5b822bc8c76b
Author: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

riscv: dts: eswin: add hsp bus node

Add an HSP bus node to manage the HSP CFG clock used by HSP
peripherals. This clock is required for accessing both the HSP CSR
registers and the register spaces of HSP peripheral devices.

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
[ ... ]
> @@ -252,6 +252,19 @@ plic: interrupt-controller@c000000 {
>  			#interrupt-cells =3D <1>;
>  		};
> =20
> +		hsp: bus@50400000 {
> +			compatible =3D "simple-pm-bus";
> +			ranges =3D <0x0 0x50400000 0x0 0x50400000 0x0 0xa0000>;
> +			clocks =3D <&clk EIC7700_CLK_GATE_HSP_CFG_CLK>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +
> +			hsp_sp_csr: hsp-sp-top-csr@50440000 {

[Severity: Low]
Does this node name violate standard Device Tree naming conventions?

According to the Devicetree Specification, node names should be generic and
reflect the function of the device rather than its precise programming mode=
l.

Should this be named syscon@50440000 instead of hsp-sp-top-csr@50440000?

> +				compatible =3D "eswin,eic7700-syscfg", "syscon";
> +				reg =3D <0x0 0x50440000 0x0 0x2000>;
> +			};

[Severity: High]
Will accessing this syscon node cause a synchronous external abort?

Since this syscon node is placed under a simple-pm-bus, and syscon nodes
do not bind to standard platform drivers, no pm_runtime_get_sync() is ever
called on behalf of the syscon.=20

This means the parent bus remains runtime-suspended, leaving the
EIC7700_CLK_GATE_HSP_CFG_CLK clock disabled.

The syscon regmap implementation can manage its own clock explicitly during
IO accesses via regmap_mmio_attach_clk(), but it requires the clocks proper=
ty
to be present in the syscon node itself.

Because this is missing the clocks property, neither the bus nor the regmap
will enable the clock prior to the MMIO access, which could crash the system
if accessed via debugfs or a consumer driver.

Should the clocks property be added directly to this node as well?

> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706081055.1126=
275-1-pinkesh.vaghela@einfochips.com?part=3D5
