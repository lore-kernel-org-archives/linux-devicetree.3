Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E06742D763
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301313; cv=none; b=IEGhfbzBZWdKujeeoijRFlJvNa3nwAP1GCCTxe2ETV8fvQs9rbioOudTkfHwIhM74kFK8RAq55hxBmNXqz1U8xmrW2DyQyHOesWK6+ePl+S3s6RiWI3sgJv+7zBk+9bpCjIoaQIWLuxTgGrcF+jGGciy6qxXmf4DMLva+y9pMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301313; c=relaxed/simple;
	bh=Wl8PbtVcbqcYg36RIsWzXPaNK7DI0KcYAEDi+vEV6Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXdNKkOwelU2SVJ9fhrmzFB4UoQSI0bO3WNpowRI2L+YlaeWZzMToiydicPkRNel5eI48Rby802/9ZkDQzRYV085Vm+e8OzU5cKA3UPUdjT3f+tY6Y8iFDvsgxNFKMSG6NQpnTr6wlCgf3Wcec1513WhrHHRivyU5j2GB1+MfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibxQn+F/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibxQn+F/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso12791150a12.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301310; x=1784906110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=ibxQn+F/SF6bbud4Sp4kB2lOdbjC3+Ca3wbWLDV8eJZVByhB7Lo+NJWHAjMVzQUX9v
         0wroFitqqA4Wp34uB35cuz9Aau2fe8oWbHktqOdUGSe3fY3BfHqy6rcUxG9JNqsDaAFz
         qIHZh41ZHCEdyWzeMZFhPADRhCWKSBYXZ7G/MKG7a+3+4IzR3DjdH9QFUypt2SLdx/jj
         DzDW28sR25qNroIWFzejLPtrHODzNvfBl0nUdEQ5zq4Qzco23Nri1QASwS2Fy8myYDlj
         DQaxr9XPLBOzJcud4BKlEMEurexyPln7fzKmmYqN0RwmECMaOpebb3tnWlvQkXEbc9cU
         9/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301310; x=1784906110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=dBAYInt19rnuDSubuSQLdKQq7lmlRy0P3twEGVFjVpvG2AZfQ0rKJ458tDUki1PP4B
         f6MW54RhH9ZNfslCLFzQtpVEef66GzGmjT/zKq8VFcX/n9ULjXkWAbGUak1cITuKlgI0
         Avi5aYVIzgK9eh5V+iJzvD7P9hQobukjwhW3yZIizIquk4NPTwVeobRu9Gr5EmSgbAYG
         3uVf1gipszmbLY8Ia0+6E43bdduCDGON0MNo4DpY6+Exhc83CYSkTLVjqHa/mQGSJwLs
         Sw/bEvgbeXOTYOd7ODyfCgbPiRtUvW30uBYk5BIoEdhi3jEqH5v8ir3sqIgt8BnoHh8D
         LRqg==
X-Forwarded-Encrypted: i=1; AHgh+RpLpQ7c9WHIE02tI+QHvVhXIkAZlpTaDbBbPDqlzCmJFNlZjj68q/kiyQsCCDQ6dQkK8F+Q1IhH4WfW@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+ogLfXvpW7aVvsO6YQsc09BvGjU65ldTJLqXF+b6ZapSqCf0
	1uAxC3RAYmJ98C305w1G0lcyqUCsP+AMeHikdzqgJWiTUxF68aMg31op
X-Gm-Gg: AfdE7cnakBkT61dtc7nnf7EzSQPWBS/JcS0G0NzwsSE+xS/e0bCP1gatDQprLH5J/bo
	VU1YyobIoC5+3AQcv+QMzEwcjNvpoQk3XV8JywyAedJYzrkVxU39nbfjKuErDaOB+qs3lUx7yvQ
	t0Adaer+CgYc3rjonl5x1hgHdY2vsjkp6iOjD5qILQqRox3bP+nBZXLlOyhZD0xE8jv4Keu4jFQ
	4FETT9uqcZJIjx7emoNbBiPUxQtVGhIpeXGzZ5uUxzH7gT+bcWPUzlPt2zgJH9dOmTtHrDnOPPm
	821ZR6AKN56i8P9bv5D0jtoEg4D/vU9vZiRjk08NFCrH9RZYLsI76fdpV9ZGIl3mVx0dSOUOau7
	GxsNyWIG74kShHHONnirwT4SpwxX+hBfMuPNSaspKKmxTVchmV2crHZOve5fSugqNOTm3Un5BbA
	==
X-Received: by 2002:a05:6402:528e:b0:69c:7406:9492 with SMTP id 4fb4d7f45d1cf-69e652e1111mr1154154a12.39.1784301310590;
        Fri, 17 Jul 2026 08:15:10 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:10 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Fri, 17 Jul 2026 17:11:12 +0200
Message-ID: <20260717151134.678839-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e61f6ae74327..10a3d4b5ee30 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
@@ -110,6 +111,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -503,6 +508,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0

