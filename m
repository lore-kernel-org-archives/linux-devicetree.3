Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B03B52FB
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141009; cv=none; b=HurvIDuRmOODADN+B5qBxVncnwkvrKDzlKuul3a8jYSpvSWxWj8jC6rfdBiGNLkq5o946lDGt835PtndRJfAfBmG6lw3ykWXOrJfzqhtXFVtZtyBzqIdlw2qa3noV2Aj8fVqCaGvutt4QXr1GzcNC2wl142D9yGWLGorxciBCMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141009; c=relaxed/simple;
	bh=grCjE6G8S4b3gnfZy+Q41OvGbpz8ziNIO6eKpGz6Ia8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jL/MJZpOxg+DVF7OCvOzIhBgj3BffzBoKj5xMT+/Rt6gEdo8C+ty/y05eOA67QBW+YTcEA5qr3OsRPsH+fydBTyRAiJ8QKQZD6ddn9P81wbtDjlRT6Ytsv48KcByVv78n2zlFq0FIf99zHXAz7Ec3vU6imGkJOO1cqcOnzMJhCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+YBWAN3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+YBWAN3"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc74881317bso274965a12.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141007; x=1792745807; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fdiQVOV9kGikp3BjxuFAHEh6NTE83RldKRLkuMUOTzA=;
        b=g+YBWAN3j52eOO+39dUJpcyfGW6SEZ/obEDM/ub9zUjeJUF5ieUGFYIxZRyQ2H697t
         muYIRmWAj5eBnFiHsvKlskB8dXVnu7GOnI7gu2OdSli7QgdcUQX+A2jKmh7B+K2Y0437
         W9Vg4KET0e8rF4R6QTn8oOugNGUxMVlG8hOu7bc5wJBqECPynq2wXOFkyBOeacu3mHzP
         mMiN2wUoelc6u70+kmZRZhSeeIMDKbumGG7QfWKIHN91Plq06tf4PjVM3sWUpLvEOo3P
         OrB+CRE4WrMrUR9UCcv7Z3vXiwcHjoHvOHNWIilr1x6zs7Y9eh53MmbPXpYjSwg85t1a
         RriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141007; x=1792745807;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fdiQVOV9kGikp3BjxuFAHEh6NTE83RldKRLkuMUOTzA=;
        b=I3Z30JYxc4xJjDF0ZnlUKw3StYNAGzAHqXWMFJj/tg51CXjAykyK8beH8PlB/He9Iz
         8Mihr2LU7uTC+zASXJ2pXy47MjD5n7HaEHUplDZ6tu0/MWuwolgBb0zB8kW5QYSAmddA
         OD6zAcv76pEgX3YjvLjyuz4Ip7v8gqCQrFAp8xvwzfEYWK3UysLcpJGqEikSxnmQY+uR
         9kytPPxX65WHpIuNpmsHMu6dGn1udHBXaOiOyMcFNpbnK0XzHNrzjCUG6HBBMy0PgDjZ
         QWBCrwZ65dwW3x31TWQjPuGcBygc/9Z/XbtZSiNlszSB4F8di4F0Q1S6n83QF6qvXM6E
         SHDw==
X-Forwarded-Encrypted: i=1; AKwUvBxiiBhbhYZ7Eb8aaT87SLr8gqdYryxxH0r0WFBxE1NCcHVZtMxxsVNJnr6tsIG7m1Dr9SSi7Ths54G1@vger.kernel.org
X-Gm-Message-State: AFq9FYK/u2CrwaIG47GZjHFhRmxRF4zJXnGAXWQ+aQ9Kg+WzsYKpwkow
	/HXMWoEza25BDGgMvKI4BUAR8sl7fppIwu1laWBcP+MAufyuGydkRznP
X-Gm-Gg: AYBFou0SNeW4b1M+1E5/ua5ucv/TnwDmiHXzlO+6N56tjuq6jn+LElWIDEkRPptvDLU
	DaAjb4NlpehwOxj6AnpNqVyi2p0Wk0hHjIEA4CKgcq2+ZndS0HRIcgJiANjY7gjueIBIyYmwCDv
	8oM/s0Nni4wWVYHIiWU2BXzDnX2hgouxcorpxm7FMR8F2EfeREK0XHlJKXilyoHitZ3A5S53Y4c
	6/0eB//Pc/KeCyibF2/+xZf4M9zZaVGCCTcls2V31MtMRdK3siMCjN0SM0nxe9/w2Xy/grQ3kjB
	Rv2Dg3yh7oJBvihB3BCO5NlKY5NHqHQJhVgAYmDzqiK5lHrSVQSKq3ooh9rzLKD/hOycq+LW1iP
	sFwd2CIZ+rv13fdajhMv8WTBUjE0PWm8TIwNgzIXQn7VrVwlT3d0l11FXodT4GctiocsvQgAUc6
	99gZEnGbO4D0lEtstFpk3BEAf5toqr6HOvjA4L3JqfJ5Zqo9dzWv66kw5fvqQC0085Ywo+geDQf
	xXGC9EiHGQtGoWwpiXv4ob6ta0nxA==
