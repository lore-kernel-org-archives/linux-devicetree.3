Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569894;
	b=KEQ2KPrfHz9ZEcbKWT9U3vMc/9zf9cYBJs5DgGkI6hbCje1bcrjgX3BpnHSd3Q6uialX
	 4dLzkiqcnDJAymiekY/P4ymINjnDGDxlIE6ivYprfTz3Hxle15k/YDBb8qKt0AOA20DRy
	 rKpOJKkmcuDedmOjV1tlyMLDM1Gx5x6j55lFvOUYPUy/3NW3+KKkUwpy4epLBt+7NsceA
	 PEI41RCShPiiAJgX4QrR5OvEuAimQNzFa66jDiFuB0buQLZMgr5z1SX7E24q4spASIIPL
	 mYoQSwGUgJxDlYKwjOYnCeyv2Jl2653J8RjAtSC096KRUU8Ie4kaCA9jGT0R7fh7kXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DyYt9/DWMV0EyHpbAMNA++QZYC/8eNT5egYzuTC+VI8=;
	b=zvl0umoj/uMB656f2Lby8l748+JH+o4WuuR1z+ycIrYIw7JGtSs3PoN7EixEPc1H5GYx
	 KDy8B2qKhxBj2A2ZuWcjcFer4s7EnmxUM5xM6CBSaepGRVhgSs59mKpPXj4RHEt0carSG
	 tZmfmfzZjImFL16xSPV++WEgol2sn75sGfsr4FyvGRsXjF7wk+DcPqNlctFIB4FVlZiTK
	 16mGDSHMYv7SmsuA8q5DTbFuvP8sQGOxCNTin2woDH2alQgIDCWVSEVLx5nsQtOPooJEl
	 8c9tEyF+aoNZ+JlA7P67rgRolijUHZUwB0u9owCQEEjqYJo8qRed5vu0P3z6HlxZ33w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VCZSs2+Z;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857BB606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VCZSs2+Z
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492f0a1b685so838755f8f.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794569892; x=1795174692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyYt9/DWMV0EyHpbAMNA++QZYC/8eNT5egYzuTC+VI8=;
        b=VCZSs2+ZGVdHQ04oXSJdZjvF5y1D9vqsZ2iaiROWDPTfdhNFPI2Zj8BspmlOw6304u
         J1hpe/W+BSrSem7rccM+ivbX3k0gkLPJAArQhKflWIq8wu7RKYfO9gUXDk40/i3lyCfo
         hS32/TPYuB1usvRVxM6NFxLMccLHqfeJ0NRa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569892; x=1795174692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyYt9/DWMV0EyHpbAMNA++QZYC/8eNT5egYzuTC+VI8=;
        b=uhiS5KIu9tylGB2Vv1MPN2EfMXMVpeP8OegTOUa44iyJwx5O/lURaiaEZLIKLjUyJY
         QjjZ8Y8dzw+0KWRbY1EyGcB8nZnqfx5TQfjFD5XByZo7/KYocX9ndLJMMdhiN3/h4hWD
         XdH2B0stkPtQCQ9OQGUgAZEHoh7duqO9fcNQxHCy89gYqwpko2vzwj5dEU8yGBIG3PVU
         TxdVOdTF+bwj4peZW1lrMlvogClw7RT3+02f6T9RJIBWoH2RdRfnERM3aLYY5cACCIIb
         /hg8E9rpL1xTey8vtpkKxhjXqJJGS7IqtwbgvFUzJE6rTZx/6xDDM9vL0nKfkF63Nanm
         wZsQ==
X-Gm-Message-State: APuU4Z8URqYQVymChOsGwqT+SZRhOFDtMLnG7V0k8tCFvuggvdzx9TJi
	TlWHETrN2yUGJuSYkLfQcu85xkBHc5cBQdYrf7SaBrMTw84Fcebc+OnCBKEksyjI6OfEgtiiAnZ
	0tO6g2kU=
X-Gm-Gg: AYBFou1F+3eazXCmrak6+HF9iQvOv9957KeXtvsNPoCBbsyT/AYdfvbPGil4Y4Nh5io
	A7XxDN2oozPAm5rdNWlGH0bEf+bZ6mNwYGV+vy5pMoq1jp/lZkPr2mwIhoVYA3f5lEZb3blnkl4
	hmBetpmflv1dt0dXlPw+B5BHDiNrCYPiW8IQ22POPuEoq+tBQe+ToX+HMx66/NZZ3p7K/uYlsTr
	DRFLWvYbn6MSPuC3s+9KApeG5hLhEvz35X437CQFVYZsXBJRl6J8GezmkDL26x64a/gVy2ti77E
	qmk/TXIR8aVcud4Z2nj4eJ/GrR+PapC5A43JD3Ob9MyIHec48xgo2lDwvTsWn4BNO+JOUD0Mfjf
	Z/zmScfPphuNSf90tMY3Te0b2VX8UkqV44sh2P+WmuN7pCyh4lev2NR7TeU10503wflzNNxMu47
	jzGPFIYqGX1giDLMdH6z1+qf7BPTn5gtfq9cpzg+cz8tWhtRt6i4mFzd9euMWhzsPWrqTe8mXJ9
	sDmb031XFLqwn5eJu3yPRUfL26O+shOnDGCkyZk9EUG49aTma/KA8iVBPgtCVvXAeRPG6oGE/4p
	P6xNRo2EI9lG26y6cQw9puJc0o4h54y3GSfiEyjGPW7xCIitnU9Z0ebEhJxQnIZxp3I1gACmjRB
	5
