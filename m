Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6EA52B1E4
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813248; cv=none; b=KDWrKHbRSQggxo3ZHrNgw256Qd7XNewGRnxUybXujSFiNbzXa21/XJcE72klQogTNDIWOnzKg/x9Fze8bedUL9J5OQ/wjzpqU5THfb34tMlM4NAePo5Q0Er1iNugRzN3o+Uf7hUqYIqLhcx++ugWRTYlHQQZ94LMZqv9cpuXTQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813248; c=relaxed/simple;
	bh=wLiYwM+a21eAKdI02nzoDqFbngX9L4TUdt0arxClA84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KNyzkC84ryNm+YXCwrKJxgeGvgR1aUmyuTY7nG9/DlSgj3epLeMp16W45J4JTaLZQQViV155vCF+171SdIkg5NEv+dzIpgDN44qIzIa5z7TtN3Wt5BQ52NBKc4lbnMydXct7qHuNTVsopU0AQz4HD/43NBvP7eJexGMdFZMOnME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZYJljz9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZYJljz9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4447257f8f.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813245; x=1789418045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8/pS3dA9RAh1ZIge2uQ9oYLHFPgMwkJbXpjt7KmlD8=;
        b=GZYJljz9Lalr9kwp4tkAOT0PWopOXh0Gci2bmvOskIloC4X01qBhW3/Z2dX+HMSqgB
         GU/1bnTk8I0ifa6YZS2LDky/XRcmNHdhiedIWzEQgn4jlkVSNcoGkI4I0JKkCmoJGKCQ
         3mAlU/kEp8NOc/0xMb5c6dS00jtKWtTRKkL7ANpjxaR/mepj/QMQSdE2Sx7//Q01hD57
         H+5Udsb65nH9W+E5+95LuO+jeG4+HWU6mqOnNOrPx9A5JMapu2FTZUGWzcwajvnDQOOr
         fReG8g8nxHuNLSowyGG/jdz9AKhRJMk/86ENxk+nOvNbp1jRwt25RjsrnwMeDgCu+vGK
         uDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813245; x=1789418045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8/pS3dA9RAh1ZIge2uQ9oYLHFPgMwkJbXpjt7KmlD8=;
        b=AUw1riRJgzWtNBKaS9U36ktICq81VXY5OlAIIDUBFJkfrLKqPhJ1FZ1/aVkSoSzbV3
         QGQxQumjnVJtRqBnuVFZnOYZVB9v4N5ykai5+KA8OTIWNi+XTCv/0b3bcB6qGohlelzZ
         R14Vj2+B94oYh7hAdyuOCj0XojLERJ83ib5mowZePob9TprxFiH2tR13cnKUeGt+4P63
         zbsNRwwPJhSWNEvQqxDGJM0pHqitIiQYulNbVTRUxpCiuVWSImILOiTI1NXFhkNXFj+K
         JiEinblxtfUS9K7Tz/I7ykzwHOeE6ylyjZtAuE/KxMifsM1wkSoFl/Dd90XX/CRrL5SM
         THyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM/L456n67CKhU2uaEzKU/M3HTVQzxBuMX8oC2jbjU/8BGsoTe2aw/0c8MlXGPEPOkrv92d2WKSlWe@vger.kernel.org
X-Gm-Message-State: AFuF++mWXK76NvYc1JiVZIUyeY2D/l7kYRJ86B2QVIhq0X+jm0Y0A1u8
	8jn/NiCDomFdGb6GN9gDvxD9/bnsOPjtIiixWvLY9LXT0N8klzP2+rFA
X-Gm-Gg: AYBFou07qCMmEDw0C2ByV7s6DuCb3Jyo2kp0v1hxgpknHxVkXgCQeabxcuVeceEX4bl
	spY+MEIdx6G4MPezrOKHMMcXhCsGyiXDOFLwDoqted+A/vtGJFkZUr3KBzDp2t4KMefZp3RMKK3
	woESYbL/Ddd3EFuTDi46zDPR5pC+wVpCRDD3FC1utLFn2xzJI8gn0H4PuEOEtbPrqiRGbwNXWQV
	vJ/dUAU7G4SlbtMtQLnqlg6ve2lEvpsuRMRGL7XRVKl8rDO8TicHHM1zn+wFPDNn6JfQbupb0zH
	S1jUZhD4YBVvEnpK2DnbZqDlnhYSd+elOit7z0EMdykTKvYf0CYNKvupOn09TsYMUU974zB8sTp
	N+miPsoDo2k6elZVSj6eP6aCRvXYY+E8O6s6g693v6R383961+m8gXButuE66+xI7x7N8cH0M1M
	tu9s+mLgN8y8zHvBL2TBYkfeOH4CHUVkNfKDr8Id4ySYPIIxLGwI16xpSqpNT7xA==
X-Received: by 2002:a05:6000:2c11:b0:485:8c16:a33a with SMTP id ffacd0b85a97d-4858c16a608mr23291913f8f.47.1788813244843;
        Mon, 07 Sep 2026 13:34:04 -0700 (PDT)
Received: from antoniarch ([78.212.37.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm25959116f8f.9.2026.09.07.13.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:04 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v6 2/9] rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
Date: Mon,  7 Sep 2026 22:32:09 +0200
Message-ID: <20260907203216.53192-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907203216.53192-1-apokusinski01@gmail.com>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
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

