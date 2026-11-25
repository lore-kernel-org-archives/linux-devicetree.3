Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631260;
	b=2FLlc7GuESH9ZhkJg1xt9lFOyPAGAj+ZTERqWaDIydanguugjAHEIg0Sic6RP6oyn5SL
	 6n1B18Cb84LI8FlImg4csLliMZsAx3DNfiktZCkXabqUJgyhrbr8YyQqDd5IYKW4T1mKo
	 c/U4uKwFmAsnKXXBuxsVwxy9IHM6oaUsakdOD6uytbs3xsxrVnpCIY/0UmX/na3/dc2jK
	 4SdrBdu5xz+XPwtsIiOBtZdAm73gM6LatTIpiXNgxQEr98Ec1tBj0FQ+7Lm04J7bBhquA
	 lXSCnodib8evKwDOtMSPnSNAhrNf+eMpJUgIlfMy9PAlallm5mrJFFT071Y7Lw7wCwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631260;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wDMirRJrf1Hevbb2RQb7Ux8WrGtymI5eyuYh769zW+c=;
	b=UFQu9EEr8VZ4W56+WKdrvUujH5D4dLbwe/H4VHy4lyaT+2RVk56pjUtELAF9wsTbxhwd
	 bhhf2hXcA4uCqM4y87TO7Be833acGKlBzbRzQCm+Lkpj5kodXpAiATUG+L0487kR0jjb7
	 cKt3xlw2xhtf4ItHb6WLQA0eG1uTbYog96yfjU9R27uyg1dTLYzLacDLzOu6tLh5zlfrH
	 42PwkJoIofCLr7IwC7GWHKCJw69c5KtrDHyCF9TqTv3k5Q6vZ8Ace6U4/Z7szHrEP0i4I
	 ApyQa7fX+jOmfb5VEQVDaO49Kj6lh4yxOhxR14DNcltUnByKGuhQDKRRKJEnGcZfx1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcLS4gK6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B5606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcLS4gK6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64DD1F000C0;
	Wed, 25 Nov 2026 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631260;
	bh=wDMirRJrf1Hevbb2RQb7Ux8WrGtymI5eyuYh769zW+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcLS4gK6gUvui0t7Lm4APRAWDz6ourODTKFb2qUnrlms7kkARWsDDEOFoLLger7fU
	 c8EDp3xKb/IEyPnjNYpvlGxnDIcxf2M5h/tQPDQBxhQdDF/xJhdSpJxfxdGcCfMeTO
	 2nZvPTGa8J2aaojfrPRZjsPikyb2NiLOFuW0ebm5qmNjFh/C+J+xpqq4Ux0m/Xx52W
	 aaPxBKBGMll5Hzv3NdJAIBTu+OHnxj/wPylCkhtIjQZKWAHS/SvRViliKEQjui0p1l
	 My50XEw7cVas6JFAc+PS0zJNyxBuy7dt6PwwFwdUwTwKO8xZfV10LkDA+QKYqOjyRF
	 VGxwZmJjsDXFA==
Message-ID: <sashiko-outbox-233989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] mtd: rawnand: Add Cortina CS7542 controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261125-b4-cs7542-nand-v3-2-0b6d141c102e@gmail.com>
References: <20261125-b4-cs7542-nand-v3-0-0b6d141c102e@gmail.com>
 <20261125-b4-cs7542-nand-v3-2-0b6d141c102e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:27:39 +0000
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

commit 1051502b252c0a23ea44bbf5fb9e41fc5ab64277
Author: Fil Dunsky <filipp.dunsky@gmail.com>

mtd: rawnand: Add Cortina CS7542 controller support

This commit adds a raw NAND controller driver for the Cortina Systems
CS7542 SoC using programmed I/O and the on-host Hamming ECC engine.

> diff --git a/drivers/mtd/nand/raw/cs752x_nand.c b/drivers/mtd/nand/raw/cs=
752x_nand.c
> new file mode 100644
> index 0000000000000..81b5511484d97
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/cs752x_nand.c
> @@ -0,0 +1,814 @@

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
Should cs752x_nand_pio() also set NF_ACCESS_EXTADDR() in FLASH_NF_ACCESS
for row-addressed operations, or is NF_ACCESS_EXTADDR() unused for
register-PIO transfers?

cs752x_setup_page_regs() sets NF_ACCESS_EXTADDR(((u64)page <<
chip->page_shift) >> 27) to select the 128 MiB bank for full-page PIO
reads and writes, whereas cs752x_nand_pio() always leaves
NF_ACCESS_EXTADDR() at 0.  If the controller uses NF_ACCESS_EXTADDR()
during register-PIO transactions, exec_op commands such as block erases or
OOB accesses at flash offsets >=3D 128 MiB will target bank 0 instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-b4-cs7542-=
nand-v3-0-0b6d141c102e@gmail.com?part=3D2
