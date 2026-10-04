Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2193B19B4
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094879; cv=none; b=uu2J9hwZ4x/NMsfGk+tI+UZa1JsLykb2bmuqdUwcipQazRCK7ThslinhWM2jDASzUYE+JZy9gTPHJ4aSjDVbvkmbhKQmcYseUUYzjWyJHVM3LU7MY6SWQAns+lvpAVoljZINe6nhCF8v4lOmqN3ytLzByJiGyY4pg/dzILKC3SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094879; c=relaxed/simple;
	bh=SnDTN+u4dFSU8GJ9tsJRGMuDe3etaZUHUu+94jl6Nts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qWn0aQDiEajhNlfHtruzIxHpBqEJV4V/mO1BvsX5RZ6xNMxPr4FXnM+MdTCEh0P31aK4hY8mwuiUNYUJz0Th6263/1hv7ReAroNSlYLMAXAd06uhOitdEWey3vUjlXOoYOY1NiO9F0Wfu2t/wT1djcAUYlK0WteDF07Zcg2BriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdY0M9gy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdY0M9gy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880AB1F000FF;
	Sun,  4 Oct 2026 06:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791094877;
	bh=AlcFA74e3nc3Z0Am0ZUkkR7fCwoGFfpjj+vOV8OIg+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SdY0M9gycXOjsjzCgk3ToPr1UVP0WntkuBBWB/XC/Y9AqUSRW3xDyGywwVWGw8E6B
	 7rtgcHtHwaDoKvyTePnu15wN7CzffvyUAf2KYng4RfOAhNffxiC3or4AppNh0+Sn1E
	 l+mmdV6wFT6+tvvZv2r+sWD9XpuDIKdundNGbsSQevmdYV43lhGPbS0cD2GbsiSB2U
	 RPQjH6s+vYftEhkIeVMQtY9R2ktyjY6OPX66Y8L8FsfSnV/Fl5b8MNS7mwI/ERe/Gv
	 9wVZkc7XdN66ABrblr2Yaj54CuukEEEg8Qnzw9pHqe1X9/4xvFbV06WWAoSAm8xDKT
	 /Hb67o0vE/WLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset
 jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:21:17 +0000
Message-Id: <20261004062117.880AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: missing compatible fallback for j457 macaudio
--

commit a6a8b80fc66fd2ea6915047fd678103277b8c956
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8103-j45x: Add headset jack nodes

This commit adds headset jack nodes for the M1 iMacs and advertises them
to the machine driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/d=
ts/apple/t8103-j457.dts
> index ebddde75455c6..d8ea6bb53b3f1 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
[ ... ]
> @@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
[ ... ]
> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j457-macaudio";

[Severity: Medium]
Does this compatible string need "apple,j456-macaudio" as a fallback?

The ASoC driver sound/soc/apple/macaudio.c does not contain
"apple,j457-macaudio" in its of_device_id match table, and appears to
expect j457 to use j456 as a fallback. Without the fallback string
in the device tree (such as "apple,j457-macaudio", "apple,j456-macaudio"),
the platform bus will not bind the driver, which could leave the J457
iMac without functional audio.

> +		model =3D "iMac J457";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		dai-link@1 {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D13
