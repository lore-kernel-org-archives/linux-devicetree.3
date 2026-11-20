Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167761;
	b=f/Caz5JGaBmyAl6tGiSKtbnx6Aenno1yhmEO2OPRZFlHz+JFIYrHrwHVpjwyfiQA4I8y
	 w+gEyCEQQuECWbFeu0eveRwMPl0Onn1OIpfnDlqHy3JBKYEw9g3bbf4hehkRn2KA1jrfa
	 lyGi8KJLoM/5eF6PHD1yNNLUDJWCO8Fna+ldf/dmxYIc+K4BA2+MCTsbko4iMCUZs9WAf
	 YQ8HweRrsVNpoWvfJVN4+bS+gp7YrgFx4KTSD2XOYfm7HFI5XpIsBetFguGMvAzdx6fif
	 r1VBLkIDnK8SbpiY4I5WtcLdjhAhYue1sMkUrRBSfNhl7O8RI6ub4wEE9mcdfWA7ZVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167761;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=T2FuN5OiCxA4hG6OB6nRzse4ZJ0m2aVwtWaqqCKPDQ0=;
	b=uGF7UmBaHnwq04U5lVmwGnxA8xRoncAJJor5c5tmsBvMxRYnwIOrWP5fW3xHSo+XGyHk
	 vKRcT3gR2klzYLKCKdeWngSlEBWDcJNK/7yS7+GbjBTdCBMZfMvT24x1Ats/ZsZPU5tUF
	 j19LBHcY/wCD67t/UwsK3+PXUmovbHKdIM1MvFMZpd++L7bbooNVI2FDnvfne/ozSY7+/
	 reKOMhh1PVo6J1IgwdcZr1xf9KRgNl+bk9ICtl4ylx5BPBQMTmWe68Pwxozu5FTn3Wr5j
	 fpLHi5f8yNqYUAxlXtW6ckDz1UF5YFisENoHzv+AtteymGyKDxS46i9Oy+xbvt/H2Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=apl6EJVO;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0C606A320;
	Fri, 20 Nov 2026 09:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C0C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=apl6EJVO
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9BCE10BBEA;
	Fri, 20 Nov 2026 10:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795167754; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=T2FuN5OiCxA4hG6OB6nRzse4ZJ0m2aVwtWaqqCKPDQ0=;
	b=apl6EJVOflbfbhm2phWLnsDQmBXCnffH2gxv/fBL3tZsuwCtDV41AizZqWqgVqjKqACl/v
	kU3AI5aztTTd+F2XuL6LMt46Zv6cIGj5P5aQ4W7JdEvbBvJTqLZTGU3GRFbl+BXiSMUW4C
	2I0wuycTG4HySForzAqimVjvHIxtOSkZqFukEemH69Y5y3xV8zR7erfJNconmCsoDc1837
	Qugeanmn7C5XPhFyMm1vnGIvtXYHMRHCuzl+re4y7czTt8Xh+o7s2/3bSeoXAqtWmYvDMw
	mVCV53dNTyKI27Lg0WqaLKeLie3FHPWOyp+0ZOzRxxm8zQ/UrzcGekoS0Mhujg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Fri, 20 Nov 2026 10:42:09 +0100
Message-ID: <20261120094211.1742416-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
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
X-Last-TLS-Session-Version: TLSv1.3

Add an entry for the i.MX8MM Cloos CBASE board.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes for v2:
- Place cbase in the correct order

Changes for v3:
- Add Acked-by

Changes for v4:
- None
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..0fd10f1a1a58 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
           one compatible is needed.
         items:
           - enum:
+              - cloos,imx8mm-cbase         # i.MX8MM Cloos CBASE Board
               - cloos,imx8mm-phg           # i.MX8MM Cloos PHG Board
               - tq,imx8mm-tqma8mqml-mba8mx # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM on MBa8Mx
           - const: tq,imx8mm-tqma8mqml     # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM
-- 
2.39.5

