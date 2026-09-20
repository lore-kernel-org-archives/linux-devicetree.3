Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C93D16FD
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881595; cv=none; b=HhZ8g4CZx8vq+LBUyqQ2TkJR5c129v9w5cLkw8OlNvlICmzuAdJTfMo8huNOChfyGpIXpsTyxxmuF/+oE1kbHJd+F0qChObpgdLUFdpiEc0M5QxCPEhWp+twMZYmVLDwSCiYxbWeLqJ0To5epEA9q78RIWqxDznnZ+ppFDXksUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881595; c=relaxed/simple;
	bh=PGOkuqSW8j6e1sMY6nfIJg2sBKqRLUAR96wbjo4ADXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wo0bZqkh3F5XWKK4f69kc0hgnHxt8IRQAzwjtU1TGOh8pRy3tQJ0fpKPRDqv6xvJdCvg/DVIqk/1w8X9+XFojZhT/xKEDdQNS4sbUxC6T+njawxjaLHb4DngulLJsF+CTcNPoa0WdRz+wZ+rF+o2tTw7HmbvFsnaxew7Z2rcvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcUOaLux; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcUOaLux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E910C1F000FF;
	Sun, 20 Sep 2026 05:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881594;
	bh=cnvvmylBVk3rtYs5jtBURlYDliNcV/0OOc0XReQaXHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BcUOaLuxbtxitmCz3EbztTPX+x4CiPuY5ky5L2LPyQB71kCM2ygNRZuIVbbSsiyd1
	 GepmydjN+ZNf9PzWMo4/4cpqEPZC4K5zK6dSJlSlY4gbnajqNuFQcko3lkn68PYuRd
	 K484HxVzajUqH/O02vlggsqE/fWR7SzMtKxRQveztCbukxZ7PWjaiFshQkeZ8GPNPu
	 SJRrUkF0gwBNEIlTiuPkoL9HKkFeZ+OeMzKvW+pyZZVa/Wy5kQwciGQUzJOleStPKS
	 OhCO0bWgdvIsIqhra/IY9MKgQcCXTDaMy59AP0sF4IbAxeTq5kOIe0T0Gv+CpyXi+N
	 u9T9qii58C3Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/28] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-23-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:19:53 +0000
Message-Id: <20260920051953.E910C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: missing reg and address-cells in unit-addressed dai-link nodes
--

commit 2807e1e10c5e8e2ab5f1a1be50044624cb7a4535
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8112-j473: Add speaker/headset jack nodes

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/d=
ts/apple/t8112-j473.dts
> index 105a9d118980f..50088283f2e8e 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j473.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j473.dts

[ ... ]

> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j473-macaudio", "apple,macaudio";
> +		model =3D "Mac mini J473";

[Severity: Low]
Does this node need #address-cells =3D <1>; and #size-cells =3D <0>; proper=
ties
since it has unit-addressed children? Omitting them causes dtc validation
warnings (unit_address_vs_reg) and fails the apple,macaudio.yaml schema che=
ck.

> +
> +		dai-link@0 {

[Severity: Low]
Should this node include a reg =3D <0>; property to match its unit address?

> +			link-name =3D "Speakers";
> +
> +			codec {
> +				sound-dai =3D <&speaker>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&mca 0>;
> +			};
> +		};
> +
> +		dai-link@1 {

[Severity: Low]
Should this node include a reg =3D <1>; property to match its unit address?

> +			link-name =3D "Headphone Jack";
> +
> +			codec {
> +				sound-dai =3D <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&mca 2>;
> +			};
> +		};
> +	};
> +};
> +
>  #include "hwmon-mini.dtsi"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D23
