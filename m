Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9E3769EB
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924854; cv=none; b=kNLefUUyI9kwYNMxS9wtOPLKOdAQjFdXd3m2sRa9ZW2skdi4Mr7jbOmT7X2+kOvHigidGFmdKTfDk2Ooabi5zePVUzM6v7FvIn+IXnoCIklpNRBsazDs2GrVI4BD5E8BxGcUc7gWM6CAv6Lgx7qnKKbdBERjCdpiJQAHmZtWAbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924854; c=relaxed/simple;
	bh=uVTUGj4g6+0ok6CGfPnbzagq2Go25500NOlJFDZS3WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBQfsWxyE8ik2DjFKWnqcXb4UF90vUZzn0S2RAckm8zOxMb8d3OoPeWQST0xWjXz271rIAOijVHGEDmwDuFi+Z+kC9KIYfEHN+KkxkJ7sE6thNnykI9pCntG64ppKKU5CSRhKQq99QZOdHGbPh2FUPi7m2Wp014+Unsje4UywLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFYl4LRm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFYl4LRm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef616daf6so3922717f8f.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924851; x=1781529651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PL7471kdmSWyPmgK4b9+x0sJCZApJQ6JQDBnuoCpSUU=;
        b=dFYl4LRmB1xoMO130DTy2OgjLHhZgBfP6s7G6oSTP6Kou/RlTAGOiBXUfw86m12rOv
         JiDyF0CbnVTFUl9ret51LLuR5YLv9g+nl23ohBXIqIQ230F7fFU9cRIn6h1VNsVavET/
         jb47ggwTygCWYIm/TNHzbmvKx0QBT1apHvk7Dyf9SVINpgr95wPbTNFOa9Ybpc7m3Sxb
         WAlGSyYpk4i1ImkTkPcNgBy89E/VAlK9j82SvDv0rQKBI+7zgphvPnKrmi0AFcooEqvx
         qIvktETCB/cVrP3d8oAubzxBO5gh0dolTP9iglGk+6FkX8g4BkQP9Sow01I5mSvpLwn8
         clOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924851; x=1781529651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PL7471kdmSWyPmgK4b9+x0sJCZApJQ6JQDBnuoCpSUU=;
        b=hNTJFBsA6Zq/JawZH+Dp2Rn8jnQjPbFMWMoj/s8x81RCQOrti0IEHL4QgvRYUS3QVU
         PvRNduEunoegiHvD9pdyc39v+MHwe/VUieOBnIau8o9eF6NAyoDzqyd45mmEnUxK+gA5
         gZurUPaP4OJQUImVmz9B3x13GIwmx2qzv84tLYoz6ag//aHBhDNffib8vOrmFPrLSrZS
         cTiSdpZbi1tCF+JyAEWJA9nm/xQGYtqrtDeT1tW7+HnbV2zYa+9xAyeLqC4suVgx3tXX
         gLyiyAy/ULkHS8WgZWRmLXg5YtXqT7Cs1NAwrGmMs/YreYyg0OPQtQNY6xx5qpvPyyK6
         2Huw==
X-Forwarded-Encrypted: i=1; AFNElJ9WA5qhW3AxJ9aV1z7VSl/tdPHdMU+SZSQGKbkIL+/PrHb2gN9zsDlyJwP3nMop3qDZFZmmpRmIvIU/@vger.kernel.org
X-Gm-Message-State: AOJu0Yygf31QJ2lCgdh+Xg/CB5fj+1gYrOQA4sm4UTDMMoZXbJryEtf7
	vwj5DxnfMB4lunyhr2sN6gc8AoF0hpnMF1CrARK+BXLp2bxb4lvDe5FXxu5HxLokvdl2iIlEk67
	ccg58Ckw=
X-Gm-Gg: Acq92OEtNSLgx6KPTRD/qbj1e7zEqOfWVaHTFC61p8hrSmYNZV44jbj8+sAIaz0IxiA
	KrCoa/vp3z7pxHpQDXOFhzUDw47tJ/gjWmfudoFAvMA6Mxbrt7QwgTjgUNK6ZAn7j4Hv23ogr+U
	8MTwkNCTJpXIlR2finshW2IBdvvNi7H31bM/IHn7h5ak3BKZEX19+rbV9vYvKgD08l38ywgmPlk
	oK1peavSn1WpaCCvjOZzyACe7BxUr/UVzKvRO2sDQHvipjh0Ch9v9DO/3DvsCFEx9scxhw4A61D
	ccoH8647osOCmyIUc/Bl0Qx0LvZLRi5vCR4HOj/U3w7JlAekgCnZlpUAKeQcqR3agJZcDSxHxeP
	xjGuGIKL35KKUjuwQdeUwaCO0zf1bBstZ/gyVzNQg+6OalAEbp+0RVBni6exl4zBaDkXiDo/ztH
	T1YRytpz17hzCIznC2RiPkk/CwLE8Aq4vHO9Cg3SGAt/IInEw=
X-Received: by 2002:a05:6000:713:b0:460:1a52:8a13 with SMTP id ffacd0b85a97d-460301825femr23864909f8f.0.1780924851118;
        Mon, 08 Jun 2026 06:20:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:25 +0200
Subject: [PATCH 4/4] mtd: rawnand: qcom: Add MDM9607 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-4-4639a0492274@linaro.org>
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

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. Add the new
qcom,mdm9607-nand compatible and set it to use has_onfi_read_op without
also setting qpic_version2.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 9217e8de5512..d7642db2e2df 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2381,6 +2381,15 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.bam_offset = 0x30000,
 };
 
+static const struct qcom_nandc_props mdm9607_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.supports_bam = true,
+	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
+	.dev_cmd_reg_start = 0x7000,
+	.bam_offset = 0x30000,
+};
+
 static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
@@ -2412,6 +2421,10 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,ipq8074-nand",
 		.data = &ipq8074_nandc_props,
 	},
+	{
+		.compatible = "qcom,mdm9607-nand",
+		.data = &mdm9607_nandc_props,
+	},
 	{
 		.compatible = "qcom,sdx55-nand",
 		.data = &sdx55_nandc_props,

-- 
2.54.0

