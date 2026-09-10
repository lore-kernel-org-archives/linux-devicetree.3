Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF38549C4C3
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047877; cv=none; b=rCbJ038rj88jSQd6O7oVVWnmvn6f6mMb6tocMqcwkG0HxWO5Z/LzmM1LR7tjI+jjhSWBmOsI25mStFtcNBNmRxTwtF5hy8ZKq2FUMr/6yj214ybuz1bwGS57AGsVC39frmcpght+MXFpR4EbwiWbz92Iy9JQLwQ73xgfCCHYdns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047877; c=relaxed/simple;
	bh=xpTMcC5oD3NoVpJK6gEyTl7/Y9ZTae1yFucyPTYBmN4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hyQDED8QJzPkYnHYqbKAOf3L9MX4PWoBfwtU2EnrF9LMgrpmfpMWFqB7iiLCMbnMSrlMDk7yUquhKiJejvxvLU4F9AZ+paAQ3xEISzzUFQAwAZazu/C2+58KDjPtTg3bFK7vtkt3Ze+tDDNlryTyMevx7fG0PpGDDNtbAPfjENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mafvJmBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mafvJmBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1F91F00893;
	Thu, 10 Sep 2026 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047876;
	bh=qG8RLXtztidtNwcqRfTkcziDNJesbM7tK7YbTQZAhLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mafvJmBl3YqH5W0aBp1bnmQmRuiIpM24scD8EQjdWKhKZeYdlEjCLQEtlUHKP1mbF
	 j0sKlEBYJBPgc7HZNVP7qgubSlofe8ZWc2J1ks3YCuTlXnNE4gdesXqr3DNXjR86ty
	 QKedVzz9yv9BjW0sWKhNdy/qmnPmbqnth3hNu6itCASVvgEC5da1qQUVs2ZLAf7OP5
	 Hm+toml8TAO/N8qjBdo7nLgE/exN6lOooyrPZrSfQYYdkNsjYliPZKLlff0eJDFpF7
	 g2iE1Yy9m8LRedJRVRzldXwrUYn+jaDnA6wkqm798qUyrloYj/pLJbztitCRE6ZgVG
	 H3wxyFYaEzIrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: rockchip: Rename rk3566 and rk3568
 HDMI audio cards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-6-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
 <20260910-fix-rockchip-hdmi-audio-names-v2-6-1396a6168e20@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:44:35 +0000
Message-Id: <20260910134436.1E1F91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] ALSA sound card name change breaks ABI / backwards compatibili=
ty with existing userspace configurations.
- [Low] Missing semicolon at the end of the `&hdmi_sound` node overrides ca=
uses a Device Tree Compiler (DTC) syntax error, breaking the build.
--

commit 544b3c713c02b4d695c704bc8f12f60bc89bcc82
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk3566 and rk3568 HDMI audio cards

This patch moves the HDMI audio card name for RK3566 and RK3568 into
their respective dtsi files. It updates the card name to match the SoC,
preventing collisions with the generic HDMI string used by other SoCs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3566-base.dtsi
> index e56e0b6ba9411..0086ff49fee23 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-base.dtsi
> @@ -6,6 +6,10 @@ / {
>  	compatible =3D "rockchip,rk3566";
>  };
> =20
> +&hdmi_sound {
> +	simple-audio-card,name =3D "RK3566 HDMI";
> +}

[Severity: Low]
Does this missing semicolon cause a Device Tree Compiler (DTC) syntax error?

DTC strictly requires a semicolon after the closing brace of node overrides
at the root level.

Without it, a build failure occurs when dtc encounters the next node token
(&pipegrf) in rk3566-base.dtsi.

> +
>  &pipegrf {
>  	compatible =3D "rockchip,rk3566-pipe-grf", "syscon";
>  };

[ ... ]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..efc1edff1e15d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -382,6 +382,10 @@ &gpu {
>  	operating-points-v2 =3D <&gpu_opp_table>;
>  };
> =20
> +&hdmi_sound {
> +	simple-audio-card,name =3D "RK3568 HDMI";
> +}

[Severity: Low]
Is it possible this missing semicolon also causes a syntax error here?

Similar to the rk3566-base.dtsi change, this introduces a fatal syntax error
when building device trees that include rk3568.dtsi.

> +
>  &pipegrf {
>  	compatible =3D "rockchip,rk3568-pipe-grf", "syscon";
>  };

[ ... ]

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd392..1a4562df20ee5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -150,7 +150,6 @@ scmi_clk: protocol@14 {
> =20
>  	hdmi_sound: hdmi-sound {
>  		compatible =3D "simple-audio-card";
> -		simple-audio-card,name =3D "HDMI";

[Severity: Critical]
Does removing the established ALSA card name introduce a regression for
userspace ABI compatibility?

Changing the ALSA sound card name from HDMI to the SoC-specific strings
breaks existing userspace ALSA UCM profiles, PulseAudio configurations,
and routing rules that match on this exact original string.

>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <256>;
>  		status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fix-rockch=
ip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com?part=3D6
