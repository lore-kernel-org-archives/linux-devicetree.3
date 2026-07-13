Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC46345CA1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974653; cv=none; b=cYZLLh5DlqTnWXRLS0ww7dT1WOSZuKOctc/ctlbL5RLRj+1wzAL/T3OWGA1hvbqLEKF43ktFmZQJy9cRoCcaOx0jt2jSTv1r8UovGWf4MJMJdQB2P6qjyL5WOSeJeVd/4tWGeUS1K0VhkIxNj0kaTxWYzEdb+a82udi+5T8H62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974653; c=relaxed/simple;
	bh=XwOj8voSKg4AWPVrMgKYjN8lr2NiROyfMOeYVhXWe+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qA6wN1Hi1Tfojx7jLEqVjrh0VVovSo4TtC2BX8No8Ee8BHMkzOjfwzt+ywJv7KcMzARzlEJTLMws+yQMlP/d9Km/cBl0cZhKor3o/9RUVSSVIqjUHn2TL1E0XRoyKDdunlReEMjTnVjdotAA+S7OlvhQBu3fuRtv98hbOHL0rgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnUJTZz0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnUJTZz0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7272C2BCB8;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974652;
	bh=XwOj8voSKg4AWPVrMgKYjN8lr2NiROyfMOeYVhXWe+Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GnUJTZz0sLF9aHUNElcD67R4crlmXpKkDSneKM2MBdZ6Q+VdQp6HlS7jyZMLcgOin
	 jiOIWjv2WA+dZGjIt68v+9wvh405M0+sislcU0bKTw6fHWV9ETNpOmFFx7wUaAhqTj
	 pqoKEDXC1REc6rMyDqWHQ/If1enGo6mRHEtQe01rsmvTtO9boCnfCQvrB9vOGPBvUA
	 3mh2b4FMB3VHRowkCQefMoujRIg2kKzgaz152FAk9kvEO01J37Fb4MsSmhuQljMXsW
	 A6hcbm1xkewAQanp23EiRv01OgmBJFNX/XTdI6f56yt6etUnkNhtH9Epi0w+fbu6Bw
	 2KSoCP6vUaYdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE1CC43458;
	Mon, 13 Jul 2026 20:30:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH v3 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Mon, 13 Jul 2026 22:30:04 +0200
Message-Id: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OzQ7CIBAGX6XhLAa2/FhPvofxgC20GFsaqETT9
 N2FGhOOk3wzuysK2lsd0LlakdfRBuumBPWhQu2gpl5j2yVGQEAQSSie1ORmi0eBjdHaSOBgOon
 Sfvba2Pfeut5+HF73h26XHMiLwYbF+c9+LNK8+3frohspJvhUM6Yo5w2nzaUflX0eWzei3I1Qm
 LT8KEIyGYCQXAnOCJTmtm1fAIhNBu4AAAA=
X-Change-ID: 20260701-nanopi-m6-ffeef7252fd7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=3224;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=XwOj8voSKg4AWPVrMgKYjN8lr2NiROyfMOeYVhXWe+Y=;
 b=opjDAlEG19s7LZr1JhOxwYdPzrQLt60IPebqWzeh4XOnmUtIKr+ieYvXn1liZMygaGeQUBtQ9
 5CxzoC+EJhRDSPE85rYtyKFmZlz+Zmd3FFHD+67uqZUZKlW6NDToaKQ
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com

This patch series add support for the NanoPi M6. This board is very
similar to the NanoPi R6C and R6S boards which are already supported.

Main differences:
* M.2 M-key slot with PCIe (Also present on R6C)
* M.2 E-key slot with PCIe and USB (from hub)
* 1 additional USB 2.0 port from an on-board USB hub
* RT5616 audio CODEC

Patch 1 documents the NanoPi M6 board compatibility string
Patch 2 to 10 are fixes and additions to the nanopi-r6 base DT
Patch 11 extracts the common NanoPi 6 series bits from nanopi-r6 into
nanopi.dtsi
The final patch adds support for NanoPi M6. Support for M6 has been
split into two files; one dtsi and one dts file. This makes it easier
to add support to the new M6V2 board at a later stage.

All changes have been verified using the schematics for M6, R6C and R6S.
Only M6 have been boot and runtime tested. Testers for R6x are welcome.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Changes in v3:
- Reorder patches so the DT fixes/additions are applied to
  nanopi-r6.dtsi as suggested by Jonas Karlman
- Add comment to gmac to rgmii-rxid phy-mode to explain usage
- Addition of pinctrl to sd and pcie are now marked as fixes
- Remove both always-on and boot-on from NPU regulator
- Link to v2: https://patch.msgid.link/20260711-nanopi-m6-v2-0-422675a65402@gmail.com

Changes in v2:
- Organize DT such that adding support to NanoPi M6V2 later is easier
- Use correct clk id for I2C mclk out as suggested by Diederik.
- Add a couple of acks from Krzysztof Kozlowski.
- Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com

---
Joachim Eastwood (12):
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
      arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing sdmmc cd pinctrl
      arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing pcie rst pinctrl
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove pull up on rtc int pin
      arm64: dts: rockchip: rk3588s-nanopi-r6: pcie2x1l2: add clkreq
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove always-on and boot-on from vdd_npu_s0 reg
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove useless vcc_3v3_pcie20
      arm64: dts: rockchip: rk3588s-nanopi-r6: add gmac1 add phy-supply
      arm64: dts: rockchip: rk3588s-nanopi-r6: remove bogus vcc5v0_usb regulator
      arm64: dts: rockchip: rk3588s-nanopi-r6: add comment to gmac phy-mode
      arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
      arm64: dts: rockchip: add support for NanoPi M6 board

 .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  67 ++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 +-------------------
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 798 +++++++++++++++++++++
 6 files changed, 1011 insertions(+), 792 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-nanopi-m6-ffeef7252fd7

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>


