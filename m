Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207388;
	b=2EPOgNQ4H1tjyG6/hfrmJyPuh2lS/hoF2C8EG6lX+Qe+bTnIQXkQddphTGaB2gSGDC5/
	 3J0tTkATNDigM8pBGDgqJjMkawgyOuCNKU1bX7kaOuoWMFWfLtDeUO6e14T5T/lNLi1b4
	 3wLRjbeSvKqrq819PdhsXsH+9GsSLTbfpGUiAbfOIyFn9iyAkzQaLqosMCZT6S2u4vkde
	 L/9FGiX4uhxo6GZ8Ljk4xPt6BMWsTJSYbNLqVvsSlH7vfhjscSLURlXSrbNQb+UPMLpls
	 8ylVauMcM9mF2QCxjFY3g6V2Tl2GkkqzIaRNypLYeT0BV7A6gV5Ttpf5ROksZn9RLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
	b=E0Id0y8WU99SrPRGtllx4+vl1ZbypxvrgfFedNMJHxboHsNa2X67S0ABaaCXebM1RGIK
	 oEHmiSgzHyYU7P9gFXxsWhTp0hRURT7E6D5z2sM64TCq/frKy6SyCBrCWkde+0adJm3xe
	 gdlvxs5snl2wZodWju1gIdzQBj1PYudN9fnc5X+ZnvuvmDceEbSmS0WxYRSHfC4HYOhdk
	 2pgcLYksYedgN6Hc9+HnCoACUySFkTgLxmhp513zhsgtuRyQWaKzXvO1lkmJpqiVxfKZB
	 /GD8eotQA7U9wrjvvUAb8kd4wQAxt5oRt31JvqyXoSeyrWQnPDAvVbwES3T7OL9/S6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P/7lGESJ";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04936606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04936606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P/7lGESJ
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a8cc11ac42so340808c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207387; x=1794812187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=P/7lGESJOqQUhT7h1s+3DPI+dJwI/tDsktQPQH7wk2e2rEfY5w36Cvbt/COY2lXp64
         XBLpKmEnv/uQlyKUuV2ECq1dIXavPMMnCcTTJZmca4iLfN31v9/8KkqwACdDZaz3w8dl
         Nq0WNRj69iZPafeNLy4kZDyyh43pMbMm8ziolGA3CIyCF2bkixMwDml1ioSbkUQ8s8fG
         uhBYa5sZJofc+SbmfV+4Wc/Xjn//k7ftrSTQoe00CgfercTPGs61XFkkOpJDOkGj3R/h
         xbDQjWPaU8XMearZY4td9zEycYH2BL9aKcXvKUjckYfIcqIoS6UZYB2LYE+nihO7t5+U
         T+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207387; x=1794812187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=h3TlFt0StyHcJ3fLuHfy9tGZJE0VwP9bkxKVwneqRjF/jqB31dQ1ZftmHm6DzfKlTj
         z9yjmtEQNqUv2ozmjhRkd8MPk7hU3l4w6q2aZZJy9NzFFuDMhsgq7SSwh1WoXLSzylSu
         63KJDFhDrN4f4xBNuhOB6hDz+o81MQ1bwwFyinJLDExIe9eXXOmOOj88r+kghXev55Zv
         OcFGS+DNm4EYrzXX3f/Kr2cjuAjkUZyNFWa+nhhrbI2m8yytrlODmJKzuZWn2U0TijbR
         iI0dbhnmUTcWTC1sjXYAVheZFjGDDwxDlH4gQ6ZcqQyENmgdT46RnrXV2SZ0p+Aejbg6
         Rxhw==
X-Forwarded-Encrypted: i=1; AL+hErFE3mjwWEWeQ1BWVkuQ3Y1VmkwePQXaeAyWmE66Md1JLJowl47quivpMf2TDKwW5CLwBtKd07aCysRg@vger.kernel.org
X-Gm-Message-State: APuU4Z/WTf9NN/cD7UbCwYYX99xMwR2fEstwSrFC5L32XyxO7eksdGA/
	tByARneJIWCjfEkZ8CubqvujSShYMcYGvDpD458067LGmCV441QaMSpV
X-Gm-Gg: AYBFou1NwrHuIXmaC/PmeLvIqBwgcf6wAqDfrHd5DKqi+IL04Axmr6MHALKv9eViDNb
	m+K+Dhe7/g+kkZpQqQ8PfIxK9YUHuZG8ueFdpDOAi8UkMI8IX5pkoApOsLM7Ctaj9oa9mkyB5Qk
	/MlmNBPI3pNsAFvhlUIZxZaQXl5MpMUjfbcjcN/J3Hwu4nAd0jmpLCbWpc2fM1PU96K7zqKRQDk
	OGbh8ROiHuF2DmBr5XCM5j9rvVD0oH4eBaCY5iO62MVSFSFNNwf0gu9O5eJg2N9L7Huvgdy6ie+
	5xtSJhW0yy6cvv6XpkJNfdH070ZCumy8N3adSq4TC9OnULNAaTjv55RtNTIYlwmPrECUltCirxP
	Ml1YhhSNKTstf9Exgdevry0oZFhiC61vCHt2Se2jdvqTRYgODS4o5TKfBIwBHoDIYp1wj7Xhh42
	qMZqX0iETovVDSQVePdtqxzSDz3EWLLdc2PRXWr60m9x0ewRSZqa3B407kv4zLVPWD7II/hViFM
	WJNNoqcloZZLFcWtKMzQxTYNOYaHSq3kzgNQAbYijzwowhtX0X7S4eTLeFxVYsXQlW/4RnHPfqF
	0TuthQRuo0getsa7TCp0uhBecj1qXUwZBQZAl1RY3sWZ/goG9GUpi3YQ+YitHy0j8BvpanKoaeU
	GpCzeB8oq9a2zrT87WA==
X-Received: by 2002:a05:7022:ec07:b0:1b2:557a:aa12 with SMTP id a92af1059eb24-1b39fe8762emr6494368c88.15.1794207387028;
        Sun, 08 Nov 2026 22:56:27 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:26 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v8 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Mon,  9 Nov 2026 14:56:05 +0800
Message-ID: <20261109065606.62641-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
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

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0

