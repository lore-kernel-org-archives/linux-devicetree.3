Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902054BFE85
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999687; cv=none; b=RUAq5su83Wwn8PoHjihfZBX+jQlhStW5LK8553mBTepwNk0wBggyoHeeAV9NfzoZZLuxuLaw7DE0Z9DFn1v8I3VJk4tMFtbFJ+oJx6R5aAZoF75DO9uGLznXwrEKY1x+6hBr6JiMzLuuEZExamvJDBiu4AHSaFLvtB4hf3+y+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999687; c=relaxed/simple;
	bh=GFW6Fqlwsl+9Fx8FFOTBd9s2rkers7nUgr8g/mpbT98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f19FDCv0E+UgtgmoZXT2Q5tU4gTZM0Du8+P08nvx/H5I4p99oMm9NO7X6z7iMddktMeeBVDmQEgGEkozKDb3PILvySGPjo1qzNUWugASNqSrOE5So94YP7IelCeNhWea4Jtu2TOTV0zrvxo/JZjR82H+6FikA4INfMymog1tang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNpmASHw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNpmASHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86301F000FF;
	Thu, 10 Sep 2026 00:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788999686;
	bh=OwMHPt7ZyKMKcZ/wkuYOLfb9kSclNfhAFasAjF3TUZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oNpmASHwmcL7ejkyOZgK4FfY5/R9Q7821UBmP7Gyux8pkYqJasUM1xa4KUou9ak78
	 mGPGYz57jmpBWc60cOd67F8RVs6tQWFvekloygRv13FuUYpqGiDkLn7CTs+dk/Su8p
	 TFGBUvvnrH/sOGvZaMlgJjUHXh3BB169rGQdPJZqHSpEROImOg7GFE0x6RETmPMiTp
	 UFoBvZ7dq5pN8pX5cp2M8iKY6mFJy0CaPllGlq5w6S7CTIa7DBeLFt7gZBfrQNA4GK
	 afmnSU01K8z5P1tN/NNry+crIXvrCCh0idEVNL2tH0OZOJEKzVC63WPyLKGM5uIjte
	 tM+2+L+j0TvfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910001209.116465-1-rosenp@gmail.com>
References: <20260910001209.116465-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 00:21:25 +0000
Message-Id: <20260910002125.E86301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Zero-size allocation leads to a kernel panic if NVRAM is completel=
y empty or uninitialized.
--

commit 3e511df55083f5f3829311b665dd624ff8599e95
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: AC56U: add nvram node

This commit adds the brcm,nvram node to the bcm4708-asus-rt-ac56u device tr=
ee.
It configures it for gmac0, which is the only GMAC used on this board, and =
sets
the size based on a bootlog.

> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/=
arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> index c80ac16ad9496..9ab618a097b1f 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> @@ -25,6 +25,15 @@ memory@0 {
>  		      <0x88000000 0x08000000>;
>  	};
> =20
> +	nvram@1c080000 {
> +		compatible =3D "brcm,nvram";
> +		reg =3D <0x1c080000 0x180000>;
> +
> +		et0macaddr: et0macaddr {
> +			#nvmem-cell-cells =3D <1>;
> +		};
> +	};
> +

[Severity: High]
This isn't a bug introduced by this patch, but enabling the brcm,nvram node
exposes a potential kernel panic in the nvmem driver if the NVRAM is
completely empty or uninitialized.

In drivers/nvmem/brcm_nvram.c:brcm_nvram_copy_data(), if the flash partition
consists only of padding bytes (e.g., after an erase), the scanning loop
decrements priv->data_len to 0:

	for (priv->data_len =3D priv->nvmem_size;
	     priv->data_len;
	     priv->data_len--) {
		if (readb(base + priv->data_len - 1) !=3D priv->padding_byte)
			break;
	}

This results in a zero-byte allocation:

	priv->data =3D devm_kzalloc(priv->dev, priv->data_len, GFP_KERNEL);

If priv->data_len is 0, devm_kzalloc() returns ZERO_SIZE_PTR (0x10) rather
than NULL, so execution continues successfully to brcm_nvram_parse().

The driver then attempts to read the header:

	struct brcm_nvram_header *header =3D (struct brcm_nvram_header *)priv->dat=
a;
	...
	if (memcmp(header->magic, NVRAM_MAGIC, 4)) {

This dereferences ZERO_SIZE_PTR (0x10), which causes a page fault and kernel
panic on devices with erased NVRAM.

Could a check be added for priv->data_len =3D=3D 0 in the nvmem driver to p=
revent
this unrecoverable boot failure before enabling the node in the device tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910001209.1164=
65-1-rosenp@gmail.com?part=3D1
