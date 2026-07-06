Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893D33A8FEE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350189; cv=none; b=OG1vd9bGsscMLkGEn3JIgJXT2DUJIHmolc2FJJ68Tnkm26U+48BA4p1N+fjj9cfox4yOuEu3+bQruae/TldzUKuK0Y4KBNOrYVplYmV3fUME/KoKbLuO2giNHJryr+D5Y6/Fp7t52GUg/vIjy8btdsGuKYCnaAmM61DNR+dvw2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350189; c=relaxed/simple;
	bh=QlgPztLT0l1AgtAQLK4Gjg/iArBYh5F6QfMuZvh8PRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnXmAeifaCaayX6D8HOFIequp8MNkqes0z6bOTL9o6pTEXy85kMShv438Z/VifqhOb3qxfAtphiPbf/LP8LntMeIqWGpofoaf9DWBWY2wsC2NEbpm0gMYGbW9mVSMy8m0XYKGXwtNDP0h8N8iqRzxQbH4hmnudZhLf45t6v3jp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlC1x1Fv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlC1x1Fv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-471eeac43bfso3527405f8f.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350185; x=1783954985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS0oAWOsEneMSjXLs9/+Zw8N2xLjgCGUcrBqbMkqc1c=;
        b=zlC1x1Fvz0AFaDyDcUtLFWhq16jn7mqVgHQWt13ZmcuC3eulymkdonDEo2xdTuvYfA
         18RRsmRRBbvPSv71sC947D4eNX9rNt3AyWlwONFUQCKoWJwCD3+K3IWQJBfEyJwPbtlQ
         uhCRFQgPyGAUbHEAs3XI94LjYBv0YsFdrgOLvHyw6iPt8nGTzHsUgUJ5saoD/tUW7q79
         DgNiqsBu1I3Rfv2SjNYJ7lZHjfbCiobat0H2NbhmzIbFu9wWFnxBpxsD+4BTiRYPyAVE
         FOy99PwRJxQByK4sznfDwtJdiPnN0ql0wxdaT2mqCLYz1itxR3P1dihv2tcpWnmcsaIq
         NRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350185; x=1783954985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qS0oAWOsEneMSjXLs9/+Zw8N2xLjgCGUcrBqbMkqc1c=;
        b=cKpayxVWrbdfgSvzTWsw2BSh5vXWOWb1GuHu0F5fv6hTG5/9Prt/LWzzL2it6p8X38
         +KJBcvvwmZLiSBKf2hHrA1LGOz7D7nBOKK9KmWbh8yOi8dESlQcU6VB62188xxXKgSuI
         fUYtmzbTyYksc9iMaYbUhTArT+H1zW2cyBg/p0TPKzsNG7KP7WFeeJkFk+AsR7720dvC
         rHvqZ1k9pGnw3+mVHNu+DSYOXilyEwR7xPVvVPskYYFkq9frDhkvvmzO5xcXZC60lbFX
         E4Eh/zMJkXLl6B4kmjiMTlo7SO3zKNpGuRlprRTqvVaIcqSKxZ3uFlMJO0AHOKSS9Jc6
         Wegw==
X-Forwarded-Encrypted: i=1; AHgh+Rqw0m+av/3Yz/Nkl+VImmL0prdxyoteoZSptEL4+xtpuiJNhlwEDyDMwEwTDc3XW1v7atpPf2koM0+J@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzDkCiTRxmtvknLsH0CyIOen38+gR/E8lz3fDW1BBaxdQAVLV
	pyEXGfU4jHqp+FjQxdo/sPUvdL3QJF/tb/CbKt5akHw0FJutaYL8dlmwTBXRvtBNHaA=
X-Gm-Gg: AfdE7cksYTLf0p3J0pbDD/OQtav7/afDpg0p7l+SCzGUXBZNvt5538rIYGCcCaHXGUO
	qpQCQ16UPUTRiqDTCSaNeEi4DsC8/HxqG4DW5Iymq1Wk/cMFxjjToueovBekBYxQ9LOhRJ3z149
	d6EVCFirilSa2dGBSiOzSz9XT6g6cugXtoaX0g6Vq+OuAZQlXMASu+LBzfQR+9PFHlyYMJQS+aa
	t5B7wW/64uoWm3bneJVcaslwsTUAtC7G2agD9O6TnhdegCRT6KwpO4MlARx9vtZfB+iBx+89eUg
	CAL+CbRX9RAblyl4KJp769wQJFhPTb4i4qpIanIFkWXpAgl6Ezfv/1j3BZ0L45XIbpzai59UyCs
	p7/ae7Cx1puY9+TRUiLhUALZo2Jlc/c68xhCHey6uetAplyjdKqygJn8M+xyohVAtmdIsMGDwGM
	ziSQqhMWpYPwmF16ZhMoet+sQcJA==
X-Received: by 2002:a05:600c:8219:b0:492:59fe:4a15 with SMTP id 5b1f17b1804b1-493df0a7583mr10518085e9.24.1783350184808;
        Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:19 +0200
Subject: [PATCH v2 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-12-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
since it's used by the CPU and also various other components such as UART.
We also vote for this bit in the actual GPLL0 definition, which will be set
as soon as any driver in the kernel requires using the GPLL0 clock.

All in all, this makes separately voting for GPLL0 during probe redundant,
especially because the "acpuclock" in the comment is a downstream construct
that does not exist in upstream.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 4b749c99586b..2e4cdb590623 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1425,16 +1425,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
 
 static int gcc_mdm9607_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
-	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_mdm9607_desc);
 }
 
 static struct platform_driver gcc_mdm9607_driver = {

-- 
2.54.0

