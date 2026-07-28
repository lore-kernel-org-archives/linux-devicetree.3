Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2BE37F011
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 20:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785271951; cv=none; b=RrPuNVyGAQS8a5hkxEq4jBZGQgoLuS49YEbvWguvp3cjw1teE/7VYL6ySg2qyyra8Pco5xi/0tZWOueWfgMrq7awQdb/J1Ysw4XpcPVO0Pyw2FprhryA077I6U74ncAzrGq57TRSYMC6Ivum6voCICwdMA7b76gCPMbCT4XDFWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785271951; c=relaxed/simple;
	bh=Vf4QaaCgGOyaYT73PINkQXVgBpohQIl2U31mnyyQDKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PBrIfb/+N9Y0WnZ6RHchGegVJJJbFKUk1J1wPbIUmQuDMzYH90M+npCZRX86+5/SUKh8L96qg9pIovf/fzVIiIExTxlwpv92XaGhQdvXihdGmW56TfgnhFp/Cq+gu35qJNiH8HtQ0tWlyG30SNIY4nRg9KZsPeMIBcMS1vOiid8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jf9ygqEF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jf9ygqEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25A31F000E9;
	Tue, 28 Jul 2026 20:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785271950;
	bh=jQZRwiozCCQeQ4uehsgTrlqO8kgTSKJHy96oWl52w1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jf9ygqEFnJHSGK9i6vVytoKPQOPal0ruqu0aiaWMQW9ulVqcN8IvgwaKiwCWOBH2d
	 rp48K2t0t+z6GNAAkHNY3EGBzxnJHUHoUrMqgYUAfAPLkF0cX2nWZ51OiRgwUKa7I8
	 u6scXDyGOU4RsbO+2sEZH9SBNQGk+eB2/B8FpIijq3Iav65IMLrPAptGiMjHu8hamG
	 prU0+sLEBi5paNUUtRjruA+jlbQqUJe8vVwzsgJ5O19hm9INWQz1IYniw2uHKGX1sU
	 A9jSvxLdzrCAZ7tqGGMJk93L311j8wB00oGy9yC+Xh/raUJ+VcMpuLhny4qEpAFO4B
	 Cify+xNWoJv9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V10 4/4] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728203832.166402-5-macroalpha82@gmail.com>
References: <20260728203832.166402-1-macroalpha82@gmail.com>
 <20260728203832.166402-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 20:52:29 +0000
Message-Id: <20260728205229.E25A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'vdd_lcd' regulator is marked as 'regulator-always-on', whic=
h prevents the panel driver from turning off the power during runtime scree=
n blanking.
- [Low] The R1 button is incorrectly labeled as 'T2' instead of 'TR'.
--

--- Patch [4]: [PATCH V10 4/4] arm64: dts: rockchip: Add Anbernic RG Vita-P=
ro ---
commit a452f1bd14e3a6fffeb75a59d2f85e2015412c25
Author: Chris Morgan <macromorgan@hotmail.com>

arm64: dts: rockchip: Add Anbernic RG Vita-Pro

This commit adds the device tree for the Anbernic RG Vita-Pro handset,
based on the Rockchip RK3576 SoC. It configures the hardware that is
currently functional, such as the DSI display, buttons, LEDs, and WiFi.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts

[ ... ]

> +		button-r1 {
> +			gpios =3D <&gpio3 RK_PC2 GPIO_ACTIVE_LOW>;
> +			label =3D "T2";
> +			linux,code =3D <BTN_TR>;
> +		};

[Severity: Low]
This isn't a bug, but should the label for button-r1 be "TR" instead of "T2=
"?
L1 is labeled "TL", L2 is "TL2", and R2 is "TR2", so "T2" looks like it mig=
ht
be a typo.

[ ... ]

> +	vdd_lcd: regulator-vdd-lcd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vdd_lcd";
> +		regulator-always-on;

[Severity: Medium]
Does marking this regulator as 'regulator-always-on' prevent the panel driv=
er
from powering down the display during screen blanking? If the driver attemp=
ts
to call regulator_disable() on idle timeout, the regulator core will ignore
it, which might lead to unnecessary battery drain on this handset.

> +		enable-active-high;
> +		gpios =3D <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728203832.1664=
02-1-macroalpha82@gmail.com?part=3D4
