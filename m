Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023080;
	b=JkbBsZSyWMKerk2JIOUsFFn+vFmdwMWfQsXybzdmYw8N9GofpWk168eLF3G06zWAj9Gw
	 PGLyJ1bU6Fhe3R+eW3zt6gfNLaXDYypLXxe9gHCXSVsrvLj4YWKewe7zXigY47PFLpHHs
	 WJXuFcAl6p/RdS2bQ5AjNfX3mxOlseSUYcwuKl/hHeRXE05bxRHvvYihoYN/GYtjtZo6d
	 dPtOAVL/ysQwoASMmrfIPA7wx/FGTW1oP2aF+HxR6YJco6I6kFt2E3gCaA8qZPI+KhP4v
	 B9cL7UsHSq6Bizza/7yz1QoXuM0I+d7cjHoaryG3YZnDnziHJSTR4mUrCgTq86HMOVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023080;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=KW1WzRc1tzLF58BOmGAQOp7E30KcthgOi+aTArJ3XbA=;
	b=R3Vz6ce96KilPtPTi5IR8S7tooV+N10uWx4rgbCY2+wZ9dAEq6Srt1TypyD+lvp6AnBP
	 Qk4WUElIGJVdvrF53GSAA2JyZubytHurNJ/W0Qxshd9Bo8kbgAGgzAcv/jRfMUz07gSwh
	 dojYgHKejtL6bSW6FdpWsXFXmwBG6xi23yhUBW+M4ZSe+LjOTmO3+GgQqfxELiO98Rpmy
	 7zTEfrvqyhZ7JnZpiGwABMFmPMtBzaHKU9beUAgnsgV1Rnd9tC0aBfWZzbiClw93fe9dm
	 Ia0q0hgm6lAYNuGbvAuBfV08SXyhZMJWC6j25gnkX0bqhjn5p/ByMBxNmzL6G8czeQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=R2LrdxDa;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCCA606A335
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDCCA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=R2LrdxDa
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261026135757epoutp049ca16541c6cc1b62343eabdeb982f33a~iGP1VkTy91631616316epoutp04V
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:57:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261026135757epoutp049ca16541c6cc1b62343eabdeb982f33a~iGP1VkTy91631616316epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793023078;
	bh=KW1WzRc1tzLF58BOmGAQOp7E30KcthgOi+aTArJ3XbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R2LrdxDa6TUPXkypAVl3MrpzPtEUyC1vcNu7xUIT+2Xtj+u4ipmTVzJULAFBkZjUr
	 qcNsPLkxVpNPAIhfgc7wgxkBcp+Ak1QGH5ObOR0aSWV00jJNZK/IyPD/VMQrW7Mrv3
	 eydiWJI7mA28ZtdZPw1XD+NrmuT1FNYyxoVaeA+k=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261026135756epcas5p3087ef8bf0a846813b5eeedc1e6fbad7d~iGP0FGnEQ0508605086epcas5p3N;
	Mon, 26 Oct 2026 13:57:56 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jCwDz4rp7z6B9m5; Mon, 26 Oct
	2026 13:57:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d~iGPyrihaB1259612596epcas5p4z;
	Mon, 26 Oct 2026 13:57:55 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026135752epsmtip258cc5d42e667fae494fbf95c52b73775~iGPv8zpNQ1390513905epsmtip2h;
	Mon, 26 Oct 2026 13:57:52 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v4 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Date: Mon, 26 Oct 2026 19:27:15 +0530
Message-Id: <20261026135715.33071-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026135715.33071-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
	<CGME20261026135755epcas5p4efa15a5e7540d91b4411a7b324aeaa5d@epcas5p4.samsung.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
so the Exynos8855 DWC3 controller can probe through the generic DWC3
platform glue. While at it, alphabetically reorder the existing entries.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..d57496716204 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,10 +232,11 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
+	{ .compatible = "samsung,exynos8855-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
-	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
 	{ /* sentinel */ }
 };
-- 
2.17.1

