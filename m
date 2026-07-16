Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E568424D4E;
	Thu, 16 Jul 2026 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220029; cv=none; b=sW5AnS+2g8AvPRb4ta/UbWo/i+SBSweczmMebCWD35rFgj9CekLRIWtqEBbu+AJ7AfVZofg57k6nzhACoBbmbzFQJdgWNNpovUXyt/m4KWXfAZzYT3c6luWIH4SQLXO5xtjIhiYlZMEns8pONc72JSfVayrRW9iQSRrnof8UPEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220029; c=relaxed/simple;
	bh=Om5676/zo66TwE3vHxLbVq5KM7Qp3wRoyy7fUW67pi0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=MTc/iF50LLA40gf+zaM2Z4VVAtaREK+PLKPtVLPmOkvLCukSDiw+xzDuyxF3wKaOtlrSnnOClkWg3M+Qqzihve6DZXxkQ08gCsFQWzGilIeGhpiUIn9KfQlpCYcibe/dZYAX29l34DX4JdrlDlDOd7cEWzlUc0LSFqsz3AZ+CD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=avE2x5AP; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="avE2x5AP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784220013; bh=v/O57VNU8BraXBD7yfuRNkzyKwzILilSv8tk8HPBEj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=avE2x5APeCHRqF9GZu4Q19hElVQclugt3N+eD6yCdVTsttwGhHSOj9gAarQyEJ1z2
	 cNDHS+xatrBTpIpFex6iJsvLYFNPMQBJmaJESoIDHQjZIOM6o2Dy+3q7zDpkSgCwL0
	 SVkvJYsvDUn/yEvtiDpyExBUHNJ8tWcJlf7oq9c0=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 9B93789D; Fri, 17 Jul 2026 00:38:57 +0800
X-QQ-mid: xmsmtpt1784219937tjlubsc0q
Message-ID: <tencent_BF0C040955E894BCDDCF0A9C8169306DC70A@qq.com>
X-QQ-XMAILINFO: MzNwb/pqyJTkn2T2DeGWmdRsr2uACT666ZtiofJzN9NjNFHUNfJS/3YvxS0xoa
	 bQBGYsiwN8jt0SRgbFZZ1i6PveNdWfy//i6xURbZWg24Vf4qu0cna5b4GVJw9dfhqJX3U0ObRlRI
	 gBXy3pICJkpXy6AcraaQVBKL3at9saPX0MevVtX4Y/h1TrGvMya7dNc3f5VEksG4wAIxOrbiwosp
	 OYEn5ReYHcoOFresCwaiWMv9K4QEgbKHNhLSQr+Wru9c5U/QU5KQ9u109k9+pDRLxoSpsWvnPtQD
	 UUC90fL4QnhTH+sXXDMPyTjkEWDGiDKk50qsbxdwCKoZ1XPG0D9Jagr+PndGktHN6Fk3qlmYc0Z+
	 Zky8y7BST5MFIQ5TW1pfx2z65r1YNDzaNGFvN8gpKeK0l0ny0N0zDKGjUfbR2J5oCNDWwVJ5mKAV
	 LucjGJbFYEPHXQzWRR2HXwrrUxfqi7XucNYbjWEbqNK4qYyiP5u0Ux32KET+/IIXemwpDKxfKEIZ
	 Ls7mpf9D7gzA8zFQAOeq+x2DyfHIJXDxLW4iat7RQPVZCXLs5KPOK6WSBj+A/IqN8H3xxwVwBolo
	 kqLKoDaokLiegDikJHhlFXeOt2i0kmX5MXBkLYoFyMD8FSzMOFsFkmEecf7Wlx56e1xQiIfaqlAz
	 WE/AtGL9Jt7/ngaJXx+dNo+EhMIak7DzRoRiUycZI1uVJiwYnt9cAUJAZyTWrwgXG9kllasU/yRv
	 My+Sm46rYBOP7cATjWpX8ZWqk2/J+v4mKezVkSMCK2XtbJiBS0BGE+Zi766WRpykTS9XZjVCoZqS
	 3vbRi1CSGmHm4p7kGrmYsNFLJu1/sAIQSSXMh8sDe/lA0zplYIGo0ssJ7NwYuFRyPrS7CtcL3zTS
	 cWRFyiIRr2TMC2kyfnmjBNNCAvVm8v86LK485odBW561TH0N8eDiixKSfbgQnxAgVFlc7KTllKIC
	 mjh8Ib1eXlHZQDPpxtxxuZ7YJGn52BpBCsNWGLM5UxZlHMc8mXFfgR74QoJPuZbRxaHv6RsvcI3B
	 uGWOcZQrBE2aUWN4hIZiF7PRLszds=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for EmbedFire LubanCat 4 board
Date: Fri, 17 Jul 2026 00:36:30 +0800
X-OQ-MSGID: <20260716163632.418500-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705135014.1004166-1-2254650260@qq.com>
References: <20260705135014.1004166-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LubanCat 4 is a single board computer from EmbedFire based on the
Rockchip RK3588S SoC.

This series adds a device tree binding compatible and a board DTS
covering the peripherals needed to boot into a userspace from eMMC or
SD card with networking:

  - UART2 debug console
  - RK806 SPI PMIC with the full regulator tree, and RK8602/RK8603
    fan53555-family supplies for the big CPU cluster and NPU
  - eMMC (HS400 enhanced strobe) and SD card (UHS SDR104)
  - GMAC1 with RGMII PHY on MDIO1 (Realtek RTL8211F, described via
    the generic clause-22 compatible)
  - HDMI0 output through hdptxphy0 and VOP2
  - PCIe 2.0 x1 (mini PCIe slot) via combphy0_ps
  - USB 2.0 host ports and one USB 3.0 host port
  - HYM8563 RTC on I2C0
  - On-board heartbeat LED and PWM fan header

Peripherals that require drivers or bindings not yet in mainline
(ES8388 audio codec, FUSB302-based USB-C, MIPI-CSI, NPU/VDEC/VENC,
DSI panels, IR receiver) are deliberately left out and can be added
in follow-up series.

The board has been tested on hardware: it boots to userspace over the
serial console from both eMMC and SD card, and Ethernet on GMAC1
negotiates 1000Mbps/Full duplex with phy-mode = "rgmii".

Changes since v1:
  - Use real name in From/Signed-off-by/Copyright (Conor Dooley)
  - Correct PHY identification: board revision 20241026 uses Realtek
    RTL8211F, not JLSemi JL21xx as stated in v1
  - Change phy-mode from "rgmii-rxid" to "rgmii": the PCB provides
    ~2ns of trace delay on both TXC and RXC, so neither the MAC nor
    the PHY should add internal delay (Andrew Lunn)
  - Drop tx_delay property
  - Add comment explaining why "rgmii" is correct here (Andrew Lunn)

Pufan Jin (2):
  dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
  arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 786 ++++++++++++++++++
 3 files changed, 792 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts


base-commit: b143af2d0da7b01f82f8ea795a0623effab394e7
-- 
2.55.0

