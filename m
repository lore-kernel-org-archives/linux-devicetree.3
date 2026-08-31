Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE586442396
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198580; cv=none; b=lh+uvudXi1+Bd6UgK3cf4hp/zOBp76nWZtqvFXh68tOWi6r4ruwBrqvmmFwRHiFc4Gr7lOm03KxqVIfk5oaToOq8yuRtvgCfueDQ/QyPYDzhgzM2Gy7oIRrorDIh0QEetBDrhukYTqkb2kQ004Eoz8py8QaNlTXyrvjustnE84k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198580; c=relaxed/simple;
	bh=kIQjAX2hpp4MUQYR5d448dFtVMmFRvD1Lc+Ozim7Qjw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bnQZ0Ndy6mQwB6R1QQgO+i03omp7oJ1cjIgSvR6uYbcKg59Xu1xrlv672K+KB6WT9Bw4qqFE1BzhZbsxH+LiOlNPfl2lZqVPvYH14djeqWCuEa38LSm51E9X1NlZfYiTWwiwh3ahKUjy4OF7R7Nl7jeFMJcHkdJNv63u5tmdOno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9XRG345; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9XRG345"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E4D1F000E9;
	Mon, 31 Aug 2026 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198578;
	bh=wwaFKayDO9d7FgavknJEBVvehYGbxfCU2NwTw5Oroe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9XRG345XBLLsAUIneYAEre6fu/cZkAAabpBBucJ3QxrjR26wnFKbcH3eVx7iheld
	 UAozayacDgUtUEh9p4P6Q/m4Y89QlxfQ1c2PvSwUg/DVbz4ANAGdQqw0KEvpoXTP2L
	 eR9VtptkoXploqajfSh03fqtJ/n6vNsc2sCtu5TGN8ZorsqfXIjCROoD0QvyD7gp0C
	 t5+kvaEG8jFEGOdhbDavzT5Uz6O2KkK+SkjN6PjmSxMz1gEZpd+PtZe90hMPrcJt52
	 MAn5dM7Z9akjD3Pu1+PO+FyWRgg6SQFHz8nnzxXTx6jZx1t4sHN0BuUu9NcoladU2X
	 7li4cAItDZ6JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: rockchip: Rename rk3328 HDMI audio card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-3-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
 <20260831-fix-rockchip-hdmi-audio-names-v1-3-5b155ae05293@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:49:38 +0000
Message-Id: <20260831174938.A9E4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Changing the ALSA card name breaks existing userspace audio co=
nfigurations.
--

commit 81852803c5b1ff9241b2ba92674226713005891f
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk3328 HDMI audio card

This commit renames the audio card for RK3328 from "HDMI" to "RK3328 HDMI"
in the device tree. The stated goal is to avoid colliding with identical
"HDMI" strings used by other Rockchip SoCs in user-visible ALSA fields.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3328.dtsi
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -207,7 +207,7 @@ hdmi_sound: hdmi-sound {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <128>;
> -		simple-audio-card,name =3D "HDMI";
> +		simple-audio-card,name =3D "RK3328 HDMI";

[Severity: Critical]
Does this change break existing userspace audio configurations?

When the system boots with the updated device tree in hdmi_sound, the ALSA
core registers the card with the new "RK3328 HDMI" name. ALSA state
restoration tools (alsactl), Use Case Manager (UCM) profiles, and audio
servers like PulseAudio and PipeWire rely on this exact string to identify
the hardware, load appropriate rules, and restore mixer states.

Since this sound card name has been established in previous releases,
userspace tools attempting to match the old "HDMI" name will fail to apply
their configurations. Modifying an established user-visible identifier can
constitute an ABI breakage, causing audio regressions for any system using
the RK3328 SoC that upgrades to this device tree.

>  		status =3D "disabled";
> =20
>  		simple-audio-card,cpu {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-fix-rockch=
ip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com?part=3D3
