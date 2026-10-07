Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852EC47CA6D
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384782; cv=none; b=fa77jxH/1qM/Aubh2eeiG+2nczOVMnypWuDJygRPVfxp6LWcUvewweTxv0YzRYBwTrmvyhAu6xiYFWTogbWrEIJQIh3FSYDB2kvKlY/NqSmguxytDW1nr0pUSFlJxISuSBje+CS2k062sp0cXg064V3mk6hX6iTQxVIKTyis/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384782; c=relaxed/simple;
	bh=cCj65IWaiHiRC7iVe3JqRDx46qKwcSNjZpkCq4oZX7s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t86gkiijulv1l24qUFRDwjul7qaEOTWf4Wo7asNwf8WCiV79taXFRtDa2HnEIyRL0pM9S3Ou0KZdGUIrQwLgJ0vJoMQmVfT9/ubjt2u6hbyhYVgW21EOfb07B2ZCtDVNPG0tZIhKdymBu+QfkM/Tgh3X3PkBUg6cZNDBoMxHCP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWf0ABBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWf0ABBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A34F1F000FF;
	Wed,  7 Oct 2026 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384778;
	bh=25LVs5sPzYyXyo7uI6ETl9DrGXMCuKluHnqZ342D9zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eWf0ABBPN1hThGfZUMvMwrbyZQdAOtOOlLjaESZkl3ffSkymKr0QJ1a+x2eBcJxCv
	 3SpmO4oY4pKqzuRnEHArjbdZIYVS2DLwX2iC7YZAfJf2dQpgDspYij2A7p+79X8G0t
	 ccVb575vzicKtkFsLJeejakM9saECeRU4nPS6hgLrGidIT/l0fLzaoGM8bBstNvm6f
	 sq5ka9lhso5ZKKP0unBj9GffFAG1eXnw5+YGg1ZPW73NfEWDFdeSMTNoNbSTWv2t2y
	 1orMtsAd1sxhfdKwZQHxsUe/ejdzySx7Mh2BoFhFPj8zvGYJsaW6dNC0qEo+NaDOe3
	 yDuc8uhFCQWiw==
Message-ID: <sashiko-outbox-163126@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20261007-tegra-phy-v3-3-d501de414710@nvidia.com>
References: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
 <20261007-tegra-phy-v3-3-d501de414710@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 14:52:57 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] phy: tegra: missing declarations for exported SoC structs in xusb.h
--

commit 8acf4872f17465f59f32558aefacb7be8e2c679f
Author: Jon Hunter <jonathanh@nvidia.com>

phy: tegra: Add support for Tegra238 XUSB pad controller

This commit adds support for the Tegra238 XUSB pad controller. It populates
the Tegra238 specific SoC data, reusing structures from Tegra186 and
Tegra194, and drops the compile time guards around these shared structures =
in
the source file.

> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 322efdea0d807..aa8ab94fad4cf 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
[ ... ]
> @@ -1665,11 +1664,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_p=
adctl_soc =3D {
>  	.num_supplies =3D ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
>  };
>  EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
> -#endif

[Severity: Low]
Since the guards are removed here, tegra186_xusb_padctl_soc is now defined
and exported unconditionally. However, its extern declaration in
drivers/phy/tegra/xusb.h remains conditionally guarded:

#if defined(CONFIG_ARCH_TEGRA_186_SOC)
extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
#endif

Does this cause missing declaration warnings (-Wmissing-declarations or
-Wmissing-prototypes) during the build if the kernel is configured with
CONFIG_ARCH_TEGRA_238_SOC=3Dy but CONFIG_ARCH_TEGRA_186_SOC=3Dn? Should the
corresponding guards in xusb.h be removed as well?

> =20
> -#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> -	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
> -	IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
>  static const char * const tegra194_xusb_padctl_supply_names[] =3D {
>  	"avdd-usb",
>  	"vclamp-usb",

[Severity: Low]
A similar mismatch occurs here for tegra194_xusb_padctl_soc. The definition
is now unconditional, but the extern declaration in xusb.h is still guarded
by #if defined(CONFIG_ARCH_TEGRA_194_SOC). Could this also trigger missing
prototype warnings when building with certain configs disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-tegra-phy-=
v3-0-d501de414710@nvidia.com?part=3D3
