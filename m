Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CABE3DD865
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327163; cv=none; b=CGo0XV+q7krZuMWvru5c/tpE+Koab9liI34XNwTD8GhxvezqNvdgbc0WXofQl4/v1DHB/dMV0uUkGIxCOyciq0vSXu/1ZYGaAsTj4YnUCTV6nlR9vbZRmx4fGRquCCVs7bVypAuzuMurI5BX2kGaKJz/zOcZwzOALyjAdJbO0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327163; c=relaxed/simple;
	bh=x5K4xFRFiQMCHrQaFBke2R9ygwO72RPNpHJKJvM5Ef4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geNOpSTZyuM32eheFExWbD7nIq//81XLE0givPeKDR57EWXBYwR/KQWaPRGi/9iQ3IvCvgLxsBu6RtjKqvkYRzYEX06AWR5NaeFn5j/XE4nSI8naKvaiYyoZiX3V0/ClS05zXxVj3tGQXhSfjUNjolu7HE4mwhnkHGheVlFK03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=li2x1C4P; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="li2x1C4P"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef4223be7so1758869f8f.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327148; x=1780931948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1p24QeWuEOdkZHaL1V7uOjlrxK/vJ1VAKn0KvK7P92s=;
        b=li2x1C4PiZsuigqBQgmGPTakdR5fFV/3WLVzPcpYVZL0X2xEi3lq6jjWq3+Q3M/IXr
         TTP7uawhaRSjKjbM8dUWLmlb4yohmVNpvKZQTpaFlkWfZEelDbjdJ889AMRWxE8qvUCT
         oxMYi69LCvHXYT1VM0MnARsd8KMYysw5y03KBEqL20D4mYbzSXKfOBr0+gFqg6ClMtiZ
         KNrU3KI9U8zQhcBvKkNkyoFAE7HZ0YeljoE96sV1UEmTk075TIt3UJ+0GYausJlaFDT0
         YwxrwQFSnyHWhL33LdSAlI7TmHVST9XlMXOkieaO6s0q11zD+zTfF0M9Da5VohrOsnJJ
         biTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327148; x=1780931948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1p24QeWuEOdkZHaL1V7uOjlrxK/vJ1VAKn0KvK7P92s=;
        b=nUEKMDpK6B0z+UiGiKlSOPKu4sF5k1gKCrsIPIFo9usygd0xWscUTlbZIv7tYLodwi
         wUaEsfLO9655mcWvj7Q9kz9XLHPCCrA//SVYM+1nogYsBlfKLd0mIiDJtsOYFoDnFfon
         1d16zXCHn43s0Hw0aKwIib4xi/1OZHw5pMibgP2SicB4hPoIRt17C95n6J8rY2J23kOQ
         CrAJiluU1LiaUis7Wn3GZSSEQ125+fnJ8M+YtWSp/HugIffGaL6ZFMOM9S+vd5lBzFW7
         9xxI9PqlJrSg3LzTwkEU2gPED4Cf5vCn9Q/3qRgrCsIBuCmWBEFJLggh8dix2a0mlyaK
         ++ig==
X-Forwarded-Encrypted: i=1; AFNElJ9SI1FAxuWLUiJEg1WSH6OWY6qPBrJmmINdtR525/UgZGxgkeqidZCzSIvZLT1+AOEeNP89Shd6P/PW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3AOThfy7Ap0ZNDOMmDBrGckDf1OCcF2rPKebOraCfo6xPmfwX
	cAFt28rDU4AqG6tTUpJUjdB24jwlXFzefKGJOAm6kPN4H0L+gewl6oQl
X-Gm-Gg: Acq92OHo5zV6BuKLgohNjrmahg95nJVUP5KFehYvRE1/B+vgTWJqGOO9DGgtQ7Wzalu
	h3HNc7MIJlkjhMa4k1E0Sinqr6+VjcDmx6xR5n+EvqOZ3oNeKBw6IMqx8zamPoGvjpwpEEHqwNF
	3m5dSQOcdafr9hCrDnYRyp8J2ncfQWxKY6OkiTJF0vrnEwPvBQcQqDLdIllXy7JIK3qsLv1h4PH
	5lkbSOboD8GA/Qt/Ds1zKfSIpV42Wo9VbHeKk/3pKlkMLvHAlYJqj6jOLR5u9Qod1d+QO+pBmqG
	SEC5IM2Xj3xBQFzU7p6LGJg9UT9NYO23NJiqAOPHnvUc/5o2vrFNxajftciltTJTCAWprdLnLYy
	y/HgobGsZgYFWcFbDr9FhQuZX9hDz6fmvCWbviz8+7hX/m0vLVcyeK2t5nMNnMdQormYqfFmJKi
	vpBmvkD54gEbA/IMhfJ+S0gOo=
X-Received: by 2002:a5d:5cd1:0:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-45ef6b791f1mr16538591f8f.35.1780327148356;
        Mon, 01 Jun 2026 08:19:08 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 07/11] mfd: lm3533: Set DMA mask
Date: Mon,  1 Jun 2026 18:18:27 +0300
Message-ID: <20260601151831.76350-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Missing coherent_dma_mask assigning triggers the following warning in
dmesg:

[    3.287872] platform lm3533-backlight.0: DMA mask not set

Since this warning might be elevated to an error in the future, set
coherent_dma_mask to zero because both the core and cells do not utilize
DMA.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 4dca5641b774..b597d338d6f7 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -491,6 +491,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 				   LM3533_BOOST_FREQ_MAX);
 	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;
 
+	/* LM3533 and child devices do not use DMA */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.51.0

