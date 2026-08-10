Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D4E441614
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390810; cv=none; b=X6lMhXczq8sk3NAeChkzYZGyJ2CaxUTSqCcsjLVWV6BmuSnAfiCZh6dSaPxfHq/kW/mb6baYwW53xr+3me398vI9sSIIJPmuIKLQuyBu6kChHEjp6MimiqKh9J640FYuqOocDgMSnZMQgTuQbkJ3QAG3Ew72e898yabbXNGFFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390810; c=relaxed/simple;
	bh=iymtdZbAVDC4szK+VL2vsDv4Um3gp/9GnkovC0TOf7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GV5X0K7hdPtAlly+Z/0wRVX5sPKCO55AsZn88Wo2LG6lCmAfWfCQYxTk4mS9qouwVMbF6LMAO0ueOLShPInbKJlb2jFvxeE83N3IGl64o0Mg6e3JrlpUKtfvN3MEORg2Inih+7IDHrS3qYDRaHmu88K5KNSEkZac3eRDkTXf8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEM3ErQZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEM3ErQZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4994c49f588so2241505e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390805; x=1786995605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Lv+zt/h7dKa8TuGsaFOLj9Yjn5OU7W3HW8p5oLwNPc=;
        b=FEM3ErQZv/iFI2wk3UMNOzwUqmp69J7Ox/rfTj46W83fpT8fRiJSr5CPXXVhOSWLWK
         DuF/CS3bm/ADH0rajbZcuexCYPDTwCWNo2iPU1FBav7fvUEtaZ1cwVC2LiTDeLdPnMFo
         Ar2k2r+WoH0W9nXjUBbscIenAzy7AmEwAxCTxBRgfI/G8OzIZQPYBydsLQz6M92RQEq5
         6ezcSYVsv0W1dk9GNBZgUK1za6DlT0gdZSmBn7L5rdP97u38q58KIDUvGLWTmylf/QGK
         WrXxHmIniK48Cmk90p+7A9uTP6MZdtJCwr3ZNYk0IBuq458QHBUM0JojxKEo7pj/2kOP
         gN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390805; x=1786995605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Lv+zt/h7dKa8TuGsaFOLj9Yjn5OU7W3HW8p5oLwNPc=;
        b=fayna4U2jsgd50XB5L81JDZ8sb5y0ei/4miK66YZCkMc2jWffY5O0MRqnRgIp1y/kw
         qXrF2EDU5NRqFac5bGXP+jYhWHdA23IsW8WjlCFaZdtiMP70D/9f+BYDiXyx1NtYy+2F
         uNUMj5mX9qyzaIGVoTYfEcD9ej28qTOHgIOw+T8UN/d2rVDhZXer93+tpdQmcf6JJWby
         67mbj35Qrgke88voJEP8U2uaaoZqsWS8FR7cPtLBHXpZJiRXBNkYxGVVl/eJowmASPtH
         UFBtaxXKDLg6L+A7P25gyLZQDJVf7RlKoiTp7ZpEiJ7pi9RgkfPtMbPstw8kaT5yFrER
         1v4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq+Oe7rwJiOVMVWOYpkde2gPBZdT2mhs1EbvwrE8xhGZ8BNqaTdLskE4X03UritAPZYNfVLaPQRrmg8@vger.kernel.org
X-Gm-Message-State: AOJu0YxMtV0svrZsO++d1xp+3HtJLT6UzzCT4GFipeeNJR6R44iRD6NU
	mLnWjHPxNzjkk6Z5PElUj0vgIO3ZJWJ/CboyFGRNmWHJUemqdQqflPxD
X-Gm-Gg: AR+sD12lKSVtJ3zRlITSe1lA2Px6vR/JcgBXMeGOcjWNSVqRCNhaCQ3uYLbpfeLUFND
	ETa0+vQ+BbS6z3x55uWVchIZaoOkYcrL5BzCLgyKd0L9Lw7E7dsxmbLUi84lBXyyN+DhGzDNQl8
	TR18feX/Ey1cEUdRimNLbEyPlSMTJxxBcG85YaYvINgnHxq3ZyvAfF6I0NaMuIfERCsou9tEs7a
	4pRVyVliQ4XD/YQJcyqXpssF55phofvKmtaGLhUuOSa/Je26bLuLEJmLOwf5NxJygsGUfyuMxCz
	yGTij0jL4pUR4bScEBE0Jg3xNh9554b6g/6UBoHbDxZwqrrVoNt46p486OO6UzsljDJl64Qxyb0
	5AJEANrCr8yRCPYv6ZF4W3zTdFOhJbGf3tTdiVdqQL/r7FqPRCvz6dANR8Mt+hYq0Wbnlv2efmp
	uHXTXwnVfJQ1PME96/YPM6/NOjIAajJO2IeAnPHUwpgxxClybyp17VDtM2Z39FJyYXH6i/mI8tk
	+s=
X-Received: by 2002:a05:600c:8287:b0:499:5f81:8ca1 with SMTP id 5b1f17b1804b1-49974667332mr8638055e9.6.1786390804533;
        Mon, 10 Aug 2026 12:40:04 -0700 (PDT)
Received: from antoniarch ([78.213.94.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm39291689f8f.14.2026.08.10.12.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:04 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 2/9] rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
Date: Mon, 10 Aug 2026 21:38:19 +0200
Message-ID: <20260810193826.210683-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810193826.210683-1-apokusinski01@gmail.com>
References: <20260810193826.210683-1-apokusinski01@gmail.com>
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
 drivers/rtc/rtc-abx80x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 5486d9d0b1e5..fdf9664ebb6f 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -294,7 +294,7 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
 					    sizeof(buf), buf);
-	if (err)
+	if (err < 0)
 		return err;
 
 	irq_mask = i2c_smbus_read_byte_data(client, ABX8XX_REG_IRQ);
-- 
2.55.0

