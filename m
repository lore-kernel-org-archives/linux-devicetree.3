Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D505395AE9
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321795; cv=none; b=ZaMW940biNc1XWW6yjmrN3wRjdXRMVJZaTnj6F3V5FfTzJJJOC2I1FMnO/8X4+xS/VvZrKcvXlSN5+UOc8wwWE4FDjq4V7Caak/+acbo3sR+hnpEWoB7FBwc388aXg2kWQk4iWhsXgp/mWEh5Ayrmva+mskxSz5HG/Dp1SDIu9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321795; c=relaxed/simple;
	bh=OH9/gVQ23SjvoO71TqwK85lex+ik6gQoE8I/INO4NEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HfhaWp/Wi17GXc3s/Jc0oKpQ/AMWtStsLT/PHOnDhcahes3xO1xVIFcRXOGtIdH4HceZR46zORUXUaKg58Qzvb0E71l4VjE5cBTOaRVMbo+szc4ap9qOLruw+/l/9g+ex+iKAzNBAnUY52I/OHdVBxhvzd3rBGUYs1jl2jtCUXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxXRbDoi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxXRbDoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0361F000E9;
	Fri, 21 Aug 2026 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787321793;
	bh=z72creqSmFGeBiCu7iE+nlj3JFsnnoHp4ydN5o2KeDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxXRbDoimOl+lNt+B3UyIdksGeUB41BzzZWXW/tlZeF3jHY0JndedJFEv39xNFY5Z
	 +YuprXE6R7WFoKGshog/k7bv2gRxhp3trYHnt3Gf+Ok/oDRZdeVQl71TmJa4Eg5BrF
	 wquT/BU2YuJhzUQpVjVWcyL3ccS/PwSYuFimdEwpgu80DlkgIkFVEHzTR/uIgRs0Rb
	 HpybRVlnBeQIDCCBdnCsYTSX6J/2LdUcA1KNWIQhhFJb0BIZc7WapGyA+dlg6Me8M3
	 WAz1eojE0Qx1aqYdJrvprvVG7/lWUNrJqcCjtW35Y5Io1PxXDhb9Ur3hLSIY4EfJoX
	 eZz1seJItnxPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: stm32: fix vdda supply for onboard hub on
 stm32mp15 DK boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260821-usb_fixes_vdda-v1-v1-1-0c213062165f@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
 <20260821-usb_fixes_vdda-v1-v1-1-0c213062165f@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 14:16:33 +0000
Message-Id: <20260821141633.9E0361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding `vdda-supply =3D <&v3v3>;` in the base DK dtsi causes a dan=
gling regulator reference in the SCMI variant `stm32mp157f-dk2.dts`, leadin=
g to indefinite probe deferral of the USB hub.
--

--- Patch [1]: [PATCH 1/3] ARM: dts: stm32: fix vdda supply for onboard hub=
 on stm32mp15 DK boards ---
commit 7026553f1e1e9967635ef09d235c6eb6bc13f81a
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

ARM: dts: stm32: fix vdda supply for onboard hub on stm32mp15 DK boards

This commit fixes the regulator association for the vdda supply on the
Microchip USB2514 HUB used on stm32mp15 DK boards. It sets the vdda-supply
to use the v3v3 regulator, as the 3.3V regulator supplies both the digital
and analog parts of the hub.

> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dt=
s/st/stm32mp15xx-dkx.dtsi
> index 599ea07bdb19c..01ac3d7d6d0ef 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> @@ -764,6 +764,7 @@ hub@1 {
>  		compatible =3D "usb424,2514";
>  		reg =3D <1>;
>  		vdd-supply =3D <&v3v3>;
> +		vdda-supply =3D <&v3v3>;
[Severity: High]
Does adding this supply here without updating the SCMI variant cause probe
deferrals on stm32mp157f-dk2?

In arch/arm/boot/dts/st/stm32mp157f-dk2-scmi.dtsi, vdd-supply is overridden
to use the SCMI regulator, but vdda-supply is missed:

&usbh_ehci {
	hub@1 {
		vdd-supply =3D <&scmi_v3v3>;
	};
};

Will this cause vdda-supply to inherit <&v3v3>, which points to a disabled
node in stm32mp157f-dk2.dts, and result in the hub indefinitely failing to
probe?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-usb_fixes_=
vdda-v1-v1-0-0c213062165f@foss.st.com?part=3D1
