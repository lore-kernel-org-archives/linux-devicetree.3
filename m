Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639953;
	b=yysU3WQZV1j/RpAkJCfA0HvGfes6BqVTwLmmCxcKmEuzxNwRHplBxxEOzJc1y44JCObq
	 nNHid53fz0qyNpJ3NSNV07D6d1TGNguJ7dH3mO86AAGuZna2ufhx17vZhMhgpcyjJH3K9
	 jin5n1Bw5v4mMCTLJX8hzPlujkervgoggXpJR6f7ni6aDtc5gWFfG7eKD/+b6T2irNV9s
	 kS3RoD/WmX2/wy6+L0Wi8vY2qPno4lU4j02ku6yIRPbLSGbUB0aiaB6iK8oK03w/eupFg
	 CAthjTLE+dm/dsvNqv9VLBmJLQl173PLALWZLM6lsI8L//ZHDWk1JqW4li2fK2ZB7ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
	b=UHA4SCDF8eKCKQ5aW2iQUy/fpSsgVc/EdrzYUgv2RXCQlFUpHX2/GyvgxtQvyE0/2drm
	 J6eDg1U4pyG4PkSh7jxe48Z/rd60xBC//YpSYSsELs3I5WiNi/L1j/4lNSUiXNOlA4TQ2
	 SoP4heiTOxQz8gd5PXyFmJCkYHOSnNZGejDKQFK4TTAH2MXWXvWOUu2QYCe0G3SePvely
	 8/XtKcGdnw0B3oBlSoP6mDXLaluTVrWnCHZ00aGjgxSY3bMH9Bs0mY/LQALV0sqYcrw3B
	 lXnKex6chAulsweWiz2+yXWudNNtLLZfSs8qt0VRh9Ti/DZa5sHpDyc4sfOg3G6QNCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wqJh3z/e";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8B60850B4
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C8B60850B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqJh3z/e
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1986258eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639952; x=1794244752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=wqJh3z/exiU3Y/hR6t0pi660C6t5oEFAT2H80uPgrLHfpVmDceZ4RcvgrhR4eRtBOU
         c2c0u+iaiefkPR94sRsesg0ZztBXi8QWAxJ1H6XL6JJ+3Nwc3fj4MEVbyM3v4so1B23b
         FTNXXmGC8pUwyrKTHoXmAMUN3QQ3Y48RR/wy+BQStzOCk0gdAPKUOotgN8tFrJAzcRHh
         cvdzYG0/TXBoVoRiT3R+thLQRCtyw08cl0IdUzC/+622TiZUHYvrzVucA4F3rN1cIYgq
         M9a4RrhvaNeXV/7yeaBtAX3obkIE7LZqk9osUiuG8dNf3MtgE3rhLgLn4oqo3LQdJKyo
         0dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639952; x=1794244752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=mLst9FquWaadNlK+6wuRW4qse4ZbNMXDMghBF2tj02ZDSw7l40g8MItxamMdC5dCXr
         gPT4c1gWOFYSrnJLqeA8qWRrcqJuhircyqw71r2Zh5icVOrcZJj2yH3/K0FNCjnBGTSp
         +S6F7N9OTpQ+PKhP87GSEMwF7M63QCRQIWSVhaWnf7AM+h9HCC2nJ7IvnCPfmjDNRfVV
         B/eGYI2dN5pwE9va7AWedCpNR/lDsERLtaAGDsohCCjKXULVln6zYOb/rpSGdIaPYCG/
         /WCWRnFPGIkYl+yiRiWzaaGCsK2vyLNX8j4mNo8+cT8ehykM/9tZHiU52g1EULL+mE6w
         gLMw==
X-Forwarded-Encrypted: i=1; AKwUvBzSZ6q4qY/bb4yjRizN5SdT8zzHlgoF8s0hXIAchxHcGUYON9P50YnRpooJTArTlj6T0oMq9IlhcPeB@vger.kernel.org
X-Gm-Message-State: APuU4Z/F1as6agaJdgLuinQBhJofxLTyEn/A89fd0jHi1/IMp3B/D8Dq
	YcZF+kFHoqnVOvWnOYs1OaYHpXiyleGitrpnh44peZWAOofsSUwfap4f
X-Gm-Gg: AYBFou1KM4/e/9XRT63wjNUSjho0hT+BFgMrjRAl2Knqi2E2OG3b335WtL9iNivy4La
	eNVX5Boz9cW5kspYI3kYeuzGFNQ8KznGziN0DNCjvZ2j3CgtsA3O+MkRS3eLhhIZMDL/kzhoZjM
	GH4sADreS8Fd49c1fYQPDS8e5LXFSXgVZkvynWPKEN53iGtPcqly4kw7dD++5xbIFUpBMBsM9/S
	qSaEMh29SYgundzQhOIbboFspwR3NTwbeIRDYyKX+26+yUG+sfoPneLtAKkLeOq9DY9jCJhy53F
	mcRitLlyykR+aKfqdKoMSXg3SMI+sDXtz7Jsko6Qnws/bq9BqSIdJkdhcsYvuC9nO6e63hTR0l4
	g8Ev7YI5pt8mBPUQdcsEWC6HDupkkDmWjRPRIoRejINOK7CwgDYS46banPT0qU76BnsmoQ/n9V3
	u/JrYvmkXbdTatGmk2G0L7F0yreLR7Iq67yFlEaV20iX2OY3Yw+QUD2/Or74sEH+72dPKvThscg
	pDBKFzWmlbIU7h7uZemBPCpPF6enNTcm9aro0NVnd4u1y94ajLB/Lb35jjvuqrkv9hh8VT+VIEI
	8ntdrJQmgAiX7/LJE8hWYiuLZ6w=
X-Received: by 2002:a05:7300:4717:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-36a423f4253mr16154942eec.32.1793639952051;
        Mon, 02 Nov 2026 09:19:12 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:11 -0800 (PST)
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
Subject: [PATCH v2 4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Tue,  3 Nov 2026 01:18:36 +0800
Message-ID: <20261102171838.2958552-5-coiaprant@gmail.com>
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

The RGMII WAN port on the Ariaboard Photonicat uses SCLK_GMAC1 as the
GMAC main clock and SCLK_GMAC1_RX_TX as the RGMII speed clock. Only the
parent of SCLK_GMAC1_RX_TX is set, so SCLK_GMAC1 keeps whatever parent
the bootloader or the hardware reset left.

Set the parent of SCLK_GMAC1 to CLK_MAC1_2TOP explicitly, so the GMAC
main clock always uses the internal source and does not depend on the
bootloader state. The rate assignment is unchanged: SCLK_GMAC1_RX_TX
keeps its rate unset, SCLK_GMAC1 stays at 125 MHz.

Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index b719d5b661c43..7e0a2ab829209 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,7 +285,7 @@ &gmac0 {
 /* Motorcomm YT8521SC WAN port */
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
-- 
2.47.3

