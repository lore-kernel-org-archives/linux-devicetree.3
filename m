Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA048F03F
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047493; cv=none; b=MV8dn3v2Il6ZbB09n2/Z+LTe11LGud9EZ/8kGsVZgl+b1ymWOxMeFXp2BsGpKD07xxiMHkNEcVsEHrZSyZroA7M+Yvh//WCb8lbOcHaGoScyY2lZ+Vejjm6fUvY6SkYslxz1bUrma4yyqhubQH+ty0cow/Bs4rYGaz2KMhZU6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047493; c=relaxed/simple;
	bh=I3fsnqxF93IoSkkBMh+RXIjhd8HLpot5tRCSzLHYWX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=if0YIm+0VBa3TozeGdYZn8RBg2djrVrxT8LI3RIgLoNXB8pXTHUwWpcJ1pGbDf/5tlN+pgUHFRCyxN8zF7iYfjKMvZSZ0gbPpT2mhaLzCNdPoQPHOOHjK0aPkrbVq1ysOWREQTx8sTREi9DPc5oLmR8eHYAMUfd7Okj8dw8ygBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNuNjgfi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNuNjgfi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C131F000FF;
	Thu, 10 Sep 2026 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047492;
	bh=pkLpXZy67GRmAwCNXO5cfnWtcV3Ui0HjZ7xo1AaNLdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNuNjgfiGXG72Y2REVYRMSdT3bzr6B5GvCQpc/D/WIClgJC2eEl6B5hJcOIyjtovf
	 7jSNSztYHuL/oawaM72GBhGKvhHMe2iKIo3ntVqHidB8GcorwsBW35DrrJizU3iad5
	 z/FRWbApy7taJDnrYkqkW6w/ptlTDwGrx27c8NcQiJ2p9Z3A/bPna3SEtmFgmUOGqd
	 8zISwZuqDhMqhRA8qCnj2uVs8mFNsNjyKDVDSnkGQb4AuNFS5da+xupv0eM0eJbdtS
	 NfNBddCh7JyCz4+kTwVNnC3I3ssnZkuJcN83Hx4lzXlaumSXWdntccXGjafBmxpX88
	 ZQprE1V38al8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] arm64: dts: rockchip: Rename rk3328 HDMI audio
 card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-4-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
 <20260910-fix-rockchip-hdmi-audio-names-v2-4-1396a6168e20@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:38:11 +0000
Message-Id: <20260910133811.B7C131F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Changing the ALSA card name breaks userspace audio configurations =
(UCM, PulseAudio, PipeWire).
--

commit 7fe8827d3d20fa7fbaa3bf5003d353e243e34147
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk3328 HDMI audio card
   =20
This commit renames the HDMI audio card in the RK3328 device tree from
"HDMI" to "RK3328 HDMI". This is intended to prevent name collisions in
ALSA fields with other Rockchip SoCs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3328.dtsi
> index 03b7c43137506..26c9f4558ed9c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -207,7 +207,7 @@ hdmi_sound: hdmi-sound {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <128>;
> -		simple-audio-card,name =3D "HDMI";
> +		simple-audio-card,name =3D "RK3328 HDMI";

[Severity: High]
Does changing the ALSA card name break existing userspace audio
configurations?

When the kernel boots with the updated device tree, the ALSA card name is
exposed as "RK3328 HDMI" instead of "HDMI". Existing userspace UCM rules,
PulseAudio, or PipeWire configurations expecting "HDMI" will fail to match
the expected sound card profile, leaving users with broken audio.

While this change resolves a name collision between different Rockchip
boards, altering the user-visible simple-audio-card,name alters the exposed
ALSA card name and constitutes a userspace ABI breakage.

>  		status =3D "disabled";
> =20
>  		simple-audio-card,cpu {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fix-rockch=
ip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com?part=3D4
