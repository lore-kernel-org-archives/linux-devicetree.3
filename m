Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09236404D
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284062; cv=none; b=Lx+2M0q/HBpSbsgms2mEmcXulc8LRppbRciyfl/ST6XOtQPJOvp/dwGFoK8PuPJnhJbsgb4sR8eOYaOi5PE80l1yN/y4srhZAud+fy2sw+nIGzbRiwFXAiZHQUW9AyQyschlvgxueCxte1jUu3JwQ1FBeMoSzqJJ9mFPF3P+Y3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284062; c=relaxed/simple;
	bh=V20CQxaKCMFh3UO3l2woC5YK6IhwIJ+mPrci8jkaja4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBFe7Aea34nbD91oxOyijCOrIG/jM4wkiBvBFWGynoTcVU1lKsN4roNVhz8drrP4EwGWVzgh56Dx1T1dF8SzSl1t5CvAtQc21/ni02pO0OD1iJZdfyARIApSsEPddRc8bbSg7ne7KI9lILH/gJJAtjTNEIMGtAerFCrzw+e1e2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJG/56Ar; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJG/56Ar"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-439a8366831so2028457fac.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284060; x=1779888860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk3iqdN+UkfzfR0h+0cGZ9R4uYD5TaU9pbTe8/5a41c=;
        b=MJG/56Ark1rf9sUPEG2IP6qmDZmbcEN9H6RWc6FpRkemxwD7L6rJ2ePhCCfTBe61rX
         dWwR2T/+Eg+tCOB7ZhbKP14Bueh3lThBLCdsvSx1NE0BPaiynOdA5YfwjguG7Pgm+gvO
         syILnX5jgUZKl6zWj23g6xhOa4c+7Uhjgv6yZkMvGP1nc8JxgbdlWClVX0ZWsnkA8JOe
         gwh5nZZ6SJSUwWk/1V1K0V5OLvaWqGkp9K7jK7KhnRkpOOUAlEVIrV87COsIRp/fPQfJ
         WPW5sKup2pP8Y+54lhqXhYplvirJekwUoctPxRJs/1UI+N7grczzrF5nCgY1RFsQdtO9
         FVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284060; x=1779888860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vk3iqdN+UkfzfR0h+0cGZ9R4uYD5TaU9pbTe8/5a41c=;
        b=QUoeP5lFsQdVonAZRT3GMCS7KJ35ckGBROIA1uo7dbQBv9NYiLFCp90kovNtrWNUQn
         AK9FGlAf1hVaYjkRnFyG1Pvm60/XKJx80367kJ5Lf09NCtRRWtIpI0hCt/9CpcINQCWT
         SpsQTbplaJnyAf1T+AFwE4r7C6Xvb1rOBAFzTP6Fe4F11tYYmIgyH7OWZXcC51FjaDA8
         c9Ey7EgNPhmr38nxgx0ty8MhGYGKxL+4dmVOvgLUsrQdmNBS2CmY2DhZH0xYMlt/rEcB
         naIk9S4xLQeHq9M/kyMre9GfIxkqW1H4B40VA4FgWw6fVqYd6zmuEJbquTcvEemZY9ij
         hRRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8A2mW52f2jMKSActV5Nig3Z36oECbMAehtuhvpqhMyMx0YFHvL5PbE5iFm0OghyJ6nwY3hFHfIXEyp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32UpQAu+S5w7WmwG4Azjx8IVfPhJxERenQjIzZ6SfeNHm3EDK
	Fh5xpe0AKc0qzWD+9s9V0/ZSTAJ9p4++VNEPexeF6W8pnrSU1b5blpkR
X-Gm-Gg: Acq92OGErhl280ICvPEpH6cpG6X23Uq+gfr8Wjf/zLeOU112jx4PftK5q0eo+f6yrK+
	zoVWOdUn9RkrMEoDozC5xYDxQx9ttdLhkgbJfwtDOU2EsEX0Ucggy8MU7XJzbqxZuwnAvTrQeAi
	dEdv2GiHnXMNJRwVEWISLhA5wwWeyu+la1OISqWwU7nNBabD0TPCZMIl9Xgx2fm30SMrbC2vGc2
	JXbX3olq2cEokXco01Okc3LU/oR4GT3NUMBQwcGepDBHcZv/EAWNxHUqYUUmJFeV51NsnMlzS4D
	JHVwtjCDQB1aZQRnG8dQCU8SbLe4CiwFfZgwBIQUAQKpoleecuLlbGAJlsCUt9dgTjltgoyglNP
	dcZLSTmPvbCftSuRLEGNyH/DJUoCwljviyLn+AbmbNIFGoCBURhidmA/YJ9RG6pbGaLDqK9mDEh
	ZqxBPPBytZkc4d540cFTHsLnnEkZKOuz4haq/9PLA=
X-Received: by 2002:a05:6870:e86:b0:430:b7d:f248 with SMTP id 586e51a60fabf-43a2dd7c363mr15635339fac.24.1779284059756;
        Wed, 20 May 2026 06:34:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:19 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v6 5/6] leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
Date: Wed, 20 May 2026 21:33:42 +0800
Message-ID: <20260520133343.1423946-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index b5207ad6ae96..5678c2273bbd 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -491,6 +491,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.54.0

