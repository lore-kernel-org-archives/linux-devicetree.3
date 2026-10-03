Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAF34D93C
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791051110; cv=none; b=cVe4AT7x/6Y2Og/VZzpTdds9iLOn+dqOHmjQHLuoh1CdsWXDpQdIqMTq1HQ8tLtmVWhJHha8pQ9n6V1jZ5A8ziyIelSwN/V0ZNFLdd0V57MqFiehqLZUAGXgRpx+wfOfDP/ko1n5iTznmlEWORTu6Pma29r3buiKMywaEsQK7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791051110; c=relaxed/simple;
	bh=pJeFZOEQp+7oVuFaJc7uoozY4Ag/g6ewGxDrsAS2OE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dDDahMkJOe5qDnOvpcpx6PNT8oLFY8/TFSOZVPlxATLyn1fGWDn0fTRfVaSIM9/J4LLcOPb6Fp/DCMkz4hBnNK6ysh4ELhAKyN3knoVdsUomeo0YTUjhyUjx7UpdHmOqjuIo3AJPEL7wWG4hYXcaIm03l4aMEQGuSyrZk+ck5D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LX3NlxlM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LX3NlxlM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B033E1F0089B;
	Sat,  3 Oct 2026 18:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791051109;
	bh=Exx6DSCklf/MP8QfAVWpbDPoXARtOfA7Ma/Oj8KdHTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LX3NlxlMdhZnwUrbbIBJ4t75BpflNL8Yhv0cNCQrLIYXCIbxUSG90e1wd2NYC1A1b
	 lzREnmA4kbLLQ0cIAnM02sbW8tgcwpXArJQfEa5bQF5C0Yi0TT0qWpLU2s6LnjiDyG
	 6cvM2ZrFOXjv6170Gkd6Fhl8Swn+tKUpfyUAvLrlF11oPLaZ23rSsJbzOvI7duhHsd
	 IRftpnbLea110p1TPwrH3UoWHd/FhSO5fCX4AagtD80vqs7oV96HkuuMTtlKefU6Ve
	 57MIzbHLgGsklxYhJ4S6/CJc/5Uf+jZjEfk/m3bB2mk5d8EmJYYF6Zde3el231sRj4
	 3E+GM5knN4Haw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] arm64: dts: qcom: sdm670-google: add sound
 card
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261003175659.23536-12-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 18:11:48 +0000
Message-Id: <20261003181148.B033E1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: incorrect routing of 1.536MHz bit clock to AHB interconnect
--

commit dd0eb0dfbca83fed6d11405e093c6017f1613bfc
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670-google: add sound card

This commit adds devicetree entries for the Pixel 3a sound card. It
configures the WCD codec, q6asm frontends, audio routing, and the
associated clocks for headset audio.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm670-google-common.dtsi
> index 73639b0271e9b..fadd3b5eca42a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
[ ... ]
> @@ -52,6 +53,14 @@ framebuffer: framebuffer@9c000000 {
>  		};
>  	};
> =20
> +	clocks {
> +		int_cdc_bclk: int-cdc-bclk {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <1536000>;
> +		};
> +	};
> +
[ ... ]
> @@ -528,6 +618,17 @@ rmi4_f12: rmi4-f12@12 {
>  	};
>  };
> =20
> +&lpass_codec {
> +	clocks =3D <&int_cdc_bclk>,
> +		 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +	clock-names =3D "ahbix-clk", "mclk";

[Severity: Medium]
Is it safe to supply a dummy 1.536 MHz bit clock as the AHB interconnect
clock here?

The underlying digital codec driver unconditionally requires the AHB clock
in msm8916_wcd_digital_get_clks():

	priv->ahbclk =3D devm_clk_get(dev, "ahbix-clk");
	if (IS_ERR(priv->ahbclk)) {
		dev_err(dev, "failed to get ahbix clk\n");
		return PTR_ERR(priv->ahbclk);
	}

By satisfying "ahbix-clk" with a dummy fixed clock, the hardware state is
misrepresented. The driver will successfully "enable" this dummy clock
and proceed to access registers.

If the actual AHB clock is gated by firmware or another driver, could
this result in register accesses without the bus being clocked,
triggering a bus stall and a synchronous external abort?

> +
> +	assigned-clocks =3D <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBU=
TE_COUPLE_NO>;
> +	assigned-clock-rates =3D <9600000>;
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261003175659.2353=
6-1-mailingradian@gmail.com?part=3D11
