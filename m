Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C237476CD8
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350604; cv=none; b=liST8OJ9Q5TyvG/7delDFDPp5LH4HI+BPCHfzkWsB039wivBrksM7oYyAaZ9XlNDMbzT4D2fL+HYPz5NcNOfK36GciTUSKwJyreonN0RHhleg4SuJooY/R65H9xzz3Tpz10CX8y++SLfItbNbH2x4jtUvlmxXPOhr/Su6aF/S3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350604; c=relaxed/simple;
	bh=4dFincDXttMKTXvWzclnZiEEXTDBvQyF11Ap0JZR5kw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HGbPEV8fnG2NHVRg7yW+Y4oLTBmEozxD2UaQSLggiSPuXUJWKmPVol1F42+6JKdN+ZZGul1ca1T4P5tczWrIOGspb3jG3AkHKZseoxhr93KCGtsXImNkRoMUGcYtJS2gVIMgTu5+nkVuBMOlhdUpalpjK06e80azYKAwT2fko38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQ5+mW1R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQ5+mW1R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514AE1F000E9;
	Wed,  2 Sep 2026 12:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788350587;
	bh=fZ8tBT8+zvbw7WbGtP/Ql5lzZoREfY/82f9b/x1i8vI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQ5+mW1RKHzhlg131bPtsfUYv/rKQ3nsmxw59hFhcjoMl1hJg6xtnyWjprqvufujt
	 gYPebZr1yJ6Ig54zYIG5fh3vn0vZwUEGEKJF3VRabFA9rIM2E5TfTfGjW3urDew8cH
	 hrIgLHz9n1ehcHqOtIA0nZ9zsO8E+7AVTE12u6Gek8JVo1x5Iow82Jc6GDWMVEHV2P
	 Bc/4c98QLRChXw5jobzaHJl/Hnt/nqX9JoVVQ1et18bn4M/aLTdCWEy3rlB9I7RmWe
	 p2NI52SGN7R9BCGjZemQxxi+UmDYKC2AlGE2vTMwVMa5mVu6kqpxGGij8EAV9Xq2et
	 UrCyZJMfpAJHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-rzg2-sr-boards-v4-6-4a456a422fee@solid-run.com>
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-6-4a456a422fee@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:03:06 +0000
Message-Id: <20260902120307.514AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect memory base address in device tree: `0x40000000` inste=
ad of `0x48000000`.
--

commit f502b3c798473b8b3737ee55d511455f5f7f315c
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb

This commit adds support for the SolidRun RZ/G2LC SoM and Hummingboard IIoT
evaluation board. It includes the device tree source for the board
components, such as memory mappings, regulators, and interfaces.

> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/=
boot/dts/renesas/rzg2lc-sr-som.dtsi
> new file mode 100644
> index 0000000000000..468304bdd47b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi

[ ... ]

> +	reserved-memory {
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		mmp_reserved: linux,multimedia@68000000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x68000000 0x0 0x8000000>;
> +			reusable;
> +		};
> +
> +		global_cma: linux,cma@58000000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x58000000 0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	sdhi1_pwrseq: sdhi1-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
> +	};
> +
> +	/* 32.768kHz crystal */
> +	x2: x2-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +	};
> +
> +	memory@40000000 {
> +		reg =3D <0x0 0x40000000 0x0 0x40000000>;

[Severity: Medium]
Is this memory base address correct? The RZ/G2L architecture typically
reserves the first 128MB of DDR (0x40000000 - 0x47FFFFFF) for the secure
area (TF-A / TrustZone enclave). If the bootloader doesn't rewrite this,
won't the kernel accessing this range trigger an SError?

Given the reserved-memory nodes at 0x58000000 and 0x68000000, should the
intended base address actually be 0x48000000?

> +		device_type =3D "memory";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-rzg2-sr-bo=
ards-v4-0-4a456a422fee@solid-run.com?part=3D6
