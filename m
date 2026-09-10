Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A033B97D
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047625; cv=none; b=iPp1bJYT4iBp6vLWR0Vw+WP8ad7GZtIh3thYtg2omKusx27O10bzEX+MgPesJHExqe+AZl7yUdjJc6LYKXd27Xwpsv61pi+VO2f64xA+IhnY8yXtMwdkenwklL2Fs7wZO+2dYr/H/woUqSsmUG7b/a/JVgRy2yzHLejNBQOCRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047625; c=relaxed/simple;
	bh=ZVqhyUyXQYNVT+z97I/I7vh5jsHVtFJcH2XSvENEECY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HMh1RvHoJU8lPm0kA1dk4GavBC7n+J5RVc350Qx7cDZmbpKPUAtgPR1eGEqhJfwFbK2JebUiu8yd10vy4Fo0LJMq419jfuibT8+bYBPnq8UK6tGWQ563e/h/BrzyE+oiRaU0QdW+SSJP2IxYc+WKQb/tySWhcj8biaCoq8yYARs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3VLOusu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3VLOusu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDD41F000FF;
	Thu, 10 Sep 2026 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047623;
	bh=YHsv+xzMRepljJBiBRgaTIe3ScYiN5lXYgdULgyTNBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D3VLOusu5Qey8nmPEKys7A5JY84V75+miBOgu4hm8SYO1/r84Bw0MOu/JMrcQgRoP
	 Johzha9BdVWBL8y2CO13JmSQql4a5fSHgMpy9VVdG8gfmjdCNqZa8qIA+dtVoAej+a
	 Fuiy0GmGWCjdV5t+RZoS285Qdy+23kYyMB3XWpyWakSelmrmc31yZxuVKiLxniKxxg
	 /txlXYXbxgCry3GRxapnTbTXiAP6f9UNzhmoOWalWb8RQdChYo5izfjPNBRTLaDjag
	 VjUDNOG8eCF3Y60F//0Ef8sxhBHXvGyiH/GQRMdYiZR91AkLnkcSRRaz+3TBWTx02B
	 DBL4Mb2qFethg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] arm64: dts: rockchip: Rename rk3399 HDMI audio
 card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-fix-rockchip-hdmi-audio-names-v2-5-1396a6168e20@collabora.com>
References: <20260910-fix-rockchip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com>
 <20260910-fix-rockchip-hdmi-audio-names-v2-5-1396a6168e20@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:40:22 +0000
Message-Id: <20260910134023.1BDD41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] ALSA card rename causes userspace ABI breakage
--

commit d2106b3a23ffdceb3724e809b448fcb65bba2229
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk3399 HDMI audio card

This commit renames the hdmi-sound ALSA card to "RK3399 HDMI" in the rk3399
base device tree to better match naming conventions.

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

[Severity: Critical]
Does renaming the ALSA card cause a userspace ABI regression?

The simple-audio-card,name property defines the ALSA card name exposed to
userspace (e.g., in /proc/asound/cards and sysfs). Userspace audio services
like PulseAudio, PipeWire, ALSA Use Case Manager (UCM), and ALSA state
restoration (alsactl) rely on this exact string to identify the hardware,
load correct routing profiles, and restore saved volume levels.

Renaming it from hdmi-sound to RK3399 HDMI might break this ABI, leading to
broken audio configurations or lost mixer states on kernel upgrade without
proper deprecation.

>  		status =3D "disabled";
> =20
>  		simple-audio-card,cpu {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fix-rockch=
ip-hdmi-audio-names-v2-0-1396a6168e20@collabora.com?part=3D5
