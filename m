Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980853F1052
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629946; cv=none; b=Rm4OW6VK0NLOV8XfH5gbGKp7gmLbn6U6wQOMMraKFegIXJMk9I83i293ttB880/Ti2zerQV9WkqYopAEEwJQTg0bqrzDcgnMUTAcelQsBItvxIKKL8amaeSbJnzfGSYReCCG3Jy2ZFARU4rhqVNQVVU6Ck8h9aU1PQRLtpFLhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629946; c=relaxed/simple;
	bh=KDkDNZeuXKLvk0NwN7/bRIUJZ1PVg28gENlWR0G1ero=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N92Loc8KcPfHaQNUoblKSWzvlUv1O4/9IrOrKz4bUXt8v6Gf6Ko9UPJIn3TUM+3ocM2XWZ6p/6RXZBUKGYg60XQhYT2yVTIL/I+mYfqTc2i5OhmRfgAaAN+Gq+SF8U6iRzfaI0ewrJ1bM5qu3kYMvzf1W/xpPV7ii2CC6dpoCHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4be28b82so456627f8f.2
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629943; x=1792234743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/Tw8zZUSYGRUw5ihGSIUwYOzEBFsG+6HaKAhA2ORMw=;
        b=OZ74d0XlboExsPkje106W/3S+YPFMyiBCBzUCHhZz+YMY1GHGYUzrO4bEinmb9opPt
         p3LL8W8FgFMxKV5qY7bttBmAOlEhYwPDatoatm1E1HUmhgc22gkxgKR/dqPMmEU2jKMH
         PmgbkGr99iyzyT4+3GEZHfs5YyAGsdW85FUNjP/uoohTWmPPAHMbrYeaLdhsl6E9MnDc
         672ENahxONayn/pXrdxm8R7FHQJrTr1RbaaRuDVzCaDscgl9dN0kRI5sirGARZ1S6hAh
         C+u8ZohX79VM/qvpyyMEtdRpKI3u9duu08kMU4YlYFQmD9o6yxUk0Mc7gSJErIApNJop
         WqOg==
X-Forwarded-Encrypted: i=1; AKwUvByw0iEgsLsioJJXJQoZ8z3EyB1njOD7BHngXIVczNtSow3BVuufE8fHtQhukqSsnRtJlKLlSzpcvkST@vger.kernel.org
X-Gm-Message-State: AFq9FYKrkJqhCy2B4jECm7QmWwXlrYQU4LmdQ2Yajj8BjyuSZMdSys+l
	sVU4VAteF+4jGoYDQqQBp7NDjeTQHLEIQvfpmAiOlJvsv92TSmrY9HcU
X-Gm-Gg: AYBFou0cSXn2GSEDqlOY9AVBHe8dsW7ontz1ZgrX3Shla6rPjcy1v5dOKqtoQDISiwG
	t4XvynXkdgr9xCpFF58HHmDTSPMcuWNXP9yKnBAybGMEFaiU5rtoB9go3b3d9cW1tlf0JUeJvNZ
	uokSuH5X8JM3s/dukz3/EbL12Py56/xAQpWALeOKfUpsviGj0HZGMYiP5x3hbAwjsGXyPZEISu4
	q97HzwRDbgBYRXX50Nb1AI+nVKAAGuhvLRsIj3ztYSK/NPaasFLsnZG/YEOEGSJzxtqOEAs9pwD
	E4rHadFTn6b2wkIYTiSSV/4BRnGjsJZcZ1FfeQUNRzohkv6Iakg4aB5Y9iFO9sBUZxqEq9l8gFu
	LMP1SXgf8hzxfOEI3GLPSJvwaxZyVXRHrJokNlA5Rscu5z2YcszuB7mOHXoZjoPfQ0Vv+V4FL5M
	HQZgVO9xalRCCxcoy4wWP8KXAZYVbEVVEH9HZ5/Ti7+7Lyj+TgUPLwW8BrmJ6s9DgF4eom3fWCZ
	LYUcdP/Vcq5ONEYtT64lXk0gk8wq3ltKSs=
X-Received: by 2002:a5d:6547:0:b0:48a:fd58:a7df with SMTP id ffacd0b85a97d-48dbace0061mr6574489f8f.47.1791629942561;
        Sat, 10 Oct 2026 03:59:02 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:01 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] Add ethernet support for the Amlogic T7
Date: Sat, 10 Oct 2026 11:58:52 +0100
Message-ID: <20261010105900.247342-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T7 pairs a Synopsys gigabit MAC with the same glue registers the
G12A has, but nothing described it. This adds the binding, the driver
support and the device tree nodes, and enables the port on the Khadas
VIM4.

Two clocks set the T7 apart from the G12A. The controller reaches DRAM
through a pipeline stage with a gate of its own, sys_ampipe_eth;
nothing else claims it, so clk_disable_unused switches it off and
transfers stop. The glue registers sit in a block gated by sys_ethphy,
so far owned only by the MDIO multiplexer, which probes after the
controller has programmed them. Every write to PRG_ETH0/1 was lost and
the port ran on the bootloader's values; v2 passed my tests only
because a debug knob rewrote the register later. The T7 node now owns
that clock as "pclk", which the stmmac core enables before any glue
code runs.

The RGMII delays stay as in v2: phy-mode describes the board, so the
VIM4 is rgmii-id, and the controller adds the transmit delay because
the RTL8211F transmit delay does not work on this board. A sweep of the
controller's receive delay against the CRC counter puts the PHY receive
delay where it should be, about 2.2ns, while the transmit side never
gave a clean link. As Andrew asked, this logic now lives in a T7-only
path, so no other board changes behaviour.

Patch 8 is generic: a table in the informative section of
ethernet-controller.yaml showing who adds each delay for every phy-mode
and property combination. It is independent of the rest and can be
taken separately.

Tested on next-20261002 with "clk: meson: t7: keep the memory fabric
clocks running" (clk-meson-next) on top: 933/935Mbit/s with iperf3,
5s each way, no CRC error in 432k frames, nothing written by hand.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback and
three clocks. I will drop or rebase whatever overlaps once we agree.

Changes since v2:
 - the controller-side delays are applied on a T7-only path instead of
   changing every Amlogic board (Andrew); the PHY mode left over comes
   from phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps is checked against the four values the hardware
   has, in the binding and in the driver, instead of being truncated
   (Sashiko)
 - amlogic,tx-delay-ns and amlogic,rx-delay-ns are not valid for the T7
   (Neil, Andrew)
 - the on-chip PHY no longer carries max-speed, phylib reads what the
   chip reports (Andrew); same for the RTL8211F on the VIM4
 - the PHY interrupt line, GPIOH_6, is described on the VIM4 (Sashiko)
 - new: the T7 node owns sys_ethphy as "pclk", see above
 - new patch 8: the delay ownership table in ethernet-controller.yaml
 - no longer RFC
 - Conor's Acked-by dropped from patch 2 and Neil's Reviewed-by from
   patch 6, as both patches changed. Patches 1, 3 and 5 only moved in
   the series, so their tags stay.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

Lucas Tanure (8):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: apply the RGMII delays the T7 way
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
  dt-bindings: net: ethernet-controller: tabulate who adds the RGMII
    delays

 .../bindings/net/amlogic,meson-dwmac.yaml     |  86 ++++++++++---
 .../bindings/net/ethernet-controller.yaml     |  18 +++
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  20 +++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 +++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 120 ++++++++++++++----
 5 files changed, 291 insertions(+), 41 deletions(-)

-- 
2.56.0

