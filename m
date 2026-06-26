Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BD93BFE47;
	Fri, 26 Jun 2026 20:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507309; cv=none; b=PLHN41j0AmReZbl/bIprI8N3PawWfeFPgUPbCGiRNFSYJUHbN9ym6hyDB+wrxYtgRE/Lqs2cXh0YiZofmGlF7BSpw4CGa5KM4b+24J3d/jKz1Oo676WUUaBvqIhoesoM/awwY2N8y/AZdwqG44/GGSFwFhIGh/iHiwEBE8OxwWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507309; c=relaxed/simple;
	bh=B/EWcVc3B/o4P4Gg8Orkvfe3e6uQ/US5ZTpIUx0ygOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5U5XaSpDCVUZZE50Em4STVndQyR/tBj26amKWMc3B1E6qS8qMrNYatPria6X2wsyp5/HgU3rv+8oE5Aly2sSHXlWPG0TOw2NwztODsX7hmB7CgU6HMiJrdHpgqIsShMj30kPfDvMpKZh6oFN416ixil1459aGjmpGzm/X8zlzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bD/b+imH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bD/b+imH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507302;
	bh=B/EWcVc3B/o4P4Gg8Orkvfe3e6uQ/US5ZTpIUx0ygOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bD/b+imHu1N6TSLbY+iZR1gvOQuT2n9MfYacxu1BB+7f1BZrQ8pM7v1IPe4Xv9/Or
	 4dwBH5o/SYF25QGrL5XscdgHIOV/kro8XzHeJdq9dAE95TT8kKY/S9qTSfcFN3/VXd
	 nWlmXcyh6mmQjJA9Ukzf3KXTw0JE8t1+DsgPaDoauKh0YKLc+7R6E+aM5t27nlCS0K
	 0nK5NL4r5r/Pc38wGdQnc/LlxDTsskcmQeHRAlXZ6EROvDlE57BSIBeBakzsYKSacs
	 xXKmCTnsnhTEN0BJYTXpw4POtX+DQbXEw1Vhh6J1ma8UkSBaiOunGBGV55TgQovd9u
	 Z3f8JiXU0loOg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA86E17E14E5;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 17033480038; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:01 +0200
Subject: [PATCH v8 08/29] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-8-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=B/EWcVc3B/o4P4Gg8Orkvfe3e6uQ/US5ZTpIUx0ygOk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yUFyWL2hgWHH48E4rPmWZhX8euEHrYhp
 QiZ9B6GSkSyiYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qa+3IQAJC86ALYXZglYkqXR5NyZLrEdQQFLd8fSY9B/+bA1dNBJfSur1/G0Z3tA6vXdFMOAcI
 t73ZHk5LkPlSAWRE2fBhPSFSRIe4ypjlab26X7CEpnyIuQFCw5oEnffrGUGdh2PLFZaV4VUckQl
 fsyclV6slNpEqJZ4L5nfGx/ZuM2foUIDyHtgdPthwyHoIctUF7Rjpv5HhkrR9TjPlll0bjLq0HE
 ihZ7IXEjfyTngb6AfIJYPWi53soutEzf4OIImjoe8G2FzI85B2jyKMi875uS111Rq/RdZQx3K5A
 6+/XofVb0E0awGaXkKQqNYdohklxE4YmG8QlZX0t5kO5Qwercln4MZpW3Fma+hZE7OxADwDPesb
 8TLLIeMNi01rJipR2yllHwo2keu26dppFAMkc0XKskMGzQTqh9epVjuPYv9pwnHcDTXlE8T0Qsm
 RHle0wjGUgxbq7wQ//LAbpB9oT19lQUR4WS1oEGY884U6W5ang5Qmxs7K3oLlHZkN3Wv9R7KKur
 T5z6zNkMg/HqDzYIdzQdcMe1zZhcRKe99Xte/U73YagWiSm8GmPmMwze12EHJP8ljWwfD8rep91
 ed5eL8QybPQL99JzIm7eG8Y9lQP19k3pXDAiN3CU5hVwLVksEHzuAlVajXSgjaNxkAhjLhF4/d5
 ShA1cK0aW63K49TOFDE4uAQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b8de0a47a616..7fb7e4669f9d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1020,8 +1020,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0

