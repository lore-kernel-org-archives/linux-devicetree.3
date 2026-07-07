Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501F3E00B4
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426253; cv=none; b=ALr7LACIJRa+Oq2OuWgB5/qB399VDxAOGwA5X3Zn1xcI8vr1VDLuOSX9AJ7KBcJDFNjTeD8xpxkKL332+Hi8yKKVFy75Ibir+wX+BfjK7aKHwba43sMYOl27Up1YKtygLqMSWt/uvCN+s0N8wTaGZsZe2xgFf8DYa7EQ4BDIhXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426253; c=relaxed/simple;
	bh=1I8edg8PsgSKu4n6auH+tqv0KCz3kBr2UsFY2KM3T1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KFKtsap6Bm2Q/RSdc5jKcmCunY35RzCoqlBYWcNZefzO24/bwtNjpsyd3ZQxnPTC5Sw3o0BZKBxx9s+YM78fesG6nNxJRmk7tYahlMm/HBWnjdVNxFtTqAKFEmNvaotSh2rcjL/p4+bTiRTAjMpPyp3vwVAs7Z37GSdc/WV7Ln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSlQfjQA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSlQfjQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3571F000E9;
	Tue,  7 Jul 2026 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783426252;
	bh=wAHkANEIfPLtIEhkAnQlDP/9Pev9OgZ5VYl6ULNUBUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HSlQfjQAoOVBetCIUdutE5vGfWBH22EnuwJrw2j7Ez3NbCAnfi0joO4cqA6lPHSVC
	 jDBza6P04HqKgcllAUB4Ig+kuFtkQ+tycitdRRIf3xKcMlVSO07wVSlHB404DKZYMa
	 vcZZZ/N7bUNl/LafXaWNzPpvVXX+9+blRkLFquzcifsOMH2Q3aNURAlqrnaavgVLiX
	 yRab3DJnbqPk0Tdgu5fSauW8/NxcGm74nd/yaWAj25C3gQzJbxgoLxBH1RO5CKFbum
	 UEsJHsIZXRreyVALSTivRpsYn9dM13doX2cS1MI0vLgQyd/roH8AbB23MsqaSR3aOg
	 MN9wiURkn9qcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] mtd: rawnand: qcom: Make has_onfi_read_op
 separate from qpic_version2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-3-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
 <20260707-qcom-nandc-mdm9607-v2-3-d906f7e8b814@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 12:10:51 +0000
Message-Id: <20260707121051.7F3571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Incorrect condition for NAND_DEV_CMD_VLD register initialization c=
auses it to be skipped for QPIC v1.5 controllers.

Pre-existing issues:
- [High] Uninitialized read location used during ONFI parameter probing on =
QPIC v2 controllers.
- [High] BAM DMA writes the last codeword read location to the wrong physic=
al register address on QPIC v2.
--

--- Patch [3]: [PATCH v2 3/4] mtd: rawnand: qcom: Make has_onfi_read_op sep=
arate from qpic_version2 ---
commit 2349ad4df61c77511228122eab5bf45ff502d556
Author: Stephan Gerhold <stephan.gerhold@linaro.org>

mtd: rawnand: qcom: Make has_onfi_read_op separate from qpic_version2
   =20
QPIC v1.5 requires using the OP_PAGE_READ_ONFI_READ command, but is missing
the rest of the hardware changes that are currently covered by the QPIC v2
(qpic_version2) check in the driver. Split that into an extra
has_onfi_read_op feature flag so it can be separately enabled.
   =20
No functional change.

> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qco=
m_nandc.c
> index 0251dd591d40a..9217e8de55129 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c

[ ... ]

> @@ -1925,7 +1925,7 @@ static int qcom_param_page_type_exec(struct nand_ch=
ip *chip,  const struct nand_
>  	else
>  		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
> =20
> -	if (!nandc->props->qpic_version2) {
> +	if (!nandc->props->has_onfi_read_op) {

[Severity: High]
This is a pre-existing issue, but does the read location setup work correct=
ly
during ONFI parameter probing on QPIC v2 controllers?

In qcom_param_page_type_exec(), nandc_set_read_loc_last() correctly
populates read_location_last0 when qpic_version2 is true. However, it later
calls config_nand_single_cw_page_read() which delegates to
config_nand_cw_read().

During ONFI probing, ecc->steps is 0. In config_nand_cw_read(), the
condition to select read_location_last0 evaluates to false because
qcom_nandc_is_last_cw(ecc, cw) compares 0 =3D=3D (0 - 1):

drivers/mtd/nand/raw/qcom_nandc.c:config_nand_cw_read() {
    ...
	__le32 *reg =3D &nandc->regs->read_location0;

	if (nandc->props->qpic_version2 && qcom_nandc_is_last_cw(ecc, cw))
		reg =3D &nandc->regs->read_location_last0;
    ...
}

As a result, it falls back to read_location0, which is uninitialized and
results in a 0-sized read location being written to the hardware.

Additionally, even if read_location_last0 were correctly selected,
config_nand_cw_read() hardcodes the physical destination address to
NAND_READ_LOCATION_0:

drivers/mtd/nand/raw/qcom_nandc.c:config_nand_cw_read() {
    ...
	if (nandc->props->supports_bam)
		qcom_write_reg_dma(nandc, reg, NAND_READ_LOCATION_0, 4,
                                   NAND_BAM_NEXT_SGL);
    ...
}

Does this incorrectly write the last codeword configuration to the standard
NAND_READ_LOCATION_0 (0xf20) instead of the required
NAND_READ_LOCATION_LAST_CW_0 (0xf40) on QPIC v2 controllers?

>  		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);
>  		qcom_write_reg_dma(nandc, &nandc->regs->cmd1, NAND_DEV_CMD1, 1, NAND_B=
AM_NEXT_SGL);
>  	}

[ ... ]

> @@ -2041,7 +2041,7 @@ static int qcom_nandc_setup(struct qcom_nand_contro=
ller *nandc)
>  	if (!nandc->props->nandc_part_of_qpic)
>  		nandc_write(nandc, SFLASHC_BURST_CFG, 0);
> =20
> -	if (!nandc->props->qpic_version2)
> +	if (!nandc->props->has_onfi_read_op)
>  		nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
>  			    NAND_DEV_CMD_VLD_VAL);
> =20

[Severity: High]
Does this change cause the VLD register initialization to be incorrectly
skipped for QPIC v1.5 controllers?

During qcom_nandc_setup(), if we have a controller like MDM9607 where
has_onfi_read_op is true but qpic_version2 is false, the new
!nandc->props->has_onfi_read_op condition evaluates to false.

This skips writing NAND_DEV_CMD_VLD_VAL. Will this cause standard read,
write, and erase commands to fail validation on QPIC v1.5 because
NAND_DEV_CMD_VLD is never properly initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-qcom-nandc=
-mdm9607-v2-0-d906f7e8b814@linaro.org?part=3D3
