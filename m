Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4483A493657
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160081; cv=none; b=O4smNlOxR/bxFqsWnWn8YZvAODBW3u2zlwHnC78uay+wVMqU/MfBmqigcbyQ44RhA8fag6duihzYvvHrF+w25muc2I7CeswRr4no0PXuEFal3SHAnhIhTLzNm4EK9EvuMDKSi8JCXsagupTfXznnpXb5OIk6kZKvPXr2U2nh2Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160081; c=relaxed/simple;
	bh=JPq1K/TtYhGpO+h9McDLSD5P9OgM/Hgg+AidAGB5kZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPfJOKPtwzbOBDtH8J84pRKHVggOPrfmEwzA9O0e1tSywpFoDwSm6DzOsDFGhlDOkP9hn2DI66D5UEfCEZZZciAGUnrDUU9TsRJBvcMlneZzbhyzmVS6/C0D0gbBYVx8WIKylr5E4VTh/k+ErxkH1p1Sr4J6/xxepiQjRXjZYdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYUL9gIP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYUL9gIP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso5160575e9.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160060; x=1790764860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfcYaXdQ4JhprU1bLeofN4mzB3OfwntG7DvJN30DUis=;
        b=IYUL9gIPYJqMH6ta6UmGeCGhk8DIsHHAzbYofqCLJvUcJd1cGFPZ1pmRwg6BQ59q1W
         hE2e0h0expbETv8Dbh3Ykf6PjAp4Dh86GNT1GKS3AsHGBmp+VlW7r0N6o7+0+PvE9+P0
         AlYpOU3zgyCZlcNPLEThtBr5KSYBmvbf2IzoKvbY8leIFR5k+aQBfcdgd4E2QlSGOyX3
         esmrHSVIqwUliWW5BR0TacEIngcloE9S3B+LFoW+wtnGxr/0zoFnXeIEmSAuSyoqg/4V
         1gYc+O4fEdZExcqLBePgCguiixv2YpTL7FNOKXEL7M6GVQ/N8v/6Tridf2BtEPLjaa7O
         M3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160060; x=1790764860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfcYaXdQ4JhprU1bLeofN4mzB3OfwntG7DvJN30DUis=;
        b=yY8B3epqz/LBLe5d6F8sGa5ZCSj7X7EuprMSWR7VkGxjndBUOAr0wCW9tpe2GlqSum
         Pg4p7XXdIxvyT4S1vnVUXRjqDUpxaVAed1ImU4uAvsVAW+7ZFbJW8dfpmGHWP4sCv23m
         GvcUHRJgx3L+9AzCw1gUw7uRmFPOvRg9QjKFDm6LnBZ4N49uEfCWudA58O9oePAO75ii
         2Pwn2kTxMHh5sM6hpYuO+Jql+FC0Fo90VFy4M4dpdwSO3bP0lscBm9zCKWUGiytlewHh
         2FdFkd++lOINQBfIDkEL1U1Ku+iRVZsWECGQL2ftFmHD2F88VOXy9cMlhp/vEsM/iNVN
         TA/w==
X-Forwarded-Encrypted: i=1; AKwUvByi9FWYSafIlHpgWbSuPDhsIWuo8Jcbfv4tmeyPrM9kw5hcktvUxAgtxeEohNZ3PBbB9MMC9Xq0WObO@vger.kernel.org
X-Gm-Message-State: AFuF++nownNmNXEeLWs06XCeQ1rfhoEpkz7Tbck7VmBkUTPKRivPMnik
	2F2QM57lNHIWZ2QiQJu4XwevtAh9qBXNfTpdL/CZK2L38LizE5e3TaeV
X-Gm-Gg: AYBFou1ENeSZIB69wAKMpImb4F36FStXeOcEJQOdrE9qVzYmRt3nTnO8fkysBWXlY8g
	Z69nApT7QCUBHhY7wiFSel29MNUjskJyf5dNupUmLQdgNour+3AC26HvoJBA1fXheh6lvzEKtV0
	Tp+kupQsm8F4ft0qhH9x/XQj8JCm11jRpt9/Kfiy66MKs1VYRikbHW0fUeaxrQeVjEi4PFgY/Cm
	/I9+NWMKeBBQucS6eLRAbOqU582qlWKJW+micriLeCYtYsiXwT4p9ToAIEZ/RNYRr/ftENshopS
	YjNCk4/rbWhQEF2wsZFhj3Z4wGvk6rleiqgF77u9/UCp8jY2LOpfEYtoE2D2K0byuHLcKk0L50S
	1WjP7lxofIib5KimoBwf1L+vjpfpaFo054YKcEA+LBXkFPwoh1I/3mpc5rNMicZNAmdomCsDX+M
	lpEAYLBo0cb46UIp6f8kTI7IcQQhO6MHx+KJJR55vauY5PsmRPyyEnFvXvNN+TJmLb0oadGsKxx
	UwMTMVsRz/QQJNGDOtWpAvqj+Te9MoLXUQ4MU/O8weNRbYQXy9xy2w2LpAiWFSyAMm2Lv5pwdO4
	9qgp075R0+Ygm1/u38A=
X-Received: by 2002:a05:600c:3b21:b0:49f:bd3c:bc25 with SMTP id 5b1f17b1804b1-49fdf25486bmr26346245e9.32.1790160059852;
        Wed, 23 Sep 2026 03:40:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:40:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 1/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Wed, 23 Sep 2026 11:40:47 +0100
Message-ID: <20260923104054.3324830-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 83540dd9a37b..057b890de0b0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -174,7 +174,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (priv->of_data->wdtdcr)
 		rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(wdev->parent);
+	pm_runtime_put_sync(wdev->parent);
 
 	return 0;
 }
@@ -268,7 +268,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
-- 
2.55.0

