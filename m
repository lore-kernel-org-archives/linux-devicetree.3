Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BC73890F3;
	Fri, 24 Apr 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.232.1.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023441; cv=none; b=px4st7DlgEddGaWrbBuTfGyUVZNLSfV5NTAY4AWa0ZKLVhclQkXn0I3ee+O34lUqKY7ZKj+B0hSVHzqAjrAVnmzJwTHDmec2zTANpgKxdbd2yRxfzCm7RmTLrP9moxWKdyiBhdo4fjjrN494e7ZdVLWctbCtQ+arc7BCslzR3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023441; c=relaxed/simple;
	bh=tPKNOQ8tFfrDVSGdnYn/5C3W0D4rP2QDRj63GZG8vsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JgeY8jJfljKTlk2Vtca6d7f0ce8KoSxbxs68sPn1ya4rxLXIvTO+hRIzgBImGLMgurrbRvRPSisVVX7fk408fxXTXKxHKaKUrqr9sp518P8oSruLHdTI/ERJBCfUJ4NA8mfv15yG4tVkYbWtRqwCP/qp7vISiB58srq0rjGQoec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at; spf=pass smtp.mailfrom=student.uibk.ac.at; dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b=Y9PgnblU; arc=none smtp.client-ip=138.232.1.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.b="Y9PgnblU"
Received: from surface-pro-5 (77.119.189.242.wireless.dyn.drei.com [77.119.189.242])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63O9ago91184944
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 11:36:46 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63O9ago91184944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1777023407;
	bh=HLJxDrkixMXPsXH2OAxwjljjHn3k7qhworZTCrexYVc=;
	h=From:To:Cc:Subject:Date;
	b=Y9PgnblUa1aoWUyT4wfZFk1xG6xiLaUU2qK8P8+PJj4faPENA0jwl2SscxzAirL1r
	 /Wgx4AX4FggpC5APoG++uocqDPU3c0VV1GnCbBGnNJVYxBzQaqkIztS8gLzgOHBLO8
	 rUQb8OhDskM2nyo0cnYtnK32bZh6n9S6+GVyCgZA=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v5 0/2] Add support for Amediatech X98Q (Amlogic S905W2)
Date: Fri, 24 Apr 2026 11:36:31 +0200
Message-ID: <20260424093633.10734-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -12.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,UIBK_PHI_SUBJ,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Supported features:
- 1GB RAM (2GB variants exist)
- 10/100 Ethernet (Internal PHY)
- eMMC and SD card storage
- PWM-based CPU voltage regulation
- UART (Serial console)

Notes:
- The console uses uart_b at 921600 baud.
- Verified memory via /proc/device-tree; U-Boot patches the node.
- Tested on the 2GB RAM plus 16GB eMMC variant.

Changes in v5:
- Drop Wireless SDIO Module comment.
- Add generic description of Wireless SDIO Module in dts.

Changes in v4:
- Add/Change hardware description to cover letter and dts patch.

Changes in v3:
- Change position of the entry in the amlogic.yaml.
- Change formatting of the Amlogic W150S1 Wi-Fi module comment.
- Fix several formatting issues.

Changes in v2:
- Split dt-bindings and dts changes into separate patches.
- Updated model string to match documented vendor prefix.
- Put vddio_sd states array in a single line.
- Added a comment for the unsupported Amlogic W150S1 Wi-Fi module. 

Christian Stefan Kövér-Draxl (2):
  dt-bindings: arm: amlogic: add support for Amediatech X98Q
  arm64: dts: amlogic: add support for Amediatech X98Q

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

-- 
2.54.0

