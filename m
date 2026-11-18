Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044617;
	b=TgIaukrdauc59A+1o6VdvUnLZFHuG3zL1eYA0OU3/0qr0LWS4tR5FiEF15cyX+uPPFlI
	 ejR1d8kgBwZskqEEEGL9IEVVYPQqbl6qX2V17o+L5X3DaLuhAUWtbolqUO8I0rAmMQeud
	 N+rux1WxMoCPt3KcGaYl/pPzcrQJzf+i7wBAhgyArmbCB4jETuMRm6HVx1SygseeXCrXb
	 3OfUfX0Xz4BT0qDbk2/0qnUGYwQZKCdyKShniPEsmShg54L1bU7TheXKnpdnRavqPKBbj
	 QTW/1Nylir2dhmqrl4a2fUQHv7AGW8SR6e1Dd1Y4z3PWOLnEG1ypYa7Rkm0w7fdaM5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
	b=5L2wgqXRGrXbRgUgNz6HBTVi+x40akhWnRCq0jfTcLBBYHXAKEVwsuClnl7TCtwdVKkE
	 d3qBvgTOU8Qchwdql5N4Ax3uGKIkKwAQ6MjJM04EKkgGAUIIMNbNxThbDSwNg9VhOZrle
	 MMW7WClPI4jhwpUyEuCLZHtNTuh8SBYpU/K9BgOHpE5eJEkqbY3KaHWi25suaISxyueH3
	 8U1el/si1v8gs9dujgTaM4zjCke0cbh7S/gY252IyudMFDZMlLbQihylbQzfCjOfwXzQd
	 hp6MHNURsqjS7iKg1CH/uPEm2nE1FdShTQ0A/1xSFn7QhUNSn6Yl3PEZYy7Q55KaaxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAJKQCyf;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277B606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A277B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAJKQCyf
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so2242923a12.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044615; x=1795649415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
        b=lAJKQCyfN1OJVC3Wm7Tq2642xQZI81QkKLG3G0JPjH9fYRmoXUQ1p36ZDYqObIBnut
         T9GmE/4v3/pimsXbwIrSWeaKv5Ro/p1jMrbEAuEe/gnk/qMyPdKvimuYjlRhFFvUZMdU
         reP9mAdWjqlN5zIRKqK+yr+zoFDKaXzct5xtdcX3L5FHLJegG1j3Dk/sCiXHLM90xmSE
         fwExbSgtuYKzfiuD7AqOtnegIB8Rs5hh1xeOrx+8fAeHskWpiqEqhkesd7BhMIWERWD1
         j0K7klTVPvc6F9U8WXjuVSkVtkLplxootCbYN9N9TNQC3xdyjs5xYC/v7if7F/8F7E78
         TKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044615; x=1795649415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
        b=tyMPYQa8un6+Qffi95uLWk3NIHdLyrOXS1Hpzk3gTLHTjwVtExF/aR2XwMPCf92nsC
         xGR7jwj+/9TcpbMghuvY6oAT35DYwYFvrbTSIz3Y05qN2O7q8vN/3nrwzya29GJ51wlp
         S6b0nAZelsAfHDXN5k7MeEJcDovWlDFhMjteKVPbaB2p7yw/AXuiyq1jwWRYjR49ZxHv
         lYvV9M+stTlT03SqWmpnpNVH3o2GvGEEOaJfwXfnoWK1mlbdjKvcHg9pULeuXV7vh4ks
         cP4gQnW2OioHcEcwkCrEGhkJwSunuJ21/w+A4UQMSbqIZevlm9NJ6fW7VhBqjDfumC2U
         EEFA==
X-Gm-Message-State: APuU4Z+o+Js0NuP3EZLI8rcjVEM48qIM7mFMAeeByjCgpTlZJvj0o+d9
	nI/n6CTSgAuoa6bDFghETtKiPnrSR27I/zG6ttjIuELQzIHocRNoHu0L
