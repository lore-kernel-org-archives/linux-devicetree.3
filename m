Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561382;
	b=VnygeWbLOC+lU8h5oaNCBc0WPkTRncyP2SAoer+Mw62A40FEhTYl3Bu1jnIcrphl8CMP
	 jUgAQC3xXdGnjeg0wDOgAKVF3cfEQVy7OiIo+9WxMb++LFZ/tjQXd7aB9GAmaYJBZk93s
	 ElIm5MQ/YgePCJbGgldKNYtKnoR2uyXmz3eJXfl5/OUIxMIzVL4j0/jhXUVjIcC/KzcCa
	 BzMc5rTFa0wG5ee2DK8u0e25Y64SZEsNojESTOS46eID9AGaN0XL/j0OZkyS26iX2baGG
	 ChxFyg7H9dFyHeW48r42NTJc3WDdrxaAMvgs2xQfbmJrjtomo8iu2VN2i2Yo5B9iPiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
	b=yPZO3vgMGy2L6YXnhQPaIfrVj8OPpO72FG1uup8DACr9n9ZVScRs0sPzteczL0StbDGa
	 SRF/5e16+80dmohWN24X3V5KdxL+aT54gOct3MdgQ5V8ZoEmh5nXkYtwqH/kQgj0Jds2o
	 nY/LNClBVbrCYsYMg+ygS0/YNiF7FO3WUXyl1wiWyP7NK9bqcyVYdhMlkS2GWLrmYxdBj
	 /2lBzlu8bmI6rzlCsdQFgUB9R7yJb6EDA7xEjpIk2zUPtEpFPicBIK1HSE4tIYQBoz2kb
	 AxvEM3p+Hx0ZJmyB1g4CcTTevJRpRniHbd0Zg0bTADBTFmOQ0lXmKh7baeZdkpJXb4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiNfHm2H;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88525606A335
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88525606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiNfHm2H
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so3125767eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561382; x=1794166182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=SiNfHm2H39UH5lWSX8ZjN/MLpLX3ymy/kFYm1Q8tNHmkyp0uLz4qH/wT9sVJVNC2LT
         Qu9K0184ekK6F10kbCQcic0HuN8Y4QKU7vZNMGXOxoujjXcqEdjaoPXV8ISPSaCUv5/+
         euBfuP4wI/7Ato89hrKqLjvKlj2c4BjM+0R98HWmQernjhRMCTGQmR3KISK2OKiOl344
         j5sMmJdacsrISfr/Edzyq8tKwJUEfzuZ73TZI5SbfPiXLASl+ZKXkBVWK7rhpl+tsdVo
         HIqPcrjg4cX/cp+r91Np4I3I40pdYm+vk9fRg3Dhjftq2q1P6DakQzcIo2O/Jr3myWc7
         SzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561382; x=1794166182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=x/DXPyMwRPyS0D9t1lzwG62V1ZjAvCf4JfKMHvsDp/ibH1AVyA/VCTEAObDdvCEXhA
         G/h+RbBc8s6pNO+KpLvzYPaMALkkGfitoz/GBfv7g0+ori9qHBWNJThy67WVQOBkctmf
         G6B2gO4gZ8WFMIXyLvITT8k5vH9aa3YOZjzazPh5FcP0nx/XoTbUXJsm/IVAbrWuLNlT
         GdEW2Zu6olac/kos62ucsHngU1eTmiIuiu7+IVlDxGMufqONa6WwJ/xUxs5q4uVWCi+O
         ak2r/UmnZDkgQUvhnRIYXLrDHw6t4e4pmHXvIxH1V59KlkWsK6CzMx3gPKfrAYcGJ7O8
         vKAg==
X-Forwarded-Encrypted: i=1; AKwUvBzAxHr/3nn6C834QQlT2IsmOx2FlYlX3HnIb7+U7EAXmHTzA6yb9C/Xawd633Gljw8dPKPNi5h6yHkx@vger.kernel.org
X-Gm-Message-State: APuU4Z8KEnazN/cdf2duPMgPH9mUuXDvHsV/CsUU5/T39l4BRsdPA7xB
	loIDsk//0IFZ1CirDP7qm9kXZprMP2+n3nLAP1YsWe5tTBc2taHYaUaW
X-Gm-Gg: AYBFou1bEQuBDOpwZeL5kpig0K1rJIFYRflBhSbF9wUKWXa/iahTrD9o0Dm06VLNhUn
	Ziv3HnHnI5aAe6eXbVV0Y2G3nYPRpsKZ9VRPV2mSBw/SvVKt0gHBXnQWKqlv65BXX60VDiM8tPm
	bQhAeSephGSGtkqCLHWNc+wO+EGVQspqQSKOr2hqrdZs9uThc0B3YIq2zcm9bbEZp9Se6WEQSx0
	uEjzW/4mc7EeTPAG0hrX9uEO9SEXhuOygIV++hqOqECVFyonFqiyNlm+EEl5d3hd4YJdL4qaMa2
	TAzeHZTUmXy6qZJzIoIqn/EDxQr8PeEeNGJRKNyJPkR2dMedjCTxiMJYHHAdIFbvFvVINOeJ+Zi
	p0DcDWEM6N3hNCSteKRaSyiy1MYfI3vz6oY+9VJaJFbMz639XbMuUU6xuwp1Yrq9/o4TwCjqF/m
	66pXIuTWxWWDnMeMMAeqWmqvGqPHktk8EUKA5IdFDsfslwnCrtUN4ILjE+aD2LHbtHiqtUGydqL
	oelLFD3sibaOhthAxvqnkS63Cahm/668GGjBn+Mi6R8F1/IPn9MWN48hlBDYakEd+GOOxpAm4SW
	/5m08ek3/zbtL5FpP14pIsduRS0=
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr19592157eec.28.1793561381531;
        Sun, 01 Nov 2026 11:29:41 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:41 -0800 (PST)
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
Subject: [PATCH 2/5] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Mon,  2 Nov 2026 03:28:04 +0800
Message-ID: <20261101192807.897562-3-coiaprant@gmail.com>
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

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: f296bb503a24 ("arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
index 4c55c7d211599..07cfc68b5f91b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
@@ -280,7 +280,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -296,7 +296,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3

