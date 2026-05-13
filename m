Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF492D29C8
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778716270; cv=none; b=PTti/nllAFT56s4IEuOgszrdfdNsjpnLKmKK4lPJlH3l52pYNNzOcl4J1XviC/TNsPRzxTd1yOmsm360EY2igG+aU4jMP4qKcJoaXR/fjY8vPiWp3L7+mTHIiClJQceutCv7DglQnY8//fPklhJjyUqm5aR/LYpWMc8WDRdSqYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778716270; c=relaxed/simple;
	bh=bJsu9fX/vKAyQ8XrHacGwoL80Qg1d2eIjE1CZlHvNnc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=peTE1J5PEbMSswtTzggX6ywqE98BNASndezTag9d1PKb9+Amj6QpE7uUxl/30zzYZsZZ12aFOTW2VqCTq8nibr5UcqvEZrJ9oNspWmXWtdMK1br3QH4EKlRcen/Y54C2UyIFei32KFPBLvt2SkXPVyYpA599eFNJ0uFfyw4jWVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4Vw9Ok9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4Vw9Ok9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9413BC19425;
	Wed, 13 May 2026 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778716269;
	bh=bJsu9fX/vKAyQ8XrHacGwoL80Qg1d2eIjE1CZlHvNnc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Y4Vw9Ok9NZVDO0pPpZ0PBmDbJIIv/U/kVNtvHRW0P1egZxlQ+/gvlxvBMSEvh4/GX
	 GQJ2evluDruvXjiA8Q5ryBcG0VyT1h05JFcZVBDr8xVydLNMJnMD8eNXmwSlHlKBFE
	 OVAPNOdjq3MrGVqMvVSZ2b0xK8htBCTWbzj8VJyyDZ5LtuDWjVw1fhEtlfl59jarmL
	 01Jhcx8zHUBPmiJr6IbBPvw02v3KTWmwBoV9xS0elyvbIlU5tikRSs1fHtUX1Hrsnh
	 VC6YOr/H8NDrFOg1jo3jFbgk/tcSfpkyQFCe4rDhfsRpc/6sKjgX8UI+7qUjOXVYkJ
	 vpem0i8CpV5Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:51:08 +0000
Message-Id: <20260513235109.9413BC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The child node of `pwm-leds` is named `status`, which violates the =
DT schema bindings for PWM LEDs.
--

commit 4d1f2b73cb8a598488da21baaa8d88280487e6f6
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED

This commit adds a new pwm-leds node with a heartbeat trigger to the VIM4
board devicetree. It also enables the pwm_ao_cd controller and reorders the
xtal-clk node.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dt=
s b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 69d6118ba57e7..c41525a34b721 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
[ ... ]
> @@ -60,6 +53,16 @@ dc_in: regulator-dc-in {
>  		regulator-always-on;
>  	};
> =20
> +	pwm-leds {
> +		compatible =3D "pwm-leds";
> +
> +		status {

Will this child node name trigger a devicetree schema validation warning?

The PWM LEDs device tree binding schema restricts child node names using a
pattern property. It expects child nodes to match the regular expression
^led(-[0-9a-f]+)?$.

Since this node is named status, will dtbs_check treat it as an invalid
additional node?

> +			linux,default-trigger=3D"heartbeat";
> +			max-brightness =3D <255>;
> +			pwms =3D <&pwm_ao_cd 0 30040 0>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-add-kvim4-=
sysled-v1-0-7178719a43e7@aliel.fr?part=3D2
