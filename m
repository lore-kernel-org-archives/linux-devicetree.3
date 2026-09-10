Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D1494803
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047731; cv=none; b=fB8hbitN34CSLkR92/w/pXpqFrkrR4Qlg1m4xAW+k+fI9cDRc7I89TJQuhgGX9sUWY3AKiU7SX8p3guynpu0uHdVuI2IHiAUBaH3aCgnmGMyrfCx7t1rT9HwSPbfvIQrsO9QPI8x1BV0OISEX0XaE8KrkMCluWszXqDAtlITg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047731; c=relaxed/simple;
	bh=PUOMWKUWcwMrgcea6Bt1YD3DTfk+jzWi/KZKYkdZWZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r/PDVgX7MLLjM0rZO3BAZCVQNll6WPyj5BPXE9RDY6hH26C0EES9tYhrs12rrluiXU1UWgQqy6THzsajaOQzmNF5FuVUr3yymMyZA0zlvdTatCWtYTFrEosxvvGvjqpEniqrdYnKbi/a2e6v4CID46wzvb1Pm71P8DI0I7GQhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYkILkja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYkILkja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447891F000FF;
	Thu, 10 Sep 2026 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047729;
	bh=j9LDn2Gr4U+yjf5Tf7l0ev7dppZ9WIob62l5Dt32hwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BYkILkjaHjNVY46GWVhRfj46p2mJN//sksEehDooocBNyUcYUwKc7oShwzfBNxznT
	 zeimTWxEkEAls7hnf87HG1ovfReX/ZExITiJMaJp1gIF9o6jLYbucr0Ojyw325PEX3
	 CpNfEqHONXCmKDV03It2sGF9c7zL+r7snW+zsJDnOEUe04aXr3UwDFcSeAA0wB6rdb
	 j6HaDt6pnh2/38AJi/du2t7RsEspFnJbHFbjYSdodUXehpS6feTlyBjNH9PfHlbAHn
	 qSbcYiZLwl8+LgGORXkCMhGEuIQZQ1LEjfqJ5w+IE8U77GTQWuVF4XMsJOrV8PlqCL
	 dIgfh0hjMaTDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: rockchip: Rename rk3588 HDMI audio
 cards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-8-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
 <20260910-fix-rockchip-hdmi-audio-names-v2-8-1396a6168e20@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:42:08 +0000
Message-Id: <20260910134209.447891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Changing the ALSA card name breaks backwards compatibility wit=
h userspace audio configurations.
--

commit 4e7ae2a4eeb352a3c16029392d27511fd5231a87
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk3588 HDMI audio cards

This commit renames the HDMI audio cards in the rk3588 device tree. It upda=
tes
the simple audio card names from "hdmi0" and "hdmi1" to include the SoC
identifier, intending to match the naming scheme of the rest of the family.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 376ad04e07869..7892e18a7835a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -376,7 +376,7 @@ hdmi0_sound: hdmi0-sound {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <128>;
> -		simple-audio-card,name =3D "hdmi0";
> +		simple-audio-card,name =3D "RK3588 HDMI0";

[Severity: Critical]
Does changing the simple-audio-card,name property break backwards
compatibility with existing userspace audio configurations?

Since this property directly sets the ALSA sound card name exposed to
userspace, sound servers (like PulseAudio and PipeWire) or custom user
configurations (such as ALSA UCM profiles and .asoundrc) that match on the
"hdmi0" string might fail to initialize or route the audio correctly after a
kernel upgrade.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index b251bb129cdbf..2bcf30d8a338d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -11,7 +11,7 @@ hdmi1_sound: hdmi1-sound {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <128>;
> -		simple-audio-card,name =3D "hdmi1";
> +		simple-audio-card,name =3D "RK3588 HDMI1";

[Severity: Critical]
Similarly, could changing this exposed ALSA card name from "hdmi1" to
"RK3588 HDMI1" break existing userspace ABI configurations?

Users running setups configured for the old name may experience broken audio
routing on boot because their sound environments will no longer recognize t=
he
device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fix-rockch=
ip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com?part=3D8
