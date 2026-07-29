Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D087209F43;
	Wed, 29 Jul 2026 03:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785295391; cv=none; b=Ks8Kuy3wqjclOhu3cF2pjs1pKOKxkpPMsqW1AXvhmXvfcZ1MhPrthcFLy/9FC9MJnePBfXdpJJ0pqwc75knLCtjv6NwJ9xu7nXg1oaMkrdQRmb0HgpoAUW4qh9kPaJotnuXzyjZk85Glfki4vOsTQkaOf6QG3RBAo8jkWmEgyyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785295391; c=relaxed/simple;
	bh=x1M/ZNFaNVrjMwclGRBCOkX42djtCUA0iBO5bmpLKtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAiIOz+JWmjrJrnzeitVsGAlIvIOYzlyRGKWn3PtabnQ0gf3Et7hGmOLgTGwr7HsvMZtIvSwjPchrWfr5pXblzUxYKg7cAO5ibdFTR5TCZAUdNckQd5QmDQuygKflpd2QDlBw1E3SSJExzaRq8BQIKaELdud8RHJ5w+bQFpF5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqrMhi3v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqrMhi3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14F51F000E9;
	Wed, 29 Jul 2026 03:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785295390;
	bh=eDfRrZTgJlpfiEUAysiN58zud/Ic2eIBAuMILV71YM8=;
	h=From:To:Cc:Subject:Date;
	b=LqrMhi3veXDAQ4EfyF3/HS6VxaEHpGSe0j/+dQ5aZrFATdMYq5jDyyxyrv7Vw+LAz
	 h9k+hyolOVmLLBuOBQqKz3LT0+fsGeTYLpsB8vPqxpjiBVPJd0jl8eGcisBHynOPvA
	 jv0wP3Cr48v3kwUckChuku/WqWmIxQ7nmnLUVoYCad8r9TN7qmTJ81x8u52cPoBAid
	 3KTgDy/EvcRVNB74BJAPUgDQ9JqBnISNX4+kRQSvy2XsXdTZJHBnPrxq3eAoyS6WkW
	 W7PyutvOFAWBhBXcGA9nAlZAPMKukiUCz7jITcYdXS4pmRIvtpvcWPXPOAFZpX8vij
	 fabtzaPvC55WQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: updates for v7.3
Date: Tue, 28 Jul 2026 22:23:08 -0500
Message-ID: <20260729032308.1359743-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.3

for you to fetch changes up to ff98c9832fd430ba7b3158b8521002c8eb8aa16c:

  arm64: dts: socfpga: use consistent QSPI boot partition label (2026-07-27 22:09:15 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.3
- dt-bindings updates:
	- Document compatible for Agilex72
	- Document additional interrupts for Agilex5

- Add the additional interrupts for the gmac on Agilex5
- Use decimal number for interrupts, not hexadecimal
- Enable the SMMU on Agilex5
- Add dma-coherent on XGMAC nodes
- Add initial support for the Agilex72 SoCDK
- Correct indentation on Arria10
- Update QSPI boot partition label

----------------------------------------------------------------
Dinh Nguyen (2):
      dt-bindings: net: altr,socfpga-stmmac: add more interrupts for Agilex5
      arm64: dts: socfpga: agilex5: update channel interrupts for gmac1 and gmac2

Geert Uytterhoeven (1):
      arm64: dts: intel: keembay: Always use decimal interrupts

Krzysztof Kozlowski (1):
      ARM: dts: intel: arria10: Correct indentation

Nazim Amirul (5):
      arm64: dts: socfpga: agilex5: Add per-channel interrupts to gmac0
      arm64: dts: socfpga: agilex5: Enable the SMMU
      arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes
      dt-bindings: arm: altera: Add Agilex72 SoCFPGA compatible strings
      arm64: dts: socfpga: agilex72: Add initial device tree

Tze Yee Ng (1):
      arm64: dts: socfpga: use consistent QSPI boot partition label

 Documentation/devicetree/bindings/arm/altera.yaml  |   6 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |  46 +++++-
 .../boot/dts/intel/socfpga/socfpga_arria10.dtsi    |   2 +-
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 arch/arm64/boot/dts/intel/keembay-soc.dtsi         |   2 +-
 .../arm64/boot/dts/intel/socfpga_agilex3_socdk.dts |   2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 112 ++++++++++++++-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |   2 +-
 .../boot/dts/intel/socfpga_agilex5_socdk_013b.dts  |   2 +-
 .../dts/intel/socfpga_agilex5_socdk_modular.dts    |   2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi    | 156 +++++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex72_socdk.dts      |  27 ++++
 12 files changed, 346 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
