Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA7A3D45D5
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219605; cv=none; b=VGcBFCTwjTjLdg36asqDBn9oR5dnjiDqOutJ6XpLecq8ckHGbxbnGu6nn7SIot1SI0Nhh9poxtVZt2PI7j/pGXJV3g06GVuBXH8q2Gh19t+BjKoO5xWlKlgG91Z1SZXzHP7ACwzfc78Iytm5UGCCMwtnDrr5FWGSyIogbjyr2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219605; c=relaxed/simple;
	bh=R9W7uo36H1LQeAsfi691uFHU3m45XIWkk47z9IUEYlg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uTMGsuMNLnr2tErwFCPaLxbF4hDFozg7KD7m0aO8gOr5CRs/6b9cTtBh9aZ4OL269k79eEEolfQnkQhpgMw4DlorJP3ie5gHyEVUTWtwEB67LJpBu6G/afpz//UALZZhikAYd7bjCMvJQIjv4G4/uDq7r+ZA32ghVHGKhFcoCxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPaBgz98; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPaBgz98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810081F000E9;
	Thu, 20 Aug 2026 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787219603;
	bh=dqB7hs0bUVSujLWvZELTyhX25nXQNlnc3/R1WvBjkwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NPaBgz98IZUJ3b5KAJ4E6DLrn/HStEoTeVj/QotCbt9NclNTgnpitpI1903/hTh0x
	 2krm5tej2EjqUjegpXWpmg/WndGEOwVdMMclujvvaqmJWM5Zr/7te/ixodTJ7aS5xD
	 jxp/xKqo/uhZM9uI4GX5vhK1CZ6fF+ie7htIMn1nGE8F4aaYEG60ZzESxVS+hl+6Hm
	 Dvrj59dsHR0GtqscCeBZh8f5mJsbmqIbyMX1mnigmYcwofPxfM8KXl84aWXHMAOGs2
	 CPrH7pk0hpu4NU1WOpzUBLVdveade7BLW+nD1MF3s0dEFtURaGdvYWvfzUD4sk1ujF
	 Z0EKyhqjsdqPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820-next-patches-v2-7-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-7-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:53:23 +0000
Message-Id: <20260820095323.810081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid `brightness-levels` property in `led-backlight` triggers bo=
ot warning and is ignored.
--

--- Patch [7]: [PATCH v2 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T ---
commit 98a4b41cf18b5589a5dbba3f7c9d120fe90da54f
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add Xiaomi Redmi 9T

This commit adds a devicetree for the Xiaomi Redmi 9T smartphone, which is=
=20
based on the Bengal/SM6115 SoC. It introduces initial support for features=
=20
like display, GPU, regulators, UFS, USB, and remoteprocs.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts b/arch/arm6=
4/boot/dts/qcom/sm6115-xiaomi-lemon.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts

[ ... ]

> +	backlight_dsi: backlight-dsi {
> +		compatible =3D "led-backlight";
> +		leds =3D <&led_backlight>;
> +		brightness-levels =3D <255>;

[Severity: Low]
Does providing a single value to brightness-levels trigger a boot warning?=
=20

The led-backlight driver typically expects brightness-levels to be an array=
=20
of multiple values mapping an index to a brightness level. Providing a sing=
le=20
element causes the driver to emit a "Not enough levels defined" warning dur=
ing=20
probe and ignores the property completely.

> +		default-brightness-level =3D <190>;
> +		/* Backlight controllers can differ between panel variants */
> +		status =3D "disabled";
> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-next-patch=
es-v2-0-7130d68183d9@gmail.com?part=3D7
