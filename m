Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20ED3CFF69
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721532; cv=none; b=FYfnjrK2AwqDXGJD+DopGgMr/z0pY9QYN0bIBw64uIGlFx+mVzGCqliZ9X7rcSqCo/HQZQUkURquYQHr7ryNb+CIL6kWhoh/+GnQz/DMQr9KEDwiBXL5q9CI0vEacc4MniYgOZtIux5pIXwhVQ1yEPr0jqUk3wQvqUiQMUhI8XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721532; c=relaxed/simple;
	bh=VOXS061+i4B6rTq/FKv/O4sEPS77Y6p/9W3TknowL+Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a3PcLN603vMrLHtMD2vR2ocRiOz0tbFh84d9LYzFb58I/MJRXcA5MjTHpa7UCt0rLM3IdtOFwE8BVN7RLzGOdmDWgesBS7u4Uf9ncdXtbBulWB6u8aQfPt1l1eXUb8c8rVF+YmOnmstxyXjijoODIDek/PUyWJVXOAi5SQw0X2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+hGy3jW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+hGy3jW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78B8AC2BCC6;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=VOXS061+i4B6rTq/FKv/O4sEPS77Y6p/9W3TknowL+Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h+hGy3jWacBIJXxRAbS4yZbrvSbG4XU414OR40JSx2yhR3Ref8Yz81Oaid8yhWFwc
	 FQUUaftn7oHyPExdkY9OiJc9Bs2Xl2BqPnmzZbBTF9tMJGpWbkiJ/NeWZ92Crynvls
	 oq72IfgeUtPI67P8kzboI2PuZyjmpTjeFb0Vg3Q2QJMuwHnPwNy+VB+LaQS3Ao6b8E
	 g0voGArY8Hd6n7dOTtw8SrD08MVUyFCzNSZw3ZVNVpes0T8jwWUWqVH+XAVfiFyp94
	 XtTqTGutsb5Ehh1pAvNiMT8SALQDoS8wD+FSgOo4nPonVEKXFs+P9+sJ8H1JK9GSjL
	 rdpNPAS9Bcu4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D47C43458;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH v2 00/12] arm64: dts: rockchip: Add NanoPi M6 board
Date: Sat, 11 Jul 2026 00:11:49 +0200
Message-Id: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBAAv0L2bE1bKIgn/2E4VNjCGmlJi42G9
 O8CxsTjJJOZBQJ6wgDnbAGPkQI5u4I8ZNAO2vbIqFsZJJclr7hgVls3ERtLZgyiqaSSpqtg9Se
 Phl5769p8OTxvd2znLbAZA4XZ+fc+i2Lzft38rxsF4+yUF4UWStVK1Jd+1PQ4tm6EJqX0AQCxr
 Eq0AAAA
X-Change-ID: 20260701-nanopi-m6-ffeef7252fd7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=2868;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=VOXS061+i4B6rTq/FKv/O4sEPS77Y6p/9W3TknowL+Q=;
 b=2tOGs1JKJXsFraC6tYtOa24VTiPzRAZebPeA2bVTGxNavJ94mkWA9VK17zNIAeiWv8NbUjNLc
 WV+BrP5C0p+Dd8Ar/ILhIPJLn/IjF1ByDQcw9KQzeX0GRnd+I7bwj59
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

Patch 2 and 3 moves a bit code around. Please let me know if those two
should be squashed together.
Next few patches adds some missing bits the common nanopi dtsi file.
While the final patch adds support for NanoPi M6. Support for M6 has
been split into two files one dtsi and one dts file. This is to make
it easier to add support to the new M6V2 board at a later stage.

All changes have been verified using the schematics for M6, R6C and R6S.
Only M6 have been boot and runtime tested. Tester for R6x are welcome.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Changes in v2:
- Organize DT such that adding support to NanoPi M6V2 later is easier
- Use correct clk id for I2C mclk out as suggested by Diederik.
- Add a couple of acks from Krzysztof Kozlowski.
- Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com

---
Joachim Eastwood (12):
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
      arm64: dts: rockchip: refactor rk3588s-nanopi* to support M6
      arm64: dts: rockchip: move NanoPi R6 code into common dtsi
      arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl
      arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
      arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
      arm64: dts: rockchip: rk3588s-nanopi: pcie2x1l2: add clkreq
      arm64: dts: rockchip: rk3588s-nanopi: remove always-on from vdd_npu_s0 reg
      arm64: dts: rockchip: rk3588s-nanopi: remove useless vcc_3v3_pcie20
      arm64: dts: rockchip: rk3588s-nanopi: add gmac1 add phy-supply
      arm64: dts: rockchip: rk3588s-nanopi: remove bogus vcc5v0_usb regulator
      arm64: dts: rockchip: add support for NanoPi M6 board

 .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
 .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  67 ++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 --------------------
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |   1 +
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |   1 +
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 800 +++++++++++++++++++++
 8 files changed, 1014 insertions(+), 793 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-nanopi-m6-ffeef7252fd7

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>


