Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E781C84AB;
	Mon, 27 Apr 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305816; cv=none; b=hnHh7RRbNoW+2mUZEpieifWZjl3N+yc3DkIMEoZA6NOC1Y0ehd8UYTdbKJyasV+WPIb55rG0Xc4NJ+fRm5nxaiC+M53qfKOw07myHk9UUhiQ4WIXzfa3aIdsZ8l27Xu2w+sogDvRB6YeVtsDujv3TDoRPmx9BN3FTOdkWbV6KbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305816; c=relaxed/simple;
	bh=I4ir6Ovjx/QiMjkuCY9WvBOJQZy/wHI4QrJGQJ9aUKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XD4lBOoOMkvPqCdHFw68GcBkV63DKXxWgAU8MoDx9ujGs0fisa0SXGOCjFsHZVY7C7X3RMNfuoQSUycktPxSsw2YbP0t03OXzmfJFExdse8Gvj+VZmf3jmdgx93XBDluf1on84OkMU/7uwltDZrzHNejLNomQghdm8MZkMTrFqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q1+Q9/cb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q1+Q9/cb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A51274E42B35;
	Mon, 27 Apr 2026 16:03:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75E32600D1;
	Mon, 27 Apr 2026 16:03:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BC7010728057;
	Mon, 27 Apr 2026 18:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777305811; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D2StE0ESc8+cg1EXdiL6x5UAanNpeePnM77o0NybYIk=;
	b=Q1+Q9/cbHXUlq4aOs+WLc1EjpqJPR+ct9H4DiyTk59b0A1XMFkec67M6ZoB3PgMCdjIT80
	mM3SOHQaaouKKX9M44RQzw3xylQf/ycTgiWgD5uK2sQb46l1W6hO0ga1o3f474EjYjIdWD
	o0Tgz3tZUBlCIlQ4KNgJK2ulVT4crxKEThY+XkEmuzu5AxubaVzSIEcjtkQM37Vs+350hS
	bZA+pd45MU51xpz1ErtLa+221XKJ8zzelYrzspc36MD9wNHTby/68Gp5Dzm2OS0gRoznC3
	OC6dEqX0tUTZiRR81vg0IUdwJT9ekLGDG8wQ66q/+xme62SUYtX6tjwH+fsahA==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Mon, 27 Apr 2026 18:03:25 +0200
Message-ID: <20260427160326.370415-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

At boot, U-Boot will copy ATF/OPTEE certificates and DM into a LPM memory
region.
Passing it to TIFS with TISCI_MSG_LPM_SAVE_ADDR
https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
Before suspend, TIFS will save and encrypt TFA context and its own minimal
context.
At resume, U-Boot will tell TIFS to restore and decrypt data from this
memory region.

So, U-Boot needs to parse the device tree, looking for
"/reserved_memory/lpm-memory"
Moreover, from reserved-memory.yaml:
  Following the generic-names recommended practice, node names should
  reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
So @lpm-memory seems to reflect the purpose.

Changes since v1:
- add specific lpm region for j742s2 and j784s4 instead of the common
  one since the addresses are not the same.
- add j721s2 lpm_memory_region
- change j722s addresse to prevent holes
- link to v1: https://lore.kernel.org/lkml/20260312113446.1857592-1-p-mantena@ti.com/

Prasanth Babu Mantena (1):
  arm64: dts: ti: k3-j7: Reserve memory for LPM meta data

 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi  | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts      | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts     | 9 +++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts     | 9 ++++++---
 5 files changed, 33 insertions(+), 3 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
