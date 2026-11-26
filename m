Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690662;
	b=kaCkNu5ha7k6taTTck31csMJeTpgJYIDo7f5epAwSDjUo7auRtkW+I4eliO3cHQtwD+t
	 yghpNeffhkmPnvSWEUSBovE/gT1iZ4k5ZWeIL+uZiQyc8fyrblWGrZZ49ufV7AlC8Z56U
	 2B1kfCC1X2EFTAhHVRRT093xcCHGukzfCxxOcwdGbYHwtuk/viGPPTO50FVexlvzXe+4/
	 1vnUGmldDqvx7wHGSBlhTilrKDWYmtlb91S9nWqByhE1lbaFHfawqq9aNvyG/CEDe259M
	 zFSMs8QlyFAchuAfLGizsH0+0AyMoOXTArSX1iKB686G08pVdV7iO7ysVWDuqYEsMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690662;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=K3WJv0/QVQugcZF/V09baRk+brmrFepsZpt52mh5UOE=;
	b=qhVzae+xlXVndy+NVlfFPDKD8WZgPeEuoi751rVL2AS4+wezUuJ5cfCMmpwtiHGojZBa
	 IPfPT/slak4/YNF4X7HVSjHGbvGBlRlEbCNxcOSmQ+R1YePIAsozd3pyjoQCv6pFDTa4D
	 eSxg1b8i2zSRNRdLkb4g5GUJsK9jSzCP4wOhWFiUrMqgQcMTavaYqXurWLcs4zEflz4+K
	 qwbBr9NpbXaiBFJU4Ns7SEgPGKvKkIqIX5kJ7lYMMOC4JwRG5wBa5BE+AFb5G4ArHPaMM
	 f1q66SR5Sz5DX1iP2Gwe38NRv9LiThGj7p8zxJQSIKVk1Mw5ojhWznOK8HF76R/tjfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cVGTVFWQ;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE5606A33A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAE5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cVGTVFWQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0F3FEC2B9C7;
	Thu, 26 Nov 2026 10:57:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFBC560237;
	Thu, 26 Nov 2026 10:57:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF59C11E6B361;
	Thu, 26 Nov 2026 11:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795690655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K3WJv0/QVQugcZF/V09baRk+brmrFepsZpt52mh5UOE=;
	b=cVGTVFWQU7MIYQP09wmObQrpbA8ecUmKCHw2BE21P0V9vq/2RcKD0q9kVh2Y/6fHOoMPGB
	uUV5yxc6BqJdFIqb3Z9n06YPv5wA+rzx8n8/6iPvybvWAyuJcn0haPcb8mZs28LlR/OoEI
	26/j/a0IcvexSg3s0FeZfVD4pHIXpj54vE6Stme23evxn+7fbNDiSA2PzqbqOL4X7bfABB
	Mkki+mecz9t12pKzuqTfV+q2qfrYmlEkeMjhcf0BXK8lXpR7kXuj5+eyRnPlUeatjkGZnr
	vmsCAoLiIbxGja+KLqlCw9eOJLrGmx8Jc61j8R3fcs++whRYSW6ykH1S+NvnKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  filipp.dunsky@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller support
