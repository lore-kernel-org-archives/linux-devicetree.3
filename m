Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969883B8D6D
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439598; cv=none; b=e+kAFftvkThtFetpk85bJA31YChJY//nKq5ghrkv2XpwcB442wf06iYbx6RkyWHwaodm/sttic48jJ5ns2pLx8V6SOr1wUGjpSh2Pw4to1zTRMd2Ph11axSBABN1JQllULwvvGsESlBcMaoh+yagmeHPPIE6zklKwQjwukmlYlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439598; c=relaxed/simple;
	bh=vRQFQ0/bN/cY2yMjmaiKgpsVQx1nHdnB9AcWyqVzs0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmxDEpucGumg/i/h7AknfVJMRTrQVNVzJWS0UAKRuVQPLNh19Z0p+LnYuJJLBxDavntaIBrbKDPUV8Wtz+A1cV/PMwWt/u1EK9mk1Plwc8KXTTdZK0hU+Ohs0T+7r00l2UvkktrtRpGf8XgiXlnzNH82kGH4XF2VANUU+TvGIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNpaJ6aN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNpaJ6aN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so209677a91.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439597; x=1792044397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yznlhzA/LCCyg8VcHmCAqbKM1iwate4R5ON9EtsImI=;
        b=gNpaJ6aN4qfxeYrHAJjEnCiNAsmt8BCQMeNTv4NXdZoMM7/Di9O19X6mEvH0d9Git9
         KvvKUzeovHNNBLe3Ssl3GlSIum5hf3zBoJ2vLKIfl8HyO8PsTAp0msXPk8L0j6MJV2Lh
         0ZqxgeJkQyc1e3afqx1WdqLNfrSUBYCuYsILQ2wCm3Sx4oiBcF9TCltO4ybk10pB/mBy
         Hdms3WI0BHOBgerPxcSsyYdOdf/s3V00uyVUhWd7MVM7xG9laeU7ib/o7WOneGgxLrFw
         tgRNrJqpY4EPW4XzcBMS2LhhuClxO3DRPlE6HO43yvNaF6RAR6g9yxXKe8Zhofn6hBVq
         ssTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439597; x=1792044397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yznlhzA/LCCyg8VcHmCAqbKM1iwate4R5ON9EtsImI=;
        b=jHa1+H88K1PMo0CPHuzIFxmD/pg90JYZjZvx7K7dIAB2ittgAHH8YFzQarIHsIWNXW
         VdRCJzDD675napsqzz3YAQcRWIwAbsRo/QN6rBmDYqy/UcaNW6Pfe34xAB3IIOKabYoH
         T4QpqQ3412X3EpfTAHlbBiokCE5uq0HHujdioT9ivqI+i4RfdMwz5ijWkXyaivP/7m5A
         qDNv/mOxQrrgob0ifOpmkRtFRS6febOsmMl5AhQtgcWC/wPPNxzNyoQtXSWgw4WMinax
         6uQKMvVML/UAj5UnyjV9rNgsVmQTeSTspsi3fwwiY1/7fk1A827b9qtdAbnHf1eFmTH5
         5SrA==
X-Forwarded-Encrypted: i=1; AKwUvBwTASvnggve+cruvfXHN05piIQuRmZYGklPwmHqdwK3YFDoFr4iAaydekJup3b+V2hFFJEqh9HT7sir@vger.kernel.org
X-Gm-Message-State: AFq9FYJezvGCYJn+1slQOu/SNnCJLhgk3mNnHMva8DyPF5PZekB/gzMe
	KVVkzGr5KeTyJ7UWGKD6gYlHeuvMJeWEpfAoi0UAbdmxPPhuk6gv34Zt
X-Gm-Gg: AYBFou1dxJ6RODNgyAS1XVKI7fRsAW1PS+9iDjGVWFXo4BDJ1h1HOekQcN8nquCd2rX
	3y9570KzwVpunoL7KUp6sKUonMNxYcEERGBgSW9XfiTwMzsxu6FXwcc0F7j63VoFoNiuIgyShXf
	pglrIWRNytJs46SutBOCux9vsAhKnMMh3TizvRlBGAbFifcC9LiupNaFVB5SvMfcnPdmGghNqT9
	TfnUbtX+IKyX8iH1W+2sZA60shmPU12hQ57vZTT3221cpsY1XR139ZF8pFqC2+8lnDOlUpL9x2l
	MseGEbdYxu9rbu08wFIdhr/eI0N3reWQj1faJq4QC0hWWoUB3jA5jY25KJPGDJvuxn/eGzBSfDl
	5OxMYGnkImRB6EvKhcppaQ9+PxdMnzK3PAhjbdceStkJXq8hjkusK371MFv5/yZcb1eQdTxbXx+
	vk4SeY29B2S4rSx3Em/j/t5YxrYPrzsqlLZ2/z+hWx0AIkQ1CtgnRFlJGZyuV1fVc6H4tnszDkj
	BkNnk87+YDW7zRj/YPRM7es9Xd/vl8d9dPsoWK7v9309zX4y3I1mt1+4eY5RgiBr+JztephHA==
X-Received: by 2002:a17:90b:1347:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3aaed7c10c2mr702874a91.22.1791439596767;
        Wed, 07 Oct 2026 23:06:36 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:36 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Thu,  8 Oct 2026 14:06:25 +0800
Message-ID: <20261008060629.2736806-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v6:

  - phy: update the copyright notice in the rewritten driver header to
    "2024-2026" instead of "2026", preserving the original 2024 date
    rather than dropping it.

  - phy: split the unused linux/io.h removal out of patch 4 into its
    own patch (3/4), since it's unrelated cleanup that predates this
    series (the driver has never done direct MMIO access; all register
    access goes through regmap via syscon_regmap_lookup_by_phandle()).
    Placed immediately before patch 4 since that is the first patch in
    the series to touch this file.

Joey Lu (4):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 286 +++++++++++++-----
 5 files changed, 390 insertions(+), 77 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

