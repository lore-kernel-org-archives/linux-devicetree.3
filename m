Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF6C401A25
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756800; cv=none; b=thfKAFSPNsAeIl5oQZVbLQdQ70s/d3/1u3ATri818GMHmnQKqrrzB2nYjk1MgjdxM/1CoX2np3OQQ8L+V6kytInFRg2JUQoPniN+SycQYLSH8X7SWN8sKgdTbWiGu/W7/Mesp/WcSzSeQCNNiY2TsnRhSmdOOwxE6fYWAVMgFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756800; c=relaxed/simple;
	bh=PXg7D8LTdQrIy81EbVKVhfn+Q3e08IN7x6ESv6P/mzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UsH9ocXrRxz8Ul/0WcXf1Dil8QnGxCC2oXhX0vNsDZrXWj6rxUcoYHVCkchlwAEZEdMy3S6HEBoHPmvD43Nl0mogayf9gBHqVpT8hGYjoBJK9u4GnNLN2QB4zBxPGr5b5hU/hyt3eNx0CE+jaoJgiR8rqayw3O6zTj0iP6ItBmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxBeH4BT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxBeH4BT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826E71F000E9;
	Mon,  3 Aug 2026 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785756798;
	bh=tV5usgEaZl3BIdaWlNIvVoHtSPOZU6NkHsJbkI9AxW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxBeH4BTdyxnvbpTG3irgVlT9POkJY+X6ExV4H5MhYVsmbHwzGD06j6lNmx3s0Xop
	 JmwlNnf95huIrCXYSWbGarZS/b7Kr3WlE6LV8HxGFONHnEtTGb578ipHRvnp/+e01K
	 AVTZrB1JRZUEhVmsPd/hRhuVme9UNYV+Y4r/BgqrAlmvNiPeSK8mFZ4RFmk5QAvGag
	 wR5bGM3tl39CSjmllTksMkbuxlp7z8XcrrcS1enYBWWvJUTyIdZGa4FGf2D6gnntiT
	 HnHSPxUqvT+L1hb40fCVM+VzLI5D4aR6p8NtHB0VNdRZqnP3Hd++U8HAx3qIqukPZD
	 V+2XKtI/c98yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/5] arm64: dts: nuvoton: npcm845: Add peripheral
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803111906.1931384-4-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
 <20260803111906.1931384-4-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:33:17 +0000
Message-Id: <20260803113318.826E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Devicetree nodes within the `ahb` and `apb` buses are not sorted nu=
merically by their unit addresses.
- [Low] Minor formatting and syntax style issues in node labels and propert=
ies.
--

--- Patch [3]: [PATCH v9 3/5] arm64: dts: nuvoton: npcm845: Add peripheral =
nodes ---
commit 40205ec616b5665717362a923f82f6de6bd0594e
Author: Tomer Maimon <tmaimon77@gmail.com>

arm64: dts: nuvoton: npcm845: Add peripheral nodes

Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
by the evaluation board and downstream platforms. This adds various=20
controllers including Ethernet MACs, USB controllers, MMC, FIU, RNG, ADC,=20
PWM/FAN, PSPI, I2C buses, and the OP-TEE firmware node.

> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index 545034ac11a03..32ee8d284d1c8 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
[ ... ]
> +		fiu1: spi@fb002000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
[ ... ]
> +		};
> +
> +		fiu3: spi@c0000000 {

[Severity: Low]
This isn't a bug, but should these FIU nodes in the ahb bus be sorted=20
numerically by their unit addresses? It looks like spi@c0000000 is placed=20
after spi@fb002000.

[ ... ]
> +			adc: adc@c000 {
> +				compatible =3D "nuvoton,npcm845-adc";
> +				reg =3D <0xC000 0x8>;

[Severity: Low]
This isn't a bug, but should this reg property use lowercase hex (0xc000)=20
to match the unit address and standard Devicetree conventions?

[ ... ]
> +			i2c26: i2c@fff0a000 {
> +				reg =3D <0xfff0a000 0x1000>;
[ ... ]
> +			};
> +
> +			peci: peci-controller@100000 {

[Severity: Low]
This isn't a bug, but the newly added I2C nodes (at 0xfff00000 and above)=20
are grouped by peripheral type and placed before the PECI controller at=20
0x100000. Does this arrangement skip the standard Devicetree coding=20
style guideline to order nodes strictly by unit address?

[ ... ]
> +			pwm_fan:pwm-fan-controller@103000 {
> +				compatible =3D "nuvoton,npcm845-pwm-fan";
> +				reg =3D <0x103000 0x3000>,
> +					<0x180000 0x8000>;
> +				reg-names =3D "pwm", "fan";
> +				clocks =3D  <&clk NPCM8XX_CLK_APB3>,
> +					<&clk NPCM8XX_CLK_APB4>;
> +				clock-names =3D "pwm","fan";

[Severity: Low]
This isn't a bug, but is it possible to add the missing space after the col=
on=20
in the node label (pwm_fan: pwm-fan-controller) and after the comma in the=
=20
clock-names property ("pwm", "fan")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803111906.1931=
384-1-tmaimon77@gmail.com?part=3D3
