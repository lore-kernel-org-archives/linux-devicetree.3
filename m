Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FED64E1C7F
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592020; cv=none; b=nyarHGpso6DWseW6JBCiZUj11lMDNMlUo+FPnm1OX/BzALB5CX8Brv2Jh4HBVD5q6TWrJz6AoRaxHsjBOm3jIpr3GkHvjOMcOMTm32+iBfXoqxcxgbYVUrigv+3fFsNeX7j2mdr3B6zt6Z1O93vrj08OAtwkLGlrHfrJ9Xvk1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592020; c=relaxed/simple;
	bh=wLiYwM+a21eAKdI02nzoDqFbngX9L4TUdt0arxClA84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ueu48aDhxzqU3ukpj3fh8l8gmjw4BbcOy4jrPcWFnJg2wL+jy0xWJfmyCzTsYWe4lVlgkQHh1WhubVhQo6zdl31lG/J0+tKy6MnBjwNF7v795pb8THBJPyO5UYaUfoDur8dl1lOam3yy/UfaHMUC5W/QqAYdM/FTtoOkaE1x4p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNIH8132; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNIH8132"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso119954f8f.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592010; x=1790196810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8/pS3dA9RAh1ZIge2uQ9oYLHFPgMwkJbXpjt7KmlD8=;
        b=iNIH81326Q0t8HOiXH+0vL8q4DaJwaeIwZZ0qRLPYimjJy1jV8ln5iAu87wvLxZhGP
         6sbvssjMmYFe4BKz1hC6fmFtx4OpEX/NCzmtYsY+6dxMG7HYRBv3Ns7v8IW0TAIL6l9j
         1GNK6I6a+mQGBKsCHMami2ylXZe9fvc491zZh9dVGmyo0tGGODSQLL23PusCB3EhuwvQ
         zB1ZzarP9NC5Emn/HNYqSHEBXEQPYiekGmFJznjBX+f2bdF36PkYoovrHqXWhW96NCz/
         y1U+BHj1GN+Ri2mvEIYDWTvNj8G/lLj6O1ZPrdzpNdE/4gg8jWWIpS3L+0Ea2/28wKjB
         72Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592010; x=1790196810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8/pS3dA9RAh1ZIge2uQ9oYLHFPgMwkJbXpjt7KmlD8=;
        b=qOTR1HIWpm/3xX8lMo4zs70LSXSfDA87XEInV0JxQC0bUGu9/UCRKLOZ2U/rqabVbP
         4AXLMrq2r/zAiRTd+odkTjwWoKvsNqfX6Yuf9HIQzJnyC1dcn1UXmZvJ9U/hh9P9vkY3
         tvx7Pz5LeqFcRII+JpHfPxw2wm3anssUyxpXaGlqYHiqma5AY6a4vHjIaZBAqPYpAsfd
         Fk9hZFq6KxQ4BwBytGymQfFJAIW31HO1HnGIk/UZ0HEDgzxpDH/Azu+0n2EpT4i57vh1
         bQHAmaZ/pfhevc+T9KSSuB3PhyAWb4x6rokPxqW1q7s98e9lsECiWZzpFutQRxbt0RMt
         fLBg==
X-Forwarded-Encrypted: i=1; AKwUvBzARuWr29SiSWCWPrjk9AJYtZPJbe7wxruEloOHUyp3LXLy3Cp9gYk6Tp8/B8ViZnsVWhFCUMKs0Eid@vger.kernel.org
X-Gm-Message-State: AFuF++m3+zqZp4BC9nW3pwv0LwJLDRwjWcVBtpNBkv9AUbYjQrqy3i5V
	9EcbKrjTN5tTxuPtbrySyH0tnjWTxy2q6sCIPTdFuUjHZJ/DnPk2+mKu
X-Gm-Gg: AYBFou3Apt8jU3T/tietJHzGxLXGtW9oj8MLsJikvkb6r9M9hxRD/MA2H65Y4mEZ3qA
	0bCOttfjx87NI9bxdq6K9wBvM1KZ4MGlkb5E5nqFXPR1FPWUHN95IB09aA77msXu3NJcPFYoAE6
	ipw1mQghZEGAXLrWIa6kMUnz+YahXqHLMc8PlgPjmOErhlJ66z/zuhcTANwuKsjUwF7rMG6Wzae
	WxxTVXMkndfcoA68usKKCF51T1WQ1oDo2buIoj/mndizWYEvrB37HuPUFIYTbr8YCdOLpKj9AfW
	0FD3mJdcbSKBu7RIYviXXKcIOlczjLkOcPsZj4qO0/mElsfiQWPluHQxxbWBW17iGR9/3K5K/UX
	QrXJi/TCvn0QgEWCaJDq+lMMn3JjtHnTwqczxUzGMXmqM5+nzQvhgcRxnzD5jv30KAnPe20KyJY
	D58nisG2ZHeDKoZksYPEa7i3X7ykdsKIU3jiNFSK2m9Supf2xzbKxwldqPi8bcJFzu7JxUFA8z0
	DkQn15V
X-Received: by 2002:a05:6000:2c0f:b0:487:342:d148 with SMTP id ffacd0b85a97d-4870d04800emr5622202f8f.38.1789592010254;
        Wed, 16 Sep 2026 13:53:30 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:30 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v7 2/9] rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
Date: Wed, 16 Sep 2026 22:51:31 +0200
Message-ID: <20260916205138.16771-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916205138.16771-1-apokusinski01@gmail.com>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_smbus_read_i2c_block_data() returns the number of bytes read on
success and a negative error code on failure. The existing code treated
any non-zero return value as an error.

Fix the error handling by checking only for negative return values.

Fixes: 718a820a303c ("rtc: abx80x: add alarm support")
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 5486d9d0b1e5..e4fd7b5d4b11 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -294,8 +294,10 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
 					    sizeof(buf), buf);
-	if (err)
+	if (err < 0)
 		return err;
+	if (err < ARRAY_SIZE(buf))
+		return -EIO;
 
 	irq_mask = i2c_smbus_read_byte_data(client, ABX8XX_REG_IRQ);
 	if (irq_mask < 0)
@@ -311,7 +313,7 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 	t->enabled = !!(irq_mask & ABX8XX_IRQ_AIE);
 	t->pending = (buf[6] & ABX8XX_STATUS_AF) && t->enabled;
 
-	return err;
+	return 0;
 }
 
 static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
-- 
2.55.0

