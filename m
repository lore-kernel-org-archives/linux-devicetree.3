Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259A37B3E4
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047898; cv=none; b=jbfvBUGFvOIU9/bgx3GFQGir8AtoPSIYrNf1aLTaeZjc/i5zK+sh+wNRd/MLY9jB6/i4931YSGKWmp5H6NHJ3fxXMl0GgTNV7/IzVfu5vyJq3gNYg6veW783UaVgq087djA/lVvT67nZifytznFc58YjDwqgib/Z91BNf23t+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047898; c=relaxed/simple;
	bh=8Ab8XWgqmmCxZS3VQhobyMRkC1WIOYvqYGiSarTssI0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sOdE9xRUO9Zmtw89OnwpKEasF12l+O+9gUCEb5PD+9zVG1PdFb+84DUgD214tQjZImZx76FtY3fO5rCFyvjCAvY21Q0llIuI9xPJvzFiiSeRI8foEB3nr8+jBXwKC2Ba9xoyG7+40hK78aPw/OknIq6/u7ObOgFjZNiVwD259Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN4jh18N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN4jh18N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2B61F000FF;
	Thu, 10 Sep 2026 13:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047897;
	bh=j8u76nFURM6FiQuyjwVhdyEbqn+cWnmzFHG9WgJeQmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VN4jh18Np4TXuz+eTHvGON4Z06QBn3xpGv7XaOrcZbzP0LLxzmJ9XlxEeUVEHpRzi
	 MLM3AhrqKEtF28h960XB3fqBT0Gd+lD3B9anUtBMF4MXDToVoHvgnnbpqccD8/eKZS
	 hE+8ICAnXxVRIjzCp3/Fb/rH7skZe1W95svBRpKsz5xGl0r+8IqLwKthcvLk0z/LFJ
	 ll0KwVkbYaYLRYBhixzKG1Z6acs4PSipgi4ucF4kGePpi1c/1OTfRV7VFbxCz+j77h
	 1Iext97Nofuv9PF2ydErJDxA/XonHfcarKGLfU3/JcvVZgdEuU6uKFU1Mj7AiWdtBA
	 iY0kISCBNCSmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/34] arm64: dts: qcom: sm8150: Fix PCIe wake GPIO
 polarity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-root_port-v1-5-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-5-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 13:44:56 +0000
Message-Id: <20260910134456.ED2B61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The commit fixes wake-gpios for pcie0 but misses the pcie1 node, w=
hich has a typoed 'enable-gpio' instead of 'wake-gpios' and incorrect activ=
e-high polarity.
- [High] The patch updates the PCIe WAKE# signal to GPIO_ACTIVE_LOW but neg=
lects to fix the similarly inverted PERST# GPIO polarity in both PCIe nodes=
, and misses updating the dt-bindings example.
--

commit 2d78a7a1ac651411a441c9a376da10f308ed1b27
Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Fix PCIe wake GPIO polarity

This commit corrects the WAKE# GPIO polarity for the sm8150 pcie0 node=20
to GPIO_ACTIVE_LOW, complying with the active-low requirement in the=20
PCIe Base Specification.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 94a3b02cb2897..74df5cd86f04f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
>  			phy-names =3D "pciephy";
> =20
>  			perst-gpios =3D <&tlmm 35 GPIO_ACTIVE_HIGH>;

[Severity: High]
This isn't a bug introduced by this patch, but since the WAKE# polarity is
being fixed to match the PCIe Base Specification, should the PERST# polarity
be updated as well?

The PERST# signal is also strictly defined as active-low by the PCIe spec.
Leaving perst-gpios configured as GPIO_ACTIVE_HIGH in both pcie0 and pcie1
causes the pcie-qcom driver to invert the hardware reset sequence. When the
driver logically asserts the reset using GPIOD_OUT_HIGH, an active-high
configuration causes the physical pin to drive high on assertion and low on
de-assertion. Does this hold the endpoint in physical reset when the driver
attempts to initialize it?

Also, could the dt-bindings example in
Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml be updated? It
currently retains the GPIO_ACTIVE_HIGH polarity for both WAKE# and PERST#,
which might teach the wrong polarity to users.

> -			wake-gpios =3D <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +			wake-gpios =3D <&tlmm 37 GPIO_ACTIVE_LOW>;

[Severity: High]
This is a pre-existing issue, but was the WAKE# configuration for the pcie1
node accidentally overlooked?

Looking at the pcie1 node, the WAKE# GPIO is misspelled as enable-gpio and
retains the incorrect active-high polarity:

        perst-gpios =3D <&tlmm 102 GPIO_ACTIVE_HIGH>;
        enable-gpio =3D <&tlmm 104 GPIO_ACTIVE_HIGH>;

Because of this typo, the PCI framework completely ignores the WAKE# GPIO,
breaking PCIe wake and power management features for the secondary
controller. Would it make sense to correct enable-gpio to wake-gpios and
set it to GPIO_ACTIVE_LOW in this patch?

> =20
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pcie0_default_state>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-root_port-=
v1-0-90a252ddbbfa@oss.qualcomm.com?part=3D5
