Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3666329C6D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014067; cv=none; b=aCbja4BhDrpUEA4sY/9oR0Zj5KXSsz5sRGiIzlQ9SPA53l91ZLtDF4USfbIxW5ZnqAgpa0VswMOV/FLfm0Dv7XQxCxhfu+iqNMa+FkDXaOGCMq/PzRk74BfKoV9W5M2kSucdNmp0+w6MV515erjuWCOamSABL7YSK2DA6M5zkzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014067; c=relaxed/simple;
	bh=ycInwp3Hsctj9C5FERhkcn9lHvC7P6rQl5MVzw91G40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S1tU5iFyDlCjQcV+HEOIpF0koUmIfig6cmVfIQF5XMb2IsOsDePSThplHDvTwUVNnvtcnp9D96sijn4+kLS8JGe3zuf5gplixX61tDlBKKp02Wwn5hQfTlR9AeUT/Dg//cv144zvvyrbs1Ib4OBWWZVeI24OCOlobWOV3d6uzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8fQ0kqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8fQ0kqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504CF1F00893;
	Tue,  9 Jun 2026 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781014065;
	bh=vlH35PFjxLBJeWPBjR12PJRHmva81ukBIZIH7OqtSkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B8fQ0kqEu7GDVFFzxxMUYB/HWMfgKU1JnjpD1iiewlSQKwTtwgfyuH5c3TAzv1Q1Q
	 pETsk8/tS0m7n0elWaDdM3gZDLUUTfNXxUuu25CNONEmRp54pt5n8VYIPiWesMxXzA
	 PhyEqzCqcvVW8X0AslzoijUtsnQI14ZwIQgEyJP/2EEjmXuQ1ubJTq5/K3LUsoMRs2
	 hy+T+KHu+GHe0AhfKZfcIQgaCRDS+qzreP9zoaYG+0ydnrBHi5IuVrWEz43zGEjfCk
	 0VAdIH1YcY3TM8wLFQ4aCz/WylResvAMtHlozdUW228ZBEH4ixa2xUeNs9zi56k/2T
	 sytqnbeMSwsXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609125353.401124-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:07:44 +0000
Message-Id: <20260609140745.504CF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing mandatory 'resets' property in vspd node causes driver pro=
be failure.
- [Low] Undeclared macro R9A09G087_LCDC_CLKD breaks DTB compilation.
- [Low] Undocumented compatible strings and missing required properties cau=
se strict DT schema validation failures.
--

commit 0838fa73798a48fc749c7ebe19ded83603bdc112
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
   =20
Add VSPD and FCPVD nodes to RZ/N2H SoC DTSI.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g087.dtsi
> index f697e9698ed39..cb2eabe3242e0 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi

[ ... ]

> @@ -1271,6 +1271,28 @@ sdhi1_vqmmc: vqmmc-regulator {
>  				status =3D "disabled";
>  			};
>  		};
> +
> +		fcpvd: fcp@920d0000 {
> +			compatible =3D "renesas,r9a09g087-fcpvd", "renesas,fcpv";

[Severity: Low]
Are the compatible strings "renesas,r9a09g087-fcpvd" and
"renesas,r9a09g087-vsp2" documented in the dt-binding schemas?=20

It seems they might be missing from renesas,fcp.yaml and renesas,vsp1.yaml.
For fcpvd, this causes validation to fall through to a generic schema that
strictly enforces maxItems: 1 for the clocks property, which fails against
the 3 clocks specified here.

> +			reg =3D <0 0x920d0000 0 0x10000>;
> +			clocks =3D <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,
> +				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;

[Severity: Low]
Where is R9A09G087_LCDC_CLKD defined?

This macro appears to be undeclared in the dt-bindings header or anywhere
else in the patch series, which will result in a syntax error when compiling
the device tree.

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;
> +		};
> +
> +		vspd: vsp@920e0000 {
> +			compatible =3D "renesas,r9a09g087-vsp2", "renesas,r9a07g044-vsp2";
> +			reg =3D <0 0x920e0000 0 0x8000>;

[Severity: High]
Does the vspd node need a "resets" property to probe successfully?

Looking at vsp1_probe() in drivers/media/platform/renesas/vsp1/vsp1_drv.c,
it unconditionally requires a reset control:

	vsp1->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
	if (IS_ERR(vsp1->rstc))
		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),

Without the resets property, this call will return -ENOENT and cause the pr=
obe
sequence to abort. Additionally, missing the resets property will cause
dtbs_check validation failures.

> +			interrupts =3D <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
> +				 <&cpg CPG_MOD 1204>,
> +				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;

[Severity: Low]
Does this also need the missing R9A09G087_LCDC_CLKD macro definition, simil=
ar
to the fcpvd node above?

> +			clock-names =3D "aclk", "pclk", "vclk";
> +			power-domains =3D <&cpg>;
> +			renesas,fcp =3D <&fcpvd>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609125353.4011=
24-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D3
