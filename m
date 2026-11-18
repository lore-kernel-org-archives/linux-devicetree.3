Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981345;
	b=KjnzJDJYoNgGchox1uCbrEk6A0gBZ22jNzonuAdBBtNEhj1DFa2FwWxCV+nU11Ejw/D+
	 qmOTxuGmLxhalp57+eLYlRvzUhJVaLfMIZ3s4O5DnaLyWxnyKCxt6zsQQmYvVgheMvtQz
	 uztGUicZChsklsrWgvELOFIQ89m9+QputYrAErxHRY9qqzZ5ZYUBtsbweg1HJC1RN1VR9
	 wgRNpTzrvQwTAtlMHNSeVUmUGvCRzgMsFWQIr157JpSJ9k+j8z6XMO4i1nMXue57K3NnF
	 9CCAceP4eY5kxmzLYM8dVJeM+6hu1p0+YUQcF5YXL4kDy83NMqx/D0TV2iGg4/7rQGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JxBXNLa6ZBXlBBQrdfV9c1+1S3GpXGF9noKFfawCuGg=;
	b=G2rWfno0EulGOe009dxWeEb7So9U0qWzcl/2p1QJ7fbsx92l9SphZzXNKoAGddn2utfx
	 AixWkxab62IM6TT0nJ8X5yA3NIwkZwFQS8QLnbDp95CvgdX+qzK1OwTPi/T1NhabVu58s
	 Tvf2DY1dID1uHGskmRUPsnua79Yz/npsAlzCBmHIRToQBGTs9mN2Kvt2HeJGuI6ekrteg
	 KpWe362S45+QSR4beUFXa8cJy0UpBGrMN5FBYJOUCYrfKmlRWhJNcuqYu9z6Y7nCMc43E
	 3G2XqLrAuHssKYkJ0PC/YceUkQIaLFJ2CV7L3tbgq6uTeAuzoChpx2v1vwKqhApAfhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xky3HLNs;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760C0606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xky3HLNs
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89a837bf00eso5443b3a.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981344; x=1795586144; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JxBXNLa6ZBXlBBQrdfV9c1+1S3GpXGF9noKFfawCuGg=;
        b=Xky3HLNsqHHmxCoRklLlvpa2BZtft+64fQQLyAbArYRCNrugBc+ka9psRhaA+YSnAJ
         2nlLQbPNK1+S3CQevUo+xh4Q+1nbY/bpOrFh/FJJ7J9YEB+aRva+rhD3CXrJodT9qL1W
         AK3rvCE92qPpIR+Md3CpS4ioRHLxpM8Xaii6ywwphEXWCy4DdTRPWNq0XCrQN0ZQWS/6
         5V/5BRp1+KcmkkRwpbriaOUPoYlY543lpSgfFOANHCiwE3QDQg3dWPxljL52btn8QrtR
         ssAeQgpxOn1WwGneynk6eexPbPo4AdQoUnE0poxPD20XVKQt/KZUA7emqYUSxDNFT99O
         gKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981344; x=1795586144;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JxBXNLa6ZBXlBBQrdfV9c1+1S3GpXGF9noKFfawCuGg=;
        b=Qx4puGv6+fMVyA7IgTmdYLyR3d6QujRJ0kvWpGXiPCpZUxM+rp14KLzNQITlRk9tid
         zxaWMsez4gp307t+KpE1q65DQs7M6v6MslwWg7/kqGugpd/KjUN6eBHoDJI9Dmt48OJZ
         d1m7HZBWTZ6IgoMpK69iM6s/ccHVdeQ3AMYiJYtljq4fR3z/Vp1uhUPHJVfWQecTdUMk
         E/ShJkbfZcPotCPaxr9EYgItKELj9xDrx+b2oOxxg51dD+y4E3tYR9rStcZJ76BZrETl
         ua06dSfUwfYwgOvlvCvqTpVpFMaeKQwwz6Lez4euaAil/eDGPeyF41Nvo9Khe6SSORfd
         idzA==
X-Forwarded-Encrypted: i=1; AL+hErFxgm7mzR238myoMJ1KU5RlcCRarxU+hBfwt3KIpZam+quqiWb1G2N7nLdNtA4vYHcKF72Yfq4wEcHw@vger.kernel.org
X-Gm-Message-State: APuU4Z9JAAfOlh2ev6VF6Dgd9YAYGHE6I867PfEvhlO/G0pPtanwcIXf
	OYjA00Q9zTCu/Hd70p5oA3j5G6EKiK/IvrYFsLPi60RSlRfPh4ijseAE
