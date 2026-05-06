Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6833ADBA
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096060; cv=none; b=cQzTh7e4HUyajjkuK7TF5ia0DGBu9bas2WY9wdbVmzB9dh5jBIBJhf7Hh5IlMvY6yQnKz0hDZygL3aqbukfnlbfHJX1PfcMJ3LxbHpkt6W8y5wgK2MY/Jha6NaW5VzVmb+Ao9me11sLS1faKHZxM2OFU0V2dvt2tknKGgmQT3PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096060; c=relaxed/simple;
	bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvYEBKUwVRlnQ+uVnFEtmIfjQ0wZpFFV66mtUwah2eHIDxC5siogOCoN2t2pKzpfyoQSG4+NNvd1u1ol0cd+FfUlc/eNeUOYLcUPAKPgH+ARceGw7ChlS3ChXiVQGEmL/qkIiloJ5f7rqlB6xp+1b0pfjcqdaS4Afyd0DURlNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvXIWN0H; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvXIWN0H"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7645adbdso54217f8f.1
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 12:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096051; x=1778700851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=BvXIWN0Hp7tcLVz2GNZ2iWw71AB9ju+Hkwm/Ysa1HW05LIcDNUtMnAhfp25GDljgeE
         isvweMyg4P/aBEQo74H10z2T2qxXr0O6E/+xNti5X7pr9zCX/8Xef4mKMcb8d0EulVOb
         i25U+16K+5rSbDxKCRAHZh8nk1JtHoFLhEFvzO+kBLAzQHWH4LB6mHbdqIrjQOxhJkvo
         2AMvIpgFSTHIKTE8CRGbzBL2ol+WdgD5c3FvK2QNTPDch3zjTWwDBOWK/MimPsCrqk/W
         aazJ4oHFGB/Z5OwRmjemabRVty/DhLR83ak/6yD08RY3eJw7l5hhTsdTP/UwI8EvXPPc
         mQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096051; x=1778700851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=eCh8i3L8iAXZxFMgde+iQzy/QytQfU7i5EHvpP5WYypXPDQHF39eFYdtndy/C7hii9
         ItAVTW0+1hX8duXddH6xDXqi52BSPMoIFNE/10aK1Qlp6Xo7LTs7wwDVeQeOYGXb4bdj
         rkfehNp7cCNYs+Bems7CIguwHNXwpPe9vw546GMDpjn2zjlkVlpFcezxgNaYJs0oSbxU
         6OuTAAoclWHzL7jEy+QzsEDot9ElHdZ1FlxCuxRMBOSaYT1/oLBk9Op93/RbTscIeQ4b
         ppJSycjqrMZz8YRiiQiuPeDUmHm2VzN+p64UBonVtXh56lAXWT2Xipdg9TwnkqSM+R6u
         Y2Tw==
X-Forwarded-Encrypted: i=1; AFNElJ8PnFHOC/FZMxBYXDdzK3TGhFjW/bHNbQDdorsDwsfeEHTniZ5WRu761yqwQk0+z++8p7sPRHkXKum0@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1PQef3Qkv6tsQdljQ8xeh2zzKGJcw0+Dw5H61YMCDmmBCO2f
	rW16VQaN70XYCJqbE89N971AcZ1xl2Mb0IKieJ8juteYCAoV2azbUh49
X-Gm-Gg: AeBDieucIDKSiFlVf9PHFKXBo1PqflRWXk2aYO2Aat5xqdJ42DGNgrzfE6s2PuxVpEE
	aq8uHO/bfNGS3oUDyEawGuTfOXEZH+82dMQiPQOHgWwGkebmhrcGEdsqlUxXH5oNnBqOFsf77wC
	n1hfD3MmFu3LoxohqHkUQwvMRFUfMkOwNmcTXKzNlK1gqFqWc+3M/skk8xSXrEg4Wg1ed4zAaaq
	x9ulY33OuAhV4aT2GYaXlg7Qsx7o/Na/rh9xj5EuLOWk87VP4chJbAoslCv4Gfz+2iRXVCWl3nq
	YKw8ZB1k9vQmai6Kqu8jjOGKQNTlq93b7Bo9fi2pFQwrXzZANDm+jElp9OThrVAx5fa3kXii91U
	/gIbGamKd3oAs5YYCe+ojwtu61YJaW/teo48FCkscfR9FOQR/gOQGvzWJAPBaH8kbMk0xh1kDDI
	qi1vclo7KJ7tbyGt/HxJRdijMP8iKwGb2CAyFgGGq+ciA=
X-Received: by 2002:a5d:670f:0:b0:452:75ca:3fab with SMTP id ffacd0b85a97d-45275ca3fe3mr1840819f8f.38.1778096050623;
        Wed, 06 May 2026 12:34:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:21 +0300
Subject: [PATCH v8 4/6] amba/serial: amba-pl011: Bring back zx29 UART
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-4-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWEF9Smqy9/+ZqLj+fvYU3rR6MQcKz77DkM
 QtvC+gIXhWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIx/A/+Jj3LBH9tnjU1WCvDlmvuDKP60pwv77H
 9cpKC5X8jU9Rk6vURr6BpE8J21cX+UHaMCaKC/Cf+xiQjWpQDugt4fK44PCsOUg6F7a7+jGOWY8
 LL8LpnoGzjHW1NVmdbkeIqLE5Z7NBnnIsVb/f1Rm+I/Tw0MN30e9KM5Xfdi4iXUdyMh3pLKzLY3
 +USPgYvQz6P341ijtBwuMeYsMccIDefew83LipWaF+qR59w2l/s5dZcZHpWddYo80R+tS5HSACY
 MDD5qa//5HcW+9N3ya2Syb+bqG6LBe7ydReM1FxRWUPxBmcSSOQSUaBncNAGvKdQmGqfk9EQCrV
 sveBZA+Gm42mHgoXEghXSHEtf7qtxmr6rIiim6j/+MvLnoruinWXl1ift6t+tNM+wzcbRVXN9QY
 xxflUe2qn0gUmUOAYSRP5Dp3hnWvMs1BGlVRZ+rRaqDrxGI3MX2KBKDiIjhZR9Mi+j+IdTXdJYe
 dWE2CP3QhYQ23VqOhadxflZUQTwJi7pdOndO6VpPcW4uMJ0uxIp8RprT04JnghBw8juuFGjogmf
 qFdCVa2SkLAjHfVIzqLJwt4vQpVMbX3bKKVTOEv4m+UEZUB105F8UckcQ94A4XmVy4NU42WvjmF
 cGzwd9WYmlmtk1x1/KjQgxjaMnfuCad5XpV0o/9care4lwus9wwc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes since v4:
Use ZTE's JEDEC ID instead of 0xfe for the DT-Provided AMBA ID.
---
 drivers/tty/serial/amba-pl011.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..f24cc403d9e0 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,16 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		/* This is an invented ID. The actual hardware that contains
+		 * these ZTE UARTs (zx29 boards) has no AMBA PIDs stored. ZTE
+		 * JEDEC ID (ignoring banks) and the "011" part number as used
+		 * by ARM.
+		 */
+		.id	= 0x0008c011,
+		.mask	= 0x000fffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 

-- 
2.53.0

