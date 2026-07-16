Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38239433023
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220588; cv=none; b=NSjgQG+Yj7TV/FPvcw6EYR7iDIttagUTX7As2UaX2K0QNRu5PU4NgiSnamhMV+CG6SkoezhnmJ0Nuw5YFH6wfN+oUa0WbyNN2l2MKU9N0tUVgLkiV37Sl09uGa3zy3re94CvuGcHbkGQfgEEeNYx8dLxt85DVKlCjKxF5rR7bKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220588; c=relaxed/simple;
	bh=vcuWSrgAk4xVd5ZKmezxW+ff0+3crAxOUWNt9354EEM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uof0g6NYmoua0xga+onwSguzgb9EsF6RnuS4kpQsiWTigB2R1fDZLvj2hJq9+2X7wxPwl+PrtMr2T/x5YKKl22fmQsEKU6Rc21iq1+rEPuGDDomdZYywa/0G9qKKaddyVSEAHTte4M3IvshppGC3prKLDEBjneGXV0xXF+2IktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngVlraR5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngVlraR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B6E1F00A3A;
	Thu, 16 Jul 2026 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220573;
	bh=P+h2ZUmgdO6PTMULZbmbJBd6jtlaO2eHfoHPAoP5cr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngVlraR5FPd1bBzNzWc8yIIvR4dPDvRZfvfRYQFz1bFmKNQMl/htvMnnX0JtG4VEW
	 EnF66JNPnYdlyeSM5zq4JVSy4J2GVJZZVZxE0EqiVnfqwluiZmPs3etgokNAzpLKht
	 JQ6VdUWLwaKHwXM6BOjSdvWPvQtE/voIpWTPie3rlsAESXrU2hg8qdxhjJaFWEwEaW
	 PC4ewdsSQRaFOOErLj1wcb9NlZAcSDnZawEsF87NkiRUMeEuKTZUSyhpGtKM1JrpB3
	 oD6Vzq+/qY+z6z3D/FjGVGb/IiR5hYOuMItU+FMi/CzAegOI+DpGv7MxQyCcs4Dj7X
	 f3ik9Npa1HDdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pufan Jin" <2254650260@qq.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <tencent_D22A164B3AEEA50562C1EC988862BA827A09@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_D22A164B3AEEA50562C1EC988862BA827A09@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 16:49:33 +0000
Message-Id: <20260716164933.65B6E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The PWM fan period is configured to 5000 ns (200 kHz), which is =
likely a typo for 50000 ns (20 kHz).
- [Medium] The PWM fan is not bound to any SoC thermal zones, rendering aut=
omatic thermal management non-functional.
--

--- Patch [2]: [PATCH v2 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat =
4 board ---
commit 1f3302a5304b9bff69dfd891bf8f0a9d2c32995c
Author: Pufan Jin <2254650260@qq.com>

arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

Add device tree for the EmbedFire LubanCat 4 single board computer,
featuring the Rockchip RK3588S SoC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
> new file mode 100644
> index 0000000000000..0eae4b7d85e54
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
[ ... ]
> +	fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		cooling-levels =3D <0 100 150 200 255>;
> +		pwms =3D <&pwm0 0 5000 0>;

[Severity: Medium]
Is the PWM period here intended to be 5000 ns (200 kHz)?

This is far above the standard 21-28 kHz range specified for 4-wire cooling
fans, which can cause the fan's internal controller to misinterpret the sig=
nal.
This can result in the fan either running at 100% speed continuously or
failing to spin at all.

Could this be a typo for 50000 ns (20 kHz)?

[Severity: Medium]
Does this node also need to be bound to the SoC's thermal zones via a
&package_thermal override?

The fan defines cooling-levels and #cooling-cells, but without being bound =
to
any SoC thermal zones, the kernel's thermal subsystem will not automatically
adjust the fan speed when the SoC temperature rises.

> +		#cooling-cells =3D <2>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705135014.1004=
166-1-2254650260@qq.com?part=3D2
