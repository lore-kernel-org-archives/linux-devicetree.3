Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04FC3C81B6
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553498; cv=none; b=KoqBPqt1PZ99m0TH/EBZIdbCMzmnXKvQTfKS4w+RGck6tswv5jMM2xjGGQKXRt9hoNvmy3QvmpgDGwoFJuvuoCSOwpi6zYsHsN3/1hc7ku8ORsTW10FFxCcXrCO32jb6jVIxsgURWhlRsYAKs9P92f//9O34oZIdiStA5O41Md8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553498; c=relaxed/simple;
	bh=1j3E0b2uX6IP1lZNHuRp6PMNgravfNs8hAeFgMp+lU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sVQ30NXCbAbaU2Tgu1iTSVxCuVpE99FYuhnNil0e6dKBkSnkJWGR/TSNpJBe2caagGrcvmGsOwbGkpVAvRuMpteKKm+EMDs4t4U+Wg1aiO6s54Dmc0IqJGbvDmCYW27gV4FYNqyY4PIxtt558iaQOXn2G2MWRpdMb5fzlv+kLU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3zU1uF1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3zU1uF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DBE1F00898;
	Thu,  4 Jun 2026 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780553497;
	bh=Aq/dyEOg5/dWpvsuIvoitz2jQxip8oixnEuIpSDgPD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P3zU1uF1WsLg/7UiTFsH6UeoVa7JUpayQuE0EcgqNlrBuZ8sNsAqvj+rtc2Jiqz1f
	 P7HPwMW5TdfndS2vYmUompJi0urP8BN+gP5Y9QQ24IbLaZjzakSCmSmmjGqsEYGwvr
	 LjrDPO4xZHzmcXShTLfil3O0dTZ5aLZS2wcqSW1EjEbTj6PKMFOJi0aQ3jlMjtqjZi
	 2xRL/LHLXxby5wpUcAEi7tahVoFuhA5E5/clB0vjQQ7mOQQ5Izf4lsHTPh4umT+sdQ
	 rJ8qbL3cWELq0FPJnjIgwTL47pPre3kCbgkfE8HNXhziAMDY5ELpBbV2u7CRS8nPiG
	 X8mLtbgTvKwsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: nuvoton: ma35d1: add CAN nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604060104.1662700-1-zychennvt@gmail.com>
References: <20260604060104.1662700-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:11:37 +0000
Message-Id: <20260604061137.82DBE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Device Tree clock configuration conflict: CAN nodes improperly for=
ce the rate of the shared system PLL (`APLL`) to 200MHz, overriding board-l=
evel settings, and fail to explicitly configure the parent mux for the CAN =
clock.
--

commit f23799073b0fc964077e998ef98a6998b5225d4d
Author: Zi-Yu Chen <zychennvt@gmail.com>

arm64: dts: nuvoton: ma35d1: add CAN nodes

This commit adds controller nodes for the four Bosch M_CAN blocks found
on the Nuvoton MA35D1 SoC. It also configures pinctrl and enables CAN1
and CAN3 on the MA35D1 SOM board.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dt=
s/nuvoton/ma35d1.dtsi
> index e51b98f5bdce4..584dd8d44701b 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -244,6 +244,66 @@ gpion: gpio@340 {
>  			};
>  		};
> =20
> +		can0: can@403c0000 {
> +			compatible =3D "bosch,m_can";
> +			reg =3D <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
> +			reg-names =3D "m_can", "message_ram";
> +			interrupts =3D <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "int0", "int1";
> +			clocks =3D <&clk HCLK3>, <&clk CAN0_GATE>;
> +			clock-names =3D "hclk", "cclk";
> +			assigned-clocks =3D <&clk APLL>, <&clk CAN0_DIV>;
> +			assigned-clock-rates =3D <200000000>, <50000000>;

[Severity: High]
Does setting the APLL rate here override the board-level clock configuratio=
n?

In ma35d1-som-256m.dts, the top-level &clk node explicitly configures APLL:

&clk {
        assigned-clocks =3D <&clk CAPLL>,
                          <&clk DDRPLL>,
                          <&clk APLL>,
                          ...
        assigned-clock-rates =3D <800000000>,
                               <266000000>,
                               <180000000>,
                          ...
}

Since APLL is a shared system PLL, probing this CAN node will silently
overwrite that 180MHz setting with 200MHz, which could alter the
frequencies of other active peripherals relying on APLL.

Also, does this node need to explicitly configure the parent mux?

There is no assigned-clock-parents property here to route APLL to the CAN
mux. If the bootloader or hardware defaults leave the mux parented to VPLL
(which runs at 102MHz on this board), forcing APLL to 200MHz won't affect
the CAN controllers.

CAN0_DIV would then incorrectly attempt to derive 50MHz from 102MHz, causing
inaccurate CAN baud rates.

These questions also apply to the can1, can2, and can3 nodes below.

> +			bosch,mram-cfg =3D <0x0 4 4 32 32 32 8 8>;
> +			status =3D "disabled";
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604060104.1662=
700-1-zychennvt@gmail.com?part=3D1
