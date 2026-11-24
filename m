Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511550;
	b=I4N6cEdaGtZkxyfk76FPEWCmpbbl4A3RYtVcZyODgPxQGkwdGpBLdYEmgpgRYNoYKRUo
	 qHpMi0tknR8c0J89Fl0FIsLENaw825pNIY8zQ2zBVNeL34xhj5VSz2H8364tK84urMeHQ
	 hs3rh95HCSpGoPLHPIsJ62ULv50/DnHEr/NEjYOm5AMZmPYrDOQkXS5lNMQ2MyofEeLF7
	 iTnoC8gJcPaY01P+DmXXISmch4lMJ2wLbA44ILNeh45r53WU2uxoDgAYBBjfcb24lSq7n
	 XY5YeK+40caOEKeJZdyRfvnmrYzb7nCUGLAb7tS8nW43Bi//9GJqTa9LbsVaqdwB8JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511550;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=rtdD3DYG6LvavPwQ3FDRehaDHg7vobcM7+wk2yZq+IU=;
	b=ZPY8gzE274w/Bn54VDqxHI3KZh5AF4I+qypGpHniJ16OPwk7T7bnwDgAAWZw3/iKnFqD
	 sJKK/5VoAoArKGf1/sXfaaQadyzbgcIxOos4Ao/nGGt0rOJsTU8v9qKMpo9R81NGIspKo
	 Girwiixt+Zij/HN4AX1kA/mln6YR+ibtzb3BkfhcDUtJdSMTE636aI8snEdJ14jO1Mo1w
	 hedhQFx9XZZp19HNdO2ZDWDvr0TfHsLQ14s7ezabvMbrxG9hMGC6O1zhkJYJuWuw3R2Fk
	 Zrwo38RZIqRgVpXJP0CkF0uvq1ng0NPIqX8xlSaHKGy5B3+phdVrkxuhhlTdfoRQSvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ix52+Ezb;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE30606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ix52+Ezb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F8EA1A17A9;
	Tue, 24 Nov 2026 09:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03836601E1;
	Tue, 24 Nov 2026 09:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E9A911E68A4D;
	Tue, 24 Nov 2026 10:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511545; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=rtdD3DYG6LvavPwQ3FDRehaDHg7vobcM7+wk2yZq+IU=;
	b=Ix52+EzbSvj9jifwCwCJAjj/9QjlB3zUxscW9WIGk0B4HaHoEug2eD+mA30X0TZB0r4hfa
	DFlOIYqCULgop3qpHmzQrfMaZJUwztk1pALp7x2iLHNUts9sEHN3xM57GgmxInTG5krZK0
	I+tXnJlXRJje8GW1TzoOMGHaRvJ7IZ2XRYoNMCDQQNXu2cWSGFfB8kRp3KVFegPCR6S8Wk
	Ct1ooel80t7T+dFZ4SEWMRoWX+PkBYTXFatyNsrJfVRotNPENdJYirU/ISss6svYVLyZnc
	4JLXBYHOle2C+CbHIQkoF6Gake1wYjIUmdg6QKZM8Jd8yfmPy+qgffYuleVgOA==
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
Subject: [PATCH v7 0/6] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Tue, 24 Nov 2026 10:12:15 +0100
Message-ID: <20261124091221.2593576-1-richard.genoud@bootlin.com>
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

Changes since v6:
- move j721s2 carveout before optee
- move j722s carveout before tfa
- Link to v6: https://lore.kernel.org/lkml/20261117130737.141993-1-richard.genoud@bootlin.com/

Changes since v5:
- rebase on v7.4-rc3
- gather reviewed-by
Link to v5: https://lore.kernel.org/lkml/20261021080947.3747284-1-richard.genoud@bootlin.com/

Changes since v4:
- rebase on v7.3
- move J784S4/J742S2 carveout before optee and factorize it in
  k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi (suggested by Udit)
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


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
