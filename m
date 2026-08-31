Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52A4CCDD6
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198448; cv=none; b=H6dfwO6jptSwo+2oThmaA/9USfedGDcLa2L0yuqIHwFQMVPayKkLfNGXTF6+6SsbncHe6QjDptf8rgN5xFmRvrlj4gz6hwYHXAyXHgoiyFlKK0BXRvGaCz3XZt0xykCFn7C62h/lZ8/U6PiaMm4w+jLlOhgYQvrshrFsgoGYk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198448; c=relaxed/simple;
	bh=CBtCVjqhKYYFWndYJjCtpo6L2xlHfZ2hJixmofKY/nI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IcmO8n8xqUdlDC12k1fsyhFRyvyoPyko+Syk/v3NKi+tjjxraqdBgCWfUwROy89x4pxLVkWl57U6XqQplivxMKFGQbpQEQbScnzg28ipVdDz0bsQv64IEtmPGRXLBpK9girCKC1IUIv2yxI7/sgMT5KOexvoGJbdf9S/89k5yfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxh7N5+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxh7N5+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66D61F000E9;
	Mon, 31 Aug 2026 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198447;
	bh=wWK0/Qlaz4UTS22gsh0cNg6VIa1bWvsZo3n3N3uIoPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxh7N5+0DIVYEJcAVY7dpp4VRKT2cHxGcFF0oyTav+mGMq855THEppfWRNyRNvUPZ
	 6pLz6xz3my/kUwpd0QpUMBJrgeG9P+ry5Qek3TCTtuIH1LH/keuBg3SMds3PNSsaou
	 L37Nka/D7O3SAREQuS/Y8D+/ZNizJEdJ8nmaAcLt1wrGGDZaX8CtFI6C9tTgcF2J0r
	 GWfV6Dej2IXbOxLjxtGe8mt+59FXHcRoKeapHFZXSze1DkUG21fdotM/W+XbwWLWk8
	 VnyAoPmyAcj1/gpSj3bhYvWOEyyBbC1kP64XS3wBYma06+V/kYrHlTyPbl4JKinpKV
	 E1er6PNVz2Qfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: rockchip: Rename rk3288 HDMI audio card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-2-5b155ae05293@collabora.com>
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
 <20260831-fix-rockchip-hdmi-audio-names-v1-2-5b155ae05293@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:47:26 +0000
Message-Id: <20260831174726.C66D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Changing the ALSA sound card name breaks userspace ABI and backwar=
d compatibility.
- [Low] The commit subject uses the `arm64:` subsystem prefix, but modifies=
 an ARM 32-bit device tree file.
--

commit 3a52d07446ba896b26f24f7276cf2ade84038b3b
Author: Detlev Casanova <detlev.casanova@collabora.com>

arm64: dts: rockchip: Rename rk3288 HDMI audio card

This commit renames the HDMI audio card in the rk3288-miqi device tree
from "HDMI" to "RK3288 HDMI" to avoid name collisions with other Rockchip
SoCs.

> arm64: dts: rockchip: Rename rk3288 HDMI audio card

[Severity: Low]
Does this commit subject use the correct architecture prefix?

The file being modified is `arch/arm/boot/dts/rockchip/rk3288-miqi.dts`,=20
which belongs to the 32-bit ARM architecture, but the subject uses the=20
arm64 prefix.

> diff --git a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts b/arch/arm/boot/d=
ts/rockchip/rk3288-miqi.dts
> index a5f5c6d38f801..090255244c86f 100644
> --- a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
> +++ b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
> @@ -82,7 +82,7 @@ vcc_sys: regulator-vsys {
>  	sound {
>  		compatible =3D "simple-audio-card";
>  		simple-audio-card,format =3D "i2s";
> -		simple-audio-card,name =3D "HDMI";
> +		simple-audio-card,name =3D "RK3288 HDMI";

[Severity: High]
Does this modification break userspace ABI and backward compatibility?

The simple-audio-card,name property defines the ALSA sound card name=20
exposed to userspace. Audio servers like PulseAudio and PipeWire, as well=20
as configuration tools like ALSA UCM and asound.state, rely on this name=20
to identify the hardware, apply routing profiles, and restore volume levels.

Upgrading the kernel on an RK3288 MiQi board changes the ALSA card name=20
from 'HDMI' to 'RK3288 HDMI'. Userspace configurations looking for the=20
'HDMI' card (which has been present since commit 2a91dcd5be9d) will fail=20
to match the new name, resulting in broken audio routing or lost volume=20
states.

>  		simple-audio-card,mclk-fs =3D <512>;
> =20
>  		simple-audio-card,codec {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-fix-rockch=
ip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com?part=3D2
