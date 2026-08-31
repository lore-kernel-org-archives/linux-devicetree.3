Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8103739C63D
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 21:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211688; cv=none; b=X+h9BQFr59+uI6jcaLJPUhYls1UE3aiSjnxS6hsQmtd3wVLxrkLePGA266cyQto1B7Sa3IQ4IHPDEJOquD81n4oK8c0xfdi4LccHoVOI7Oj0ZaHAGvia9gZbBtVySyfcKEF9lTvP22lEGH05YD8m60OcML7wtU8QfIbw3YVbTpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211688; c=relaxed/simple;
	bh=YZGggWt1Xosi9Qj5G+aPAuux/uJ8diAztxV9uf90gu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rt1O0gxulRpCKx4YE0NHp1isSZvJUH/5Df/Yjrb2c9y/1CVHzCPcND5IgHyWKm90Nnoq4n8BFBvCwznnkxJEwrnD7WaMB3uPbIVIf24imOeitu8J6uDFCEw+DjQuFF1vf/vYEhB3MZFdwtBEYp/oN/fAwJy/X+ZLT5hps9fy3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLBAWxfK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLBAWxfK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED7A1F00A3D;
	Mon, 31 Aug 2026 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211686;
	bh=Odu2HNFyAIygSQxxZLEKw/2kmbUw+Hljbd2Sv9tAoP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MLBAWxfKLiieYxmeXewGmaK3Q5ifBh1km3ocg2D4Ha8Xlv4jw20rJhoGJbh6cSbxY
	 U8jCNqhYRJcAvB5sqbhco6ShRYDl4UXpIqif5E2C+bmIZUvPn8Zj1T8YHRB8Onp5Aa
	 Cv6KgboThcPsm0ESrHyLiG40K6pc9oEhON2RQVbRVag1tVWkqll7N4FOa2O0UPpfQn
	 tckP7muHBx5fdevAozwwEWcBjmUXMe8mZmVPGc6QwEHCGwEyMAd5tM8jS9l8Rjj+sq
	 cBafBN+T1pu62WxD5QfmtN7E/9flXBmGINJh+UATlIokqEAVVz/tKTLsek6YbhdSOX
	 NN2OUNiaOGMsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2 3/8] arm64: tegra: Enable XUSB host function on
 Jetson AGX Thor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Chang" <waynec@nvidia.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260831185835.3732707-4-waynec@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
 <20260831185835.3732707-4-waynec@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:28:05 +0000
Message-Id: <20260831212805.CED7A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect use of the GIC_SPI macro for GICv3 Extended SPIs (ESPI=
s), leading to invalid hardware IRQ mapping and kernel warnings at boot.
--

commit 25f7b692b008d6ac4dd9bcab2f8ae074b1c59801
Author: Wayne Chang <waynec@nvidia.com>

arm64: tegra: Enable XUSB host function on Jetson AGX Thor
   =20
Enable XUSB host and pad controller on Jetson AGX Thor.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra264.dtsi
> index 013228a817237..e59b1b0a5b925 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -4147,6 +4147,160 @@ pci@8480000 {
>  			nvidia,bpmp =3D <&bpmp 5>;
>  			status =3D "disabled";
>  		};
> +
> +		xusb_padctl: padctl@8680000 {
> +			compatible =3D "nvidia,tegra264-xusb-padctl";
> +			reg =3D <0x00 0x8680000 0x00 0x20000>,
> +			      <0x00 0x86a0000 0x00 0x10000>;
> +			reg-names =3D "padctl", "ao";
> +			interrupts =3D <GIC_SPI 4101 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Medium]
Does this use of GIC_SPI for INTID 4101 lead to an incorrect hardware IRQ
mapping?

The GICv3 DT bindings limit GIC_SPI indices to 0-987. During system boot,
when parsing the device tree to set up interrupts for padctl@8680000, indic=
es
greater than 987 emit a warning and map to index + 32, which would compute =
to
4133 instead of 4101.

Should this use the GIC_ESPI macro with a 0-based index (e.g., GIC_ESPI 5) =
to
correctly specify the ESPI?

[ ... ]

> +		usb@aa10000 {
> +			compatible =3D "nvidia,tegra264-xusb";
> +			reg =3D <0x00 0xaa10000 0x00 0x40000>,
> +			      <0x00 0xaa00000 0x00 0x10000>,
> +			      <0x00 0xaa50000 0x00 0x10000>;
> +			reg-names =3D "hcd", "fpci", "bar2";
> +
> +			interrupts-extended =3D <&gic GIC_SPI 952 IRQ_TYPE_LEVEL_HIGH>,
> +						  <&gic GIC_SPI 4096 IRQ_TYPE_LEVEL_HIGH>,

[Severity: Medium]
Similarly, does this map to the wrong hardware interrupt (4128 instead of
4096) due to the use of GIC_SPI for an ESPI?

This will likely trigger a "SPI 4096 out of range (use ESPI?)" warning duri=
ng
boot when parsing the usb@aa10000 node, and could break USB functionality.

Should this use GIC_ESPI 0 instead?

> +						  <&pmc 79 IRQ_TYPE_LEVEL_HIGH>,
> +						  <&pmc 80 IRQ_TYPE_LEVEL_HIGH>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831185835.3732=
707-1-waynec@nvidia.com?part=3D3
