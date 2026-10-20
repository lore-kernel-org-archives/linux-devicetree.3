Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478748;
	b=gBT8QikHhktahGUfkMlI1H7G0y4dSKZHy5AbQkIBMdXst/S1h+42mkT1N3QFO7m+C/V6
	 Ae+zPmuSB74Ze/SmZGjboX7TDsZmud5M/Ookv6kg8HGZ69t+7N0gDYqXDXOBJS2YWgx5C
	 50kBLJIOGrmJfatKZ7LC9TfRyfBYJikovbFee74gsibnuWLK5FVcnl2C1axO9tMOOtxo4
	 pQeYzKl0juaDzrAvLm/F/P1uQBWC5tlWztfk1v8OAU6fTycYfcmJkFsG20D/2dyGlm6Vt
	 +QsWW1TuUvOSWqJdaTh1BREF9uCw8CD0ew1ruAqNpWhSVjfJ7B12szGYZBJDTx9nSvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478748;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	b=k2nGumeTQiTpee46ewppZxPg8SFPcDblvCAx2IPoel9OhRHim5PIDPltYRFdPVP8DcQu
	 Hr6Tzpg1aNlZfO6PJ6hZMmn4b7WFwF+Wdg+icKU/aVFfUq65CYACKjrh9j0YElw73zpnx
	 BmxUFwXkQioAbjBTSVALCRmnw51LHK3Yn+gO2H86K02V4bmpM/4QV5utVEWvabMWG5w0x
	 glqFeKm5m56K+Srzlwx6I5lOStS6NK2GBqd7IWgfkKBh2dQySjKLT0SIiYfc9eCXnwmuL
	 pt4W3cuJIuYvgvTgEPMZLox5IrsmJYp+dMxvg5QXR+MVAkwQOo/sSnZspCE31HPO8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cjq0HcCT;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F99606A331
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F99606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=cjq0HcCT
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261020064539epoutp0247b5b2a2e911d12b69d8f5703e02dc05~gKeq9mtdt1865118651epoutp02B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:45:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261020064539epoutp0247b5b2a2e911d12b69d8f5703e02dc05~gKeq9mtdt1865118651epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478739;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjq0HcCTa9Xi+H8jMoTGQm++P/N+gaSL1/3Cqfkp5c7fZPKmRTWumnar/iLzSXHx0
	 7uNubglU28tFEo2rpwDQw3VWBl+t1scm7X4ObCbUsLz8tn7UXTMvnHWrDut5w2mcxk
	 cw6F45LmdkSbxwyxjaGqI5T+OTbL3aEu0uHJ633M=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261020064539epcas5p3c476d8c07199488467b05bea9777f99e~gKeqen15S1867518675epcas5p35;
	Tue, 20 Oct 2026 06:45:39 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j82wy2K8yz6B9m9; Tue, 20 Oct
	2026 06:45:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8~gKYAHHciG1318613186epcas5p2R;
	Tue, 20 Oct 2026 06:38:01 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063759epsmtip101a08c475fa3316a9c293e2f933b720b~gKX9xGC3-0369603696epsmtip1E;
	Tue, 20 Oct 2026 06:37:58 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 01/14] dt-bindings: soc: samsung: Exynos8855 SYSREG
 compatibles
Date: Tue, 20 Oct 2026 12:25:45 +0530
Message-Id: <20261020065558.1829402-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063801epcas5p25a6322caaff32c7e4d75c8c66e2909b8@epcas5p2.samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

Add exynos8855 sysreg compatibles in bindings

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..845e0caba15a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -31,6 +31,10 @@ properties:
               - samsung,exynos5-sysreg
               - samsung,exynos7870-cam0-sysreg
               - samsung,exynos7870-disp-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
@@ -103,6 +107,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
-- 
2.34.1

