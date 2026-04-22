Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42E223DE7
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873918; cv=none; b=ORSninokqgK7f76Ky5H3QJXuPim4ZvcD7+TATQHr4xvnXfR0sqJ/CW5HyYKGAiLycl7pTadmongcjDkzE8hy9OeyDZbHpnVVLiGTqlWI+c/2BzhWziTd84Lcb7NqkMIT/JQbLweMp/PKC4l4QRofSUyWR/9yzmvoCHAUejUJedk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873918; c=relaxed/simple;
	bh=VgOr825JFd85qpx9ZSe3P5UBh8fNbkiALkxKCmKvveY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oAzs361/cz5pIb29jBC02ppQ1FwTN0Mp3rymAK0grXXgLuERgVf6nUCqoy6wLbnK+/goF5hSnL5LIUG3BiyxhCvTWRA7cmTcmWlLXXfJV4Rcl2g5zjFMJrTiZHdgu3kO71urK5H2KktWAkYR1+G1/quNtDNe6t/qGCxAFfzu9k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4rbNoMF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4rbNoMF"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso3463520b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776873916; x=1777478716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r78Ht7d3rD0nKWuIXu8vxDpeZ4/LkBaXzBNsFb0PtOo=;
        b=U4rbNoMFQuAci9G8rVh8tGL7tiwcAwZh5UnmQHdJLpbKQr2/OSu6KSulDw1MA9q+OV
         1TRgxivxt9TELwvEbRkSD88MiH0891ykjZtgaJM17+Ttzxgw+nPHvE+cpYB1JX2SbOtv
         0zOFpXu6E6StIla6WPK/dmSiKuI3Cql5N4lK5NjsLWS1II0EhRT8Qasy5EFic9IDjj7Y
         ijv4H6C121lEUaDJ53EOw1Je86sDpOZEfqD6kNmAi2ZIB+e4eypTC2gV/AOj13liTgLq
         WeLqQeKE0TTit0+x5v/aJAGG0CZxh4HpqxIgCmiN5X3tG0L49BcEssOmH3FQyDsvDObZ
         w0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873916; x=1777478716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r78Ht7d3rD0nKWuIXu8vxDpeZ4/LkBaXzBNsFb0PtOo=;
        b=S7jwBxLWt3i5GfUuZvrI2zOPu62N8UGzZmahz7uQPwWqKQvLMGNqCBKCkBCcyKrFGL
         EiRJ8W+YfBkNLXqyGjFWKms/cgOJidhrPtLoLvptk7vVaBgz11P/KUda6IL6cOcFnN9C
         eAOHeQR4AiXquJZCiJg60l6JKEFkMXGiRUNS7o8DB55d/fOH7rXheqUYsj6f0zOY1qAK
         8sJgCPGCW2oRTVCq8Y4rD+Xg7a25YS+6jhaKxV9IAZQ/AtjApacEBdVCqGIok9+xOC6D
         GY2PU6R0p4pBFH4SC9FYeKI7lfTZQ0aOjcTWrIWhYjZQj8K6MEt2xUST+LbdSqrn811L
         CwZw==
X-Forwarded-Encrypted: i=1; AFNElJ/8g3hGF29sMHTMsBHWtRL0xjpG/EyK4DqlkjdderZNmLJlrsJ1LPn2pVoNHLqaB/iQA/q089bVz6Py@vger.kernel.org
X-Gm-Message-State: AOJu0YzN0b/A4UZUvvTVYEcTcAqaqIf5bvYFVBtpJq+cbmBko9kViplv
	jJd43BF+wXAJz/NR2cIwup3wpzxyXsLIEm520UJqQCXMFuMpDLOuWHEQ
X-Gm-Gg: AeBDiet8yBfLPzmxE1fg+Ab2PUUtsKil+I+rvPkdlsOhlZWGbQUfm+Y6k7FBJVwYHJO
	XQan9WATEMuRcuGP5tdci1F9uc7wQfFCKKjknA0NR6G9Mgh7jMtxzWK9TXaET1fnVw/sbId8XIT
	etfn2hLy68jyNIv0p+hqsN07PbLvQDRlM1kRnSmzqZ1U6TGFAv1kJaXAAvh1a+eMCobZcV1d4xS
	C4CAyq9M7GT1LJPiYBYDdZX7kvM9taz1jyX9CSW1AwAGqSasBSsolv/i63Q1VVYUd6fc9f5BzuP
	qMXwA6jLARMrD6p/9mP4Erbu01zJ3s4Ry3m7iLU7j5POXxqMEdvoL4gwveWrA4WXXgeHJ+zoNyo
	sRnUOxexRTGM5XXsxuXf3XixE+YVrJt7NZd5guCmbGJy9NaDwS5YZOJFLN/VsY1KWA8CGzJj2Zb
	d4EuM305EON9MYGOO+qTBvUin6B+v/DCtvRzEXds5bp+NAJRUAjuuJWk59T6H4Anlw
X-Received: by 2002:a05:6a00:3a20:b0:82f:50ef:3eab with SMTP id d2e1a72fcca58-82f8b54738emr19822095b3a.28.1776873915614;
        Wed, 22 Apr 2026 09:05:15 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec003dcsm18151031b3a.52.2026.04.22.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:05:15 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] gpio: 74x164: support 'registers-default' DT property for initial state
Date: Thu, 23 Apr 2026 01:05:04 +0900
Message-Id: <77cc91a966bfcbeaad825b8be607dbd7a85dbbdb.1776872453.git.happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1776872453.git.happycpu@gmail.com>
References: <cover.1776872453.git.happycpu@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

74HC595 and 74LVC594 chains retain their output state from the first
serial write onwards. Today the driver always kicks that first write
from a zero-initialised buffer, so every output comes up low until user
space issues a write. Boards that rely on the chain to drive signals
whose power-on state matters (active-low indicators, reset lines, etc.)
have no way to express the desired initial pattern via DT, and must
reinvent it from user space each time after probe.

Read the new optional 'registers-default' u8 array into chip->buffer
after the buffer's size becomes known (so __counted_by() is satisfied)
and before the first __gen_74x164_write_config(). Absence of the
property keeps the current zeroing behaviour; an invalid size is
rejected with dev_err_probe() so that dtbs_check violations surface
loudly at probe time.

The matching binding change documents the property's layout. The
corresponding U-Boot driver (drivers/gpio/74x164_gpio.c) has honoured
the same property for years, so the two bootstages can now agree on
the initial state without user-space involvement.

Signed-off-by: Chanhong Jung <happycpu@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index c226524ef..b433a4a61 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -134,6 +134,20 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 	chip->registers = nregs;
 
+	/*
+	 * Optionally seed the chain with a board-specified pattern so that
+	 * the outputs come up in a known state on the first SPI write. When
+	 * the property is absent, the buffer stays zeroed by devm_kzalloc()
+	 * and the existing behaviour is preserved.
+	 */
+	if (device_property_present(dev, "registers-default")) {
+		ret = device_property_read_u8_array(dev, "registers-default",
+						    chip->buffer, nregs);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Invalid 'registers-default'\n");
+	}
+
 	chip->gpiod_oe = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(chip->gpiod_oe))
 		return PTR_ERR(chip->gpiod_oe);
-- 
2.34.1

