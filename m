Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA45E2E739A
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784991546; cv=none; b=RqQP9p99nXld+n3rKK+V4/z10dMuaxiR9LM3FTeYqEF2PiW3KN+5wGcrZtMDYjMBbgyS/MA8lsuhXdFDvYo+nr6J+dMhIAyAYGsdME733ZEAiuCbO1tnDUn+I/6jCL8JEnSLMwasxNVCrFRbzvL4tN00NkUQGVyBevzxSRL0J+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784991546; c=relaxed/simple;
	bh=BtqsvE/wgpRZr51N49eAjks9p/lKsVmFDtj8ZC2sh+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAbpo2pHMO60/Irr4pFY3GJc2dAjZqH+DNNiv/8cPOn7TI8st+y+DtrLVhYSXJHQ893TZhuFt7gcQasLjyHfSOUId78iEHoYuf/youcGSn054kbp4LE/aFb32xUXyPrIY1OuxVrwzb9DfwTt1Ki70Y3e7pJsSbdfSgxd0uG7TrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBq23vEr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBq23vEr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so8002365e9.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784991543; x=1785596343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40xErOTdJfX+m//AZE6fjm1QH7PFCUhAcYFlBcQFjeU=;
        b=SBq23vErx/JrnTeTwwQgX1JcZiJPBH3Xpl24ZOpLyNcC86fGMP3ZX/xSNKSa1/SJDu
         Cg0sV57uT07ZdO7M5nuIA0ypcDLiIpyR5uC1lqOY2U1xXocnzTXz7Yggpwrm4rQd+ZWD
         GHOAWJuOZX+MvZkCTSmiiymBbSeBu+L6vu37x4D/L+y0YPBkbEf9lwopvJogxbrlFO/f
         O+QYNkn/CJYBpbiIJSLFSUlUUGe3++LNTVRGB5hWAMZ5ezbNbSypmzaOOE1ttgBaxJnU
         NRmmjygrn2qgdUZCcZex1bUMwHof4PQUE5zQVb7Hz0X6a+qpnV52o5QO4Y4zTJng02/Z
         tSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784991543; x=1785596343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=40xErOTdJfX+m//AZE6fjm1QH7PFCUhAcYFlBcQFjeU=;
        b=riflu6o1mm9vMl4gc3YU4qqyDu+hfyDkrRz5oyvygS2gbg5LXTA0YP3K0Cy1GVTKhF
         CwYvi8C3QU+GXhLuXrv1pH1/OPxTYKzBcSAqO9gkQKb6W/fd3hHgkZMdO/+0B8xMRPZS
         a0bEEyswBmv2NVXmSIlsS8O6f2M7MW9C/KbcAp3axHWSvUvG9ks2BP1/wJMDz0FO08e/
         nYZNMFcgQX6x15l7cOWujC5eWu8S6yepnU9f8B5lPKlvMKT1RtUM0BnuIMjMOVTjfbya
         CXlag8hrEyaD3tO/55BkjWU6r8xgu34zTPz/sp/j/WrB+hcZ8lxVmf3VzSnVa51trjuG
         U5aQ==
X-Forwarded-Encrypted: i=1; AHgh+RpiHDkwtyXUZSOdo38dX8K6Gy4JnOBx5U/V7Yri+zzFVXtWMJlM3DhLVaxFeXmLTFf4AV03RbZ1fpWA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz00l3FiC/KWb1rHk4+juMU7KTDyeUAF109Un0Okk5L+oLV8d1/
	o7UtY41GjZJ6TZgwAzaTaVuM28TZBawscDLH5pphrfGyuRwNe74x4ASi
X-Gm-Gg: AR+sD10G3kEODhIsiycfHgxS55pThx5eeQ2oU72onXCfCtdPeEHsjYuE3A7O6NB3E2j
	Di5+0WzbKOjnvVrsfgqpGLUNiqP3zXn67AFVv93SlVixedLmiF9nfZeIBwI6SxqVdeIR1RiiUYV
	nkxq3pG4lpBqEwJR+0gm0mtjDrNMErZnxo38KUnRbKX9hNdubd2KNsIQ2wrHdndrgvE5W2N0HEj
	GLVzVErxq8yucril9Sx5mB2ErpjT+teHfPcreNK83IkHXRiTzeNz6YX3DPZqBhkm6ZGs7YfzdgR
	nqMaTb/L8/cXBSGlFAzVVYm4GD1o4tmPr6kJbym/fJLmBZn0wputlvSguIW4z3N2A0PRzaXbCa8
	fALqOsCnXtrIQy+/rJFY4MTJFB39CuoKBn2PTA2iVVThBMiYeOnKpyHSKdAbE6AJqfzoPRx/trw
	8nLw==
X-Received: by 2002:a05:600c:630d:b0:495:5dcc:52b4 with SMTP id 5b1f17b1804b1-496b56bbe6fmr33100545e9.3.1784991543121;
        Sat, 25 Jul 2026 07:59:03 -0700 (PDT)
Received: from antoniarch ([78.212.96.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm79704435e9.11.2026.07.25.07.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:59:02 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marex@denx.de,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 3/8] rtc: abx80x: properly handle shared IRQs
Date: Sat, 25 Jul 2026 16:57:13 +0200
Message-ID: <20260725145718.14733-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725145718.14733-1-apokusinski01@gmail.com>
References: <20260725145718.14733-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The abx80x RTC driver registers its interrupt handler with IRQF_SHARED,
but the handler always returned IRQ_HANDLED and cleared the status
register even when no interrupt source from the RTC was active.

This could cause the driver to claim interrupts belonging to other
devices sharing the same IRQ line and could also clear unrelated status
bits in the RTC status register.

Only handle the interrupt when the alarm or watchdog flags are set, and
clear only those interrupt status bits that were handled. Return
IRQ_NONE when the interrupt was not generated by the RTC.

Fixes: 718a820a303c ("rtc: abx80x: add alarm support")
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index ca3af91c2997..fd9e887bb9c5 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -261,25 +261,32 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	struct i2c_client *client = dev_id;
 	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	struct rtc_device *rtc = priv->rtc;
+	irqreturn_t handled = IRQ_NONE;
 	int status;
 
 	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
 	if (status < 0)
-		return IRQ_NONE;
+		return handled;
 
-	if (status & ABX8XX_STATUS_AF)
+	if (status & ABX8XX_STATUS_AF) {
 		rtc_update_irq(rtc, 1, RTC_AF | RTC_IRQF);
+		handled = IRQ_HANDLED;
+	}
 
 	/*
 	 * It is unclear if we'll get an interrupt before the external
 	 * reset kicks in.
 	 */
-	if (status & ABX8XX_STATUS_WDT)
+	if (status & ABX8XX_STATUS_WDT) {
 		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
+		handled = IRQ_HANDLED;
+	}
 
-	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
+	if (handled == IRQ_HANDLED)
+		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
+					  status & ~(ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT));
 
-	return IRQ_HANDLED;
+	return handled;
 }
 
 static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
-- 
2.55.0

