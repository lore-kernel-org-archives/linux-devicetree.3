Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298699;
	b=DE3slz3Y2qX1IAkMR0XfkGvqU5xmm43K+JCiNpmVyrSvJ0xc3z2DIWrEnFkm9kNDROyi
	 1aljjZVDB35BM8RMECKXarL0ucE5aJNV8Zxvc/Ow4s/4IDv3pczWbkHKQXQErIydRhfFq
	 BBOtKuiJJa4K/kqKgAaF4jUa5VXLJBI3erzNHAfo+YQuVRhs6bh++WHLyodRLp6q0Aq35
	 JwZgxZq5hhuIAV/fLEMSUkiF6dJKlhG0gpQQi4OSNUj9wwLQOWjxNMzyCd8r/dS73XnAq
	 lcs8GnRnuc4QQMKCXlL/L6uK602sA/Sqzbwu/h9jmeInvwywrf+nKzWhvNv7yvSHP3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3Dle9Ow2yyzoJEd0CQy8kceBvIk0DIv22zbrH+jkbDg=;
	b=e1WyvGFytRptfeWgaOrkJrvtd9cu7Q7oNZukNX3DhrDXfONYA/TmiaQ4dO1Js/ZYm8uF
	 HffzUIy9pJycLixm89WbWTKpuU9vg+T4ZQLbHUvaJgcBoMREdlq06B3IcUe49QIndluKl
	 qAQmg50VZ1A0Y+rs1Alxi7gonoyB7OcYPQqc3YrYuklsi6ijwD4yqJmF8eoh2VvT8TLaH
	 dpzbji+HBnbXqHxJGXFtGkW5OSWeYpikZviTeQCtPt8XXMWhj9EXbZFiBDGVKGbi0Zi90
	 wzL0tfqR7L+uvG7bieff9i4Xe/Z1OJ6V+6hgodOoYj2BWjhJLW9harw74tpn75CK2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkUowk7A;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566DC606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566DC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkUowk7A
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so222237eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298697; x=1794903497; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Dle9Ow2yyzoJEd0CQy8kceBvIk0DIv22zbrH+jkbDg=;
        b=HkUowk7AbFydM112oyToMWwzpvobJTrbLKSrWWwLFVQEuwr+rtiL4gAuW6L83EA7DS
         buE2RWpdEFG3F/goa3SZ4/MoQkKCOOB7hs5JiuxiWPi5AcEam3Y7WBU7Ls9m6uyoz9ao
         R6NcoMj9ZjbiPC2PDx/XxH3Cp5aAG9/p9lkbDnxi1tNzwK6cUlIZ8nrhTtfUEwFq2DuL
         HE6qnnOH0V4U2mTvekj5LFMZlNw3KJ11EYhjb2I0YXRTMqf9sggnURRavrvQ/nQ68rxv
         fLGLm+kdFSFTez5rjC/TS1qmlCODdL/gdxC/ozRHAXWg0G+rlVkMytCJ6BISZAlNcHv4
         A7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298697; x=1794903497;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Dle9Ow2yyzoJEd0CQy8kceBvIk0DIv22zbrH+jkbDg=;
        b=eweL2Mqqtr+hw2glaSMMcEWd5VHtA4lqrPdtj+1p74MoOp95Y2SvKxxTdt5HjPW4ZT
         bvlJoM+59XGr9+YMook/IeQ1aESDSj5u35W6DnHuQRxHGwlF3CzK9j647JewX4a8jXqT
         anBvEPb2SZhO9hvpaQYL4Y4br0Vm0dudUuIQWh7cOyJD+IKvff7qqcJOyGugtnjSfdot
         /mBnG4mz9aRxOWVJydohE7daOyWRRTU5uJNRk21wy7BgVCoCPFqGKruRFwuwstBOFklX
         wWFcKESzxm3yNYgqY23/DIKPkLpzdOx81ZYW7uP8ZLWVUnR7L7OTZBO2bnk7SL6Vb0pp
         dZyw==
