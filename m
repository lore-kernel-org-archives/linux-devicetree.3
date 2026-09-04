Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC17431A3C
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512790; cv=none; b=qZCa6p0JJA6bUmWOazdPjMWMNOzGkoyGQEFlcjjiQO6tQS29fmoleIanThDFTxG1fLZQX0WlZlkrCMUFY7B67cgVVuiSVMYvGDmnR5zQP7Rw6I/9v9XksSADI+tDZYYXYJTZPiUmrhWFq1VGx7CslqHqjZ93sNN6y3xM7Jx0gRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512790; c=relaxed/simple;
	bh=jdFz2C6ULF9/EqHbJvbEs30O4LRrQQsRktRig8kKOS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cTNUUtukdRLtNsheIAW/u+UptdzaKD0Hta0C3ihQaU+Wzp7PUc3HTPo3MaR05xakYiqDrREm+RqOqbHnTnboOd9fUDr+Lmjip9S2J6aYJNsSdlL1yxpzNcEqHYK8/olm9YY4o0O64TX1pDmwkVz8zWLeNmAJ8Sv0JUY2smCHr3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjumcY3B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjumcY3B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D28F1F00A3D;
	Fri,  4 Sep 2026 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788512788;
	bh=w4CxurRA4CCzmPZiOlPQcgrN6gG1be3CY7IUdJsvfWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cjumcY3B81L4Y+YYn4CePvFpnW/Cn5IpgX/hslDTA4EBek8YNQ8JfdehpC8Zws+Im
	 rQL8Uff6hSPZ9asSlM4JxhGJR11j67xeb9TKVFWWT3gtTJURUE06I9f8YziHzQwqhj
	 OHWgz6HYsi0Vj8IbYhuCKW/gH49OOsG/W1mmTgO5LBAqYm6Fq58b0SCxNoSt1NX49Y
	 m4SBtvFhblvIsBocL4M7+QzxM/07COd9kCP80p7YjO9/O95a51YffkB0QkSJRcehK2
	 Yt2S2pvIkTs1VFm5e8DSF0chv8eZMB0eGb105A0CwbvMQh02OhUsvyTYtqplyn1V9u
	 7gBVucv2L/sVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: intel: agilex5: add USB3.1
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <f479477d21c3f8a3eeecd24cd34ce936c52a9201.1788503540.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
 <f479477d21c3f8a3eeecd24cd34ce936c52a9201.1788503540.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 09:06:28 +0000
Message-Id: <20260904090628.9D28F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `usb31_bus` node maps a 40-bit (1 TiB) `dma-ranges` window int=
o its parent bus (`soc@0`), but the parent has `#address-cells =3D <1>`, me=
aning it only supports a 32-bit (4 GiB) address space. This structurally ov=
erflows the parent's address capacity.
- [Medium] The `usb31` node uses an undocumented compatible string `altr,ag=
ilex5-dwc3` without providing a generic fallback (e.g., `snps,dwc3`).
--

commit 8d2a3618a07e5a6f14a501007e87cb0d96e62264
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: intel: agilex5: add USB3.1 controller node

This commit adds a DTS node for the Synopsys DWC3 USB3.1 controller on the
Agilex5 SoC. It places the controller under a simple-bus with a 40-bit
dma-ranges window to match the USB DMA address width of the interconnect.

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

[Severity: High]
Does this dma-ranges mapping structurally overflow the parent bus's
addressing capabilities? The usb31_bus node maps a 40-bit (1 TiB) window
into its parent node (soc@0). However, the soc@0 parent sets
#address-cells =3D <1>, which only supports a 32-bit (4 GiB) address space.

Because of this mismatch, device tree parsing and DMA address translation
will fail or truncate for addresses beyond 4 GiB, as the 1 TiB translation
window mathematically exceeds the 32-bit maximum of the parent.

> +
> +			usb31: usb@0 {
> +				compatible =3D "altr,agilex5-dwc3";

[Severity: Medium]
Could this break device tree schema validation and backwards compatibility?
The compatible string "altr,agilex5-dwc3" doesn't provide a generic
fallback like "snps,dwc3".

Without a generic fallback string, older kernels without explicit support
for "altr,agilex5-dwc3" will completely fail to probe the generic DWC3
driver.

> +				reg =3D <0x0 0x0 0x0 0x100000>;
> +				interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788503540.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
