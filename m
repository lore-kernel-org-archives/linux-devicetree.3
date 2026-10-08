Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7273B71DC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439610; cv=none; b=tWArTa/ID0H3Brpojk9lOkqZuw3JIsujAO6r/x3Q689WCNhvfrRQ+IUG6zR/IoncdTOzuc/j6FRxDyj7YDx/qwrnJokAna0V/kcPo27zhZCIWVmalgnqXjWWk52WCkQNyRKj4+Rmx8Ia+NdodmqmfIPyF3B+ArIjsMW5Drr9kxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439610; c=relaxed/simple;
	bh=eNYVv/RRn7XlvUCC3lQZslvumrqj3722AkonfgOOmuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3BkJLzdotIslSbjXSZ0hmGjlRlwudQhMlXvC491GlDiKbdjZiAWevWxGCygkv+IEfkwwkLj8fNTTD8gmNr3dTk2kOTCKhZrG0RTGdi5QIBYtgvrm10CkNVG8P04RIQOgGfMv3PfjsICTpn8mScNL9R+ntXswMb55jCpxyIE+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZFRn3Ll; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZFRn3Ll"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a80e169311so1929500a91.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439608; x=1792044408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=AZFRn3Ll/7GoMg74+RJ7OD+sEYeA/Xmc4mO/UKt72z99JZjhp74P/kGQ5v5UcLWLzn
         mwT3E2BxkD3GJBkjwK/oK2ZmVxt/InZzdppRXhI0FIaPnPoZwReESDhW+jdUU3gmx7Kr
         bLBtvAo+iiZH0Gu60V3e33ySe1VhesRgz59wXbMpUxxv5QYrNXWVoPehZ6VOWDWgZcHh
         Nw/gMeoDg4gVzZYd6RHvd7/ayuIT/ExCC7zzXkLXEnCocwwZS5GfkI0x2U6pNIrsxJ2B
         7Rj/gxAUZPk9KfMFvF6l54/H5ArfBex/1qFb91j3QlZLLqNmm+LZd+iIcS8VK/MxuEKj
         z8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439608; x=1792044408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=GR6ptcUrUExrhuCLXlZmUjOgmhEdL70thlUNB73379bAT73zXVJLJrdE00SVJolxeB
         TM7NsIKdFK1JdP92Gp+rIOzRcceW1ehiT0e8CXno77SbaPSBwsvpQtgSUxVILNQg7KVC
         K0oK6JKSJkk3SCPss6//9VonTMQHwx5DAglKcZGHkhaMht9crkMi9qyO8gQfGWFJ3bqP
         WyL5AUVkbOr6rJR4q/HlcyKE69Ss9Ypq8h5QK5AQoh5CYr0T+O3Xy59mWFCZF35snVsA
         VRcXXBMy2BBuUH1lsaPdrMqhArWDirLbjoPXx8/lLjfeerU20jqIz13HOBeXwLHLrdnm
         IslA==
X-Forwarded-Encrypted: i=1; AKwUvBxv4jlVdx+lCyTG5jWs0tyqDASHAb17TVnWjfAdzgK9rAFn0M+1JmgI9QcQR4w6hkv1KdGRzf2QtAn8@vger.kernel.org
X-Gm-Message-State: AFq9FYItrpj0/0+OrvHiLEefj7qhwM90mPZV1whBOEMlGQGa5mgvPjQw
	Hfa+iORlO/x+7/Uu+Zo0OhTs7bp2vm9lq5CLVzAbYglhLHtnjexPbFii
X-Gm-Gg: AYBFou21cFGAMiHMUPNQM2iTuXIbmVeoErTjzmMOOvxR6WmE7u75wBCCkQHBoA/5oL5
	+uxf2fBqysNLOG0rOba5cVyrcFnyWR9T7gqGPHhsQORpbivO8tgZdPg1uIOTnEuE+TISCDA+m6N
	j53r6LaSo7l/CBe6VXs9DtcOBINwHTnHCrImjrwHqfkAaCEHSNBX74GYNj2vGtjTjHwdlCXkGSt
	znvGdPmesbhhr+lO1LaRPNaR82DEdo+vo2bZJyPZXrc62dpTESoshVCyNgkGRBHGjKvJGHL51aV
	nU6UzdYRqYXe60gLrdP1KWmXR2xJvk4beZy6lt2BX7PTqsQ11U6mPd+VrqdsUYXjV6b1fSH3dw3
	GMHlUZcSInZDugUCIbw5OOGbmFX1XPtaiwsE/uwRSv8t6/jlsOyoyk8+5Vgolv3Nm16z7PlDvA4
	uAhHueiLRS+7EBCq6B4joDVTJM7EDeLrDirJsMquQQlragCJPXVV8/zdeBYAnaAgi76F90fP4E6
	/ULbudTkMEpER7QWTnPgJcXmJZA4LjkF/z/reiW2tviMpA9memNifPNRjfHDZOo
X-Received: by 2002:a17:90b:3908:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3a8a0b8b75dmr3123041a91.18.1791439608487;
        Wed, 07 Oct 2026 23:06:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:48 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Thu,  8 Oct 2026 14:06:28 +0800
Message-ID: <20261008060629.2736806-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0

