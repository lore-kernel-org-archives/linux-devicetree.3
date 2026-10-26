Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.131.191.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000422;
	b=4mdcUDJZ4JrxzhJ4vOj/X7sLhiXrydZ1et5InuNU/g+auzB3iC4sU3l+yuyRMIQGWpCe
	 mmsQFwctTh5zVnpdkJ5+QQZZY4CgXPIi4631RgL+HzUkKENDOdSulMwaRfdpj05A6vpgl
	 hCwImjT0Z76glQlEuBbdOWmNiwXDXrpYqT5sfjTNzzR3CFKAmJZ5aEOpz+zMah/ZQMo9w
	 aJOZZn8kUW6s5Vhea2Cfp3nSCTNmZ+eefrelgzryCjny/+5cdwYJ+wzk/wfXDZyKJmy39
	 vFYU1Pz5WSN73U3lWW8VaZTbMhNR+aOyWxiwnkC150Tkg7BsWtNU1fEIr+F2uPKd42A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000422;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=AmqmBNt3ibSYXW3i4m+4Vz6EYbDyVbmWSd6OxJ7YNoE=;
	b=Gpf7k5xRdWsH5ipn0f+oPLPc3v74rwLGBFfMV1nn4aaJ9yPo3Vtee+GZ51/jm7m/MA05
	 +6WB1Lu4NgZFZ6CSr24BPLIK0+LHv/zxLHU80WnTuKYNhHDe1LS1P1N78i/W1nfnPXA4v
	 iMPYhh0YUADfuT4kr4LUcWvX/ak8GvS2r0UoreJCMHTiZv88uVAWFhlDqkmjDYXghx1Gc
	 XmQSjFLwsYTEIwdaN5OCzc0HPTi1u+RHVmfB7qovcGjZA0xjKR0Rvl/mKMfTAMf/JQcoV
	 /7s9IVIf1skuvA47YhcsMddpbLRWNneHmhwLS3qf2uBZcd+gdOABJC0/UGzesYaAtRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=E7owXOQf;
	arc=none smtp.remote-ip=103.131.191.49
Received: from mail-m10313119149.xmail.ntesmail.com (mail-m10313119149.xmail.ntesmail.com [103.131.191.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6DE606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6DE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=E7owXOQf
Received: from localhost.localdomain (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5257abb9b;
	Mon, 26 Oct 2026 15:40:09 +0800 (GMT+08:00)
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
Subject: [PATCH v2 0/2] Support updating the PCIe3 PHY firmware on RK3568
Date: Mon, 26 Oct 2026 15:40:01 +0800
Message-Id: <20261026074003.1169669-1-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.25.1
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
X-HM-Tid: 0aa17727082d03aakunmbf670e0d2f0006
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH04YVkhISk1DTB8ZTBkdGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=E7owXOQf/AHjGzE/RSaaZce+yZqO9cBhcQ251wLnTdZ7qgUe7qH0OzISDJM+QpPYL3/P8Dx0lOMXVSILRaqOinuTdAMEbqot08Zt8hdJYfSY3BgvHu90bhR/nfismEWVYzUtWIx0/UTZKhINmFmKA2I9iRhytKK/SgtSaK2vJwA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=AmqmBNt3ibSYXW3i4m+4Vz6EYbDyVbmWSd6OxJ7YNoE=;
	h=date:mime-version:subject:message-id:from;

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

 .../devicetree/bindings/phy/rockchip,pcie3-phy.yaml  |   7 ++
 drivers/phy/rockchip/phy-rockchip-snps-pcie3.c       | 101 +++++++++++++++++++-
 2 files changed, 106 insertions(+), 2 deletions(-)

-- 
2.7.4
