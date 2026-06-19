Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794733B42D0;
	Fri, 19 Jun 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882947; cv=none; b=ml2glfebkONUo+KzKqBKj7Txpdpn9Aj1AW80n+KWNhqOSNeKZA/ok29tj0t3ABHX+lpncGbadr1L0PCk4b5qQtt5yJbW/ynmA8GLzQlrCVgzLN9RdaUSd4dmfB9ed9Xigt5XpKwC2RP8IHJR3Yeqm2W5yzbXounWLxPKQUH1X+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882947; c=relaxed/simple;
	bh=9kn1f+t/5GGJZ/kTWkBXhYGTLNor/RP1jpdd3Kej13A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CsKSMriD5UNAiROImL7h9CkZp6kRBrmZntNq82rabrOOVn9l/AVGYQeL5zjJkuLT3rIZq9VeXfmWIbz4EBfRtqh2UTng1wEfKhX9TJ6Ug4kcBZlaf2MMqtLdPDuQ516iPEwXMquzloj6QUq2dtmrhzSBY2UHhHTnlOrZ518WjY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I/xLdo8m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I/xLdo8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=9kn1f+t/5GGJZ/kTWkBXhYGTLNor/RP1jpdd3Kej13A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I/xLdo8mkbGbtDz1l6207Kh1quxIj9Tye1ckVrXjNMSx6+/o6ygGfvXdH8SBzUzd8
	 LHPFD9F4GkI/xTWIaSoVfE3JcXCFPcbsx5rYqLl9nEOUbEx7PkLCVh7HP9BeYwllw7
	 WbVanDNM+uKuDzCC6tiIMYICsWLE2VMtLGXG7QA4x9InzaQZbaaTunSUQ6lUX2z8AA
	 dW5ZcrL75DuEE3PdsJo6OYpcCiIxzHkatqlavgG4LqGgXb8a7JsyJLEdcRqfbk/4YT
	 pWJYMTGbPkltDzfOfKepU1lunJFUL9QiriEpFbEsSnhortLaMOOagBnNqEZ6KG5fg6
	 0FFNakovqvX6A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D50A17E1576;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9AAE448004C; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:04 +0200
Subject: [PATCH v6 13/23] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-13-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9kn1f+t/5GGJZ/kTWkBXhYGTLNor/RP1jpdd3Kej13A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDgwSr5u04Hxwyf138blDNzIbPrEiv6ed
 CCIdnqzLe1Ux4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaeqAQAKdR/4OimZHX48cqGz/7bQihDRl4Mpf9Aetig4pWa50oP5T2fJ/o3rVNSImxWM6A8Qr
 ozQ7RhIt1XiVXw9O1S2GtB+yT18UNE921pwqD2E8z0Ww8bELRuga4rYmx89iGIliF/HcKAjcN5Y
 4C9ZlzTWDVCh7GseWkCEA0qgAZTGbAfnee3vimm7Xlz4XfAQzGoP8t1UZqcn9th9asCd1U33fHd
 JiUSnC4Z8Mpnfxd3OdNynpT76xKKvQgjnp0bYSAl/xGP//G5XmsncczhwYC7fs2xOOqthguMdjl
 1nkYIiSnqUXNRfQ8D7aMJPeyO4vCaR4fUlP9w3PdlXaEW29kfARmAtKjSBOW/wtSLuGRgjgCZyc
 iNajVCh81czw/xTJA/Xb2uP8I2Pl8qXDPeCvg2FItklZZfhCpYyIyDLJW3lhJUac1H5Xofcptlm
 aKM6I0NixivX1iyS5aArY3XhgChFL9HjcoCjYxNXqVHdy5KVou+g/wwWUgnOD7fL5yNliTmcYRC
 eOKXzBxvTANJWikzyf0DbMKiRPaHuI66DrHFZhzyJftWnMaWgZK0/L/DKx294ESZzIHocoXtg4Z
 Yc52V0LmGrRtxPpuaNoh4xP6lQtohrdcGS5P5ojZ8bvfdjk1F9bpsqWRihqSc0KSkM5XlFu4hRD
 g6VLWxqOrKC1RsTwqXZUrIA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e8b2adecb08a..ceaf091b9101 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0

