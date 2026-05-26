Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF53DD841
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791885; cv=none; b=VyA1eSSJEcqZcGZGaLHtB0HFJ2oX8zacTxkbBL6+HFeqYp9lqoEIEHWaAqEwusnCX+EQgd0UkYbYWEgGeQx/jUFJ/2MLV+qI6WgW5kWrPbmIS9+oB+Sx7r2aGrDs4aUi8Ep1L5XSIWu9vDvMf8XXPgeqO7hugJkzZyVX9A23m/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791885; c=relaxed/simple;
	bh=9eh6XUU2ndfYyUo62dvqnlzK6TG0k3ObehKlBXsD98A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lzka3TkJb0IFbik1flUo3/VgPen9sAKI/HbF27bVB+oRTNSYfFZHn1Wl4qgt5l+7z+FXJj/qxs6zqRoprZLAp0plZs85+MjuN03ZcV7MPEOduzH2wskbE0aMcIxCMnb8+/e7F7HRcXevZYAfhGsAdYFkjV7ONURUYcH1mAOCsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gODtcKjN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gODtcKjN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A6A1F000E9;
	Tue, 26 May 2026 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791883;
	bh=aSzjaTvhA46HjYX/MaMaPQvfxxyuTLVAEIxF62v/HVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gODtcKjNYtyFAoPF9qWF66nFTFikQyC+cDRwlgq5Ex9V7+dVtjTb8NPBKqDDhgLC2
	 6Zk35oZQ/tdCmx5GWbUZ8hspGMZhIewdlVJPCTb4V/nfkuFR2k6CXselTojZzcXfSC
	 1QgqaLDbHylVDRsktCsPSf0bTSH0OqwYkM6EcNknpqMPouDM2PsI7Hxdw8WAgqbhKG
	 L+C+ml1Ks1DKJSdl2xraHJo9Abf8E9EDt93h2gQuHKbara/bj35cIcPeH9epYrsg2W
	 T/Hhd3md5Ga+I8gBf0aeJ19OUlc7OFnUfJDhUmRjmFkb2X90G1SQ4wEW0H20cZfUAm
	 PbrCE6Ak75DVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/7] arm64: dts: st: Add boot phase tags for
 STMicroelectronics mp2 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-upstream_uboot_properties-v7-7-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-7-e17cd424d5db@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:38:02 +0000
Message-Id: <20260526103803.64A6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The patch aims to support SD boot by adding `bootph-all` tags to n=
ecessary nodes, but it fails to add them to the SDMMC node (`&sdmmc1`), its=
 pinctrl configurations (e.g., `sdmmc1_b4_pins_a`), and its required regula=
tors (e.g., `scmi_vdd_sdcard`).
- [High] The commit message explicitly claims to add the `bootph-all` tag t=
o timer nodes, but the patch completely omits them.
- [Medium] Display controller nodes (`&ltdc` and `&lvds`) in `stm32mp257f-e=
v1.dts` are inappropriately tagged with `bootph-all`.
--

commit ece19a3ebae334de3035a4297c45927575316f46
Author: Patrice Chotard <patrice.chotard@foss.st.com>

arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards

This commit introduces bootph-all tags to multiple device tree nodes across
STMicroelectronics mp2 boards. The stated goal is to preserve essential nod=
es
like timer, gpio, syscfg, clock, and uart across all boot phases to ensure
SD boot works.

> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag
> to these nodes to support SD boot.

[Severity: High]
Does this patch actually add the bootph-all property to the timer nodes?
Looking through the diff, the base arm architected timer and other timer
nodes don't appear to be updated. If the early boot stages rely on the
device tree for timer initialization, will this omission prevent SD boot
from working properly?

> diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/=
dts/st/stm32mp235f-dk.dts
> index dd4efbe5a46e8..0608b978cbe5a 100644
> --- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
[ ... ]
> @@ -258,6 +334,10 @@ scmi_vdd_sdcard: regulator@23 {
>  	};
>  };
> =20
> +&scmi_reset {
> +	bootph-all;
> +};
> +
>  &sdmmc1 {
>  	pinctrl-names =3D "default", "opendrain", "sleep";
>  	pinctrl-0 =3D <&sdmmc1_b4_pins_a>;
> @@ -272,12 +352,27 @@ &sdmmc1 {
>  	status =3D "okay";
>  };

[Severity: High]
Should the &sdmmc1 node, along with its required regulators (like
scmi_vdd_sdcard) and pin configurations (like sdmmc1_b4_pins_a), also
receive the bootph-all tag?

Since the boot loader will remove device tree nodes without early boot tags,
it seems the SD controller itself might be missing from the early device
tree, which would break the SD boot support.

[ ... ]
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot=
/dts/st/stm32mp257f-ev1.dts
> index 14e033f365e39..dab54742e01c1 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
[ ... ]
> @@ -344,6 +396,7 @@ timer {
>  };
> =20
>  &ltdc {
> +	bootph-all;
>  	status =3D "okay";
>  	port {
>  		ltdc_ep0_out: endpoint {

[Severity: Medium]
Are display controller nodes like &ltdc required during the early SD boot
stages?

Including these nodes in the heavily memory-constrained early device tree
might cause unnecessary binary bloat. Could this safely be left out if it
isn't strictly needed for early boot?

> @@ -353,6 +406,7 @@ ltdc_ep0_out: endpoint {
>  };
> =20
>  &lvds {
> +	bootph-all;
>  	status =3D "okay";
>  	ports {
>  		#address-cells =3D <1>;

[Severity: Medium]
Similar to the &ltdc node above, does the &lvds node need to be present
in all boot stages?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-upstream_u=
boot_properties-v7-0-e17cd424d5db@foss.st.com?part=3D7
