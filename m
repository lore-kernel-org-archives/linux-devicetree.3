Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4991C391512
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289640; cv=none; b=FOenQivFsq79cWCxTQI+OEZoQyAnBT5pNe8GNjd6EGOcTU+QpUMEfT7kDN+yODo+8tVo88Z3cD3f6t041KjEDTgV2gbK1uZDmICqj+80AHYwZMqnk35JZONS4X6EwFMmhfdpD2pNjYXOUvzv0vZUICT9E6rl2nMrYQuYPbSRR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289640; c=relaxed/simple;
	bh=envbLuQDbQDDEWH3XcYF5G304K0mIQCtaASdr8Op0dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFwotctg4YG4k7bEXxqdEPGAv7u9A1qcee7oWNXg7k+0KQtR1O/CgwBQwDWX8kjgWIde2HqA7efRRBzGzOMMpF38ACNrQ2Y9kANHg/X7atWRO4fSaLjfzklzEz7FZkg0LibhSSQCZC8qOhHAZsDQ8k4VOArFdLI9Kdm8byTHGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCXOjZ9i; arc=none smtp.client-ip=74.125.225.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCXOjZ9i"
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-482dd2e92ebso484507f8f.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289637; x=1789894437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDLkgYBNbtyZoarKCnkrYArqCb7j8Bh77/axESvjCE0=;
        b=DCXOjZ9ijXzDxYixge4RPYSgc5mABw3Rhal/7gdgkFzXagRkIFnJYpX+XZ0oHll947
         qrAdVpZZnHr7uN4i9XAFs2QZD9cngEabnU17kkJ6bg5525r1wi3yu/C+Ip85kc6lM22F
         7p1kpyeursYavGWlsnOOxUSfO4NbNzbnJkmybAp62i2FxZ+5rLb9Rsq+2T/uQpWzG3ac
         ltQHeo8C6dp8zVz12mVhSDPC8CQpgSyG0fQhzrUTgx/w75rD7KjCnfWTL48Hs6X/YcYA
         zg6pQzx5QMFuiCdFKVaQZj3mZYJvC3ZBupO1/i0YnOttp4rWdfUElQXTeCDgNYA3iyEz
         oyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289637; x=1789894437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDLkgYBNbtyZoarKCnkrYArqCb7j8Bh77/axESvjCE0=;
        b=QNvIB0+k8CT+KgBNR/Pug7/27NUlCYJwb+sOMi6DQIlKShTaEw7WPBXouZjXIRs/+e
         Xf1Fkj6tbpsofsmzN1sZ9nOI04OUjVUkeLaHGPLE4zygasCIKaJ/ou//cvE4C50OnDM9
         QjuVzYehKfO5sPFlfsXdIjkKzEuF5Xo2XlJS5GO8XbtGUWl7n7VcYkGU6zpRP6nD7E4i
         cds5B7fF8vi4zW0jjjyj11K9N5GiRapb4YOSdA1O1hdJKiK2rLROW4SB59fMLVkzlopE
         nq+gXU187eGZZ5fAjtntoY4PYOG3BCvOaqNwMidMZsfBzhVapxAd9aNPLe6x5USBzLpQ
         XzTw==
X-Forwarded-Encrypted: i=1; AKwUvBxGBFeKMLf/fu0bxJukKAW3RIAgdkDNZKR/5p5FyZvMe/CKUWj8Fl6jMipqCgvCFKwmeOZxJYzYho3k@vger.kernel.org
X-Gm-Message-State: AFuF++lB0a6x0eAHI+VlMbW251iVh9IjE5Cz/dIiwD+SJKP9EZ2FvCCD
	mgy29nPah1PZdtpKikJ30HN4ZYQ1YKlHm/OUgT2qJ8omoMbvY6VlIL/j
X-Gm-Gg: AYBFou3PwgIVKjK0sshIaSg2WSqYj7oqSpjuAryFEA9mGVzXRdP2rt8dgDM5DREyY70
	fnnldtUKVcfEcUb1gKEJKUrAb0pkzVYxHgsTxngH4uugBETfRP8cm8xKhsaieO2KtuRHbXbbZmn
	nAiSbKC5U/Y98aurdEfx0eQchHFix9EU0FLI7hE1VkUnhkXxSPo/fC8rJLKSHUydvAcDAkl4LmR
	gXvnYqxR+L/Yrhe8bfxDTWr03UJOG6mbvMc2cxNRGAhcR/RA5YGo9R86rX1RDWmaAqZpBbjuvWu
	wSUF2AzAuAgJsOc2grf+xietWEBYCMaYLhCay7vHMMB1Bx8GgAHClpzgQTl3C5ygq/rkv0VHlEx
	azQcIzyqPnL7fo3dPPR7+te0ggkuiePlez3p3JWZyfN1W/BeThO9rM6NIVuvjnKMiz/V3Iee8jQ
	a79KIFWZW/L+zat8XbdAnSToj+Wr60yiTaUYIgTdFTTqLZyH498qBon56ovG7EINqQ2QI2tH7Mm
	SzttyMjxJOdXCczDOA=
X-Received: by 2002:a5d:6f17:0:b0:486:fcc8:aaf with SMTP id ffacd0b85a97d-486fcc80b06mr1476198f8f.26.1789289637449;
        Sun, 13 Sep 2026 01:53:57 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:57 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 2/6] iio: accel: adis16201: add OF device ID table
Date: Sun, 13 Sep 2026 13:53:03 +0500
Message-ID: <20260913085307.13846-3-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of_device_id table for adis16201 and register it with
MODULE_DEVICE_TABLE() to enable device tree based matching.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/adis16201.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 1e76a3560..2ce5c409b 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -288,6 +288,13 @@ static int adis16201_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id adis16201_of_match[] = {
+	{ .compatible = "adi,adis16201" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, adis16201_of_match);
+
 static const struct spi_device_id adis16201_ids[] = {
 	{ .name = "adis16201", 0 },
 	{ },
@@ -298,6 +305,7 @@ MODULE_DEVICE_TABLE(spi, adis16201_ids);
 static struct spi_driver adis16201_driver = {
 	.driver = {
 		.name = "adis16201",
+		.of_match_table = adis16201_of_match,
 	},
 	.probe = adis16201_probe,
 	.id_table = adis16201_ids,
-- 
2.43.0

