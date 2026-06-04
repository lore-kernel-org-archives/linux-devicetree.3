Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEAD39184B
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558587; cv=none; b=cVRmJVYPTUsI0R+XMaQqgNiOV1WUw0Yldgy4mJnm1FFxRmvzdN9qlJEnrEEUWTIEW1a2hwNcq54qejJdu6yg+ElxtQ5+zdFQNz0aM9B5UYH/ieqzB9Br+usQF9bsIkeyBc2mAIc5fgi1Q7gLP6SnlFu1Hg5n5/sOh76RvH2BjJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558587; c=relaxed/simple;
	bh=3rYL9qOpVCsvIK8Kbi4sBzHi54F4ciTpK0z+WeThbFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwNwX0nMLuv0FP8NQHRNS8210MjS8xHHs66BOXACwar4BeqornYId9BlsZqH4fNjWuQtAsvKAANrUFyW2eicfkIhpSNfk1HVXrLX7iSu7uIpSsK+bXWJwt/rRBq0tHJGJhrbs56Hp20hoqM4kqxMF+u7+0c/EPbo3IjIpBsfQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkkPWIaa; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkkPWIaa"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso374923a91.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 00:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558585; x=1781163385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEtdXsuD5Nrz8FHS82McGmz9z9OmZzMDe1FxkZDAsP0=;
        b=mkkPWIaaw2wo+xPrT2btXWXZiVtG6JJ3rYg+iDIKB4186s0Wf6zW1q/ig3vCoQa9yy
         7svPoNtYnRjoJZ9n7hzNGP6aHJpKCg/hMGZiI8/aH3XKxxfUKI3OrYa12GjoSd+BaONA
         7uW4IJ/ttNI8QGbHWkxzEFGL+DRHWxnual2XVi/f6uS0UMbCDc9IW9GjlV1JEehja15V
         GMtDCUIIYBxG4E7WSLLVsr7BkzdbgJPLXWX8Hue2rYJtNoj0zd/rY4VZn3OhfsVWhUuD
         TEjMUA/zwD7DrqEU/oFj3p/33ijkJJRhbQjpxnPNgFWGW9iMH4WtoY+kNrE6RnLPgjpS
         Ny7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558585; x=1781163385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nEtdXsuD5Nrz8FHS82McGmz9z9OmZzMDe1FxkZDAsP0=;
        b=Mlf7AoHWmW2mBwxRatuLiHh/Fohwdxo0hU91lMqxpcTxIw8JIq2kV3S1MHZzvJMTmc
         x1Q8PFhzq5+qxipMQR52xaZ01yr9xQvCDkEsLZeSnWBqgFN12EFVt6ocGSgIvmd6Fw5e
         2DTezmLkK+EXxpdKXOl8Lqma6BtQVGm1CsSKkfU0fxaUHUxKgyybwLnNUtJ4HLcaLsqL
         xNTgNIhSvE1867u+23guC50zq3Nb1xeCFjU/ldi/gTYjXixlksrZy9wouY/E5uuib0DY
         sUzURi8SIuf//PcsS8g0X0BpmTryNqCKrHVE+u9PTzvq/phE3NnB7pD4V8PV3JbqWoLu
         0EAg==
X-Gm-Message-State: AOJu0YwdFyZ0XbyIjOYQv/ODgHcqQIqh3Qn+3eIZR0XR11KbfqHIumgq
	sWnFjv5mPW1u/OgTUUH8PlPfghMv7m+eqRrVa0G5t4a8z3+SSAMx0HkopNYPxHQpf6PcIA==
X-Gm-Gg: Acq92OHohDf7scRbnhbAx/BYKpIIE7aQc9SrpKss/XV1Hm566cH3CU7mVCrH7B5B8oJ
	RZtztXuDkXTYqp70C+JTktqW6k9EGfg5w5ehq9U8hTiS2d5ZFOKLoObGlB31O7XEsbBsQ4qDvm4
	vr1+Pn/MHlAFPsWgJSWBc1Ofxih1xKq5UgcFrhlK268jGbv0eyXqdSt7HSNvo2dI9QZjLa1JS7q
	DQJ0fTVfx+cs7nYjJYy4kmCg+cgPzVSc790KpdxnFGc9U5b0B0UCaTSFiGgLIN/y6Zzc84UHdpL
	nrGpDZERWc2Huu448V7Y2kq2G+llqwuplNcgeWvT3tqb0Y2odBvpmH9gbGYkbTGCEjvAbm4HUEc
	Em5HJuxJlkC0J0/tSrj+s00brKk47PCKd+JpFW/V+W8MSK/9JTkeKjLZzVEIy24P35NTbsWpTTw
	UqPk8ISiuvcEjnFWnStKxNUFzlk49nRjuO+clCaWxNrMhvUb7y4MI00uLfOw==
X-Received: by 2002:a17:90b:4ac7:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-36e32b3baefmr6361065a91.11.1780558585552;
        Thu, 04 Jun 2026 00:36:25 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8521sm2063074a91.15.2026.06.04.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:36:25 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH 2/2] of: reserved_mem: add config to extend dynamic reserved memory regions
Date: Thu,  4 Jun 2026 15:36:11 +0800
Message-ID: <20260604073611.3954433-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604073611.3954433-1-chenwandun1@gmail.com>
References: <20260604073611.3954433-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Nowadays, the dynamic reserved memory regions is 64 by default, If
the count of reserved memory regions defined in DTS bigger than 64,
only 64 reserved memory can be handled properly.

So add a config to configure the actual dynamic reserved memory
regions count instead of modify the code.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/Kconfig           | 11 +++++++++++
 drivers/of/of_private.h      |  2 +-
 drivers/of/of_reserved_mem.c |  2 +-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 50697cc3b07e..d6496ec3765c 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -99,6 +99,17 @@ config OF_IRQ
 config OF_RESERVED_MEM
 	def_bool OF_EARLY_FLATTREE
 
+config OF_RESERVED_MEM_DYNAMIC_REGIONS
+	int "Maximum count of the dynamic reserved memory regions"
+	depends on OF_RESERVED_MEM
+	default 64
+	range 1 256
+	help
+	  Allows to define proper dynamic reserved memory regions number
+	  according to DTS configuration.
+
+	  If unsure, leave the default value "64".
+
 config OF_RESOLVE
 	bool
 
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..6ad00798f39d 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -9,7 +9,7 @@
  */
 
 #define FDT_ALIGN_SIZE 8
-#define MAX_RESERVED_REGIONS    64
+#define MAX_RESERVED_REGIONS	CONFIG_OF_RESERVED_MEM_DYNAMIC_REGIONS
 
 /**
  * struct alias_prop - Alias property in 'aliases' node
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 27dc98aa9bf9..d1680fc4fb38 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -348,7 +348,7 @@ int __init fdt_scan_reserved_mem(void)
 			count++;
 
 		if (dynamic_nodes_cnt >= MAX_RESERVED_REGIONS) {
-			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d)\n",
+			pr_err_once("Reserved memory: reached MAX_RESERVED_REGIONS(%d), try expanding CONFIG_OF_RESERVED_MEM_DYNAMIC_REGIONS.\n",
 				    MAX_RESERVED_REGIONS);
 			continue;
 		}
-- 
2.43.0

