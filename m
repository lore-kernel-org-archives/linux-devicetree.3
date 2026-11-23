Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460755;
	b=3o7PILvBQ+NPwrmKDRXB0C5edJ7/pLnyemRVzAwDRGXhsg13Ni3FJmVoi73vRyXvJJT9
	 RHfG6yVsgikpxDX6nQ/yUnpE2UsHAzbIq2J2ozdl8fedLM1uUGHcJ7/YWvuYgDcYQ7E2Q
	 KT/v/KnqpGlAlpHTHUiW1cCdDFo9hDeQBV9OI3NsJTbgOXhnO4imGcDscwaFJSb9L/J7N
	 8M2l6FFmwuX/bXdYIe00WoeAVacZ5SLU1vYAhDMG99qiHfBT1LvDNNLjpYA4XEfmxcqsV
	 wCGXGbUocM1Ti0ZRzdBRNbofmDMWe1sjYiR8iKtIUYFC8S24K8l0o6Tv/t+oj7VKpyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460755;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gFEMsZ6fHRPQEE8SVEormiEl+Oq9jteWEUask3chYnY=;
	b=Lzm9TzULoGJFlhgf9uUPe2xRvJjCvzR/U2HtACGyCUCXxTnU07Rl5nH1U6WaoxNj4vY5
	 REsuwV05G1dU2CsRNTfHwWg8wV1JtrC/IeK+Q+sSAZROmdD/DlMjOBlOhyysleFlybhJZ
	 W406ISXYTdhUG83QDHvRA4SSdUfXbE/R1BPNfMtOqRxPvgqqCj7uKgHuuNzj9OYvfhTLC
	 oauICMrEA51FcLoI9anD5kF4VW37CtgExxmfrLptJvydTYoRG2CSjq9GcR5W9qdVIcXzN
	 ODY8Teu2PL3YG3g/+DsgEr9IWXf/O6Zshr+NEQ396L9hRgRjKVSlGuu/tSHPVSbdaIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fuvcZQdx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92BF606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fuvcZQdx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06A01F01565;
	Mon, 23 Nov 2026 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460755;
	bh=gFEMsZ6fHRPQEE8SVEormiEl+Oq9jteWEUask3chYnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fuvcZQdx+wChXjJ/PNQCAJeO3ZOC8LEgD8rLDN5ktT/WbtrFNyfrnwyGDLdf5YKCO
	 KBQXial1YNduln3Qi0de0iRP4T2VAlsEVN3MzA80U2QzWnrhFHsjHJ9v87XQ47qS0l
	 fsN3GLWXMPnjPaJjbj2xO3FIC/3Agl1F88l/zREj+bYpN3wGC+3pxOTiYORfbo33wK
	 RzJT9Zzl+HC5HNI+Ic6kGF3OVSwfKUEoyTdk1VlXOXhFrTeZkN6nkVrSz6ZrftUDFV
	 8KplPsmmNivrjRrbHiPpk3250/HaGWWoS9tOjV290IPdFir8gAU3DsmxFDgJXoENpt
	 k4C9q5oaU398A==
Message-ID: <sashiko-outbox-229910@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: Add Cortina CS7542 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261123-b4-cs7542-nand-v1-2-7ce179c011e2@gmail.com>
References: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
 <20261123-b4-cs7542-nand-v1-2-7ce179c011e2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 19:05:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [Medium] mtd: rawnand: cs752x: bad OOB layout checks in
  cs752x_nand_attach_chip()
- [Medium] mtd: rawnand: cs752x: 32-bit overflow and missing EXTADDR in
  FLASH_NF_ACCESS
- [Low] mtd: rawnand: cs752x: unchecked 4-bit ECC_STS_ERRBIT in
  hamming_correct()
- [Low] mtd: rawnand: cs752x: DT label overwritten in
  cs752x_nand_probe()
- [Low] mtd: rawnand: cs752x: dead small-page checks and duplicate
  nand_write_oob_std()
- [Low] mtd: rawnand: cs752x: missing final register read on timeout in
  polling loops
--

commit a2112af7453f86da46c6a91f8462d27a8fc6193a
Author: Fil Dunsky <filipp.dunsky@gmail.com>

mtd: rawnand: Add Cortina CS7542 controller support

This commit adds a raw NAND controller driver for the Cortina Systems CS7542
SoC using programmed I/O, the controller's command sequencer, and hardware
Hamming ECC.

> diff --git a/drivers/mtd/nand/raw/cs752x_nand.c b/drivers/mtd/nand/raw/cs=
752x_nand.c
> new file mode 100644
> index 0000000000000..7c8f73e6f1b3a
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/cs752x_nand.c
> @@ -0,0 +1,826 @@

[ ... ]

