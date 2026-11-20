Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795135170;
	b=J9gSigozOpjgCS9M27tjhGynDEVN9XUQwStKvWakhBLqKwPbmuJmoop0KypayCCno3QL
	 55xVT6IZHfyTfp0Utsy4oQqzF3Q6A4l0jbk4Zr9AsCkA6OMO7YNvvYD1Xl6eR9I7AgSVH
	 m5pfNBe232v6q7SG+uZ9XPkeAxAXD75Y9hn40BkkvCDitOcP0yBkVNHJPhUZLFgkWuFha
	 eVmPn4Uja5OdavbDY0psMEGE8iAGLF0RlZqat8cNpWYz8Kr7p6viEKTV6QhjAaoYZB1rx
	 acCfjjIbJrUQ8kDHZyu93Fa8M91O51PUoXCqTVWM3yAUn9UjuokN1Uy5YrRddnsJnww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135170;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=06XIf4D6mSmxSRM87PPvsuohF9WiWE8VJBFQty+Jsbg=;
	b=IRDzlFxJx7W4dgRcFOd3vPcbjrS5sqRaE0t49JMwj9JRaszlNFsDcVcooIrqFU3PwIPD
	 hQEjupNnWaKsm+yh2ZqPaUt053WzF6KiuOTS27KlNlDbYPE+aLlIhL1FzSf0QR5Syt5Vk
	 RTbIF6AXSC8eaHwK3dPGrzgfYjyXDJy9ZU/SMqiX+JEU4hyi1beusXkJhRQPc4Yy0NTSc
	 VBid/88Agi/YMuMs5JyfDwavP1qHKf5dlmiSeSsVpoUXd/rW3yKTDZ2+60ADmsa64TmSl
	 frdSlI+952MnX0gmvWMiZwJ2uhHJlTKHba6e9xGIp+YvVBKuL926KZ0BuNU5o2YalTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVzC1pqe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41FE606A336;
	Fri, 20 Nov 2026 00:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVzC1pqe
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795135170;
	b=hl85o+DYYlrYQbF3okZU7Nzrb4sf9AUKvRk0caygJ5Jss+uhZSQQWpdOuL/YP0Er4yIv
	 tk5H7BLYZXD1eP4Uas2zRe9aqd8xdBSUBuLedqE3KDec+pWTbFrMrCN/NMkgTkH2lkclF
	 zgVDqBAV68PBfM3x4se6azOzQ7SGkE8pe3N/qp7kQq+rN84U6SOiIvOwFKMxVP6d7gfg2
	 MiDeIJXnGQ33fVLEnVKEM8J/VvTjtaZRCVWGjzfeNx2qW1L96noUgb0uRgQrM8eql90oV
	 XkOULXNaf2Lnfrppg4y3IFr3sYrQTgPZQOuPdmejC6+HVNEGifUO9WLO5/1T3rcJHYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795135170;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=06XIf4D6mSmxSRM87PPvsuohF9WiWE8VJBFQty+Jsbg=;
	b=cAHUPflqo4rCJJdeV01+OGEdj+enG3B6r5QaL5EuTA1rm4BxH1hp4Pg/6NzLY9Yg7mZo
	 HZH/Wn8RsuD9iizGFFWp4CD88rOuzYxlYYrCV1gipaH5DrTCogv1LyNfm/pDGUIFMVqsQ
	 TQ6Ti92FcFm5bdPaeojak0ZuKXwyoIj7kOiyerACzjJwMNw+Chvn6+Xc7IS2D02Mxmedh
	 SYGvEZb/kxIw7+FsWufEYbnW08fJzivqaXO/o0vjjsmgqWH/IBVzBIkfN1Q/qar3pexZL
	 wTzGUZ/aQigY8NA6T0kOv19ITEZh1o/OpIRHiKFpbk4OXgr9AbtopAR4x80KpFsCrpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C92B51F000C4;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135170;
	bh=06XIf4D6mSmxSRM87PPvsuohF9WiWE8VJBFQty+Jsbg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=AVzC1pqelpZDFsuL0+8rTC44215b/ZfeEs4JIrzxvwiYXNnl/O4pAvGgqodH8pVWa
	 cc7anPRTpfKbaII7D1+GjySbDhSF0cH+Vm4YGwDn+uo7C3kib5G6fVvom6H6gwSJaa
	 vkNy5CH++wGn8EHBLjly0gBSDy8axCF/qjyrJWCiCucJC2JoszZToBrcqF9AgMEKFz
	 ymH9aFiAiZ+yGINugFO+gdJB4bBkNXdBKVy5q+TQ+BMQVa86YyjNjDN5f+4mp731Zy
	 FhRVWNw7TxyHiXKZR2gUl488HlxlL4iTm/a7hZvWxjQJ8reUWnYmX/Gta7LV8Lt+xW
	 Pa2aK3L75ZF7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 561F842503;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add Mekotronics R58X-Pro
