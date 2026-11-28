Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795887535;
	b=cTPEDqsNt1erD25QtBSk6XOXAFiSSm/1RIzOD+dWORmQtHrEnbFYcUmAZdpEstubBJKl
	 65hlC2UvSCoZUKSSLY7v6sQGGA6qOdF9zdz/o2kKGVtnAh7qh4/GxS3C85SerJD7bpqHe
	 jwF0yjjjt7y1iIQWHi1cBJtCnyw+LsKh2NJzFbtJEbB4c1kkXVGT39iMlelScU+tamE7H
	 c1cG5OEg1GPRvwHtJCn2M8kRJdgqZhAA0qGitpq1APqVpK/HrVOojY78GTU2HYuFw2n+4
	 MB5dYqR6BaiZCI9Gz88VCgX24IEvLCXT9a/bIq3gkSmCDWaI1lUdT0r+10mri7q7pWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=YezWduZI3dCs3swwAq4frMtA1a30WOuo2X+jYwcZoAI=;
	b=j4xqyrt0gnMbiGHQ0gga+xwlWYS7vensRFGeRIdmlMKLn5qk8UxU0EBOP/Xg4StM8OcR
	 qbukfcNXMyQ2DnKDYgc9FIfW0NjJwFLxsM/+mcvVzYRq+VfwBm8B3zETlkB3fJOfDSD9q
	 xSD35EWiT10YtIxwLwMnq+4k/RAlTB3FrsH9TkeZHHvD4XS028W3TFXKFw7NpTsJLFBNn
	 WcxAIxj4WBcTCqIihJv6q7/PKJ/rj7qFsEjbfzRv5vXlExUW7g7/kPafqT/SBcxQhNLDC
	 0VAr0g98E7JEuSnyjlnWRi58hYj44MtZEcbrgm6ot1mpxXqyKygsESEOYlKKx6M0FHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eJt/xZjQ";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E41606A324
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 17:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E41606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJt/xZjQ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso84124675e9.0
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795887534; x=1796492334; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YezWduZI3dCs3swwAq4frMtA1a30WOuo2X+jYwcZoAI=;
        b=eJt/xZjQj6mLVzLCoPU64MhALkQSgj4g0aaGMfu681JglmpwWORnxaRvp0NmE4QE55
         8Ehz9DJfIdguAX+bsaW/2KCQ3nk7fKncjudtX5nAXMKXugNqxr8kgKxxB6QQhgPjf7Ph
         lrj6ErCAgSq2cy74jsick+5BtbVX+McwUDZD9trS6DzL/LiVJe8g2bx+oSRvwKPIw70b
         BgIrMjlH66Nz/xfxKNE+mn4mLPalbfpgBohAcNo9pulFSqKYxwppUYrJDTB6tlQlEjRd
         8kGYgPwOAm78ODTpgT/4tmfWhCxp8LJESxC0XvUu5GLofAZqUZwVPs12O3C0MMJfgsrl
         CMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795887534; x=1796492334;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YezWduZI3dCs3swwAq4frMtA1a30WOuo2X+jYwcZoAI=;
        b=TyL0yJ0C52arimn5XL+OgJX0iYVtDdtSWtDSWaay0gDhADpVI/wjfXS3zy6S4/SWON
         coi5QHMJOCUPVrZgN3QtRaJVHD5CBQo7gD2olta5p45xCUCmww2uLOzY+6cFhlG6j+4o
         gd4+odYkafznnpYk7Odc5yXX1zhRyjeOUqUDSMviGN4+nDyLAGs81qBR2X2jt3jJyRXH
         4BMGSJhExX/qXIuSn5IDZsow9AEclG9U+B7vVF4BncHi8ouSnwfAFH/OAKvXHKdodC7R
         6aEYjoqpmtae4l/KLYV9YoUguXYXHDy8JCV0QT3G0dg2OjV5zjeFxLspXhX9Q6rsKGfQ
         grDA==
