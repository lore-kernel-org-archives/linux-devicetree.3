Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A07378D63;
	Sat, 30 May 2026 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780177233; cv=none; b=NJazxZML2/CCiVUZgg7NM46Q2U/dj1h0E1eB/FxbSzLMe3Z4mZL8cLSZef06ARF85HQnbSynx22YPDawtkqs6vcDgaGhbDF3XfDgMwJcllhZfhZuwsfqVkpoliy7XGntmDdTqDLmW3C+/5sRkf1Ps6C3/f+mVIoaQIldt8T3dtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780177233; c=relaxed/simple;
	bh=+3oUkLbhBpGLFG2o9Qg+l9rh7zW7WSrAKfm+iHX6+y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QqHf/L0tx3tSrt4pgI6oI5nEd73d/1w89twm6qqaR2Bzsx0wNCr6Xz9+JP3j5D3YpitPNx85bkXSaATWCys6iOofsde0SRTWhcK8olAxDdA8R0HyLpluf82D2T5qYY0pZI1Mj3xg7OyIAWzJZ3iHhVVQgEfSB1Cjjisy+3uT2gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOwCQWhn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOwCQWhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516A11F00893;
	Sat, 30 May 2026 21:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780177231;
	bh=0tqOO6Ey8WoBe2Yp/hCytGo0ORoFcd+v8Gfopa8G1bA=;
	h=From:To:Cc:Subject:Date;
	b=nOwCQWhnIJSoGVStvsqVrDYAB8sSH0GiS5FnlXzTo/3ZQWd8lRQpkaP3agYzsKO/g
	 bQuNmpR2hSUaWW6fETnSLi6UDC4btu/e67OVbYJLab2tilvKxtSqH6BJDy8eQOKHrc
	 ONbss7T8ZfbRCeKLVzdPpD5Qj80hQXyKdMjR85D/OohwhWIXOOiJ/AS84tPIw0ggHi
	 Ift/5HpK58wQIwS41kfjAu2wzgi020gSGGUuwGoFxH2hHYt8f+aaY9OEa51EEtW3oQ
	 EJ4DxZaK+LZQa38uEKlT1uBzDXtY5JYqqAKv0RPUvTyv/aVE0IITua4eIeITej64vB
	 CGrSnB0GZuPTQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.2
Date: Sat, 30 May 2026 16:40:27 -0500
Message-ID: <20260530214027.161945-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.2

for you to fetch changes up to 7557d67a6057362a65ad03a03cbefe7f03523003:

  ARM: dts: socfpga: arria10: Increase JFFS2 rootfs partition size (2026-05-14 06:56:55 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.2
- dt-bindings updates:
	- Document compatible for Agilex5 socdk debug daughter card
	- Document compatible for Agilex7-M devkit

- Add support for Agilex7-M devkit
- Remove reg property in the PMU on 32-bit SoCFPGA
- Set i3c alias on Agilex3 and Agilex5
- Update data-width of DMA controller on Agilex5
- Set phy-mode to rgmii on Agilex5
- Increase the JFFS2 rootfs partition on the Arria10 NAND SoCDK

----------------------------------------------------------------
Adrian Ng Ho Yin (4):
      arm64: dts: socfpga: agilex5: set alias for i3c controllers
      arm64: dts: socfpga: agilex3: set alias for i3c controller
      arm64: dts: socfpga: agilex5: update data-width for dmac
      dt-bindings: altera: add compatible for agilex5 socdk debug daughter card

Dinh Nguyen (3):
      dt-bindings: arm: altera: document the Agilex7-M devkit
      arm64: dts: socfpga: agilex7m: Add SoCFPGA Agilex7-M devkit
      ARM: dts: socfpga: remove the reg property in the pmu

Nazim Amirul (1):
      arm64: dts: socfpga: agilex5: Fix phy-mode to rgmii as HW provides clock delay

Niravkumar L Rabara (1):
      ARM: dts: socfpga: arria10: Increase JFFS2 rootfs partition size

 Documentation/devicetree/bindings/arm/altera.yaml  |   7 ++
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi       |   4 +-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   4 +-
 .../intel/socfpga/socfpga_arria10_socdk_nand.dts   |   4 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts |   2 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |   4 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |   4 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |   4 +-
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    |   4 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  |   4 +-
 .../boot/dts/intel/socfpga_agilex7m_socdk.dts      | 103 +++++++++++++++++++++
 12 files changed, 131 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
