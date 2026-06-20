Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8202B9B7;
	Sat, 20 Jun 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781945653; cv=none; b=BTxqPq2FBCJscQ7kX84tHebYq5Adx+ZyvmwOR9MKGfklxJwhHpjzWxdYevSHRL38bE40o0xGrOmk7HfRiwwqidGFFRpWnpJhRcfWXrV0GBDhzuFIeN9TO2GZ8dkX7cZWyDg/9CHp/Nz3yuskyvdFhKb+Fb6W5DMY6I53inV2Hiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781945653; c=relaxed/simple;
	bh=lQVD6O/j7RCGUPBonXVQ2BeyOEbqDjRt/lw2yhbI+D8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ej2LkTCcOeSm2mIxtSnywH12L8nJO3cEXCKpKRwDkK3mU0RA0XCw9Y4mW0046yNp70gi1JR3LOt80C1E7cQji5N/Sqi6YgvAMiCBDhOPZkcA4BqZyORPotvBab72M/e3uLHuqrInuox6XfyFan9VhseuoKKAhnIS8dExVFxh6As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=I3ojfQfx; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="I3ojfQfx"
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdf0:7400:2cd7:7cb2:ecde:c017])
	by srv01.abscue.de (Postfix) with ESMTPSA id 4A7741C6F51;
	Sat, 20 Jun 2026 10:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1781945648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uy5Iab8uR30j4n/hfab0GG0PxeEMAjvbqfamS1ALUD0=;
	b=I3ojfQfxUPla3BwU+17udTzWyWQJ6hHjZVnOrv5prP5RcFGDwWD1JGr/axYJx3FiwQs57j
	3A8VLzrBuMAUtf+aFKdSI+irDbxSe5aXLB80PE8OxLr+R7R3RQPXzrj3De1WQI5SIzONdI
	JD7A6ErFg61pkScd/Jaa7/2D84nfqQnHROOOD4TMFcuyLpcjz61AqZv/B6kK9Jd61PXbNq
	F3Y8jzTCK61K5r/s6r5Tgiaofzq/K6SsQVz1f34gnMt80Gbv9yArtpuKBKe1wAwK2+z/DJ
	TI3DGN1ZmBG8/ipeaQc0VO2AXipJ+Bx9kBvAHWIZyo+7BkcNcwldUAyfsLKcRQ==
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sat, 20 Jun 2026 10:54:01 +0200
Subject: [PATCH v6 2/3] mfd: sprd-sc27xx: Add SC2730 regulator cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260620-sc2730-regulators-v6-2-bbd2db395231@abscue.de>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
In-Reply-To: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
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

