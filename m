Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80CA3C3C1E;
	Fri, 26 Jun 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507312; cv=none; b=p4rC4TzJ6IbrEkkAJJHuN9E/oUHpg7RgkUuYFJPL5v3oKVg8vcZPoxQEysGhnrFMIHY8tNbnvY0U9EE8ZnUT3t6uqbB4IHaWYyNTrMQysFqZdN/YQAKf0LvPpj7SFSj+xBP12e5eChsiLIIvSG8oBaEWcuSWgJjvK7WsQFx913o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507312; c=relaxed/simple;
	bh=GEM2lIbnRIm7Nvs/sTuHq+ytCoYrU2B/k7spbg9gs0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdSa+DOy0zjP0H8Sc/gOmNTJyR3blE2EOjNxBJ6gf5TWMV99VtiSfOAniz7xnzZyMm/EgtXQIARorhYvIl13mPCrHcOq4T7oSx52TXkjwmRdVlI1lHnsOmDqjQ6FUyNDIqbWHi8bkCMxLGCMiedQ5i2oEMMx9J/H5AtmDkR8v+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bExwaVsZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bExwaVsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=GEM2lIbnRIm7Nvs/sTuHq+ytCoYrU2B/k7spbg9gs0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bExwaVsZH7/SYzAg0DVj9jUvhFzptcJWPq7gW9o9MHWsqknE+wnEyQ3njNksgy+Jq
	 E6C7CKZe04T90qxuZXQzh18XejHD5VT79hcVbREi9Fq6Fz9hEJEXQdLzSgvCw11JNz
	 gDfPs6ygvwtofAOrEAwio2AB32Lj1RfM4gAvzQqV09hn65Fcr+IvlDGQIrkKnaSHNb
	 HKWI8ejLadHH0rfPjuIjEQSwgjj94EvOPq2iCsQwtwr2cWRq2Q7vynU1eslvW2gdlv
	 cq9vlqvqhLGu4Esfizzmf28UMky1zhswEPRHspJ/9sosBRu7i1OY6FuLTe1VtRoL2O
	 doaHIHTdghzEQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 590B617E35C8;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 31C5D48006B; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:19 +0200
Subject: [PATCH v8 26/29] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-26-47f682987895@collabora.com>
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
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GEM2lIbnRIm7Nvs/sTuHq+ytCoYrU2B/k7spbg9gs0U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVAHi3Zev+f9xGFi8LfTlZhI9cxCmipJ
 UkSCqRABUR1hIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qatPEQAJHA9o1JD5EyfeJPJ/JLHTR0CEkEW8S93dMQdof+5mzrp0XOtlvIoO520CmB9POcxTX
 fHyz31o5yTyFulcUcYr+NE4p/bQPJs5rCqdofn6siiVQicOuWD40/uT/DT1+0vo5DwRgraT8bPA
 4K4IOfaLrMCa3cSNN2eDxdBtol+prqZ6YC1vPNpa6w3NLlDPx8hUhmNPScC+vX0JBbfe27kDk/n
 wmYfl3Phwndm0Kn6YRe2XBdkg+1YgOZB4WqgZCOrSQNq9wLtGrGHQ/ObzGflPRwDM3sYj1X3FTH
 8895lqukWm70s/HCESu7BQrGVdE/rAuon71OW2hveZjFk+MO3jfcGr10ILl7E2PhDDDz8A3iUZu
 Q2ls6jaBSOoJIJqw4tBFbuYMYLv01rMzKys5Hp1I99NdMh+D3gZPcj96RrZ2bSxxlo2k0MwVHdv
 KSFQ81sAIOk9K+7u6IW+c5qv4MLHQYZ/NZVRzzdWT3bd8Kb718CuHsQ5QxrZeP/SDfs9lgTP1Um
 pwhB0GHxUF29Phc/NTNKBXsTf/TUvFQ+AxPeqSfnqx6cdGz8A6olDGhw7DFm+OCtLZW4Tl3QEeO
 qgI/5XuY15NIy4FGS6ZTfIwJPNeAJdh3BJ8G+xWna/Yt/59ek/jDByvmb99Ol7MGrkLO1Zn/Srs
 9AW5Bs4Z4IbjoqpqI+K40jA==
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
index 15c18c6e3093..2681610d10d5 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1193,6 +1193,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0

