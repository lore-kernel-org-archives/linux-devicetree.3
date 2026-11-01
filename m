Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561375;
	b=zcr0uX5X66+uQ9WqCfO0+fZYMTDMsC+cXGyVSaTRwECQ5MapktkqFDQDixPs+89R7mBD
	 tWfog9calMQrfUudZxoEROttUbqgu1eWjg//nL2mMKn0x1TnTEOv+cFbeZmDrouv2eT/I
	 TyJVJXZaH57XNnKQyzNM0bqrsExnWnXeWWrw0AggFUlYKWiF5hzJ4I2m0RjV7Qgfb0k4u
	 Y9LHYwFUo+AdRzc4Gzvs5g2OVusEBdrtDnwvmpfh0fU4oLcNemfhCFe0MRhwf/MqLmvKR
	 7fNXYQulGVGjrVBXO8Vpn8Jalr+zv/cWBLWXoJKG15ueSGahZRA3+Ewsfe6fIAGPmvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
	b=F7B6VT9GN2XNvO0bKOXtnRBbgTREdgPONbD1db9STP1DgozmteN0Cuu4d10vFSVzMRPz
	 cHKxbRP57QE/IohiFyKBaQvpMhmD/hJnj2weWZzrysIsungi0SfFakJyaap2h90ijAz1X
	 Pzt5jfQg6gTpFBv6b81/jkXxHDycxk9K+EKN21FB/tqI6KXdZ1lKseWf6sLnQ5ie6xTe4
	 gEk13xXz5gYRywa3RzHlcuJF3BksXhTWyqmLKCd48yfaFsUvV9i9za20lTuf+X08Jz2z7
	 oLHeKyS1bheDTg2icP1zMPnd1ukJz/Y74f+k+VJcn/l3QkI6RdGb3Z+kvNUnKEQx8Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBWtmS4v;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68310606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68310606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBWtmS4v
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1059212eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561373; x=1794166173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
        b=VBWtmS4vyfAc2ajQC7AeTP7aX7Nqvc6OM/5Z11jf/xf6lcsVQEtZJR9KBHaPyhuRSY
         dAcLYi00hXQJAI3HzIvQHICwBwmbkywMuoH/1nIwDSdRV8oVKdRJs7odiR2W88IdCbvN
         GKubtlNyb9g0O/VePS1rH9KbacSKGujP/0s2ax0aELfhS/aUf6e460VKE/XbYYK7QAQ3
         XcOJsvspUPXBC4iR3oHBrB8G73bRDhctQmBJql1y/66MjP/DsSVbY6DZgAmi3SPEuVl+
         Lv8w74Yr1Cwnw6J4EqX+N0W6V5432wRXey0ToUqr6aUYRljcAu3jsoZhyTL3n+23zAbv
         mLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561373; x=1794166173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
        b=o+MRvnN5i6htK0zVOOW7voik4ET/QGf31DiEgUR0/HwJ2rLPIaBZ5rgBe5zrW8HbiM
         XPjp8SwK6r9L3DrmfAvAXRzcEQGW61gz6BkrRgetOxm6cihVS6mv4I9/1nncAoADL3HU
         pyGUL5WTAZ+/8WtHFdXRYyNu1PB1YAm4Oa5+J7YMyeHT3snycQrjf2FKLf/+LyxqIqDh
         nQ3RyZ8GlJtWr+rX7Jq7w09ZUPYKCHSleF/9aHEbwkMmGLAbNA6vJVYGTZZDDcdF7Xx9
         jnuJK/bhY6p2SaFjn/GL2TI2kpqR/wDn+Bh8i7TeSSWFry4vTUiEbELiM6E6g4XqINuS
         PwwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7Y5GbSp5jgB+vu2PN13eeS7A47GOmKeyv66atpT22pCXWA9eQMctv6NSSoar/M3ApGG4M8VICsfQH@vger.kernel.org
X-Gm-Message-State: APuU4Z+/2WajHMrjSDWzuT24Dx8BqrTt75flI4o/HGTs4/AUW3LpqtyJ
	D32s5mZIWVLeTE1L8hAJw43BsvD6iRQmOl5IgK+zOqIFCs4tsvISxTpD
X-Gm-Gg: AYBFou2srWyNvYCQuvbMDVi/XgBQNP++Mnb5qDWHjBmyKQO/VTzZX3ra8LmG/y3AA8J
	XP93lvPpTLBr8qRUsYP2ZAkpcrvnQzPMrprDSFGE93EopH7LrIz90K3ZdLuDGHzcN9vh7PUgoYv
	xuY6sEIy/dYhh+scmoQ0ipQOkbBvWv+UR69VcAMOq93Bzl8X/39NVdmrt3xJwQ02/+cYVVQo+Hx
	75DbAqdzdQN6ySHT5pzxzgDtHpoXya1jTMdmRTRGHsdFFEoVTcs8OV2tTI0E8NhEl8155T3JI77
	y3lO1xjsZZoLyJuRWti42fo4qWerSCee3iPw6+lCsA/BzxKnDX6dpJOzhOj3G7HAP/FRHv72oPd
	LumlbbXTzkoValvQloBSDrWcbEQ1SrySpD82nZgw6aRuf3dXIeikhHzFYOscEWTE8jzcdmv3Eb3
	ooFKUBY3Wz91FutWq6PnkH+y84NhWlN5yubxQYxskBVV2qkAREdVUKq/14+aOWQCNiiXtP72tK9
	YFNTLcuz9Yf6BchKwcC40Rus6Xz9QnnHhqIf9UglAYM8vR/XW4iRLVovZO7Qk/x50+ttI9ybbdD
	FCI0c13MIxeSF7rcRVEgPfR8KzwdgDZbCtuOL1nqBuAQNnzw
X-Received: by 2002:a05:7300:8251:b0:36a:1a65:ebd3 with SMTP id 5a478bee46e88-36a4237d4a7mr11951653eec.18.1793561373232;
        Sun, 01 Nov 2026 11:29:33 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:32 -0800 (PST)
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
Subject: [PATCH 0/5] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Mon,  2 Nov 2026 03:28:02 +0800
Message-ID: <20261101192807.897562-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series fixes two classes of board-level issues found while
bringing up several RK3568 boards.

The first four patches address GMAC clock parents. On these boards the
DTS lists SCLK_GMACx in assigned-clocks but only provides a parent for
SCLK_GMACx_RX_TX, so SCLK_GMACx keeps whatever parent the bootloader or
the hardware reset left. Add CLK_MACx_2TOP explicitly so the GMAC main
clock always comes from the internal source. BPI-R2 Pro additionally
describes clock_in_out wrongly ("input" while the port is a fixed-link
with no external 125 MHz clock); switch it to "output" to match the
hardware. On RK3568 clock_in_out does not change the hardware clock
routing today, so that part is a description fix.

The last patch fixes USB OTG power on the Ariaboard Photonicat. On
battery power the USB port is dead because usb2phy0_otg is fed from a
regulator that only exists when the DC input is present. Add a boost
regulator gated by the existing vcc5v0_usb30_otg0 rail and switch the
PHY supply to it, restoring USB host functionality on battery.
---
Coia Prant (5):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 ++--
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +++-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 ++--
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 21 +++++++++++++++++--
 4 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.47.3

