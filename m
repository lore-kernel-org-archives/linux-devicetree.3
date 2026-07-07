Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD103FBB46
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425390; cv=none; b=IglZBVmVj/SOyebgtNdx40gO4oym6/wHeNsTg/n62IyZEqGxJJr898SDhSuzTUl+W+pjsQbnZWYMslak+HnYT0ca0q8+ZujPmWzTQ6WjcEZeRfcVvVkLxrqJwCEkySZz86K/m0TFQeC89dHCImPZm+ywKMOR3xvzAw1ItI6MG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425390; c=relaxed/simple;
	bh=hWj31lhwWSMl4fvrQtR4dMPh5W5sOHQNKqKaZhYIY9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WBhqN3F8zV7fLC9xQJqxdHf5Zdyv+EWmU0LceEFJpygxmEywTPVVZyOAqSqxopyojObJ4O0mudrrX1ZjbPgMNwVntc2xjRUtB5cnieopaBS8OJCYuRyJcO8BCZ5FsmFKIgjdP0/NbL72Dh6eARK9Auz0SoVqF2bnoo1Bf6puoi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEo7nSqP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEo7nSqP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so4250367f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425386; x=1784030186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2S6rAWtiJyKZBEDfHqasxM//kokkelrrLcftHh2iTo=;
        b=HEo7nSqPK2HL1hAvc9Y73q0/umGhdtz9GPRgv1NzLQ055jlBjTyr/vXDZzUhbG4VZV
         xP5N+95CUcXo+HHsMnIITB1/LxSNy+aEBxLKMwxU7++RZW2O+Z/QnkJxBY+yIc3Tp5IL
         CxA9I1vfcdNpMogEhrOhJrHVBi8o4L1yT37jqab0s/vFe+My4wUZnIU4ToQyITWN5ghu
         eFQSkzpzyqUhZ4rRsEn57a4Jj6C2OaYKMUOMgGiWOikSt+BN4stNIPTQYa0++T1pWi1x
         pftHzVVE3tkem9oHJlVPVow8OXO3O1SxykDPR5jb5UUIGTO08pWTqiYScYlQ3+OUYmu7
         V40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425386; x=1784030186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2S6rAWtiJyKZBEDfHqasxM//kokkelrrLcftHh2iTo=;
        b=nTuEC/87Z3XA1/3T4GTbqIfPkP+5cDkOs8rdKc14N25qZGMH6EOBfGHyZaB4ixK8BL
         HsN6QKOvC2VVwIF9jyvi265Rtnr3itm92Gk1iSV92Z0r6d6r6iI+s62UiH+mBGQAD+l6
         oh2ZCSdqTErsWHUfhYYMZIbhNv8h8E8QoKGqhd2saRwyRLr3kWSRgprxV6KJd4sJfr/B
         YZsHoxdmtQAQ3djnloxDw9r2UvJKD99lxjRP5mFoiUIkYEXpQuBgYpakptGAYrfqW705
         cXal2ksNnJgwmUl18ReXVUfRoGVtg+Y9z5+mZWtUM3gbP2YxSS61hbNSMSTUrZhKSpsg
         L47w==
X-Forwarded-Encrypted: i=1; AHgh+RpfvIVEymc+3BugnunmCLKTRscok045xdB3LEd7ajBw3iVnDWYAMY9zgf173D96g9tfN+U4vN8mmrrZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz07jltor7//el62ZZiqhqs1oszzBZJ6+XRQNphh5D9V7wsirMu
	YBjp826bkyxrP2RjDXZ7wIK/Ghfq/zJladYZpc1DwAOZ+Kc7fvYCokWfNv05cdTTpFT1kNNxRkx
	ajnY2kTQ=
X-Gm-Gg: AfdE7ckHxM0wke/S9sx+BQT8SNryqvqnlCZ7N1on+rjwQu5wSqP1nKXPfHl5tXJdcOq
	HWIZ3uJ50oE5m7NLo78+/vuFZFgb69tliZZCT3rbmxUT4OGRnYyoer/ChR9xsygkjUaURSy+z9K
	/Mc2XhPrjCQG6Lh9ZPV7NU11VJpbfYXtJTCW8FYk8I7GAIcO3fS+gaMf2yaMrByyXWs/H+ulHEe
	74fBU6lfVDrA4zBDf6XNJIPlRVQ918DN+qEAOC16AMqIIbi87CLqCYS4L0m4GsXdPeNldQZwfTt
	v2uxPumjgPo5y54NMJX9kEGaOCqPoU1Tp9oXt+/yJ/qmB6r9HvLCygffrkuyzTIJsMAkYE/CD83
	BLE5yQlZooPK6/RoJ7kTDSv6lys9bnPlAOnkmdGfHRGtKWkaDckrbFAo9ri6anQ3NulKjh879s/
	9fhJHsdsJXKWU8t0qa+4NHoRZkLw==
X-Received: by 2002:a05:600c:82c3:b0:492:3e69:a86f with SMTP id 5b1f17b1804b1-493df1c9602mr49298465e9.1.1783425385675;
        Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:25 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 07 Jul 2026 13:56:04 +0200
Subject: [PATCH v2 4/4] mtd: rawnand: qcom: Add MDM9607 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qcom-nandc-mdm9607-v2-4-d906f7e8b814@linaro.org>
References: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
In-Reply-To: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. Add the new
qcom,mdm9607-nand compatible and set it to use has_onfi_read_op without
also setting qpic_version2.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
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

