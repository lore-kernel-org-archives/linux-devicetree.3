Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538699;
	b=5iESZNjgvc/MDHlsJARJX8AgejVwHvVdoWXUBWIcpcu0BpTdOAZP8PtHAORjyZG3A7+D
	 eKPb3mdaIuNinLmgL/42T0vkqV54cUSC8se1yn1aCIXiiQtJqFeaeXxtMMGBRhADzgkGJ
	 Q+q7RtuCZ8QJTHZRtHbc3l2HqkqvyG6FVzPrJxorJ6ovBqwxH/epSHDg/CshxG5ZZ/205
	 tscCTNy2aifShkzGOHkCE/69Y3SxqOjK+dSiAnuJ6CovP+kQHst2SI+H8V8Y2uFiptoCd
	 5DofSHqZxXuhbjtMVAcsT3olMk5eM6/433SWaiujSJIswTdj/Ec3lINlE2fziqmgzgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538699;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=62rquUBvOVvyiVKieMKcgUO9ltoC8VqQS3BayNI9r78=;
	b=qREoPjhpH0qRdK+C0sjJHlrB9KXa5zUZvuh31c1KfwLCRFk+13bzmWyhyZVg+KZFfynq
	 2XGkgxSFKPEOWvBir0/iYkq8ShiimTRoPdDFAqMcDVlJKz5OsH1zoQf/4t/8AUqIUkNcp
	 gUfdmvwMubdpn7kGOAaLtujPTrr13evwDeUid8ITOmxsRvk8uyZbIyZVMT+r9izHtPzVK
	 PzJW9mLYXhg+O8lURpfsIALFd4EMHVbFgfUuzt5XDqnFVUdBfZessgMaa8ehcmaQkLPzB
	 Riku+K6oFkJop73WjbsKZvAHn1ZtxhndiiaTy3TDClnoO+FY0/bofH17dzpp4g3QV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HT1/YGw1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA29606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HT1/YGw1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471FD1F000E6
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538699;
	bh=62rquUBvOVvyiVKieMKcgUO9ltoC8VqQS3BayNI9r78=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=HT1/YGw13Dv+iFvg8OAdS0pdI96Vn5LQHK6b0IPxIgdQ2mADdN8a60bD8ORpPmlCK
	 sYjbRnWmX3nMsfStBlMQ/B3y5whRvGe2EKBVwbJ5ic1ZYy98gYotUTa+s/yZxoWgMg
	 1KaW2ArbiDHBM7bJCTQF5A2sqJdFlTJLhZEIhJgw6TWfb6TDFsS3fkk+r2+W74Hz4w
	 /dsI6ulH7LbwYALPeqdmauGEHVqnbwX0DeytLlXWmo/YgGyjTX3qbiOfL6hUK7seFn
	 xXpCd1feqAYqvSFD2hB1tjiYV6a8roxoO7KnCiWFKtJ4GTfGeFBEQBCIj0y7Wy3jEL
	 8z0wjhfM9ia8w==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so50800931fa.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGNdkXGcPkmdG2ObYE30hENfWsdyDfLS50paHlnIHwiE5JMqrHs7C3Z55eBLcSrArUvZgWWQoiGcVSg@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZVtHRoh17JWrNFDprzskG5WrHJRLdu2eJ4VAYDP+nWjD4diJB
	PpIxAiyAeqMhjJOPAu6K/HdTG8nrn6iLZj+eUQDC22ckDKaP4hDz3/6fFckyhyFoSej3rLUECj5
	sH3dB1fXPLHdT4KyGQUN51NgMXpAsqPk=
X-Received: by 2002:a2e:a807:0:b0:3ae:7ef0:6b69 with SMTP id
 38308e7fff4ca-3ae7fa11df0mr42946551fa.12.1795538697678; Tue, 24 Nov 2026
 08:44:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 25 Nov 2026 00:44:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
X-Gm-Features: Aa3M54qViXTA9PWqHy7JAagF_gxHMQbq3GygFoih888wxMeSNrx03SeafMdIrGc
Message-ID: <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, 
	Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:42=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Provide the SoC description needed by the initial Cubie A7S DTS for its
> console, PMIC, EEPROM and microSD. Describe the CPUs, PSCI, architectural
> timers, GIC, RTC, main and always-on clock/reset and pin controllers.
> Include the main and R-domain UART/I2C instances and MMC0-2 with their

> pin groups. Use mux 6 for I2C0 on PG8/PG9, as in Radxa's BSP pinctrl
> driver and its Cubie A7S device tree.

This should be evident from the schematic itself (the pins are used for
I2C). And then the datasheet would tell you which mux value it is.

Just saying, trust the datasheet and schematic a little more than the BSP.
And one really should write the device tree based on the schematic. The
BSP is there in case something doesn't work, to look for existing quirks
or workarounds.

> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> and noncoherent attributes follow Andre Przywara's public A733
> reference and the A523 precedent. The CPUX interconnect diagram in
> section 5.1.2 supports noncoherency as an integration inference. The
> ITS stays disabled pending its clock/reset and MSI integration.
>
> Describe the single DynamIQ unit and shared L3 shown in section 5.1.2
> (figure 5-1). The big and little DVFS groups can be described by their
> clocks, OPP tables and supplies. Partition PPI 7 (section 12.2.3,
> table 12-1) between the Cortex-A55 and Cortex-A76 PMUs so each probes
> its own core type. Defer capacity-dmips-mhz until it is measured on A733.
>
> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b3529=
86b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> Link: https://github.com/radxa/allwinner-bsp/blob/2045a3ca2a01f088c0314dc=
924bda59d154e363e/drivers/pinctrl/pinctrl-sun60iw2.c#L1591-L1610
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>
> v4 -> v5: Rename osc to hosc and add the I2C0 PG8/PG9 group. Keep the
> one-cluster CPU map and the two PMU partitions.
>
> Untested on v5: physical CPU/cache topology, PMU counting, EL2
> interrupt delivery and ITS/MSI.

Someone please test the PMU.

>  .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 663 ++++++++++++++++++
>  1 file changed, 663 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..8a258f16751e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,663 @@

[...]

> +               uart0: serial@2500000 {
> +                       compatible =3D "allwinner,sun60i-a733-uart",
> +                                    "snps,dw-apb-uart";

We can't merge this because the bindings haven't been merged. And they seem
to still be going through a lot of churn?


ChenYu
