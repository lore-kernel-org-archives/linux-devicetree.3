Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B668329C60
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579271; cv=none; b=d2K5yJidyEbQoyTMfuOXTKDwq8K4ukE3qhWpYCsecrwndvf/9po7VsnuZ69c3e7yVaRE+xzU3NzbAtIknLUazjzjvKkVbBJLXXAQnnBkYov4Dn/y4hHRkm0WTWqQ60zg5D10TKSK5EJyf4ftlAGNx5FpVXDZXq8ALbbnl5EU1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579271; c=relaxed/simple;
	bh=DhWrWAH6pSp+Smwnq22EI/Ld7m8pY4Pykfe9SUrvhD8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=B8Qm1GPvmlEGz0MhhSSIK4X/84hsmEidWYcWJskoK/vBY6phY3DzldtlWJNRG1QI/xEY84Km3gf/fmwuJGa/hJ4YhBNnw021Vyr1ZvbQzGVC4LXH6x13sxek5kdOyEJrwSySnp/RKkulrtG1CNXH+y+wB07dhCRSAlfcSIJfSe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=h/P7HL6u; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="h/P7HL6u"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260627165428epoutp021dd848d9473ac3db0860ad24f88ab8a1~8-mZpOwgS0105001050epoutp02-
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 16:54:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260627165428epoutp021dd848d9473ac3db0860ad24f88ab8a1~8-mZpOwgS0105001050epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782579268;
	bh=yxQV2OmQ8FmlGKRUAsciidZmHjuFiJO8smjOiFHVv7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/P7HL6uOnzJL6aSZln3lWZYnbcV7y84ZgFiHoIHOiL0RzvtOT4c0JLKruuJHon1t
	 KtrQCLbQLU/AYawunPnpTQnlFA+YAdfSfSxycOPtqNauiBEfe+q+CgouLiveCSC2nv
	 VDNFJRIZ76Ri+WUY2aHTuNA1sWEISjx0OXM3K5gI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260627165427epcas5p26b4df715d2277bc220bcff20b25a6bfd~8-mZPe9dR1145511455epcas5p2R;
	Sat, 27 Jun 2026 16:54:27 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gndtV6zHJz6B9m4; Sat, 27 Jun
	2026 16:54:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d~8-mXrDabu1145411454epcas5p2i;
	Sat, 27 Jun 2026 16:54:26 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260627165424epsmtip1623a04ef7aeb2592566c2d2d559a6a1a~8-mWNJ6462007020070epsmtip1Q;
	Sat, 27 Jun 2026 16:54:24 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 6/6] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Sat, 27 Jun 2026 22:42:28 +0530
Message-Id: <20260627171228.2687857-7-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
	<CGME20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d@epcas5p2.samsung.com>

Add maintainers entry for the Samsung Exynos8855 SoC based platforms

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1705eb823dd0..f6d9e03d3370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23996,6 +23996,13 @@ F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h
 
+SAMSUNG EXYNOS8855 SoC SUPPORT
+M:	Alim Akhtar <alim.akhtar@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/exynos/exynos8855*
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.34.1

