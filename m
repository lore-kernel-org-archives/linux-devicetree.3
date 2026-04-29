Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A003890E7
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434704; cv=none; b=avqUpbIxyr/IcubekOq05yWjzWUXvLXxa4Zs1fkgfWHVQ+EbsI8mnuGZr2GJrEDuxSwFp8J+pKZ1SeZYY/Fl8C/W7imv/Lyv/SzfNfPYYqHnLXXuCe1MLlHy4UT1r10N3i816FV65X44W6iiiyxCiJTZlaLYtpiomNQRvF4uM1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434704; c=relaxed/simple;
	bh=8ZTEWpljO0UJ4t5lvQukdUtvqSV7WB3UYomQlWmFqCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GCQUxKZF7Xz0yYyb6h/SeoULCj2dpgU6dCw3KgXU0nx+bkSxan8EhrS5hLZOdjNYj4b8iMGAixOqhxmjMLEGByeBZXw8FW8Xntb9ekWSNRwIJRshDKnuy7/duMjR1PD8v4lA1/+0mzNBAWSW3IL7tnAfsUQsmDVUAE8fDmPVxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mkcd4255; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mkcd4255"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f351ca23cso6227864b3a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434702; x=1778039502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJRe07kUVUgqjg/ti8//IJVD4xo2eVRTabM2wx2IjhE=;
        b=Mkcd4255Nezp7I6VHDgWlkeZndr7xVbo42+7xJyvUcjyQ9FTXuCQUEmRsq5ZBBhR3+
         Tx1+QesUqmYnhfKigrzINV3559Igkt7vsZiTAaQeOlzDTnbFtM0FK8qw0yI8+A8dt6BK
         YhWyRBFRGoLXLFfGJh4wGYWb3pRou+rCjKpVDtZuny6LyjXP57qocYNoSAaAvdBfcdeD
         AjfRGMtgR9Cpqnh9CXx4EMCkY7j4q3kRcyuvrXjzrSsFFnFUHyS0mRKSyM+cmZfDaBsa
         usHYHENHKptKNSDKAFstWdTkkUOck/yF+avm8oSFE43u9QxA0VjcE21dNweYJXpDWsTs
         XmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434702; x=1778039502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJRe07kUVUgqjg/ti8//IJVD4xo2eVRTabM2wx2IjhE=;
        b=ca4QyPyjXyC3xbdbRW99LnktvvNwLlDWBEbETlqq+C/j83WsqF5cXryFApaoWvq/TS
         BvVWKM2IqD6LA/XsKgdz0mHPE9M7tHiOFjai/Pj8b39PLlDM1xspi3BnTpvrA5kaYXAy
         eXfqCJNctE6S6br8k3QwmzIYAS0YkAY1z2SRlq/WNuL2XpSjiKwANAWqTiTYhqqDlite
         K60uaxpiyFyzgzIRvD+3FpJL1d9lOrVZRiNn2FE4RuQdVH9ySi33To2PRrbskDcLMOLb
         lZn41MG+H8wKy32W3jiAnMZTY9ybSnOIkPg5CKTvllCi7/V9iyaTU2T5ujdBmly3s49C
         WpsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S7dY73eg2La0C0gYKbiYCD4/siNWx/RxWuGxc6nn1lg+g3kwvghBc1pkOljl0Fr3qcgyssbMXPSVV@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6ooBNYamsM0erLRZ3p1oRAkzcd0aMf10+pQ8qUVRYiej7gew
	kdXfCoJnlRbOG8TpcmlzItHABwsIgudlwquyHp72EI4phiCR39lzlQ4b
X-Gm-Gg: AeBDies85kmEeAi9ejwTW3aCzuxK50CpsaU58Rlvun5gqUcf8IpOxdnSUUzqsyHAhZ4
	DDbWx46ZUi47df+oUVEloc4p75VWBdnrmkiAm1xzNeOedkHH8U+T4jJiI3NZ88ZvWwwhVKFjswo
	A50U+vQVgevjtxoU/JlKu3jr1kfTUSqywy27TyWoApKvrfEpQHTc1OUQv1Md7mr9rBI83ViHXqH
	/SxwtQHxYvvibhYIKaJT/rKim2+JTF+UsicRqGyk9OWfoJUyGY0+mZlzph+LFhTA++EzSIwUbGk
	EKLbO3xOKaLDRO/tKTtEphMYqgUpTE3Q1FxxmoG95emsYEF1vTQAIuLC1Wocb4KV2ySygB85U0G
	TEGf7jp6nv9nwvCXYAjog8GxIBO747aklJh4l2U/4vuHQctSiFg6acSV5ZqfCQhYlg6dTpQVDvM
	PDAzXQ0j3WqnTMVQ/sExYHh+2U43eKx13jMKmDZWo4GR5M3l8uJCw2R0CHvEq6YZ9n
X-Received: by 2002:a05:6a00:3486:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-834dd91736fmr6337129b3a.0.1777434702416;
        Tue, 28 Apr 2026 20:51:42 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5f30ddsm502899b3a.26.2026.04.28.20.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:51:42 -0700 (PDT)
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
Subject: [PATCH v2 2/2] gpio: 74x164: support lines-initial-states for boot-time output state
Date: Wed, 29 Apr 2026 12:51:34 +0900
Message-Id: <20260429035134.1023330-3-happycpu@gmail.com>
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
have no way to express the desired initial pattern via DT.

Read the optional lines-initial-states bitmask, recently documented for
this binding, into chip->buffer before the first
__gen_74x164_write_config() so the chain comes up in a known state on
the very first SPI transaction. Bit N maps to GPIO line N (matching the
nxp,pcf8575 convention); on this output-only device, bit=0 drives the
line low and bit=1 drives it high. Property absence keeps the existing
zeroing behaviour intact.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Chanhong Jung <happycpu@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index c226524ef..5ca61cf52 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -112,7 +112,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
 	struct gen_74x164_chip *chip;
-	u32 nregs;
+	u32 nregs, init_state;
 	int ret;
 
 	/*
@@ -134,6 +134,21 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 	chip->registers = nregs;
 
+	/*
+	 * Optionally seed the chain with a board-specified pattern so the
+	 * outputs come up in a known state on the first SPI write. The
+	 * property follows the nxp,pcf8575 convention where bit N maps to
+	 * GPIO line N. On this output-only device, bit=0 drives the line
+	 * low and bit=1 drives it high. The bitmask covers up to 32 lines;
+	 * any further outputs come up zeroed by devm_kzalloc().
+	 */
+	if (!device_property_read_u32(dev, "lines-initial-states", &init_state)) {
+		unsigned int i;
+
+		for (i = 0; i < min(nregs, 4U); i++)
+			chip->buffer[nregs - 1 - i] = (init_state >> (i * 8)) & 0xff;
+	}
+
 	chip->gpiod_oe = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(chip->gpiod_oe))
 		return PTR_ERR(chip->gpiod_oe);
-- 
2.34.1

