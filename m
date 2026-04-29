Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576135F605
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777465205; cv=none; b=Ic5d17fPKoyfv+U4ciq09kjzGUYCQCs67YPWBW+2czghzh/Rvx+0QiRop8/Lrl9x7GvgqE/VxbER/+3CfF67fjb7k9+k2tjlfyv4UBZmP+r0n/nAjOQ3eIvBKy1Y1ytbwKpOWiWRUvLeTzNYg5KYu4FPFwcsB8ck5I/DE9BvAmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777465205; c=relaxed/simple;
	bh=gDRhM5CLKRI+wwMQQUXKMmoI5wAhA5H+s6qu3bR6F2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mgjDiO3+t/TZqSCPO4CmMNIGwdCbPFogMQu38pL3wQ0FFXoxADPmAVJQyHvwbJw1U5brNhEj23v7H7L2SW8d+3PNhyimqqw4UCerex8FHbsck+rqbsrysDvDi27BehkOxeaNdXGQdHl/2BerzZ4As+TW1qmsuF3tbH4M7O8GsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RuSqv6yo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RuSqv6yo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B5CC4E42AF1;
	Wed, 29 Apr 2026 12:20:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBD91601DF;
	Wed, 29 Apr 2026 12:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FB0D10729CA0;
	Wed, 29 Apr 2026 14:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777465196; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=umQT6FTIxdphMXQFtg30XzGrHeATYZt4GaKs6EI1if0=;
	b=RuSqv6yooHTYsSxzqrh948SqOEAAXaTjq7OnNfTwRCzdoLojlF9G8BB7mxdXSyWngxl8RL
	jdt6qbQhvc6wuIdXMlggk/5fQo9nPN7ArhGm17U4wdARqT9oOifrKhwMFkFk0pcIYqU0vl
	OrAjV2Nl6jvxNUeSTFtAXjhOG5oRohqGLKuzq+7Vxax4eshVcaSqC8UQV4NHYW6FuOeqJ5
	GlFRnNpqdVL82/AhbTwLhTy962QUXcTpMgk/0jgSKi1BvbQVyoSRyUcqo7UFc6zt4HaPPA
	rxBTxfzvQUYPM/1UaPYsv9Dq5kzNepIhRiLLzvikzEy7walibapPOCbhX0YrKA==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 29 Apr 2026 14:19:48 +0200
Subject: [PATCH v2] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to PMIC-B
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-k3-j721s2-som-bootph-pre-ram-pmic-4c-v2-1-31a0e7677216@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGP38WkC/42NQQ6CMBBFr0Jm7Zi2FAFX3sOwKHWQUUtJS4iGc
 HcLiXuX78//8xaIFJginLMFAs0c2Q8J1CED25vhTsi3xKCEOgmtSnzm+CiVjAqjd9h6P409joE
 wGIejY4vaYql119aiFYXJIb1K947fu+baJO45Tj58dusst/QnqP4TzBIlUpVGluqiMOKyFV88H
 K130Kzr+gWoaCUs2gAAAA==
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

On j721s2, PMIC-B is needed to exit the DDR from retention after
suspend-to-ram. Add bootph-pre-ram property to make PMIC-B available to
the bootloader in the phase that sets up the DDR.

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
For the v2 I just updated the commit title and message to use PMIC-B
instead of pmic@4c.
---
Changes in v2:
- replace pmic@4c by PMIC-B in commit message.
- Link to v1: https://lore.kernel.org/r/20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com
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

