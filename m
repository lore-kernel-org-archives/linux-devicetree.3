Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F130D41C
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 04:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152090; cv=none; b=AAmLXFIJ7UVIt0AmNXEjX7x04dyPbIgg6v7fyX5dcZyWgy7gdrrGcJQxPp96wExJCe1jEDn7G3cZGMGPycytWxF3fLyqiBXMJ7hpgqG+UvcEjDfgKcwtuRQyuZFGMP7bjgCh2wzUxZZeg70HjE3iS0Gr5iAQjJBcltWO0MvW1vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152090; c=relaxed/simple;
	bh=QAqsWSV9P/9rrfVpojJht/GpqZibOf5WtRmFmpTH4qI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VFoZ9IfEFHxWoJ70vLiu6y6XmMhIVPVBAAGRNh9l6hGAg3+CH7/7YfF96bDxqmAEcQbzOd7WD2Z7PisNIHauh4DUi9gAOxytq6zpEJm/yqHvBh5yr9bUceOEO0FpEIwJjyaENMCJKIjno9j7OOQlRefG/HGD9QfNNZNNspy/S8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhM78y7T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhM78y7T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B591F000E9;
	Mon, 31 Aug 2026 04:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788152088;
	bh=opDZ6Igg+8M5E40SvZyzxQJSUUxWeO75CWX+5Ldb0EA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mhM78y7Tig6T/G4Q4uHv8F00bDIExix43TUIbQ+WiucVbhMpxG/OisxTHpNzOnuvv
	 XSxciargLReO/stAW9lcWsnbDtl6OjGKNM1lH1748RPkzh9Fct1Dnf2qOCMRFOhdQG
	 yatSDVkvtK4EkcSOEPeS7KI75G5+o6ur/6+NNwuYPKz+dUmQkHmJI9TnjOPrcCPR4v
	 vMbdnADrv5tilIyIwJP8dXy59So3dwmLnRGR5GMLihbN8dPhzpu/SjKhjWUjsAg0KH
	 IcCFj06OHU5lqxFYGy5RmguYvtpLnLdQjN8KF4L61pQGBOP/wMJ4f9n8cnxJkmzZH9
	 c6LSquDPcnCtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831044540.3304350-2-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
 <20260831044540.3304350-2-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 04:54:47 +0000
Message-Id: <20260831045448.58B591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Removing 'phys' and 'phy-names' from the base k3.dtsi breaks DT sch=
ema validation (dtbs_check) for disabled nodes and improperly delegates fix=
ed SoC routing to board files.
--

commit e9dc7ad92d5f4a805cf362fdd51c6ae160da1934
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: k3: move USB3 phy to board level

This commit moves the USB3 phy definitions from the SoC dtsi to the board
level dts files for the SpacemiT K3 SoC. It aims to prevent PHY mode
configuration errors when the combo PHY lines are used for PCIe rather than
USB3.

[ ... ]
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index c3f2dce0969c0..6f8d55eae6f6b 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -452,9 +452,6 @@ usb3d: usb@81a00000 {
>  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
>  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
>  			reset-names =3D "ahb", "vcc", "phy";
> -			phys =3D <&usb3d_u2phy>,
> -			       <&combophy 4 PHY_TYPE_USB3>;
> -			phy-names =3D "usb2-phy", "usb3-phy";

[Severity: Low]
Does removing phys and phy-names from the base k3.dtsi break DT schema
validation (dtbs_check) for disabled nodes?

To satisfy the schema's minItems: 1 requirement while supporting board-level
combo PHY configuration, should the dedicated internal SoC PHY (usb3d_u2phy)
have been retained in the base file?

The dtbs_check validation will fail for any board DT that includes k3.dtsi
but does not override the usb3d node to provide the phys and phy-names
properties (e.g., k3-com260-ifx.dts and k3-deepcomputing-fml13v05.dts).

This happens because the schema spacemit,k1-dwc3.yaml unconditionally
requires these properties, and dt-schema evaluates all nodes, even disabled
ones.

>  			phy_type =3D "utmi";
>  			snps,dis_enblslpm_quirk;
>  			snps,dis_u2_susphy_quirk;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831044540.3304=
350-1-aurelien@aurel32.net?part=3D1
