Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFD3372066
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924853; cv=none; b=LL8dX3/R/cARt9iau8693MgC68p6eK3yvk8dJJUn9rFFnnrlnVbNqVJ/LulQooQ08BaBIa+XO9UnDy9Obx6Fd0fW0OcZgkZznDY7mZ/nVW/p+KeLr6lHPQajopE8Mxdh04F+s1cc/7ufDX5TevQUDN+j6Hgo9BBo85ibmS0GEOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924853; c=relaxed/simple;
	bh=4LIlhcSSNJt4ijDmSKJWT+ggM0d+9mvXU1kPx79Vhp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOJI4fj7FdxnmKozja8zBV5kV9rRuY9NS8Jy18/VIqDneOCJ1PrNfrZnFs1x3oKZqm8NogwfZegSbgyqiRVizgdUyY8Xo6/hvSn0K/Npdoix0ynLiunbHIOV5vZ27VVd09e/st2remKagkpjmxTNNhvm9F1Al9UNNiVLX14/E9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E79Fp8Dp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E79Fp8Dp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso35994605e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924850; x=1781529650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88tm0oNdAQ/v6RDKBRvrToGlaWSuSntV+oNt6Zj/FRs=;
        b=E79Fp8DpkdvHdwbVHCBHfZVbYL4HLqehMaKDjZ3F+J6E3WrHvbLRmBOEHg5TQ54VYB
         mMrxZlxs0mQo4jQvfszsrAI6f91bx+o1PIEPRCr2qPu1YrMtNF9Uz0rczt5SQJaUW8Bj
         Gp2hqr5gCUysEmV8BH8b8WTu/ToAFaVJOkz6SfrKvfotHE4Qk2xmt1k1R6YW72PJKOpi
         nTpjTWumAtGN3LJKUtU2r+AfzIPskvgu0EZPrLgMgKYBdFnnPUPfm0gZLKODJuJmvcAQ
         Uwd4bNYHX/YneOQoWynsxiJQmFwRjGF+jGV1q6AEi07ZnZtE1CakJyswKMpsGq68oP5x
         W7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924850; x=1781529650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=88tm0oNdAQ/v6RDKBRvrToGlaWSuSntV+oNt6Zj/FRs=;
        b=B6PItKSJB6RNzjFI9EXB6vzIFb429JPx8XeUCLj2u4odwFQGm+9dxhdXsAAt7bwxw5
         nLFycfmpMimiOvi4hjZpmNw5eOU2cQOb0bNt3o4raIctWq1+2HbCNoFfHUmiRfxVel0W
         YHp9qJH5NRcQfFINRSuv6JdVSpBB2o0HYHPk9Kei0990mzLi/k+vvnazv77YKKwlLA7M
         Jj4YNueOVOHkXaWCZckOR6AdvbUEK7FFgVuhS79uFQXtNYVhVs86npij0gcaKqTaVszB
         Jh/LfHFVvxoAUKvTM4Uzw32zZ55qFilf4f8iqkBmZRCWRmN+GzPxMCWPSstTwNpf7NBR
         PwhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RQKruri0i89wafabw9GnjnwmGQjEpGjDqYuLFaQ4wvuSXsErUAlNIH60r0LqlUDs07V4/I5RV3Kxj@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEAn6iYn+ZwWnzEZNNkkPu64z+6GY/0DT0+DIeyoTPc7wGwse
	kT8XLWYVwCD7wgT9iOoXG1d92eSR2vki8EHDU/3efbymu/+AmoR9j1Gq9JiEtHa3yIOBG1WrLk8
	lXObmil8=
