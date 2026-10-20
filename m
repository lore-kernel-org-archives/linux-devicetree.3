Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.131.191.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466232;
	b=iMiXLD2fsmKuhFjx2H5LFzrmVUl+enJYbiuELgghIs1kb4/KgSric3xqZaE53T/cbXK/
	 dKcLk2zROaPgL6QOzRwP2UEjze6QLgBvh9GnqZEWWBPiAUqJEyMwxgu680mTsHgFeTpx3
	 3uRTaJjPwLecyQNqbjnqqnMvzJW0DKORFKazNyZi4XFINj0LOMfPhY8WZf4bAf2NotHR6
	 i0NAQkubTkyNfg6KNfsKAIHz19WdzoLeZ4BrlGPcDq1AhmKNrrHn9zZaw9ZKzjpsMixBy
	 7lMgi3SECh2rrZuLQN46yuTiD2H4wyf5MskQSRMYdSKUnK0JHYJEd2BvB8GnYNA8EKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466232;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ftc33jgQlW0KLggFstEt64pjQN6kG8PbZUP4xreE04Y=;
	b=McGk/sXjhNQ2z8fEKpVASXKdZUoRKF9hQn/6s0JYKTFc+/Zgm7IYqinnJRH8A1YbfrBx
	 Zx+0bV/5okv7zBTWAGvOhakwr49Qc26oefe/lCR7tX8fpy/1SCqoDW3dMsbDlDdHQj7X7
	 vt0CGWldu0hf2TsE11vkH4zRgrSlzG1+rte8Z7hwljy2kl3NcBCzClrezvOnjiU05tmBX
	 npjNT1SMbGDxGtThQNTzdPfFlvg53Nnk02yBCdDSr0KsxJNgtfPIWtiUwHGTh4FkjSwpg
	 TtX4X/fmDlkXqpJoIElrfWQVr2jYfUTXT4/0gH7R8Ta1PfwdYS6rsnwwWLrG2xVMaXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ninw0SC6;
	arc=none smtp.remote-ip=103.131.191.56
Received: from mail-m10313119156.xmail.ntesmail.com (mail-m10313119156.xmail.ntesmail.com [103.131.191.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA5606A31A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EA5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ninw0SC6
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a517deb;
	Tue, 20 Oct 2026 11:16:58 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Coia Prant <coiaprant@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 0/2] Support updating the PCIe3 PHY firmware on RK3568
Date: Tue, 20 Oct 2026 11:16:44 +0800
Message-Id: <1792466206-127946-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0aa1574fec6b03a4kunm7337cf0a9013ad
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQkJLGlYdSEsYHUNPQh
	4YTE5WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSUJDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ninw0SC6xo2ZqhBc/cdPFI8nTx/+SZqqS3vpbf4VOnu/excpHCcuUsJ9xmsPocLX82pFRjQUHiqweCs6YgRhAILO+yXdXAYQlS6+2/ptf8nzV39+9H2G40NObj0dx9FiBto7SxSVQ49CqyPlRlDf34jXS36R1zYSWVi35ibWTm4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ftc33jgQlW0KLggFstEt64pjQN6kG8PbZUP4xreE04Y=;
	h=date:mime-version:subject:message-id:from;
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list


The RK3568 PCIe3 PHY contains a small controller that runs microcode
from an internal SRAM. The microcode present in the PHY is not always
the latest one; with a stale version the PHY may fail to establish a
stable link or come up with other issues that are otherwise very hard
to diagnose from the host side.

The firmware stays optional: when firmware-name is not described in DT
(older DTBs) or the file cannot be requested, the driver keeps the
existing behaviour and runs with the microcode already present in the
PHY, so there is no new hard dependency for existing boards.

Patch 2 for the PHY driver depends on a pending patch that fixes another
issue if anyone wants to apply this series for test:

lore.kernel.org/linux-rockchip/1792286036-208067-1-git-send-email-shawn.lin@rock-chips.com/


The required firmware file is available in the rockchip directory of
the linux-firmware repository:

  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

Load firmware during kernel compilation using the extra firmware assignment:

CONFIG_EXTRA_FIRMWARE="rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw"
CONFIG_EXTRA_FIRMWARE_DIR="/home/lt/linux-firmware"

Tested on a RK3568 EVB1 with a PCIe3 x2 NVMe SSD, the firmware is loaded
and the link comes up:

  phy phy-fe8c0000.phy.0: lane number 0, val 1
  rockchip-snps-pcie3-phy fe8c0000.phy: loaded PHY firmware rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw, size 16384
  rockchip-dw-pcie 3c0800000.pcie: host bridge /pcie@fe280000 ranges:
  ...
  pci 0002:21:00.0: [1e0f:0009] type 00 class 0x010802 PCIe Endpoint
  pci 0002:21:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
  pci 0002:21:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x2 link at 0002:20:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
  pci 0002:21:00.0: ASPM: default states L1



Shawn Lin (2):
  dt-bindings: phy: rockchip,pcie3-phy: Document firmware-name
  phy: rockchip: snps-pcie3: Load updated PHY firmware on RK3568

 .../bindings/phy/rockchip,pcie3-phy.yaml           |   6 ++
 drivers/phy/rockchip/phy-rockchip-snps-pcie3.c     | 101 ++++++++++++++++++++-
 2 files changed, 105 insertions(+), 2 deletions(-)

-- 
2.7.4