Date: Fri, 20 Nov 2026 01:39:26 +0100
Message-Id: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
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
X-B4-Tracking: v=1; b=H4sIAL6W/2oC/yXMwQ6CMAwA0F8hPdvE4WYWf8V4GFvRStxIC4aE8
 O8MPb7LW0FJmBRuzQpCX1YuucKcGoivkJ+EnKqhPbdXY4xHGS7Oe/zQUCYpmaOiOL/gKAWdjX0
 Ktks+WKjDKNTz8tvvj7917t4Up6OEbdsBGklNMH8AAAA=
X-Change-ID: 20261118-rk3588-mekotronics-r58x-pro-54cfda4bd8a4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=qkeBb/nL37zpe/lCO/iNX9Ueu125W6clmIxV9IQB1Tc=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq/5a/rKyFUzEa+akU1CoUICGtE4RZXisRa4iEo
 DiAG/Yw1bSJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCav+WvwAKCRA7Xj/jnsft
 6XrGB/oD0+HisA/tWCn9MPRMdhZzKXzX8CaKmRHlythf6+qJU/bdGa2w53MFO7AMhGfHJ6ll0VX
 tlRUrp0L/V4oLavjBeCdHl0DmaS/F1GO2Z1mpnIiaWI8wsTGco8BU70XsLRtwneMbb3CQqvQEuk
 9gsTZMzzU3BZGRwR/KqeCn9CyMobM89ln9N+I/fPVBiqy/B3yQwgWJQLN6hNGD1ffm3EkFPI3+u
 8k4Nb46tsnOlVWfXZUV7IpuE32nQ/k6/jU7iZqOazzldt1tNaMQHAzieVXwsTdvojsCnJ4or9mm
 e6EI/qkLtQ7WBZx6PKLUOK3DTC7B9iVwG1P8ud3++AJ3ohvD
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
hotplug. DP alt mode is not described, as I could not test it.

Tested on the board with v7.4-rc3: it boots from eMMC and NVMe, and
both GbE ports, USB 3.0 over Type-C, the HDMI and DP outputs,
headphone audio, the RTC, WiFi/BT, the LEDs, the keys, the GPU
(Panfrost) and the NPU (Mesa Teflon) work.

I used Claude for cleanups, ordering and naming, according to recent
series lore.

[1] https://lore.kernel.org/all/20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com/
[2] https://lore.kernel.org/all/20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com/

---
Ricardo Pardini (3):
      dt-bindings: vendor-prefixes: Add Mekotronics
      dt-bindings: arm: rockchip: Add Mekotronics R58X-Pro
      arm64: dts: rockchip: Add Mekotronics R58X-Pro

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../dts/rockchip/rk3588-mekotronics-r58x-pro.dts   | 1215 ++++++++++++++++++++
 4 files changed, 1223 insertions(+)
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
change-id: 20261118-rk3588-mekotronics-r58x-pro-54cfda4bd8a4

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>


