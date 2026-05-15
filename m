Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBB38F925
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844461; cv=none; b=eZd0spaJf805oxLh7Pg7Nfmf3kvxrp2ujmfmA3UE2JdQPhy0JIQql4eewcEbkxNuWfek76lVvHbbqA+0OWdWT7HcM+Hq+trAg5GZtXQE6kUul76zz2DyDp8djvytCBCLYH/UTN2I7/88f+BbP2FPC4/US0HxwCjJbcVv60HKy0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844461; c=relaxed/simple;
	bh=Xm+fPA+JR5HPgNRV2zR4fli00g5rLCcDyV6MSNg0jKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SZZhoCWGOmv/BxhcD1mBSS01WzLMhsh+0/K9fupSE0D/+zLfi+EW3w/CYI/uHz4XS/E2rEKBJlKQ0j/Hoa2mFn/IFPTaKnsh1CAay3gRk68WaQMkJeQ0CIUr7LWKUi0BJoNPnxyBZwDmsrcPyRajkjl6FrzFB3XePdRKMQiCNk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaQcfQsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaQcfQsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FD0C2BCB0;
	Fri, 15 May 2026 11:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778844461;
	bh=Xm+fPA+JR5HPgNRV2zR4fli00g5rLCcDyV6MSNg0jKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AaQcfQsh9+irjxq4/90QaDbRHLEBDtun2iDa6j83Z0Sy+aCSPkbFHWsLZDtuOOjiA
	 sKYUKreOfCL5Qe2uvbimFDVBzzRL3dFSScPYgwzT93xa0liX483Kg3+QHw79SJf0BS
	 8YsUcVY407vGpHIGfUvBXtUASjSd0mu3NgPbqfo73qqdP+hSbyUNU6LBJnOmTlqd/e
	 ZWVvm01btwxSyr0ACiHKTIx+6pYFesBPRtpb0IhP2sP/Y0j9jZpFhg72+QC1Q8dE/F
	 XCn6ZiLLGFiGApxLZGn8idK05ydmHS3nP0en4sMkUh+ECNwZrTXxY/yCgd1oB3N2WA
	 11egx4pHZkONw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD
 card support with UHS modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-2-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-2-094af27e310d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:27:40 +0000
Message-Id: <20260515112741.36FD0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The intended 'uhs' pinctrl state will never be applied because the=
 underlying host driver (`sdhci-of-k1.c`) lacks dynamic pinctrl state switc=
hing logic.
- [Medium] The pinctrl state name 'uhs' deviates from the established MMC s=
ubsystem standard 'state_uhs'.
--

commit d986961bd58045bfd797f79421e91fffcf930dbd
Author: Iker Pedrosa <ikerpedrosam@gmail.com>

riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes

This commit adds complete SD card controller support with UHS high-speed
modes for the SpacemiT K1 Orange Pi RV2. It enables the sdhci0 controller
with 4-bit bus width, configures power supplies, and sets up pinctrl states
for voltage-dependent pin configuration.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/risc=
v/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 3a829e3c9cbcd..74665795b9e88 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

[ ... ]

> @@ -309,3 +311,21 @@ hub_3_0: hub@2 {
>  		vdd-supply =3D <&vcc_5v0>;
>  	};
>  };
> +
> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";

Is this pinctrl state name standard for the MMC subsystem? Other device
tree bindings typically use state_uhs rather than uhs for the alternate
UHS pin state. Using state_uhs would align with the established standard
across the subsystem.

> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;

Does the underlying host driver (sdhci-of-k1.c) actually switch to this
alternate pinctrl state during voltage changes?

The generic MMC and SDHCI core frameworks do not automatically switch
pinctrl states when entering 1.8V UHS modes. If the host driver lacks the
explicit pinctrl_lookup_state() or pinctrl_select_state() logic, the
physical IO pins will remain permanently stuck in the default 3.3V hardware
state.

Can operating in high-speed modes with mismatched physical signaling
constraints lead to signal integrity failures or data corruption?

> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-orangepi-s=
d-card-uhs-v10-0-094af27e310d@gmail.com?part=3D2
