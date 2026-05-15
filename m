Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD06478E20
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846410; cv=none; b=uj/Bg/J2As4ZTSDgyzzQixxoJVGA6ELlw9l8OK6WVkktcmPxDPsVlq1gH4VW/GmnQggMAqULBWdZ7Y0v3m2If9xzZG+CyhpLdZqYqf1HYEmX27tonVhYMYqXTBm65pbdmwzOFLbCfG3MLzExPmv7S/PwBlNsyyCl2V/Fe2zlqBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846410; c=relaxed/simple;
	bh=Sipl+3EFg1DjSRVyXgI3vSXEGD5UiHoHv4Q1EB4YRcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmRA7cgtU9DpaBCGJazgP0feWGDei/fcxhsFETtWZJ+A/EymjZ5BQt0ZJZSH3DdZp7Tdrci15jTriXXrxPrD1YzkMXIJUElHXsEOFBBV/lkE3C0JR8ZL2Uo1vY/Cd2a7MgTv39CXav4/NujWeD/aSOoCMVsjtLsdyDfazwYu62U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=QYsXm+9O; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="QYsXm+9O"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a858881ad2so10711433e87.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778846407; x=1779451207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea/4RzxEzKT31bEDQIXyxVIvc8FvNcipfvT1OSWbCeE=;
        b=QYsXm+9OHv72imY6YDUTJ9DgAU+Qbnr+HFgH29Ntu05vgYzr4EAIaHTaZKZHAaT25N
         VaWRXNwPTDjcYX6zjs8u1/a8S+6FqRF+XNbWEyDoVACxmJcJjfp7yzWqBijqptof9IuN
         AFwNH94Zkhvvs3wEVzju+9Kd4UQYVEpbsjz4oGdXgdcvQVOaXEi2kaZGe+PIHImkJ++n
         rFuOvDKShD2DrlNeTxAf3UetLAhiNRUrs6EIpKBVbopVAwUmfcEGNyB69liK755RHmT9
         FrzBEtQiesMPYgMcwwlxCYVA+q282W8Z2DybquJJDU0f0UtJqielvR282QHlmhfpa6UJ
         QPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846407; x=1779451207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ea/4RzxEzKT31bEDQIXyxVIvc8FvNcipfvT1OSWbCeE=;
        b=O6FVVCIbJ3pOi868eO12tQbrcxAHjPnxzQrLUP0Pb9hj83LDX3qSenDtthyI7clYvV
         bNZuUiFE5VZRHJZPQQ5/k7MQYGtk/EAAlucjsztYrc1Aq+nuhqmBpxB5mq4HsitSHa7D
         T/x34OoIycY+Fh23uWW5A/OwDXozapygIcIvqQ4VZ9ihNJhdesHILHeQQ6OhNY8qv6IK
         AywuQqPtiUp4dExjY91mRrPLKDF427kM9Xa8bPJVjlbQTu/YtMg8K6JUECxAxhjrnBOk
         P2p9VICQoGZxTpVqsKUZr5913HDrt+n60LKFOmmurcxniwtF5Bz0TBgJhk1FJ3HeNPu/
         eMxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6umGb+48dX6GQ0pDVNubQmXWUYlIo8z7ODXScgFPHI9a64Vjxvel8XaGsLk8F5L6KOQ0kSqvq6ewe@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXXvDNG3UIfslSbabPNyPvabdWjHb7dos0LqtKQsETR1brm4i
	HLtkifd3VD2j+/E1HiPgTN7TozcTqqTm4ne4OAESp1rZOSP8L0Kv6YBsOZ5DQlrNTUE=
