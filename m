Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765671;
	b=Yzpen2/Q/Nzsyhj2tD7XgQYRAyf4U/iCtJJtcsY9pMEBcDNC2j05gwSaN/6qfzNE9+y9
	 63ZAcA5sougC89xxJGiXNS6I4U/Dsusag2Enj2D95tMVIzKe615VYyKdn0IEMLy3ACxhj
	 2cWQkuH8SxJ1kfO/rlpNlGNx9sSRh2LadHEYQkvc2Bxkf8sSeXtoBmUPIeK7kYqz7hT8j
	 mtYA1mSeLYEOuUWQmrH7DB3ypFQDHhzxevvafUOf1V/uoIgBr01Mf+q+Js4c/4RxixLuj
	 RDg38McGPx15XHH88jvyHVFihszYK0QiNNH6ARm7PZFMnDxpbWbToBRSsFgrhJK2clw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=L2yQzhsCjABe27EGiYNkqwaqKvzumisbkGpfV5q4dYI=;
	b=X72dsT4cCTTidT5f1bpdgynFXaNMpBwJvpOjTLX1CC0/mCTAfTlhAaoSZaESThy5MR0a
	 tKyuX6DRkZPlWWV/rioKBSIXP2K5R9XyQKscnHbjfKuYp6VFnnthytLBNh40VVal2k24M
	 VZNiQJiv7B5Qjlp1Cv2meSMGZobK+uQB94jDciRBdC5sOACAGHrKhLme9VHoa4sPFkueT
	 BgiT80WyFUbayiDihRNTjig6X/gsU6gyKMc2Av288eE5EW4rL7yRbVRVlCT1+j0pqWWKs
	 7hzfxzfoY02Fjfnp38V+fTpzBDpdMZJdKRdZ5wao7Gen548uEs7S6e7pJFhCsj1g3eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuUs8Bd+;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C3C606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31C3C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VuUs8Bd+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385c497bfddso804026eec.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765669; x=1796370469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L2yQzhsCjABe27EGiYNkqwaqKvzumisbkGpfV5q4dYI=;
        b=VuUs8Bd+YBMOG+ErCMaWfdCaDXxfT10GSbfCjqcy30rPoY/6meC9LsKeo2Gh9IKt3v
         lh692D60S4DNy1Wbef/3McFIs9QNDYxdaaZnIm1TIEmTsEkJOnvzoAgcSpiPJeKKcRcz
         v17si7ylZxpgzVP3JirlKWNgCNyuJUs8iickycrHroH7WRkoaz7yZJrpgr5jkJqni6n2
         mm4qeJxL36tOxGeNRjYO6oAmYU/LYM/htH1MTFLqn0AiZKnlLK2ueej1BatflXfwV3AN
         lAYCcM2hbT9sHgs+wFyFkD5JzkeuibY17ZXUVvci07PjCqbzUihW8+Eik1V3zWALajbj
         PfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765669; x=1796370469;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L2yQzhsCjABe27EGiYNkqwaqKvzumisbkGpfV5q4dYI=;
        b=yA9qS65bLaPNW2KFB3xzBtCEeKtHUZSAeQcSb3smqX7A0my+nEaRcdf42NgVTL0Iky
         klzonyqLKlBM9QFBGfi1HkY4xULfKeVEc2r4doKdXH2gN6k0lsbXLYkQs8hJuUcKaOkK
         8DK+FzzXegMQ0kFHuY+EqOUDRrSVR516zwr8rtvTW3zk5YvZks6lIng34WZpjTraci7i
         LIQ1kairXr8YNLI6JnsmyqKIEwFT2s4f6zclXJJsn5ppnUwTJL1zI2haZJT3NCou6V1I
         T9kfk75BFBKedtonv6NWjeeilqqlvadO0XPWMP6XWuBlYpHC8xOPrnIxzf05vSdQ7w/d
         3RLg==
