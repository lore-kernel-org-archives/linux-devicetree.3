Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2753DB63F
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366445; cv=none; b=WA6ROFlyKBwqHI+n7vAgCyCxZ45Ckzr9FQPmXsdiKw4qv6kAj99ZBXlZ6mJftF0pI18urc8n+WOzDGapsoKVQKMU9hjWgYcDdO15WN8gLRyZmfJTLqKujAVv049aEtTuusbk+KSY5m0G5EVmD8ldA1fws48VE0iSVPoO8td9jQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366445; c=relaxed/simple;
	bh=sY9+3bENskEECqy179xCrubdH5603AcfuuXqXbiU1Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VddlR+XdZPEJKGBPg0Z+fD/ObyRLxBcvlxq6VVqdcq6ovboyOzSTPgOdpNJpNRFPRYJ1mRJqkQIHCa92+DM0viLpNLMBuvCDJZTd10IAN5mFVilz8HUzPYDfbJevxl3VN1lHwznzev3WeuQzweH/QQnBN2qhoT5Ntb5xIUjsAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hMmHvkOp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hMmHvkOp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 773F81A346D;
	Tue, 28 Apr 2026 08:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 480C6601D0;
	Tue, 28 Apr 2026 08:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CAC41107284E5;
	Tue, 28 Apr 2026 10:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777366429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ot9nm/pABtLTPSGzXe0swiSAfOvabkyS/b+zLNGI4wM=;
	b=hMmHvkOpAARovz4G6rVIkwrisOvaml+RgESItu+Mu9YZE8vZ+hqc/1/L3Tod43SgmQn1uL
	hz/RPLq28++lpLFTfigtI0YvwSO5R7pUIKVwYWUNgUKdqp+qI8SX2qFbBj/S7nU0op/nIg
	4cRaL0xVcT7HHUJNJhgr4UeJvravpS57n8/bThh+AHro2KYpcDsG7mIheGsJ6K4A4V0uLu
	YmJIuRSmrWynkWfvx73P19M8nuupJvmOo1TzU8pdRRlhFsG0RZ8CL/BmMTwczFJJZmcfg0
	5EgWOws940xEht6Pmfh7rtzI1zxTlf8TZyelxAX2ZrYwf02AcwzOZNGJUucDfA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Tue, 28 Apr 2026 10:53:41 +0200
Subject: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to pmic@4c
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJR18GkC/x2NwQrCMBAFf6Xs2QfpNhr0V8RDErd2lTQhERFK/
 93gcRiY2ahJVWl0GTaq8tGmee0wHgaKi18fAr13JjZ8MpYdXhOejsfGaDkh5PwuC0oVVJ9Qkkb
 YCGftHM4mmKOfqKe6n/X731xv+/4DqU5SFXYAAAA=
X-Change-ID: 20260427-k3-j721s2-som-bootph-pre-ram-pmic-4c-744fb90b05a3
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 richard.genoud@bootlin.com, u-kumar1@ti.com, a-kumar2@ti.com, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On j721s2, pmic@4c is needed to exit the DDR from retention after
suspend-to-ram. Add bootph-pre-ram property to make pmic@4c available to
the bootloader in the phase that sets up the DDR.

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 12a38dd1514b..a19e535f4946 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -250,6 +250,7 @@ buckb1: buck1 {
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
+				bootph-pre-ram;
 			};
 
 			buckb2: buck2 {

---
base-commit: 59b04cb2325c07ddc1cc7d984bd8c8f89f161746
change-id: 20260427-k3-j721s2-som-bootph-pre-ram-pmic-4c-744fb90b05a3

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>

