Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE931B131
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224990; cv=none; b=XXQJxjPt6sSiTBDk1o41ecfSRIiwxx43/f7tUH/8JczlY+l1vuXl4ptMHhVaGvdcDc+OQNQX8LrjY0a1qFQLBaqZ8ib8V4O9lDr6SThPRJmLZNf5VxBoueqljWruAQXrFVcsRO1ZVclPRKy1RswzZ30vt8LakZjrS0UUZmYy79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224990; c=relaxed/simple;
	bh=7il5GDO7kTOW6jqS+Mumwj/X/fmS8K5D/UJr7JfEaE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opCkV/IsrwMF7oOWA/o64vqs57n9Zx1+OE15zon6zvfdydTEYp9Xb39or2aSQw4tTikASW/jdFQyz0h67bzEtnkhMXfRtvQRdh6hUx/5aggB9577TjQFNjj0aaXNZ68WpE3z2bDUxM1mLFxw7UTRloyMv/ID5XPOvNPnn8d76tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ZwId7PxD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ZwId7PxD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49249072f03so18160845e9.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224987; x=1782829787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVmu3f7j9ByFGe5OedcL6Pz7umApHSUq7F28TFt4Y78=;
        b=ZwId7PxDBkxuNGrZ1/XmPSt0HpIgtIOpc+93qFaFP870b2yn2rArgvwabnZuQhXYzU
         bcIYYrJpGenfRawIPFfcyRku/JtfjlRoei/2AAEvjKngotAJZfCHn0mAhytA49Wj9PZA
         +4mz5fwvxMxckLhg8gicfhhxxAPDg0D72IOEwCfJmIj9t/Bx3tcSmR/jI16yHDVtsl7v
         DVHJvPLV5oXEHdcZBR2YXedeeaEEapkKLaDuRUbcf2T2ayR8xx1XmJCEbYpaw2uGCnkR
         nGON55TYWMSFBagRz/yptFCfbJ1JyeDnDL7WdnLomNklw0a5Smp6mDu2EDLUd4lqEf5P
         kPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224987; x=1782829787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVmu3f7j9ByFGe5OedcL6Pz7umApHSUq7F28TFt4Y78=;
        b=Ff+Q+40furQulbXUnMwzX2xySz9n8+kPjG2e1cKBkjTwL5aqaDFNvl3A0Jk7waJut7
         3omUy1hkXoJLuEUKfsFRlXCPpvourr3hmUDXLr7Xl3jW01uixZL1ioNAGnx5IrOZyfQL
         Zd/M819Pc8CCQuxlDSaoTp38quqRaHbW7e1dUo0XIn7qf6Yf39qvRtLk2EVcYs/ysBsk
         jGqMAaeTAp6zmi38+tlmLAszmUF57rsaWuEy6guNmxVYmxpIC4hOdvpLV+aY7PUuPWzO
         2sgbMMc4hg6sb1E26zEw/H5vIjsMN4yt+Iw7x4uesRK/yFQqJUvyAqm777/pgQ+LUTKP
         Tu1w==
X-Forwarded-Encrypted: i=1; AFNElJ9Df6X7pDUAow6jnDEaild4j+LnIcXbD+N3uE3jo+dS58Zo08Ffah/HgYuqj45mAPGDZh3gjkCKNsPR@vger.kernel.org
X-Gm-Message-State: AOJu0YyRD27725hOK5VVRl6gcffFujPYlIgrw9H5lhPr6GqUKRid9/cz
	KKK2B1XDB/946rcwo4ESA5TogLW2YG3bG160OvCEY3sPV9BXRVeY/4fBBlBMV7a4f5w=
X-Gm-Gg: AfdE7cnkL70UPXZ/oNip0ZvJIdkg+TF/qqu9sPJSHXodR5mb+K4g8DdhvV8xTmjoRof
	4o9kkOvCNr0uG98/nJQBh3JmqCMrL3aCkkUaZuDoBDC6lSy9+LvkmNq9r7+SYngZR22AiPtuNOp
	+JhKCJ1LTpkdwuzJvezGJE1NP+CRCDg3n3nW0JPt4z8wNHjqp6bzTyLLcocKEJpTEDeAxPvG6t7
	ib1T4rNh710mT21RWd+wanCVHZiqkEw15welRcY6zMNJlWnJF2KIZSL4nsoYrGHKKu2Wcr5OQQV
	xOdeVoHOBv2v9UgscsyHrIhatV3BcfBynB5fzYAsbU/+QQv30hbo514p34G1D0jDsubnbcxA/no
	LIJ5/N3pEiPXcMto4IGP+Iffv2dnPl8Dcczy4/R70VUm/M0ps7guujrFQ3HZSKatIxy9Oqu/tn7
	9xk7lXI3TQQz52FNRTAy4wWbIPqYzYkY/blaTrNawItEYv7+ag16DBd7Jh2tPkALqaxrxAJ2MZl
	618B9XaMEYLxv/P5yamkN+aN6G1
X-Received: by 2002:a05:600c:8b18:b0:492:46c2:f5b9 with SMTP id 5b1f17b1804b1-4925b389c2dmr48178725e9.3.1782224987165;
        Tue, 23 Jun 2026 07:29:47 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:46 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 3/7] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
Date: Tue, 23 Jun 2026 14:25:41 +0000
Message-ID: <56c378923566ea0be831f58fd7c2f186ab3f5cba.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Makes the driver compatible with the ast2600-vuart.
This enables specific configuration for the AST2600.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);
-- 
2.54.0

