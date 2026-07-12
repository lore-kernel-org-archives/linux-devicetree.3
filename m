Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197762F39B5
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849941; cv=none; b=A38o3xa4ZnbNNDcdrGqwccH4zPeoBshBknlOQBB8WdL69Tw0mVi70uxK3VvQvuRFRC3t96wjlbbGwl24e9hhqsL/PDEi+tdIrZ3DP2EN0zRTr/QF6HlIe9Ni7dyXuHexxLZ1i85d6rkluEQisBBV6I8Fn8x+7KZOS6KVhCpkFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849941; c=relaxed/simple;
	bh=MrzkTauUQCr6sN8d+/BSKqJaYDRaFlC9T5n/NsxGx64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JCqwnaLyOYb31emQNGseJ/X5VDlaFtqBGVP1qWSg8m6bmdmvp6hr0I/rHTh3qRoUhntvtHaZbrcILfcOfmbYbMnIKtwwA4KNddSvZ7dW6Hi3KPqmhh8ISHA+hqlLO/xnf+v24h3Q6fzp31TjDzg/dAMhkQpB7k04/Xf73431oNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxLGXV14; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxLGXV14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965CD1F000E9;
	Sun, 12 Jul 2026 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783849939;
	bh=Ofxh8Rp0hgB2Nimi6uutsUDrPGmS7KganYLRaNWqfV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WxLGXV14BFzs9B8EfHcg0fUW+9BHnQhtQMU+rm5erkqfqmYuvi3OVl7TOqoc4/U3S
	 kQaV4IBBgFy7FEi6llMxV1ZX3pmB/lGj/PxvyJbTUOUSGHk/QkBIb9PDpUbkBEVcML
	 W9TLxEOA2TFXsJf/rQlDe2wdtpVCRjSiLgM/ho/avgjt++FKbcrQmsY2sfkBZjInjV
	 vnGMyRR32DIaTvQDyWFMdV4KUb7ydsvcYhkYBzptD2KxJVIl/nDCQu5HVXatwoxlWJ
	 iOZPU4kQssU8N0ZHfI3qYWJKJtoyOi6pS5rhT8IlS078r16ipBu5JjnAqME6uSbhvL
	 PTuKykx48+b7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/12] arm64: dts: apple: t60xx: jxxx: Add
 device-specific SMC hwmon sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260712-smc-subdev-dt-v1-12-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
 <20260712-smc-subdev-dt-v1-12-7763006d57c7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 09:52:19 +0000
Message-Id: <20260712095219.965CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] M2 Mac Studio models incorrectly include the single-fan hwmon co=
nfiguration instead of the dual-fan configuration.
--

--- Patch [12]: [PATCH 12/12] arm64: dts: apple: t60xx: jxxx: Add device-sp=
ecific SMC hwmon sensors ---
commit 9b6661d8907736a04d8f29e1718ac346ff51ced8
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon sensors

Add the device-specific hwmon sensors for select T60xx-based devices.

[ ... ]
> diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/=
dts/apple/t6021-j475c.dts
> index 533e357748746..82689c380cdf2 100644
> --- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
> +++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> @@ -35,3 +35,5 @@ &port01 {
>  &pcie0_dart_1 {
>  	status =3D "okay";
>  };
> +
> +#include "hwmon-fan.dtsi"

[Severity: Medium]
Should this M2 Max Mac Studio use hwmon-fan-dual.dtsi instead of
hwmon-fan.dtsi?

Using the single-fan configuration might cause hardware monitoring telemetry
to miss the second fan on this device, leading to incomplete fan statistics
in userspace.

> diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/=
dts/apple/t6022-j475d.dts
> index 31f24bbda9689..f50a6d56f3d8e 100644
> --- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
> +++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> @@ -44,6 +44,8 @@ &typec5 {
>  	label =3D "USB-C Front Left";
>  };
> =20
> +#include "hwmon-fan.dtsi"

[Severity: Medium]
Does this M2 Ultra Mac Studio also need hwmon-fan-dual.dtsi rather than
hwmon-fan.dtsi?

Similar to the M2 Max model, using the single-fan configuration could cause
hardware monitoring to miss the second fan's telemetry.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712-smc-subdev=
-dt-v1-0-7763006d57c7@gmail.com?part=3D12
