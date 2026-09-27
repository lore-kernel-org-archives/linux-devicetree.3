Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243A1F936
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517108; cv=none; b=CqP35z2FCiJddK3GhdCTZF56hPIvpYRcp5YRJPiRM1rD9HAUBV4Nn6wZ0aVbWOKKsA0960aGnkoffKfCyRrkJ+D5QfvWlEwWno0VzvCrIDfF8+RUZOUoJGZ6wBKiYnsIA1ZQ7uR0MYzJwky1GRxQ4FP4QMW9fD0xugSTFZhiLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517108; c=relaxed/simple;
	bh=xuPYDaOm/RZ917o7scS+yv8ccb9EE5Ntp8WpbhvD918=;
	h=From:To:Cc:Subject:Date:Message-ID; b=EeFTlBzF2bp8VdFx4FOuBfZujOs3OnV279uozot+sFT0gSdZg1tveLLdhiojTRHlQaaEUHNGZhxFDKVrRcGocaLqL6bddG8iWYKG4DxLlYuH2pIjzg7ZppKGyUeYUf9iM60w6Ul9zxw2462kWrmSlsuV7SOIr2RS9P5/LJZ6uzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YaOzttXd; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YaOzttXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=y/vf3VDdgMZ96+I
	DRj3xxG8dZVURxREK7ONwZpZXNsg=; b=YaOzttXdnxndlnto0+1C8jFY2bIJFd8
	B2HXfVF8vHzI4NlZ1pOSmr4aAYPNtVoZCoksyXsL+jC2+nT+jsbIHO9Q3F6bQcmQ
	iNNIHFm29CLLUHiEJW24UUdvlHcuFpMScbcZX1O+Wb3KBv0E2uNc6k7vqsFw6cuA
	dAdmsPGzr9hU=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Sun, 27 Sep 2026 21:51:24 +0800
Message-ID: <179051708448.31632.16350193430088134671@163.com>
X-CM-TRANSID:_____wD3X6FcH7lqQBdlBA--.6434S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryUWr15Kw4ftryxAr4DXFb_yoWrJr1rpa
	98ZrWfKrs7KF1xuwn3uF15GFWrCFs3JF45WF1DW34Syws8Jr1UtF4Sk3Z0qa47uwnaga4j
	qF4Y9348CF1DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIYLPUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+h3nVWq5H12VbQAA38
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Hi all,

This short series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S
based single board computer.

Board summary:
 - Rockchip RK3588S (4x Cortex-A76 + 4x Cortex-A55), LPDDR4x
 - eMMC, microSD slot, M.2 socket (PCIe 2.0 x1)
 - Gigabit Ethernet, USB 3.0 Type-A, USB 2.0 Type-A ports and a USB-C
   port (USB 2.0 plus DisplayPort altmode)
 - HDMI output, MIPI DSI and MIPI CSI connectors
 - ES8388 analog codec with 3.5 mm jack, HUSB311 USB-C PD controller
 - 40-pin header, RK806 PMIC, IR receiver
 - No SPI-NOR; the vendor bootloader reads extlinux.conf from the SD/eMMC
   boot partition

Patch 1 documents the board in the Rockchip platform bindings, patch 2
adds the device tree itself (plus its Makefile entry).  The "alientek"
vendor prefix is already present in vendor-prefixes.yaml, so no vendor
prefix change is needed.

Tested on hardware with a 6.18 based kernel: boot from SD and eMMC,
gigabit Ethernet, both USB 2.0 ports, the USB 3.0 Type-A port (5000 Mbps
link), USB-C DisplayPort altmode, HDMI video and audio, ES8388 analog
audio, M.2 PCIe, ADC keys, the IR receiver and ramoops.

Notes worth the reviewer's attention:

 * The codec node keeps "clock-names = \"mclk\"" together with the
   I2S0_8CH_MCLKOUT_TO_IO clock.  Without that name the MCLK never reaches
   the codec pad and playback stays silent, even though every register,
   the DAPM paths and the ALSA controls look correct.  Verified on
   hardware both with and without the property.

 * The codec compatible list is "everest,es8323", "everest,es8388".  The
   second entry is not cosmetic: sound/soc/codecs/es8328-i2c.c matches only
   "everest,es8328" and "everest,es8388", so dropping it would leave the
   codec without a driver.  Keeping it produces two dtbs_check warnings,
   because an ES8323/ES8388 binding is not upstream yet and the node falls
   back to everest,es8316.yaml (the compatible list is "too long" and
   AVDD/DVDD/HPVDD/PVDD are unexpected).  Two mainline boards already use
   "everest,es8323" with the same gap (rk3588-firefly-itx-3588j,
   rk3588s-youyeetoo-r1), so it looks like a missing binding rather than a
   board issue.  I left the binding out of this series to keep the board
   port focused and will happily send it separately - please tell me which
   form you prefer.

 * The USB 3.0 Type-A port is wired to usb_host2_xhci through combphy2_psu;
   both are enabled here, as in the vendor BSP.  combphy2_psu is free on
   this board because the M.2 socket uses pcie2x1l2 (combphy0_ps).

 * The MIPI CSI camera pipeline is described, but does not stream yet: the
   sensor probes fine while the RK3588 VICAP/rkcif capture path is still
   incomplete upstream, so those nodes are included for completeness only.

This is my first patch to the Rockchip platform.  I am a Chinese hobbyist
(amateur radio callsign BG9OXA) working on this board in my spare time, so
please point out anything that does not follow the expected style.

Changes in v2:
- Fix the RK806 DVS1 pin configuration: dvs1-null-pins used
  "gpio_pwrctrl2" instead of "gpio_pwrctrl1", as reported by the
  sashiko review.
- Translate all device tree comments to English, and drop a stale
  comment that no longer matched the Type-C / USB3 nodes.  Comment
  changes only: the code is otherwise byte-for-byte identical to v1.

BG9OXA (2):
  dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
  arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml            |    5 +
 arch/arm64/boot/dts/rockchip/Makefile                |    1 +
 arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts | 1608 +++++++++++++++++++
 3 files changed, 1614 insertions(+)

-- 
2.43.0