> +static int check_flash_ctrl_status(struct cs752x_nand_host *h)
> +{
> +	unsigned long timeo =3D jiffies + HZ;
> +	u32 val;
> +
> +	do {
> +		val =3D fl_readl(h, FLASH_STATUS) & FLASH_STATUS_NSTATE_MASK;
> +		if (val =3D=3D 0)
> +			return 0;
> +		cpu_relax();
> +	} while (time_before(jiffies, timeo));
> +
> +	dev_err(h->dev, "FLASH_STATUS busy: 0x%x\n", val);
> +	return -ETIMEDOUT;
> +}
> +
> +static inline u32 mk_nf_command(u8 cmd0, u8 cmd1, u8 cmd2)
> +{
> +	return ((u32)cmd2 << 16) | ((u32)cmd1 << 8) | cmd0;
> +}
> +
> +static u32 mk_nf_addr(struct nand_chip *chip, u32 page, u32 *addr1,
> +		      u32 *addr2, u32 column)
> +{
> +	*addr1 =3D ((page & 0xffff) << 16) | column;
> +	*addr2 =3D page >> 16;
> +	return chip->options & NAND_ROW_ADDR_3 ? NCNT_ADDR_5 : NCNT_ADDR_4;
> +}
> +
> +static int wait_reg(struct cs752x_nand_host *h, u32 reg, u32 bit, const =
char *what)
> +{
> +	unsigned long timeo =3D jiffies + 2 * HZ;
> +
> +	while (!(fl_readl(h, reg) & bit)) {
> +		if (time_after(jiffies, timeo)) {
> +			dev_err(h->dev, "%s timeout\n", what);
> +			return -ETIMEDOUT;
> +		}
> +		udelay(1);
> +		cond_resched();
> +	}
> +	return 0;
> +}

[Severity: Low]
Can check_flash_ctrl_status() and wait_reg() return a spurious -ETIMEDOUT if
the task is preempted between fl_readl() and the jiffies comparison?

Neither loop re-reads the status register after timeo expires to check
whether the hardware finished while the task was scheduled out.  Using
readl_poll_timeout(), as cs752x_nand_wait_ready() does, would re-check the
condition on timeout.

[ ... ]

> +static void cs752x_setup_page_regs(struct cs752x_nand_host *h, int page,
> +				   bool write, bool oob_required)
> +{
> +	struct nand_chip *chip =3D &h->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	u32 cmd, addr1, addr2, cnt;
> +
> +	cnt =3D NF_CNT_DATA(mtd->writesize - 1);
> +	cnt |=3D NF_CNT_OOB(oob_required ? mtd->oobsize - 1 : NCNT_EMPTY_OOB);
> +
> +	cnt |=3D NF_CNT_CMD(NCNT_CMD_2);
> +	cmd =3D write ? mk_nf_command(NAND_CMD_SEQIN, NAND_CMD_PAGEPROG, 0) :
> +		      mk_nf_command(NAND_CMD_READ0, NAND_CMD_READSTART, 0);
> +	cnt |=3D NF_CNT_ADDR(mk_nf_addr(chip, page, &addr1, &addr2, 0));
> +
> +	fl_writel(h, FLASH_NF_COUNT, cnt);
> +	fl_writel(h, FLASH_NF_COMMAND, cmd);
> +	fl_writel(h, FLASH_NF_ADDRESS_1, addr1);
> +	fl_writel(h, FLASH_NF_ADDRESS_2, addr2);
> +	fl_writel(h, FLASH_NF_ACCESS,
> +		  NF_ACCESS_WIDTH32 |
> +		  NF_ACCESS_EXTADDR(((u32)page << chip->page_shift) / SZ_128M));
> +}

[Severity: Medium]
Does ((u32)page << chip->page_shift) overflow 32-bit arithmetic for byte
offsets at or above 4 GiB?

Because page is cast to u32 before shifting left by chip->page_shift, the
upper bits are lost before dividing by SZ_128M, wrapping the 8-bit
NF_ACCESS_EXTADDR value modulo 32.  In addition, cs752x_nand_pio() writes
FLASH_NF_ACCESS without setting NF_ACCESS_EXTADDR at all, leaving it as 0
for operations executed through cs752x_nand_exec_op() such as OOB reads, OOB
writes, and block erases.

[ ... ]

