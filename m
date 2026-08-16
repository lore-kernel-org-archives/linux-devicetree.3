Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF037F321
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909718; cv=none; b=cRonV70+2r0Hm2AOYEF5fRmZ6o10wAAQSmvptOe6xx00wDDzffQRyZtwXeVYFZhmfh9Gq2mQE+bOKCpFPKOdklHAuQIUoa8+irEnK0Gi+bmUguZxiiHaDTfH751S54bDgvKIee9225gJkknpS6HAkUhamFmb566z2gwouevCaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909718; c=relaxed/simple;
	bh=2A0tVAoerr7LmGNo74qOzI8TI6WxL6NAjYJpfQFIVDA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QmAc/GcI+geXQfrS6+47T5ibEDxIKdJlEM9L68xG+r1I7YK2sijnZAVtbp1S10v4wuLplqpBT1cdhzRU0FkQJKfjvJtww/EeD2JfDU+afQQMM1dVkwB4QgFAV4MMOR3eWkYwbx1Che+MO6fmkMQgc/Hmws5MwZ7IrcXlV3rL9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDEbqSe4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDEbqSe4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D0B1F000E9;
	Sun, 16 Aug 2026 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786909717;
	bh=NkjYp5jBvYgv0RQQJgTHFuWm52/Kdazthz+9KpTCVdw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bDEbqSe4VbkUtz8hG/IviY2YjfKbja7jJQBWWUXQeduMSj0ZQnKrzOlk+9p/wX2+W
	 JWwf5U7Ea05JC0kr2ggdFFqSbPwRq5SnG5eWFR47wG3SCPbKafyVP4uGiKfaDTIRHq
	 4GsIoHwAILkX1b+0xtquMb/2wk3pam1ZJZAH0IB1N+auo36XuPClMhdh3e+2Jyt4S9
	 /+e4LEgAJ76iKjAvrjAJaHDOnxZvfTyDbbFhpVp9gRmyYjgAewjBMt8YdUZxvWNIv0
	 nRjLbF/0Gw9UH70SxqEB4TyzRwffIlGc6e7QbvKkLr0gYLOO+bUD29mOKK/wyp6uBk
	 zsvwroQIF2DUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: rockchip: Add crypto node to
 rk356x-base
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Olesinski" <dawidro@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260816194112.552100-4-dawidro@gmail.com>
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <20260816194112.552100-1-dawidro@gmail.com>
 <20260816194112.552100-4-dawidro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 19:48:36 +0000
Message-Id: <20260816194836.C7D0B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `crypto` device tree node is missing the `status =3D "disabl=
ed";` property, contradicting the commit message and enabling it by default=
 on all boards.
--

--- Patch [3]: [PATCH v3 3/4] arm64: dts: rockchip: Add crypto node to rk35=
6x-base ---
commit 452b9449e76bd94304ad239887547298226d6bf8
Author: Dawid Olesinski <dawidro@gmail.com>

arm64: dts: rockchip: Add crypto node to rk356x-base

This commit adds the device tree node for the V2 cryptographic hardware
accelerator on RK356x SoCs to the base dtsi file. The commit message notes
that the node is disabled by default and should be enabled by board files
that wish to use hardware crypto offload.

> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
[ ... ]
> @@ -1112,6 +1112,17 @@ sdhci: mmc@fe310000 {
>  		status =3D "disabled";
>  	};
> =20
> +	crypto: crypto@fe380000 {
> +		compatible =3D "rockchip,rk3568-crypto";
> +		reg =3D <0x0 0xfe380000 0x0 0x2000>;
> +		interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru CLK_CRYPTO_NS_CORE>, <&cru ACLK_CRYPTO_NS>,
> +			 <&cru HCLK_CRYPTO_NS>;
> +		clock-names =3D "core", "aclk", "hclk";
> +		resets =3D <&cru SRST_CRYPTO_NS_CORE>;
> +		reset-names =3D "core";
> +	};

[Severity: Medium]
Does this node need a status =3D "disabled"; property to match the commit
message?

The commit message states: "The node is disabled by default; board files
that wish to use hardware crypto offload must enable it."=20

Because device tree nodes default to "okay" when the status property is
omitted, the lack of status =3D "disabled" here will cause the cryptographic
offloader driver to automatically probe on all RK356x boards that include
rk356x-base.dtsi, rather than requiring board files to enable it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816194112.5521=
00-1-dawidro@gmail.com?part=3D3
