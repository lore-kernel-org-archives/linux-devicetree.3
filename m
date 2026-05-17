Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA051A317D
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779026758; cv=none; b=iRr94FwIcC+tWdzuVJ/qBV1VJWHftHkE/fsbLPd0BTE5v/ASIvU7hHcjONthqoZVdU7pkm6qrlQQ5h6v6OFSRSNOtmOMid9Uq7XJAq9sfcxQsKkihmXpCSHab4qsnWUb8XIaZc+j1lnv/sLG5OFp3D7D6RRInUT9Bs7pQ7BRLLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779026758; c=relaxed/simple;
	bh=yrR7FBJl80rneIXn+E+QCBe6uSsuI2O8hc4sRmGbDkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P/z+l24wJ0RWADBquWspLMHQtqb8Hs+HHT4XoB7RaqWRHhHJ6NiQu2j5Itfy8xIqEthcXweEYG69UvgiiZWFfpeuCa3J4i0+zuakoSD5hNv4S1jgUYPfuNN/WyPH5behQ5L8jq6aH2R8ndJ7RyzDW33Bhyf5HV0qLQvHpRAJRZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4bgT3vG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4bgT3vG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E643C2BCB0;
	Sun, 17 May 2026 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779026758;
	bh=yrR7FBJl80rneIXn+E+QCBe6uSsuI2O8hc4sRmGbDkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=t4bgT3vGJWmS0etTnR7pryJ6O0Wsyziy2JErCeaf13agAX2JO0U6lrniBbVAY6MZg
	 PYzLuqKWYGtTY0rc2vmeImR/T5AJx5jtQIzg5eYucWgjRi7ALNDBbaH1UDstRT1rLs
	 TGHfndq8MIM9DbAmXbly58g3+xzuOqRBc32vA6CPqn4XRaswdkqeqnZ2AcDnjRWVta
	 4MMPpKZuRzACq4gp+xC2byPCl0440F5AouShBuwepZrU6648qjXf/kmQ1Ne2qb/U0w
	 uisEwgypCQrMEarL/VXWwf/ovYmSldKqAuZFC/RjsVBTzHm60boQMdtzOi15MLXxoV
	 6pch8n73is7aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8550: add UART11 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260517-pocketds-v3-4-d5910c801756@gmail.com>
References: <20260517-pocketds-v3-4-d5910c801756@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 14:05:57 +0000
Message-Id: <20260517140558.1E643C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware/Device Tree inconsistency: The uart11 node references the=
 wrong operating-points-v2 table.
- [Medium] Missing Pinctrl State: The `qup_uart11_cts_rts` state is omitted=
, forcing boards to open-code it.
- [Medium] Incorrect Pin Bias: The `qup_uart11_default` pinctrl state confi=
gures pins with `bias-disable` instead of `bias-pull-up`.
--

commit 3269a824736c1b0b41ba9f1674a29c444d6c2b01
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

arm64: dts: qcom: sm8550: add UART11 node

This commit adds the QUPv3_2 SE3 High Speed UART (UART11) controller node
and its default pinctrl state to the sm8550 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/q=
com/sm8550.dtsi
> index a9c678fc9cb2e..3e71701b18ff0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1084,6 +1084,24 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
>  				status =3D "disabled";
>  			};
> =20
> +			uart11: serial@88c000 {
> +				compatible =3D "qcom,geni-uart";
> +				reg =3D <0 0x0088c000 0 0x4000>;
> +				clock-names =3D "se";
> +				clocks =3D <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
> +				interrupts =3D <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&qup_uart11_default>;
> +				interconnects =3D <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
> +						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
> +						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +				interconnect-names =3D "qup-core", "qup-config";
> +				operating-points-v2 =3D <&qup_opp_table_100mhz>;

Is this the correct OPP table for this Serial Engine block?

The sibling spi11 and i2c11 nodes, which represent the same physical SE blo=
ck
at the same address, use operating-points-v2 =3D <&qup_opp_table_120mhz>;.

A mismatch could lead to the UART mode voting for incorrect voltages or
failing to reach required frequencies.

> +				power-domains =3D <&rpmhpd RPMHPD_CX>;
> +				status =3D "disabled";
> +			};
> +

[ ... ]

> @@ -5102,6 +5120,14 @@ qup_uart7_default: qup-uart7-default-state {
>  				bias-disable;
>  			};
> =20
> +			qup_uart11_default: qup-uart11-default-state {
> +				/* TX, RX */
> +				pins =3D "gpio70", "gpio71";
> +				function =3D "qup2_se3";
> +				drive-strength =3D <2>;
> +				bias-disable;

Should these pins be configured with a pull-up?

Other high-speed UARTs on this SoC (like qup_uart14_default) typically use
bias-pull-up for TX/RX lines. Using bias-disable deviates from the
established pattern for high-speed UARTs and could cause signal integrity
issues on boards lacking external pull-up resistors.

> +			};
> +

Could a qup_uart11_cts_rts state be added here as well?

The commit message states the goal is to prevent boards from open-coding the
controller configuration. Since high-speed UARTs often require hardware flow
control, boards that need it will still have to open-code the CTS/RTS pins
(gpio68 and gpio69) if the state is omitted from this file.

>  			qup_uart14_default: qup-uart14-default-state {
>  				/* TX, RX */
>  				pins =3D "gpio78", "gpio79";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-pocketds-v=
3-0-d5910c801756@gmail.com?part=3D4
