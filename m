Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446479;
	b=5gjSaLaqEun7HN/EkeAkd2ZR6ZTVgLvn31H5Hp1WyghG1vfWl0KGJuosgyyWhQ/i7wDG
	 RIv0oBCO5KV5NAZfLcEF8OZN/11ZYWgFtbBOWHClXrLlAzz/wMhrZqOL1HNSq7OQnwyMm
	 I6k32T0ql3ofYosXK46OdVqA8FF+eUUwyD/SEUlRjc/ygvo9+EtznL2PMoS9Ihh80QzzI
	 cjIE43BbHf+dcyGVAQq4w5BU+Yh6k20gFkALRgh7N9cwsLcbvmYWl30YfTO9XOWD3Il08
	 H6AgpqCj8+DOo4f974/549q0ZxwahPGfUJYhUe1qpOc822S4RSUh3pfXWjw8gZCZxEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446479;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=kdpz+AudG/ZxQ3ty4U7YkuGjF3ZMob1/L9CPKOhLwSk=;
	b=2TZDg1E8QqNkjgZunbGkNmOayPsB3OtRMoFFS4FQjPx6rlWLCBvxAbI1V5dg+QQZTBY0
	 T4hsDV01NgQ9GFgBt1ymrPYfY8IOXimjYM6oDtZRNipl2PX93N49oQD7Ep1oeD7fR7Bu3
	 5hXjD32eS54iQZyuBvz/btl7EZEB16zbZsBUOYhy6j71sAYc8dz4sFGxjECOSO0ieFjdr
	 KKd7Wj3rl2mfbNYHoEC8yICjbpx0bIoRma/Qz6HNxx4ntiT/lh/WgiBGPfm9tVMCB+j7M
	 GIGQVpMuA7xujEKzFoOAt0mEVRyRSgLxiYz8SvJBtit4P6xepvvnaidaAx+VCozHDdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0sBiONL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8105D606A31F;
	Mon, 23 Nov 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0sBiONL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795446478;
	b=BsWvmfchGsydRjrzkAzOT7WpnuYBRuk5p05sVGs2Tn5ad9XxFa8LTparb+I4CO1eMLBy
	 8CwTQx6pNnFGDJ11xWnagjI70aM8j1coM4LSW9n1eVz6YSfMbguH1Oc1F9stQ4Gj20Ndv
	 PII0MvcNxQlxLd5g6yFK9aTKikc5Rzy4OQ7iNp/V2wQXO979capbC97aoVx8tGYfrxF4+
	 mK+AbUq0a+BU2z5QrLiS+k6I+0zlQ7390r/Xx9ua77Ialz1Of5ZXkCAEs8AnAmluu5lbC
	 7H6W8WnFO3Lepp3CIohmVw7kbwy6TkElDihLPDha95PfylTafDzXwpLkou8zCDEBsYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795446478;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kdpz+AudG/ZxQ3ty4U7YkuGjF3ZMob1/L9CPKOhLwSk=;
	b=jtX6DQ6/f03KwrUTY3w40Ftt7j3JdDYcZgnskjH3qqG5knbONcp+gNfS2I+N6tHAXQLQ
	 mXXRXb1KMmgI35GlnYSnLoqCHoTBxkM7TYs+S8Lvm2nAigNrvqbY+kImnukE0Rkz9f+4e
	 DxqHNTSbsVdgXzbt6sb4lRteAHGMTWQagcWPWqNZkCNX2Lx7grdzy5kdTAqT948/vzXUH
	 no51oLQdNvQ1rFCSDS3OVGeRL0+gmwVsp2QvmNRvvRF9djwo/B4AK8UtHSLL1ukF/cBVQ
	 napBVmcBXaqdnoy3GQB2nMtAB9vPET+oP0C5Qq9He4vsolc3lGhfAxw8PD/LW6gXvBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DB921F000ED;
	Mon, 23 Nov 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446478;
	bh=kdpz+AudG/ZxQ3ty4U7YkuGjF3ZMob1/L9CPKOhLwSk=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Y0sBiONLaiAXOlcbfjaERNj4zZMbwIp3C1sDI0DDFJo51DDn2oJJSFYRtuZ29actm
	 rcPwrVqOwN4z1DIZ+KLOScpbllkLhccB12J3OqJNWtPL6m1vlIkSVH6com2KqGRclv
	 kDApwqow6eLV4aaOyVDSv25Ms0w5pnVSUHC2XZMLhWz4o1t7c5viaINFsGR7TfPCx5
	 kV9l9TG5Zbl+fgf7PWgQ9MEySMW+9Yv0PjFNYGEatmFEN2taTUBMFyIKS6bPddcU5U
	 TtQue6zJn6QFvuTwd1EL3P1wT+Zt0SOvnuA7iUz/SLzJJVwRsAVRCPY400OiblgzjF
	 QEtGJLHvfw07Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8DF304C513;
	Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add Mekotronics R58X-Pro