X-Forwarded-Encrypted: i=1; AL+hErGq1uvubM7tKLweB9pOBLar39akDMejznasalAHDCIC3Zd1KLbDylQ+XsPi3Ky9Cje2une0JjSuWCJy@vger.kernel.org
X-Gm-Message-State: APuU4Z/1A1+76P5MmGPUiMkbwsAFMq/yRAV5cDZATvRfD6P8G2BJAPwf
	8nk5A59yMV17Y88THIV7W4jcNvy370nypjx1WnSVzY/yq7fFaSTAhMT7
X-Gm-Gg: AZFdTZfXDfTYtR27GseCP5ctqS5XigCWYZ68JujVjbolx7sYJGI177XzHaUg+AyPQuk
	3Lj/DU8q0uptap/aCIVr2oXAZqNwXebce1Rz3OzrOHHcMeTBD7/HvYO+xerRWhtbQ7HDpchU6dn
	VLuTiKrjqICGqXrqQ3oALKDQcuLg5AN8xNI7uj8WSri2CTJCZfOVoEHANc0zuYs89O2dZd4eQH2
	W6mqouogIW87vM22Ygw8qwSq+MR7qS6J8xQqRsVq0HkwU4Bw8DNn4rn7c6xSf3VWx+DnofBRoUw
	ugwpGsKhu/yaJec+oE5YBB3A0BqAZc0ZY5/IFiS75c0jq0ETvgr/Hrvb8K0DgBi10W3eqmQE7ND
	15n5qWn28X99K+i6kYmqwpHCfpBUHQ/zGjZ6sjMmFJeIOeR7hzrYZrgSddzLVmjM6wwu9/txmiI
	tEjEwufTthYgVW7S1f/h2tWbPiK11Z+hghnR9Tf8W7UlFbOvILeTB/NspcFQkY+Gsras5ZChtAM
	vZMRPkfFoMObpRaOSajDnLYvNhIIyL75CAPugQ/RYgM13WChd3pjfYazMQZEFhR3sjiXMnJdoR/
	nsyPinRa04l/cpXRI3p39r3Z0uHL567NyRi41cjDHFcUjO7xN8xG9cxOFymW51ZxFjwxckcd5ev
	ckivoLXd3VXA9RvlhDTjr
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr38383587eec.1.1795765668624;
        Thu, 26 Nov 2026 23:47:48 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:47 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Subject: [PATCH v8 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
Date: Fri, 27 Nov 2026 15:47:36 +0800
Message-Id: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAJg1CWsC/23PTW7DIBAF4KtErEsFA+Ynq96j6mI8QIzUxBGur
 ESR716SRWOTSmzeSN/T48amWHKc2H53YyXOecrjqQb3tmM04OkQeQ41MxBghAXJA52HKy8XPkv
 uMXU2qRhS8KyKc4kpXx5tn181D3n6Gcv1UT7L+/X/nvoE14mcIkGE5D8OR8zf7zQe2b1nhrU1W
 wvVUvJESqOWgK1VT+uk2FpVLUKAjsBjSNRavbLtZl1tktZbozQoFVrb/VkpZLO5qzYa1WsfsY/
 wYs3TynazqTYYJ3sE0Svz8l+7tm5rbbUuRIkBSaHVa7ssyy/yl0kWDgIAAA==
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
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=9834;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=hRrQ9LrPoiuN36dbyaQMQqSC0C4Y4onFyWoU1y+bJKU=;
 b=YhxMFznnH1zyeyBoWDQ//nDjDh/s+RZwsJmg+9lYfS5a99HgtuEZ3yaU8h5fI0mSiz2C5iKpq
 26N6P8vaI/QDp7CXtVEKwvW5w/OsYeIDJx3W1IceSLRDfq3VYTY56B+
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
Changes in v8:
- 1/9 and 2/9: drop the Tested-by tag. (Krzysztof)
- Link to v7: https://patch.msgid.link/20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com

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