X-Forwarded-Encrypted: i=1; AL+hErFd3E2ocS1g8fJkr9uoGA/EKlaPY2At+TdpEDgAppCK8uDLySHTLQIBoLnAGESsbEH0lcGLdUR0bOuo@vger.kernel.org
X-Gm-Message-State: APuU4Z/+8xUeJM01nM5BAqOlMZPLag3ZhVQNI0Bx0JHRX18mFoUEQ0jS
	+g6ey6O/T5Y8EB7p1g1lfBrAkzs0NI8PgqQ7FPn46YOqiqf8F+HmS6Wp
X-Gm-Gg: AYBFou1Q6KY+5vjPXVaAOKmoeAbdxGU4xrtl08mhjQe5g4REoLZS8b7QWdWH/iEFgOI
	oz/lVdMuorzxLNnOhfEpiovrCnTBc9PX54g3mIYRFg9pC0Jttc6qtnlBwk/1KLSxiaUYiKEUxn2
	TLQs+Xh/hdWKtgputMk7+9hDTLbjE6wu//hFDp8QA9eytmgd4J8s1ff9wUc1KohL/zEyPRfnQ4w
	BQC14QVqaY/cyHadB+nwW2pN+RWUfSxVDsSh0v7dPqCnphez1SUxEIsutvEdueIdtdk6q7KQIFX
	K1BSpZxXL3+HYemoaJePrvIq75Eu0UjaTA0o392aUUp0Lyl3p4ZboxnDPemKYFK8QcU44tz4grN
	Z4pKjEciQhXzAOWuoe+4WAuBU2MvPKzm0BNJGDkqUe0Zcob9wN80hcQRhxsQKXvNwkgNTC/Scks
	rIAMpElAipCxVJ4VIlYq+IZDEkHZ52/Ns+W6OAwfFM6IfawKml2iqmAzyRIJ3d5cYux6ENeCHI/
	bPvp6Xi/XFAbrwIrneY/ULHm7Wmr1WsB7P7kp7f37ffkD5oiQh0SscAjqum596Pfw/XguQw+cx/
	0GFx7bbqEDPFg3WT7Ti4FRyUkIn4Ga/96siyCFCCJp8uPb9+1Ma69jnZhxrP
