Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D788439F60
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346000; cv=none; b=F6DNvV2bvwcXcs3YPDNcRsW4uDotnIplGkKNsW7ufXrYM72nabEKNKJD9ZhkUEW5faL/vop/eAjSDTqCsQo0S6IT26q7QyUjeGP6H+l7qpH4RY/He09RDGuHRjc8JoO/fjrgKTzTRGX/6+rFJZHQVsTtyBwfbVoPGntrvfm1Aqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346000; c=relaxed/simple;
	bh=rRBSGnzjR1bgJQO57H+ODPqV9vBaJQwpItO5FOBUFQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rz31xKeKX/S40AhTuzN1qGZBkyNTf8mx+1JnFIJCNyXX23xy0AUp0jEIYAl+O9aeIHxWrwUjVLm5V+yw311kXmphYEzLy8eu0Is1u90mVY6CTD9cG1xTKC0Oq7TmOkdzSEK4lANAYsDI2G4zIVKnJlHEWer1wJCgRnfKxnpzuBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmE65Vvf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmE65Vvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428841F000E9;
	Wed,  2 Sep 2026 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788345989;
	bh=2KOZV3EI8cMAsUPgTYz3Zf5oiIlciMfkMuWiONuUoGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmE65VvfmVmqF2Si+GdiiauzBKkaO7/VC/TFJCRbEh4LLvmAmavkHNl4WxCx6GeCg
	 EtNVG7OgCoqYylmqTsP1Y12OYRuoTJAJ/pDTQexGfymwy0O3s4y/Nuq1TFSdpPaAHT
	 ZufO5j2HusYg+LDZMsFe05Af1pVNCJD4RFK5FHPj4Kd7eWsd3/4Bw6TXiFtkOkFfue
	 ydFl1MWsUa1MN7qWH0jrDeQlqzkyKmv3zO8SkkmkdZB+IRWsmRxA8+6CBPQzcfrnlE
	 h2byNyMZ7oSQ3vgL1GivR361iedOMe4m1RpqU/ovS6H9azF+Ux8pus+OzXDoYaem56
	 l/aHmnkgztMZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8395-radxa-nio-12l:
 Complete UFS power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-3-7876e7a27a9d@collabora.com>
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
 <20260902-mediatek-ufs-cleanup-dts-v1-3-7876e7a27a9d@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 10:46:28 +0000
Message-Id: <20260902104629.428841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing device tree bindings for newly introduced clocks and clock =
name changes in the UFS host controller node.
--

commit 7e580823437c359d26b9851536b0a8f497844243
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

arm64: dts: mediatek: mt8395-radxa-nio-12l: Complete UFS power supplies

The MT8195 UFS host controller dt binding now describes the power supplies
feeding the host controller, that were previously missing from supply
description. Add in the Radxa NIO-12L board devicetree the regulators used
to power MT8395 UFS controller on the board.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch=
/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index b279eed1bfc3a..325b1cc97862f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -1167,6 +1167,9 @@ &uart1 {
>  };
> =20
>  &ufshci {
> +	avdd12-supply =3D <&mt6359_vrf12_ldo_reg>;

[Severity: Low]
Will running make dtbs_check on this updated device tree produce validation
errors for the ufshci node?

The mt8195.dtsi device tree was updated in this patchset (commit "arm64: dt=
s:
mediatek: mt8195: Align ufshci node to dt-bindings changes") to use 10 cloc=
ks
with renamed clock-names instead of 8:

arch/arm64/boot/dts/mediatek/mt8195.dtsi:ufshci {
			clock-names =3D "main", "aes", "tick", "unipro_sysclk",
				      "unipro_tick", "unipro_mp_bclk",
				      "tx_symbol", "mem_sub", "rx_symbol0",
				      "rx_symbol1";
}

However, it appears the dt-binding schema in mediatek,ufs.yaml was not upda=
ted
in this tree to reflect these changes. The schema still strictly enforces a
maximum of 8 items and requires the old names.

Does the binding schema need to be updated alongside these device tree chan=
ges
to prevent dtbs_check failures?

> +	avdd12-ckbuf-supply =3D <&mt6359_vbbck_ldo_reg>;
> +	avdd18-supply =3D <&mt6359_vio18_ldo_reg>;
>  	vcc-supply =3D <&mt6359_vemc_1_ldo_reg>;
>  	vccq2-supply =3D <&mt6359_vufs_ldo_reg>;
>  	status =3D "okay";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-mediatek-u=
fs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com?part=3D3