X-Gm-Gg: Acq92OFMS1SFiz209nDtGrdl+wQoO3DmU/li1PWMoB/G7H7YLWVm1eij+pNoTPvmGb2
	+CLQXRbppWTfC9co2FG0gE7MY55LtJKBMCGXvsnFn8pQjH9A+ohwREk0wrIOa87HeUdKVq7e/a6
	Ss3xno/PRJILTbYEO0xjtNKLjfAmFyXKVpP12LrN16TAYwbpbKbXwuVx+fy/75YX8Xik1kVzDZ8
	bdKeK8FxlP5qQRFQ8LdpXmgHMk+kUs5Fn7MSPa4BsPHHRCk5acjWYltPiJjjLThFho2KnJrGhbV
	Udx8J+m80Pgqq0N943d/3k+urNi5C6aKgw/nGvgJEyLqJaXO+/PIC9Ly7K+TmUeiKohcedKKxkc
	a4hKcnDypoUs8nwOrcOTmOBCmEVKEGm+gZJ5qDDhYHsp2uN8vCJtZLqWf7dEJ2lmJe5kinvIQZP
	4gyVjfqGk9m4oN5EazEWl8T3H+RgRK5U/DU4iwPEl7WRBQrLBZLXgcH0sRCwzviyCtnorpHglCg
	6yTp2MxCDWoHqtTPI2+vgECuE0r+WYq
X-Received: by 2002:a05:6512:3c98:b0:5a9:163a:9ebc with SMTP id 2adb3069b0e04-5aa0e612da4mr1402039e87.19.1778846406756;
        Fri, 15 May 2026 05:00:06 -0700 (PDT)
Received: from fedora (d-zg2-146.globalnet.hr. [213.149.37.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb015f9sm14679631fa.32.2026.05.15.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:00:06 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
X-Google-Original-From: Robert Marko <robimarko@gmail.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	horatiu.vultur@microchip.com,
	daniel.machon@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 2/3] nvmem: lan9662-otp: add support for LAN969x
Date: Fri, 15 May 2026 13:59:08 +0200
Message-ID: <20260515115954.701155-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115954.701155-1-robimarko@gmail.com>
References: <20260515115954.701155-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Horatiu Vultur <horatiu.vultur@microchip.com>

Microchip LAN969x provides OTP with the same control logic, only the size
differs as LAN969x has 16KB of OTP instead of 8KB like on LAN966x.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Rebase onto current next-20260508

 drivers/nvmem/Kconfig        |  2 +-
 drivers/nvmem/lan9662-otpc.c | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..78b648e14727 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -138,7 +138,7 @@ config NVMEM_JZ4780_EFUSE
 
 config NVMEM_LAN9662_OTPC
 	tristate "Microchip LAN9662 OTP controller support"
-	depends on SOC_LAN966 || COMPILE_TEST
+	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This driver enables the OTP controller available on Microchip LAN9662
diff --git a/drivers/nvmem/lan9662-otpc.c b/drivers/nvmem/lan9662-otpc.c
index 56fc19f092a7..62d1d6381bf8 100644
--- a/drivers/nvmem/lan9662-otpc.c
+++ b/drivers/nvmem/lan9662-otpc.c
@@ -27,7 +27,6 @@
 #define OTP_OTP_STATUS_OTP_CPUMPEN		BIT(1)
 #define OTP_OTP_STATUS_OTP_BUSY			BIT(0)
 
-#define OTP_MEM_SIZE 8192
 #define OTP_SLEEP_US 10
 #define OTP_TIMEOUT_US 500000
 
@@ -176,7 +175,6 @@ static struct nvmem_config otp_config = {
 	.word_size = 1,
 	.reg_read = lan9662_otp_read,
 	.reg_write = lan9662_otp_write,
-	.size = OTP_MEM_SIZE,
 };
 
 static int lan9662_otp_probe(struct platform_device *pdev)
@@ -196,6 +194,7 @@ static int lan9662_otp_probe(struct platform_device *pdev)
 
 	otp_config.priv = otp;
 	otp_config.dev = dev;
+	otp_config.size = (uintptr_t) device_get_match_data(dev);
 
 	nvmem = devm_nvmem_register(dev, &otp_config);
 
@@ -203,7 +202,14 @@ static int lan9662_otp_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lan9662_otp_match[] = {
-	{ .compatible = "microchip,lan9662-otpc", },
+	{
+		.compatible = "microchip,lan9662-otpc",
+		.data = (const void *) SZ_8K,
+	},
+	{
+		.compatible = "microchip,lan9691-otpc",
+		.data = (const void *) SZ_16K,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, lan9662_otp_match);
-- 
2.54.0