X-Forwarded-Encrypted: i=1; AL+hErF7UW3PYVn+k1k5bmYMFNSbrKxnKuoajbk7TTc6au45RwT4x8/ax6rGDhbi6+PxTa/Z1c0nijn+CpD4@vger.kernel.org
X-Gm-Message-State: APuU4Z8RnfWIvD3VhDld4UhYayt3mf/+4hP/d/PCMrdwT8ef2k3LTxmc
	7yze2tl3dkzPHJzOm1u4lH/4fewxbBy4SPH3Ub8fbxDTKrEtAv3ZH6VJ
X-Gm-Gg: AZFdTZfBCUb63EQpv2uiLToQ+KRm4UZQlSokl6ICTGbJ/7Q/U7rzfc7s9Dnsu/tvynt
	F2upzcyIw/nHdzAfgSzjB8SBoY9e3Fl4QktnzX5BJvb2VQLjJ1Icv9Cri1WX+3ggHnHvR4ZKQm3
	P8F7UapRRviW10rGsiCxj85LXToL50xkiF3XtlV0ofkcxoOSwPnydDmQRtJSljyPZz1C4E9PDO3
	hHKZBU4sjgKuZJa7dj3Lkt5QE/8avptQNsK+3/mDXFxHgXE+VEDOVK2rYeA4BlkpRJnzAGHQx70
	Whrv/3gQZExG3fbwxS4t2thHydiET2F4Pe/onp2Gu4v+/zE5HoW15rir9DYDCO8eiyBPNuLayWD
	kl5klyrol5RZliFZHjm2mdysLiS2hDpVOVWjryQmewSGIAyOfPxOkibuv90ByNCK6KzBQ1MlQpz
	z1NH65PxY7ydPkS3MAgK18tgF8120vRu8R3YrXgn3OMneIt4wfuyfVb4jMb90vZucamMtAvWYIi
	JgdzgIJZ3/JsR3rzOT7XBYu4nVQniS7DX/rdW0a6tAnpFaoPMex68RXFStEcQTGDQbX3yl+vdaw
	a5hI/55Rfng6aqodj/+rM1NalzBh7YB4K+M1DqcVW8vXGwDhAKcRfdgmYiLU5Aq078PEWJCJM5F
	Dm289dciZNh6dQ3+HBuNVvnCa0/nk8hLHiZmN43WEaTIZzRS5vDi/2h77YSfc6YpyoAuOMC9KTS
	zwUNrD4lin79RVbUnX6lEFv8uv9jCMGywKFKiNAlForxCcBlWlSUBZMuP9/y+13vMpio5I1Rs+S
	I5gdu3nB7HGIrTzBtkVrZFWilVVDyEhvEreCw3i68RUlQM=
X-Received: by 2002:a05:600c:8b5c:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb8880f621mr618917745e9.17.1795887533807;
        Sat, 28 Nov 2026 09:38:53 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm809329415e9.7.2026.11.28.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:38:53 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Date: Sat, 28 Nov 2026 18:38:51 +0100
Message-ID: <Z0TCXVcTQNqeYPeVJpqj-w@gmail.com>
In-Reply-To: <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
References:
 <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
 <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. november 2026 ob 11:57:16 Srednjeevropski standardni =C4=8Da=
