Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262954;
	b=a70HokyIW6ANIhlfjmM6oPV9h8VYXoRafMYI81XsNXiSsjhWHwBlLVU6wYdumc47436x
	 sj1d8yRYV6lz3MujxpW2Ezu8QYmMoPpehSIMWusCySV3CmBMK/NANPecCbWsn6i5lahPi
	 8yrWo5rION/v+4ZdasDUUADo3Mbr/mSlgTPqscTi2TrHBZTCv3mxQrySmUvARy32uNKXv
	 l8K0qIYH8y6b4ZSFIVal1DR2YFm4GrnB0Gk3ATde/sb3jUh2OP6wpXgI+t6KNKzCoQMot
	 nEhJejx5o0e4ORVLl9+p8OG7QZ/IzQQAvkRd5deoDJhQ2yGaF4JC2Yylnnc6/oJ8dUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262954;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jdAoxp7j24IGCyYpFNEy7lv88iXhyeVK+x0vKl9556s=;
	b=1cYgDBVEg+0djH1kHjY3ZeVRVUdcWhSTpZCO9fOMsqi03yDKKe0tmjzbATeElEZ3ybr1
	 xldJ/4rlofTJ3t+YyaSYrf8jllUXSE8AeZkTKfpbswySNxXCOcTcMc6tS0i9uYZ9j8D+2
	 ACglnM9PpWBm2kV1jgl7ZrZuK557hOrHDT/RWYkY1EEQrSwQwwm3aAyg0bjzm3qTGKuOY
	 sTx0bIBj7PK5gOTa75dsvaI1S0yC136M7s0dTRifgM+yip9bLpO/0m87WliEsnh+iIvPW
	 ijoREnfqEOtZJYLW5Ne+h8iVEN+X3UnI2yfGXZAQOKHoTwZdMYQtcpfHzubbKab5Y8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrytBAw+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF8660A263B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrytBAw+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFED51F008AB;
	Mon,  9 Nov 2026 22:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794262954;
	bh=jdAoxp7j24IGCyYpFNEy7lv88iXhyeVK+x0vKl9556s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MrytBAw+O2zhFQfCFkNkbR+wUKa0ncReLDpjpSai6L/yPR6VCaE7F9BwonWBcHlh8
	 KhBrpzvLLgcY6tyHW7qI7LCMBoiIZTqf7mWjAfm1yC+LYnturGhgOD0hIS9g9XK7sC
	 weiIRaNxqEVH181WyvSUxLOqjIGkGs6gcCLq99bP1RuJHCZQM0tCIsA8tPsrJ+zou2
	 BbpMYhWGbjbGc57iYETvnxi/3j6gCt34XF9j5c0HLzkYrAf/F4jv9iROnYXVsqc/pB
	 9c08WXoK9kUXCRaa6cDniuKVFIrf/Y6y6Q1pY4K61Wg/ClE5w+HSkS/uFZ2blM2//b
	 3lvgNw//GYmBw==
Message-ID: <sashiko-outbox-205717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi632: Add LCDB regulator node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109221453.658316-4-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-4-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:22:33 +0000
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
- [Medium] arm64: dts: qcom: pmi632: undocumented regulator@ec00 breaks
  dtbs_check
--

commit 59a61b0cda3ab4cae16c1eae412c4c0a133346c4
Author: Val Packett <val@packett.cool>

arm64: dts: qcom: pmi632: Add LCDB regulator node

This commit adds the pmi632_lcdb LCD bias regulator node and its ldo and
ncp child nodes to pmi632.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/q=
com/pmi632.dtsi
> index b0ed35094a98d..ab850050eb22a 100644
> --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> @@ -204,5 +204,19 @@ pmi632_vib: vibrator@5700 {
>  			reg =3D <0x5700>;
>  			status =3D "disabled";
>  		};
> +
> +		pmi632_lcdb: regulator@ec00 {
> +			compatible =3D "qcom,pmi632-lcdb", "qcom,pm8150l-lcdb";
> +			reg =3D <0xec00>;
> +			interrupts =3D <0x3 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
> +
> +			status =3D "disabled";
> +
> +			pmi632_lcdb_ldo: ldo {
> +			};
> +
> +			pmi632_lcdb_ncp: ncp {
> +			};
> +		};
>  	};
>  };

[Severity: Medium]
Are the Devicetree binding schema and driver for qcom,pmi632-lcdb and
qcom,pm8150l-lcdb missing from the tree?

Neither compatible string is documented under
Documentation/devicetree/bindings/ or matched by an in-tree regulator
driver, and Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml has
additionalProperties: false without a pattern permitting regulator@[0-9a-f]+
child nodes.  Adding regulator@ec00 causes dtbs_check schema validation
failures on every board DTB that includes pmi632.dtsi, and boards enabling
pmi632_lcdb will fail to resolve the pmi632_lcdb_ldo and pmi632_lcdb_ncp
supplies at runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109221453.6583=
16-1-val@packett.cool?part=3D3
