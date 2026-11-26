Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698312;
	b=r5BZwJAxoOImUpIydNXq2cg7BHWMmCZRwkWfwybw63E9APOYXnGda/yG4RNFfqnzVdv+
	 HTb1E/4IyeDf85/LkmD4I37TxHRCL3ltq1/wAfruC081L+bFaMc+MpnW0DykjF58N9jZQ
	 Cn96gdratadiIZrcg/NyOjserKmM/LlJ4u54M42DiGvF2/mWzs4jhrxHWKbMh0zFVQ8UH
	 UjRqWy+qVXx1mJE5Z35bNH1ZXrL/ezGXjeggRDLO6fxqGa7OY/h4af+tIHViNT3GHRPvY
	 C03LSK8BVoz69s1mUyYPMXahw6e04+LPixpEdyp1GdsB5pJ1PEXYF1sf8vf1AQcN6uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698312;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fENdEb3Bt7HhhupnxtcDcTS2NyZ8NaoZRFolIFDL5BA=;
	b=Tk9LzhDfSz+/UhAnsczgONe94M5eIaPm//QUexQgIekz2DgyaT7AESGox2J7VeO63ej+
	 fb2tjaOkIgkQOYNKdYwNFRe69KawE6tBSONJ0FMYvTz19kCCA4hVyAwht44MAdyG39nmz
	 FUzi7XX4nEmXSokMzD/FKNq7EbVtFEKQjC8BhTlb7gsrmlHHHK5OCBVFUzZnXDDwlwpEs
	 e6kkF5MSybTMs/HbM9ASXoPKjYDvUxH4IAFHxgLmN06dAjlc7C5TQGVHO5z9Iafng9KTT
	 Gcos3NwJFwSfsFugOGGZtGH6mje0ZGJ1PoIrlm2i/VL+TE/c4WZvqqWDItdQ55hI0rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gi5hVaWH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FF606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gi5hVaWH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19631F000C4;
	Thu, 26 Nov 2026 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698312;
	bh=fENdEb3Bt7HhhupnxtcDcTS2NyZ8NaoZRFolIFDL5BA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gi5hVaWHZxqtA+AyGmt4G3/A6BQGhlVb/4f29z6KMPW5OUAizaOhcjwXNUppfQ5wW
	 8ekxN9I2u0BjMeq5/4U8PWXwXNF3L0HxLKn1ektYkWAm+kHHN6uGiih0WR7YJohTB3
	 jIzrwOtzsTrKyxX5OjPrXqmVgHTyKgPz9itvi0uv9BsFiR8XeRX5mTTWFPGglxcNmU
	 eDX5etww1HnzNkz4ujBDekwzKDhi7RzbUS5XxyjBGoaqlrPtbIXhKw3wcSjNmFwoUw
	 rF6X5eH6RspDeJHVfniCBVdYwTmVGaJdL0PT61JNM1pA5BfhV6RwhqSvWLWSMz+hgk
	 vqDDpYLNL56qQ==
Message-ID: <sashiko-outbox-235556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] mtd: rawnand: Add Cortina CS7542 controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261126-b4-cs7542-nand-v4-2-38e488f6f8b1@gmail.com>
References: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
 <20261126-b4-cs7542-nand-v4-2-38e488f6f8b1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:05:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] mtd: rawnand: cs752x: broken child lookup when nand@0 is
  disabled
- [Medium] mtd: rawnand: cs752x: broken page writes with
  NAND_ECC_ENGINE_TYPE_NONE
--

commit 27b8a6ca04060af07bea917b577d9528c58349c2
Author: Fil Dunsky <filipp.dunsky@gmail.com>

mtd: rawnand: Add Cortina CS7542 controller support

This commit adds a raw NAND flash controller driver for the Cortina Systems
CS7542 SoC using programmed I/O, supporting software ECC and hardware Hammi=
ng
ECC.

