Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598385;
	b=UH53yp2yC0pS+EHXtH1rMPzz8BcSdNN7a9IS9KDKlWhgiItYghnpvYsOdhEBZINO6g3f
	 6LBE6agie+juqhL71ESW4R+H85lJ2JLolWN9kj3df7KE1zMEuqqWySSlPNpFSCWD6n9Py
	 WeRYTHQZxYcQEW+uMuOpDY81fEZycDCUutaKgx7Bl/2vuarziWTs6ReGZtyo1gPQs59uP
	 sDSciaVQ3WtIRiQl+uFnKk8RjoJeTuW8LBm/6YLL4B0qp6LKPMubbvtR6/wLlWKGiBxda
	 TKfWftTPo+UGZUU284J6LGfbFzXv6QW8mM06gmsl0rfsopgh6rpiAsy44sJLr2TYArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598385;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EPoeYDjPsPvpdVLo1d2E8IQLCuKSvJC5TcjkXpm+UX8=;
	b=w2BUXJOysGZ7a211oeVlvzz8UluTuHMuAUY2+AaCcMYELCwalbCVJrqpJ4N7z69PW9F+
	 YxYI2Tu22+DfTGYhWZWqL0q2uHdHh2g08lPI11h9AYIAtk70PPF9VtEBMC2fuTFZuBzTH
	 auPOToPWfBP0W7vz+aT/e1N+0NBT+dt/Rd4hH3VbPfuy+BRxV+81RB8mAa39MW2MQXDng
	 FZvAQZy66xpQdtrzxVpTa9CJr8bTKU68fNHYzdePR4e4uRPGwioTbEEDg3eCPKGaS5Ri3
	 t5IA7cKkoQZ0rw59B278xhP3fNmXR2hli6QbLDx8MDKHmmIHFfKy3g4S8/miKen56Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bO/s6NAE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3A606A33C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bO/s6NAE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4693D1F000C6;
	Wed, 25 Nov 2026 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598385;
	bh=EPoeYDjPsPvpdVLo1d2E8IQLCuKSvJC5TcjkXpm+UX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bO/s6NAEg4fcACazyx9PRQrYzRkAqCgYaE7zq2qd3nYRZ/9kaOeGhU3ePvTm1Y7To
	 J4NibdxsUTajh9UxRfLJg2PZfj4t/SlY8Qn6guNdz1RB85968YsYZ/fnjhcp3sc56w
	 4QBDg+NC9SZKhTC5EqWAT1JZ3wilpRU/lMtbxMbTfez7tg58rSg3k2PdvyyUf0328D
	 Nh6EDBBCxxnYdpxedf5h+FySF5KxurOysZ9IzmozEbOBpRoaON5OOoXNpdYVaVb/eL
	 Wpx4+EbDMyrwqc9aumMnpi8+cK4XDax4oOkosIc6Qq/QcoR4pfLFZEUuUAFUc1LDBx
	 mfuEU87Y36lAA==
Message-ID: <sashiko-outbox-232999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: sm8750-lenovo-elden: add
 Lenovo Legion Y700 Gen4, a Qualcomm SM8750-based tablet
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125091309.124354-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261125091309.124354-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 09:19:44 +0000
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
- [Medium] arm64: dts: qcom: undocumented willsemi,wl2868c compatible in
  pmic@2f
- [Medium] arm64: dts: qcom: missing core boot and power nodes in
  sm8750-lenovo-elden.dts
--

commit 262e507ab978aca6c1cff7c77d2e146878beb012
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a Qualc=
omm SM8750-based tablet

This commit adds an initial board devicetree for the Qualcomm SM8750-based
Lenovo Legion Y700 Gen4 tablet, describing board clocks, reserved GPIOs,
and a WL2868C camera PMIC on i2c10.

> diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm6=
4/boot/dts/qcom/sm8750-lenovo-elden.dts
> new file mode 100644
> index 0000000000000..73f4452f46120
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "sm8750.dtsi"
> +
> +/ {
> +	model =3D "Lenovo Legion Y700 Gen4";
> +	compatible =3D "lenovo,elden", "qcom,sm8750";
> +	chassis-type =3D "tablet";

[Severity: Medium]
Does this board devicetree omit core boot and power nodes such as SPMI
PMICs, RPMh regulators under &apps_rsc, console output, and storage?  The
UARTs, USB, storage, and display controllers in sm8750.dtsi are disabled by
default, leaving &i2c10 and an unused camera PMIC as the only enabled
peripherals on the board.

[ ... ]

> +&i2c10 {
> +	status =3D "okay";
> +
> +	pmic@2f {
> +		compatible =3D "willsemi,wl2868c";
> +		reg =3D <0x2f>;
> +		reset-gpios =3D <&tlmm 126 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&camera_pmic_default>;
> +		vsys-supply =3D <&wl2868c_vsys>;

[Severity: Medium]
Is there a devicetree binding schema for "willsemi,wl2868c"?  No schema
under Documentation/devicetree/bindings/ documents "willsemi,wl2868c" or
its vsys-supply, reset-gpios, and regulators child nodes, so make
dtbs_check fails validation on sm8750-lenovo-elden.dtb.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125091309.1243=
54-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
