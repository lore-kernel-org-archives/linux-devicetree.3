Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570198;
	b=YMHOy/OT6N3dM4K8kRTW60yz1GTkNg/CuZJUyMLaspEuIENiSodpexGld/8zNDpSWtln
	 8mlSG22gWoP6Ok+GOtHrV0x+Jiw2T4BEzvOMOxQ8jkci+v5nH6RztuhDXKZCJK5EbgLkR
	 q3yg4bfPtIRsI8jEzCAajSxQSeoYJ0Io3UqRJ4hwDLcQdv4INco5K888pHxlS/WF/LN3G
	 ka1e4M/CGiiT29gKDgfAe3YGkaRj6cenBpv8UY5nZZWAIkJnrQN0LVtf5WxbWmd/2qfo6
	 Un3Qu5TBjJrBlMnEiItzCgnl6TCaj1DMlxzH4GugXJqpS/N9KKc8t5ZlXno7HS3Bfvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570198;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ZAB7/hCKkKAoMIDThIlw5LbxXMZC/TORWW4H4NENksU=;
	b=HZ2+g3jAeUVxsL7blEyKXAc3l0FMvrbWvY2F2MVwI+b3RTnDWiLpo9DEP1/R/25ezWi6
	 LA5beWis1PuSufl8l4HXCiUZGxW12ewTmIJClJjgFjGMB4h0pRaY0LLeZTb/HDiPQp9rH
	 Zgkh+HaiNndkKB7xB0rVbppkyV+9N+XH0IjuBRTJAxfH5LjjI8Dos0rXbJZuK66qrcQqI
	 Ba+DUpKTu/POqxFG0aZa556t50ARawC/5WwMWTzI/l7BegWY9RfOsZSyAbIJ7jK6UA/gH
	 /rvnRqtDRkvQXr14dcjOm3+ZlVOGATbM92HFKcKUiW+O8ECE/3HqU1te/XaCoe5RdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EaTH8EjF;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC4606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDC4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EaTH8EjF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E2F3C5CD71;
	Wed, 21 Oct 2026 08:10:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26FEB606E3;
	Wed, 21 Oct 2026 08:09:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75F7C10328934;
	Wed, 21 Oct 2026 10:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570192; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ZAB7/hCKkKAoMIDThIlw5LbxXMZC/TORWW4H4NENksU=;
	b=EaTH8EjFazQqArMqLY4HQgSKLw5UTigyedzb/yLfJdgfm1IitqfbT6GmAplaOonaoTKPNx
	E8YmCNLQsrWoPu9xBjqIGJeWvraAt4xi/TxsyEMgDz16lIC7vuA+SFwgtP3MQ47Hw/ULXw
	nk3zpWM7bQ7/ZtiC/dqiZ4+IGNm2mu3EMiK4bh4jj2HlmSLEArLslt0t2f8PGfzRh3+J+w
	CgF7wel8SHo8HrAWsZqZTPqA2SyPuC7XwmB8jIqbr0/CD+56fWY0NXDUu4QA/x3e18roYG
	LT/KXyQNhqXHVg/YBNEbSZ+H3rETKO/sf2dVufO/kQy1lG9UGHuOiWE+5BHqCQ==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v5 0/6] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Wed, 21 Oct 2026 10:09:41 +0200
Message-ID: <20261021080947.3747284-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
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
X-Last-TLS-Session-Version: TLSv1.3

For TI Jacinto SoCs (J7200, J721S2, J784S4, J722S, J742S2) which support
low power modes, a chunk of memory is reserved for LPM metadata, needed
for saving ATF context and the certificate information of ATF and OPTEE
and the DM image. This LPM metadata area is firewalled to be accessed
only by TIFS.

At boot time, U-Boot R5 SPL copies the DM image into this memory region
so that it doesn't have to be reloaded from storage at resume, speeding
up the resume time.

U-Boot R5 SPL/TIFS use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

NB: Unlike for Sitara, this memory region is not part of the DM memory,
which is not retained across suspend, so the Sitara binding can't be
re-used here.

Patch 1 adds a new binding for this layout.
Patch 2 skips the firewalled lpm-metadata memory region
The other patches add the memory region for the TI Jacinto SoCs (J7200,
J721S2, J784S4/J742S2, J722S)

Changes since v4:
- rebase on v7.3
- move J784S4/J742S2 carveout before optee and factorize it in
  k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi (suggested by Udit)
- use dedicated printk format %pR for dev_dbg() log
Link to v4: https://lore.kernel.org/lkml/20260921145325.300025-1-richard.genoud@bootlin.com/

Changes since v3:
- rebase on v7.3-rc4
- skip mapping the firewalled lpm-metadata memory region
Link to v3: https://lore.kernel.org/lkml/20260703143717.177362-1-richard.genoud@bootlin.com/

Changes since v2:
- Split the DTS changes per ipc-firmware.dtsi
- Reference the LPM carveout through a phandle
- Add a dt-bindings patch documenting the "lpm-metadata" memory-region
  name for the Jacinto layout.
- Use the generic @memory node naming instead of @lpm-memory.
- Clarify how the DM image is handled
Link to v2: https://lore.kernel.org/lkml/20260427160326.370415-1-richard.genoud@bootlin.com/

Changes since v1:
- add specific lpm region for j742s2 and j784s4 instead of the common
  one since the addresses are not the same.
- add j721s2 lpm_memory_region
- change j722s addresse to prevent holes
Link to v1: https://lore.kernel.org/lkml/20260312113446.1857592-1-p-mantena@ti.com/

Richard Genoud (TI) (6):
  dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
  remoteproc: k3: skip mapping firewalled lpm-metadata memory region
  arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Reserve
    memory for LPM metadata
  arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM
    metadata

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 18 ++++++++--
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 +++++--
 .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 12 +++++--
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 12 +++++--
 ...-j784s4-j742s2-ti-ipc-firmware-common.dtsi | 12 +++++--
 drivers/remoteproc/ti_k3_common.c             | 36 +++++++++++++------
 6 files changed, 80 insertions(+), 22 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
