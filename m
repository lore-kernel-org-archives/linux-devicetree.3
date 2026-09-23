Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAB566C70
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177083; cv=none; b=RILKmnXND7N+bU2i25ax4EbSy3pUlFmtc/DU+THBJ6TereQ31FWsb+D0pvnKEJngOEEZNwWZjtBDCh/7DuMJM/bn7reQhMFrnlzFTzAw7dz2G0j6cOvFxU58O2jTRD9jHGHJP3xgbkRU/JFgz9a6Mov5ZcGOMO8nBpq/x8Q/Ems=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177083; c=relaxed/simple;
	bh=1TB0dQCsEex4z9d2T7MicDM0bu7L8cVlyYH48w+xWcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p7FAmo9oZorHoHUzFs0YAYpXgJMRRwP98KTzohdxuFTHuqvLlKEVhjziF4R7CgNAFLWly7MdOtypvxtHd9ZPeJ5xZedbbwfMfLj3tIt3XFyMKV1/zDGXPLCcgATeilyBMkVX40KzhtTQGs/NMX0POlpiW+5I2+9q4YdtV64hFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pR6bUALg; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pR6bUALg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so7428815e9.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790177079; x=1790781879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pD3CzYR8CXLK1Ll5umgAXWKGPeK6m30X3OIrFbC6KBk=;
        b=pR6bUALg/689s36bRVOvkUfpHIEczjJK0XsnlT1hgOtrwG1Tt7ujYrrlXvNQzMV4wS
         Vl7E/jvC5UREyYABhmpWEmUxnFhxbno4i1qDrXtKipGRb6dJcj3tmDwLyt04JsgHMZ7d
         inXUGLqvyD+QmBpKtGfQK2kKOKeiahTyio8l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177079; x=1790781879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pD3CzYR8CXLK1Ll5umgAXWKGPeK6m30X3OIrFbC6KBk=;
        b=ZcoDjzm0kRVtcM2iSj+PTsHmD2e+v1N0vm2Brj8qhPXP2H+woA67Y/GrYxbE4XrN54
         IyF89JgO6ZZ/Els9ucBrNP1v0SrYkHdlxhnnbMYEoVRNkm0wTryf+HWVu6rGa2HkFuak
         n5BGDl216JfIt9HdiEmCcaBHgL2RpcyNjnc7E+phSAw1Fipr11CIvYXIW7qrkHzHdtxA
         jOUZpD3qfOuW7UmOLEOtNTt1sRJhApgz3baB++HDF89KT824KyXMjs1k9+/EfSAloz00
         NLqTuDSiV7ndkVqzCFKbTj1/+INFWdDoDFkJ7zzbtxoG82y4A9q4J1/1gEDMNctbZjYu
         uwrw==
X-Forwarded-Encrypted: i=1; AKwUvBxmhkNL8g0qHz3VHj/ICEJvJhSpj8HmcwsC1e9RS6G2O877AT3zgkC/VpT0JivAxawqMsAuDbnTo0pB@vger.kernel.org
X-Gm-Message-State: AFuF++m4BvqEbcE+QDYyCne1QJ01JI+VC4eeIHGq37qoigl6v6NhAsAA
	jBN1zNWgcPznLR5hjBN6Qixnr//k+J183riwb4x7QCeL6XL4CvhKHpT8c5HAB5MoygM=
X-Gm-Gg: AYBFou1y1UvUBuYKlgok22wCQKrQXmxcW/DQwP73+8/VLnWuf7McOU4lfVXUmH/0IqW
	NDy3bbjmyZeyop2g7kdIWUMiRGfW39agFMkyWujRFRsVMB+7siIHPVgmALhPn/5J058bKkmG7wC
	PHIjXpqQorYS5Bsg0O3fwG9yO/iyW/D9JkS1WrnDR7XqtzTFEDtNysf5E+HB5wrKfKYA5L5ac1F
	BdkY95e48CfUmirVyxaZToWV9ErU0ZmXKyw/aLw8bCOb+mmGwg8T/QLsNek2tR/RPGdbF4gUYxm
	rJjlIAuOsZzt9/bkzhKpyKxgGmGoq9GdWl+4H9vK9pDZHyLFrRlCVgkRzVvmVJ0c19ff2jsJy1Q
	wZGQZk4p1L/V/lDPYPkRARrZ/yvniIsElZSLuWEKslN6q+Q0GCXCjXp0VouS/RsC6kw5OB1YXLd
	KUBEgvWq/HYSPfXqe2RZoFkEUrW65sw75P1nlJXqzMYRz5zWf/VFD/pyWrs+7bIXDNxHzo8FWPR
	Z2qt4BAOo+nGbUyUNS4ki6qU7GDtUioivYJvu2SgfskpmnaJJOwLAJlasQtOvnJ7RX1Fo/3jMOm
	mg==
X-Received: by 2002:a05:600c:468f:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fdee0ab5fmr47670875e9.4.1790177079486;
        Wed, 23 Sep 2026 08:24:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c446e1sm55582165e9.2.2026.09.23.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:24:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	francesco.utel@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	michael@amarulasolutions.com,
	linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH 0/2] arm64: dts: st: add display overlays for Engicam MicroGEA-STM32MP257D-RMM
Date: Wed, 23 Sep 2026 17:23:46 +0200
Message-ID: <20260923152435.563925-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board is produced in variants fitted with different displays. Move
the current RGB panel to a device tree overlay and add one for the LVDS
variant, so that the board dts describes only what is common and each
display gets its own overlay.

Dario Binacchi (2):
  arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an
    overlay
  arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display
    overlay

 arch/arm64/boot/dts/st/Makefile               | 12 ++++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 ++++++++++++++++++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 69 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 51 ++------------
 4 files changed, 152 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
branch: engicam-rmm-overlays

-- 
2.43.0

