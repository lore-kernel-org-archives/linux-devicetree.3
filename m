Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407B63ABD99
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157742; cv=none; b=TQBvllXUX0Y1pht362vyNBo80ZCJuLA78UqU+PigrK0hrqmmAyWWZdxhutEl2Wyssfhnce5ojsXvFw3upel7k7eH8i1YquNZpARlBjhWkEZTK15iFvX4Hm6bzt1CyMMKRqdsPICxAqBUSJiF/6mEhpnNA1lQfstCq+Zxji1BBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157742; c=relaxed/simple;
	bh=Kvw3SCW62tez4m35dIDZWsboPj6VfQyQPGXwTAi9Sbs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U+rwNzSUkPDYkknshYRpWM7PvTtN31DgP8m7IZJj3e8axe1JD2iTUK8/51cjOuqkQsb5TJ0kTld+7wSVbfNy799IqPhR6yiMKj98fddklI7jy4I43sdXPUPwEf8If0bq/RcAAl8L8Dt3n+emwLZSbqLU2zDGH3xvshHEwRmt05k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBzmt8ku; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBzmt8ku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7472B1F000E9;
	Wed, 19 Aug 2026 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787157740;
	bh=3GTpbB5CFoHETiw8U7cS4yydks/ZKMeqw9tRBatjtns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VBzmt8ku/cvyveVCfdOM/k2dRWw0NLuOI6zHaiJa1FHzCoT7/MPW8MKaRpQw2nQFn
	 8XEpZ37LQx5ikcCNX8yhqjq+pgqAlx/mmZWc3sRPzh6EA4OpTK500o5uBrjt6zm1xs
	 X7XexWn9GvEyVWvt/1g95UnQMDWETynC52B0JOYsGmpfsCdmPQYL++wSQMTIK+rTP4
	 zJfDqwhrNeXgJqkuNNY+xlBT/5k1jwHOP2TYct5BP423ImqNhnsuiTWZx9SlsPyd01
	 xN84cEbH7vLk3UsnRY4tAiQosyAY+Dxl7fyfsO+apRZdhZeFUnPCz6poSQyXwXudsN
	 STb7cq/nLiXIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: st: Add UCPD node on stm32mp231
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819163410.119755-3-marex@nabladev.com>
References: <20260819163410.119755-1-marex@nabladev.com>
 <20260819163410.119755-3-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 16:42:20 +0000
Message-Id: <20260819164220.7472B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplicate unit-address for sibling NVMEM cell nodes 'package-otp@1e=
8' and 'atrim3@1e8'.
--

--- Patch [3]: [PATCH 3/4] arm64: dts: st: Add UCPD node on stm32mp231 ---
commit 73383f2b2e9f887b4df27458fed89459eba124e2
Author: Marek Vasut <marex@nabladev.com>

arm64: dts: st: Add UCPD node on stm32mp231

This commit adds the ST UCPD Type-C block node to the stm32mp231 device tre=
e.
It also adds the UCPD Rp/Rd resistor trimming values as a new nvmem cell
subnode pointing to the OTP registers.

> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts=
/st/stm32mp231.dtsi
> index 9e1d240888ff2..5049e031a38dd 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
[ ... ]
> @@ -794,6 +809,11 @@ package-otp@1e8 {
>  				reg =3D <0x1e8 0x1>;
>  				bits =3D <0 3>;
>  			};
> +
> +			ucpdtrim: atrim3@1e8 {

[Severity: Low]
Does this duplicate unit address cause a dtc warning during the build?

Both package-otp and the newly added atrim3 node share the @1e8 unit addres=
s,
which violates the device tree specification requirement for unique sibling
unit addresses.

> +				reg =3D <0x1e8 0x4>;
> +				bits =3D <4 16>;
> +			};
>  		};
> =20
>  		rcc: clock-controller@44200000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819163410.1197=
55-1-marex@nabladev.com?part=3D3
