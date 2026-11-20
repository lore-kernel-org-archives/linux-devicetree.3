Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171703;
	b=Hqz6DOvT6vnlVUD+8lmsIpz35Z7IMOwimy4I+ZORWEK8xaodil5WyrZolKf2VnM88f28
	 oZtfWdaR3vZXCbH4elf1cV8u76QDVSsJuQ9GlRzYte7CrcXfoG2rHK+lqsMENTYBKFOFB
	 xMWXdaI1LnEZ7QRiYCOXx5cBbnd3rSC5x9FpVHgKNXEmY4TZBVxuA8JnMN8TYcm9CB2AS
	 ksUbxKJVVGzguKKKBnkQLu2eSubu6q+NJgJ64ZLhF0BjzmEoH5NK+RgjCA59RtV4h6d/Q
	 4qfvoBLzBS2OFo/ZZiNkjJvYufOM66o5Uju2iqrn8rH0WRWXwP8CXNU07QHTVP1NTzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=K6vwty36fbvOEYt/rnRieouyTlj21/gT8dvewmNyeDo=;
	b=y4Mz0eb6leBZHpsuCi3YO9RgLipC7gLK/ab41L+ZbFxl07YIo60tMDjlqlAkw3nwVSBe
	 x8mA1bZlsGv2UXCpSDiYUvTqSOkJiw30zTluEpOC1xbljGuCmUtfF9DfdBnQJVLl6E5Ry
	 d55Gm/DOFgwn5hpwx62xBr3S5xLPXAIrxrVn9i+xCxibfG/V8G1WrNTUe0dlSG6Zc15hG
	 LwJtp8btQHUv1EdKCppC1JjD8XR4Lje+hTm3/9Ptv+bYalcQjvmUx7r7H6l6IM1ZoPbOh
	 Xc1JwwH73sFkKBCsL80+/pQYTk7gBNZWC03Tx/2DeQ04y9K7EfWo1sPD1gCJNHylecg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=qACo1au7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D01606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D01606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=qACo1au7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5483305e9.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795171701; x=1795776501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6vwty36fbvOEYt/rnRieouyTlj21/gT8dvewmNyeDo=;
        b=qACo1au7FayZSaQIXKv+3ALW46gO9rDoYy3YvbUWI0h1Cr/Q3GOlsdgitq/rvo7iSC
         qW4jugrEASP5Q8RSKvfFexNwmSwNvQhBFnDDVtxZcnHjsR9Mi/6+XHPQnotxQv76PejU
         xpRLKPM3K0P8ZEEwKOb6Tu2YIHT+wXgWrH+3W8rf7a9yN4YrbSlZSyyOR6fADj8OleC8
         2EaT++R26K3nY5jG4nlQvO4ilwOy3HeF48zkdqbNd/SMGhJeSIP0lKOTUsKtvNurlHs0
         ZTzlhmE6rmmnlykAKmsrhTPJW9JgBAYfkR3f+8xRpYEYhrhJf+fPxn5N0AtxRgRU6c/H
         lR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171701; x=1795776501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6vwty36fbvOEYt/rnRieouyTlj21/gT8dvewmNyeDo=;
        b=ZbfJ2SLwD/RX9nhMmE8GXIhBLVzudARvUPvYfLL6ia0WwX6WeGcgSb0ibeK+VuQzNl
         2RNCusrOaT9RWc3v8FoJCj5rGeusRIHD64L0l3Fui6tR/ml8GH5u8rZP6q/8FEA56NQT
         BYqdOX03vQPJy6mBAU0t0sIKK0f9m5lZS2Ph3ti2J02mTRNCva+qOgAh3mPMtgKJW7E0
         YLrWwvTXhiKzDW70lSGfbNMDTzT0/FGu0K5D3freF5FJBVInRH6MLSCY922vkMg/vyYV
         3VinptOTf5UG17oZeiNJWwHP4+MrA0vFw5Jt1lkPZN1++g0phzBsMF4VjaR31iPb3lhc
         jl1A==
