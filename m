Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A9F18A6DB
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477956; cv=none; b=H3keOSTxiB0oE8/v+RyoY/BxCf1q3EGHNRkcXnIz/TcISe0BBC+45hR8nfM7+ltDG72a61lIyq43ZKIMZ0LxTj70Ass006jqZMKGhnaAgNiAItsXY/GYl+Y2VL7HPHM9N/KLHDo8i8VUlYCjQomVd2ku/4UviORJNo98qABX1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477956; c=relaxed/simple;
	bh=cvKT2ikX2+sCR6IEeFGvzmpaA+oHv3y/SwsrziYO4LY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jnfsUGcPLWKZM9ZuXo9MwltTo9F9ZE1pc/ht02dF+EzgFQIJjDxwTGrD+ppKIxZ6wRmmmXBKmnM6vU+4G41w90ZERV6/PYBF1dEEifh9KdOBIq1pv9qcUst60vTxkgkA6jxQ61ES5KUxcjeGeaGJ4irgGqDUd/3n99NtsKQMtIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTx6HEBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTx6HEBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CA01F000E9;
	Sun, 19 Jul 2026 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784477954;
	bh=xUVv45BkNIa3yFtliZt4xe192D4Qd03FSSpj9g5elyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HTx6HEBhqFuEId+VyT031N4D1TiucDT6EXOQAYpRpkDioeXxMy0yGfPP8Jebet0CG
	 +514m8XSMduwckLc4k6B2OiNeG0KrBcr7i6hKHPB0EVLJgvLQY1sEB4XRQ5v2df+Kf
	 hzRFbFb/APX5hChgNSmrjN19VLrlbNKD6sIVdcvWOWkMuq0eJVWvdZEJvqM+lxGhXW
	 OBvnkj8Ln8yOAQ7FIHK/s4ChEkaf+Ulv0gxrA2DHk1NLZplj6u37RLh5nsG4KHEaKS
	 DOiG+Bjf9GqM279ZO3CpLDGwRtnpJpyK5NDa9QulDliwuIlSIzNW5PbjZzp24qzsAo
	 on+y0Q1cr3WUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix label of sys_led for
 nanopi-r4s
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vic B" <linux@vicb.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <alz112qGhm77liqi@vicb.net>
References: <alz112qGhm77liqi@vicb.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 16:19:13 +0000
Message-Id: <20260719161914.77CA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch assigns a new value to the deprecated `label` property in=
stead of modernizing the LED Device Tree binding to use `color` and `functi=
on`.
--

--- Patch [1]: [PATCH] arm64: dts: rockchip: fix label of sys_led for nanop=
i-r4s ---
commit ceee1e0876cda2fa407388b630cd3de2ef149410
Author: Vic B <linux@vicb.net>

arm64: dts: rockchip: fix label of sys_led for nanopi-r4s

This commit corrects the system LED configuration for the NanoPi R4S by
changing the label from red:power to green:sys. It aligns the device tree
with the physical board schematics.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
> index 4274d1b6e80ae..6fbc76e2e679e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
> @@ -31,7 +31,7 @@ lan_led: led-lan {
> =20
>  		sys_led: led-sys {
>  			gpios =3D <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> -			label =3D "red:power";
> +			label =3D "green:sys";

[Severity: Low]
Since the label property is deprecated in modern LED Device Tree bindings,
would it be better to replace this with the color and function properties?

Modern user-space LED managers rely on standard sysfs directories named
color:function. Defining the LED using the color and function properties
would align the driver with current subsystem guidelines and prevent
userspace from relying on the legacy label field to correctly identify
the hardware role.

>  			default-state =3D "on";
>  		};
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/alz112qGhm77liqi@vi=
cb.net?part=3D1