X-Received: by 2002:a05:701b:451c:20b0:1b2:5884:a039 with SMTP id a92af1059eb24-1b3b5e0f414mr4045526c88.0.1794298696492;
        Tue, 10 Nov 2026 00:18:16 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:15 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Subject: [PATCH v6 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
Date: Tue, 10 Nov 2026 16:18:03 +0800
Message-Id: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIADvT8moC/23OQWrDMBAF0KsErasizchy1FXvUbKYjKRY0MRBL
 iYh+O6ZZNHGojCbP/A+/6amVEua1Mfmpmqay1TGkwT/tlE80OmQdImSFRjwpgerI5+Hq64XPVs
 dKHd9xhRzDErEuaZcLs+2r53koUw/Y70+y2f7+P7fI2e0y7xFNszE4fNwpPL9zuNRPXpmeLV+b
 UEs58CMjpwFai3+2a01a4tiCSJ0DIFi5ta6F9tudmKz7UPv0QFibG33a62xzeZObPK4dyHRPsH
 KLstyB/MefiKWAQAA
X-Change-ID: 20260721-dcphy-rx-v1-9af57f3edfd9
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=9088;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=Nl08n2T7bfHF/A7AyevV61ydPL+YGfUh9xTziIDBQCY=;
 b=K5dINOMVvBq2AWGRxhK8Z8SxV4wj8Z34m87imYJznszHFt2P0+Vgk3gMOgW8/ZCUgDfNs0wO5
 F5AyRtH7Gp/ADT7cmEaesFliIWtcDgX07l2FphaePHAxo26LMcRFfP+
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2. Both can be used at the same time.

Mainline only supports the transmitter and models the block as a single
struct phy. The PHY core refcounts power_on() per struct phy, so the
receiver cannot be powered independently of it, and the single
devicetree cell selects the mode, so the provider cannot tell which of
the two a consumer refers to.

This series registers a struct phy for the PHY transmitter and one for
the PHY receiver, and implements the D-PHY receiver. As suggested in
the v5 review, the single cell of the binding now selects the PHY
transmitter or the PHY receiver. The cell values are the new generic
PHY_DIRECTION_TX and PHY_DIRECTION_RX constants. The PHY transmitter
and the PHY receiver cannot run in different modes. A phy-type property
of the PHY node therefore sets the mode of the whole block, D-PHY by
default.

  1/9  adds PHY_DIRECTION_TX and PHY_DIRECTION_RX to the generic header
  2/9  changes the single cell of the rockchip,rk3588-mipi-dcphy binding
       to select PHY_DIRECTION_TX or PHY_DIRECTION_RX, adds phy-type for
       the mode of the whole block, and keeps PHY_TYPE_DPHY and
       PHY_TYPE_CPHY as deprecated values
  3/9  unwinds the PHY transmitter power-on when the PLL fails to lock
  4/9  always writes the rate-dependent registers of the PHY transmitter
  5/9  moves the block-level setup (APB reset, BIAS) to runtime resume
  6/9  names the transmitter helpers and ops (no functional change)
  7/9  takes the PHY mode from phy-type and the PHY from the cell, and
       keeps the deprecated cell values on the PHY transmitter
  8/9  registers the receiver's struct phy, takes PHY_DIRECTION_RX in
       of_xlate() and implements the D-PHY receiver bring-up
  9/9  adds the MIPI CSI-2 receiver nodes on RK3588 and connects them
       to VICAP

9/9 has to wait for 1/9 to 8/9. It uses PHY_DIRECTION_RX from 1/9,
and the csi nodes need a PHY driver with receiver support.

Compatibility
=============

In 2/9 and 7/9, the old cell values PHY_TYPE_DPHY and PHY_TYPE_CPHY
remain valid as deprecated values. They select the PHY transmitter, so
existing DTs keep working on a newer kernel.

New DTs following 1/9 and 2/9 are an ABI break on an older kernel. The
older kernel ignores phy-type and takes any cell value as the mode of
the block. A DSI node with PHY_DIRECTION_TX therefore gets no display,
and a CSI-2 node with PHY_DIRECTION_RX gets no camera.

In 9/9, the dsi nodes keep PHY_TYPE_DPHY, which older and newer kernels
both accept. With the csi nodes disabled, the display therefore keeps
working on either kernel.

The csi nodes in 9/9 have no older value to keep and have to use
PHY_DIRECTION_RX. Enabling csi0 or csi1 therefore needs a PHY driver
with receiver support. Since v7.0, a CSI-2 host driver probes the csi
nodes. An older PHY driver then gives the CSI-2 host the PHY transmitter
that drives the display. The camera gets no frames, and the display can
stop working as well.

Testing
=======

Tested on an RK3588 board, with a DSI panel and an IMX219 camera on
DCPHY0, and an LVDS panel behind a DSI-to-LVDS bridge on DCPHY1.

  - The PHY transmitter and the PHY receiver run at the same time: with
    8/9 and 9/9, both panels light from boot, and the camera stream is
    shown live on the DCPHY0 panel.
  - The two can be powered independently: the DCPHY0 panel is turned
    off and back on during a 1200-frame capture, and the capture
    completes.
  - The PHY receiver does not need the PHY transmitter: with dsi0
    disabled, the camera alone brings the block up and streams, which
    relies on 5/9 moving the block-level setup to runtime resume.
  - Existing device trees keep working: with a single PHY_TYPE_DPHY
    cell in dsi0 as before this series, the DCPHY0 panel lights.
  - The DT of 9/9 keeps the display working on an older kernel: with
    the csi nodes disabled and without this series, both panels light.
  - The new cell works for the PHY transmitter: with PHY_DIRECTION_TX
    in dsi0, with and without phy-type = <PHY_TYPE_DPHY>, the DCPHY0
    panel lights.

No WARNING, underflow, "Internal error" or Oops in dmesg in any of
these.

Not covered: the receiver of DCPHY1, the 3- and 4-lane receiver paths,
and RK3576. 3/9 and 4/9 fix states found by reading the code. Those
states were not reproduced on hardware.

The DSI panels only light with the U-Boot SPLL fix [1] applied:
without it the bootloader leaves the SPLL at its 351 MHz bootrom
default while the devicetree describes it as a 702 MHz fixed clock,
halving the rate of both DSI hosts. The receiver path is unaffected;
the camera captures exercise it independently.

[1] https://lore.kernel.org/u-boot/20260804002643.2308515-3-jonas@kwiboo.se/

This series was prepared with Claude through Claude Code:

  - It checked the driver against the vendor driver and the TRM.
  - It drafted the code. I reviewed and reworked it before committing it
    to my tree.
  - It checked the wording and spelling of the commit messages and this
    cover letter.
  - After I ran the basic pipeline tests, it generated more test cases
    and ran them on my board.

---
Changes in v6:
- Rebase onto phy/next (v7.4-rc1).
- Collect the Reviewed-by tags on 1/9 and 6/9.
- 2/9: move the mode from the first cell to a phy-type property.
  (Michael, Heiko, Rob)
- New 3/9: power_on relied on the APB reset, which 5/9 moves to
  runtime resume, to clean up after a PLL lock failure. (Sashiko)
- New 4/9: power_on also relied on that reset to clear the
  rate-dependent registers, found while checking power_on for 3/9.
- 5/9: keep BIAS_CON4 with the other BIAS writes. (Michael)
- New 7/9: support the new phy-type and direction binding of 2/9.
- 8/9: merge v5's 5/8 and 6/8. (Michael)
- 8/9: trim the comments and name the magic numbers.
- Drop v5's 7/8: the dsi nodes keep PHY_TYPE_DPHY. (Michael, Krzysztof)
- 9/9: use a single PHY_DIRECTION_RX cell in the csi nodes.
- Describe the ABI break of new DTs in 2/9, 9/9 and the cover letter.
  (Rob, Krzysztof)
- Drop the Assisted-by tags.
- Link to v5: https://patch.msgid.link/20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com

Changes in v5:
- Rebase onto phy/next. The runtime PM fix this series applied on top
  of is now commit 261e84f9278f ("phy: rockchip-samsung-dcphy: Enable
  runtime PM at PHY core level"), so it is no longer carried here.
- 1/8: use PHY_DIRECTION_TX and PHY_DIRECTION_RX instead of
  PHY_TYPE_DSI and PHY_TYPE_CSI. (Michael)
- 2/8: use PHY_DIRECTION_* for the second cell and rewrite the
  description.
- Drop v4's 5/7: it has no benefit over the switch, and it moved a
  DC-PHY shared function into a D-PHY helper. (Michael)
- 5/8: rename protocol to direction in of_xlate() to follow 1/8.
- 6/8: use a switch in the receiver's power_on() and power_off(), as
  the transmitter does.
- New patches 7/8 and 8/8: switch the RK3588 DC-PHYs to two cells and
  add the MIPI CSI-2 receiver nodes.
- Link to v4: https://lore.kernel.org/r/20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com

Changes in v4:
- Put the second cell back: the first cell selects the mode, the
  second the transmitter or the receiver.
- Drop the private use count and mutex; the runtime PM usage count
  does the same job.
- New patch 3/7: move the block-level setup to runtime resume.
- Split v3's 3/5 into 4/7 and 5/7.
- of_xlate() rejects a mix of D-PHY and C-PHY consumers.
- The runtime PM probe-order fix is now a separate patch [1] that this
  series applies on top of.
- Bryan O'Donoghue's Reviewed-by from v2 is not carried over; that
  patch was rewritten.
- Link to v3: https://lore.kernel.org/r/20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com

---
Jason Yang (9):
      dt-bindings: phy: Add PHY_DIRECTION_TX/RX definitions
      dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Select TX or RX, add phy-type
      phy: rockchip-samsung-dcphy: Unwind power-on on PLL lock failure
      phy: rockchip-samsung-dcphy: Always write the rate-dependent registers
      phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume
      phy: rockchip-samsung-dcphy: Name the transmitter helpers and ops
      phy: rockchip-samsung-dcphy: Support the new phy-type and direction binding
      phy: rockchip-samsung-dcphy: Add MIPI D-PHY receiver support
      arm64: dts: rockchip: add the dcphy mipi csi-2 receiver nodes to rk3588

 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   |  18 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  68 +++
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 523 +++++++++++++++++++--
 include/dt-bindings/phy/phy.h                      |   3 +
 4 files changed, 559 insertions(+), 53 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260721-dcphy-rx-v1-9af57f3edfd9

Best regards,
--  
Jason Yang <jason98166@gmail.com>

