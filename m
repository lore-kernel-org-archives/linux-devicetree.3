Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16D3C0606;
	Fri, 26 Jun 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507309; cv=none; b=du+YAYSXCPVXkL9nJyZBFV6p6pNbquCsTDe2uEiZuGdHv/kiJs9PQ2Iok3cAaOR4cDnw//A49R5mQBIKQXmPLG6sY10TFZpu6ouxJr2LB/bnL5gU1RCAq9UZy9q/EPIgz+rS+k9r3Ji+KhhXiaw3skeyvNs0zEmKxldw+p0IiJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507309; c=relaxed/simple;
	bh=PuDdz6Q2vqXx7HrK4iuws0Pe9IlARbZd32hHkFqvSvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mF+eIgSQAqDdrffPtt/bntd50nna/IwTM5vwiEkgPy7+qbWQSVFjplkHtdWxpwVy8E1ThOR7ZSC+OEr2v60T9m7pGOI2/rkPCa/+aVxnii6bxD0j7EzbzwK+YaEXEUsCAHSFzKNtrvC2hcJHnsIyhM4GnvdE09H+bVZx8HiRFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Mb6uYsKq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Mb6uYsKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=PuDdz6Q2vqXx7HrK4iuws0Pe9IlARbZd32hHkFqvSvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mb6uYsKqb3boqMDe1XrkyKZKNX9pJR7l1WaRFC9DDtPxc4Ldynh+m+1ohTv4ECgip
	 LHgktPnhmooUhvsD+TBF3N7/Ieb0gMaMepXDMEYcpZZELMO+ziKGo9w5JLQdsjNbiD
	 HnBZdGDkW3f2UQec6N3WZkGPgvydYmyEpn8fFNqLXBpEv8CJDHXjJjIJR6z5TMTt+i
	 sgAm3va4ikfT8FYybtOUd3A3A05KZn3/P+fm4/AYTbdEHyxqZuTD4WuSppbZ9KwzwR
	 Q48z46Vc0E+Z11TOCfyCcoS92EehCXazAXhRTAa3+qv5aFXTkxEYn/EylkCZRkCW2Q
	 MRxSUaVo/8njA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9D5B17E1531;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 19F8848003D; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:03 +0200
Subject: [PATCH v8 10/29] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-10-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MNkOUSpH7Jeejx5O36YJerXIyJQjXxCBZW0DlK6lNlk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yV4yEH0LduE9rXrmtiKqVQdQ0Cvz8XWk
 1FkpGU0OYL0PokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qawvcP/2u66/2Winc4HkaAKHlfyoQdnRirrF2NrRI77SAFVCX0A6A2cEsfSgV5Fvl5TkB2k/A
 4Y7jYaOC8xOHg3EiXd8JSLALJ+6ihGJJcJLLrXqZCGREiWxmf9OXAOATXqB3G2FLCj3QkcE3Kro
 QVCs6PiI7/1sqDG17BqFyT7iu2x2njr0i7jkeWRbZgyBHBnuTzOhhxfWIIATMWNbeScZFy1YFvD
 o40B1M7SPqGz5Va1WLp495Ivm4+5+gBVgt0nKsDH5HE5g5axDCW98e5nQa80Wtpg21hgS3HgR9k
 Usb/T28g5W5YZTVOdhdeppQavWy9CjbQNV1Y3lt9g/wlqxJIrTbCTRJz2PswQEmYIUaxl0t6/XA
 KRpO0Djp3fDZ2625inzcnhyY7cdQGOUu768KAGbC0fxAW2YvypqB/1cXzEIHd7kYACNoxmatCta
 QFECdZGE0aUCvq6Pnt0MOOjzR0MYpjDbdUwLuoFnv4y4m/jvSGMne5PJoK4XUXhf8Sh31fp+f0Q
 K2+RShk4Cu0ORG70q1PkV1LZTUbkg7KcNJJ+c7v+m671VPSAIM5599W76fMw8pBKESGHnlfg/YW
 Y9IvErfdVCvtu+LG0lAHLwJ80xuLR3ENA1CpnQSF3N1L8O4crIDANyrCsWJz1siCXzxE74CxjB1
 WLyUbr6wLlVK8dOM0VNAq0g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2aa9ccabf80b..c6d24dd3bdef 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

