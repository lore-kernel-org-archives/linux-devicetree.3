Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A144C4E6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834163; cv=none; b=QojLGN2ixh1Bh+SeDgbEKOdH8eYiWNhaDbVLQtq79QXXRjmoefIeVCxcJnncmQ3jDvZaPd3VjsmnzEr7jFCBrGDBO6H+Euk/zQ4tXvKpENT9h0pRRwJ5HShaj9z2zbTQ/Yl5w6j6E6L6MtAS2LkrSX1kzzq3B8U5seaR33RgBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834163; c=relaxed/simple;
	bh=YkSunlZPicyxCzpJlPuj17GeSBpv7ouTWseyO6FapQU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XLTGyME/Az4ZBVYeZ3s3N4ewGLaCsXBvjCSERlBjz8twkKBeyyhhqqdNi1abwnP2mTszVmVV0k0f80vD9+DvKtZ49kBLVDRLVpvRQfV//8tRF0Ku+s/TEQ212pc83LXUMDrgZifQl6ItI+g/NmHxujf4LAsCpPKqZyvAMlJDOK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iu8iEovV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iu8iEovV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598481F000E9;
	Thu, 23 Jul 2026 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784834146;
	bh=WnAHz8umnk1/jUIqr56eBmKrDPsR9RrMIuYndq3rJYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iu8iEovV3+DenZgX3nA/JvXWdeNXSkPyEcxALjjEfEuRIcFGhmgv7zf1W5PPPfrIZ
	 gPF93ICkPpW9Q8yy/zeTMjAYHUQFSR+v51XZXUYs/LPJPhcQsczv2sI0J+75goktMA
	 NDO7p/8m6TEiu2STT/yDv5/4rNTYnzhY4Hv7iJS1S4TcwuEUrJyxtJURO+l/UwN/+L
	 PhQ3fnAXsuH9b3hWEgtAHxHesiTKNptAg80AAjMhTsBY1lpcCeCAaStOxWeD6KkNQx
	 eZ2yEpR4ZZ9ClwuSFzHh5L8L/5dmXrLcofs7EZ8uyYdUFqMvYJeCWS61UY4LTPkkLn
	 jzNr43iQQR0Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: en7523: add support for dedicated PCIe
 PERSTOUT reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723190133.22577-2-ansuelsmth@gmail.com>
References: <20260723190133.22577-1-ansuelsmth@gmail.com>
 <20260723190133.22577-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 19:15:45 +0000
Message-Id: <20260723191546.598481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Read-modify-write data race on the shared REG_PCI_CONTROL/REG_NP_S=
CU_PCIC register (0x88) between the clock and reset frameworks, alongside m=
issing internal locking in the reset framework.

Pre-existing issues:
- [High] The clock disable callback `en7581_pci_disable()` calls `usleep_ra=
nge()` while in atomic context.
--

--- Patch [2]: [PATCH 2/2] clk: en7523: add support for dedicated PCIe PERS=
TOUT reset ---
commit c3a062a3f7b8267d37e6c439a55235bdea9e26a6
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for dedicated PCIe PERSTOUT reset

Add support for resetting the PCIe lines with the PERSTOUT reset. These
special reset are controlled by the PCIC register and are specific to each
of the 3 PCIe lines.

Contrary to the dedicated reset register where 0 deassert and 1 assert the
reset line for the related bit, for PCIe PERSTOUT reset in the PCIC
register, the deassert and assert value is swapped, with 1 for deassert and
0 for assert. (HW have these bit set as 1 by default after a cold boot)
This is internally handled in the reset function.

PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
reset handling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d32..2f53e0b42ead7 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  	void __iomem *np_base =3D cg->base;
>  	u32 val, mask;
> =20
> -	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> -	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> -	       REG_PCI_CONTROL_PERSTOUT;
> +	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);

[Severity: High]
Since this patch delegates the PERSTOUT bits to the reset framework via the
REG_NP_SCU_PCIC alias for the same register (0x88), is there a risk of a
read-modify-write data race here?

The clock framework modifies the REFCLK_EN bits while holding the CCF
enable_lock, but the reset framework updates the PERSTOUT bits without
acquiring any shared lock. If clk_enable() and reset_control_assert() are
called concurrently, could they clobber each other's register writes?

> =20
>  	return 0;
>  }
> =20
>  static void en7581_pci_disable(struct clk_hw *hw)
>  {
>  	struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, hw);
>  	void __iomem *np_base =3D cg->base;
>  	u32 val, mask;
> =20
> -	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> -	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> -	       REG_PCI_CONTROL_PERSTOUT;
> +	mask =3D REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val =3D readl(np_base + REG_PCI_CONTROL);
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
>  	usleep_range(1000, 2000);

[Severity: High]
This isn't a bug introduced by this patch, but does calling usleep_range()
in the .disable callback trigger a scheduling while atomic bug?

In the Common Clock Framework, .disable callbacks run with the global
enable_lock spinlock held and hardware interrupts disabled. Operations
requiring sleeping delays usually need to use a non-sleeping delay like
udelay() or be moved to the .unprepare callback.

[ ... ]
> @@ -754,11 +756,17 @@ static int en7523_reset_update(struct reset_control=
ler_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct en_rst_data *rst_data =3D container_of(rcdev, struct en_rst_data=
, rcdev);
> -	void __iomem *addr =3D rst_data->base + rst_data->bank_ofs[id / RST_NR_=
PER_BANK];
> +	u32 offset =3D rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	void __iomem *addr =3D rst_data->base + offset;
> +	bool inverted =3D false;
>  	u32 val;
> =20
> +	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
> +	if (offset =3D=3D REG_NP_SCU_PCIC)
> +		inverted =3D true;
> +
>  	val =3D readl(addr);
> -	if (assert)
> +	if (assert ^ inverted)
>  		val |=3D BIT(id % RST_NR_PER_BANK);
>  	else
>  		val &=3D ~BIT(id % RST_NR_PER_BANK);
>  	writel(val, addr);

[Severity: High]
Could concurrent reset operations race on this register write?

The reset framework performs an unlocked read-modify-write on the shared
register (0x88) to toggle PERSTOUT bits. Since this function lacks an
internal spinlock, concurrent resets on different lines within the same bank
might race, as the reset core does not serialize operations across different
lines.

This also races with the clock framework modifications in
en7581_pci_enable(), since they share the same underlying register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723190133.2257=
7-1-ansuelsmth@gmail.com?part=3D2