X-Received: by 2002:a17:903:2f92:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2e842abf30fmr328222235ad.4.1792141006559;
        Fri, 16 Oct 2026 01:56:46 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:56:45 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Subject: [PATCH v5 0/8] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
Date: Fri, 16 Oct 2026 16:56:34 +0800
Message-Id: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPm0WoC/23OSwrDIBSF4a0Ux7Xo1TzsqPsoHchVE6F5oCUkh
 Oy9JpMmoeDkXPh+nEm0wdtI7peZBDv46Ls2jex6IVjrtrLUm7QJMMhZAZwa7OuJhpEOnCrtssI
 Ja5xRJIk+WOfHrfZ8pV37+OnCtMUHvl7/d9JjVDosBTJEjepRNdq/b9g1ZO0MsLf50UKy6BSik
 Fpy0Gcrfrbk7GhFshoMZAhKG4dnK3f2/GeZrOOFKnIhQQizt8uyfAFK5X41WgEAAA==
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
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=5449;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=grCjE6G8S4b3gnfZy+Q41OvGbpz8ziNIO6eKpGz6Ia8=;
 b=j3Hwnfcg9m7EnEJ19LuhgpVq8+zNnvVw4z6NbYtbJo0vjsl/Hy2288Wbn0t6aqMsriZIhX+rj
 C/X7Nqx2Wq8BkaPRwSJancYIlQWfIxzhi086JSEKmpcTFwbEApFXsul
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2. Both can be used at the same time.

Mainline only supports the transmitter and models the block as a single
struct phy. The PHY core refcounts power_on() per struct phy, so the
receiver cannot be powered independently of it, and the single
devicetree cell selects the mode, so the provider cannot tell which of
the two a consumer refers to.

This series registers a struct phy for each of them, adds a second
devicetree cell with generic PHY_DIRECTION_TX and PHY_DIRECTION_RX
constants so that a consumer can select one of them, and implements the
D-PHY receiver. A single cell keeps referring to the transmitter, so
existing device trees are unaffected.

  1/8  adds PHY_DIRECTION_TX and PHY_DIRECTION_RX to the generic header
  2/8  allows a second cell in the rockchip,rk3588-mipi-dcphy binding
       to select the transmitter or the receiver
  3/8  moves the block-level setup to runtime resume
  4/8  names the transmitter helpers and ops (no functional change)
  5/8  registers the receiver's struct phy and takes the second cell
       in of_xlate()
  6/8  implements the D-PHY receiver bring-up
  7/8  switches the RK3588 DC-PHYs to two cells and lets DSI select
       the transmitter
  8/8  adds the MIPI CSI-2 receiver nodes on RK3588 and connects them
       to VICAP

Testing
=======

Tested on an RK3588 board, with a DSI panel and an IMX219 camera on
DCPHY0, and an LVDS panel behind a DSI-to-LVDS bridge on DCPHY1.

  - The transmitter and the receiver run at the same time: with 7/8
    and 8/8, both panels light from boot, and the camera stream is
    shown live on the DCPHY0 panel.
  - The two can be powered independently: the DCPHY0 panel is turned
    off and back on during a 1200-frame capture, and the capture
    completes.
  - The receiver does not need the transmitter: with dsi0 disabled,
    the camera alone brings the block up and streams, which relies
    on 3/8 moving the block-level setup to runtime resume.
  - Existing device trees keep working: with a single PHY_TYPE_DPHY
    cell in dsi0 as before 7/8, the DCPHY0 panel lights.

No WARNING, underflow, "Internal error" or Oops in dmesg in any of
these.

Not covered: the receiver of DCPHY1, the 3- and 4-lane receiver
paths, and RK3576.

The DSI panels only light with the U-Boot SPLL fix [1] applied:
without it the bootloader leaves the SPLL at its 351 MHz bootrom
default while the devicetree describes it as a 702 MHz fixed clock,
halving the rate of both DSI hosts. The receiver path is unaffected;
the camera captures exercise it independently.

[1] https://lore.kernel.org/u-boot/20260804002643.2308515-3-jonas@kwiboo.se/

---
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
Jason Yang (8):
      dt-bindings: phy: Add PHY_DIRECTION_TX/RX definitions
      dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a cell to select TX or RX
      phy: rockchip-samsung-dcphy: Move block-level setup to runtime resume
      phy: rockchip-samsung-dcphy: Name the transmitter helpers and ops
      phy: rockchip-samsung-dcphy: Add a second PHY for the receiver
      phy: rockchip-samsung-dcphy: Add MIPI D-PHY receiver support
      arm64: dts: rockchip: use two phy cells for the rk3588 mipi dcphys
      arm64: dts: rockchip: add mipi csi-2 receiver nodes for the dcphys on rk3588

 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   |  20 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  76 ++-
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 529 +++++++++++++++++++--
 include/dt-bindings/phy/phy.h                      |   3 +
 4 files changed, 580 insertions(+), 48 deletions(-)
---
base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
change-id: 20260721-dcphy-rx-v1-9af57f3edfd9

Best regards,
--  
Jason Yang <jason98166@gmail.com>

