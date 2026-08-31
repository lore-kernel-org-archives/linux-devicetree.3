Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCED49EC41
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198916; cv=none; b=smjvD6SHZMLgW10jhQslmIYQYvKtPfii4isurFXyatTN3Fz3nPsBNoBZ895FR0vz5tgGPIYjgoSlkJ75LeDwN8S7YcQU64SipPr2FoLbs7dbt3w4P4A/HyDTN6Gtq4MoUgvMtmnWnFeUeNlQXDvA9IkP92tWUzOlV3bOFpnOLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198916; c=relaxed/simple;
	bh=Hi7gKtdPKU1xXjMFTetvA63zAyd533/UlXqYfSHSFL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iWZHM37i2uhtML2R/KrqFhZrBcyvE4apL15scLpNY8Cf0OnvsrwDydNYpcwzX5vWjZeXmWUVmidv2wE1uUMh0Qzq3qvaQqvNbxVgLY+a1tTt9HLBSdgHOWr/uFPC7nztDqIxjDCyNuVK3WqkQVhkm8LeIsAZ8mpnt82r2auwiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkJjod2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkJjod2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6082E1F000E9;
	Mon, 31 Aug 2026 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198914;
	bh=0OOCDT2jNFkSO71quX7pn4q4AVZtHWMpKQhhX1o9+JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZkJjod2wpfQ4UvSdWLYGFxPZOZSmsO7Spu0/1CjdodP/eGaKNR7QoT6ji9919bwq/
	 bE57DzE5GiZDKVH+xzkKP5BaWkaChxo1KALCSE4JcFhct/BM2htvJeladKtCfUXStr
	 vJo8fKbCoJwNIN5DcKbQ8WtAzhWmwplaPIy73JLO78Y2C+uiDgVsVpJejn1E678sRi
	 Lvu9xVXD4sANGyX7nxHR7ECAFADNqiWhkol3T9Kzq8bLmNGgG3w2tk9QRKKefqhKPd
	 BVUi9x3GMpB8wVarQdSGSWXqdvQEwcbci/c4FFeq9nogk+HGoA7XTLmzKoPilq4wPp
	 fyQEloPFPm6ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: rockchip: Rename rk3399 HDMI audio card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-4-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
 <20260831-fix-rockchip-hdmi-audio-names-v1-4-5b155ae05293@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:55:13 +0000
Message-Id: <20260831175514.6082E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Changing the ALSA sound card name breaks userspace audio configura=
tions and constitutes an ABI regression.
- [Medium] The commit message claims the new name matches the Rockchip fami=
ly naming scheme, which is demonstrably false.
--

commit d9591718c98e7ed37b2a63128b5ae03809c98902
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk3399 HDMI audio card

This commit renames the HDMI audio card in the RK3399 device tree from
"hdmi-sound" to "RK3399 HDMI". The stated goal is to better identify the SoC
in ALSA fields and match naming conventions across the rest of the Rockchip
family.

>     Rename the card from "hdmi-sound" to "RK3399 HDMI" so it identifies
>     the SoC in user-visible ALSA fields and matches the naming scheme
>     used across the rest of the Rockchip family.

[Severity: Medium]
Is this description accurate?

Looking at the baseline tree, all other Rockchip base device trees use gene=
ric
HDMI names without an SoC prefix (e.g., "HDMI" in rk3328, rk356x, and rk357=
6;
"hdmi0" in rk3588).

Since the series itself introduces the SoC prefix to these other files in
subsequent patches, it seems no such naming scheme existed across the rest =
of
the family at the time of this commit. Could the commit message be more
precise about the motivation?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3399-base.dtsi
> index 49c68fe65de66..c46e58d4af0d4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> @@ -2008,7 +2008,7 @@ hdmi_sound: hdmi-sound {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <256>;
> -		simple-audio-card,name =3D "hdmi-sound";
> +		simple-audio-card,name =3D "RK3399 HDMI";

[Severity: High]
Does changing the user-visible ALSA card name constitute an ABI regression?

Userspace audio frameworks like PulseAudio or ALSA UCM use the ALSA card na=
me
to identify the device and apply correct mixer and routing profiles. Changi=
ng
simple-audio-card,name alters this user-visible identifier.

Existing userspace configurations on the widely deployed RK3399 platform th=
at
match on "hdmi-sound" will fail on boot, resulting in broken audio
out-of-the-box and violating the kernel's rules regarding userspace ABI
regressions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-fix-rockch=
ip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com?part=3D4
