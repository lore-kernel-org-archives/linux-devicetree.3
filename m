Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98123B0ADB;
	Thu,  8 Oct 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791478059; cv=none; b=j3QnUvI5b/jLKqCrtdD44+Kb6DQjEc935fp4knRUhojvlonDh0L3kHZyicRB5gzdYPsSHsNh3/era1R7aoSBLfOu/yuGRT4cUKFfv18JfUVklBtkWBQvhAeYNvoSyFivo2T7xY76ygMS7BUQnd9iZJNxmGtcopWkHRlWJ/rL1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791478059; c=relaxed/simple;
	bh=MViuzeMHvA+hxXpHNeN0idu0VY2OLXrPpmEja5teSEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4WYeJ9YRMXyCFQaC1xL5SgQmi0Mrhzpsurp4/NDAM5Vj24x8hYYAB0tPIwfUV5ynPpWCFj1j11JbcPMzfA8upXADLiTD0rYwN6EqJPbI4o0gh7PzH4jS/Zofukwsxx1c92d1wKo9be4qhrrR7vh3uQPwiMPWjhy20ysoE/9/Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACPbM7F6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACPbM7F6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2841F1F000FF;
	Thu,  8 Oct 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791478056;
	bh=P5QqN91oq5UQdWOAGLusHuKZASEgHmUyhsRnptvmHmQ=;
	h=From:To:Cc:Subject:Date;
	b=ACPbM7F6MN1iZ8oNQ6xEzcyA5gR0Z2PehoZz+TkD1YJmcOc7mf+7dStRzhXapDwie
	 KlpLbCqjGp1Cjht/TULoaKmI0MqflCUbyCAE3UVtomJmlYAe/rF/r5Xr27Q03Qacyb
	 DwW3GUT726l9P7JysogKeO+00K208oNMn5QoZ1mwsB/ECks26AFcWk+Yexib+OaXaX
	 +x8XHDZCSEEFoRlB0pDRdwUckKG+wOW+DSMHSlHiIjh4mhNHtyXF6/SIMaXvAyognu
	 mh7dFEjZGBhvjXVUSYQKIlpjFX94apkQEYbVJdYkep5yhwP/gjONVJSbrFCzV2dl90
	 Yb2MAqw240bHQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Date: Thu,  8 Oct 2026 11:47:35 -0500
Message-ID: <20261008164735.566333-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.4

for you to fetch changes up to 1c4d22949a77d82505188bf36a4bcae0cbdf699e:

  arm64: dts: altera: Move all SoCFPGA files to dts/altera (2026-10-08 11:25:18 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v7.4
dt-bindings:
- Add the SOCDK eMMC and TSN config2 boards based on Agilex5
- Update the interrupts spec for the Stratix10 Service Layer
dts:
- Agilex5
   - Add FPGA manager, region, and USB3.1 node in the base DTSI
   - Add SD/eMMC on the SoCDK OOBE card
   - Add the SoCDK eMMC daughter board
   - Add support for the debug daughter card
   - Add support for the  SoCDK TSN Config2 board
- Add SDM interrupts for Agilex and Stratix10
- Move all Altera SoCFPGA dts files to dts/altera

----------------------------------------------------------------
Adrian Ng Ho Yin (3):
      arm64: dts: intel: agilex5: add USB3.1 controller node
      arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
      arm64: dts: agilex5: add support for debug daughter card

Dinh Nguyen (3):
      arm64: dts: socfpga: agilex5: add FPGA manager and region nodes
      arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board
      arm64: dts: altera: Move all SoCFPGA files to dts/altera

Mahesh Rao (3):
      dt-bindings: firmware: Add interrupt specification for Intel Stratix 10 Service Layer
      dts: stratix10: Add support for SDM mailbox interrupt for Intel Stratix10 SoCFPGA
      dts: agilex: Add support for SDM mailbox interrupt for Intel Agilex SoCFPGA

Nazim Amirul (1):
      dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board

Tanmay Kathpalia (4):
      arm64: dts: agilex5: add SD/eMMC host controller
      arm64: dts: agilex5: enable SD card on SOCDK OOBE card
      dt-bindings: arm: altera: add Agilex5 SOCDK eMMC board variant
      arm64: dts: agilex5: add SOCDK eMMC daughter board

 Documentation/devicetree/bindings/arm/altera.yaml  |   2 +
 .../bindings/firmware/intel,stratix10-svc.yaml     |  10 ++
 arch/arm64/boot/dts/altera/Makefile                |  14 +-
 .../boot/dts/{intel => altera}/socfpga_agilex.dtsi |   2 +
 .../{intel => altera}/socfpga_agilex3_socdk.dts    |   0
 .../dts/{intel => altera}/socfpga_agilex5.dtsi     |  61 +++++++++
 .../boot/dts/altera/socfpga_agilex5_socdk.dts      | 146 +++++++++++++++++++++
 .../socfpga_agilex5_socdk_013b.dts                 |   0
 .../dts/altera/socfpga_agilex5_socdk_debug.dts     | 121 +++++++++++++++++
 .../boot/dts/altera/socfpga_agilex5_socdk_emmc.dts | 123 +++++++++++++++++
 .../socfpga_agilex5_socdk_modular.dts              |   0
 .../socfpga_agilex5_socdk_nand.dts                 |   0
 .../socfpga_agilex5_socdk_tsn_cfg2.dts}            |  40 ++++--
 .../dts/{intel => altera}/socfpga_agilex72.dtsi    |   0
 .../{intel => altera}/socfpga_agilex72_socdk.dts   |   0
 .../{intel => altera}/socfpga_agilex7m_socdk.dts   |   0
 .../dts/{intel => altera}/socfpga_agilex_n6000.dts |   0
 .../dts/{intel => altera}/socfpga_agilex_socdk.dts |   0
 .../socfpga_agilex_socdk_emmc.dts                  |   0
 .../socfpga_agilex_socdk_nand.dts                  |   0
 .../dts/{intel => altera}/socfpga_n5x_socdk.dts    |   0
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   4 +
 arch/arm64/boot/dts/intel/Makefile                 |  12 --
 23 files changed, 510 insertions(+), 25 deletions(-)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex.dtsi (99%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex3_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5.dtsi (93%)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex5_socdk.dts
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_013b.dts (100%)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_debug.dts
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_emmc.dts
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_modular.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel/socfpga_agilex5_socdk.dts => altera/socfpga_agilex5_socdk_tsn_cfg2.dts} (73%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex7m_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_n6000.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_emmc.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_n5x_socdk.dts (100%)