In-Reply-To: <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com> (Fil Dunsky
	via's message of "Mon, 23 Nov 2026 23:27:07 +0300")
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
	<20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 11:57:31 +0100
Message-ID: <87jylzyi5g.fsf@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Fil,

> +static void reset_ecc_bch_registers(struct cs752x_nand_host *h)

So you have BCH support not only Hamming. The binding is wrong.

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
> +		      mk_nf_command(NAND_CMD_READ0, NAND_CMD_READSTART,
> 0);

You should not need to hardcode the opcodes.

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
> +
> +static int cs752x_page_op_begin(struct cs752x_nand_host *h)
> +{
> +	int ret =3D check_flash_ctrl_status(h);
> +
> +	if (ret) {
> +		fl_writel(h, FLASH_NF_ECC_RESET,
> +			  ECC_RESET_ECC_CLR | ECC_RESET_FIFO_CLR | ECC_RESET_NF_RESET);
> +		return ret;
> +	}
> +	reset_ecc_bch_registers(h);
> +	return 0;
> +}
> +
> +static int cs752x_nand_words(struct cs752x_nand_host *h, u8 *buf,
> +			     unsigned int len, bool write)
> +{
> +	u32 value;
> +	unsigned int i;
> +	int ret;
> +
> +	if (len % sizeof(u32))
> +		return -EINVAL;
> +	for (i =3D 0; i < len; i +=3D sizeof(u32)) {
> +		if (write)
> +			fl_writel(h, FLASH_NF_DATA, get_unaligned_le32(buf + i));
> +		fl_writel(h, FLASH_FLASH_ACCESS_START,
> +			  FLASH_START_REGREQ | FLASH_START_CMD(write ? FLASH_WT : FLASH_RD));
> +		ret =3D readl_poll_timeout_atomic(h->iobase_fl + FLASH_FLASH_ACCESS_ST=
ART,
> +						value, !(value & FLASH_START_REGREQ), 1, 10000);
> +		if (ret) {
> +			fl_writel(h, FLASH_NF_ECC_RESET,
> +				  ECC_RESET_ECC_CLR | ECC_RESET_FIFO_CLR | ECC_RESET_NF_RESET);
> +			return ret;
> +		}
> +		if (!write)
> +			put_unaligned_le32(fl_readl(h, FLASH_NF_DATA), buf + i);
> +	}
> +	return 0;
> +}
> +
> +static int cs752x_nand_read_page_pio(struct cs752x_nand_host *h, u8 *buf,
> +				     bool oob_required, int page)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(&h->chip);
> +	int ret;
> +
> +	cs752x_setup_page_regs(h, page, false, oob_required);
> +	ret =3D cs752x_nand_words(h, buf, mtd->writesize, false);
> +	if (ret || !oob_required)
> +		return ret;
> +	return cs752x_nand_words(h, h->chip.oob_poi, mtd->oobsize,
> false);

The spacing is broken everywhere. Please run checkpatch and /kreview
using Chris Mason's prompts.

> +static int cs752x_nand_write_page_pio(struct cs752x_nand_host *h, const =
u8 *buf,
> +				      bool oob_required, int page,
> +				    int (*fill_oob)(struct cs752x_nand_host *))
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(&h->chip);
> +	int ret;
> +
> +	cs752x_setup_page_regs(h, page, true, oob_required);
> +	ret =3D cs752x_nand_words(h, (u8 *)buf, mtd->writesize, true);
> +	if (ret || !oob_required)
> +		return ret;
> +	if (fill_oob) {
> +		ret =3D fill_oob(h);
> +		if (ret) {
> +			fl_writel(h, FLASH_NF_ECC_RESET,
> +				  ECC_RESET_ECC_CLR | ECC_RESET_FIFO_CLR | ECC_RESET_NF_RESET);
> +			return ret;
> +		}
> +	}
> +	return cs752x_nand_words(h, h->chip.oob_poi, mtd->oobsize, true);
> +}
> +
> +static int fill_hamming_oob_data(struct cs752x_nand_host *h)
> +{
> +	struct nand_chip *chip =3D &h->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	u8 *ecc_calc =3D h->ecc_calc;
> +	int eccsteps =3D chip->ecc.steps, eccbytes =3D chip->ecc.bytes;
> +	int i, j, ret;
> +
> +	ret =3D wait_reg(h, FLASH_NF_ECC_STATUS, ECC_STS_DONE, "ecc gen");
> +	if (ret)
> +		return ret;
> +	fl_writel(h, FLASH_NF_ECC_CONTROL,
> +		  fl_readl(h, FLASH_NF_ECC_CONTROL) & ~ECC_CTL_EN);
> +
> +	for (i =3D 0, j =3D 0; eccsteps; eccsteps--, i++, j +=3D eccbytes) {
> +		u32 v =3D fl_readl(h, FLASH_NF_ECC_GEN0 + 4 * i);
> +
> +		ecc_calc[j]     =3D v & 0xff;
> +		ecc_calc[j + 1] =3D (v >> 8) & 0xff;
> +		ecc_calc[j + 2] =3D (v >> 16) & 0xff;
> +	}
> +	return mtd_ooblayout_set_eccbytes(mtd, ecc_calc, chip->oob_poi, 0,
> +					  chip->ecc.total);
> +}
> +
> +static int hamming_correct(struct cs752x_nand_host *h, u8 *buf, int page)
> +{
> +	struct nand_chip *chip =3D &h->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	u8 *ecc_code =3D h->ecc_code;
> +	int eccsteps =3D chip->ecc.steps, eccbytes =3D chip->ecc.bytes;
> +	int eccsize =3D chip->ecc.size;
> +	int i, max_bitflips =3D 0, ret;
> +	u8 *p =3D buf;
> +
> +	ret =3D wait_reg(h, FLASH_NF_ECC_STATUS, ECC_STS_DONE, "ecc gen");
> +	if (ret)
> +		return ret;
> +	fl_writel(h, FLASH_NF_ECC_CONTROL,
> +		  fl_readl(h, FLASH_NF_ECC_CONTROL) & ~ECC_CTL_EN);
> +
> +	ret =3D mtd_ooblayout_get_eccbytes(mtd, ecc_code, chip->oob_poi, 0, chi=
p->ecc.total);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=3D eccsize) {
> +		u32 sts, ctl;
> +		int step =3D i / eccbytes;
> +
> +		fl_writel(h, FLASH_NF_ECC_OOB,
> +			  ecc_code[i] | (ecc_code[i + 1] << 8) | (ecc_code[i + 2] << 16));
> +		ctl =3D fl_readl(h, FLASH_NF_ECC_CONTROL) & ~ECC_CTL_CODESEL(0xf);
> +		fl_writel(h, FLASH_NF_ECC_CONTROL, ctl | ECC_CTL_CODESEL(step));
> +
> +		sts =3D fl_readl(h, FLASH_NF_ECC_STATUS);
> +		switch (ECC_STS_STATUS(sts)) {
> +		case ECC_NO_ERR:
> +			break;
> +		case ECC_1BIT_DATA_ERR:
> +			if (ECC_STS_ERRBYTE(sts) >=3D eccsize || ECC_STS_ERRBIT(sts) >=3D 8) {
> +				mtd->ecc_stats.failed++;
> +				break;
> +			}
> +			p[ECC_STS_ERRBYTE(sts)] ^=3D BIT(ECC_STS_ERRBIT(sts));
> +			mtd->ecc_stats.corrected++;
> +			max_bitflips =3D max(max_bitflips, 1);
> +			dev_dbg(h->dev, "page %d step %d: 1-bit data error corrected\n",
> +				page, step);
> +			break;
> +		case ECC_1BIT_ECC_ERR:
> +			mtd->ecc_stats.corrected++;
> +			max_bitflips =3D max(max_bitflips, 1);
> +			dev_dbg(h->dev, "page %d step %d: 1-bit ecc error\n", page, step);
> +			break;
> +		case ECC_UNCORRECTABLE:
> +			mtd->ecc_stats.failed++;
> +			dev_dbg(h->dev, "page %d step %d: uncorrectable\n", page, step);
> +			break;
> +		}
> +	}
> +	return max_bitflips;
> +}
> +
> +/* The controller sequences complete transactions; do not split CMD/ADDR=
. */
> +struct cs752x_nand_op {
> +	u32 command;
> +	u64 address;
> +	unsigned int ncmds;
> +	unsigned int naddrs;
> +	const struct nand_op_instr *data;
> +	unsigned int timeout_ms;
> +	unsigned int delay_ns;
> +};
> +
> +static int cs752x_nand_decode(const struct nand_operation *op,
> +			      struct cs752x_nand_op *p)
> +{
> +	unsigned int i, state =3D 0, nsig =3D 0, nwait =3D 0;
> +	char sig[7] =3D {};
> +
> +	memset(p, 0, sizeof(*p));
> +	p->timeout_ms =3D 100;
> +	if (op->cs || !op->ninstrs || op->ninstrs > 6)
> +		return -EOPNOTSUPP;
> +	for (i =3D 0; i < op->ninstrs; i++) {
> +		const struct nand_op_instr *in =3D &op->instrs[i];
> +		unsigned int j;
> +
> +		p->delay_ns =3D max(p->delay_ns, in->delay_ns);
> +		if (in->type !=3D NAND_OP_WAITRDY_INSTR) {
> +			if (in->type > NAND_OP_DATA_OUT_INSTR)
> +				return -EOPNOTSUPP;
> +			sig[nsig++] =3D "CAIO"[in->type];
> +		} else if (++nwait > 1 || !i ||
> +			   (op->instrs[i - 1].type !=3D NAND_OP_CMD_INSTR &&
> +			    op->instrs[i - 1].type !=3D NAND_OP_ADDR_INSTR)) {
> +			return -EOPNOTSUPP;
> +		}
> +		switch (in->type) {
> +		case NAND_OP_CMD_INSTR:
> +			if (p->ncmds =3D=3D 2 || state =3D=3D 4)
> +				return -EOPNOTSUPP;
> +			p->command |=3D (u32)in->ctx.cmd.opcode << (p->ncmds++ * 8);
> +			state =3D 1;
> +			break;
> +		case NAND_OP_ADDR_INSTR:
> +			if (state !=3D 1 || p->naddrs || !in->ctx.addr.naddrs ||
> +			    in->ctx.addr.naddrs > 5)
> +				return -EOPNOTSUPP;
> +			p->naddrs =3D in->ctx.addr.naddrs;
> +			for (j =3D 0; j < p->naddrs; j++)
> +				p->address |=3D (u64)in->ctx.addr.addrs[j] << (j * 8);
> +			state =3D 2;
> +			break;
> +		case NAND_OP_DATA_IN_INSTR:
> +		case NAND_OP_DATA_OUT_INSTR:
> +			if (p->data || !in->ctx.data.len ||
> +			    in->ctx.data.len > CS75XX_OWN_BUF_SIZE)
> +				return -EOPNOTSUPP;
> +			p->data =3D in;
> +			state =3D in->type =3D=3D NAND_OP_DATA_IN_INSTR ? 4 : 3;
> +			break;
> +		case NAND_OP_WAITRDY_INSTR:
> +			if (!in->ctx.waitrdy.timeout_ms)
> +				return -EOPNOTSUPP;
> +			p->timeout_ms =3D in->ctx.waitrdy.timeout_ms;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	if (!p->ncmds)
> +		return p->data && p->data->type =3D=3D NAND_OP_DATA_IN_INSTR &&
> +		       op->ninstrs =3D=3D 1 ? 0 : -EOPNOTSUPP;
> +	/* Validate the whole sequence, not just the available register fields.=
 */
> +	if (p->command =3D=3D NAND_CMD_RESET) {
> +		if (strcmp(sig, "C"))
> +			return -EOPNOTSUPP;
> +	} else if (p->command =3D=3D NAND_CMD_STATUS) {
> +		if (strcmp(sig, "C") && strcmp(sig, "CI"))
> +			return -EOPNOTSUPP;
> +	} else if (p->command =3D=3D NAND_CMD_READID || p->command =3D=3D NAND_=
CMD_PARAM) {
> +		if (strcmp(sig, "CA") && strcmp(sig, "CAI"))
> +			return -EOPNOTSUPP;
> +	} else if (p->command =3D=3D (NAND_CMD_SEQIN | (NAND_CMD_PAGEPROG << 8)=
)) {
> +		if (strcmp(sig, "CAOC"))
> +			return -EOPNOTSUPP;
> +	} else if (strcmp(sig, "CAC") && strcmp(sig, "CACI")) {
> +		return -EOPNOTSUPP;
> +	}
> +	switch (p->command) {
> +	case NAND_CMD_RESET:
> +		return !p->naddrs && !p->data ? 0 : -EOPNOTSUPP;
> +	case NAND_CMD_STATUS:
> +		return !p->naddrs && (!p->data ||
> +		       (p->data->type =3D=3D NAND_OP_DATA_IN_INSTR &&
> +			p->data->ctx.data.len =3D=3D 1)) ? 0 : -EOPNOTSUPP;
> +	case NAND_CMD_READID:
> +	case NAND_CMD_PARAM:
> +		return p->naddrs =3D=3D 1 && (!p->data ||
> +		       p->data->type =3D=3D NAND_OP_DATA_IN_INSTR) ? 0 : -EOPNOTSUPP;
> +	case NAND_CMD_READ0 | (NAND_CMD_READSTART << 8):
> +		return p->naddrs >=3D 4 && (!p->data ||
> +		       p->data->type =3D=3D NAND_OP_DATA_IN_INSTR) ? 0 : -EOPNOTSUPP;
> +	case NAND_CMD_RNDOUT | (NAND_CMD_RNDOUTSTART << 8):
> +		return p->naddrs =3D=3D 2 && (!p->data ||
> +		       p->data->type =3D=3D NAND_OP_DATA_IN_INSTR) ? 0 : -EOPNOTSUPP;
> +	case NAND_CMD_SEQIN | (NAND_CMD_PAGEPROG << 8):
> +		return p->naddrs >=3D 4 && p->data &&
> +		       p->data->type =3D=3D NAND_OP_DATA_OUT_INSTR &&
> +		       !(p->data->ctx.data.len % sizeof(u32)) &&
> +		       !(p->address & 3) && state =3D=3D 1 ? 0 : -EOPNOTSUPP;
> +	case NAND_CMD_ERASE1 | (NAND_CMD_ERASE2 << 8):
> +		return p->naddrs >=3D 2 && p->naddrs <=3D 3 && !p->data ? 0 : -EOPNOTS=
UPP;
> +	default:
> +		return -EOPNOTSUPP;
> +	}

Is the controller only capable to send those opcodes because it is super
smart? Or is it just sanity checks?

> +}
> +
> +static int cs752x_nand_wait_ready(struct cs752x_nand_host *h,
> +				  unsigned int timeout_ms)
> +{
> +	u32 value;
> +
> +	/* nflash_rbIn_d is the sampled NAND R/B input, not the FSM state. */
> +	return readl_poll_timeout(h->iobase_fl + FLASH_STATUS, value,
> +				 value & BIT(26), 1, (u64)timeout_ms * 1000);
> +}
> +
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
> +
> +	for (i =3D 0; i < max(len, 1U); i +=3D step) {
> +		if (write && len)
> +			fl_writel(h, FLASH_NF_DATA, get_unaligned_le32(buf + i));
> +		fl_writel(h, FLASH_FLASH_ACCESS_START,
> +			  FLASH_START_REGREQ | FLASH_START_CMD(write ? FLASH_WT : FLASH_RD));
> +		/* Byte PIO completes in microseconds, below scheduler granularity. */
> +		ret =3D readl_poll_timeout_atomic(h->iobase_fl + FLASH_FLASH_ACCESS_ST=
ART,
> +						value, !(value & FLASH_START_REGREQ), 1,
> +					(u64)p->timeout_ms * 1000);
> +		if (ret)
> +			goto out;
> +		if (!write && len)
> +			buf[i] =3D fl_readl(h, FLASH_NF_DATA) >> ((i % 4) * 8);
> +	}
> +	ret =3D p->command =3D=3D NAND_CMD_STATUS ? 0 :
> +	      cs752x_nand_wait_ready(h, p->timeout_ms);
> +	if (p->delay_ns)
> +		ndelay(p->delay_ns);
> +out:
> +	fl_writel(h, FLASH_NF_ECC_RESET,
> +		  ECC_RESET_ECC_CLR | ECC_RESET_FIFO_CLR | ECC_RESET_NF_RESET);
> +	return ret;
> +}
> +
> +static int cs752x_nand_exec_op(struct nand_chip *chip,
> +			       const struct nand_operation *op, bool check_only)
> +{
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct cs752x_nand_op p;
> +	unsigned int len =3D 0, requested, col;
> +	int ret;
> +
> +	ret =3D cs752x_nand_decode(op, &p);
> +	if (ret || check_only)
> +		return ret;
> +	requested =3D p.data ? p.data->ctx.data.len : 0;
> +	if (!p.ncmds) {
> +		if (h->read_mode !=3D NAND_CMD_STATUS)
> +			goto cached;
> +		if (requested !=3D 1)
> +			return -EOPNOTSUPP;
> +		p.command =3D NAND_CMD_STATUS;
> +		p.ncmds =3D 1;
> +	}
> +	if (p.command =3D=3D (NAND_CMD_RNDOUT | (NAND_CMD_RNDOUTSTART << 8))) {
> +		col =3D p.address;
> +		if (h->read_mode !=3D NAND_CMD_PARAM && h->read_mode !=3D NAND_CMD_REA=
D0)
> +			return -EINVAL;
> +		if (col < h->cache_column || col - h->cache_column > h->buf_data_len)
> +			return -EINVAL;
> +		h->buf_offs =3D col - h->cache_column;
> +		goto cached;
> +	}
> +	h->buf_offs =3D 0;
> +	h->buf_data_len =3D 0;
> +	h->read_mode =3D p.command & 0xff;
> +	h->cache_column =3D 0;
> +	switch (p.command) {
> +	case NAND_CMD_READID:
> +		len =3D max(requested, 8U);
> +		break;
> +	case NAND_CMD_PARAM:
> +		/* Keep all standard ONFI copies plus room for extended parameters. */
> +		len =3D sizeof(h->own_buf);
> +		break;
> +	case NAND_CMD_STATUS:
> +		len =3D 1;
> +		break;
> +	case NAND_CMD_READ0 | (NAND_CMD_READSTART << 8):
> +		col =3D p.address & 0xffff;
> +		if (col >=3D mtd->writesize + mtd->oobsize)
> +			return -EINVAL;
> +		h->cache_column =3D col;
> +		len =3D mtd->writesize + mtd->oobsize - col;
> +		break;
> +	default:
> +		break;
> +	}
> +	if (len > sizeof(h->own_buf) || (requested > len &&
> +					 (!p.data || p.data->type =3D=3D NAND_OP_DATA_IN_INSTR)))
> +		return -EOPNOTSUPP;
> +	if (p.data && p.data->type =3D=3D NAND_OP_DATA_OUT_INSTR)
> +		return cs752x_nand_pio(h, &p, (u8 *)p.data->ctx.data.buf.out,
> +				      requested, true);
> +
> +	ret =3D cs752x_nand_pio(h, &p, h->own_buf, len,
> +			      p.command =3D=3D NAND_CMD_RESET);
> +	if (ret)
> +		return ret;
> +	h->buf_data_len =3D len;
> +cached:
> +	if (!requested)
> +		return 0;
> +	if (h->buf_offs > h->buf_data_len ||
> +	    requested > h->buf_data_len - h->buf_offs)
> +		return -EOPNOTSUPP;
> +	memcpy(p.data->ctx.data.buf.in, h->own_buf + h->buf_offs, requested);
> +	h->buf_offs +=3D requested;
> +	return 0;
> +}
> +
> +static int cs752x_nand_program_status(struct nand_chip *chip)
> +{
> +	u8 status;
> +	int ret;
> +
> +	ret =3D cs752x_nand_wait_ready(to_host(chip), 1000);
> +	if (ret)
> +		return ret;
> +	ret =3D nand_status_op(chip, &status);
> +	if (ret)
> +		return ret;
> +	return status & NAND_STATUS_FAIL ? -EIO : 0;
> +}
> +
> +static int cs752x_nand_read_page_raw(struct nand_chip *chip, u8 *buf,
> +				     int oob_required, int page)
> +{
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	int ret;
> +
> +	ret =3D cs752x_page_op_begin(h);
> +	if (ret)
> +		return ret;
> +	return cs752x_nand_read_page_pio(h, buf, oob_required, page);
> +}
> +
> +static int cs752x_nand_write_page_raw(struct nand_chip *chip, const u8 *=
buf,
> +				      int oob_required, int page)
> +{
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	int ret;
> +
> +	ret =3D cs752x_page_op_begin(h);
> +	if (ret)
> +		return ret;
> +	ret =3D cs752x_nand_write_page_pio(h, buf, oob_required, page, NULL);
> +	if (ret)
> +		return ret;
> +	return cs752x_nand_program_status(chip);
> +}
> +
> +static int cs752x_nand_read_page_hwecc(struct nand_chip *chip, u8 *buf,
> +				       int oob_required, int page)
> +{
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	int ret;
> +
> +	ret =3D cs752x_page_op_begin(h);
> +	if (ret)
> +		return ret;
> +	configure_hwecc_reg(h, false);
> +
> +	ret =3D cs752x_nand_read_page_pio(h, buf, true, page);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D hamming_correct(h, buf, page);
> +	return ret;
> +}
> +
> +static int cs752x_nand_write_page_hwecc(struct nand_chip *chip, const u8=
 *buf,
> +					int oob_required, int page)
> +{
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	int ret;
> +
> +	ret =3D cs752x_page_op_begin(h);
> +	if (ret)
> +		return ret;
> +	configure_hwecc_reg(h, true);
> +
> +	ret =3D cs752x_nand_write_page_pio(h, buf, true, page, fill_hamming_oob=
_data);
> +	if (ret)
> +		return ret;
> +	return cs752x_nand_program_status(chip);
> +}
> +
> +static int cs752x_nand_attach_chip(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct cs752x_nand_host *h =3D to_host(chip);
> +	int ecc_total;
> +
> +	if (chip->options & NAND_BUSWIDTH_16 ||
> +	    (mtd->writesize !=3D SZ_2K && mtd->writesize !=3D SZ_4K) ||
> +	    (mtd->oobsize !=3D 64 && mtd->oobsize !=3D 128))

Is your controller really so constrained?

> +		return -EOPNOTSUPP;
> +	if (chip->ecc.engine_type !=3D NAND_ECC_ENGINE_TYPE_ON_HOST ||
> +	    (chip->ecc.placement !=3D NAND_ECC_PLACEMENT_UNKNOWN &&
> +	     chip->ecc.placement !=3D NAND_ECC_PLACEMENT_OOB) ||
> +	    (chip->ecc.algo !=3D NAND_ECC_ALGO_UNKNOWN &&
> +	     chip->ecc.algo !=3D NAND_ECC_ALGO_HAMMING) ||
> +	    (chip->ecc.size && chip->ecc.size !=3D 256) ||
> +	    (chip->ecc.strength && chip->ecc.strength !=3D 1))
> +		return -EOPNOTSUPP;

Why refusing to use SW operations?

> +
> +	ecc_total =3D mtd->writesize / 256 * 3;
> +	/* The standard Hamming layout reserves the last 24 or 48 OOB bytes. */
> +	if (ecc_total > (mtd->oobsize =3D=3D 64 ? 24 : 48))
> +		return -EINVAL;
> +	chip->ecc.placement =3D NAND_ECC_PLACEMENT_OOB;
> +	chip->ecc.algo =3D NAND_ECC_ALGO_HAMMING;
> +	chip->ecc.size =3D 256;
> +	chip->ecc.bytes =3D 3;
> +	chip->ecc.strength =3D 1;
> +
> +	h->ecc_calc =3D devm_kzalloc(h->dev, mtd->oobsize, GFP_KERNEL);
> +	h->ecc_code =3D devm_kzalloc(h->dev, mtd->oobsize, GFP_KERNEL);
> +	if (!h->ecc_calc || !h->ecc_code)
> +		return -ENOMEM;
> +
> +	mtd_set_ooblayout(mtd, nand_get_large_page_hamming_ooblayout());
> +
> +	chip->ecc.read_page	 =3D cs752x_nand_read_page_hwecc;
> +	chip->ecc.write_page	 =3D cs752x_nand_write_page_hwecc;
> +	chip->ecc.read_page_raw	 =3D cs752x_nand_read_page_raw;
> +	chip->ecc.write_page_raw =3D cs752x_nand_write_page_raw;
> +
> +	dev_info(h->dev, "HW ECC %s, %d bytes per %d-byte step, page %u, oob %u=
\n",
> +		 chip->ecc.algo =3D=3D NAND_ECC_ALGO_BCH ? "BCH" : "Hamming",
> +		 chip->ecc.bytes, chip->ecc.size, mtd->writesize, mtd->oobsize);
> +	return 0;
> +}
> +
> +static const struct nand_controller_ops cs752x_nand_controller_ops =3D {
> +	.attach_chip =3D cs752x_nand_attach_chip,
> +	.exec_op =3D cs752x_nand_exec_op,

Maybe a supports_op() where you make your checks would be relevant to
remove the churn from exec_op()?

> +};
> +

Thanks,
Miqu=C3=A8l
