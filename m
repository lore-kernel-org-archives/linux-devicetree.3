Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531F466B44
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315917; cv=none; b=cZrR8ViRj1peMWmEYu5sG8J2BYdG+GVhP+UcOaymNmrmpR3j21l155eQ0/Z3+HaYWJPIjOJ2z5/T41WP49srGpdxquY33ZODrBP+0uAjF/ck0RIAadqEEeikQDzdcaPSuMxGqc4+uXCuSW2aE29rRQUE7xD4HydYrKFAHp4IK8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315917; c=relaxed/simple;
	bh=UbT2t7QlJtf/Z75jKH+GPE2sbm3QHq703R+0YqQrCAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kVb4zPCjX1QRg7p4ay++rYlatlLzTQuiA0kOw9374zb0NQ1JF2yjQ6XkNTPhe0WwR1bDXwDkwA1hsObqlmPQjhoY4pERDA7AYTZ3bfVltjMgDLZr5OoLbGvPt951Jy6+483ciAyGsusvGcmqiuI42yR7lDmM4GiKTho/7xNoA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oR1aZ5JX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oR1aZ5JX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E3A1F000E9;
	Fri, 21 Aug 2026 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315915;
	bh=kdkAul5/BrQe1t98aqfnzcn9w4iMRwseHRo/wqnMjY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oR1aZ5JXurk1zQaizfr/rB6E2TQE0LqudVqLQM2a78YFiWHOodbb3PMrtFaEPXi5c
	 HThL58Rdv8SuGc8j6xpX2Dk55o4Pnj4oInlwpbJykybQPMTG4tiM1RsuG/VISFQnmn
	 UHF8Gq2FQrWRWa8RA2AN02aemFgdAuFrrcf7Fhu6dE0uDBTORLbBreP0qjAblCr0to
	 aaJMD6hclgiXrtnjdvuXg6qURQnFNcqPMC7Qv3XUb2WET170goQZqg9pT7kt+l7usn
	 ToWY96LCkncyazKNQPFoj0DWLxWb+LxhNjIsWDQ+8d7p7RQgwgcHbh6Q250q+LePZ7
	 CVmy7vMjbov4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-next-patches-v5-7-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
 <20260821-next-patches-v5-7-ec81cee63e09@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:38:35 +0000
Message-Id: <20260821123835.73E3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device Tree Misconfiguration: Invalid `brightness-levels` array in =
`led-backlight` node.
--

--- Patch [7]: [PATCH v5 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T ---
commit b28de55d5a8b36d66c2c9a970672b92796d38f43
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Xiaomi Redmi 9T

This commit adds a new devicetree for the Xiaomi Redmi 9T smartphone based
on the Qualcomm SM6115 SoC. It enables foundational hardware support
including simple framebuffer, GPU, regulators, and USB, while leaving
display-dependent nodes disabled for now.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts b/arch/arm6=
4/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> new file mode 100644
> index 0000000000000..881e05b70116b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts

[ ... ]

> +	backlight_dsi: backlight-dsi {
> +		compatible =3D "led-backlight";
> +		leds =3D <&led_backlight>;
> +		brightness-levels =3D <255>;

[Severity: Low]
Is this single-element brightness-levels array intentional?

If the backlight_dsi node is later enabled by a panel variant, the
led-backlight driver will parse this property via led_bl_parse_levels().
Since it expects multiple levels, providing only one element causes the dri=
ver
to print a "Not enough levels defined" warning, ignore the property, and fa=
ll
back to native scaling.

Could this property be removed, or populated with the full array of expected
brightness levels?

> +		default-brightness-level =3D <190>;
> +		/* Backlight controllers can differ between panel variants */
> +		status =3D "disabled";
> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v5-0-ec81cee63e09@gmail.com?part=3D7
