Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200953;
	b=vWalQrefjafiJd5Dwzq0mfcCa2wA9zA/Ci9tOpKYjYe1q/1mYPG+OTn2gA2w4hG5ylQM
	 qnfhCZtwY7+FUgGapLn0cNCqG4wzZSwSiuwZM01rRB/xSGKmRd0hMtOtV8vxKDS/VlRd5
	 AAO7FxHwo2X6Uu/8xtVHy1NkOk/V5v5rG+26p46stk4o8jH9/1Hv2CC5fOVK5U+YVAijc
	 fQ+WzYO98ZLib56MexWlKuE9lkYkJkvaOPb+BoqctFuosqyLBTD/8B0CfPGHbohXjq4Zy
	 hyHjv7z17iQBWp1jZaU57h51jH8RjCi5GvMP/tmnQ3ZmqW2wRqIu48V9zw/eIUdTwtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200953;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=QH6jjxSQFlE/SRUSa0R2JTLIXImVKkLijmsa5G5HISU=;
	b=a1oc3EECATIpi2B38Ap1x3X/4I+sA067FcUt7/HUk+OhHDHymO6zrq4EfQVIHWL8FXSB
	 AtI9Ri+B65zxMYXiMsyLOzi1vfpcnk4fN0/lgKomCHwsb+2oH/oURWVGZ1JyHueobsI57
	 +c7IV7+mFx7FCbuS15hGo69xNduVUG0U8Q3w9VkvBfA7tuHXnHLqCAhhZWqQX8/4b3XZ8
	 YE2eEfP6EKBizxllr/QiHwsf1l/iplBl1yq3YJ8eyjIHILUJFBMU9HZrz5lICxyD4KGMz
	 Ioddo9KjmPW0OKEVP7cZwqIopq+5ZF4dcbDYlPjYis3Yf7Wpn0stSFc/YuOJkI5jvEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=gCZAKxfm;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78A60A2614
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD78A60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=gCZAKxfm
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152231euoutp022c173df746e1b0db32d98500a8f978c1~iusO-o2fY1489614896euoutp02O
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:22:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028152231euoutp022c173df746e1b0db32d98500a8f978c1~iusO-o2fY1489614896euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200951;
	bh=QH6jjxSQFlE/SRUSa0R2JTLIXImVKkLijmsa5G5HISU=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=gCZAKxfm5FRNb3iMGpzVSs+9ZEf8KFC2gz5Af8FpuCfCBHRvgakS4SorFHzGOkksU
	 4KLHxgl5Ys32+af0A8S/iRyCB9VQi38Wcyw2XZNP7GusF9zYeW39ds+FCqkX/I9LeJ
	 vTokevr51K0ZWG7j5TjLLms9vZs/9pxTQcnxCvQM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0~iusOMQrXD1847618476eucas1p2F;
	Wed, 28 Oct 2026 15:22:30 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152229eusmtip1dab83fc87e0f4950dfc56f2d63f29ea2~iusNYwzjr2111121111eusmtip1k;
	Wed, 28 Oct 2026 15:22:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 28 Oct 2026 16:21:45 +0100
Subject: [PATCH v6 5/5] MAINTAINERS: Add StarFive JH7110 HDMI PHY entry
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-5-f3379684d97e@samsung.com>
In-Reply-To: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=GkUbaSZ7nQRw0MA7ruQjsKC0roRhT37Hf3V6QvV5qcY=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9EjbY+ujj78SDL06ZLZu9RnvL4/lRZy6fLtBYZjThr
	RbjVs5ZjztKWRjEOBhkxRRZzm6MNpL8x/C0/PjjXzBzWJlAhjBwcQrARJTnMfxP95XL6O5y/7vq
	JXPaSZH2CPa2y54/f8481BPanPX3q4YEwz9dB9aA/5M2tD5elyhWmGBTkPBNJHHPi80/vF3KqyZ
	/5GUHAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0
X-EPHeader: CA
X-CMS-RootMailID: 20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
	<CGME20261028152230eucas1p2bb9681d2ae0139942c850a279b20c5d0@eucas1p2.samsung.com>

Add an entry for the StarFive JH7110 HDMI PHY binding and driver, next
to the other JH7110 PHY drivers.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3d9e0117ebdfae707e1f61cb3e772..9e42d1705fcb3fa46325761a19c6b7244c18b7c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26106,6 +26106,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-tx.yaml
 F:	drivers/phy/starfive/phy-jh7110-dphy-tx.c
 
+STARFIVE JH7110 HDMI PHY DRIVER
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
+F:	drivers/phy/starfive/phy-jh7110-inno-hdmi.c
+
 STARFIVE JH7110 MMC/SD/SDIO DRIVER
 M:	William Qiu <william.qiu@starfivetech.com>
 S:	Supported

-- 
2.34.1

