Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96EC3438AD
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779322111; cv=none; b=uf62RsQeCXi3ueXhPThbsGgbR5deafiiVNkVdh65OSZFWZrpd6DtUMi9DfWwWvU8i8EIQS974rYlE4S9huhTJ5bH2PvMtiNeWas1mI9Y5c6ekc++houdM8coF4rf8DuHBiMyuK9Utpw0OTAXGJMuvI6c151QJeBJ5lLE5i1QvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779322111; c=relaxed/simple;
	bh=fpvsrygDjVJKL5DyPbt5RnUyn33jGdEJNAOLAJHBrtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MSp6no8O8w7NV7CO2p8o1Rm7vGWxhW6avvHpNzUvHx2+xRE5zOsTsFtNVlc/OkgOOIjIA1tb3Ixufw/Qje1kBdeBZu+IuHFyuN55jNs2R/KMl+jTAz6yxswuf+0MtmVEVnAvS0Je5GwBi+9e5KO1wUZyvxhUM3P1CIQbrpVdj8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJAVO9dX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJAVO9dX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E79A1F000E9;
	Thu, 21 May 2026 00:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779322110;
	bh=WCsIHTXt624ehmKZUyhDPZralENlnvKQwaR9l6NIa+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kJAVO9dXEjrgGuReQpLhIfy2USjvi2ZXEWlxLVvt3woxEW4atnV2pAuGNXBmWCaA7
	 zBQ++NDT3tLveETli2rWZD/0L1ZDpRyZ8UGAQDa9fCAJYrA/1rUTx+D+VWFlXacCnk
	 KieFVu8WOeyl0Z7Ta2/nQ75ur9m7VvxDVY1VrPvRG4d8S9PHG9iwzwde11A/hDGIIt
	 BzL05qOJVZcX9X3Fnv0EbxWbPDFox8+qOmkrt2KDUquakUbbK9iciUpgMs+RbzJe6y
	 Mb+vh5JYbBdycp3FW28Ka3y8t/cHr+2PxhGvc5R4m9cqm9ovowPFWOdGQEe9TU4aUN
	 sVJBcCuU7oi4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: Add pwm support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520-04-k3-pwm-dts-v3-1-974add67c592@kernel.org>
References: <20260520-04-k3-pwm-dts-v3-1-974add67c592@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 00:08:28 +0000
Message-Id: <20260521000829.4E79A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The device tree specifies an APB bus clock for the PWM nodes, but =
the underlying driver does not request or enable it, leading to hardware ha=
ngs.
- [Low] The newly added PWM device tree nodes violate constraints defined i=
n the marvell,pxa-pwm.yaml schema.
- [Low] Pinctrl configuration nodes incorrectly reuse the `pwmX-0-pins` inn=
er node name across multiple variants.
--

commit 9f48985313ad2dac2581beaf7183fbb5846e3df3
Author: Yixun Lan <dlan@kernel.org>

riscv: dts: spacemit: k3: Add pwm support

Populate all pwm device tree nodes for SpacemiT K3 SoC, also documents
the pinctrl info which would easily help to enable them in future.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> index 23899d3f308a0..28cb0490de3b8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
[ ... ]
> +	/omit-if-no-ref/
> +	pwm0_1_cfg: pwm0-1-cfg {
> +		pwm0-0-pins {

[Severity: Low]
Is this inner node incorrectly named? It looks like a copy-paste error since
pwm0_1_cfg contains pwm0-0-pins instead of pwm0-1-pins. This pattern appears
in multiple variants throughout the file.

> +			pinmux =3D <K3_PADCONF(42, 6)>;	/* pwm0 */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <25>;
> +		};
> +	};
[ ... ]
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index e6faf8d8759e1..e331adbcb11a9 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
[ ... ]
> +		pwm0: pwm@d401a000 {
> +			compatible =3D "spacemit,k3-pwm", "marvell,pxa910-pwm";

[Severity: Low]
Does this node pass dt_binding_check validation?

Since this node falls back to marvell,pxa910-pwm, it is evaluated against
the marvell,pxa-pwm.yaml schema. The schema limits the clocks property to
a maximum of 1 item and does not define clock-names.

Furthermore, spacemit,k3-pwm appears to be missing from the schema's
conditional block for #pwm-cells: const: 3, which will cause validation to
fall back to expecting 1 cell.

> +			reg =3D <0x0 0xd401a000 0x0 0x10>;
> +			clocks =3D <&syscon_apbc CLK_APBC_PWM0>,
> +				 <&syscon_apbc CLK_APBC_PWM0_BUS>;
> +			clock-names =3D "func", "bus";

[Severity: High]
Could accessing this device cause a synchronous external abort?

The node defines both a functional and a bus clock, but the pwm-pxa.c driver
uses devm_clk_get(dev, NULL), which only fetches the first clock in the lis=
t.

If the APB bus clock is not enabled, attempting to access memory-mapped
registers typically causes a bus hang and kernel panic on RISC-V systems.
Does the driver need updating to handle the bus clock, or is it enabled
elsewhere?

> +			resets =3D <&syscon_apbc RESET_APBC_PWM0>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-04-k3-pwm-=
dts-v3-1-974add67c592@kernel.org?part=3D1
