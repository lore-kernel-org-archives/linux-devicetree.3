Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6919443AA3
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450844; cv=none; b=pSGZSF4pGNgiYkiRtcEFBvoWYJGuk102sOam/o/3WYUjWjq72P+oElznVif40zE43uwE/slW2AcJ9iUeOgs/qTSvHOayMcpZB3lUCtvUnEjpcUyAG8HF48bxiCXN2+fvkD8u+c7JoK1MEOTJr9Cmi6CdDYClmnUi4NrcLQl9Gwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450844; c=relaxed/simple;
	bh=FmJ253mDx04B3QJ1bIl+tfh8HdALdb4bRYDxE/DUlnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEsTwcJnxLWMdKQgth1DDoDVpSPaBqq3Fbda94UrgpgcYwhvPmXA+VmX2HkCHShG6723jN2vE5iKOSE4kZVaWSYvt3j6JxyOUbtEljNWv/l6N0SDPgMAHKx3gM83NTawX21TthbGHaXeiiCQ8+VRemV27J9Z15e09gIjztVfLtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Az5P1T6S; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Az5P1T6S"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8486672f03cso2855391b3a.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450842; x=1787055642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=Az5P1T6SPNsGLtkJZ4qiKSiRDN0IqSJ4Fr5WPSXhPTDbrZM+6P7BcyMJujMcLWt9bw
         8eZJDQepy4D8n3HN4E6X1z6Uk6HiPTkvbrNxIRjtB/DcMOuHcFufRUYi+G5U36EY/m2N
         VYoeHpTPPvwqpKm60d2GWfdJeUHq5hkVHoQ4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450842; x=1787055642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=YTwt5WPuNz8QqzHlhJ5//yCSu4727rUNX+89zzbpRGYsBTdSREyoXYF0rtAWQfFrpY
         Fc0J1TbtwfljAC0rlUReR7U1gtq1JX9Pr/xw8/ZIRN+ZYrTzgGGqDcy144PGXAppXuKh
         MP5o5WwRoKW5SFxEw/82ZEtDCC3KldW6tQQGZqV7uhFMzQNSL3YF04upDjo+VTIczaZK
         +6OXRlI9xltLCMwiZVgrC2bbs0an7KUgdqz31lB1AxuDszGfYl0EfEeBnPPzHA9W7Ua/
         Mib7Y0bvXta45OsuyBnx7UkLNY4q96lUu38I01VAFpegCnmjgA24cQBQAwtrtSSdwwKo
         hR8A==
X-Forwarded-Encrypted: i=1; AHgh+RoquiXqiYHT1Ny7ULRkr8iLTE3Hde8CTnDivd4IRi2qTe6xQ4wylm5bM0GVbRqFBwJAdPlXxyNZHB//@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ4A9P0ERIwy0SP75v/pvwot/blGMIWX8PXSxv3B45KhhW8Lp8
	LRMfPqWxlGSO2b3PzXgjTpdgS/rEmzPvpMWvHp2IBLGio7DQb4SPze8glf4tSOo8cw==
X-Gm-Gg: AR+sD13qtrH+34oN4dx0xjFkAZT6w4DEZWBQznR0RMMWOqgVwxCXJvgvCdhldHDJ57q
	nIQK3MahT5YQ90DjsncQJA7bgBX3kT5zcMScWPt7JixxKhTKPFWFrmkqkYsUHL9/nwPvZU6c50I
	DPCoV75hHh3ex5Do9lb/3oH1L+rFnovt+TehRqmciitWGKsRpWfZb0wFKMiTQhKdaTEr6K6TYjh
	m7VPoqq29lxkqkYezFAmxcK9c3Lx1nlFKarBLoSX0ueHp+RqEcmyTxqTnI5UeEzfkEBhyN5Mapz
	jXj8cV5ss5HFfoecK6LzAxkQNrWvdfl4SdJXbTQQZ5YcFoWIZakCiBirFuKuiAylWBSlKdHGESJ
	Z095IBK9Vu78X69G2jGmv7tfpnP9Ve/1B4TB5DeDAjIxMczUM7E9FkLZLb0oMcnEaENgs1g5jmX
	2AZhiinzV8rjxqxMwAXTW1g+v/dEtQ6NEciiSBv8W1bq+nP3+xXvxb4/E4FYinh4NS7c7fdC3eD
	gw20vQbnpscsJtwt0oMv1BoSFiIAFvxqEr59V82kUZ65w==
X-Received: by 2002:a05:6a00:23d2:b0:845:c906:5ff5 with SMTP id d2e1a72fcca58-84fa8842ea1mr2725202b3a.30.1786450842194;
        Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Date: Tue, 11 Aug 2026 20:20:02 +0800
Message-ID: <20260811122011.3539250-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the include statements before adding new ones in the next change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/input/mouse/elan_i2c_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f93dd545d66b..9f024a435dbf 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -16,27 +16,27 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/string_choices.h>
-#include <linux/input.h>
-#include <linux/uaccess.h>
 #include <linux/jiffies.h>
-#include <linux/completion.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string_choices.h>
+#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
 #include "elan_i2c.h"
-- 
2.55.0.679.g6767b8d81c-goog

