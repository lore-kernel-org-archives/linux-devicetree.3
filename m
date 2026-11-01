Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561387;
	b=TKYvZQ7HJ62oaY2ZPRbThWvi+RDsTJ2LfQqDADOD3lHFvnAq9LpioWi1Hy9JfYOJNHIt
	 /ILSZFpDJoH9AVN82xHYwTwR4TvcCxWRfj2EcTKmJlaPVSipYNo8ubEgft2E/Z2blxG0H
	 4Qpi1VHj3LfqdQ6ZlD+vxQDahOtMZNV0P5wdpApQpP+SU2Bn1bbS2aFbYdrZub5b5aUPa
	 VLrL8Xg3NyhVxQNHc3z+0WgcpqJ2E77UbludOA/VDiUmtO9M852lmzhnap3SBRDwr50/q
	 JaxRP8WSnFniunBIGLMUeMEwEymeuTguyFvhrc81JKjVOoUTQ2HUAfpFhCfK5jifSDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
	b=bZEU5YuK4/HUwucTKA8lvAqjBLVRPIxfMdV6Cfu6a4GLbV4esvJf8MBQosTkPPezm1td
	 osuZ9LgoK1kulFwcv2gSYQEr4cnYzaNIATrIXPZaYQ8wyu18pvu6/v1qqKgkRdwAsk1o0
	 JzTgCqXzqqi7oNCIJ92J/nr4gqoxnjMoKhDbBnK7gLZmtTQ19zjS4hIUpWIeHlbMquU+u
	 sF7qI7jLXtsEHMeypunomY8G6I2MV05xUr1ACRS9gDtN2ve4fol3kC1gYW6R0uMFFIxAR
	 aBkMhzdSot+NYKyNdgTZ3jykrYvmwYlOLlcpJKAR58qQzLXfa6SDvMa2KcO1tYB3g+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrr9spFG;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D82606A33D
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D82606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrr9spFG
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1059226eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561386; x=1794166186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=xrr9spFGBGhiIPVJRbIN2OfMVYgBUZesNXl1d8viZPSIz6U9gr9bAA7V7nawDN+VW7
         ZtJAuQd6ANZ2AQXt1LMnMAqDV6UC2gsQ86UIDtm0MEnmhibpNzVWIlqFy9yXTL3wwbwb
         3Xv22B1GbqEEst93GK8Snc8YL702IEows8QdmYRuXMoPYGQUEs51K2fiyfLr7eY7bCpt
         QrK6fjckD0dhgHYv6sZ9Lqc1Q6lB6MjQPcZDLi/Ry8lJ23n0B/yxiichfkE1GrDkGRFM
         HIi5/ryyCupcFUCKnsG2AVnauHsNXwr+2B/P0i4hmFKbNNrlUogtR8rfEDvQ/kXOGOt1
         L94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561386; x=1794166186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=bmahmRnmFq8eRQmgxM9d7kGauRNrJLzynYIbznzBxgLRIjTvFh3Ap4Jo1Zpf05/mQV
         JlsqtAMa1IRA++506LnSMPoaq6eIQVGKQIo9OuXQHGuX/MLpV1AhCNSKxUltnA87vNU/
         QztouPZOBqq/eStSLowvJbK+2z7OdoW9bgCZDH+IfJdnBFtcLkFC7wGmBtJZz3W25LP/
         dbtbp8pu1sJ+lgHMGRPJf639Q6qw5A8viglM4mzCJ2PF10dLOvnZlRT2iokBIbTCL/OW
         c75cUAz29D+/tnNZ5YTlg3R4dPbJ6sAkf49yPJsyc0ptb5E1nk4sUvxw+8VHfpFBH1mg
         yrYA==
X-Forwarded-Encrypted: i=1; AKwUvByYSaFl+fOgifr5ezKDhFlscvMz032+hL3+1je/2gglYUadkeIL061CQpmE6OShBCQnoF/FgoRPjCGS@vger.kernel.org
X-Gm-Message-State: APuU4Z/yuotOikVekk0aZUUQJucfKfEMpAQg6KFjH+itLRfGXjmHE2Jw
	1NO5BuzLMyr4l8Aiw5WB/SWKFlGJAwGltIoj+woNUYG1XoJGXmSRv59x
X-Gm-Gg: AYBFou2gJydbJaqgZQHgyl1KMng5EERQ3wbuD5TJ3za6NMIHp+F0wS0vVVlLbBDbioi
	DDRVvQTWVXjLYpdPHI4VnyMKo1Sdju9q/EWRj2BhFymUroznnN97SVn5ucE9yZi3seWjsio3qPe
	0Vm0Rhzb47dkuuXteAsKQp7DSzz4nGNkfY2and9Ohl3xHMioGda9ZpmozOUlh+8D2/feTs2KLgn
	typIgGZhSOft0MEArWe2gWPHeyq74Rgfc+0CAyFMZtWHqZrAv6y8u0FVJsiTTotduWDeC2RhPdx
	wAeH4gLQxtF0gRF7nvkfffZIfk1CVM41zMlqvrLUZO+0I49dnkhFfl1BVgrAgEkrkgR4d7gRjKr
	xfL5hwVdrf8soh29S7CHrYnmBcvHpn4eBC6JeTLl3L3ZHRPv5ORb5SbAYyAwLZngwrK68TFRRUz
	ZaJfIKNYtY4Xjge5qseH/l+4eoE6AMVJ+0AS6sAEZvU00SCwBvVSgYlTzldAZjRHqA6ZQNd3mSW
	ItQyar1U/t/R0/sWfwUGupK5g3nAn+Yj3/c9BlrVoWgntsd9spFgiAjcTfJZBvFFp2SMKk0Jf0U
	TPt7i/ip4tHo90o3OLFxmLcQFLY=
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr13721930eec.31.1793561385680;
        Sun, 01 Nov 2026 11:29:45 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:45 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH 3/5] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Mon,  2 Nov 2026 03:28:05 +0800
Message-ID: <20261101192807.897562-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
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

Both GMAC nodes rely on the internal 125 MHz GMAC main clock, but
neither pins its rate explicitly. Add assigned-clock-rates = <0>,
<125000000> so SCLK_GMACx is fixed at 125 MHz instead of whatever the
bootloader or the hardware reset left. The RGMII speed clock
(SCLK_GMACx_RX_TX) stays at 0, since it is managed at runtime by
rk_set_clk_tx_rate().

For gmac0, also switch clock_in_out from "input" to "output". The port
uses a fixed-link, and there is no external 125 MHz clock feeding the
MAC, so "input" described a clock source that is not wired up. Note
that on RK3568 clock_in_out does not change the hardware clock routing
today (rk3568_ops has no io_clksel masks), so this corrects the
description rather than the behaviour.

Fixes: f901aaadaa2a ("arm64: dts: rockchip: Add Bananapi R2 Pro")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90ba..677b6261a3a1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -206,7 +206,8 @@ &combphy2 {
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
-	clock_in_out = "input";
+	assigned-clock-rates = <0>, <125000000>;
+	clock_in_out = "output";
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
@@ -232,6 +233,7 @@ fixed-link {
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
 	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
+	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii";
-- 
2.47.3

