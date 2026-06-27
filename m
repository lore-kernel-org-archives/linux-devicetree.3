Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA31990A7
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553753; cv=none; b=OcWDjYGhQdePRGcUDpLWQbxCKO87mCWaeGO6iwG1DH8kZKDtgcIliPuMYCfA4a2Gn55mosxQVIBPdaYzY8mczbk5yZzelAGaIpaOYhHTFy81P0SID+d+3A2OvCKELV10Zs5vGnNWDMIaRdKZS+TgxkDSAojDqhMxRK4bjbgeMWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553753; c=relaxed/simple;
	bh=gPJVixmTtYX5+gtvBorc1Sto8wQDPB+Zy4awIHGprAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljH+7/HyCGKvUaLvFs0yWTwj05sZN9N6WiDmaP1zoc5FFBtHSUHpFXST7MTnU68lZLv3oQIcaOyKDcmOk9leUR6W5dJhJHkxXpVkTZSbdTuF9vx4JbKfCmm9a1RYI1NGqCJa4x2Sy+H4Qrbf/X4rV9oeR8TUvGqdhBPuPT5DvKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7pSLvf0; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7pSLvf0"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bc871ecdfso2385894eec.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553750; x=1783158550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=K7pSLvf0FwIkahCyuE7fZ0Y0U/lWgtI0FE+L3eAV20h+5R4/fkTOlMqC33CDX32TKs
         3uJzRZAKxaAACBHuNLktuzJbzMzqZR9QyYbAss94a9Fvavdt/szVNOH/DkybcIUmTeJu
         ANgVstNlVS4oTr91Oi4yIHqJmQwCL52GWmj5FsM7tGu9F+vxNm5B587T/Ez7XPeQuFfD
         ttHeYH5fs8r5lJaiFU0d7nMaW9gZdHy42ckGBrrrnYQeittCjrWtDkLhQYrL3aHNSlMH
         KhSmCZU1mMOOm6TeFqBfCYsMKlHA55cdAYU6sZmcdiL7DmrAnl3TYRI1/tR5No4xxB+k
         YdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553750; x=1783158550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrzVHDAthuvQX8kZRzEkQTt99BQ7t+ZkrFrff05bWS0=;
        b=piIQ7BSTdDFsC3PiCE0tOtVqzALqxE543v2SJl0q8mVnpuEEBRAi9sH3VgjdGXeh8Y
         DdNakSSFqPJtYdg85HemjAR6AvG69J2SzpRE8jpmXFPtPuQtTXm7cr4/WRa3rWyVTydj
         Q6drCUJEpUH/93Ypsezn9lVRZo70YrmXhWZT5AeN/WHJEIbNDNLvJW+05Sw2R2O2m3xi
         xwF+wIwrK27YxiR2KyjEb8tISnhnovAW4TN0+s72IQT6eLkOLe43aEWHYJcXbJ/UkKQn
         8o7hF692nwzYqALjODhiKfPCdRYzNn3eA62pud4P3OyZhS7MOyzYIqxe4XDy0iOu1lK5
         KlOA==
X-Forwarded-Encrypted: i=1; AHgh+Rqo5kTolfbeC2eBguyutPmixV/iEq545yxLj13T2ekVozQpUz5wnZ0QN0Z4dA+uENx5qysRIvta+TsW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1A4wyT7vniZnp+qnBLUz1mdD+lSegDI+G+flXRcOfhgl0hLyH
	QIZemrv0sTkIB+RRk0fIxBTR4uNAqvw29qH7TGV2vgSBR3OWhERDtM4PKwX3ALll
X-Gm-Gg: AfdE7cnLoH8AmhFo21t5n60RCacfJs/Pf4N+QiCyyAEpUpf6U/M7nbwTXlTDSGalEwQ
	eMgizqPZUaqriyGzVohklRx8bAIId4voK3nSB0Svs0ObThXEuQDPBjFSEB6IggH1rxI4nP8y1Zu
	Re/mm0P4xqMD9FIbET9x5y6A11NI4QyxMEFrWAPLNKdgI1ZdWXvY9M9O3xn5LRJkJLCw9ctIwo2
	x4oHVUml2foOTkxM85ksfS2fqgUXBtuCDm9zyn73D480flRt5XFx4Y79iBxi8+ljJxP94R7VXgB
	KYv/ceDVOt7rTs+OBr1LU76q6CYUVYwtKYHHHfzB9dEglHvNbUdR7BSU7ebIkflfHVij9BNa2bK
	qEtSXPfzR2UWdBr56ie84oGxVHiDB76JDGEh2AVNKSVZNiaZKygqM88T4Ozz3u62B6J6utdcn+T
	jE2RcwaGoB9w6q/0CuYXI=
X-Received: by 2002:a05:7300:3256:b0:304:997c:d4b6 with SMTP id 5a478bee46e88-30c84eba0d2mr10419252eec.17.1782553750413;
        Sat, 27 Jun 2026 02:49:10 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca8b918sm28854789eec.28.2026.06.27.02.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:49:09 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 15:18:52 +0530
Message-ID: <20260627094854.81564-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
- RK3588 SoC
- eMMC storage and microSD support
- RK806 PMIC and multiple RK8602/RK8603 regulators
- Real-time clock and status LED
- UART serial console and SARADC

Note: This series was generated on top of the pending Vicharak Axon
board support patches (v7) and includes the Axon entry in the context
of the YAML binding patch.

Patch 1 adds the binding documentation for the Vaaman2 board.
Patch 2 adds the actual device tree file and Makefile entry.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3

