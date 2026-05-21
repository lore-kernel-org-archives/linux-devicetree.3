Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A03750D6;
	Thu, 21 May 2026 16:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380325; cv=none; b=NiNEi/4jtDI9tvGcXugYzau611Hy+hlNha3/RaPZDwSHhDFw8hHBqoCZQPAlH+gZ2S/+FJQkewSmKfFG93Xjcaru44+DsJ2QRqHKsNAaFTbE1hq8A2XmEHffvggT2ntt19yKb7jdDA4nHOMDoSJJmCgB3gO/lF8JCNVrB8DNMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380325; c=relaxed/simple;
	bh=lQVD6O/j7RCGUPBonXVQ2BeyOEbqDjRt/lw2yhbI+D8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XB/3tl76HJCpIMMqCIePefZHSNGKzZ1sUyRMO5NVIzO3QefBPIdDl0J95QwrIilCM4vDAGHo44v9MTVnaPMg2qeF528xsWIV15Y9l+q8kE1RBg2lXULCr5k38StmrtgmA0dhhhh0rkoE8ZuU8ivRlaa1kz86+3xQW2oTBlEkoAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=MvRd7rah; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="MvRd7rah"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdfc:e00:ebbc:d4ad:bda4:649a])
	by srv01.abscue.de (Postfix) with ESMTPSA id 3F8FE1C6990;
	Thu, 21 May 2026 18:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1779380315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uy5Iab8uR30j4n/hfab0GG0PxeEMAjvbqfamS1ALUD0=;
	b=MvRd7rahdg1XoGla6bUDQI1IPrgCjxWgBN6GeOMNDp48y3jIoqmaRBzI5ENvcBSRT4rBEm
	9LoylzImt3I1cY/c+va3RAjckN5krPZ9Srq1Idd5vmkU9wWRPYun2kcwy6hA1rtR7zwmmb
	Zfw6T91keDZY/Ek7XmrqnkD268SsKnMUckIOzdGBj+Wj0Gav04txqn+UXerRNXCijhFqlv
	4bvWZ1R8zZLvm7YPTLUjlqqgqwwC+ycpIkx/Lm2R8lLjKPuoO30uwQ5PC+uM96uxFDWvBX
	2JSEk8CqHuO5nGef3WWT+yM/orF3g7ZWvrNNJTi2udyWBqAvgFM4qOy2izJ+8A==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Thu, 21 May 2026 18:17:08 +0200
Subject: [PATCH v4 3/4] mfd: sprd-sc27xx: Add SC2730 regulator cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-sc2730-regulators-v4-3-1ac8a3b5ed82@abscue.de>
References: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
In-Reply-To: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.3

Add an MFD cell to register the SC2730 PMIC's regulators.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 drivers/mfd/sprd-sc27xx-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index aa052f646623..214bcbef0c27 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -61,6 +61,7 @@ static const struct mfd_cell sc2730_devices[] = {
 	MFD_CELL_OF("sc2730-efuse", NULL, NULL, 0, 0, "sprd,sc2730-efuse"),
 	MFD_CELL_OF("sc2730-eic", NULL, NULL, 0, 0, "sprd,sc2730-eic"),
 	MFD_CELL_OF("sc2730-fgu", NULL, NULL, 0, 0, "sprd,sc2730-fgu"),
+	MFD_CELL_NAME("sc2730-regulator"),
 	MFD_CELL_OF("sc2730-rtc", NULL, NULL, 0, 0, "sprd,sc2730-rtc"),
 	MFD_CELL_OF("sc2730-vibrator", NULL, NULL, 0, 0, "sprd,sc2730-vibrator"),
 };

-- 
2.51.0

