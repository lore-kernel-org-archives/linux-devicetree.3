Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976602E06EF
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780151112; cv=none; b=JIrDbsjf2PsoJiv/tI3dAbd0/vs9sn0+jMM+cQhCXL8L8j5DK/W6Os8QF0Z/BYTvmkcOTwgKoKHoTG02I/ntFW1PZ9fUVJFAEJbd6k51GWXh8ohYqfpKq4fpKxdu96+xCU5TXf46UJzBrdG+zOyDH/zm4aPasIjUkCev9edGUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780151112; c=relaxed/simple;
	bh=JMe2HRNMvkYoPZxlqHbzNi1eXuDS7XJj9CldzC2L+2w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tLzzaciKE0fwJxJjiTqbSfBAqKNqMNIY1KcFvdHm2IMLVKPnYH8+YHRfGDA/hLSDONAsHUQGmpHIm0XNnvSjifanbg9gHtuAp11BAcIncL5Ixkphk7fKeBSXkIqf1e8mdLXzlLC8abSSlB9H3gVk8EBt+oZm802L2TpRkWUu32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4JUlyRC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4JUlyRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D8C1F00893;
	Sat, 30 May 2026 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780151111;
	bh=Zl5tiLxP6wN1leUXxawuIBwuqp3MtlZjVNh/dgnTwk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d4JUlyRC5PlraRUrHMoN8Sr6RhThSkDHHl0Fp1ZgVdIRFGl8nsyJC7Ipd+vi/WwkT
	 wFO5RUUIdSivL8x1DzJt2h3nDcA/ZPkbeQYzi03BMIzBxybF4Wg/q9EILlqmCAjaZ7
	 qGmVAOW962F5j5RwzH30wAepxu0lFasAUl/pGVqVw/a9TrxBBVJDTK+lf2mQeXO3/W
	 XvbVMCDVDgBlolTms0QKmxyK8B5gObSAFvf9jVGcay7n6W94R14I1/Cq1qQi5S1HHt
	 x6bf70Vx2QZzmxJA7PxcuR6IhC0ZAcU8vFKAtxCiaTbLrjQ6YzrfKp8OL85np7Qv6z
	 Bzi+Zp+ieYK/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: add MSM8x60 LCC (LPASS) driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk" <github.com@herrie.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
References: <10180e08af4d55e776963932a4c5e60f0f197a96.1780148149.git.github.com@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 14:25:10 +0000
Message-Id: <20260530142510.E0D8C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardware register overlap in `CLK_AIF_OSR_DIV` macro corrupts cloc=
k enable states.
- [Medium] Uninitialized variable `val` used if `regmap_read()` fails.
- [Low] Missing 27 MHz PXO entry in `clk_tbl_pcm_393` fallback frequency ta=
ble.
- [Low] Global state mutation in `lcc_msm8660_probe()` breaks state immutab=
ility.
--

commit 757996c6435b09325bf482510e7802bb7053fdf8
Author: Herman van Hazendonk <github.com@herrie.org>

clk: qcom: add MSM8x60 LCC (LPASS) driver

This commit adds a clock driver for the LPASS Clock Controller on the
MSM8x60 family. It introduces a separate driver due to register layout
and parent muxing differences compared to the MSM8960.

> diff --git a/drivers/clk/qcom/lcc-msm8660.c b/drivers/clk/qcom/lcc-msm866=
0.c
> new file mode 100644
> index 0000000000000..7f13279467f95
> --- /dev/null
> +++ b/drivers/clk/qcom/lcc-msm8660.c
[ ... ]
> +#define CLK_AIF_OSR_DIV_CLK(prefix, _ns, _width)		\
> +static struct clk_regmap_div prefix##_div_clk =3D {		\
> +	.reg =3D _ns,						\
> +	.shift =3D 10,						\
> +	.width =3D _width,					\
[ ... ]
> +/*
> + * CLK_AIF_OSR_DIV - Audio Interface with divider clocks.
> + * Enable bits per legacy MSM8660 kernel:
> + *   - OSR branch enable: BIT(17)
> + *   - BIT_DIV branch enable: BIT(15)
> + */
> +#define CLK_AIF_OSR_DIV(prefix, _ns, _md, hr)			\
> +	CLK_AIF_OSR_SRC(prefix, _ns, _md)			\
> +	CLK_AIF_OSR_CLK(prefix, _ns, hr, 17)			\
> +	CLK_AIF_OSR_DIV_CLK(prefix, _ns, 8)			\
> +	CLK_AIF_OSR_BIT_DIV_CLK(prefix, _ns, hr, 15)		\
> +	CLK_AIF_OSR_BIT_CLK(prefix, _ns, 18)

