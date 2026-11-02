Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641504;
	b=rbcYy3VESXsVoGdJ1u+pltg0LBfY2zwrpXPVvx5eHTSLrc65Db/qvzMxtFgwWxgv5UtO
	 Hvy3bCqRwYreE2If73eLr3a5w8bGzTPSfZx3OMK93GiTyqWaAM0639kdtqMfc0efKZlN0
	 oc2bU04JGXxFIw4WCJj8P5uCnEg1RMPsZKwtnLhb849qfE5ygYdJkDGjhGop0JvPXQTTf
	 L5LzQlFpggE3NtsBfKOmHuOn4E2U+Xzp4/c2J2Wv0zOAfBtKp5irvP50x8WWAEM+pQ94m
	 f+c9Q6sDkdKuSA46yMuEG6HF1T5UhTO7b+Y+9vNKJtYcScfVTbjFHQ/r5gP5B7cvLfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
	b=SezV1gt5H4fJISyXiGlYi8lv/ofqPTxNbtqCBYIHal/aHtcZFJYdGzEzBFI4HyTYCO9R
	 SD8kSSCS6KW16kUyVBkMz7y2A28ITYxy6+/WXIwslY8N5fwoqLdXdZw1yvTnjYX8iRk77
	 zqQB8dnsdOqspohSs9/DesQQQ2sIvgKdLQNPQQwmz0cHmyZQyccg4Lh3OFpQL2SN5zJkx
	 BWm19hSsunsc9vS58BuA4/Tx8KUdjB3dsy179sN/wJBZCnSK2159urzcJZJKldGBaKu/j
	 mRv6dTj8mcjIXmlMYH8gv1gKT3851GceAAvCpTFfNmM5iR2ZBmwYgW4xjv7PL05GZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk3eopqB;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EE0606BA6D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EE0606BA6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk3eopqB
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1335070eec.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641503; x=1794246303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=Lk3eopqBg28WyHFLJDTTieCw7XdETdXHvXrK89W13ut6lyiXCcbbKpMA25Zz/c4z8y
         h91UAmTUeCKpyi1VO6PDKcBO+JY6ool/cxNLOfaIS71OWo4/Y65kdRmmTPS4kVFlGzy4
         2Em5u36QKr4BSQ14zXbYQT7wK7J8BTpu45U3g8u2XsmhDNQ2eJQf6c5u7u3p+ZkLzCzE
         xsI3D/F24dulapgfOvLIh+Iv8qNgi5YOkP2/ByBL7Bc1dQNb1XJIhPK2FdsLBBx/1bSw
         DqvyAuqf10+m342t4No701ztoWQnBKcnmkknXuig+KhEoAh/5KnHntw2/JS8nVytdGUx
         6MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641503; x=1794246303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=nyXqkPqdVFYLqAliPQkEPXfsLA20RjYLsud/A5LATOyqQM+QxGS8foPlHcvyKHX9N1
         uZLTDjCCncCZMsqJOR+eBHp/U/bfLJBoxINrGR+sqVfa3v3CwN7+zLnVfGoRRATpj03g
         RlpJsBvUA+a0b/fCdT6tAXhImFofvEs+03sXglj2YYOsXw4EpVWYkVa42nwiihEEcfAU
         i9Wfzlheyi0jmCklk10tnme2DIzoVDhfjqHq7bLFcYQnX2QG4XqsBL2ZEV6YCC8QLSuW
         GA11tY7Y7PcB7jP8Eoa0li1olRiz+Rewk25LqkYSdMxh9fZtptw+6Rb/fWJEpxWtqAbu
         9wxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdp9VEoGF9PrZZluYGXvMxvRJvtjAFRSdxipShPljDis+EVCpJWgASS9jYBcuwnh0qRmhznXRElce1@vger.kernel.org
X-Gm-Message-State: AFq9FYI6idbuRxh5N+Uh49Z8eQ7PBCB3Rd0+RIaBfn6QgW++VB22JJfJ
	WtdrBjRBsU2BWqLkCbiDuk24OP7Y/3ClmRNtAlqtzuEyngwFpdFNoOwG
X-Gm-Gg: AYBFou3TDXeV0Iz8uSswNVumGte1poo3jGnLrgxxH1sEsrmCpy1/TVtXjF5GwxNh+Ou
	9GKZlGrB6q1nIaaGslLRwguKatu01eCVbVLD3BC2UegsnkHXt/axT0BhdyugNzhRXupJro0ypsB
	bi80ER2LBTF7NkxObp+WAHW1Bnc5h3S1v5OlBx+DUCUiUhwR4skZeUnLSP6KpQDAvVm9eU97x8b
	aoBPXM3UrP454w9IIzUaLYwr5UyMnDsuSjNDjgNWwwpDUl7A7DwxRczHEHZZTCQDytsjYINWvfk
	n0/51f2ilMjTqm2Pj3VUe7mEBAw0yGgldcNkxN5yJNbPnzCEZRAe9TQUqJ8TRqufGNfKTL8mYx5
	YAvZ6EM26sMa6K71lCU+oXXUYYh2rWuzFEUaBAtW5N3dMDc7GH02UK+RlWzYsGG+Y6nQUu5ojjG
	81zLKHCO/5vnpPChqdqOdVCD1tVe8HPsaQw+KFtsTcefRLX8JEtQdfnACDiyCFqJiRwecJKxVVU
	/ge6ZraH63D2g6JJGyYliJK2hejwf852U1fTtEmPik6AL6doa31MOB+7LUvK55eOK6bAJGNcOke
	Gh9jDJE2msBwrYoOH3vJNGFGB9k=
X-Received: by 2002:a05:693c:88cc:10b0:369:d486:457f with SMTP id 5a478bee46e88-36a422195d3mr16266651eec.2.1793641503345;
        Mon, 02 Nov 2026 09:45:03 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:02 -0800 (PST)
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
Subject: [PATCH v3 1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Tue,  3 Nov 2026 01:44:45 +0800
Message-ID: <20261102174450.3000397-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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

Fixes: 156a530ed5ed ("arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
index 4903e32d0ead0..d94bc34a31e67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
@@ -268,7 +268,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -284,7 +284,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3

