Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC7D43441E
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620460; cv=none; b=QgsktPdpMYtYK3hQuXd6dlAgmYW3Yc0rNlDSC01IbqvrKS30+bE3Q7Luk7Us10GWj01AIIY/tXPArqKk2iZeDpWprAygIeyw9fqZMzf2BKKIf5oluHK774QgtSwmBXhP1BC8b2p28uB5396N/kS5eO7kOLPG8f73AMxY8An/P6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620460; c=relaxed/simple;
	bh=v6GPocRuAdYXxfW5GCiY7PkoQqyVIhzeyfAlaB/90Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ConAskHiaZL4fM2+qHaIhoSdE++jGkKpGaFxzuysmQUcpZz1T+mTPp7fGavPU/xeokex7Wk9Or1/5MTOdGObzB2C7kD1pNjCZBZBUpgk+0DGCMRe1njHwhG2QkYtXCeuBI+DnRxlHTISilFvZU6qpsPnvonC9YdCTO6usoR8oFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QD/LPHKO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QD/LPHKO"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38511175ad3so8969613a91.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620459; x=1785225259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=QD/LPHKOGNi2+XaBdLMGVgrUjfGg41mV5vzf5LDIL0lxu/nj+B8IiK4L7jv2Q6jqLy
         idSCOH5tFaGoXd08tPcjpA3XsK4McqhItPoWhaeqM1mmHcB5NQlTWcipQ/c0X87htmTr
         0wS2zOACOf6tn4IXzjpPw/leCVAUW5QjfVkws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620459; x=1785225259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=Libris+TBGXbRkA7QegSbqHwk7pZ52fri6F8X5o+dJdlsdusGE0fk89cwG8wp/9aRD
         v7Y0ngYfuvrmne32LdEDvfRr2GuXQJLq1q6NXD73ZYKcKfgFmS6lMcBCmEf66jkbcNBp
         xKrZAtc16mTOIoqD3P6ajo27ydwRtNYsk5Xr9Hw/R8FfI2yDImUl0PPoWK8eTKf0AglB
         eCgfYOWbnwte1X4FV9Jxha8/n6+c+dqva1svrxxwcS0keAqLGaJWmJwBxJuFrwXjEl1w
         IvyiCGG27l5VOcScnB2lWOwQA38Pk1w/Ozi0ceCi+J4yGT18phbvWbr0zjkpAPct/azx
         VwLw==
X-Forwarded-Encrypted: i=1; AHgh+Rrhb5vymb0TLXY2rRviz2AgH8ssMAt4DLOISEXGZX37Is4boO4pk+hRaWcWSuyizx2KIfvTTDdAVXne@vger.kernel.org
X-Gm-Message-State: AOJu0YzdEV8IuXUjDciUe4XL3PIaBxU6K8ZcWdJYyeV7PsXuX1aRrVMw
	kBtNbXlh3OWT1ScjuPJFkKhbDO6mAOKtmgrYMwn0ERadGrNx6hRhhWg8aaODMpNT8w==
X-Gm-Gg: AR+sD11ygT4OTRCNX6Nsods9uF5QDAPAcs+lJ2JE6zkMHkQKMLDsd8vQ5YE4yVy0bpr
	Jgeh85MFbC3vTvFfTpRzFSI6wlgSmYPVH5955SDw3seWNEGrEkDxnh7EJSc8c2SiYYPIjWm/HHQ
	So5izUw57NhMOUtC9kp8ZbeTVa1uMbKNAaPE17r/8IhhP1R7b2A4aZa/bdxt9ddzDhvdp67Up6N
	a0QRxn4FsEWl0GNetyvmMLoTLPTYQqXJQXX7bRjNZlOzoDU4GUhQ1j9L1UXWuh8pdXP1smudTZ1
	QiXF23dMuSnXiU6654OKgNdjUEUT3GmWVcVy51IcEcXXgwxEy6mYDAoH1SPHtrpyLnbF+Xdmn5H
	F9WCugEs+ZiEpho0kh3XzcWn/baFkU9Yhcp8QFYGu9R3O/zp4yy9Wxpgi2HCqda9apoEa0CIcvl
	Pp0knujHN2tiSQFar9zmBtgyMakH+Iv7G9VNf66Da0KtLnCfUlmho4TFAF8pg=
X-Received: by 2002:a17:903:1ae7:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2cf34895672mr185287855ad.8.1784620458954;
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 21 Jul 2026 15:52:19 +0800
Message-ID: <20260721075226.2347933-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog

