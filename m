Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42C3B3C0D;
	Wed,  1 Jul 2026 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889122; cv=none; b=OkjyfpO3vy4zRnbfoyTa0nREVkYKunyX9MQwwFuFMR+yhI879sJZ2R7KiegWa914esKl4YCdzdca0oDNaWnNxbDaaFXGBEVjfSHceQ/XPdDS7tWk3Jkn4rH+8GYJqfTBtLli5+QgNN1i7XZhjuwWYSk8rJvL7BXtsQJpCy0VqzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889122; c=relaxed/simple;
	bh=njRESqLfQG7J4os1F1U/PJtipN00LX9glpTZuXwuxRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=c2QjhG4tEQHHiRJH3eZY2Ld85vfnvm+NgXaL1EczItChCrr7ug26It3iuXBl3cLqK7j4PjqxAlg7YZc5DWANl6HcRqtGnBu22jIDO05zI+1aLTqnQ45BOOibWWdB71MqhVbC+CoyzrVkejnbBkqeOYLoja7q404NzHX/2vqk1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 1 Jul
 2026 14:58:18 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 1 Jul 2026 14:58:18 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 1 Jul 2026 14:58:19 +0800
Subject: [PATCH v3 3/3] MAINTAINERS: Add ASPEED USB3 PHY driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260701-upstream_usb3phy-v3-3-00e12315b6f9@aspeedtech.com>
References: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
In-Reply-To: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782889098; l=861;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=njRESqLfQG7J4os1F1U/PJtipN00LX9glpTZuXwuxRE=;
 b=9nDC6roHxfGcpoe43h1qTGG9AwTHok6mjgtTbKiriMRNV5LYvorZCkvRv1RyoRS7m+iQGHzcm
 V8uVk5DQGeSBKe0/CjGZXbG8nfFOos6gvV42A+70KRo+SPXsxdJ0+vv
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add maintainer entry for ASPEED USB3 PHY driver.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 895a87b571c3..10c08f322618 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4062,6 +4062,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
 F:	drivers/usb/gadget/udc/aspeed_udc.c
 
+ASPEED USB3 PHY DRIVER
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/aspeed,ast2700-usb3-phy.yaml
+F:	drivers/phy/aspeed/phy-aspeed-usb3.c
+
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org

-- 
2.34.1

