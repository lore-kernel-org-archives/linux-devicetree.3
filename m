Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962403;
	b=wIGUK5lcvWrkN44qlY0sxPJ+vmvGdVa3Y/H1erezAzBcA6Z1UgzGdt3tK2OFE0h0Xwcw
	 fcaFxGqr9n3Gue7nB3IduEJuLkG1pHjGawBGwnfzZ9/tAZPGc7SBEB87rmbIIkuVyqa/C
	 8DfMY219GRAoFoXsdy9mlmljFjkDvQDPfV9Z+lb1/KZ95VJaAhkueAuhdeE7p2Il0Qerj
	 pkWg1CAb4LB4z/V75C+BEOZWAVE3AXh2DR62RUBLkOdjiEizfJPIOC6Q3S0YHcLhpSix7
	 gyitd/dyXnVq0fVF25mIxVxsIDCGs7gBE9N2ksiGdkZuVFmfPZH0lJxBmyXwvvx6RnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962403;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8uOm752qSbHewlwvTq64qs6Wrb1DhXsjIgUxAiKYfJI=;
	b=iFMMtQrLkn+Rpv5QyqjUk93ouJjK+gLErt4K9FFxzHSExdcw4Yt/TpneeAF9OwHpcw4b
	 LSWG8SZ3ty88X5h0BoUhS93Txkc4mPpkry/rqPVmgRN9Ml15P3VJlciaWbw+3TSzDL+k0
	 ReHDI/aaLX9T3VKrx4XDLMw0eiDyjaUQ9MsOW1pGFNbQsOsIe2lwzZw4Njj1bQYtlgz/+
	 ALG/Q3yKJCBKXYoc4QG+KALr0wEURf60ueVyz6B5xrwYEQXdGiH3JF8B9gcQMe63JgQpX
	 9DKBR8CoMcm+Cy0tRwb/t1SPTk8UVnAkIPCbgId6YCWWUqV2OGkz6P4VSfix6fUjk6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb74MZKP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532F606A33F
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lb74MZKP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6BE1F008A2;
	Fri,  6 Nov 2026 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962403;
	bh=8uOm752qSbHewlwvTq64qs6Wrb1DhXsjIgUxAiKYfJI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lb74MZKPJpgMAashAyeBJ3hqeVIsyKY3nxEyEE7IUrH0+9Iteovv0PfkkCdV7tyIY
	 Jh34W4RQjNCcpPf92hs/CAEb9ni85zCqqyRhwUfYt9cc3aPMMVLyTtLLnUdq6jjAZA
	 ioiNEcCY6PIQjGIHxj1nnKk5JCEv7JUdpS04YWFwkpriWLYTWcXU1hri0eODadgS/A
	 D9J6yo1FJhLZrhQ8KQBqWzTfJf5c9XbFOH2vUqC5Hh9g2MFk4U7F9hcHHs2jNBlHTg
	 e4+XIBhuqEtJBXWM9KnVGn2tg2aUDHZXX1m4ubzpMV5+f/PW7N5MLf+P8wG2gohl5J
	 5XtT8iMOVLqBw==
Message-ID: <sashiko-outbox-201239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] arm64: dts: amlogic: meson-s4: add the GE2D
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-8-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-8-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:53:22 +0000
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
- [Medium] arm64: dts: amlogic: meson-s4: ge2d node missing
  amlogic,axg-ge2d fallback
--

commit 0db40a28ab18ba3c72a34659bd708d3e86073c70
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

arm64: dts: amlogic: meson-s4: add the GE2D

This commit adds the GE2D 2D graphics accelerator node to the Amlogic S4 SoC
devicetree.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 1e8b845b80c31..8bbd70e52a299 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -199,6 +199,16 @@ soc {
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> +		ge2d: ge2d@ff040000 {
> +			compatible =3D "amlogic,s4-ge2d";
> +			reg =3D <0x0 0xff040000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&clkc_periphs CLKID_GE2D>;
> +			resets =3D <&reset RESET_GE2D>;
> +			power-domains =3D <&pwrc PWRC_S4_GE2D_ID>;
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Should the ge2d node include "amlogic,axg-ge2d" as a fallback compatible st=
ring?

meson_ge2d_match in drivers/media/platform/amlogic/meson-ge2d/ge2d.c only
matches "amlogic,axg-ge2d", so without the fallback compatible the driver w=
ill
never bind when this node is enabled.  In addition,
Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml sets
additionalProperties: false and does not document "amlogic,s4-ge2d" or
power-domains, which causes dtbs_check to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106104659.5465=
6-1-christian.koever-draxl@student.uibk.ac.at?part=3D7
