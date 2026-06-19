Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F0E3B3BF0;
	Fri, 19 Jun 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882944; cv=none; b=nlLsPpvyQr9E7uSAXMgGVSOrt8k5QrI6gbT2WULLACVgCSmI/Z1Io2kbh8me9n+LyK75AKI5JN2WlMn1ktOdPN76TO18H5YBkFHfMsnMQs3/2rFVGawY/lotG5pn5mDqQcAUzbVKhkJMoXQ2fCksvQoy2xo5oGuTFsCV6/szx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882944; c=relaxed/simple;
	bh=cpvq43WRrUvRj02SetrExdbPsYDBWgO/ul7fvY292vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BuBTjyfRjOI8SXunaRiFib99GN2DZbz4a/JRyPLCODGS2M1wfAGMPVXdD1LQr5I4sZvPRzUVVM7j8jGe5MMZ4rSyhDYjtbr+gSokNkEJ5F3uX9lDkarzeobZsA0anuXpu74WJ+4k5zXxThdVj57HnLQ0Ax0qV3Qqe2qaDcb9lW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FYXcPLbF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FYXcPLbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=cpvq43WRrUvRj02SetrExdbPsYDBWgO/ul7fvY292vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FYXcPLbF481CnTg31VM+szyWM1uTJyP8JYhGfhqBZsbCQwD/v84XjUv2jzSvueGzb
	 srXx0H1Qt75d+vXkeAL9kj+PtpP9XGNY1ewH47mJxXYwBa91h/ImRMlrWcZWKTVtey
	 /FdDDrzoGIa02Nli6XzjapYuN+DD9n/8OSeZfzCmF1THAz2bOXOOaN/9U01kNAVlyE
	 HyAPZzOi1lYhYAlH3rTyqBqRwXMmUQPEnoeLDH4AVM3918KmqOuXPnAwtoWjdu2zei
	 glLji3HxJsRS8Xq5bPtULGTGrHpf2b32Qn6cWimBpmgkyzSKvW9L/Sx3B2gvDFItJb
	 Jw2L0nnCdGXzA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BBE917E1270;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 930FB480038; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:59 +0200
Subject: [PATCH v6 08/23] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-8-3bb1f54b3f35@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LCrcJKsu7JmY/ja6BaMtSNvqcASCulXZamqfYDJZGNc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDgcc9ln6ZxZahY3gWApTUHyXhflppCaI
 GskblCNLykLy4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaIhIP/3reH7DB3VW7erXppLH+b/3V4K7nSiG+1+t2enw/TrkFsduMQYeoN5waTzTcw/3ALMn
 l0eeTyQI2ccEfy21+c7PC5fa5w0YAN+AdxFAWI46snNEgs/3YmU5kRAwW/H4A8oTsxdartQTD60
 AdpcLhda5YCFi8sTtulPMrZ0QKlfPeMXZcmqDrIXH5u5TdCZLlj6qBmCuxkqk+eEQQAUflVu4ea
 J/1z74aPTEFMRsegP/DtXTfIayni8b40zhTqtyr0lLJmXw1tGL/SkYXuaxUWmYmko9sYnoXD4A1
 Ezp8Hkv4pqfky/VdNjNEjEK7vvEHUPvJj7AC2nNDpyq5OWCWezsOquFzE4VE9s159cuWpue9tk+
 4VUovMGI72gwx/2rWNb9X4LCXyyANYYn4uJUp0uL/uPEQNk3Ux22e5fjl0X6zDYMmeENcy4AQJL
 1HklAiuHW8XEL+KmhoIO3WjcWfrKSQZam5OzeB3FV+6yCKoKcDPhFnAyqVRsfQwhBpDIh9qBuw3
 1EtABjeXMXqek5t3rF2Pz3sX9dMplJnJ9A6UmEQE01UBEQ9ApPEIHn6Kt9MkhT6WaT4q8elwhWk
 FehD60alcY/TSbvklBIMiKoa0jWSxFH+FMnA2YVKNlIfFCnp6n933wp6ThmYsmkPBe8irx4/Xxf
 CH8eOGLFKl7+jAb77Rxouew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c05ee65a9f73..a44babac3517 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

