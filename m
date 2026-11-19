Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084242;
	b=r1EDlQdbsEkXko0dUS1M6MCQDKgVqLKYt9ZUTPkPw4IvqYUm+L2+w45u4/6kSkByZA/+
	 jpFpEdtSUQA8uD8MeWVF0jeWh07kcfG+wiM4lK5CqSbDrt+GGjsUKN39g7OaAha4R23yL
	 Hln2F0ZxX+OQA8eEZ7I1OEOkuT7nAeUzx27gsP2/b2ZNnDipGtW1t9Fn6FJtkxucZbv3l
	 VR0Dwr41GE47rloEtjPKgQxTGfWpjCVhSB+bLXP1d2Kca3O3qGQg1yeQ/PVwowDi+r3pc
	 j/HaIGfiiS6BpmIryqqKa1R6/YznmH208UIo94tdh4eMD/0SaMXHFTjcJaWb2UxN78g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084242;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=dqbHFVaWUbXAwRePN2LaxE1LeHrz7c3R/la2wo+majo=;
	b=5mtw4TixHoYObYzor90xE5SN3oPeI0A9Ynzu2/9Iv9WBDXYmTELFD3rx8xtdieGAeg+p
	 8hSKN3K+TuzxsWDN2TDOyZQqy2VHpZJxugDrOljisIIj5wPzMF0bJh9ont4i+eD08GOEu
	 yKOGgTDqpY3Co0wZcRbuDP3FFd+mQtXFdk0OM0JTyiAD2DZJ7GB8uIU2AtMCKg4gav98f
	 QC547yGoJHN2ctq5z/ecogJOA0uVhvFuKmpq7Jvg/+gSIq7DdaK5pivwyCDRvlHZgz7sQ
	 bfT4XcZBI6p3+gSSEjXNdwV5NYoSTexSVTg57CcjHRT+eUXY6P3Hc6qyWSyYZbIRmSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=h09n881b;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AE606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647AE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=h09n881b
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261119103039euoutp01254f6f5877e1a2f47872d23efb30a173~pa5rT6Sxt0058100581euoutp01b
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:30:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261119103039euoutp01254f6f5877e1a2f47872d23efb30a173~pa5rT6Sxt0058100581euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795084239;
	bh=dqbHFVaWUbXAwRePN2LaxE1LeHrz7c3R/la2wo+majo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=h09n881bzcMae1a440fVRQhmnMSBem1I58wGSLPA6KwNhCodpyBZ/WPOfHNVZTb4i
	 /hbzffmZMY3HGLH+n9EDyvxHblTLkwPlFiwXSAEmGV+TyciCCQBQfU04gIsdWv6xlV
	 sa1s9rW395pil3mubZXu0YR5AX9X70sWc6btPNX0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119103038eucas1p2a84cdaf4416c2f47c39d3eab399becd3~pa5qyR6qU1039710397eucas1p2W;
	Thu, 19 Nov 2026 10:30:38 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261119103038eusmtip2e2d5e67fc7424b80e8319ab0d9da17d5~pa5qZh_vX2374523745eusmtip2W;
	Thu, 19 Nov 2026 10:30:38 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH] ARM: dts: samsung: exynos4412-trats2: exclude memory used
 by secure firmware
Date: Thu, 19 Nov 2026 11:30:31 +0100
Message-ID: <20261119103033.1161693-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261119103038eucas1p2a84cdaf4416c2f47c39d3eab399becd3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119103038eucas1p2a84cdaf4416c2f47c39d3eab399becd3
X-EPHeader: CA
X-CMS-RootMailID: 20261119103038eucas1p2a84cdaf4416c2f47c39d3eab399becd3
References: <CGME20261119103038eucas1p2a84cdaf4416c2f47c39d3eab399becd3@eucas1p2.samsung.com>

The secure firmware on Trats2 board uses the last 1 MiB of RAM: on every
system suspend/resume cycle some data is written starting at 0x7ff00000.

Reduce the memory size to exclude the last 1 MiB of RAM, the same way as
on the other Exynos4412-based boards using U-Boot bootloader (Odroid
X/X2/U3). Non U-Boot based boards require reserving more memory, as
already done in commit 784c93e3ca2e ("ARM: dts: samsung: exynos4412:
decrease memory to account for unusable region").

Fixes: 15dfdfad2d4a ("ARM: dts: Add basic dts for Exynos4412-based Trats 2 board")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos4412-trats2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-trats2.dts b/arch/arm/boot/dts/samsung/exynos4412-trats2.dts
index 3c2d2a7836da..c89c418b2b09 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-trats2.dts
@@ -19,7 +19,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x40000000>;
+		reg = <0x40000000 0x3ff00000>;
 	};
 
 	chosen {
-- 
2.43.0

