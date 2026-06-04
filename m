Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477E937BE8A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590473; cv=none; b=SPKS0tzpISZZF+24bsBVvHkZme2cfZ8rgVEwRIiAwZQ+4zEH+LZeeKvZfm/JZRsWPIS3tpLt+TmcaW8WUgpsO5eiG5bRg4DvXVCbS5pTsEeGmUVDyTNEvLtTzRv+h8WekpDtcHfazGAcygjOjIRKfRrMxpzXaG0Uw9hmsj8ks9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590473; c=relaxed/simple;
	bh=3j8MhvS8b+aczEMK1dQCzVigM/U8A7T/VkMiJU2zrMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sJtief4SrhlIA7QwgDHSPeag//o7iYqJdIGjX74ARAeaZcB9weVR4N1eWoyq77SX1qSbyz5GjVRqfG1pA59+U8niIsrpBWrAWWSjxYUCHE/pr2BdG5oVd0ooKiVSgbjswI+MlVlp5HBDPNDqjRSbXvrZjHgfmkoiodjwpc/NQIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wz9tuDkM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wz9tuDkM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6AE1F00893;
	Thu,  4 Jun 2026 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780590471;
	bh=BkBfj4eVuTPlihOFE/3EUw1V547G+q1HvX+zAA9FYdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wz9tuDkMFVxQKW0pujAsaiD6hBc77xRhXPru00qaHwqR6cnIwVbcjpcsS+4NEOSiz
	 yPDiZifB4B2Ib2HF/80T1SuE2VUs9HK74jnTk/Qo6zWDr+Tw4eUjPzPP+VxPYNquLt
	 hlDVOCIb3qe7Gw2jKJ5gqn9M714aKCcz35klLu0gp5YKOJ3bPpZdq/oZcv6FqGzz3B
	 dOeMSVG/XP6ULfKmXkEE/K+Qt/3dUj8BV3aB4ENZuFU2S+7TaMvK6M0GDKxaFjzdL+
	 FrcrPc87qL003XopzstKaHFRYQWnklawB+cfPggB7KjUj6GnEUwPrO/ojr94rjPcst
	 2xnx/kD274tQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/10] arm64: dts: qcom: sc8280xp-arcata: Enable the
 eDP display
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SsOpcsO0bWUgZGUgQnJldGFnbmUgdmlhIEI0IFJlbGF5?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-2-6aa6f6612c10@gmail.com>
References: <20260604-surface-sp9-5g-for-next-v3-2-6aa6f6612c10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 16:27:51 +0000
Message-Id: <20260604162751.AD6AE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit silently removes the `status =3D "okay";` override fo=
r the `&dispcc1` node and the `regulator-always-on` property from the `vreg=
_l6b` regulator without mentioning these functional changes in the commit m=
essage.
--

commit 225c01f9a1d48e2b3f638fa8c5a506daa682de98
Author: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>

arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display

This commit adds the vreg_edp_3p3, edp_reg_en, and mdss0_dp3 nodes
to enable the eDP-based LCD display on the Surface Pro 9 5G.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arc=
h/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> index f24f60dc73afe..476e17415da27 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
[ ... ]
> @@ -344,7 +360,6 @@ vreg_l6b: ldo6 {
>  			regulator-max-microvolt =3D <880000>;
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-boot-on;
> -			regulator-always-on;	// FIXME: VDD_A_EDP_0_0P9

[Severity: Medium]
The removal of regulator-always-on allows dynamic power management, which
seems correct for eDP enablement. Could this functional power management
cleanup be documented in the commit message?

>  		};
>  	};
> =20
[ ... ]
> @@ -448,10 +463,6 @@ &dispcc0 {
>  	status =3D "okay";
>  };
> =20
> -&dispcc1 {
> -	status =3D "okay";
> -};
> -

[Severity: Medium]
Is the silent removal of the dispcc1 status override intentional?=20

Disabling the clock controller is a functional change. Should it be=20
mentioned in the commit message to clarify the patch's impact and aid=20
future bisectability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-surface-sp=
9-5g-for-next-v3-0-6aa6f6612c10@gmail.com?part=3D2
