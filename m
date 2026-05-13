Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2B175A64
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715874; cv=none; b=svVHhzGyMkrBgCnoaEUzVxsEAY/Jo2/20LG2lLIvszZIZNwhQ8HiQ7HXgPDtr26/h/f8QyppoVmBfKTxbEzUC1/P12YaukrNnstOM0b95zqNT0gD2CFpLGuVDLErfd7tcYQambc5CLrQTgEj+RYe0cGfArSv8pjx1aSv+EMM6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715874; c=relaxed/simple;
	bh=e8J6P8spAZypS3Lm4Cbbib+cfuktCXJtm+vAKlnXz20=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y31g0oCtOw9j2t+jC3XGrsCUfGcSCNhEQ4ujNnr/O23/wVq5mukCm57LEtN8pxOy+rqc8IyJuh68G7mQo8iCM3i8HH78MjdWlJ53rZIlOFTb+Vbu2XcQQgvaYSvIUfKCsmpmq+KHWDFgvyqjcpkZbPPkvBr4cLWIM0RL5S7NUu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMJ6j6lw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMJ6j6lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0A0C19425;
	Wed, 13 May 2026 23:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715873;
	bh=e8J6P8spAZypS3Lm4Cbbib+cfuktCXJtm+vAKlnXz20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CMJ6j6lwWbat34XmCBe2BnFSf1xhKmSrZ2/AThW/l37/kwla7ZH6Jrm49KuRacH26
	 7pD39E/s1iyQlYhUdAFcL1Ho4il5O3u5rU+wF9wMJ/CHto2U819+2c2loYMlNR80Dj
	 HwGPxVL3SI/XSZLaVxe4p1MLq4O9PrhNtAlcUYvWjl4JSea7D6m4lAINPsR2G4gkBs
	 UnBuJdWlbBFE4hHJkHKMVj0WAFYCRtHhjydgnyyBH1FdiE8A9XwtU7KZEewzkgKnps
	 n/aGD5F7dCWPrq1ufxB3sBJ4SESeWA7/WuSmLL5miJQhymFKtw+BQliafQjrAR7ZOE
	 bk1DteMHqsFYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-1-7178719a43e7@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:44:32 +0000
Message-Id: <20260513234433.7D0A0C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit provides an incomplete fix by resolving missing pin g=
roup suffixes for `pwm_ao_c` but overlooking identical bugs for `pwm_ao_g`,=
 `pwm_ao_h`, and `pwm_vs` in the same device tree file.
--

commit 45b298237b81cf91a3c02cc08237c80e6356d308
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux definitions

The pwm_ao_c pin node was incomplete: it was missing the group name
suffix, conflating two distinct pin groups (pwm_ao_c_d and pwm_ao_c_e)
into a single, ambiguous entry.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..62f6b9baad28b 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -400,9 +400,17 @@ mux {
>  					};
>  				};
> =20
> -				pwm_ao_c_pins: pwm-ao-c {
> +				pwm_ao_c_d_pins: pwm-ao-c-d {
>  					mux {
> -						groups =3D "pwm_ao_c";
> +						groups =3D "pwm_ao_c_d";

Should we also fix the regressions for pwm_ao_g, pwm_ao_h, and pwm_vs in
this commit?

In this same device tree file, pwm_ao_g_pins, pwm_ao_h_pins, and pwm_vs_pins
are defined using the same generic string pattern:

arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:
				pwm_ao_g_pins: pwm-ao-g {
					mux {
						groups =3D "pwm_ao_g";
						function =3D "pwm_ao_g";
						bias-disable;
					};
				};

In drivers/pinctrl/meson/pinctrl-amlogic-t7.c, these generic groups do not
exist as valid pin arrays. The driver only defines suffixed variants like
pwm_ao_g_d11, pwm_ao_g_d7, pwm_ao_g_e, pwm_ao_h_d5, pwm_ao_h_d10, pwm_vs_y,
and pwm_vs_h.

If any future or out-of-tree board tries to use these existing nodes, won't
it result in a pinctrl lookup failure at runtime?

> +						function =3D "pwm_ao_c";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_c_e_pins: pwm-ao-c-e {
> +					mux {
> +						groups =3D "pwm_ao_c_e";
>  						function =3D "pwm_ao_c";
>  						bias-disable;
>  					};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-add-kvim4-=
sysled-v1-0-7178719a43e7@aliel.fr?part=3D1
