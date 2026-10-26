Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010431;
	b=Gwk9I2ng3pleea2Gs6XiPfkegpbk0PyOTBuz+sO06CMwSUvV2paqfH36qEI14IrB2bRy
	 lU5AMH2Ydl35X1MuuiVpD7JKT3ZnG0cUGCcKhg4Jq5Cg0Ni4ORa4jhJR6Kgh59I2MewkT
	 a4FZcxggMBrY3gslW8gX2cPxgeWsZ85jelmosBVlFi4U6rKlQdCm3l9bbWGfA+ZPPlJvi
	 +gW2QQRU4FNrP7FGgj8mxiFQDClNkZiyvCqCWJGWXCvHkbJs8+4s5UnOOgoQWa2aKzoyj
	 eyMTweijEpQ/sLw3JSTD8EhvF+6CPCkTsEVeFHulN335wfz0hobfLroRBcSKqoyKMyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010431;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=L3zCdzaFnqr92HqxOIhABiGtfnkKrxT8Qw7ZJF1heKw=;
	b=m+cLrPGBnsY/KurTueXV+i8Ch4QCewyxd6SlJFfT4sfiXtMCFTI14/1n+c0OK2o+OTE5
	 yDLgTZoJ2gzrAZTWmabXyA53UuSgxg48+jfEDepNJ8UNg/SWserdhMNdV5tULjUtWMq3U
	 bST5FxAuWE7jCYFsi5FDJqd1NO/VibTiI/JTvrjKMkcpCF7mK6NhXRdGsXz/zZ5AIUjV1
	 AQtiTIuhU+/NA/NezSZzW1JKZ1wTe/IVLSW7JOhNBABx27gYwaLTmUc8hPMBRVkBgcXtN
	 F0nuK0nc+0X09bxHpnQF4428cNv/nkAqQNAEFEbn2JnAnMfxsg/WnHAsVo644+X0TVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Z1xHNKAB;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A78606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A78606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Z1xHNKAB
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026102708euoutp02cf9af64aa5e8b928e2da402b67656895~iDXw9jdnQ1184111841euoutp02h
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:27:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026102708euoutp02cf9af64aa5e8b928e2da402b67656895~iDXw9jdnQ1184111841euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793010428;
	bh=L3zCdzaFnqr92HqxOIhABiGtfnkKrxT8Qw7ZJF1heKw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Z1xHNKABldhF6JUPAGEqKDiHYHWJ4A5VbiX/p49L+F+TEGQVoq7kkseJ3BMkEDVVB
	 dLRzNzkzeoJePwRjrpLqEviKF4aNVZX0/+SmFUQmWcMTjm9h3e96F/qX9rXHPq1hoT
	 81EDkWRU5i8B0eRRvE75Gt2kb3uhG8lQlxAVUhfs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0~iDXwqqTkk1006410064eucas1p1s;
	Mon, 26 Oct 2026 10:27:08 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026102708eusmtip1cf9e71e47f149c4cde88c1788875cc34~iDXwRgeER0779707797eusmtip1M;
	Mon, 26 Oct 2026 10:27:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH] arm64: dts: exynos: tm2: fix wm5110 reset/ldoena GPIO
 properties
Date: Mon, 26 Oct 2026 11:26:56 +0100
Message-ID: <20261026102658.968138-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0
X-EPHeader: CA
X-CMS-RootMailID: 20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0
References: <CGME20261026102708eucas1p1dd4e054f4891f6ec94a16e9e53aa30b0@eucas1p1.samsung.com>

The wm5110 audio-codec node uses the legacy "wlf,reset" and
"wlf,ldoena" property names without the standard "-gpios" suffix.
gpiolib-of.c only recognizes these bare names as aliases for the
correct "wlf,reset-gpios"/"wlf,ldoena-gpios" properties, and that
alias support is compiled in only when CONFIG_MFD_ARIZONA and
CONFIG_REGULATOR_ARIZONA_LDO1 are enabled. When those options are
disabled, devm_gpiod_get() fails to find the GPIOs, leaving the
codec without a working reset/LDO enable line.

Rename the properties to the proper "-gpios" suffixed form so the
GPIOs are found unconditionally via the standard gpiolib lookup,
matching what drivers/mfd/arizona-core.c and
drivers/regulator/arizona-ldo1.c actually request.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 79eb47441819..e9ff42c4764c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1374,8 +1374,8 @@ wm5110: audio-codec@0 {
 		wlf,gpsw = <0x1>;
 		wlf,inmode = <2 0 2 0>;
 
-		wlf,reset = <&gpc0 7 GPIO_ACTIVE_HIGH>;
-		wlf,ldoena = <&gpf0 0 GPIO_ACTIVE_HIGH>;
+		wlf,reset-gpios = <&gpc0 7 GPIO_ACTIVE_HIGH>;
+		wlf,ldoena-gpios = <&gpf0 0 GPIO_ACTIVE_HIGH>;
 
 		/* core supplies */
 		AVDD-supply = <&ldo18_reg>;
-- 
2.43.0