X-Gm-Gg: Acq92OEHGp2ASE5Vi3m9yd7tUdkFlYXOmWEOKtQgEyLae/l0N/9+h26XwWLpWVqEps8
	nCL3kD0MkP78LgS9DYyXTs67BlSsH+F/1CcADiSRLvRYA4uLB0X1lpCL/L63GYs21ZNpZW1c2LB
	UygnC0N3HnHc40qkKDDzOo2U4mgZ3RpkR8o73yJP6s+t4YzAoAAY6/9dVq7f1MHbscKui+wFctc
	WMarXGCOKUfZIuwOLU7N54WmGbmM5RKPUJ2C73Jwnep8kwiNu3UDe7mx0HyOkPdaIXhtQ0J5/gK
	WJk3vBolIT1Fwbc0nrx2bEVVePgmtjc/xCbA22EXaNQFDjH3vnlhbyzpF4LgDnJXlNL1Wus1Wl0
	0pWqpV3rSNAK/7muhQliB75JfuJJ2JnzlZJdsO53cNWVY13s00d0IvUC1xte45I3erKAFLO0BtQ
	AHRv4btnvhPSCYFBxk6b9FhReBximlnS8yhgPNnjctkHNaJEo=
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr237867275e9.14.1780924850120;
        Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:24 +0200
Subject: [PATCH 3/4] mtd: rawnand: qcom: Make has_onfi_read_op separate
 from qpic_version2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-3-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

QPIC v1.5 requires using the OP_PAGE_READ_ONFI_READ command, but is missing
the rest of the hardware changes that are currently covered by the QPIC v2
(qpic_version2) check in the driver. Split that into an extra
has_onfi_read_op feature flag so it can be separately enabled.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 15 ++++++++-------
 include/linux/mtd/nand-qpic-common.h |  2 ++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 0251dd591d40..9217e8de5512 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1564,7 +1564,7 @@ static int qcom_op_cmd_mapping(struct nand_chip *chip, u8 opcode,
 		cmd = OP_FETCH_ID;
 		break;
 	case NAND_CMD_PARAM:
-		if (nandc->props->qpic_version2)
+		if (nandc->props->has_onfi_read_op)
 			cmd = OP_PAGE_READ_ONFI_READ;
 		else
 			cmd = OP_PAGE_READ;
@@ -1903,7 +1903,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->vld = cpu_to_le32((nandc->vld & ~READ_START_VLD));
 		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~READ_ADDR_MASK) |
 						FIELD_PREP(READ_ADDR_MASK, NAND_CMD_PARAM));
@@ -1911,7 +1911,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 
 	nandc->regs->exec = cpu_to_le32(1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->orig_cmd1 = cpu_to_le32(nandc->cmd1);
 		nandc->regs->orig_vld = cpu_to_le32(nandc->vld);
 	}
@@ -1925,7 +1925,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	else
 		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->cmd1, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 	}
@@ -1939,7 +1939,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 			   nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_cmd1, NAND_DEV_CMD1_RESTORE, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_vld, NAND_DEV_CMD_VLD_RESTORE, 1,
 				   NAND_BAM_NEXT_SGL);
@@ -2041,7 +2041,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	if (!nandc->props->nandc_part_of_qpic)
 		nandc_write(nandc, SFLASHC_BURST_CFG, 0);
 
-	if (!nandc->props->qpic_version2)
+	if (!nandc->props->has_onfi_read_op)
 		nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
 			    NAND_DEV_CMD_VLD_VAL);
 
@@ -2063,7 +2063,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	}
 
 	/* save the original values of these registers */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->cmd1 = nandc_read(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD1));
 		nandc->vld = NAND_DEV_CMD_VLD_VAL;
 	}
@@ -2385,6 +2385,7 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
 	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
 	.qpic_version2 = true,
 	.dev_cmd_reg_start = 0x7000,
 	.bam_offset = 0x30000,
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 006ca8c978a9..437448995187 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -443,6 +443,7 @@ struct qcom_nand_controller {
  * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  * @supports_bam - whether NAND controller is using BAM
  * @nandc_part_of_qpic - whether NAND controller is part of qpic IP
+ * @has_onfi_read_op - whether ONFI param page read command is supported
  * @qpic_version2 - flag to indicate QPIC IP version 2
  * @use_codeword_fixup - whether NAND has different layout for boot partitions
  */
@@ -452,6 +453,7 @@ struct qcom_nandc_props {
 	u32 bam_offset;
 	bool supports_bam;
 	bool nandc_part_of_qpic;
+	bool has_onfi_read_op;
 	bool qpic_version2;
 	bool use_codeword_fixup;
 };

-- 
2.54.0

