Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597034;
	b=ny+mo3Usgs2TDS0Pdy13fUhl4+ObTQA97+jx0wtZYGPwve1qqNcW9jnmB/W/Cq+aZUb+
	 cNt6yhWzF42dv7pGgtQlP7aBHbVUrbw1YC7BaTYPEq11EZ1F2tKzv6CIDpsSqy/r4eLL+
	 r9hkVCyXWWK4O+Hmiw5JWZUGSxtG0AlQi7a9nmF4WWhfc3o+eijzmDnWDJhXn3F5aLfUv
	 8kyZ8A2xSrtsb8XnouTS75ZYIfj7EVNgg5PWyZSR+2Zd2d9ZZcOSQQqlLHMmaarKZPvYN
	 haf43BuBVtYQs2CGeXto0WlO0gg8SFS6QQBP4+3KcdCry+eUWiGMjhYMIXVl20EwCPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597034;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B0NPr/vUPWgiI5ntbLv6/CmkLYC+oaaUCT2d32ukva0=;
	b=IaB8jAHT+5EeE/UdiOrUXLZSUi+vGITf6OS1LP3AEVqJm8ALtt82dMptWLB5N2m52lnS
	 L/Llg6TdpJ09+17X3w92Uy7PXCatPNX1e7uEcCWppdb/2Q9tayBSeOKvco5Ry2NgWiA8B
	 ht0wansea77X0caiHu2WfWijut/ItK5bId8xF/kWUmQCOQkmGVGE6bA676J+jJ150qKyg
	 Gr8hAbEhgHIn2/okXtnCO7OOOj62+kRd8zA34ES+WFmiBxP8AGfB2jMjmlpGWverXfUcy
	 UU7v01lJsxTi0GsnEuU94RlzPdtnSlQnd0eheqRnAY6UGU6EWC/njj+9Ip7Jzfy3hcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehIRwR9j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72278606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehIRwR9j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07601F000F0;
	Wed, 25 Nov 2026 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597034;
	bh=B0NPr/vUPWgiI5ntbLv6/CmkLYC+oaaUCT2d32ukva0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ehIRwR9javVedtXbFiBrhICKhakqNQDQ9a1SgNqksF9/mMuIFmW+Cu3JFdOx/PXip
	 TYBffjj/fDPDRxA+AOZ85F0DBTxc/9bG6CemSRUaN5Kel9m82r1WG2VHarw7WJwTjr
	 3BW7+hTkPCwS/lANXvpCo05sd8CJS/bRoYHaBjoS5VgE4dACy8KJ3P6IBazqvSUrml
	 tT3tSBwLhE+FmEsOW5B7vYLPf11JS/Uh6hGPJ+hYen8NLjIM8QEOps7GKiXplSvhao
	 5sC9RKrQbT26T3riQpfdJsIy5K9CKrCf5hB3C3CDcu4ByS+sufKwDMIz46iNIkJVhk
	 BCwvJEeR2N6xg==
Message-ID: <sashiko-outbox-232960@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-evk: Enable DisplayPort over
 USB Type-C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com>
References: <20261125-eliza_evk_display-v1-1-78a56df97a26@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:57:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: typec: gpio-sbu-mux: vcc-supply not enabled in
  gpio_sbu_mux_probe()
--

commit af0d0775b3f67c8bf2ee5b677ffafbfe4186fe02
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: eliza-evk: Enable DisplayPort over USB Type-C

This commit enables MDSS and DP0 on the Eliza EVK and describes the
onsemi FSUSB43L10X SBU mux and its pmic_glink connector endpoint for
DisplayPort over USB Type-C.

> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dt=
s/qcom/eliza-evk.dtsi
> index 02e58a4bc91d4..8c663ef6718d2 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
> @@ -61,6 +61,35 @@ pmic_glink_ss_in: endpoint {
>  						remote-endpoint =3D <&usb_dp_qmpphy_out>;
>  					};
>  				};
> +
> +				port@2 {
> +					reg =3D <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint =3D <&sbu_mux_in>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	sbu_mux: sbu-mux {
> +		compatible =3D "onnn,fsusb43l10x", "gpio-sbu-mux";
> +
> +		enable-gpios =3D <&tlmm 177 GPIO_ACTIVE_LOW>;
> +		select-gpios =3D <&tlmm 178 GPIO_ACTIVE_HIGH>;
> +
> +		vcc-supply =3D <&vreg_l17b>;

[Severity: Medium]
Will vreg_l17b stay powered for sbu_mux when the eUSB2 repeater is not
active?

gpio_sbu_mux_probe() in drivers/usb/typec/mux/gpio-sbu-mux.c only acquires
enable-gpios and select-gpios and never requests or enables vcc-supply.
Because vreg_l17b is not marked regulator-always-on in
eliza-cqs-som.dtsi, its only active consumer is pm7550ba_eusb2_repeater;
if usb_hsphy exits via eusb2_repeater_exit(), vreg_l17b is disabled and
the FSUSB43L10X SBU mux loses power, breaking DisplayPort AUX.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-eliza_evk_=
display-v1-1-78a56df97a26@oss.qualcomm.com?part=3D1
