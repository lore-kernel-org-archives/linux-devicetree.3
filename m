Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987539;
	b=DvYhB+eMRrIAdddKFF4/umAyhq3QVzY8ZqYnlOXanwO1U9Piguhk36OXacmBshm3+ZE3
	 BbgVm/W9dcb2RwNuamzuxYKWvTmBwYVqKDz52/f7kOceSCndFATKcynW2T5w4IWKp+gms
	 V38Hvb6zwzC9j5KG2aJcg3ZyJasQw/4UXieuEpORbGrHz6wy3tDi9AsQdbp0EGQIlOqwB
	 nIcgaizY1FTJ6CHytYVyk4ayv0VOLbErQayFF46c4fkmhcVFyGidWROFq+UCVQumQf7qX
	 swveuuhHKoQeDpevFudQ9Jr8+Y7GOmJjQ46OUFc7mQImAUd3nNAPJAH/nBDwIEg3VeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987539;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9Mp7/lLYapKGNcb3GPo70Z90AWbiRwKn42U/n24MmtU=;
	b=NQPqVkaMqu66wC2OMCVfYWg6PW1vZxBrmnEj566k+jL66/w9VEHOjDdhbEQuhlGqHDJ+
	 /GamDr8qqBvhPaGOspJ+EhuuN63sbG74USjVpPh/TMWRjjNmOyp6c6e97/nP7sDToAE/d
	 YaDifdiXTE8Cq3hxGwrzeztChf2IKT8aX6N5VhCjkcCB3JxJ6EMVpwAP2BZ0agof8sw8L
	 dPgn2whgnH6K7UAnNYUZK73TTyGQs5fQ5ZYhRA+4KxTX8W1JA5MqHkmj7YLxL0u8ae5YW
	 W0juImMocEn0fCQomk87Tx0BSd7FIzQO+HfdHh8hXN8WFc8Yk5Ry5KX/zMddRzZL7bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAXBAe9K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08A606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAXBAe9K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4A21F0089F;
	Fri,  6 Nov 2026 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793987539;
	bh=9Mp7/lLYapKGNcb3GPo70Z90AWbiRwKn42U/n24MmtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iAXBAe9KjCYPKI7ljSz3rSDth00Gk5l/4ihpUmICXH7DhkIkobu5keImxpJbJNjZu
	 hfxlSZVRCV36ANZdyRYk4r0NyqM0bxoflWGe6Cki3sOtkdpcXy6wObzWdUSXRee7da
	 t3s3lX/XnoPXLDAlZA7vPsiuO+bdT1Hvz04xkJ1tsVkpa955QTkSgiwRj5LfM6IMMA
	 8Utl03TaGI7yifrGe9s1kwoyCqMvAms7bKLWhrTsSieaN7t0QZEtEw+04WX5KjCSMp
	 EOk/xMhhNlzF6qOdllRSzDTf8bOwbWTay3tFwWy7ey0qAlJgv9TYpBuHhDS4lqAW69
	 rpySEHg+4yzUQ==
Message-ID: <sashiko-outbox-201975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8150: Drop non-existing
 enable-gpio in PCI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106173719.276668-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261106173719.276668-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 17:52:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: sm8150: pcie1 enable-gpio dropped instead
  of wake-gpios
- [Low] arm64: dts: qcom: sm8150: missing Fixes trailer for commit
  a1c86c680533
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] arm64: dts: qcom: sm8150: incorrect PCIe PERST# GPIO polarity
  [1]
--

commit 665cb84da938cddddc3913668cfa84f9461af819
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

> arm64: dts: qcom: sm8150: Drop non-existing enable-gpio in PCI
>
> Qualcomm PCI bindings do not allow enable-gpio.  Linux drivers do not
> use it, either.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

[Severity: Low]
Should this include a Fixes: tag for the commit that introduced the invalid
enable-gpio property on pcie1:

  Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 293fcbacff346..e62a3005134f9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2019,8 +2019,6 @@ pcie1: pcie@1c08000 {
> =20
>  			power-domains =3D <&gcc PCIE_1_GDSC>;
> =20
> -			enable-gpio =3D <&tlmm 104 GPIO_ACTIVE_HIGH>;
> -
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pcie1_default_state>;
> =20

[Severity: Medium]
Should gpio104 be moved into the pcie@0 root port child node as
wake-gpios =3D <&tlmm 104 GPIO_ACTIVE_LOW> instead of being dropped?

Commit a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes") added both
pcie0 and pcie1 with misnamed enable-gpio properties for their WAKE# pins,
and pcie1_default_state still configures gpio104 under wake-pins.  On pcie0,
commits 7c38989d0f7a ("arm64: dts: qcom: sm8150: correct PCIe wake-gpios"),
463d931d6a66 ("arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO polarity"), and
9e753907e6ba ("arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root po=
rt
node") converted and moved gpio37 into pcie0's pcie@0 child node, but missed
pcie1 because its property was still named enable-gpio.  Dropping gpio104
leaves pcie1 without wake-gpios and prevents pci_configure_of_wake_gpio()
from configuring PCIe WAKE# wakeup on pcie1.

[Severity: High]
This problem wasn't introduced by this patch, but the PCIe PERST# GPIOs in
pcie0 and pcie1 (reset-gpios =3D <&tlmm 35 GPIO_ACTIVE_HIGH> and
reset-gpios =3D <&tlmm 102 GPIO_ACTIVE_HIGH>) are configured with inverted
polarity [1].

PERST# is an active-low signal.  When qcom_ep_reset_deassert() sets the
logical GPIO value to 0 to release the endpoint from reset, GPIO_ACTIVE_HIGH
causes gpiolib to drive the physical pin low, asserting PERST# and holding
connected PCIe endpoints in reset.

[1] https://sashiko.dev/#/bug/linux-9970a06f-8202-465a-86f2-3c66f7fd39f4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106173719.2766=
68-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2
