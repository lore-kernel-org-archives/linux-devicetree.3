Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2572301004
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720076; cv=none; b=ZA1bCIIv/csMz2DPI1BCbhPdEydUa2CPH6alszh3Z6U4VL6QqGipryoXLKMal2HYFNMO9CESZzkuZ9zVOf2mqUDKl3HfN7LCUxkcKs2mUveMYjipZZ1APRB2lSW3OM4C7Ig8zJ8tAZcjLpWO7VGI9X6N7W3v7aEv0tGVooHpYlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720076; c=relaxed/simple;
	bh=mDditoIJYnQYqDLLL+aHH/bptsjGYVkGcRzl5cjapEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cYT1pht+2TOXqUa8qKROqFXQin8VILcI2u5oTMx8dt855jt5J9RCDtn9AKMwQW3EEtUQh7eAVhRjivV1Qp426zf1m50aXo8zQx1hWYjWnCyJSVluMDr3hAW82tt+qlEvCvk7NBpyI9OBf11HUTtE4hhvJrnnR2vT05nlbPvuvJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyXS5auI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyXS5auI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484B5C2BCB8;
	Thu, 14 May 2026 00:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778720075;
	bh=mDditoIJYnQYqDLLL+aHH/bptsjGYVkGcRzl5cjapEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=nyXS5auIH+JnCW3pD4Pg7msAnyHzvsnOAZPsgfvTa7qSKHOzkMa7JhSqeHn8ZUCez
	 950gnwqBNrPV/o33bv5ARRz9j5N4ssWBCvN+QB6dEs4pTGFQz7CHGRBBWIAecJyReV
	 R1YOkPiA+CzaBfugV+Fq+scpclaZAH9iKyngyLqdNkuV8xuEsPXvuSn/ZPJ7KdKh2Q
	 O8Osi/CdKSf2AqQIc6EUoff++c2Kraw0/grwnBVRgA5CiIxZQ4DH2IfCpOSr8+/2Fq
	 io/VgkXQAvQ5y0XtiOf3/65mjOrw9dcLIPn1QIc3XjjsZv8NydQr7sIQC6DtcqeLL5
	 k8II/s18S9ZIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: drop unnecessary power supply
 from PCIe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
References: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:54:34 +0000
Message-Id: <20260514005435.484B5C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing `vpcie3v3-supply` from the PCIe controller node breaks po=
wer sequencing because the `spacemit,k1-pcie` driver expects it on the cont=
roller node.
--

commit ab7558e23a3bb4900f7961804151870f4c1f99fe
Author: Yixun Lan <dlan@kernel.org>

riscv: dts: spacemit: drop unnecessary power supply from PCIe

This commit removes the vpcie3v3-supply property from the PCIe controller
nodes in the Banana Pi F3 and Milk-V Jupiter device trees. The commit messa=
ge
states that the supply belongs to the child port node rather than the Root
Complex, aligning with the dt-binding documentation.

Link: https://lore.kernel.org/all/20251113214540.2623070-4-elder@riscstar.c=
om/

> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index e20daa50a152f..c70081856606f 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -316,7 +316,6 @@ &pcie1_port {
>  };
> =20
>  &pcie1 {
> -	vpcie3v3-supply =3D <&pcie_vcc_3v3>;

Will removing the vpcie3v3-supply property from the controller node break
power sequencing?

Looking at drivers/pci/controller/dwc/pcie-spacemit-k1.c, the host driver
calls devm_regulator_get_enable(dev, "vpcie3v3") during k1_pcie_probe().

Without this property on the controller node, won't the driver fall back
to a dummy regulator?

Since the spacemit-k1-pcie driver does not currently integrate with the PCI
power control framework (by calling pci_pwrctrl_create_devices()), does any
driver in the kernel actually control the power supply for the child port n=
ode?

While this issue might be masked on the Banana Pi F3 and Milk-V Jupiter
boards because their vpcie3v3 regulators are defined as regulator-always-on,
does this change break dynamic power management for the PCIe slots?

Should the host driver be updated to adopt the pci_pwrctrl framework before
dropping this property from the device tree?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-k1-pcie-fi=
x-supply-v1-1-4eecbdd44ebe@kernel.org?part=3D1
