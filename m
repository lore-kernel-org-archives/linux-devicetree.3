Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022114.outbound.protection.outlook.com [40.107.209.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8306322A00;
	Thu, 26 Mar 2026 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774558252; cv=fail; b=mo3GXPiZTpqHdVZjq1d16sRV2mC8QB/eTN1e4TYc824OboytE6DcsemvJ4N0ROg2Z3od1khCg4WeonYgINfFw959W53N2vyHFg984KPuX+6//W9riPeP4FwZGOQzuxPNQPZo7d0DSy51cS+PY0E9JRwK2hYDh4oVGelHSeyD3u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774558252; c=relaxed/simple;
	bh=ZNaep1lITPb7F9sckJ65mbAUwj0yvfIP1HUHr+/lKK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nJcLGRsC6SIbU247aubNbjqQuci2RkrY3LddidbnYoNetBgFlmxtMH3PkpdWzbxP2pkFqFMr2+e7NAgqdVhu1bHpwmf7j+jHTMB45beBp+H3Ov3cxi2qHsl7I1FECE0GdNmOn1TTzYomCdvyQoXPvLd3LyBfmr9/EDGwzE/R7Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=JASJfDzI; arc=fail smtp.client-ip=40.107.209.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="JASJfDzI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxSWYwcjXJfDKqTQybwmB4gE2w/ezxZkT8CJJIhJkL8DAcyzTbFKkl6ImXouvidPaTz6T5Lxt++GTc334VnoNzka9Blb9O1eo+E6VXHLPGaXrI5bkvQtiZ6UgumRc9ZWwmaVtEwy0QuoTS5vwp0ngrHBJ6MEjpfC8xYVmuNyYRsgueDEMpw94iNcqKDU8WFr69BqpGd4g5vDZQ01/Wp9ptrxtIqrFvs0ZT8o17Yb9W5qD8ECKK3DDMKAECEIOw9jBczkfSXkAZ9I8IYMLU6oe5f2omA4Imq+atbyAvsxZcMd+vP0i3rUoKKqpAEDdOuOylZCHt9GPN1PRLDPcf6WxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIx4hxBOGv1Bm0fV7N2JMmMymCzgF9ipa7WMznKwBgs=;
 b=hkT6TldwoUo53OGHDJGmBQIyYrjKuaiintS42g27sPqpxY6hMhKIY4+kb7OyxQvZe8RkgoGu9LQjUEOCm9+ssbHwmGzBzmTZrSZUZ46f+4G8Ap+qGXLWsUGHNOJSBij07xWSDgYLc7xVTGBwhcls8i8cIq98Qr/Oec3KLSjFvY/FUgxdFkPedhGEhLHlQBcVWsNQHWvSqmNQIakc5DCkcnDigSlsNjLWlgYtKRae2VwmZiTYVzAd0IxSclPmwY4cnT8IttloBphxrkssfacUEifuFytugNGVu04WFsMhNVMZ+9vZigKnoKWTZcLKw73PwEmhDKJb4AkdTmBYELKP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIx4hxBOGv1Bm0fV7N2JMmMymCzgF9ipa7WMznKwBgs=;
 b=JASJfDzIm3IlBsdW6Jqb68jhdzok/52kj9zAh5kV60Dqte9rVySeJpdRCyXMcJmhbUWwzXI9Qrjh5neApqI1vuz9fZJosVaJdLGyr+F3rd4qhiEmcIMBvQbSrTYn8rHSDnuplC+Tyln8SgMdewQoBMEf2JfQUb9RJIH80ot4mnmv9ChWiJYRpcxMRSe8MRrLyxuIAl65GBV/x8XgMbTydtPFkdI/IsqiTbtTomrCZNteFCEi7gSR5De8EnZ3Z/jPnNzi2+cUjdyX3lY+LECFBje3CxbUZcuGAvq57+kVZrqH5iGj3C6ghA/HtNfYaJ9ZIux7C54hpiZ4ofsXsZpKvw==
Received: from SJ0PR13CA0140.namprd13.prod.outlook.com (2603:10b6:a03:2c6::25)
 by DS0PR18MB5286.namprd18.prod.outlook.com (2603:10b6:8:124::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 20:50:46 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::a2) by SJ0PR13CA0140.outlook.office365.com
 (2603:10b6:a03:2c6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Thu,
 26 Mar 2026 20:50:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 26 Mar 2026 20:50:45 +0000
Received: from vm-swbuild02.AxiadoRD (vm-swbuild02.axiadoRD [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 4021D4157BE1;
	Thu, 26 Mar 2026 13:50:44 -0700 (PDT)
From: Karthikeyan Mitran <kmitran@axiado.com>
Date: Thu, 26 Mar 2026 13:50:25 -0700
Subject: [PATCH v5] MAINTAINERS: Add Axiado reviewer and Maintainers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-maintainers-addition-and-axiado-ax3000_dtsi-update-v5-1-648dfe9bff29@axiado.com>
X-B4-Tracking: v=1; b=H4sIABCcxWkC/6XOwQ6CMAwG4FcxO1tTN5jMk+9hjClsSA8C2SbBE
 N7dgQfjVQ9L8zdtv00iOM8uiONmEt4NHLhrU8i3G1E11N4csE1ZSJQapdRwJ25jes4HIGs5pgW
 g1gKNTLZLRSHi1cbA8OgtRQeyVge316XBXIl0uPeu5nFFz5eUGw6x88/1D4Naun9xgwIEUiWa3
 BSmkOr0nt1V3V0s3pB9DIXyJyNLRpFRXhlba12YL2Oe5xd7kIpjWQEAAA==
X-Change-ID: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Axiado Reviewers <linux-maintainer@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Harshit Shah <hshah@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=kmitran@axiado.com;
 h=from:subject:message-id; bh=OgUYodLQN0KuLEyreD8JZZdfEQd4E+MzFyS4GeJhOLk=;
 b=owEBbQKS/ZANAwAKAfykr3bAxbrPAcsmYgBpxZwkiJGZdQVexqoGjl7S3Hcryr/vFRCbbpceE
 IPIg41/noOJAjMEAAEKAB0WIQQykBiJeI5kfMQLrdj8pK92wMW6zwUCacWcJAAKCRD8pK92wMW6
 zxcLD/9JieQi7PVjCbVMEmfTpwwKGLxBvALZiYr78CwpAIacTwcSpHB5veM9Vqs7n7qxEvzpoNg
 WfMIT43bKdcHtSMJRf4zjkI6LbamoWwCOJ/PULvrBsYI4Ndft42BDCQc3zJfYNRyKkfEmieBHJN
 ehaCXLUXIsGuysa2r+iO+/X/O4ZoGH3aBnLt9DvX7Yvjw8KAbvQ2prw2Fzaa1NPxI6jX/tQNC7e
 a5hdKrsOjn4JQCgvkZA9b6xER/Z/gsj8/+JGFORcTGSA2DYkp3T04ZC2AfKKA/zn2rZ/TG3zTKQ
 vtuIBql9Ohc4zcn1sgZ2FaO9GVrshJeUfsUDYKiO2a+zzyul7Cyp135M7zpEzF8zKoyciZvYvid
 ClIKDk+cXyr+PCMYi5HMmRlliwLmsqlj9eIN+fUi73FI2Pd2663CRT9c7Ket32hQ8vvOjt1mr0C
 9C2CXbiG+7B0eUq5fot8eZvbp+6PeyQ36CtGX3Zln2SCNr5BFrEDH1acy6SuLutdNzkgTdpAeMc
 pcVlhm0URPGvPfdPybSdaf3bwfkJv2gC0lRHqZHoDQxnyi2u/uCVJEhA+b0Eo2hc2sCFP/AhLce
 /LalLAK3B7LoWvwJiNHhlVnIR2iNXxwGPt1yfbXMun27jS4Y8GizBC5S+SrB4bpZMvTZSau1W8x
 +wdybDxUzwqBkMQ==
X-Developer-Key: i=kmitran@axiado.com; a=openpgp;
 fpr=32901889788E647CC40BADD8FCA4AF76C0C5BACF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|DS0PR18MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6a9a2e-8825-4a45-643e-08de8b795a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YEHgwJg/1qiZ3uhUIQPWJft2+UYZZskYy2ZuHDqywB2MzUDuxQBiQHkptgsk1uD7+c39kmmBbFsAxG5nX05Zbq2B72ioOMLFqoqIo9bsHp00KsYIqPz92R48p43GbhCvoPq1wheYAkB9LwjfqUbWj6tqDXK7ovVsQ1QTB1fm9vyYUpASRoxfN3qfiFu9PsPRefFiK+hBj7WA8gVPdggCxFCu/LWHHX/+z5gQkgOt2u9TB9f8vkUlcQAyVBuTdVqySWUI4nNS/9ZBVtvP77l2KLgSter7QNrUJxHZMShQsAaN+6ry4I74TtoV9bai+YKJ7HBP6LDp/M5liNCyHhcYVCs6ZYCxHwPXLFBXorAA7vqzVdoKg8KZR1grbtZY4GNsAq7flXeQa1HCZ8Bv+cCpO6oqgbt5pw+k1TIyOpHZZhMhR47h0zFD7QgGxaFK+DbszjWuFCKL0O7jYjgACt0dtLIB0Vh+qL3XEbya5cJ6kbf7zZMp0IIsoB9jZB84JGBI9xytoufKnn2Ab1ofK5kfIdiVifLVxJKAvM6gi+r5MyJT7YQx2IPUis5FpUTeV0ELEAuQSFuzcxzHZF08vbMDXhoU2ZlizQ4X6OaHNww3LPYpcckzQsaT0K+p76NsBn+frgkUEamRNiBY9xl7367LwF5jrlPtfn4kCWipU9hAZOc14+3t1V7lm7/G8FF+lypaTuCTZCFu8+nekSE7/yLpMEfil2G0WWy44N8nDXgTDMPuEHGnI1nw981sqXliRaDp5sf0pMQ0L4rvtUYXBgd5gyJtxC5KWezpmWiHUI8Hnho=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8l9+CY8LKemsckxZZBDJXg9gJBu/c29f9btwmCQXQAGgjMAJm3sKANVT0kQrO6c/Nevqpr2XUsDb/YP2x6JsUNwPyFPxoQlD2PCVoex9QOrm2cFHGKhgYoGy7rmtcj10FxHGkmcKyT2xd6atAj+rk1i1GSCPGDjo4Sz9OAUu2bzkmCbsP3kIbbMw43O8Frp5n5YlBk0rINRlkpyPdvdXd9Z6e5fiePXHXiVZyhKe7aXg+AIgObvfnNSPOH27gNntYJLP1HZ9wh3KkUPe26Wy/kfyhDLSRId9iare6PDA+KbbgYcbu8+pdYbf8o4GO/s0r+RynG56n9ctsDcbeXkH6sCTib6u/bAUfjOQUitq4p4ODzhudT+0pUDQzI1tQoZOYQQKyGbFZdM7YnY9t/dYSzL4lbn/Y3Y1tmr0TK45fjobr4YXYqv+KqRDbIs7kDeY
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 20:50:45.6520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6a9a2e-8825-4a45-643e-08de8b795a6e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB5286

From: Prasad Bolisetty <pbolisetty@axiado.com>

Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan
and adding a group reviewer entry for review coverage,
Removed previous maintainer as the previous maintainer moved from project

Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Acked-by: Harshit Shah <hshah@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
----
This patch removes a Axiado SoC maintainer and adds 3 more.

A maintainer has moved on from the project, so we are adding three new maintainers (Prasad, Tzu-Hao, and Karthikeyan) along with a reviewer group for broader coverage. also commit message amended to have the same. the other patch has a dtb address hex value change from capital to lowercase.

Patch 1: Removed one and added new maintainers and reviewer group for Axiado SoC

Changes since v4: Droped the ax3000.dtsi patch,to make it purely a maintainers update

Changes in v4:
- Updated commit message to clarify maintainer removal and additions
- v4: https://lore.kernel.org/linux-devicetree/20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com/

Changes in v3:
- Updated commit message
- v3: https://lore.kernel.org/linux-devicetree/20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com/
---

---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..49f47e8c2ec3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2605,7 +2605,10 @@ F:	arch/arm/mach-aspeed/
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
-M:	Harshit Shah <hshah@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+M:	Tzu-Hao Wei <twei@axiado.com>
+M:	Karthikeyan Mitran <kmitran@axiado.com>
+R:	Axiado Reviewers <linux-maintainer@axiado.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/axiado.yaml

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053

Best regards,
-- 
Karthikeyan Mitran <kmitran@axiado.com>

