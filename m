Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307D0372B26
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680593; cv=none; b=fR4NFKZDBT1xSXN0DiUZh1BeI/K5GYxN4hHDz5AFkUWGyk9tbuF2wptLYnKTeM48uc1bS4jwxCJsbocslCq9YoaEweMx9MEX6wEQsusLG1V9U7b7pHWBv/HlWB7tCl3SOisBPjceHZZbU/Tp7qeo8rSvZKc0cfbqEy/DOzSeMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680593; c=relaxed/simple;
	bh=ZX3bUxDEXGTm7dwHrID/oNd+FVDmtMhJrGEtTHaYRgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=erdl51Y8ILtnWAUpUZL0lVkzD9xJFg9OXPufpEaXeXCgR5JmQmT/SRbgS8plE8SmcTS2ppLwesq2NZTFGlWmlInAThqIb1YJfFStCF1hpXaWS6hqRBl4tWg0AXDJ5P1A0mKiHg4MRSCbVL/MMd29Gqs/wXb3c+uFkHBLDEH20UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xmdofa1y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xmdofa1y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6D11F000E9;
	Sun, 28 Jun 2026 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782680591;
	bh=7zoxA2cQ298cfHu8eYbUNPOq7DoPlLLcx7GOhGDMur0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xmdofa1ymenkwwviETNyJ8UXNvB4QIaBqFLZmLrzoOJdAT7e+qnncCHcRC19H3W2W
	 piLGR92hoXwLadd1gS4HcQF9w09LH81XspBXAXbM3Y80eKFX0NZ4Gkk9YUYw818Rk3
	 96Z3rb4E/ff+NPIDtvQWLsbcEKH32j9Zjze3pd6zkzcaBxOTXasl/r5eHNBcBrbGST
	 3gnU2ObtYdzStgKlcyd1ndJHn9EWmbtjq9TAsl+nFgXF2blkGCaij9y0Zv/Eedxo1F
	 wQA1gyLoASdEx/Y/qVTNddAs6NBmC+Ld6RqAuqQakCHN0FyN0n8GdztAGuDxm1q7mC
	 QiZVGV6p8M73Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: var-som-am62p: update audio
 codec configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <76e49b33e7810b7cf6452cf827d88b5d0f04ba3b.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
 <76e49b33e7810b7cf6452cf827d88b5d0f04ba3b.1782680023.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 21:03:11 +0000
Message-Id: <20260628210311.9B6D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The DMIC configuration is incomplete; it configures the DMIC clo=
ck but omits the corresponding DMIC data input pin properties, rendering th=
e digital microphone path non-functional.
--

commit 44edbb6a5df165de90ef2fca3bdea4c204ee25b6
Author: Stefano Radaelli <stefano.r@variscite.com>
Subject: arm64: dts: ti: var-som-am62p: update audio codec configuration

This commit updates the WM8904 audio codec configuration on the VAR-SOM-AM6=
2P
board. It sets the audio reference clock rate to 12 MHz and adds the codec =
DRC,
GPIO, and DMIC configurations required by the board.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/b=
oot/dts/ti/k3-am62p5-var-som.dtsi
> index ca2483a04b9d9..8a8dec80cb30e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi

[ ... ]

> @@ -203,6 +203,23 @@ wm8904: audio-codec@1a {
>  		DBVDD-supply =3D <&reg_3v3>;
>  		DCVDD-supply =3D <&reg_1v8>;
>  		MICVDD-supply =3D <&reg_1v8>;
> +		wlf,drc-cfg-names =3D "default", "peaklimiter", "tradition",
> +				    "soft", "music";
> +		/*
> +		 * Config registers per name, respectively:
> +		 * KNEE_IP =3D 0,   KNEE_OP =3D 0,     HI_COMP =3D 1,   LO_COMP =3D 1
> +		 * KNEE_IP =3D -24, KNEE_OP =3D -6,    HI_COMP =3D 1/4, LO_COMP =3D 1
> +		 * KNEE_IP =3D -42, KNEE_OP =3D -3,    HI_COMP =3D 0,   LO_COMP =3D 1
> +		 * KNEE_IP =3D -45, KNEE_OP =3D -9,    HI_COMP =3D 1/8, LO_COMP =3D 1
> +		 * KNEE_IP =3D -30, KNEE_OP =3D -10.5, HI_COMP =3D 1/4, LO_COMP =3D 1
> +		 */
> +		wlf,drc-cfg-regs =3D /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
> +				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
> +				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
> +		/* GPIO1 =3D DMIC_CLK, don't touch others */
> +		wlf,gpio-cfg =3D <0x0018>, <0xffff>, <0xffff>, <0xffff>;

[Severity: Medium]
Will this introduce a regression where the digital microphone path is left
non-functional?

The patch configures GPIO1 to output the DMIC clock, but appears to omit the
required DMIC data input properties like wlf,in1l-as-dmicdat1 or
wlf,in1r-as-dmicdat2.

Looking at the wm8904_handle_dmic_pdata() probe routine, if both data inputs
are missing from the device tree, the driver explicitly disables the DMIC
core by clearing the WM8904_DMIC_ENA_MASK flag.

Because the DMIC core is disabled, the hardware holds the DMIC_CLK output
low entirely on GPIO1, which prevents the microphone from working.

Could this regression be prevented by adding the corresponding data input
pin properties so the codec driver leaves the DMIC core enabled?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782680023.gi=
t.stefano.r@variscite.com?part=3D2
