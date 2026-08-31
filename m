Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BE5385521
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199355; cv=none; b=NXx+2LhMq8gOHi5DVuPJwBWoBdnBfT5N31HrvnE6hJ2Um+CMC7onasEuYPTkrINVXiiPnv+qp+JQbmnt2ZOWOsz+5AwrMGW/amelfwAmdhELD3xcLjzVh0OcKTHuCMvoO0tZtnlwqU10PpEcNn9Qa/mbHPPD4cY63cZsipDbeBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199355; c=relaxed/simple;
	bh=HL+lBsoQfpD+EzhbLDsXOiobd2B+rkFjZAW9yGnBhoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dcGn29V235InQh1yWB34wfkginIC7kOBIm/qiyN2GUoJIO+NSfk5KOpWAQTesAzB86KNlV08JMw9PDgjfboZ5OG8p1JU9KQYi5Lxa9XIAEhqfmqyr6LcKCkY/Z/7MTD6U2fJEYkhQ55xETRKQsrj7HZOjA1TeND2WEm0iFVfvfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYzM9EDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYzM9EDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E174D1F000E9;
	Mon, 31 Aug 2026 18:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788199353;
	bh=y9USXUbmEXO/2rASNgXaBuAqWTSJLOUbOg5u96nqxrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYzM9EDuLfLkcVfqSN0j8ZrvaqbtuZbZSmDoOFV3Wj6gLjPzl9KWvBcv6K6GSPF6V
	 HgTEnsBIIKd3KGlhdT1F4CL31YOg4oOJ6Ox5Ynep/JmoJzkKwr7Uooa6FdRu6aQeif
	 ADzvu1Rrs6gA3ZSJnRULr0tBO4CwaONY6aR0wFXw0EVar/ph4tpy1wFeRXwoxDrrzZ
	 8BLChWCs6g1zdU2/Ck/YJNy56k0oPTF59Qq3D91gaRz2SlqVvTEnBnLWCpBxPoKZE1
	 IbHLgIh5xGhKFztAoKz3S3bqjmBMM0RwI+vCN07D6asmKLPy/E+8MYwLmi9IoNsTeI
	 td4F0vLMXSrMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: rockchip: Rename rk3588 HDMI audio
 cards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-7-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
 <20260831-fix-rockchip-hdmi-audio-names-v1-7-5b155ae05293@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 18:02:32 +0000
Message-Id: <20260831180232.E174D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Renaming the ALSA sound card breaks existing userspace configu=
rations that rely on the old name.
--

commit ee162ed61bb57db0487beb65c4dfb703f1987e94
Author: Detlev Casanova <detlev.casanova@collabora.com>
arm64: dts: rockchip: Rename rk3588 HDMI audio cards

This commit renames the ALSA sound cards in the devicetree from "hdmi0" and
"hdmi1" to "RK3588 HDMI0" and "RK3588 HDMI1". The stated goal is to better
identify the SoC in user-visible ALSA fields and match other naming schemes
used across the Rockchip family.

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
Does this change introduce a userspace regression? Changing the ALSA sound
card name alters the user-visible userspace ABI. Userspace audio daemons
such as PipeWire, PulseAudio, and ALSA Use Case Manager (UCM) profiles
often match against the exact card name (in this case, "hdmi0") to apply
specific routing and hardware configurations.

Will upgrading the kernel cause existing userspace configurations to fail
to identify the audio card, resulting in a loss of audio functionality?

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
Similarly for the hdmi1-sound node, does renaming this card break
compatibility for existing userspace environments relying on the original
"hdmi1" name? The kernel generally enforces a strict no-regressions
policy for userspace interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-fix-rockch=
ip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com?part=3D7
