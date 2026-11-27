Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791279;
	b=b7VMusEOSO+A9hZzFBXKUhtZMjK3iU38BkvH5ZB0zhEQjzM4neAOXFAW2dUXmFY15V1T
	 f9ZRSzXOZUFUhbVVVSJEI4jrB3zuj5xA3Y1xAIqQyIFOHahuVmow51BJsHmwDiKgZbsfX
	 Il4qeHsExrg1QVPLOHniUFXVPv63mYOILSddDrfQWgzw5q+grSoGvjMKDdDqXxr0JZQlL
	 /3UFSfMFORWGJpSNZo6SBbKt2kbuzijeslS/1V6Eml//g3qrilPFTAorzfW2d6K3ICTp1
	 cA8ULe05CcXeKQlXrtiDA/DwseMtW8nXtY1U+NfQxx00d7PLXieKKuxXagzNKUxnzFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S7ViY/cTDE6eZiSIsJOL9yqvd7LrFKnJqPqwHsnZ7M0=;
	b=jy3QT4XuARUNoOt35GMHFKNh6pk8vPWCVODw9DiJgXDwCA0sI/X4WOAlfRn92tS9kAGZ
	 MXcJe1HIHx5pmsBfxIVvEwe8xsNaMxP4Kygu2vyJKipexm+cs8tVVFygSrdCPCWpdubwS
	 2GacEWe5qApw1M27K6sjOTu/psneWN4AyPWYsRj1cuiS+YuabrVblFOOyR3MeYd4JnEFa
	 ELrXsoQdbugJbfQSGPyffqHopsb4clPn6plpeUsg0e6xKE4x+rfYKX+RBJ7O4GMnUpSzG
	 i0N9aWA5wpS1lKKNw0XVClquXu8tqZaiMsXHobE2aoCH8sf97a45TA1M3RS6SK/fmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=esviXNbl;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA12606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA12606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=esviXNbl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a42b34e930so7174328f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795791277; x=1796396077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7ViY/cTDE6eZiSIsJOL9yqvd7LrFKnJqPqwHsnZ7M0=;
        b=esviXNblUsN/O6pLU1HCwyW244AehioypbWII7mHLB/cUm5fASw16qqWiuviQd62fj
         hMnEfOoquDDjAPkKBDweEbkuO79znsgBfGTJcs4yX4bV2fSFtzXsZiga+3bkYkS0xXAj
         /1wK2KwIAW4U4xTlOq8caWJ7xMpHKc7Xlzi0sLz20rDyxsp5fCMrd9s2CUewrhgLo+RZ
         aCESnVo8+Rj3WuKLPUE1HsKRWqKmsnj8YLOQjmAcCD/x0MjLICUlUfHzUI4Lq6ss4ZYt
         wGQ6DCDsTISp/V3hBqMvE64veS+UBal3MgVk/dj4DMUHd5kkMelvN1chjc42yUilw6lX
         2P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795791277; x=1796396077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7ViY/cTDE6eZiSIsJOL9yqvd7LrFKnJqPqwHsnZ7M0=;
        b=BmxgKGMs8WorzyUmBnBBYpIiuo0bfEDH0L+N89+hUzRRrR8CjSNHHZqB9iUmbHSGOZ
         W1U9HSqpSTbNZtB/ltyAAs9QbISuV2K8ZkURgTseKP4mBecsimWyKp3C5U7JLDLPGMwG
         FzmeH7jYinkNerQ7PS38bDXmCSmENobj0/Ej476cVDrY+Mw+h9GCwfLeyGcMNehOzAst
         oLbHjrc3IjLmcR7ciulCHPIg6A+RPt+lO8xGZy6E8YgL2edk0hloFb5UIfItKGDlj1Kh
         lp0bHtjPTcCjQLPyQKrT/CXE3Iv3aPbCv9fjb1dunD+Oqzr2P25XikGL+jKxGpsajBGJ
         5RnA==
X-Forwarded-Encrypted: i=1; AL+hErEgYs/biVxGYfgT1YGSOnQG5iA5qJlIaLmxaWLMNehpHOLiWNOS1RVNvDyyUjeY1gXsrOR+WSz+t4dl@vger.kernel.org
X-Gm-Message-State: APuU4Z+VxSq16xYaS3SxsuRegjNl3d4OMf9Gh9BM6TMGdR1pSAoziYBx
	lqCPQmvYd+CExc6HDnrEHHWu73h2dJYC4lPjZ0dV4iVcUMkGMrKHniaf
