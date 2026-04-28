Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B384143CED6;
	Tue, 28 Apr 2026 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392847; cv=none; b=kam/riboQ4OfkX1otyXesxCNOonLsi1ij3mKxKiMVZhuwrjigH7bNZ71G5Mxb/XMTUPWAulhAF44Ke5B6wMwXNc6lgXILCh8++XXkmnts9Tq1f7lvKqRceNoUAz2NHMD5VjwmYuCEJqDzbXdhqKUlsJ07fxccKOmUYX/XrM8d/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392847; c=relaxed/simple;
	bh=0XX4vVa/0GPAugnfThIRtqHaHn956POvyh55GofpEvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APjj/oOkTmBFXYD9tfLY8raX/VVDQZyKApPv0lbl0Zrs64t0Dqu0slV7uZ00PACQhi3WFVAZR6FybJj1S/2BgF/ChvKEP/jsDrxIq8BJ09DSOVApGllffLKp/UCrShzOo/VFe8vWZmvIRG5xeQuoYz3avRkRiX51V26mY/V/Hjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LLCEyRfh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LLCEyRfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777392842;
	bh=0XX4vVa/0GPAugnfThIRtqHaHn956POvyh55GofpEvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LLCEyRfh/f8c6ZwocfwlBbkwybR71sOgPU2xaEX92cAp3+jbVit4H3LxqODmmsehh
	 vUyE9Tou3fIfsLvo8ITsyDwetys066uccZOgiC5QxHmurKmFh83puZoCxQwnNUFgFZ
	 uGoXAGsw6FglqB//WZ6FsBy0PjueoItq84g/G3hca9flERCxclVUyamxc9BN9j99R5
	 sg3HfPQQsE5lZ9YClIQW4WMBNoRnjrI5pvOK/msdrDkwoUycfrvRjHoEkb4dEEcScc
	 Onf0PHMyrx+Rps/dVfDQIacWWDh4e3rD9sIf+U4aNuf+9pCRLFqb1NBgb5D/mawDa+
	 RuRlwVrbO59/g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBB0017E1537;
	Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 849F2480035; Tue, 28 Apr 2026 18:14:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Apr 2026 18:13:43 +0200
Subject: [PATCH v4 04/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-rockchip-usbdp-cleanup-v4-4-7775671ece22@collabora.com>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=n8lRzOlMyygGbWhWimK1M+yPX1RbWFhy4RXxCi2HYdw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnw3MjgjA0lE+iTwOFRwAegngadQ8WC4GWmZ
 S+yAiWJpPsQ6okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp8NzIAAoJENju1/PI
 O/qaIHAP/At6d+Rx9C0Xn01ry0teoum+lfMfUBebklnK/mfOu7IC+XbNKo866CWkwtQ+5Sq7WXC
 2p71qOtmod5u6Tz8rh0jFWM10oVFUvkY2MHCGwvKfNUPNt0FkUSciyKrZyYhec3P+pDjXUvcFH6
 xFeeiVYDJlnnmVkpLEZgsj92/ZTzZrnoF/Led4cdC2womD/CoKiaTVyx0+P8Bmvy+Yx7tlw4wZ6
 kblD9XSJBlGykVIt0Gn4EM2HBbduSLHxISQXozKadVr6CMkj6TP44punSV75TtGelC9IwxbLBNU
 QSyx3uwk0jG9nKtoUOa0OUGQJMEFBYuGzaErjYtMkD4G/PqFpPEo+RMoRFzkrxM8v12Vvne8Ing
 QLu2SZfBh5oBSvDY7cgiVWOjPuJ5/VSllQwpbcfia2E/kWEqCqoVjebs6WcAKDiQBip66AK1hVr
 MDBB1z64fgjK/P0lndVSTa7B0Ld15MMwdO2I2nWI8yIe7QGF8RD3NQHhPeXBEXiCutVtVsFf8yB
 8IRjp0oPHysxNUsM3bwagRMlPs5Zdy8o0Lv+f9/KGBPTfIdz1BjSWRLoBPTQIlPQZfuNUlhmnAE
 1OrhX5mki0fFia1kE8jlAAre2lXKlwgV+jGHAd5NlfJboDueyVjgdmSUK5Evlycdj8Zf72yCFWv
 DaelxzUiD/yBMmeO5osQqqQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 98562a888b42..1f686844c337 100644
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