> +static int hamming_correct(struct cs752x_nand_host *h, u8 *buf, int page)
> +{

[ ... ]

> +		sts =3D fl_readl(h, FLASH_NF_ECC_STATUS);
> +		switch (ECC_STS_STATUS(sts)) {
> +		case ECC_NO_ERR:
> +			break;
> +		case ECC_1BIT_DATA_ERR:
> +			if (ECC_STS_ERRBYTE(sts) >=3D eccsize) {
> +				mtd->ecc_stats.failed++;
> +				break;
> +			}
> +			p[ECC_STS_ERRBYTE(sts)] ^=3D BIT(ECC_STS_ERRBIT(sts));
> +			mtd->ecc_stats.corrected++;
> +			max_bitflips =3D max(max_bitflips, 1);

[Severity: Low]
Can BIT(ECC_STS_ERRBIT(sts)) overflow the u8 target in p[ECC_STS_ERRBYTE(st=
s)]?

ECC_STS_ERRBIT(v) masks a 4-bit field (((v) >> 3) & 0xf).  If the register
reports a value in 8..15, BIT(ECC_STS_ERRBIT(sts)) truncates to 0 when XORed
into u8 p[...], leaving the data byte uncorrected while incrementing
mtd->ecc_stats.corrected.

[ ... ]

> +static int cs752x_nand_write_oob_std(struct nand_chip *chip, int page)
> +{
> +	return nand_prog_page_op(chip, page, nand_to_mtd(chip)->writesize,
> +				 chip->oob_poi, nand_to_mtd(chip)->oobsize);
> +}

[Severity: Low]
This isn't a bug, but cs752x_nand_write_oob_std() duplicates the core
nand_write_oob_std() helper, which nand_set_ecc_on_host_ops() assigns
automatically when chip->ecc.write_oob is left NULL.

[ ... ]

> +static int cs752x_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	int ecc_total;
> +
> +	if (chip->options & NAND_BUSWIDTH_16 ||
> +	    mtd->writesize <=3D 512 || mtd->oobsize % sizeof(u32) ||
> +	    mtd->writesize + mtd->oobsize > sizeof(h->own_buf))
> +		return -EOPNOTSUPP;
> +	chip->ecc.engine_type =3D NAND_ECC_ENGINE_TYPE_ON_HOST;
> +	chip->ecc.placement =3D NAND_ECC_PLACEMENT_OOB;
> +
> +	chip->ecc.algo =3D NAND_ECC_ALGO_HAMMING;
> +	chip->ecc.size =3D 256;
> +	chip->ecc.bytes =3D 3;
> +	chip->ecc.strength =3D 1;
> +
> +	if (mtd->writesize < chip->ecc.size) {
> +		dev_err(h->dev, "%d byte HW ECC not possible on %d byte page\n",
> +			chip->ecc.size, mtd->writesize);
> +		return -EINVAL;
> +	}
> +
> +	ecc_total =3D mtd->writesize / chip->ecc.size * chip->ecc.bytes;
> +	if (ecc_total > mtd->oobsize - 2) {
> +		dev_err(h->dev, "%d ECC bytes do not fit in %d byte OOB\n",
> +			ecc_total, mtd->oobsize);
> +		return -EINVAL;
> +	}
> +
> +	h->ecc_calc =3D devm_kzalloc(h->dev, mtd->oobsize, GFP_KERNEL);
> +	h->ecc_code =3D devm_kzalloc(h->dev, mtd->oobsize, GFP_KERNEL);
> +	if (!h->ecc_calc || !h->ecc_code)
> +		return -ENOMEM;
> +
> +	if (mtd->oobsize =3D=3D 8 || mtd->oobsize =3D=3D 16)
> +		mtd_set_ooblayout(mtd, nand_get_small_page_ooblayout());
> +	else
> +		mtd_set_ooblayout(mtd, nand_get_large_page_hamming_ooblayout());

[Severity: Medium]
Does cs752x_nand_attach_chip() allow OOB geometries that
nand_get_large_page_hamming_ooblayout() cannot handle?

nand_ooblayout_ecc_lp_hamming() only supports mtd->oobsize of 64 (placing
ECC at offset 40, so at most 24 ECC bytes fit) and 128 (placing ECC at
offset 80, so at most 48 ECC bytes fit):

drivers/mtd/nand/ecc.c:nand_ooblayout_ecc_lp_hamming() {
    ...
	switch (mtd->oobsize) {
	case 64:
		oobregion->offset =3D 40;
		break;
	case 128:
		oobregion->offset =3D 80;
		break;
	default:
		return -EINVAL;
	}

	oobregion->length =3D total_ecc_bytes;
	if (oobregion->offset + oobregion->length > mtd->oobsize)
		return -ERANGE;
    ...
}

Because cs752x_nand_attach_chip() only checks ecc_total > mtd->oobsize - 2,
a 4 KiB page chip with 64-byte OOB (ecc_total =3D 48) or any chip with an O=
OB
size other than 64 or 128 (such as 224 or 256) passes attach, underflows
oobregion->length in nand_ooblayout_free_lp_hamming() on 4 KiB + 64B OOB,
and fails every ECC page read and write at runtime with -ERANGE or -EINVAL.

Also, cs752x_nand_attach_chip() unconditionally overwrites the chip->ecc
fields parsed from Device Tree by rawnand_dt_init() instead of rejecting
unsupported DT ECC settings, and the mtd->writesize < chip->ecc.size and
mtd->oobsize =3D=3D 8 || mtd->oobsize =3D=3D 16 checks are unreachable after
rejecting mtd->writesize <=3D 512 above.

[ ... ]

> +	nand_set_flash_node(chip, flash);
> +	of_node_put(flash);
> +	nand_set_controller_data(chip, h);
> +	mtd->dev.parent =3D dev;
> +	mtd->name =3D "cs752x_nand_flash";

[Severity: Low]
Does assigning mtd->name after nand_set_flash_node() overwrite a Device Tree
label?

nand_set_flash_node() calls mtd_set_of_node(), which sets mtd->name from the
flash node's label property if mtd->name is NULL.  Setting mtd->name
unconditionally afterwards discards any DT-provided label.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
nand-v1-0-7ce179c011e2@gmail.com?part=3D2
