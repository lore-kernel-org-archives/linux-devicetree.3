Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939C3D5C10
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499905; cv=none; b=K8V9/zEXXmqA4MKFM+rKMxQvNKglw2BZHNS0KE5do4ws5cRkPibEBUY8qSJ9NfNP8HLRuBPhVMDPokOyopGcWiVWyM14To+7yuSn8Dl1j8nNzDYzslJfuUqzwCuI5TNSaHk/+riHgttSXfLZFUnQ3ZoXtPys0ETxPNYmrVi9xIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499905; c=relaxed/simple;
	bh=TAehl5camM5V5ntpuj3J1s48beGroMOf0MzV4UmomAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOKhR0IqMGRXv1jARauK6+IfpEkA7lHZyl/9Mn/VzQ4qHoCoxwN01uJh0EMMjHrSvb1PUI0P1PprYO/gvtF0BMLrY68SmdtMf2HGEF0Go1fnTmBdOlK5iOF9gaDERLa/mhxpy99FDfskwL+46xMAyDmIpec2sgsCm6EzA7jnvY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=P6ZVJFgc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="P6ZVJFgc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b903567fdso6089349a91.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1780499900; x=1781104700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PSK+IOLu3pjEuzuFyxuhvtdL0wKMWbMiHMGffEw5CU=;
        b=P6ZVJFgck8mDq05JOVgc66wSdz5CBBOXWfDBvIwxwv+gq7MDBQmzmxmmbcybV5yEMC
         VQPSJGh86GgveJNa7pHJECgOXRV+VMIWQFqr3wnZRcnDvEuMw+c4yYaUEBKWBiRVVRsp
         OTj1rkHlKELtKNDXMBAlx9eWQXo06+9ICywqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499900; x=1781104700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PSK+IOLu3pjEuzuFyxuhvtdL0wKMWbMiHMGffEw5CU=;
        b=lnRt0JoOjn5V0m+3R0QHNPH3HF3XkCB9q+MLA9Ysi4iWLdPSh1oOIupV1X5TGS2urT
         8+eap91laVgQp9UvGm6g4Gp5HD1+62UN/fXPHtZeP/FQRJrRjF8RGTDONqvYBTx20qtD
         L1v/9ImdB8G5a58KUFE92e6aX/GxcCVxxOY4eXnWaq04VTMQP2Mv6YgzSl9jS7167YeG
         yKKyAIYcRH6tOd90omTU3UxC5RmWsYz9BMv5Ovgt0wfSv7SRbRl2gFJ023eHjlzEWPG6
         /slZtclLoWxdDwtvti7/kTHW1O190B1y7C2cfsYfh7qZ8ps9lraLg3lGTH0xV556ybfr
         19HA==
X-Gm-Message-State: AOJu0YxR7v695MXVcWff5cE+wxJDdpjJHYedw5xweBMwD3idQkt2nC0v
	RQBcMglgYOD7M+hQjIEghkpGgeQMcTi3kfmc4reHddF0XE0q6gJbQBjHPVgEZcuyWEaBDd0X7h4
	qV44n
X-Gm-Gg: Acq92OGQPDOFj6U8GQ5xPpJB7bF9ALVA8qIyY5hni0k48ECQOgnb1oex5l+VIZ3JA3P
	0RpoyxXyyZEPF/p5Zgg85HKkTKWUQpdIC0vdt7wvgW/Y8p4Fs0siXPY3+oAXTBzydgsn3vz0ayj
	6RBxjcp1bY2OOeGNpWyTLy99bdflLWlAHimUkaV2mHCAae6eKHsbvV09qsQWeitpzIudimZ9UEj
	S7F2jpXlLh7phBn98fRpBrxQhRlyyx1EfTH8/3ktU5Zfj3BtB0dsqD8jB/RjhwMKhgevVj/0aqo
	OtMBl9StIn35Fr0A/2ppigrJWmY9Jm3Dp/DxTcLRDFSb+KsOU+6Sn7aysy7BG608Yt0gUx046zY
	bzAfy09ci9uvoRtFHLBm8Rjjv72bbsClxjt0BTbs6E/bDdtEdahBiUx96qH5ShIywYpH/aeU6Hc
	znCOPrr44stG0S7Hcrm0XVYMv05ycsdWOJToZZ2Fiwm45n5HP6XUFIyUwYqSW8zAHeqvVFS3CSH
	NjsJcatlzIOC5cp/+fHh0odAsurw/2eSg==
X-Received: by 2002:a05:6a20:938e:b0:3af:6704:18ca with SMTP id adf61e73a8af0-3b4978d5202mr4087030637.35.1780499900526;
        Wed, 03 Jun 2026 08:18:20 -0700 (PDT)
Received: from kinako.work.home.arpa (p1909097-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.129.9.97])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c85df0a624fsm2593229a12.18.2026.06.03.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:18:19 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] drivers/of: fdt: Make ibm,phandle logic only happen on pseries
Date: Thu,  4 Jun 2026 00:18:09 +0900
Message-ID: <20260603151809.3256280-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ibm,phandle" thing only seems to be needed on pseries
machines but everyone gets it so they get a string and a little
bit of useless code.

In __of_attach_node() the pseries specific part uses
IS_ENABLED(CONFIG_PPC_PSERIES) so do that here too.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 82f7327c59ea..2260a7c0c494 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -145,7 +145,7 @@ static void populate_properties(const void *blob,
 		 * used in pSeries dynamic device tree
 		 * stuff
 		 */
-		if (!strcmp(pname, "ibm,phandle"))
+		if (IS_ENABLED(CONFIG_PPC_PSERIES) && !strcmp(pname, "ibm,phandle"))
 			np->phandle = be32_to_cpup(val);
 
 		pp->name   = (char *)pname;
-- 
2.53.0