X-Gm-Gg: AYBFou3PA5YQII0uabM41VbKba4VUZn4yZ/u7mK9iaVO3sjSO+w16Bifykq4KUT4cBn
	hylzxoDBXln3GL+MqZci6exHb95OXQk/J19aqCaoeJk7odASQ3SQTZYsvjxQleWgsi/ajzqdWGG
	7SteYt1RBWB3Hhuk7O6sy7ff7xJJGiQScCCCC5+ljv7b7m3pNO4dnN/t+tvSNtJX62I6omOtVYN
	uPoAJCaVKtmlQ/a/l9fwDgW1J8jj3d3eiSuUcqboXcxhpe88wpt4mpsop6cqYU8enMKqpW9HFOx
	VnDWc0nt47pUtLf4CL4X/I6e+Z/bt5+hcJABmMRY4CkWnKOZ4mgV4uYqk+QzGCsTUoqdamdKRy6
	nNtnzIKHHx/jDavKf3ZfBRPIJ4Hc3HNINiHAgdfcejqtMscPIyu46JgX4Mo0yRur2xiUU6qYujq
	IyWPcnqmXnTtwIVCmDoETbcJZFyvVjKEC/yRSVill6bV9OLsqRiU5VKaLGS+Mn0bBP15SZ5vCoH
	JSdRi4ExCC/ZBXCmx6kecY+04RkNE6Z7gKONyE/gUBDhlRVgUagj9J5hYY3jhFNWqGGP1cBja9/
	ILefvx4YOYXPRGGm8fWDcpSRIE72th2XW7FwaSTbAYs=
X-Received: by 2002:a17:907:3d8b:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c510e0e8be4mr378449666b.8.1795044614898;
        Wed, 18 Nov 2026 15:30:14 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:14 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v3 0/4] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Thu, 19 Nov 2026 04:29:38 +0500
Message-Id: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAOI0/moC/22NTQ7CIBgFr9KwFvMBQoor72FctPy0qC0GKtE0v
 btQE9OFy0nezJtRNMGZiI7VjIJJLjo/ZmC7Cqm+GTuDnc6MKFABkgH2N8ZFjRVWILmkvCWGCpT
 nj2Cse62p8+XL8dlejZqKXxa9i5MP7/UrkbL7k00EA27AWs255UryUzc07r5XfkAlm+hPJEDER
 qRZBFFrUR8YGKG34rIsHyni6izrAAAA
X-Change-ID: 20260930-ok3568-c-c095925b1e26
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=2429;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=yfphZ0mTqNHaO6RXY1MSM8psuzP4gCsZLr935QJ6cDE=;
 b=neG5FXjHJ3lCTzvjwqvTzSD1TXFJGfOQShzFZwf6DbnyC1XRKKAAxGFAUAWz78in6AAG21nNg
 boa7IydzY68Bg+Dw2CevsXCSp8YiulDdybhGSbFA898d0oXb2CSm1Ju
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

This series add support for Forlinx OK3568-C board based on FET3568-C SoM
(rk3568). Patches 1-3 add .dtsi for FET3568-C and .dts for OK3568-C.
Patch 4 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
SATA drives to the board.

Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
crystal oscillator instead of 25 MHz reference clock from SoC. Patch
should be compatible with both revisions, as in [1] solution.

[1] https://lore.kernel.org/all/20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org/

---
Changes in v3:
- dropped rfkill-gpio dt-binding patch as not appropriate
- dropped rfkill-gpio node from the board's device tree
- Link to v2: https://patch.msgid.link/20261016-ok3568-c-v2-0-068d68430e6d@gmail.com

Changes in v2:
- added patch for rfkill-gpio's dt-binding with reset-gpios property to
  suppress dt warnings
- removed mmc-pwrseq. AW-CM358SM has only power management PDn pin
  for both wifi and bt. Using shared wifi_bt_reg_on regulator fixes
  bluetooth failure on cold boots
- added bluetooth wakein/wakeout pins
- moved leds/common.h to the SoM dtsi
- switched gmac's phy-mode to rgmii-id
- added rfkill-gpio for modem reset
- dropped unused wifi and bt pinctrl's
- Link to v1: https://patch.msgid.link/20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Yashin (4):
      dt-bindings: arm: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx OK3568-C
      arm64: dts: rockchip: add FIT-PCIE-SATA overlay

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 332 ++++++++++++
 .../rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso    |  16 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts   | 566 +++++++++++++++++++++
 5 files changed, 927 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-ok3568-c-c095925b1e26

Best regards,
--  
Dmitry Yashin <dmt.yashin@gmail.com>

