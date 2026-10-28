Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202238;
	b=Ps4q1qz9kDOjMFUncIkD5B2E7J9RgtA+LBAk5FrIvjTUQqmBarhVbr0TDJyR/dAIW1X1
	 y4noQ7Ml0YXI0mbI4oaH8KQOK54IbBhNsxq16TqsID9bDK2w9ryAYnDJsluihHtIrk5/l
	 Y/7vtmNLSrT/3XLyliqHzRedMnrNNEaW8dvQz37Lwu6BZqPMOpi1sHj923u3x5Wj00n4r
	 SCc89rrI5K3jRSGQGTjtVDRoELbUCYCwtC7MW+xr5c9//Wrp93JTM1EAIdmECYAXj1Xtq
	 8rG0Q085enHAuYX8pKTWSyywaToPs3883LpZruvi6iUp/fs5qyOrgdurmRKn3WPAYYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202238;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5gdexv3C1uXwJAZanEeG/Yc3tdd0jwBphg9r+zr2678=;
	b=uzl2LFfvAQbzPSTBAAb7tZEQXvcUJoLW+eIT4o2Qh0HAcEHhMBnUVQ5/t3mpPoyMe9p1
	 srJE45rX5oL5op35AJNTwofE+wpAW9FNVdoMb3DIgq6blE/Z15WIaceBOEKQtNALMtJYG
	 YexkJdQakzlODLl9v6ck5C047RydHW0aJg7F8gxmLHQiBvN2/1s2x94CRm4MUCtYnKSMC
	 RrncifF78TG83g5+fg4y7m0GV3pek4gp/UWYoJLzoUwqu4anwk8nytaKybF2oUCfhRo2K
	 +GFgJPRv6IMeTvN2DrULCu4GDch5fLxHZRs9mfoI0IG0Ou/EYhStHVNlIKUyG+eKI+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cs6fHKpp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D737606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cs6fHKpp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095B61F031E1;
	Wed, 28 Oct 2026 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793202238;
	bh=5gdexv3C1uXwJAZanEeG/Yc3tdd0jwBphg9r+zr2678=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cs6fHKppR+/B18skok26QAUziJHXqa0LlQ91XBJlnZCTpdR71W46eox9RzNMkZdkH
	 FueTpjnDE3R/tPCGL9UIf9Kt1eeOi7a2tCFrbw7330ORJOYcLZyDWBpLqQO7j1IilY
	 3essB3D/URHsXRvbcoQiXIrheQlECanxVhMZTCqcW1ESkirqGX4YGKd2xnig5otahm
	 h9NwpBpeFNrSmDfs5oqMMB7qbuDm/kEuUgmLiVtJwMjjqjSi7KTPSP+s0RDptoTzD9
	 162vGoAc8hMUHx5TTuixMBIdM/r21qDap53ZS9CNr1VpGc2wDwLCB51vj4XpO7++vb
	 Otyqiso+g8A3g==
Message-ID: <sashiko-outbox-188069@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] powerpc/dts: Add Device Tree for WatchGuard Firebox
 T30
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lefteris Koutrakis" <lefteris.koutrakis@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028153702.4287-1-lefteris.koutrakis@gmail.com>
References: <20261028153702.4287-1-lefteris.koutrakis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:43:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] powerpc/dts: stray closing brace in firebox-t30.dts breaks dtc build
- [Low] powerpc/dts: undefined gpio0 phandle in firebox-t30.dts breaks dtc =
build
--

commit 75dba0f2ad965f2d5da4392dbd577cbd573b988a
Author: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>

powerpc/dts: Add Device Tree for WatchGuard Firebox T30

This commit adds initial device tree support for the WatchGuard Firebox T30
board and enables building firebox-t30.dtb under CONFIG_MPC85xx_RDB in
arch/powerpc/boot/dts/fsl/Makefile.

> diff --git a/arch/powerpc/boot/dts/fsl/firebox-t30.dts b/arch/powerpc/boo=
t/dts/fsl/firebox-t30.dts
> new file mode 100644
> index 0000000000000..318430a570490
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/fsl/firebox-t30.dts
> @@ -0,0 +1,378 @@

[ ... ]

> +		enet1: ethernet@b1000 {
> +			status =3D "disabled";
> +		};
> +
> +		enet2: ethernet@b2000 {
> +			status =3D "disabled";
> +		};
> +
> +		};
> +	};

[Severity: Low]
Does this extra closing brace after enet2: ethernet@b2000 break compilation
of firebox-t30.dtb with a dtc syntax error?

Because all previous child nodes inside soc: soc@ffe00000 have balanced
braces, the first closing brace here closes soc: soc@ffe00000 and the second
prematurely closes the root node /. As a result, the subsequent leds,
pci0: pcie@ffe09000, and pci1: pcie@ffe0a000 nodes end up outside the root
node, leaving the final closing brace at the end of the file unmatched.

> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led0: led-0 {
> +			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
> +			color =3D <LED_COLOR_ID_ORANGE>;
> +			function =3D LED_FUNCTION_STATUS;
> +		};

[Severity: Low]
Where is the gpio0 label defined for the<&gpio0 ...> phandle references in
led-0 through led-5 under leds?

The SoC GPIO controller stub included via p1020si-post.dtsi from
arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi defines the node without a label:

gpio-controller@fc00 {
	#gpio-cells =3D <2>;
	compatible =3D "fsl,pq3-gpio";
	reg =3D <0xfc00 0x100>;
	interrupts =3D <47 0x2 0 0>;
	gpio-controller;
};

Since firebox-t30.dts does not define gpio0: gpio-controller@fc00 under
soc: soc@ffe00000 (it looks like the node header was removed while leaving
its closing brace above), won't dtc fail to resolve &gpio0 when building
firebox-t30.dtb?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028153702.4287=
-1-lefteris.koutrakis@gmail.com?part=3D1