> diff --git a/drivers/mtd/nand/raw/cs752x_nand.c b/drivers/mtd/nand/raw/cs=
752x_nand.c
> new file mode 100644
> index 0000000000000..b4cc24e31faee
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/cs752x_nand.c
[ ... ]
> +static int cs752x_nand_exec_op(struct nand_chip *chip,
> +			       const struct nand_operation *op, bool check_only)
> +{
[ ... ]
> +	if (p.data && p.data->type =3D=3D NAND_OP_DATA_OUT_INSTR)
> +		return cs752x_nand_pio(h, &p, (u8 *)p.data->ctx.data.buf.out,
> +				      requested, true);
> +
> +	ret =3D cs752x_nand_pio(h, &p, h->own_buf, len,
> +			      p.command =3D=3D NAND_CMD_RESET);
> +	if (ret)
> +		return ret;
[ ... ]
> +static int cs752x_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	int ecc_total;
> +
> +	/* Byte-bus transfer handling and the staging buffer are driver limits.=
 */
> +	if (chip->options & NAND_BUSWIDTH_16 ||
> +	    mtd->writesize + mtd->oobsize > sizeof(h->own_buf) ||
> +	    mtd->writesize % sizeof(u32) || mtd->oobsize % sizeof(u32))
> +		return -EOPNOTSUPP;
> +	chip->ecc.read_page_raw =3D nand_monolithic_read_page_raw;
> +	chip->ecc.write_page_raw =3D nand_monolithic_write_page_raw;
> +	if (chip->ecc.engine_type =3D=3D NAND_ECC_ENGINE_TYPE_SOFT ||
> +	    chip->ecc.engine_type =3D=3D NAND_ECC_ENGINE_TYPE_NONE)
> +		return 0;

[Severity: Medium]
Do page writes work when NAND_ECC_ENGINE_TYPE_NONE is selected?

nand_scan_tail() runs after attach_chip() and unconditionally overwrites
chip->ecc.read_page, write_page, read_page_raw, and write_page_raw in the
NAND_ECC_ENGINE_TYPE_NONE case:

drivers/mtd/nand/raw/nand_base.c:nand_scan_tail() {
    ...
	case NAND_ECC_ENGINE_TYPE_NONE:
		pr_warn("NAND_ECC_ENGINE_TYPE_NONE selected by board driver. This is not =
recommended!\n");
		ecc->read_page =3D nand_read_page_raw;
		ecc->write_page =3D nand_write_page_raw;
		ecc->read_oob =3D nand_read_oob_std;
		ecc->read_page_raw =3D nand_read_page_raw;
		ecc->write_page_raw =3D nand_write_page_raw;
    ...
}

Unlike nand_monolithic_write_page_raw(), nand_write_page_raw() splits a page
program across nand_prog_page_begin_op(), nand_write_data_op(), and
nand_prog_page_end_op().  cs752x_nand_pio() pulses ECC_RESET_NF_RESET at the
end of nand_prog_page_begin_op(), resetting the controller before the confi=
rm
command is sent, and cs752x_nand_exec_op() then issues the standalone
NAND_CMD_PAGEPROG confirm command with write =3D false (FLASH_RD instead of
FLASH_WT).

[ ... ]

> +static int cs752x_nand_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (of_get_available_child_count(dev->of_node) !=3D 1)
> +		return dev_err_probe(dev, -EOPNOTSUPP,
> +				     "one connected NAND target is supported\n");
> +	flash =3D of_get_available_child_by_name(dev->of_node, "nand");
> +
> +	if (!flash)
> +		return dev_err_probe(dev, -ENODEV, "missing NAND chip node\n");

[Severity: Medium]
Does of_get_available_child_by_name(dev->of_node, "nand") fail with -ENODEV
when nand@0 is disabled and nand@1 is enabled?

of_get_available_child_by_name() calls of_get_child_by_name(), which returns
the first child matching "nand" regardless of its status, and then returns
NULL immediately if that child is not available:

drivers/of/base.c:of_get_available_child_by_name() {
    ...
	child =3D of_get_child_by_name(node, name);
	if (child && !of_device_is_available(child)) {
		of_node_put(child);
		return NULL;
	}
    ...
}

On a board where nand@0 has status =3D "disabled" and nand@1 is enabled, pr=
obe
fails instead of finding nand@1.  Using of_get_next_available_child() (and
checking of_node_name_eq(flash, "nand")) would locate the enabled child on
either chip select.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-b4-cs7542-=
nand-v4-0-38e488f6f8b1@gmail.com?part=3D2
