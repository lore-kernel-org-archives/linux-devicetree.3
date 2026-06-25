Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF0B3EF674;
	Thu, 25 Jun 2026 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409191; cv=none; b=pfK5RJ51hyztzdmFOqu5kluQBNnRYhonWRtuZE/nMjtLJZI382mz8jkA41SBFJC1cFhhE01FNoDFppG9/H05ND371krp53C/P9lgRYw74csQzRKNpFU+ELPyKc93orPY/wK3MZ51mXrBaQ6onJ00PB8kSBu5ZiBpZA5J6FXlibU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409191; c=relaxed/simple;
	bh=ewPiqW29+oWoUbWDi/d4vcSR0paz2F3zZxU/1ozkroQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTURxHrGGjK52gt0jW/7NpkPs16TMh7Fx9wVUM64c535mhwH+cWV+xccWXuZgeP2o0xSv56WjtFl+lNsqGEFoNB3FMx+B2hLGHrwkz8kWH6rKt3kj3lI7sBG7fEE1x5ASmIR21c5qmF5L76HpuGtpYdRyNKVHr/L8vmAv2fsMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X+Za2jYw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X+Za2jYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=ewPiqW29+oWoUbWDi/d4vcSR0paz2F3zZxU/1ozkroQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X+Za2jYwO7JpEOaeu39eEDohYViskLsa7citPlLzq3EI8m9Mum/8z4qh9lFjv2KuM
	 V4lGII3TbFLY4y8kVDaA7yGrWNrVkzd4atO+/qct9ssQVBcvvT0XgOOZwpGX1ialy4
	 FLT+euXLrVqs0Aq9Xc2FoUtXd5Li9FNT6y+YbrbCRQARbCaMzc9zeyz4BBcect/7Uj
	 oyKJGwkj0+5KotC0PFclUedYfCxgwJJm5Tr/3eU6D7dfJnzi0KEXyAXUHkYaSlgBWG
	 RUxCP+KJhb2/eqzrc5NrXpBbMhM83Q9J635Cqb6nu7MwGPzJNJO2xnyL+5pGGt/YnK
	 YdM6UC2uH8Rvw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2645917E15A5;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 192C4480067; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:49 +0200
Subject: [PATCH v7 22/27] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-22-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ewPiqW29+oWoUbWDi/d4vcSR0paz2F3zZxU/1ozkroQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9vlp34qchTRwzOKC1MKWkNmGwmDxKWKT
 tSwM4L/3xvZT4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaEhYQAJ+Q6UTnhiTfbihxy/vQ9stGK2RZodmzitjOOpRUmuILGExCCx2XWPDJvXbj7yv9yEd
 jRAhWqY3cx8biF2TEaFjeDrMhCO3HgQXGuovcoTWaiuSTa8oDYA3vTGL4mq0O37s9TJOlv4QQOC
 yWfWid9AHxNvvW0wdxWnPXuWWQPHxbmhjzaOvug6qaK/eyrdx9qGiXbeuSO2vuG48NVMWaqBXz6
 /glhmkOZh6y1lDwd0c/7dd2oa4ca9ieK/XJZ6/onKWYe/t1OCdPy/QlW0MX5YrMuOLnXeZIx0KM
 dzn7Px5UuRxy6ahU5xHNX22FOVK0frpqjXZo0ZEkZ6fPXRk7oJ31dvmQ+KrnhBm0XnJdK89gCWv
 BFduyYU9GaHqPZklVny0/3EQz4XC1aGj+N1xNgKewfnH5uaYKE6kdzrXGwUORWIpQzzwDlf0YbM
 3vX6SZjHsY9sJsrtN3ZHwKqCeEksGctoKIOo3ajK5Lrqc/qhwYz8EK5+uFy73NrVMiQkRFXlE3u
 vIpjsNavmahw7Tfh2rkBk7UOLmZZzUTKuJ59+vXhnDPLpkbiJmmcr/9Yriex3LLqvqHFflN31Lx
 3YjI96meBKfJniR9gBLvycLOzvuTCGtG07UjGPve+MtY/Kz4cpRe3BcW3GU8BsN1pt2EBGi7NFo
 6m1wz04cdJ+0RIonHhi88iQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 0bcaf54c5645..0119b6229b0a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1329,11 +1329,12 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
 	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
+	 * Ignore mux events not involving Safe State, USB State or DP AltMode,
+	 * because the mode field is being reused, e.g. state->mode == 4 could
+	 * be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
 	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	if (state->mode >= TYPEC_STATE_MODAL || !state->alt ||
+	    state->alt->svid != USB_TYPEC_DP_SID)
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0

