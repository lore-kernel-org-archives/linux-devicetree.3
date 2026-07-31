Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0282938F620
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498870; cv=none; b=AFJeF9PlqnVbKYBgbz7w9UqTjCl2CQdZYCR5ZLWhz//BJIdwTV1taZW+D9zCoiz1LlW1JqajG0eav8Ce3RkWJDdKobqtIi4ZJvFxQfhHgiGaeR2dFWekMinsIUnUuwW6sRDXo+ctJZJVL5Y4TsSFEK1zkaf2QZZwdDaZN82UPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498870; c=relaxed/simple;
	bh=c7/EWpkveCJmpNG+lmx4Xq6qTLgrQ+hBhprJDsxwP6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fWIy1JP4oOfTLwDkyIT3dN/cXrFMCVT4+9mwUCj+oGbKzPGwF4x4tsDb0yjI5Yzd9lOUJu2LEP/H/Nn23YxAs/Z/gYXVu6HolRje9XvNipM/kr+p/d3Lhz52Sur9esmMXGX9kJbQ+pXlkxDrKEVHiuKNJFMrzmT89brIv0tKXvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h368BG78; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h368BG78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633821F000E9;
	Fri, 31 Jul 2026 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785498868;
	bh=uUxP0tGSOGF8p90oN84jTGqANXwOsjW23fpmru+XOjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h368BG78+790JVmOY/xwjTuhhygYOp188RKT1MwVY3980w39OotrcQhtNit3r/tpk
	 oypr+NxXAZGoBfXEzCbpV+Osxowc9GeevQOUebr6nxcsflVS/9Aj7YPxCYpw+8KMen
	 JmVOYZqtm4NGZxgJneAbNqruviiEYb3m0bKNBcIs9OdGPzNrGVCxBFNRKap/W8mWkk
	 ZcFoSoHPuntiaMsl82WZQJi9kuBcTBoDlbNxOojbua2WcBQE5kA4J1U0bWgnTlT/Su
	 y9C5ngYVMrRtPTzo4C8nQdKHEHk+AmENulDeFxWY6NZLXko4l7/R/VnkaK74xsm+Cg
	 Q752RCEq4/Stg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip
 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731114106.169398-8-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
 <20260731114106.169398-8-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 11:54:27 +0000
Message-Id: <20260731115428.633821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly conflates the BCM4334 chip with B=
CM43340/BCM43341, leading to a conflicting mismatch with the assigned `brcm=
,bcm43340-fmac` compatible string.
--

--- Patch [7]: [PATCH v3 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT ch=
ip configuration ---
commit 3696d445e834823ddf2bb90d90ee281b49e3e4e6
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration

This commit fixes the WiFi and Bluetooth configuration for the Asus TF701T =
by
dropping the unsupported reset-gpio from the Bluetooth node and adding the
required LPO clock to both nodes. It also updates the WiFi primary compatib=
le
string to brcm,bcm43340-fmac.

> The BCM4334 chip's Bluetooth part does not support reset-gpio. This was
> confirmed by testing on the TF701T, so drop reset-gpio from the Bluetooth
> node to comply with the existing schema. Additionally, the BCM4334
> supports an LPO clock, which is required for proper and stable operation
> of WiFi and Bluetooth, so add it to both nodes. Lastly, the BCM4334 chip's
> WiFi part has a dedicated compatible in the schema, so set
> 'brcm,bcm43340-fmac' as the primary compatible while 'brcm,bcm4329-fmac'
> remains as a fallback.

[Severity: Medium]
Is the description of the chip in the commit message accurate?

The commit title correctly references the "BCM43341", but the body of the
commit message repeatedly refers to the "BCM4334" chip. This creates some
confusion because the BCM4334 has its own distinct compatible string
("brcm,bcm4334-fmac").

Claiming "the BCM4334 chip's WiFi part has a dedicated compatible [...] so =
set
'brcm,bcm43340-fmac'" contradicts the actual compatible string being used,
which targets the 43340/43341 variants.

> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
[ ... ]
> @@ -2382,9 +2382,12 @@ mmc@78000000 {
>  		vqmmc-supply =3D <&vdd_1v8_vio>;
> =20
>  		wifi@1 {
> -			compatible =3D "brcm,bcm4329-fmac";
> +			compatible =3D "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";

Could the commit message body be updated to consistently reference the
BCM43341 (or BCM43340) instead of BCM4334, to match the hardware and this n=
ew
compatible string in the wifi node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731114106.1693=
98-1-clamor95@gmail.com?part=3D7
