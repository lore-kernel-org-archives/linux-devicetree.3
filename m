Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74DE3EDAA0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415020; cv=none; b=qVu9/kpBup03aYtpok8+4sGBOoePRnNJwDWnWrLQ01+VcNTgcCrsfRGqo6LeYboVJf4uwk+9AeM6KxZTGQYL6NRpqvI8cxe8RSpOnpjM31isJWwqm2WgqJohHeoR0g76W6eaQuQBYcVVTLhbbeqIKHKBTpRPTLf5wME6cZVMq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415020; c=relaxed/simple;
	bh=ADgvuRsNK+X30SsDnPdaxnhDKb5ba6imAgOcuJLUuek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GVI65klSM/OP442qI2Dlg7DXm14t4NN9rxiV/RTKFpI/fT/SCQsO/l+tj0gLwKpS6EfbWJ9O5CxbSDwny3Bl6CHyFfFGm0Ja86Z1g2GB04gr5RfZhdc9IVw+xiBMraUKi+6I5Hd2cwp9fh9wOa7hNGzVr8kuQkuPh3rVTfF+0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBMskQZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBMskQZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8327B1F00893;
	Tue,  2 Jun 2026 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415019;
	bh=2IrBNlN0+Zr9bDz4D9tZT9jTUhzY22H7N+08VufBkUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SBMskQZTTNZVq0tCVHzdeGQscDo2/ircWdOew3ZHtPwEqPCfOLnk5ICAkHzTt+08m
	 TCwsM0Q8vT7MeHBJUVFTDoOiifavsws0qHJtEEzH7RpOSgS5az4sMGqNuSxxlRFN8Q
	 2EJSbb+nOjAHhye0lkPuOaqS+vDn3xjgyyonXgdT8qZLr1VAyqSg/9GSXS/iAFawdW
	 ltYqfWjSAvijvqQN2agJnoWv7YH4Fweq8MIaijwXeQe+iVYBLCC3EmfRjx4bDwYpQf
	 aXg9ZuX+/W9LoJlPN6WiW4TE/0fUbxRcSWSFzQGm3K0xeCtvNHJwtEBgcQIkemi2/g
	 milDqDnywq+7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: renesas: r8a779g0: add MFIS node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>
References: <20260602153504.302388-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 15:43:39 +0000
Message-Id: <20260602154339.8327B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `mfis` node violates unit-address sorting conventions within th=
e `soc` node.
--

commit 103116fe94a9708e753fa97a039cb6fb2fa2c53c
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
arm64: renesas: r8a779g0: add MFIS node

This commit describes the MFIS core used for inter-processor communication
on the Renesas R-Car V4H SparrowHawk board. It adds the mfis node and its
associated interrupts to the device tree.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 82a7278836e57..3cff822fc609a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -603,6 +603,23 @@ tsn0: ethernet@e6460000 {
>  			status =3D "disabled";
>  		};
> =20
> +		mfis: system-controller@e6260000 {

[Severity: Low]
This isn't a bug, but should this node be placed before the=20
tsn0: ethernet@e6460000 node to maintain ascending unit-address order?=20
The unit address 0xe6260000 is lower than 0xe6460000, and standard=20
Device Tree conventions usually require sorting nodes sequentially.

> +			compatible =3D "renesas,r8a779g0-mfis";
> +			reg =3D <0 0xe6260000 0 0x10000>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602153504.3023=
88-2-wsa+renesas@sang-engineering.com?part=3D1
