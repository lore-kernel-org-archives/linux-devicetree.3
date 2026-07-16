Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD834B66F
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184956; cv=none; b=EgaatY2rxZOVLdp0tZrZZaJoApK/2jtYMA1bN/PTkXgrDqkKn287+s+ZnbUAkgmfQBHx8nJ7AeOruQt7vDgDnNOxyMwn6HV1A5G8up8g56xcETH8J7z/BI4vc3IqzbxOkgOsGH/pqUEdjAzaddmLUYeQiAm0Ovw9BpZV2YRjtlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184956; c=relaxed/simple;
	bh=WZfgvL9FXZU8XkrwLufPry/D5a9H/3rGRZ/ONJCjcuM=;
	h=To:Date:Subject:Message-Id:Cc:From:Mime-Version; b=kUA0evrqKYKoYZ+Kephvk53nNWgyheh7uzqqiljxg8lY4alD8oBJs/4eQ4SmTn8Nt6dsTyp6p7WYAgxRjlpk0ESPAs83yUtsUxslgBKRtt5m+x1uK8ndp79HB1AcQJ3HxQ9PFbGaZg2SE376EgzjCB977Dfp0YNg9GzHNAtKa9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gy.d.sender-sib.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=I/3a0Sqk; arc=none smtp.client-ip=77.32.148.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="I/3a0Sqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=ZQtPPVGvllEpvHbONqrSqV63ntNhTs4cpIf2KvSgDt4=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=I/3a0Sqkx3NjC5CL89D0NUxAr129CJ7FkrLsDYw1a+axhaItCgh9gdkH9DHK7SAyIW92rBpOlOcJ
        oux1T9xg5srp4yRLD5eebgi1kUHME4g/59/T+f1t6q5qY7a0+vrrzaE6qwi781EjevjIgKAI61Xf
        dxxF2dtnJjgYvuY82WT4EXsgLX8TaQuR8H0GN0Zr/qUuCncAmXlkISvj/agAh+/C4VCLFXrHdvIp
        dulLlPDy+iuo44WWoMkFhHP6o9d0ljq8hh4qffSblIUcnCy8PnAt2pthTl/0avAR19WOX5C9ORhH
        xAuiLGVVCl9r70LHU4eIWWuEWi4QaldefaX3Dg==
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDg1NjE3NDAyfmRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnfjwyMDI2MDcxNjA2NTU0OC4yNDY2MTk4LTEtZ2FoaW5nQGdhaGluZ3dvby5jb20%2Bfmd5LmQuc2VuZGVyLXNpYi5jb20%3D
To: <heiko@sntech.de>,<robh@kernel.org>,<krzk+dt@kernel.org>,<conor+dt@kernel.org>
Date: Thu, 16 Jul 2026 18:55:46 +1200
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
X-sib-id: CBJ7TGX6LDyBE0gLICcwGl7iMKKCQHNs9hxhDHx3djOHOgYkG4kg6tsXmdjX6AVG8L8QVbqYD_bngpfMkh1oLCoPQ8QNVMRcO0ATCGtDvWn9awydwxzkZ89YkYHt9MW5jcHuMkva2rsh2HpstEmS4odlSEvEnLWDgi5QtkiY5GS0rKKfV9sjjWo
Message-Id: <90941902-4747-45cc-9c81-a2515b2faf18@smtp-relay.sendinblue.com>
Origin-messageId: <20260716065548.2466198-1-gahing@gahingwoo.com>
Cc: <devicetree@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.25:11677070_-1:11677070:Sendinblue
From: "Jiaxing Hu" <gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
its CM5-IO carrier board.

Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.

The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
reference clock (clk_mac_refout). Ungating it for RGMII needs a small
dwmac-rk change sent separately to netdev [1]; the clock is optional so
this DTS applies without it.

Tested on a CM5-IO: the YT8531 is probed by the motorcomm driver and the
link comes up at 1000 Mbit/s; RK806, HYM8563, eMMC, microSD, the USB3
hub and the PCIe root complex all probe. dtbs_check is clean.

I have moved to gahing@gahingwoo.com; v1 was sent from
huhuvmb88@gmail.com. Same person.

Changes in v2 (reported by sashiko-bot on v1, thanks, plus what
dtbs_check found while fixing them):
- Type-C DP alt-mode: name the altmodes child "displayport" and make
  svid a /bits/ 16 value; drop the undocumented svid from &usbdp_phy and
  add the missing mode-switch.
- Move the FUSB302 role-switch endpoint into the connector's ports; the
  fusb302 binding does not allow a port on the device node. Rename the
  node to usb-typec@22.
- Drop the ES8388 node. It was disabled and its compatible was wrong
  (the binding wants everest,es8328). The audio claim is gone from the
  commit message too.
- Drop the unreferenced gmac0_rst, bt_reg_on and wifi_host_wake_irq
  pinctrls, and the WiFi/BT claim that went with them.
- Rename the wifi-poweren-gpio pinctrl node, it collided with
  gpio-consumer.yaml.
- Describe the PHY reset at the MDIO bus level rather than with
  snps,reset-gpios. The snps properties are deprecated, and a per-PHY
  reset-gpios is applied only after the ID scan, which is too late for a
  PHY that boots held in reset. Confirmed on hardware: per-PHY reset
  leaves the PHY dark, the bus level reset brings it up.
- I did not add vmmc-supply/vqmmc-supply to the eMMC as suggested: every
  rk3576 board upstream uses full-pwr-cycle-in-suspend without them, and
  dtbs_check does not ask for them.

[1] net: stmmac: dwmac-rk: enable the reference clock for output mode

Jiaxing Hu (2):
  dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
  arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 401 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 564 ++++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

--=20
2.43.0



