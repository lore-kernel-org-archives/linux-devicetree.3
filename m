Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466382;
	b=1aVQkHbCGdHvMzjkkLg5J2rIW17sK3jsCPDKilk4WiDtFmcS91PFd/lj4yUcc8q/Yznj
	 QhsJOBkFGGIIiGaW1sLxt54d1OJy0d99vVMz8I3Y9w7s2OI3m4jU9vCfh2NaGudmNMIsg
	 MoS4DwxazcLVQhnQjobzJnAzu+RGd+FGScf5KEkh/u5eVzZao5vSuvvgf8Rm1EaRVCL7U
	 p0wz7p87NHDwpGN4m9Km5fwFzS4D3lwjzoiRxWaQodohQgrtIpGbzs3FciiAFjDPa12+U
	 kLJBrUqfNl0JdC4pnapzF5LrTg5LAHLvAvjEQzHj3CDVKNUhNDuo1BhnscNpmgBUBYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ozLU9mjX12D6E3fJKocwLOV914WeU6DXymjPpMvo/gI=;
	b=ZSmIA7X9ZHrIDAf0yhpRf3VtXUczRj5aF34JGHAZk6MIM5ijcYzqUPN8wwRLFDAB9Je1
	 MPV3RMIR/wizmHeX6jCvAuYhNkDIeZoB8eWQi/Qy3ATNY8ubb2oQg/XBpqU4Tk35tyLT4
	 e1zCRHDS5QydV7qeZuJmwJ1uYuyCQNumbAkopGHdQ1RWzEXlAXteQRjMOrxPzRF0lme7a
	 1HirYN2qylk60rXEa2CgolBUTO+XM5JkFl1YojYoB/kDIMpUq4hMtRP9pnOHTXYM+0e7l
	 OQ4TcVGB7mW2dNiTA3s5LzUREBNmL6hIvtqN0l8nHt/KEIyCbsAUPnqelyT6ky9o2IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnKPlzgt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21C606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnKPlzgt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD5B1F000C6;
	Mon, 23 Nov 2026 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466382;
	bh=ozLU9mjX12D6E3fJKocwLOV914WeU6DXymjPpMvo/gI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AnKPlzgtnLq70ZoOJD2LZX9NxNyD4+yWH1E7YEOLS+gcoULAVD5RYer0UyKuJp50p
	 X2Hr7OfIuM0hE0FoKz74dhukHtAyMdRIbkFPrqVgdABeLp+gmkwSST9TAFslLX7Jrm
	 +q4D58RsIa5/BZzn4PoXq/zZJCE/M5JNnyzQC0uTujAamoSUumUZasTPa7afPrDG+w
	 VvcvQYjXXwS7gczIukbu6iICOSP9qaLVJxmrIvj1ZwuP2A1ExpCHY7SVBs5lWlYrdu
	 USQBOe0RjNWHC0DDKiQkI/4Z58Pp5G39p74ls/GgAntDG/QtQKI5iBJse0t9mlSqza
	 hwi2kXb/B7FCg==
Message-ID: <sashiko-outbox-230010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
 <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:39:41 +0000
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
- [Medium] mtd: rawnand: cs752x: missing NF_ACCESS_EXTADDR in
  cs752x_nand_pio()
--

commit 8d08264b7a4c09da251db50474ae591ee1e0717c
Author: Fil Dunsky <filipp.dunsky@gmail.com>

mtd: rawnand: Add Cortina CS7542 controller support

This commit adds a raw NAND controller driver for the Cortina Systems
CS7542 using programmed I/O, the native command sequencer, and hardware
Hamming ECC.

> diff --git a/drivers/mtd/nand/raw/cs752x_nand.c b/drivers/mtd/nand/raw/cs=
752x_nand.c
> new file mode 100644
> index 0000000000000..a7cecd747f2e4
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/cs752x_nand.c

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
> +		  NF_ACCESS_EXTADDR(((u64)page << chip->page_shift) >> 27));
> +}

[ ... ]

> +static int cs752x_nand_pio(struct cs752x_nand_host *h,
> +			   const struct cs752x_nand_op *p, u8 *buf,
> +			  unsigned int len, bool write)
> +{
> +	u32 value;
> +	unsigned int i, step =3D write && len ? sizeof(u32) : 1;
> +	int ret;
> +
> +	ret =3D check_flash_ctrl_status(h);
> +	if (ret)
> +		return ret;
> +	reset_ecc_bch_registers(h);
> +	fl_writel(h, FLASH_NF_COUNT,
> +		  NF_CNT_OOB(NCNT_EMPTY_OOB) |
> +		  NF_CNT_DATA(len ? len - 1 : NCNT_EMPTY_DATA) |
> +		  NF_CNT_ADDR(p->naddrs ? p->naddrs - 1 : NCNT_EMPTY_ADDR) |
> +		  NF_CNT_CMD(p->ncmds - 1));
> +	fl_writel(h, FLASH_NF_COMMAND, p->command);
> +	fl_writel(h, FLASH_NF_ADDRESS_1, lower_32_bits(p->address));
> +	fl_writel(h, FLASH_NF_ADDRESS_2, upper_32_bits(p->address));
> +	fl_writel(h, FLASH_NF_ACCESS, write && len ? NF_ACCESS_WIDTH32 : NF_ACC=
ESS_WIDTH8);

[Severity: Medium]
Should cs752x_nand_pio() also set NF_ACCESS_EXTADDR() in FLASH_NF_ACCESS for
row-addressed operations?

While cs752x_setup_page_regs() sets NF_ACCESS_EXTADDR() to select the
128 MiB bank for full-page PIO transfers, cs752x_nand_pio() leaves
NF_ACCESS_EXTADDR at 0. Row-addressed transactions executed through
cs752x_nand_exec_op(), such as block erases, OOB reads and writes, and bad
block table scans, will not program the bank index for offsets at or above
128 MiB.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-b4-cs7542-=
nand-v2-0-9d9f08608534@gmail.com?part=3D2
