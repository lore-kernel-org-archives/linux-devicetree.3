Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486710;
	b=Ctx54pvz3gsXO1S4ZSHvBrs2fYdM6t2oYUs6JEBb+HQSxskZX9xcfZPjBjLfC18G9wfx
	 8qTKqr6wHOAGQ/Wre4xIOAdzmI54rW/6/DvkZtUyC47W0IJbwyAhyQqLrxx01O+tOLn+d
	 MxfmVIcMgNuQBWlUKLDUPf6y7x2ByGwFOPXgEqfE0DdYgSUrhm3KcJp9cVzhZ/uARst7q
	 7PSJd/lF/KnKLVPsoxhDLh+pEcJsX30dqAIR1SP2Jod52UxCiMjbWq8aYoGyp2HQuH2OX
	 u7rcOKTz75ClXwRn4DbpYda1Y7vVtp08/ohxR0Dxk4f9fzeEAlnO+3pERp70OIh10YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bWyPuRN8GGgCsFQi3tBTzZh9Z8dyz2m6HES2acFGIDA=;
	b=4809af/F39WViC+yzTrncmiaCLAIwqKcPubruVw6tCR6FL2Bu0vxuZ7pyqFuz1ST/NG1
	 Kid8vD0WpAwNFOF5KD1sZCQQrODASelRNZWDlA2IgSSukIsvQCK2xlTNlrTxX3njXx1QJ
	 0R6QIzRTDpAmcyzhMabm1YpX63rS2NibHUjKnQaYtzhe1zi2sp0LA39F99w5eJTp0eb/1
	 LHH8JjgTOv8Thk2+dmio3tKCp6XATKbi+81r7zr75Xq8jAQ7z0OixjpfxrveRiT1p7GBi
	 W1aSUtRRfSpvYVG8d4W7y89Mm5un8ScRkT/zW9xqlDcKpyVZJt+x/TIlMPQL2YXN6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDFevIZr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B7A606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDFevIZr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C13C1F000C4;
	Tue, 20 Oct 2026 08:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486709;
	bh=bWyPuRN8GGgCsFQi3tBTzZh9Z8dyz2m6HES2acFGIDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fDFevIZrWmWxRznpf6/O1jx427DrvfZ+KKPlTcFaKFxOMMGopmu8WAdKs2ms+DHN9
	 094DvsJsb6efELwZE4/VAdpK8DASrqiV+yNwHLnN8VFyCBDvCGdZpciiVXs2wm9LOi
	 WoM/d5+K+ZE3SFLUplGUhX0r6y7QWQ/I9lJz1hw54exIOsKWPWHVm1vgfPS62b/0fZ
	 yoObNt4EAHPs4g/F40R6iXTdYB+aYeDGaxppvJNb0nwqfVhiWeC79OX2IAS3y7fZGc
	 VPwyq79V93ulN7isg8B87Nx/IsvnpfrKqpsgOCR1SDxnHyP1EpELOKN7hEZVb1WGGY
	 KH5Yzvxko0Puw==
Message-ID: <sashiko-outbox-178663@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sandie Cao" <sandie.cao@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
 <20261020082015.3673761-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:58:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] riscv: dts: spacemit: Micro SD slot sdhci0 marked non-removable
- [Low] riscv: dts: spacemit: unused dt-bindings/gpio/gpio.h include
--

commit 05afaddc88a27a23eeffb218991ebf7aa2ae92f1
Author: Sandie Cao <sandie.cao@deepcomputing.io>

riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support

This commit enables the sdhci0 controller node in the DeepComputing
FML13V05 board device tree to support the Micro SD card slot.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index 84f66dd8f962e..09e3d46a2ea3e 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) 2026 DeepComputing (HK) Limited
>   */
> +#include <dt-bindings/gpio/gpio.h>

[Severity: Low]
Is this dt-bindings/gpio/gpio.h include needed here? Neither the new
sdhci0 node nor the rest of k3-deepcomputing-fml13v05.dts references any
GPIO macros (and k3-pinctrl.dtsi already includes this header), unless a
cd-gpios property was intended to be added to sdhci0.

> =20
>  #include "k3.dtsi"
>  #include "k3-pinctrl.dtsi"
> @@ -184,6 +185,23 @@ &combophy {
>  	status =3D "okay";
>  };
> =20
> +&sdhci0 {
> +	pinctrl-names =3D "default","uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	non-removable;

[Severity: Medium]
Should a Micro SD card slot be marked non-removable?

In mmc_of_parse(), non-removable sets MMC_CAP_NONREMOVABLE, which makes
mmc_card_is_removable(host) return false.

Although the SpacemiT K3 SDHCI driver sets SDHCI_QUIRK_BROKEN_CARD_DETECTION
in spacemit_sdhci_k3_pdata, __sdhci_add_host() only enables polling when
the card is removable:

drivers/mmc/host/sdhci.c:__sdhci_add_host() {
	if ((host->quirks & SDHCI_QUIRK_BROKEN_CARD_DETECTION) &&
	    mmc_card_is_removable(mmc) &&
	    mmc_gpio_get_cd(mmc) < 0)
		mmc->caps |=3D MMC_CAP_NEEDS_POLL;
}

Additionally, mmc_rescan() only scans a non-removable host once at boot,
and mmc_detect_card_removed() immediately returns 0:

drivers/mmc/core/core.c:mmc_rescan() {
	/* If there is a non-removable card registered, only scan once */
	if (!mmc_card_is_removable(host) && host->rescan_entered)
		return;
	host->rescan_entered =3D 1;
}

If the board boots without a Micro SD card inserted, cards inserted later
will not be detected, and runtime card removal or swapping will not be
handled. Should this use cd-gpios (if a card-detect GPIO is wired) or
broken-cd instead of non-removable?

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vqmmc-supply =3D <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status =3D "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_0_cfg>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020081633.3673=
704-1-sandie.cao@deepcomputing.io?part=3D3