[Severity: High]
Does this configuration cause a hardware register overlap that corrupts
clock enable states?

The macro configures a clock divider using CLK_AIF_OSR_DIV_CLK with
shift 10 and width 8 on the _ns register, occupying bits 10 through 17.

However, the same macro configures branch clocks on the same _ns register
with enable mask BIT(17) (via CLK_AIF_OSR_CLK) and enable mask BIT(15)
(via CLK_AIF_OSR_BIT_DIV_CLK).

Since clock operations perform read-modify-writes, configuring the clock
divider will overwrite the clock enable bits (15 and 17), and toggling
the branch clocks will corrupt the divider value.

[ ... ]
> +static const struct freq_tbl clk_tbl_pcm_393[] =3D {
> +	{   256000, P_PLL4, 4, 1, 384 },
> +	{   512000, P_PLL4, 4, 1, 192 },
> +	{   768000, P_PLL4, 4, 1, 128 },
> +	{  1024000, P_PLL4, 4, 1,  96 },
> +	{  1536000, P_PLL4, 4, 1,  64 },
> +	{  2048000, P_PLL4, 4, 1,  48 },
> +	{  3072000, P_PLL4, 4, 1,  32 },
> +	{  4096000, P_PLL4, 4, 1,  24 },
> +	{  6144000, P_PLL4, 4, 1,  16 },
> +	{  8192000, P_PLL4, 4, 1,  12 },
> +	{ 12288000, P_PLL4, 4, 1,   8 },
> +	{ 24576000, P_PLL4, 4, 1,   4 },
> +	{ }
> +};

[Severity: Low]
Is the 27 MHz PXO entry missing from this fallback frequency table?

Other frequency tables like clk_tbl_pcm_540 include the
{ 27000000, P_PXO, 1, 0, 0 } entry right before the empty sentinel. Its
omission here might prevent the PCM clock from falling back to the 27 MHz
PXO source when the 393 MHz frequency plan is active.

[ ... ]
> +static int lcc_msm8660_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	u32 val;
> +
> +	regmap =3D qcom_cc_map(pdev, &lcc_msm8660_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/*
> +	 * MSM8x60 should always boot with PLL4 L=3D22 (540.672 MHz).
> +	 * Detect anyway so a board with a non-standard L value still gets a
> +	 * coherent frequency plan instead of silently producing wrong rates.
> +	 */
> +	regmap_read(regmap, 0x4, &val);
> +	if (val =3D=3D 0x16) {

[Severity: Medium]
Can an uninitialized variable be used here if regmap_read() fails?

The return value of regmap_read() is ignored. If it fails and returns a
negative error code, val will remain uninitialized stack memory. It is
then evaluated in this condition and logged, which could cause undefined
behavior.

> +		dev_info(&pdev->dev,
> +			 "PLL4 L=3D0x%x, using 540MHz frequency plan\n", val);
> +		slimbus_src.freq_tbl =3D clk_tbl_aif_osr_540;
> +		mi2s_osr_src.freq_tbl =3D clk_tbl_aif_osr_540;
> +		codec_i2s_mic_osr_src.freq_tbl =3D clk_tbl_aif_osr_540;
> +		spare_i2s_mic_osr_src.freq_tbl =3D clk_tbl_aif_osr_540;
> +		codec_i2s_spkr_osr_src.freq_tbl =3D clk_tbl_aif_osr_540;
> +		spare_i2s_spkr_osr_src.freq_tbl =3D clk_tbl_aif_osr_540;
> +		pcm_src.freq_tbl =3D clk_tbl_pcm_540;

[Severity: Low]
Could mutating these static global clock structures break state immutabilit=
y?

This probe dynamically modifies the freq_tbl pointers of static global
clock structures (like slimbus_src and mi2s_osr_src) based on a hardware
register read.

If a subsequent probe executes where val is not 0x16, the else branch
does not restore these pointers to their original 393 tables, causing
the device to incorrectly inherit the mutated 540MHz state. While unlikely
to manifest in a singleton driver with constant hardware values, it
violates the principle of keeping global clock structures immutable.

> +	} else {
> +		dev_info(&pdev->dev,
> +			 "PLL4 L=3D0x%x, using fallback 393MHz frequency plan\n",
> +			 val);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780148149.gi=
t.github.com@herrie.org?part=3D2
