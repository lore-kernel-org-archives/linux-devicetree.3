Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165672;
	b=X0Qs2zZUCnzwQ/hWBJQjbcynpk6vvAydJJ3i6Ch7NQLy45YfCld+9eidTPrSI9N3mR0C
	 nm80qDE1Y3IRGJAd4jbLpyrT22WnREQ9+DDdsOr+1vsQWSJg8JqcWVwXytVerR+iSF0M5
	 VUMSuJzMHbCzpd4YMhte+RfAEJR/pr8Q9TxHdIBvhnE6is/+asum8k121KGXrSa4H09gT
	 1s/0eb1ajFhJiPLXFNvf+e1BZlU9664ztkoBs8yzOtIq+zcWIMiUBMeZ0A3lnRiMai2KR
	 h8taYoYNC8NmtaRY2YQ3aeSdVH0VxdMWgXPamKYpBXwSkaLu+cSGW3OpHszIP/8gcbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/iqQ+2uuhOIfToTcZGIw2ti38cV9UCqdrdYPrJR4eLs=;
	b=PCCfHiuUHMxPIcE5AMjG5kJEiGONRD9J1sKxJ6ECfpzyCAFpqygK6u7+DIoIfhUSsVSy
	 G8I9uin3H45yiH3Y+LgCeNxQV5t0s1vxCvvS1Ll86LBFy8/J9DW1r65shyFt0vKYlwRxI
	 mxkYmGv+sh4+JYqbt9UhzujwfchLeKsW4JvJyKb1akYECo9PocqtIf+b2g9l4sTWloNiI
	 czOjuoJuhiI5vpsWdn0SlsEoWMVym0xXAP+zsBKELqXHTjgiB+lGpPl3b4L8+weyr0JKr
	 T1sA+E332Omwn+fW3NktTx/ZYM2Wmzz6o7xz+fptCwEiat2+epH7hHAz48rKEaUheIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3hP4wtY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA1606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3hP4wtY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266751F000C4;
	Fri, 20 Nov 2026 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795165672;
	bh=/iqQ+2uuhOIfToTcZGIw2ti38cV9UCqdrdYPrJR4eLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G3hP4wtYSxBC+erb0bFYZTCl7Zf1J5pYBwhqHjki8rnYVOA5rWX9nZkNiWIx6eZXR
	 31tHyrts2y6Nj6njpxiHuaAJ0NWwqUkc8XaOtjXvd7Yqp2eDTqE91CP+ob5fh78DJ0
	 LL2TZjqh/n4l6Z4vn38+/ui2ND7aJz7UlnjeXPB4LQpPP4O8VEplLxyxgWh+0REmcQ
	 dwnS6lnYNpFHLVWj0Z8jTUTN2DpcEitvJHVKKyLtqabfLpf+kAIBFui37VcJnYhg1p
	 0PGEwS+klGLxiGD6ewgUv2+zRHyzgT8EiL+QtrLGNo8NCb5cSu6BtpsCn0FWJoyBEk
	 ee0K3zB99HQqQ==
Message-ID: <sashiko-outbox-224824@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: ipq9650: Add RDP488 NAND variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-ipq9650_various_devices-v1-4-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
 <20261120-ipq9650_various_devices-v1-4-14f53b84c42c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:07:51 +0000
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
- [Low] arm64: dts: qcom: ipq9650-rdp488-nand leaves unused sdhc_ice
  enabled
--

commit ad5347a3cef492083ed05d894cccf1bc85330536
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq9650: Add RDP488 NAND variant

This commit adds the device tree for the IPQ9650 RDP488 NAND variant,
enables the QPIC NAND controller, and adds the target to the Makefile.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts b/arch/arm6=
4/boot/dts/qcom/ipq9650-rdp488-nand.dts
> new file mode 100644
> index 0000000000000..fe592e04551c0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq9650-rdp488-common.dtsi"
> +
> +/ {
> +	model =3D "Qualcomm Technologies, Inc. IPQ9650 RDP488 (NAND)";
> +	compatible =3D "qcom,ipq9650-rdp488", "qcom,ipq9650";
> +};
> +
> +&qpic_nand {
> +	status =3D "okay";
> +};

[Severity: Low]
Does including ipq9650-rdp488-common.dtsi leave sdhc_ice enabled on this
NAND variant?

ipq9650-rdp488-common.dtsi sets status =3D "okay" on &sdhc_ice (in addition
to ipq9650-rdp488.dts enabling both &sdhc and &sdhc_ice).  Because the
NAND variant leaves &sdhc disabled, sdhc_ice still probes and keeps its
clocks enabled for an unused eMMC inline crypto engine.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-ipq9650_va=
rious_devices-v1-0-14f53b84c42c@oss.qualcomm.com?part=3D4