X-Received: by 2002:a05:6000:26ce:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-49c70de38a0mr4829044f8f.19.1794569891720;
        Fri, 13 Nov 2026 03:38:11 -0800 (PST)
Received: from thinkpat.amarulasolutions.com ([2a07:7e81:b71d:0:3e39:d071:1d81:5914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm5448492f8f.1.2026.11.13.03.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:38:11 -0800 (PST)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH v3 0/3] arm64: dts: rockchip: Add support for Axelera Embedded 111c
Date: Fri, 13 Nov 2026 12:38:05 +0100
Message-ID: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
SoC. It offers efficient AI compute for multi-stream computer vision and
generative AI applications in a compact design.

Product page [1].

This series aims to introduce basic support for the board,
which includes the console, the eMMC, the two Gigabit Ethernet ports,
the four USB ports and the HDMI connector.

Changes in v3:
- Address Heiko's comment about the incorrect Signed-off-by chain.
- Address Heiko's comment about the dts name being too generic.
- Address Heiko's comment about the deprecated
  "regulator-suspend-microvolt" property.
- Add Copyright header on dts.
- Add Krzysztof's Acked-by.

Changes in v2:
- The board was renamed by Axelera between v1 and v2, from "Metis
  Compute Board" to "Embedded 111c". Address the name change. Drop
  Conor's Acked-by on the bindings, since the compatible changed. Keep
  it on the vendor-prefix.
- Address Heiko's comment about regulator node names starting with
  "regulator-".
- Address Heiko's comment about non-existent "mem-supply" binding.
- Address Heiko's comment about dropping the unneeded "Use rgmii-rxid
  mode to disable rx delay inside Soc" comment; checkpatch complains
  about uncommented rgmii-rxid, so take the one from
  rk3588-youyeetoo-yy3588.
- Address Heiko's comment about reset lines of the phy nodes being
  incorrectly described in the gmac node; note that these are still not
  described in the phy node because GPIO3_B7 defaults to pull-down,
  which causes the rgmii_phy1 node to never come up; rgmii_phy0's
  reset GPIO, GPIO4_B3, defaults to pull-up, so that node does not
  encounter the same issue. Moving the reset to the parent mdio node
  instead did the trick.
- Address Sashiko's high severity comment about hdmi0 node mixing M0 and
  M1 pinmux groups; use the existing hdmim1_tx0_hpd pinctrl group
  instead of redefining it. HPD is wired to M1 while CEC and DDC use the
  M0 pins. Verified hot-plug detection on external display.
- Address Sashiko's medium comment about "full-pwr-cycle-in-suspend" and
  missing "vmmc-supply" and "vqmmc-supply" on the eMMC node; drop the
  former, add the latter two.
- Address Sashiko's medium comment about the pmic node lacking a pinctrl
  assignment for the interrupt pin; add it.
- Address Sashiko's medium comment about the "vcc3v3_hubreset" regulator
  hack; describe the two GL3523 hubs linked with peer-hub.
- Address Sashiko's low comment about defined-but-never-referenced
  regulators without regulator-always-on property; drop them, alongside
  their pinctrls.
- Mux PCIEX4_PERST_N as GPIO, to match it being used via reset-gpios.
- Drop the unused input.h include.
- Drop the unused rtc label.
- Drop the local PCIe x1 pinctrl groups, which duplicated the
  pcie30x1m1_1_* groups in rk3588-base-pinctrl.dtsi.

Link to v1: [2].
Link to v2: [3].

[1]: https://axelera.ai/axelera-products/embedded/111c
[2]: https://lore.kernel.org/all/20260522174918.61523-1-patrick.barsanti@amarulasolutions.com
[3]: https://lore.kernel.org/all/20261020113717.189082-1-patrick.barsanti@amarulasolutions.com

Patrick Barsanti (3):
  dt-bindings: vendor-prefixes: Add Axelera AI
  dt-bindings: arm: rockchip: Add Axelera Embedded 111c
  arm64: dts: rockchip: Add Axelera Embedded 111c

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-axelera-embedded-111c.dts | 810 ++++++++++++++++++
 4 files changed, 818 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-axelera-embedded-111c.dts

-- 
2.53.0

