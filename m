Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639948;
	b=y7G6hnFoHuPQHRhhQ/V/lqrqLAD3ZQCHQ0maosoYS/rLZ93aFk9dF7w8UQw1CDzy7ru7
	 Y5rme9XqjLh28GlfzWPsHr/UkE5a10yymYOwXTxxRhDoCVSGmngQW4Y6Lnvg39AcT7/ZE
	 nnGqhbmlZ6w0IcBM/rWnEEU8rPJ7f4cvf+WU9AiV4QE3xQE8f2ZNbecFSbaLjnnNIaoSl
	 csFD8rjKl2nZ1UKhNZuSE0oEVCihxjWAqhyxTlv4sgQBs2Y0UhCPDelWossRmHGb0M6QD
	 OtA9tl8KGEZEt5pXFgRGS0MPUd+wWKsSLYqONlcBdGxeIkafaZt/qM3Fdmh/Aikzs+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
	b=YsuT4BzWxmEFxUidIUj2EbdL2Fos7hpj5oQzrkylLb0w0fWrP3PHvHtyjFInstYheeDq
	 ACYz7YnTx/zEWrAaJje7sNLLOdLv5rRTC4dhbKzCZKiGG/CmverawqBCtbbTA5LPkwsgB
	 IiyGYlcYubG9VQ/0ul2/KjjTdIhbeV/oFFow4971tafoeq1qAbGuJtR1TPCnyvZs9rCjo
	 T4ZJ33LmkiPzXoUlxkKfdS/xM35kRjY3g3FygExIkQuUKyJwwQ99Eu4au391c9bfyT5F/
	 0QOWXWSt9jT+zvI2PMabPj+u9m5+dEkKVOvTsmTPHNNFlHeW5q8UxfbpYfB8xcNbrwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nc7EBWvg;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB460850B3
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFB460850B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nc7EBWvg
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so2071025eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639947; x=1794244747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=nc7EBWvgF9nbBXHYDGcwSzFZUzPnwH3Wdi0zFd/gwQeGw4wz3gyXKKcRpnsfFroOU+
         1nvF1Ve9aIrld4xNsFJJpooiXMVH4LAV4d0hGMLxurJ6qCNUhDmeIyfmR5XsafLJ5X1c
         NOid7Gmww9K2UczXy53Icstp8kRpUHl7rUwdTiyVk0ClZlCLkOENUYsoJ1f/gLz+mH9E
         PSXTx+HZBj2xFXVGK+bKMrO6itab2ygIZrW2HX3XdngaNfBRIuvNAA9hEApBB9JOioKf
         d523+jMy7g9Q1EXB3h+IyieSCvEBwo9jOjVo2x3+pbPtutQWcvnN5lGdbr8PcTMZb/rD
         p7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639947; x=1794244747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=w2i32NGQDU7OOsN08IE8cAj3mIWh0l4m3hMjLWJQT2qhiNoYQXrBFA6Cs3aDqtdyYP
         Sduoplgcj+ZkeMGaEr0jWeRitTBwqos1Gss2tX6VslOo+3FDpjrioqhsyOabm/SBxAy1
         q3kQYQU0ur6oOFZgP4ypJMUtCrRc0KI5ENzuJ1ddRtXDuH5ax5IPtXvre4zBbFJ+6KDK
         YRWsW6tZkNjmNfkF3+L6CdJXyYemRLJHxn7UHh+mCdPB9xqJQLG6tYvACn9usBcyVbRD
         UTKN5zmUEceEdTgqvB1hRj0gwMtB1orGq35ZEGsqc64/wyEIZDrXQ1PWgoy4XBqqrOTY
         sedA==
X-Forwarded-Encrypted: i=1; AKwUvBxBLNo3g6Ltitr09AB2MhDgMIPPqk0gzRDy3qikOIJmoSx9kw60poXBYp6kedz0QkBoHtLpoBV+4e+R@vger.kernel.org
X-Gm-Message-State: APuU4Z/4lC1PqUjHsgudD2yYKDkjP4lzsjeUM3yFoaYLFGe2M/hcS93T
	IP0kBLDR/aKzvikSHycEIvp6S7O+WVGngGFNY4Ur5oVa7DhUbZKijhjK
X-Gm-Gg: AYBFou15aDDijVd3/Hq7NvF473p8tXzV+BG6i4Z/KsLV5qnQZH0jz6933m2+X0mLc6W
	+7jWc0aucEMFADZcQrDluby99ZhLjM2viPp1AvPPl0L4I252cPJ+Ibwpy6YsesxEbxawF5BjJE1
	RU1MUIC5CBxI4HBfrVbgho6sb6ug4N8lPraUpdxN4v9iRSP7Uq+mQO6DMAU4d+bizQfGJXf0wL+
	q6LRdOHiFPhopieQRV12AVDVD+TgswNx4lS8h6D/FhFkyF6yPmnY4UGpMlvetBt83+ohJd7DHP9
	qB7WTbExBjYFXsOYjroeXYSHmrv7qoB1xRF0dSz8JHcS2LpZ/B3Y8ereRAUjOk2HIXc+pbD87gZ
	Rd/PwpjKUPsqffN+Z7ZEvOBVj8LZGqngX/8E9UHYIQUqDLdhD31EOlDSLH41dGuuO07ih+7tBHQ
	X5EI5ErcOrcT8e2mFGkXoUNdK8/gvbE2GkBQs4rrHnPbj5YoyEFptAm8whj2ceXb1eVk/NLG4pa
	gQg2k4Ka84JLAG/f7JsoNuXnUWfimJf+Jzwb91O8WaQ0+bmbUBUT1KG5rG5Fc1TXeupHtxqmDzN
	nFjIYivlt558NvMJo/KCjDR+Rl0=
X-Received: by 2002:a05:693c:42d4:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36a42484fa3mr15445128eec.26.1793639947326;
        Mon, 02 Nov 2026 09:19:07 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:06 -0800 (PST)
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
Subject: [PATCH v2 3/6] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Tue,  3 Nov 2026 01:18:35 +0800
Message-ID: <20261102171838.2958552-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
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

