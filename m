Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E668F3B27DD;
	Fri, 19 Jun 2026 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781882948; cv=none; b=PXb2RWhlbqpIqm1xLV5CTTXv2jhnEujFNE9SyyOBE/R039yZYIJi3rPTtYhZAqV2OXXtjpuMn/XXQCIyT8+GJrXmq8TKPr323/zba3kUBCIirhidauJHNwlxUI9y756VRDkp2szItzDcz4Qh1eiavus/BUr/XP+t03ZD6BSdYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781882948; c=relaxed/simple;
	bh=7DI+RHmwmwOKQNaB2HylLylJp2KES9vdbb2FVIqpRQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhbBrhQ2puWWDDiIVg6mElitVIma34vWnEcLuTCm9Q762VLF4Fgh9gchAmCIqkasDGXI3eUVXR7VEXabZ8r9at+1XLeHLeq69DkVrZIVab3UDr7s2abjTPEvGocRrRwZHSqadGmwcZRSrrR8zZwpncvvQdofjEI1fYWHGi8eEHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Assn3H5R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Assn3H5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=7DI+RHmwmwOKQNaB2HylLylJp2KES9vdbb2FVIqpRQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Assn3H5RNmWsDVeDWZhDxjkL/b7okZO6ORPt1hkZ6fBlTeGGSti4sc7qesE0uCaav
	 d9bYnraJS9wRRj/6d01R9m5Hcw7VPo1NDo4RzSjguOKWmP/Qwcags86H6c60W6nBmG
	 J9YYDeCxWvml8xFDaa/gtOcJi3qZtXwr8ZPlCuh2AcGRO8nmGzxEmwcmbEzjUnllcf
	 xBNwIevZNDFT9U0bDOh5DzhqCkEDmWEUARyzhgFd/gD8hjFL96PSTbN1EWh/53hq6W
	 r9P/+XjH66Gk5jX0GenJhz+p7x3l1qNjnXNXqCYAlKw3uEElVapiCdvPDDWOEd/mji
	 C62QRNlBp44FA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE29F17E15CF;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A8B40480067; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:13 +0200
Subject: [PATCH v6 22/23] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-22-3bb1f54b3f35@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=7DI+RHmwmwOKQNaB2HylLylJp2KES9vdbb2FVIqpRQA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDkcnB5awIvA+Y4xIbbpdL4bx76UX4zdy
 Fvv8TtYcJEd2IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qavrUP/Ref6911SkrhHGixV4ezS+koaxNitDebclE+VibzFGQJa53zLiDH31PRdWEeBbcs1GL
 7TSpzXjagmKoqocRVzdQ6BUjDJJlnOEH8JgWT4M0JWksJXogkYYvMAfLqVldBO5misbX77YA1bh
 3iKJyQPqBcrTXNWd/rW8HTmeS0rSu8/YivLxV4THDBMPal5DXBV3bUCnOLsbvzw5KeLFwnmgzQb
 3+4GtlI00CdojicTsllYwGBiTp39v/1/GyXUqbSkzGK/guetjOOvOXbBj6P8RoqeKWHB4DIi/iR
 UoxignbPvKbNmoE0YWoExrXuhp4gYsvRvPEEcaGRsyDr4t8B915kaE3cuARE0zIuDY9cI8IrTfp
 kCJ15ka6DL/zBRiwvEQMqQqMFmZk8aGuUvMd3Z0dEOPrlsv8/ij/AwI7rB32hEJZ593u04uslq5
 0rZRR+ETL5cnMileaUQg8+LSck01ODC1SuMI+IZF5YguxU52o4caoTqz8guqA1DvQJWnMMFK3OV
 47u63pRvrkdMs6fd8VpxsblqANVAXqxWNLpTSvyYOXRp63yYdaoq+prFKJG3lbDOuqotXm6bp9r
 3/hMq0QZxd8nKet5r5XwhDi/2gceiT0lvOiV/KxRFeMsypc80iQ+HC6bpFa22dwchXh7JcWwCYD
 yPhTUzkuLvDsPJOFsKXgvfQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7f26b74cb515..8c59c50f207e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1183,6 +1183,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0

