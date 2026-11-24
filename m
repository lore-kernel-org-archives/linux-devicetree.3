Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514166;
	b=1F2JRHUMpl48Yiz8BB2X5JfQroED8SqW0QZq95MxcANnjn+jdh4JZrBD5wGo7yx7Jxyj
	 Scg6RsVNj71iPvoBMog3ELyc9YDr1GXz9WbhslxhhuW1RDqOhgqyyeiFgy7FQxfwQULEr
	 5seMGriOWrKtoo/BexkihpiY2I1Rsiu1WUtc7hE6bXnNkVE5u0fw+6AmdBi7/KPQ1/mVY
	 zCRPsxgj2aiigXYV3iJsgWNpSa05W7R8LUeB32wuwNbindP/XXM8fDUGaHcPhLaFCVwuc
	 F8F2Z5ssbUxUr0JprvHyZfmRU7OJnrwtO9QDD0dc/LaayJDFfgPh4COqnCQQDWwKviA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514166;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=SSQUWtraceJTHXBtVhiuGWIORZtWx2UwATdIbhdiqtY=;
	b=GXLUMQFwt79rtPfumwAKFWLr5kr5YK6P5JKUV4KMEbmWSD3RV82Rl0TFJbQ5GHTc6a/z
	 U/gCP+Bnf1ZPzluamXgluHHFUDGvaKnwqvjovalGhR5UAFvrG7vC4DV2qj0Wajk/wKQdW
	 d4bKCD/HbvwdpS9FATD59/RZwRmUdXts6AYIpRaWZQA12UHX4+qOfYhBApH4IbKJUFerb
	 66L79ZgwrYPmxfUH2HNGgB2Gz9us8BxwylVqNPKZbMCFYcCF4bukxMiZiwsUAtlNBeyLE
	 e5RSxDXSNnVEzmcm8cwMZJkziIdc0UoYraB3CYkHtlwLi093fYLufdsBHSv6/t+t1JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XKgNHmBr;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A3606A696
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 229A3606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XKgNHmBr
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261124095600euoutp0166d67dde442fe49876976367bb3c2fd4~q8p2SrfAZ3265332653euoutp01g
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261124095600euoutp0166d67dde442fe49876976367bb3c2fd4~q8p2SrfAZ3265332653euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795514160;
	bh=SSQUWtraceJTHXBtVhiuGWIORZtWx2UwATdIbhdiqtY=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=XKgNHmBrZf+1w83i8YldUhiLGgzglAFBZm0qU2ivf0bcNpLBSb9/S4ONZU3bwCYQy
	 pOXWRsHhZieEg5+VTArPfOlJ7F2U1xny+w+ddtzYcllTeMJO4NkjGjE2VkWPp9ORCI
	 tbsfd9sqoGqEmqoeHepcqkQ/Jr3zsFoA7RS51/hc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261124095559eucas1p2b14a7a7741e5a14d56ac9262ab8a919d~q8p15Dhtb1641616416eucas1p25;
	Tue, 24 Nov 2026 09:55:59 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261124095558eusmtip2e972cc4d20d18714817d581be64c4390~q8p1FvR4v0412504125eusmtip2F;
	Tue, 24 Nov 2026 09:55:58 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 10:54:02 +0100
Subject: [PATCH v8 5/5] MAINTAINERS: Add entries for the Innosilicon and
 JH7110 HDMI PHYs
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
Message-Id: <20261124-jh7110-inno-hdmi-phy-v8-5-5e3008122cba@samsung.com>
In-Reply-To: <20261124-jh7110-inno-hdmi-phy-v8-0-5e3008122cba@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=ZQaAxGYox2BJ1OpbRDQi15xD57Nk5zN+Rfwi1TWQD8E=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzxmu+WTSjI3K2HZfX0y+L9yyNSclVWRLGvzkiXHXrJ
	sWItUo/O0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBElpcx/K+Q5w9asDwyPLoj
	8P9CJ5a506eWTP/8qfr/Er7jvd9tduUw/C9r+M3r49Frd2t9ctSEI3un7ty+8TR3j9lbh8+LIgq
	1r7IAAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124095559eucas1p2b14a7a7741e5a14d56ac9262ab8a919d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261124095559eucas1p2b14a7a7741e5a14d56ac9262ab8a919d
X-EPHeader: CA
X-CMS-RootMailID: 20261124095559eucas1p2b14a7a7741e5a14d56ac9262ab8a919d
References: <20261124-jh7110-inno-hdmi-phy-v8-0-5e3008122cba@samsung.com>
	<CGME20261124095559eucas1p2b14a7a7741e5a14d56ac9262ab8a919d@eucas1p2.samsung.com>

Add an entry for the common Innosilicon HDMI PHY library, which the
Rockchip and StarFive Innosilicon HDMI PHY drivers share, so that
changes to it reach the people who can test it.

Add an entry for the StarFive JH7110 HDMI PHY binding and driver, next
to the other JH7110 PHY drivers.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065de00c29cc02de16c38eac58ac5a1..118e13d5e4d9bdcad0561191128bf1b3e7975278 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13181,6 +13181,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/bridge/inno-hdmi.c
 F:	include/drm/bridge/inno_hdmi.h
 
+INNOSILICON HDMI PHY LIBRARY
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	drivers/phy/phy-inno-hdmi.c
+F:	include/linux/phy/inno-hdmi-phy.h
+
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
 R:	Amir Goldstein <amir73il@gmail.com>
@@ -26731,6 +26738,12 @@ S:	Supported
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