Date: Mon, 23 Nov 2026 16:07:25 +0100
Message-Id: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
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
X-B4-Tracking: v=1; b=H4sIAK1WBGsC/32NQQ6CMBAAv0J6tqatxTae/IfhUNpFVmJLtkgwh
 L8L6NnjJJOZmWUghMwuxcwIRsyY4grqUDDfungHjmFlpoQ6Syktp+5UWsuf0KWBUkSfOZV24j0
 lXmrfBKfrYJ1ma6EnaHDa67fqy/lVP8APW3IzWsxDove+H+Xm/U5K/D2NkguuwQgvjPGm1tfeU
 cCIxwgDq5Zl+QCrsTHh2gAAAA==
X-Change-ID: 20261118-rk3588-mekotronics-r58x-pro-54cfda4bd8a4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=d2sf5RqKKP9EUG7tTzYnxgGQH1qtUjbKzdzzezlCuVE=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBrBFa3i9XtZ2yfNALYmNG/zUk/nnL2bqosYSJzh
 5WtRwkL9QiJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCawRWtwAKCRA7Xj/jnsft
 6b8DB/9fKKUAJaUDZv3oDrjKGN+Vrd+GWo6/Kq2LKb0lsBhmXMmWxF9c7WrV3bsU5AJ15Ou8ZXV
 fxslsOp99JLuzjWBl4QaDpDTspokn24Z8Ikndie+8EKNy1BnrK0cxIqHjOS4EAz0ByTu6oFILky
 byMxTnrynnnl5YpY6dtn36No2j4C6X9sVOMqkJZQutpcvC6jQTHuBr2MdKYJoGCq/FNGbtOfTpC
 kWCQPXmOdcyr+u/aVZALPm3zV5SmHbsYPyqWrrF/IRLSViY6FlDjuCQlrb5WCN0i+//3y5+gqGI
 vgqKdlWo+RKWadHCcEbFhWFTCr4CHH/m+W4mkAVDDWwpIV2W
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net

This series adds support for the Mekotronics R58X-Pro, an industrial
mini PC based on the Rockchip RK3588.

There is no public schematic; the DT is based on Armbian's and on the
vendor BSP DT.

dt-check-style --mode=strict is clean except where the existing
rockchip DTs differ (pinctrl-names first, no blank line before status)
and for names fixed by bindings.

GMAC0 gets RX CRC errors with rgmii-id under iperf3 load, so it uses
rgmii-rxid with tx_delay = <0x44>; GMAC1 uses rgmii-id.

The Type-C port is source only (the board is powered from a 12V barrel
jack). usbdp_phy0 has both orientation-switch and mode-switch, as
asked for in the cover letter of [2]. On its own, v7.4-rc3 brings up
USB 3.0 in either orientation at boot, but when the cable is re-plugged
the other way round, the SuperSpeed link does not come up until the
USBDP PHY is re-initialized. With Sebastian Reichel's pending DWC3 glue
[1] and USBDP [2] series applied, it works in both orientations on
hotplug. DP alt mode goes to dp0 (VP1) through usbdp_phy0. With [1],
[2] and the dw-dp series [3], an Apple USB-C to HDMI adapter gives
1080p60 in both orientations, with USB 3.0 on the adapter working too.

Tested on the board with v7.4-rc3: it boots from eMMC and NVMe, and
both GbE ports, USB 3.0 over Type-C, the HDMI and DP outputs, DP alt
mode, headphone audio, the RTC, WiFi/BT, the LEDs, the keys, the GPU
(Panfrost) and the NPU (Mesa Teflon) work.

I used Claude for cleanups, ordering and naming, according to recent
series lore.

[1] https://lore.kernel.org/all/20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com/
[2] https://lore.kernel.org/all/20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com/
[3] https://lore.kernel.org/all/20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com/

---
Changes in v2:
- Describe DP alt mode on the Type-C port (dp0 via usbdp_phy0)
- Keep the default USB3 PHY on usb_host1_xhci, so the USBDP PHY disables
  the unused U3 port (Sashiko)
- Pull down the BT host-wake pin, it is active high (Sashiko)
- Add pinctrl for the HDMI0 FRL enable GPIO (Sashiko)
- Link to v1: https://patch.msgid.link/20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net

---
Ricardo Pardini (3):
      dt-bindings: vendor-prefixes: Add Mekotronics
      dt-bindings: arm: rockchip: Add Mekotronics R58X-Pro
      arm64: dts: rockchip: Add Mekotronics R58X-Pro

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../dts/rockchip/rk3588-mekotronics-r58x-pro.dts   | 1285 ++++++++++++++++++++
 4 files changed, 1293 insertions(+)
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
change-id: 20261118-rk3588-mekotronics-r58x-pro-54cfda4bd8a4

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>