X-Gm-Gg: AZFdTZeqWuRMTiqvR5N0Krq96PYzHAXbRhGA4GdzNRfHGvkFLUh1UwA4Wt9wEzeOsTV
	WlyE3zcBHYvUaWUPJ0OCuu00bDOcXAUhL0pI/eH67XLZd2asJLrVsAXP0u3Rd/RY9O6s9YAkpZ3
	XOU48YGiIogg1nP8AFYQBPi/1GjQKQBjrMDW+QaZvOdikOXbCjaBfMYA8GUJn7vi8rgf5ZRJIpt
	47W2oAPk0OI4qfeVMk3yLqWHUDhGXEtcV+Q8jWqmz+qlzc+Mecqv98Svf+Nkx579kV0Dr0pRQG0
	DqGjkuBcB+MBoV5srz9lR8hn5Jf1aA92lzuH9L1/+wGwhAYBECqTa10IJJEKHBIbPXLbUmiC7D8
	pGxH2/y16Onb+rNmvjYVWT2HTnZi3IDDE6aMREf2HSlTiGGUuFA5rboFbDBocflzm3Xvgt9zTxB
	cYlAjXNMRcQh5v7Jm3aQl4wfYCLusW9jHb2GlWscHcfK2wkrsZE5omI7YqR+LlFAaqBSEwXtPMM
	zo4OTGJSsBNV71lmkVay+GfB42muAwzAjigkRyVEXPxJHCBHtcveReIJVOadjF3S4Eu/7MoX4dk
	Z+vK1dWtFfBSplWxFfiRXh6WwY0XwdX+5RuK0SQzowvU/0S/4r1CoXGGXzUC4TMtJLeEO0uZVp6
	xfjc=
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr494120945e9.1.1795791276914;
        Fri, 27 Nov 2026 06:54:36 -0800 (PST)
Received: from emanueleg-nb (host-87-4-46-207.retail.telecomitalia.it. [87.4.46.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm633589105e9.1.2026.11.27.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:54:36 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] power: reset: tdx-ec-poweroff: Allow building on Qualcomm platforms
Date: Fri, 27 Nov 2026 15:54:24 +0100
Message-ID: <20261127145429.2060162-3-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127145429.2060162-1-ghidoliemanuele@gmail.com>
References: <20261127145429.2060162-1-ghidoliemanuele@gmail.com>
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

The Aquila IQ8 EC exposes the same functionality as the SMARC EC.
Allow the driver to be selected on Qualcomm platforms and update the
Kconfig help and the module description to cover non-SMARC modules.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 drivers/power/reset/Kconfig           | 9 ++++-----
 drivers/power/reset/tdx-ec-poweroff.c | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28..ecb249cf5359 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -246,15 +246,14 @@ config POWER_RESET_TH1520_AON
 
 config POWER_RESET_TORADEX_EC
 	tristate "Toradex Embedded Controller power-off and reset driver"
-	depends on ARCH_MXC || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	select REGMAP_I2C
 	help
-	  This driver supports power-off and reset for SMARC Toradex SoMs,
-	  for example the SMARC iMX8MP and SMARC iMX95, using Toradex
-	  Embedded Controller (EC).
+	  This driver supports power-off and reset for Toradex SoMs using
+	  the Toradex Embedded Controller (EC).
 
-	  Say Y here if you have a Toradex SMARC SoM.
+	  Say Y here if you have a Toradex SoM with an Embedded Controller.
 
 	  If unsure, say N.
 
diff --git a/drivers/power/reset/tdx-ec-poweroff.c b/drivers/power/reset/tdx-ec-poweroff.c
index b4f1c87f5651..5629739fd74a 100644
--- a/drivers/power/reset/tdx-ec-poweroff.c
+++ b/drivers/power/reset/tdx-ec-poweroff.c
@@ -164,5 +164,5 @@ static struct i2c_driver tdx_ec_driver = {
 module_i2c_driver(tdx_ec_driver);
 
 MODULE_AUTHOR("Emanuele Ghidoli <emanuele.ghidoli@toradex.com>");
-MODULE_DESCRIPTION("Toradex SMARC Embedded Controller driver");
+MODULE_DESCRIPTION("Toradex Embedded Controller power-off and reset driver");
 MODULE_LICENSE("GPL");
-- 
2.53.0

