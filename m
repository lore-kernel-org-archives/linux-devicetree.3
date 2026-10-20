Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479006;
	b=Z1yIBeFnJoby5kGbhmiTVsOh90tTBwu0yrf5T/9Fz8hd4HJpMYv5LxwHuzkUCX6R5RKU
	 ReFpacEeCvVSFzG63WFE6dmQ+JmOE6E5PjSARUmjrS29MSzSeYMHr81Yjnp7QExDbqGxq
	 uPDcQL+UGzTmoPAs0CzK4wumTTEY3PLSamWt21Ygld+Tb84U5blW00Lnt4BHP54h1oFCm
	 uGA2Ol1uTDI8ceLMjfNlOjpeh38GXCC3UU7N48QD5hmjbGby+9SaUEYmMwX0TiLcU0CF8
	 PHghESN6Bo5NEU2QtkuR9WT6FvlBLSqskCfgAltxgGTZ6xEnAnMzf/y+1kmAoD+75aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479006;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	b=ZG6mNYZD4N75sIZA5DxA5qxn0P7JQynWXgbd58IXUIjAOWcBNjZ0tzhfs4arhqg568Rt
	 fiT4HJ8RYxHJCED4o4VprdYZgqmN7kG88AXM9hiRZ+w6g5xHYcgSTfK/NnuKIeKYlF40p
	 4biQ/QEOIuMjcdGkX/GWmJ7xJVIhHbx9nqdrjixJvKKzsxbhjsNrbeCrHL4NUKf9Dyafx
	 /27koRPtkvrdQGQ1XX54ktq3vE+dRPm/CvdRyzjOuPKF0CwVyKzF/EN26x9mYZVZ5NNHf
	 WCweH8reO2lEcSMWxBTU4mpMy3sUepdYKTq3YsfD06ph+vUDHnZ14yooJC8M0eJSTZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="K4La02/7";
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB28606A328
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB28606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=K4La02/7
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261020065003epoutp0322678832796637ab0daa667ca5753ddc~gKigzoemQ0526605266epoutp03l
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:50:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261020065003epoutp0322678832796637ab0daa667ca5753ddc~gKigzoemQ0526605266epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792479003;
	bh=1hJ0aQ7fGA2QuLMADJWwMmxygYV3IJuA53iBt1oJi10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4La02/7uL8hYSw1rOZzAu76bVFJxuVjbCVA/CxuXwy+txENIbaZEbIQyAYQ54cOS
	 nH9AoWVihRE2WQ6urrS6nqSZ9K6wFwESy0TuOsrDH+qC+TTl7cm+81NIxXLYexta16
	 tH1ffbegYU0D+QehEQCbAecSSpBy97MIy1HI1Vt0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261020065003epcas5p494ef041799fe8dee90182375c6f60d23~gKigS9rM60089400894epcas5p4X;
	Tue, 20 Oct 2026 06:50:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j83222PKMz6B9m9; Tue, 20 Oct
	2026 06:50:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c~gKYiu_9-42333523335epcas5p2K;
	Tue, 20 Oct 2026 06:38:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063836epsmtip17c0d399fee97e034ef9399f4af327565~gKYgVQ_pD0324703247epsmtip13;
	Tue, 20 Oct 2026 06:38:36 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 14/14] arm64: dts: exynos8855: add cmu_usb clock DT nodes
Date: Tue, 20 Oct 2026 12:25:58 +0530
Message-Id: <20261020065558.1829402-15-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020065558.1829402-1-raghav.s@samsung.com>
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
X-CMS-MailID: 20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c
References: <20261020065558.1829402-1-raghav.s@samsung.com>
	<CGME20261020063838epcas5p29bad3adea6f1dff99c3362a3d5d4094c@epcas5p2.samsung.com>

Add required dt node for cmu_usb block, while at this
add sysreg_usb which contains bits for DRCG and MEMCLK
which are used by clk driver

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 3dd7a4c4c609..dcf1e58c6367 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_usb: clock-controller@13000000 {
+			compatible = "samsung,exynos8855-cmu-usb";
+			reg = <0x13000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_USB_NOC>,
+				 <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
+			clock-names = "oscclk",
+				      "bus",
+				      "usb20drd";
+			samsung,sysreg = <&sysreg_usb>;
+		};
+
+		sysreg_usb: syscon@13020000 {
+			compatible = "samsung,exynos8855-usb-sysreg",
+				      "syscon";
+			reg = <0x13020000 0x10000>;
+			clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
+		};
+
 		cmu_top: clock-controller@13900000 {
 			compatible = "samsung,exynos8855-cmu-top";
 			reg = <0x13900000 0x10000>;
-- 
2.34.1

