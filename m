Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639940;
	b=JCF0SiIFlRtE42WAQeZ/3p606iGtCCitloZo7Ne41Mru/GDx1zaU5XQEbQJMLgYyzt1p
	 7TnOV3olgfFtVgVA6ZpeT+wuqYng5civAOO6wRbFr/R2oFDJd8QkPbqBrlj5w4MjxaIvB
	 CJreGziRcem+QUUAfYfTa8jrgb5IgcBr249pJqcC2iuVSUaePMvfHAX7F8CM1a10mqZ8J
	 LmIQN+T+3pE93T4i/ag7dPf5KVhTlLaEvPIXhbrHv3DmtBdhrfwl7VM4ZeeZTpOPaxgEa
	 fRaEy7EvpLaEnzKVxqH11/jEZEeHS3O+T4h6jdYCPdO+Md2f0lFa/gtxEAqw3TNCXbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
	b=hzLVJtm+YDT+K2ALA5VIiyJBGdZs82Oi97O2or/+g/1ebIKLho0yD1Kjk6wl6Q4XPUo/
	 LRFXPLwsRsmH3WmnKPee2olqdkhooBoDeRJiGgU7MTj+KOdUz6E8YPaEWml/nSKRFsdXe
	 ny4ZoMtSaW7hYi6PInJ4adXjA8gfKHX0kXadQQKocoVeRjT1pIPz7LqENox0sZCKGmmF2
	 dKe55YRHbxByjf40Xrq9sgGYmw22Y18ERgDnhwZp08sJxd1lpKOiYPNdCVOgd/7QpjAxH
	 P+knz0emedugzYu/jqukHckSoglTSQNhG5NmkoCJuiRXedOK1Xgk0jolDD/0+AW2Bjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iNl28hm4;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFC1606BA45
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFC1606BA45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iNl28hm4
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so4496992eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639939; x=1794244739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=iNl28hm4ffxDnz3s5nRFxbvgTbN21jy3k6JLnY522gvwo8vcbqDIMDjSIc2Dm0WAMZ
         SKQa1Fb6fJKFTNghKGZ1UvjxsbXtX6bE2Dqpq8AozK0a6//AgvNg4wKPqycqIS8Ng67+
         ZCe1f4lJy68S9NgFuZ7zg6TsAjKNvlshnhrKCZhm0ZZ7Fa9twriqcQ5FdJUc5UTEiYT1
         0Nk3i7PPsHmTsEwoPUv6/tH22VwWAtyguSQTIFqDQ4APxL0NZ42zbgKOaKArddxlY+Gv
         YhYy7jJtR4H4yTL4H0G9zcz4Yn6Isd6uRADtVyCOeyC0hxMHfrnve3oL2VMUug9PdLkI
         mf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639939; x=1794244739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=1v9JLbEEjhD4+D1m+PPaJyyuacvbzHQeFsiN0QSVgjU9i1n0p+0xa12bilInSw1TgC
         GRlbbcMRUPs+9CVxA6b2BlD6dmaBkD6Fvuqeq7zyG+n0uJ5pW+CnxyliKs83GFHyVua5
         h7yy1Kot5nNleWVgLi92dBD9cDdXC3RWbQG7tTkFK1CQ/zIFmiMcCLnH2wwQeak/74M7
         TTScdo9Z53bJZXI/yr4PzPFYrc7WtpI/43Xzv4Rz5+E3+uq7F90JpWwkNSOqc3rtg7wV
         cBvRHS702KOY25x65zpcbREFy4+WXAUlGwHEMaNw4l2oiguh2DGjx/wpQHZrp4iD7M9n
         6LAA==
X-Forwarded-Encrypted: i=1; AKwUvBwUxeoVe+771fF0H3jBIW5qE+9qKjo2El8OC2D6lzjIfVEQrDu9WLgJlcHifLDSh39TSjFSG4tmWWFT@vger.kernel.org
X-Gm-Message-State: APuU4Z8wbrrD5SizEEA4DThrj21RzENbP/Iyj0M861vKN+4l/7I4xwtc
	vbFKlhG3j0LO+1chFqVJdWukB8Mkw93AsaYYCSOjv5GVCYxW8okiwSBM
X-Gm-Gg: AYBFou1VuAg2eKbaZnWYNCHeQKO25FQa8E2OHZR4eMO0Rl94jJezTMhtoGoRePUXXED
	paFFk3huWCc8LRj55/1B/dUEcXp82rMs2cvxmwWqJgu6mzxcoe4sYuo2VVGoR4WnA6jJLYPBp8K
	DxNdS9pK6rsnPihKBrDORQqaCZahkzI7UsToJhxLH5kV7xCBJpm+xxAZsWAn1h0mZfQnf04Zkfh
	B35n9NvrlOloqcw5A3CbVuoqeZKvhnPlQ3WLzRD89N+2rU9E1wEiDZ6AzHaj05dxsUbb5hPpWmj
	1l+9ir/WTEV4c22ZuWj10vdGVv3k63l+jHj0/yLobxUfQ7eThrDY7KCf2iAsrVRzAf8trB2sE3l
	NvAfnf/v26ZanhViJ1B1TC9fVoVp0+cxRad3pHEBZ47ETwQG+rW+hfUCInynzYWWZnIZWRDzSEn
	iIls0n0XOQj/ZBYSXUoe45d78EjKGpywHWZeqPsBhvRCws54bs9dwa1FuJaNOJsjIM5/qmr5Sg5
	Jy9enReHghJLT8vqTdNBmtSRgZBh3r2vxMcAmo3Dmfuju7g+x3CUwNDNUjosqgTwfbMMQJNoosS
	igJwxPKWgNml5gFboWd/HfyC4Dk=
X-Received: by 2002:a05:7300:fb02:b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-36a425f611cmr14286162eec.37.1793639938712;
        Mon, 02 Nov 2026 09:18:58 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:18:58 -0800 (PST)
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
Subject: [PATCH v2 1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Tue,  3 Nov 2026 01:18:33 +0800
Message-ID: <20261102171838.2958552-2-coiaprant@gmail.com>
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