X-Gm-Gg: AYBFou1Lv7wjBgyO2s3L9BA7b2YP9EbBQJ7XnPxto6NAwgDEBo/gO06UgcJuUSSJHJ7
	Il9HYXGhXK8KfqDtJqrr4d3wMFZoB9gH6u+ms9IcLVQtDhpKii+cN2JUbzhvaQKIYb8Qn3rHENX
	gnvn68T34i1E3gI9K+TB9/Myp412aBGvckeVONYI7eqNAUqpobStGvbrSISqBSeYLUo1pJOSwDi
	stO5taTjyVVLacThxDKX5hCs4i3CTS8THlylxoLpXWNY5mm32wq6c0U3enUxUC9I5dHGPeHlpgd
	J7oQxly9rmtu5oY39KdappZcImaPYakv6dpRhcAmUbH1PAcrBq91i8n9LCjjwvP0c4e5h7ma15P
	VAtxkFsDO5hsvtrLm31CyFRbXl2hnRGwia+ZNmVEl1nJZRa0wO+PnsZaoXm8VrquDayHqBlr3hD
	MjflYZmbcJ/Xzy8GzwsTulcLMFylutWwgv4MyTxtjsJyFHv4TvZrADvrmzTp4A0WI3S52j1Nv/k
	TicCK302K//UPSvM2VuphXHIDHFG8OATsbLianAocQ7Ta2B5L0fOYZiY1CmHH7uSSU4bSo7wQ9Z
	KbxKbfXK19QuytckG2V1gmLOqKFiLB1R6iH0LhexoBUPYMhZLcoS7FUYwzJ47q5WNNLiViRklHA
	XM4TvtmgbJdbogNidjjTm
X-Received: by 2002:a05:6a00:754f:b0:8a0:4f14:8a4d with SMTP id d2e1a72fcca58-8c5d278952bmr2016960b3a.2.1794981343233;
        Tue, 17 Nov 2026 21:55:43 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:42 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Subject: [PATCH v7 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
Date: Wed, 18 Nov 2026 13:55:13 +0800
Message-Id: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAMI9/WoC/23PQW7DIBAF0KtErEvFDBhMV71H1cV4gBipiSNcW
 Yki370kiyamldj8kd7X5yrmWHKcxdvuKkpc8pynYw3uZSd4pOM+yhxqFqjQKocgA5/GiyxnuYD
 0lDqXdAwpeFHFqcSUz/e2j8+axzx/T+VyL1/gdv2/pz4lTeJes2Im9u/7A+WvV54O4taz4LO1W
 4vVcvLM2pABpNbqh+1Bba2uljBgx+gpJG6tebLtZlNtAued1Qa1Dq3tfi0oaDZ31UarB+MjDRH
 /WPuw0G621Qbbw0CoBm03/13X9QciCVk20gEAAA==
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
 Quentin Schulz <quentin.schulz@cherry.de>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=9675;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=4jldtoqotv+0+iVOKby65SdrP0m8eLnQDSL8YhS7iS4=;
 b=dEmFplU2MroJIYLQWmJxnycUVLog0BQBHxuTTx87Q/u7Epn/a78HxJKxVydC3sIB3gGwIZC0+
 G75qhyoh0XiCpKadq5GSPpI4odVILMOHjBbfXUN1f2mLz3E/4WVhU06
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

Not covered: the receiver of DCPHY1 (tested by Quentin Schulz on v6),
the 3- and 4-lane receiver paths, and RK3576. 3/9 and 4/9 fix states
found by reading the code. Those states were not reproduced on
hardware.

This series was prepared with Claude through Claude Code:

  - It checked the driver against the vendor driver and the TRM.
  - It drafted the code. I reviewed and reworked it before committing it
    to my tree.
  - It checked the wording and spelling of the commit messages and this
    cover letter.
  - After I ran the basic pipeline tests, it generated more test cases
    and ran them on my board.

---
Changes in v7:
- Collect the Reviewed-by and Tested-by tags. Keep them on 6/9 and 8/9,
  as the changes there only rename and move fields as Michael suggested.
- 6/9: also give the PLL helpers the tx_ prefix, and move the master
  reset and the PLL state, which only the transmitter uses, into
  struct samsung_mipi_phy. (Michael)
- 8/9: put the receiver-only and the transmitter-only fields of struct
  samsung_mipi_phy in a union, and move the slave reset there as well.
  (Michael)
- 8/9: use a single space before = in the receiver's phy_ops. (Michael)
- 9/9: restrict the commit message to what the patch does and how it
  affects an older kernel. (Michael)
- Thanks to Quentin Schulz for testing v6 and for pointing out that the
  U-Boot SPLL fix is merged.
- Test with mainline U-Boot v2027.01-rc2 and drop the note about the
  SPLL fix.
- Link to v6: https://patch.msgid.link/20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com

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
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 659 +++++++++++++++++----
 include/dt-bindings/phy/phy.h                      |   3 +
 4 files changed, 634 insertions(+), 114 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260721-dcphy-rx-v1-9af57f3edfd9

Best regards,
--  
Jason Yang <jason98166@gmail.com>