s je Andre Przywara napisal(a):
> Hi Jernej,
>=20
> On 11/27/26 05:29, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 26. november 2026 ob 21:35:40 Srednjeevropski standar=
dni =C4=8Das je Enzo Adriano napisal(a):
> >> The Allwinner A733 combines six Cortex-A55 and two Cortex-A76 cores.
> >> Add the common device tree for the first Cubie A7A, A7S and A7Z board
> >> DTS files. Describe the CPUs, PSCI, architectural timers, GIC, RTC,
> >> main and always-on clock/reset and pin controllers, UART, I2C and
> >> MMC. The preceding revision booted on the A7S and A7Z.
> >>
> >> The A7S schematic, sheets 7 and 16, shows the EEPROM wired to I2C0
> >> on PG8/PG9. Use mux 6 as documented in the A733 Datasheet v1.00,
> >> section 4.2.6, table 4-36. The A7A schematic shows the external RTC
> >> on S_TWI1. Add its R-I2C1 pin group on PL12/PL13, mux 3.
> >>
> >> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> >> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> >> and noncoherent attributes follow Andre Przywara's A733 reference
> >> and the A523 precedent. The CPUX interconnect diagram in section
> >> 5.1.2 supports the noncoherency inference. Leave the ITS disabled
> >> pending clock/reset and MSI integration.
> >>
> >> Describe the single DynamIQ unit and shared L3 shown in section
> >> 5.1.2, figure 5-1. Partition PPI 7 (section 12.2.3, table 12-1)
> >> between the Cortex-A55 and Cortex-A76 PMUs so each probes its own
> >> core type. Defer capacity-dmips-mhz until it is measured on A733.
> >>
> >> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b3=
52986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> >> Link: https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywar=
a@arm.com
> >> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> >> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Rad=
xa Cubie A7Z V1.11
> >> Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
> >> Co-developed-by: Andre Przywara <andre.przywara@arm.com>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> >> ---
> >> Changes since v5:
> >> - Mark the I2C0 PG8/PG9 group /omit-if-no-ref/, as requested. This
> >>    satisfies Andre's review condition.
> >> - Move the RTC clock include after the A733 clock headers and cite
> >>    the A733 datasheet and A7S schematic for the I2C0 pins.
> >> - Fold in Andre's R-I2C1 pin group for A7A. A7S and A7Z leave
> >>    it unused. A7S still references the I2C0 group.
> >> - Vinicius tested the v5 DTSI with his A7Z v1.11 board DT. Norman
> >>    tested the v5 series on A7S. Their tags here cover the SoC DTSI.
> >>
> >>   .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++=
++
> >>   1 file changed, 671 insertions(+)
> >>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm=
64/boot/dts/allwinner/sun60i-a733.dtsi
> >> new file mode 100644
> >> index 000000000000..e062b08006da
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> >> @@ -0,0 +1,671 @@
>=20
> [ ... ]
>=20
> >> +
> >> +		mmc0: mmc@4020000 {
> >> +			compatible =3D "allwinner,sun60i-a733-mmc",
> >> +				     "allwinner,sun20i-d1-mmc";
> >=20
> > That's not really the case, is it? A733 emmc has support for voltage sw=
itching,
> > so regulator should be added here for voltage switching.
>=20
> But it's still compatible to the D1 MMC controller, isn't it? As in: a=20
> driver capable of supporting the D1 MMC IP can also drive the A733 MMC.=20
> I think the voltage regulator is a separate problem: it's external to=20
> the MMC IP. The vqmmc supply property is documented and usable, and the=20
> availability of the regulator it points to is a separate issue.
> The same as the H616 and A523 have the voltage switch already, but are=20
> still compatible to the A100 and D1, respectively.

Ah, sorry, mmc0 node is ok. Power supply is the tricky part and that
belongs to board dts.

>=20
> > I suggest that you drop this node until proper adjustment is made.
>=20
> Do you have any code for the voltage switch already? Your comment in the=
=20
> UHS-1 prep series suggests so? Any chance you can post that separately,=20
> to get any DT compatibility problems out of the way early?

As you may remember #linux-sunxi discussion a month or so ago, you had
objections regarding broking forward compatibility. So now is the time
to properly address this for A733. As discussed, proper way would be to
introduce regulator child node in pinctrl and point vmmc-supply to it.

Example is here:
https://github.com/jernejsk/linux-1/commits/sunxi-mmc-uhs/

(just pretend that vmmc-supply is used instead of vqmmc-supply)

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> > Best regards,
> > Jernej
> >=20
> >> +			reg =3D <0x04020000 0x1000>;
> >> +			interrupts =3D <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
> >> +			clocks =3D <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> >> +			clock-names =3D "ahb", "mmc";
> >> +			resets =3D <&ccu RST_BUS_MMC0>;
> >> +			reset-names =3D "ahb";
> >> +			pinctrl-names =3D "default";
> >> +			pinctrl-0 =3D <&mmc0_pins>;
> >> +			#address-cells =3D <1>;
> >> +			#size-cells =3D <0>;
> >> +			status =3D "disabled";
> >> +		};
> >> +
>=20




