Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412A3363C46
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199156; cv=none; b=FXQYDfF1yBB8SBW1GThRgfyBoNENe+Mc5o0j2FCz18FDGNKyPDoFHk2fqFaxRS9kTR1bwy6NTjFpxJJUBnOJUPbsdCRnqZlQ7MHmsOcY8BrFom2ZcG28fl3X4axIgdaGDII4dBlr4TLeqsaMsju4IiPqRaVz9LSuUsHEgapH8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199156; c=relaxed/simple;
	bh=ifrZL0nTwNUJz2fR1plkxFdZeVq23zgaEJrq5xE/Wk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZagUQPofBKqk9Lw8bRxa9XByIXcGkcFVSy2bI4fhsZD9xiJTD/0HyYhUuzjk2nsbYR4t/4U5VH7ThKkI5Y4GkogccyXvME2f0F+KDEzQ90rNf0xjmACZmjAZcCfi9njQTBp633G5ww+XYAV/DOiIHkOW5xjYdvmEJCZzkXv5IMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFtUy6xP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFtUy6xP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99161F000E9;
	Mon, 31 Aug 2026 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788199154;
	bh=c+ofroS0rwSsP5Atr3ZLeUWtsX8JRGVrlZp6H3Vfedo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IFtUy6xPpgY1HCKVwPxhL09w/xxKDGg0/YRmJu+UDNFPOZippz4BK2mDDb2zv2K1U
	 U+oNOf02rWfjvZrvCFD5B000wkZnP9GfhEb/Tvb4rJW41ye0xHEuduio9C3kz/EGLh
	 jVzxLiOrbUs5jPq8NH1wj5ZN6MtK2aWA9GPyghipQgtZRPuv2kZy3UCfxcTrNrySVA
	 VsteR4/BE1+2C4oE7DH8oD/ivJugotxaoLUBLqUK4iJyB+ZGfQ/knqzpWepOxY9U8u
	 YOdvZrov2EhPXqEaF4kUVu4dD4v0w0ZoT3+45S+3Z01UweidXoffEmMiSA36AyJFap
	 lOgQemu39w80w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: rockchip: Rename rk356x HDMI audio card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-5-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
 <20260831-fix-rockchip-hdmi-audio-names-v1-5-5b155ae05293@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:59:14 +0000
Message-Id: <20260831175914.A99161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] ABI Breakage: Renaming ALSA sound card breaks existing user-sp=
ace audio configurations
--

commit 09adc9bbc18df386e17d8391018eada18c2a6d2a
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk356x HDMI audio card

This commit modifies the ALSA sound card name exposed by the device tree=20
from "HDMI" to "RK356x HDMI" to avoid collisions with other Rockchip SoCs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd392..98785c812fc40 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -150,7 +150,7 @@ scmi_clk: protocol@14 {
> =20
>  	hdmi_sound: hdmi-sound {
>  		compatible =3D "simple-audio-card";
> -		simple-audio-card,name =3D "HDMI";
> +		simple-audio-card,name =3D "RK356x HDMI";

[Severity: Critical]
Is it safe to change the ALSA card name exposed to userspace?=20

The simple-audio-card,name property in hdmi_sound defines the exact sound
card name seen by userspace via ALSA. Changing this string from HDMI to
RK356x HDMI might break backwards compatibility with existing userspace aud=
io
configurations, such as ALSA UCM profiles, PipeWire rules, or PulseAudio
matchers that rely on the established generic name.=20

A user booting an updated kernel on an rk356x platform using existing UCM
profiles could experience broken audio unconditionally upon boot. Does this
change violate the kernel's policy against breaking userspace ABI?

>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <256>;
>  		status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-fix-rockch=
ip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com?part=3D5
