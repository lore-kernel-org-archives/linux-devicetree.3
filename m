Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240438;
	b=uyj0yl6YyqUX7sIwdly8SPqHWy61NHKaOcTAag034cbkpMg4P250tXDVaCy2Q+gF0zgx
	 OR1HNbukmeEuKM5y18me9Aale0dkKQ8V2Z67AVzgUE68QeuTHLKF5beBZ05en8Q3LOYfz
	 fRTGAljACPDLAZMvoBWaRjEOmbUxtmhIgrS3AjMRqlHXGYTGvhnGqyuoCoODN33lB4HqP
	 B/M4zZpx1vtBYpNL5V9EWMDSlc8tV2Yo3OpIGVAI3fv8I+78lIxYWQZ7ktRvUmteeaPjL
	 7KHmFNoK7VgsHIXx4UnJbN3on5B2nYxh+Cq9cNS2NJkBK9aq4YpPRreTlIVpa1YZwpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240438;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GFQPb65NT7RMSCppnWXFsuqs6MvLmEnYZdDh5XC4mjA=;
	b=GtSaDjGYhsUYD2xoaTg1BPOP92cOByGF2+Xv518LZwVhWClfi6o7DQM/HCILTntYV8pc
	 u0vbIobgf9y9omo6Hl3w0rYZWmJelDwf+F5e3smMPZTbgCORRbteyJvpmShxsN9Yi2pgS
	 w42+vOE4caggJsIH5Y8Vkf5/kH5bVEG/+EcUly/ZnNNfe6mQhqVTvO6h8MDXULNcLqce3
	 SskLKVfDDeMGfeKq6LFCY8Cp3OKYzqnTLs2hKKBRSXuDAXHSBfZvrRInxri4GSLx1SDek
	 huOnEvOwfK9vLIumUkyQbPX8/2DOA+dB31dmf4WBYrcyqRpp6wcGU0NZ71ySwDUkULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPpFuF29;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BFC606EEB6
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPpFuF29
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63E21F008A5
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240437;
	bh=GFQPb65NT7RMSCppnWXFsuqs6MvLmEnYZdDh5XC4mjA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UPpFuF292enNAk33j0lC+1PqdbjJadzioJZ9ju8EwW47zs88GH4LOgNx6EXsBeAVS
	 naQyLa5OJnp5SwqUX8i35edRwP+9AafAV+Zz8HdaTatC78INOzQLTZGY6xqBbAdv/w
	 IiBpDWoJ7kQqe+JNkrpVw+hcxH4K73HSm0ZwcQcAPxQTgH7kNV3MNpL2gTH1DzNyal
	 c2ohYafFn+0LycaXUe345gUZ3bkAugp/UYZE1nBzEES9VDKgulLZ94SrK0/f9E6ILx
	 D/nEratmZRTSCwdOkvM1jJUmOWwhPHp9t6xXNpRh+E/zY0IW2d3tLcFSer/hskkYgY
	 vTE3vP+uIGl7Q==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so7936251fa.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:07:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE3m2/FU5S6zrCLb59WwP7etZkYYAf+YsgjqT94MDMhUUdY/0uiMT2Onbr35Bth6VtY6bt0Yxq7euDK@vger.kernel.org
X-Gm-Message-State: APuU4Z9YPggIgK0qLQoJDituw0wSmNH85aG6WS8x2S83URxaMyppkpbq
	Ub2KDEIrocwSgP7+9YJ06TEvCFbuHKUbh8wxFIGPLezIVkWUOvVbMzxPrPpOqSZEtXE81NH+Kr/
	/7PNK6q3LNShENclkRkt8AFepCm+wkUE=
X-Received: by 2002:a05:6512:1396:b0:5c1:4974:c15e with SMTP id
 2adb3069b0e04-5c14c0347cbmr1335285e87.52.1794240436213; Mon, 09 Nov 2026
 08:07:16 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:07:03 +0900
X-Gmail-Original-Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
X-Gm-Features: AclHuK9agX6QEN1ILAcd18vE_t6MGmoL64ggMRVBKmQGQ0cwuc_S8X4_YIrWVls
Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:54=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.te=
ch> wrote:
>
> Add the module clocks found in the Allwinner A733 SoC, including video,
> storage, interfaces and others. While most of these clocks are similar
> to those in the A523 SoC, this implementation accounts for changes in
> register offsets and introduces support for new modules.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 1103 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 1103 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 371c4297c3ab..7847eec84313 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[...]

> +static const struct clk_parent_data dram_parents[] =3D {
> +       { .hw =3D &pll_ddr_clk.common.hw, },
> +       { .hw =3D &pll_periph0_800M_clk.common.hw, },
> +       { .hw =3D &pll_periph0_600M_clk.hw, },
> +       { .hw =3D &pll_de_clk.common.hw, },
> +       { .hw =3D &pll_npu_clk.common.hw, },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram0_clk, "dram0", dram_pare=
nts, 0xc00,
> +                                          0, 4,        /* M */

My LLM agent flagged this: the divider is 5 bits wide, not 4.
Both the user manual (page 149 from start or 128 as numbered on the page)
and the BSP agree.


ChenYu
