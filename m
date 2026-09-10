Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE86D38AC61
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053992; cv=none; b=D7b55hWiwg5Xg7pgYOqiQLipfsNpFMMC8Ym2dfV4xTQlgtV/1wPNW4s608SdQBJC0Q2sDoR16JQxRaMfmAlihfFFaxX0E6T1X8+y73fEowfMRphnqKUa+/J4ZUSvH8q/2BIDZab/ZW8aC15QyVBJH5CB+KPABXk+YLhYoc5cLy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053992; c=relaxed/simple;
	bh=LuZDV6GRLSfCm80rtrhEAymYLxvuAUxBbZzmhESyFl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nPlUVteHo/7Y3RyBT0VfxXU2Wlk/fLW6LIQc1rRDdET2WSclY4uDRzLi6JYU8+V2JRgWc4YwVor50I1Aw/Y7v9/1wBsJsjPUyahTp6WreCfsT/77yXR6dLkLy4yDC/E3WwdkSgU5Qbd2+PiY9SAnevt89gVTY5qRcHxt4+QpAJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azCkIVr/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azCkIVr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428241F000FF;
	Thu, 10 Sep 2026 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789053990;
	bh=mZREA6dmEjuLez8jSOrDwdbmK+QdCiXlIb8XDj7RZK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=azCkIVr/tEf77vzQa+w+8UdWTGJP38fd7QFHCrLpW5Vy7UVQyp2G5fiptxuBlYbKv
	 cds2/7pUYDqWBGvWxla/a1RYUPg+8CAKWodkIcFf4AXdEioITL6hUyHSv1gxKwSJsF
	 j0eq/j9zSpD0Q5c5KC8NYnRDOWU6CLrW7tYNq73uP+LkgyULzD4sj27EmZXJ37b7Mx
	 /56m6GSHPeREgCDQ6zcuZOuIB2iQTxmLATzjdR+JHp+YzyFS4m4kL4xsTR2mpO5nry
	 IsW9tM6baQpJfXVX5iGuxSpd0ZzYtixu7G6TLj03hs8o0hsWQqALj9KLWPFwU83KzU
	 A5QNljua9zkig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: stm32: add TAMP backup register in
 stm32mp151.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260910-upstream_tamp_nvram_dts_part-v1-2-e2bca58a65f4@foss.st.com>
References: <20260910-upstream_tamp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com>
 <20260910-upstream_tamp_nvram_dts_part-v1-2-e2bca58a65f4@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 15:26:29 +0000
Message-Id: <20260910152630.428241F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The compatible string "st,stm32mp15-tamp-nvram" is introduced witho=
ut any corresponding DT binding documentation.
- [Low] The comment 'SHA-0x100' is a corrupted reference to 'SHA-256', resu=
lting from an accidental search-and-replace of '256' to '0x100'.
--

commit 143934b850adb47535f66b1f12ec54c5c90f65e6
Author: Simeon Marijon <simeon.marijon@foss.st.com>

ARM: dts: stm32: add TAMP backup register in stm32mp151.dtsi

TAMP backup registers allow information sharing between different software
components/execution levels. They are described individually as nvmem cells.

> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/=
stm32mp151.dtsi
> index 84f68e8563d85..0ad75e0108394 100644
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
> @@ -2060,7 +2060,89 @@ i2c6: i2c@5c009000 {
> =20
>  		tamp: tamp@5c00a000 {
>  			compatible =3D "st,stm32-tamp", "syscon", "simple-mfd";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
>  			reg =3D <0x5c00a000 0x400>;
> +			ranges;
> +
> +			nvram: nvram@5c00a100 {
> +				compatible =3D "st,stm32mp15-tamp-nvram";

[Severity: Low]
Is there missing device tree binding documentation for this new compatible
string? dt_binding_check validation will fail because
"st,stm32mp15-tamp-nvram" is undocumented.

> +				reg =3D <0x5c00a100 0x80>;
> +
> +				nvmem-layout {
> +					compatible =3D "fixed-layout";
> +					#address-cells =3D <1>;
> +					#size-cells =3D <1>;

[ ... ]

> +					m4_wakeup_area_length: tamp-bkp@5c {
> +						/* see cortex-m4 wake up feature */
> +						reg =3D <0x5c 0x4>;
> +					};
> +
> +					m4_wakeup_area_hash: tamp-bkp@60 {
> +						/* SHA-0x100 value see Cortex-M4 wake up feature */

[Severity: Low]
Was there an accidental search-and-replace here? The comment says
"SHA-0x100", which seems to be a corrupted reference to "SHA-256", likely
resulting from a bulk replace of decimal 256 to hex 0x100.

> +						reg =3D <0x60 0x20>;
> +					};
> +				};
> +			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-upstream_t=
amp_nvram_dts_part-v1-0-e2bca58a65f4@foss.st.com?part=3D2