X-Gm-Message-State: APuU4Z8BkHqiPUK2jPyUtia7J1+C/BAVp3fJgOF0t53Gcko6bfgxgO6B
	NJlEUDZI7NY2y5U76SSvajc+i7Wy5R+H4kGKb/1xoNp9/bDkqVlTroUC9Vfd+LvtipM=
X-Gm-Gg: AYBFou0IZSqWvCIlI4QtZbmxn2mWXeK1qKK2nN/78TtjCCwxVlqBPHkG7nVvjXpq0vc
	OqI0+AUAnBNhhM67hcuVFoTzOHsH2uBW51/mcKyvUKoEvujN2RejqRhiFaBLXtSBsrIDXHpmpJq
	/zJMvL96zZXNtpgLd9GVcW/UMny/khWQSbSuZrfUSgeQ0L4vYt6P6vRIo65ve/LlI25Y3C6VXhH
	9yA8oiE9RCpSSiGr9Q+bBwSmvuXVKcWQdlQU02FzvDhS0YFcp3/Pf3/ezem1q9Z7s9Yu7o2soVl
	rEycWEH5wumDy2bBfHOImplBoZKsPZFiFJSKz3IeY9Gy56UWUajedBRHkGt88IBtEgPTHueERb5
	cqp5lEo+ik7eHz6ModUU8yFlH5muC1ggAqHt5AXVIiRCr1yPFJz5v/qLic6NteZbNERdw1P/ITD
	KcLAIpEBwyefN7PtMOvuRTnNCC+fAY4g9teVVNXeBbJNUFdVf4TPYmNw6BjOs7KRKUbWJRj1XaE
	RbrVQTQSz/0jXD76CIo1Opu9gLQI4J6rTQHwxzB4SC6V81bKjTIUe95R/pYYWJ13/eSPeBpyS9B
	QK6pM4nMZP5sS7OqAmE4xvUux+fohI41yc1XolE5OBZbV6qdD7diLwrQBbKk6zHJ0YKZNooo8wZ
	EA1HjEhYN
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr52978715e9.9.1795171701461;
        Fri, 20 Nov 2026 02:48:21 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f14f1esm38161425e9.2.2026.11.20.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:48:21 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 14:48:10 +0400
Subject: [PATCH 2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by
 their ID
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rk3576-phys-v1-2-6382cd14e3dc@flipper.net>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
In-Reply-To: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=alchark@flipper.net;
 h=from:subject:message-id; bh=aEOUC6ekrPOrGiTuRYNi1p8Y9du8BazFw7AJD/RWz+U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQzqObG6x98WmKwc/vhWVP3Jn/R9C/Odpb4pp/5Md1ta
 v4F65vnOiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqaREM/8OWT/j+ZRmPzg7xvSc+/c8/2fkg1lin78yXtcElTnc0toQyMuy6FtA
 3pfr/wXWCjHNufhHL/Bw697/nvmCNznSRuKRaZU4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Both Sige5 GMACs connect to an RTL8211F PHY (ID 0x001cc916) with its
reset line in the PHY node. With only the generic C22 compatible, an OS
has to read the PHY ID registers before it can bind a driver, and only
that driver releases the reset line. Unless an earlier boot stage has
already released it, the PHY stays in reset, never answers on MDIO, and
neither Ethernet port comes up. Booting straight from U-Boot SPL in
Falcon mode hits exactly that.

Name the PHY by its ID, so it binds without the ID read and comes out of
reset as it does. Name the node ethernet-phy@1 as well, as the Realtek
PHY binding the ID compatible selects requires.

Fixes: 40f742b07ab2 ("arm64: dts: rockchip: Add rk3576-armsom-sige5 board")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index c5b2f22402f5..b8547395c608 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -775,8 +775,8 @@ es8388: audio-codec@10 {
 };
 
 &mdio0 {
-	rgmii_phy0: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac0_rst>;
@@ -787,8 +787,8 @@ rgmii_phy0: phy@1 {
 };
 
 &mdio1 {
-	rgmii_phy1: phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_rst>;

-- 
2.56.0

