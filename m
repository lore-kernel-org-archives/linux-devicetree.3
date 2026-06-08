Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B537207D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924852; cv=none; b=JJNq2HL7r3qGQOOf63zpfp9mE7bherPxFOVToYoZGGyNjfcXgWrFF6MbjFkvrvmOeE6ElWpnl4h3ZMSC9fGKIrJRy1E5j7iKkRvAAhbtkQkr/bn+4g/wPpYvx9ZEFglklImC6swGUEGqMycMc3ZiY6gG5UpAzhLKOBV8wMSZDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924852; c=relaxed/simple;
	bh=0AgIAl17ixhY3CTP9QeRWJkMWUPldlinPLmeQltSSw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwv0R8cLek90i7ZxhkxTJzelC9r3rwEiyIRBkFqjGnNOM3GWPX3fWyI+3kfgstyoeOkO+or0+wF5ca7yiOsS2qgubMoS9Rv4m0Rcml8TzxPNA363oEZhZo3ygTH9CXbhMnk/vt7Iqaekj99yWFxLNgg4eAJ2Ks+sNQ44Oxi6Nig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O50rKS3s; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O50rKS3s"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac357c55so48523105e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924849; x=1781529649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KpA3ZQAr7zIXn0uGbXscgdRewtZO5/SMCNOMBE13D8=;
        b=O50rKS3smR/TsZjEXbRbRyG7HC1qBfU/QHvn+Fh/PB5SSIza9FqGHgTU+sCRPXi01i
         C8e1GEkIzrY9uhd04U+jbIspEbbvDkv3TYZQIRtixEdY5w564BRS4jAuZsOtcmpp0KI+
         h1vEJWn17ZC9+/p+3C0K9siyGxk+R48Y0p7vj0xLiEAC+54O0pTtVQmeiTczSCKOqgij
         cQrQSJRAwmdJPOVeI4BLKqHD45ym2f0xbqEkMd6A6fF18S0PRnf2aeiE4a7IKFR6B7ki
         hHBb7gMeRDx7N14g+fJpnzY5Mcni/BTe2JGK3nidzNZaa/K0/gX4AF2JcvGkdiYrQNZB
         NRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924849; x=1781529649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0KpA3ZQAr7zIXn0uGbXscgdRewtZO5/SMCNOMBE13D8=;
        b=sdcynYS+l5evjUxIdVhRmOgA1kCl/GjqmGp7cgWATB54lrZ67nKxM/hayzpBJfsEQ2
         T+JlbsZHCBv18GobtMu6lMcuxkJvd4TzbStlMLGkcC0fdw95Q2csUPou/GTpGbRf2pgB
         IdS7Aj8iY2dvndcsg7xpcMHmCMUgwupYx49Q0o4VuXcSsRfmSSldX4WxgiH/Ps0HD4W0
         3q5y3JLe8sMu6xCoMVOo0fo4rCGd5MbyIPkCoXPPwz3ly9KGN25kMSt0tVsQP4K80YfR
         bbryD9vBofareOYnn3FmP0csfd4H6RPA0VBUSM2lr/eUeW/Hn/CijO7de9dn2LKtvCsT
         Dkbg==
X-Forwarded-Encrypted: i=1; AFNElJ/ju67Qp1rI02iGl3sBXmS/xZW5i1tu7T7SfQsoB4/l2QiQ3ErPpbpuyE7C8xJvCXjs9pECKiG0CRpw@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYTvxqSPqT+CJyIOJzOz0y6woSM8odQzGt/HBBrmrwbbCD/jX
	rrHHMT/7K/JCQVSMqzTy8isSfP2N+N53SyEN24vDB70LnMchZOp24vbTBtEvW5fgINYwjInWe9Q
	rcrn8kcA=
X-Gm-Gg: Acq92OFl2k8qF1FoTSCZHc9Gfi4m2Y9FeNrdNA+In8xs+NLhZb4xRGWGhuuFXJvXF87
	3W+xOuy1fV77EfaBeuLA4SZp+M0L7O69F8KGoipcbPzzBantrmh5kXAvhEN2HTiZDZlyIVE1SJZ
	OSsvHiPk11iSHoP3KSsVn2Dg4YSeAdmnCkwndLyO9AZdFy6D4UM1D50jWMMnD/E1ySVXBWzfEOo
	ghHrjMaZ6OHAHJjAi6nMau+PgNx3DcipLZl8zjC+tvbq5KR2weI1g3PMLZSEgVw2YJjIcG58Qj/
	kAk1FMoEnfb2UMxN6S6/jhDL4mMfbrH20ZsowvjCuxttPZC2Ocx7vCYugQFiMkC4z0WueRSw3Aw
	V32ljGIfTLbQla0f7QTVDdC615FpK5bvpm4mnK3h+RLzKm8I6k9HRES8pbFPsv+wyod5ajuLFyA
	E9vgL03LwmlDncpP5lcCPUHs8cRqpv4woOw6TS14sQgi2vrrw=
X-Received: by 2002:a05:600c:34ca:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-490c2592042mr268917625e9.2.1780924849190;
        Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:48 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:23 +0200
Subject: [PATCH 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
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

Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
clock for the NAND controller. The actual clocks in the hardware are
managed by the firmware and turned on all together when needed. In this
case, there is no separate "aon" clock that can be described in the device
tree.

Make the second "aon" clock optional to avoid an error when it is missing.
For platforms that really need it, the dt-bindings are responsible for
validating that.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4b80ce084d9a..0251dd591d40 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2280,7 +2280,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->core_clk))
 		return PTR_ERR(nandc->core_clk);
 
-	nandc->aon_clk = devm_clk_get(dev, "aon");
+	nandc->aon_clk = devm_clk_get_optional(dev, "aon");
 	if (IS_ERR(nandc->aon_clk))
 		return PTR_ERR(nandc->aon_clk);
 

-- 
2.54.0

