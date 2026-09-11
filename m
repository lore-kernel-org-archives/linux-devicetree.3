Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAFD4718FC
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118397; cv=none; b=FVnYJqF+kNqXuP1FpQ7UB4oqjH7jbxxHkUQhJSoBG6EqQL0Kel0CXMvBFPZqhs2YLswbvVHK1/MeJM6XqYypjoEeeB+FYGrHGXALM9mlfIy6k5sy1CH+kWFdtTwxYxnVpIF5hV+yv9COhpssZgniT/RWlqbqSutHoeGTFPcRpC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118397; c=relaxed/simple;
	bh=jzyoszIHocPMzy2BBwLcrMJhpJ8H5+DfAbV/6x0FHVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VZmjbbmNgpIs1AWZFmJJ4HMiJWuULG6/rOdlBjFukZ3b3+Nz+y1R2KIPJ4MmHm6kJcAXopddjWqtKN8eP28ciVYuAnZbxIr5Yg6JNaoy2pXRaVbbxvw/aFy3Fp76fyL6pbdfw26kx539i7twrp6vQZz/670V2XT6TyYOmSqaHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELIYr/3+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELIYr/3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BF31F00893;
	Fri, 11 Sep 2026 09:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789118395;
	bh=gVEeEvFk4sFpbN/htcwMSxReW2V8T457oGaoVt9096Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ELIYr/3+a+Ptjn3FX1XGMuEBwr9N9ahqILYnrKoXKUEdAoZ4vPvZ9SPYPAETfNw4p
	 Z8GdSovNDJfqH8TZsOJqG0SDKi/NmWO0EQBcHKFfva4c2FcB/vm9FV0RYAWkFrhJGR
	 c+dmmCH+m+2v4I+jIEvC5zzvYaIZqn9rU6cIFXllEPYUewIbtLu/5d6ZczAUNEc8E3
	 e5T4tQcTpk/1G/akpsDahhYilexKGnpOdsEDTD/ybvRJsNWI3DdLVqCyLe5AUaRz09
	 vublwB7JFI8bn2X28smmHqEKUNZM9GQnrf1furLdBHTIVbZnWxbmRRFUQx7xf8n6kF
	 tbQfvEvbhl8zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] arm64: dts: intel: agilex5: add USB3.1
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: adrian.ho.yin.ng@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <dba41aa636c6db86be9e0e2a3e2ae1a03095e1cb.1789114403.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
 <dba41aa636c6db86be9e0e2a3e2ae1a03095e1cb.1789114403.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:19:54 +0000
Message-Id: <20260911091955.52BF31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing fallback compatible string prevents the DWC3 controller fr=
om probing.
- [Medium] Devicetree Topology / Address Space Overflow in DMA ranges mappi=
ng.
--

commit f5eee55ab58207528984fe03c0204fcdede698dd
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Date:   Fri Sep 11 09:09:24 2026 +0000

arm64: dts: intel: agilex5: add USB3.1 controller node

This commit adds a devicetree node for the Synopsys DWC3 USB3.1 controller =
on
the Agilex5 SoC. It places the controller under a simple-bus with a 40-bit
dma-ranges window to match the interconnect's DMA address width. The
controller is also enabled in host mode for the SoCDK board.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index f54767d1526e1..523f722a2a642 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -493,6 +493,41 @@ usb0: usb@10b00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		usb31_bus: usb-bus@11000000 {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x0 0x0 0x11000000 0x0 0x100000>;
> +			/*
> +			 * USB interconnect DMA is limited to 40-bit addresses
> +			 * (1 TiB window from 0).
> +			 */
> +			dma-ranges =3D <0x0 0x0 0x0 0x100 0x0>;

[Severity: Medium]
Does this dma-ranges mapping structurally overflow the parent bus?

This property specifies a 1 TiB window (0x100 0x0) and maps it into the par=
ent
bus which only has 32-bit address capacity. Since a 32-bit bus can
mathematically only address up to 4 GB, could this cause DMA configuration
failures or silent truncations depending on how the OF core parses the tree?

> +
> +			usb31: usb@0 {
> +				compatible =3D "altr,agilex5-dwc3";

[Severity: High]
Will the USB subsystem fail to bind to this device without a generic fallba=
ck?

This node specifies a SoC-specific compatible string but does not include a
generic fallback string like "snps,dwc3". Because there is no matching driv=
er
in the kernel for "altr,agilex5-dwc3", won't the DWC3 core driver silently
ignore this node and leave the controller unprobed?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789114403.gi=
t.adrian.ho.yin.ng@altera.com?part=3D1
