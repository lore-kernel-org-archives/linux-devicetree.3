Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584374;
	b=VHMv5TVMWcK1Gy7ZrSZNfku0EPFutoqLeiVprlk5ALVeXsoIG5KbbE9EulP96dUBtCxu
	 0z8r0pBMaWDXJK1O1BQFws0z1R0/KK48w0FITSu4M5Kjokyo4aHwib/JhZiD7R2iTezAd
	 eHflLorbx3OrFKBZAxMQ+d1A/3NtB8hdGatF9FxeUsVaMOyuSYvzFqRXfdz3+DEx/o2dh
	 jpnrZ1FjkInfFHZBOeorB/9EnHPsQO8yhnbfDE3UspSmhptiLlPpVM5Sk5kEVXplu7IVb
	 lc1gBXP2VBCHECCQmTzshJ+bz99N709cvNHMp2A5oNSxFmV9BI43y3Wtyt6jc7Wc9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584374;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=s/53fzjdKTL1p4UUbauTe1x56R+kaRU23WwKPdP7V0w=;
	b=Pb39H7+RiSUxhFR2Ds19kkmcB8NuWl3TefpPILNe3h5uLXsvLRRDldsEq9eiOOkog8aI
	 NYZpOd2SMe1KBSoAQ5zP2z+NKrWhve9Nk/Xzye2Wcp7R0PXaHeK4cPHEeRU9rupWWQKn3
	 cRnvMAo5ieuUz6owcIEqJrsxb8436DfvVDOFt2/9+rBr/B7BfhW/7NDUjGXxKOt6Pulia
	 lNBc1uYoawIr9PgOsqCXjMeqiqxJMiZu32SbVAQnGrM1a/63l0kgZKuoj2E/VAQrjA0mP
	 z41A68ekK7RxNzOa2lMJXdo8FoCzKLw/0AnhSDdu0a6lF/l6HRh3Jz0l7DZVwYjtX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="L8E//mnz";
	arc=none smtp.remote-ip=156.224.81.47
Received: from mail-m8147.xmail.ntesmail.com (mail-m8147.xmail.ntesmail.com [156.224.81.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47FE606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 01:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47FE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=L8E//mnz
Received: from localhost.localdomain (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 531ad2652;
	Mon, 2 Nov 2026 09:52:42 +0800 (GMT+08:00)
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
	Diederik de Haas <diederik@cknow-tech.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v3 0/2] Support updating the PCIe3 PHY firmware on RK3568
Date: Mon,  2 Nov 2026 09:52:34 +0800
Message-Id: <20261102015236.3844843-1-shawn.lin@rock-chips.com>
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
X-HM-Tid: 0aa199f5736803a4kunm2334e46e3a72b4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS04aVh9CThlJGU5JTB5LT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=L8E//mnz6dmP5a7E30ZtaaWC5w1UHiM6YphIilYXKz7V57ft09HkKAGZw1QqtAKZj1ZpQBwf5efcBiI3mZ2re7vObL5pQmVnVp7+4lojvsiZHbo3KiRZ/QJ1XIA/iJZI6IfMDfaGzfe9yRPu5PCe55Pu0n6WTud0I8Pjg28PGKI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=s/53fzjdKTL1p4UUbauTe1x56R+kaRU23WwKPdP7V0w=;
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

  https://lore.kernel.org/linux-rockchip/20261102005129.3745527-1-shawn.lin@rock-chips.com/

The required firmware file is available in the rockchip directory of
the linux-firmware repository:

  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

Load firmware during kernel compilation using the extra firmware assignment for quick
test, otherwise rebuilding initramfs or copying firmware into /lib/firmware:

CONFIG_EXTRA_FIRMWARE="rockchip/pcie3-t22-c8g2-1.6.3-202a-p7.fw"
CONFIG_EXTRA_FIRMWARE_DIR="/home/rockchip/linux-firmware"

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

Link-to-v2:
https://lore.kernel.org/linux-rockchip/20261026074003.1169669-1-shawn.lin@rock-chips.com/

Link-to-v1:
https://lore.kernel.org/linux-rockchip/1792466206-127946-1-git-send-email-shawn.lin@rock-chips.com/

Shawn Lin (2):
  dt-bindings: phy: rockchip,pcie3-phy: Document firmware-name
  phy: rockchip: snps-pcie3: Load updated PHY firmware on RK3568

 .../bindings/phy/rockchip,pcie3-phy.yaml      |  7 ++
 .../phy/rockchip/phy-rockchip-snps-pcie3.c    | 90 ++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

-- 
2.25.1

