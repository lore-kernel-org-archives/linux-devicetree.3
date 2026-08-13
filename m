Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE33ECBE3
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786660189; cv=none; b=IEYhs1lQS0Zs3fAeNijtkdwLtrKSxx2twVW96so26Fs6pWFHJwRM+/7K92/ClWnzlaviJtSzeV2TRfQLnCIaOOQuJMC6uf2q3LwlpQ9/kMbAKl6blfneQUpEOQJY2/u7J+ezkoN3R5JZEZWi2SOdF0jOd4I3zcRSs1hBvPc9HKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786660189; c=relaxed/simple;
	bh=ZO88XOEuTHqYzmZi8dXnbViwKZdVDzeRLhiEIAjP0uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQLc80btBxx3p8pXKaZZdCk6bsqzByFBnBQmfLJSpCiGyvSIs7v/OThDhcci5k8qLgFcPOtzfWb7H9GcFoXfbyseBnKn9jyX8no+65kZnDDF4l4KvbWFUsnL5y/xpLzS4ysIjs2L7jFPEQQYcb96t+HDVYsGM9bJCQwotZM6DIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EpDcJsNm; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EpDcJsNm"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f186025973so3422406d6.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786660187; x=1787264987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFkwa8HUud5XDO3/3xKZyjyFBtxxa+T5lMX1cZ1lnac=;
        b=EpDcJsNmLpN8TsalIlsJDggqmOSE0w1i66J0T4HWYb/uCTW8GwRTtEyRgftEYC+Dan
         AaL4V/+il7yU2a2VlV8b/DQTlIgvz1WLW208oT6MMHouYWhZiUpqtJ0skr2jJcyZJ1UD
         QDHTTMlVOlzQVFJlmMZ84BikXud2lv2n0bjbW1neU1BKU81S05QRfulzejMn7gQe/+Eq
         WmPaPAIhoNIVlOWnUXcQW+brgFBI1U5jU+q+gnlno6cDzte3B3cLy4R2MND4D2tC/Z5z
         HfbIUAlrZeJFJH5jMZthF/j26tARi2mWknJs5kjtMoBpRmU0POEcEfWx2uvg9kXpMpGr
         x7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786660187; x=1787264987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFkwa8HUud5XDO3/3xKZyjyFBtxxa+T5lMX1cZ1lnac=;
        b=na6YSAbX/3+xscuOC7XXaf0OOly7cf/sdiv6zgSkb/O31Aeh8zOPBGNFJltiBhx0Xx
         8JSwDR/q+hgJDt1NX0mzBoJt9cJOcIwva/e04ntYEZiVjOYh4jHytcnWxAfdFzZlIcwb
         kagYAoYiEd+pUGhNXqrDpAlyEiKjgE0zy9yej9F0HZkw8rmjeJXQwC7J16OT3X9Urt2q
         Bcroam481Sc9mYoueGRGlyhu52OhrUPmp7kMbCcPH4S1sQDRFwDpbob+MtF13Ai+L4pj
         /qsCcvpikfFAim2nW1cYwdmNA2UOGS78cQRvnuEryDfK8LvWqMzlTW+DHzdBW0+g8GzM
         RdNA==
X-Forwarded-Encrypted: i=1; AHgh+RqlCV4fvPSqDTQy033AoyLCN9SkH/K8a2nQ5v+JDcp2SaZ9MAN1VwH0pzi04Njp7pEY/WWsUtaL9t72@vger.kernel.org
X-Gm-Message-State: AOJu0YybAFMciJlJCgb/yxGAYEk3H1EUcuQh2OuwYV4uikVuuUvePXkZ
	cvBM00oFQy+XM1VztwIfgQIc76YjRbKSCzWzb7v4lRiAkJbYyclHPejrfkamLirCvKI=
X-Gm-Gg: AR+sD1092F4spTkHsGHyYe6qfZ6QC94kWhtKk1yHD3W9j+mPUhPn8APUAf6y9Pyn/Xj
	up944dyhuw0Uamju5hzgd38b+l7DF9f2uDDOmNaz+jMf47amRNJdbu49DKP5me58F9kPPeghfQN
	PL6lu51QwHbbY+o/PSyuxQCAOxcMlUZRKqOEker6WI7r0tLvUbjTwwt+K0LFYXhHx+OSSEY/g6O
	PtaruJclUolp163WaSWZ8SK7Fn9aeH0oqnDfsT75V9pFytCLd6EoxcIl5x9t1Iq5Dtifh7FZ5DI
	bkzwxgDZOk3JpWmRbFHXWZceGAaE9AFE4eJ+aoRBH4/lh3xuS0CbZOBWSQYgMcB1F8gEQXDJOgV
	pyGk6RMW8oesy8430YepMXbERGP/knxhXrggHWrVtQVpgLXGFXmnzC1nF1i0I+n7yuDRS1mchLu
	cHZp4VWx8Q8U0Pq7DJhUDDyO4DauL/vIQ/POGOSUylajmEIVXuQvytYxUh8IiWd7Ol
X-Received: by 2002:a05:6214:468a:b0:8ca:f47:25ea with SMTP id 6a1803df08f44-90a91a3c8edmr18120326d6.0.1786660186729;
        Thu, 13 Aug 2026 15:29:46 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a921ea2dbsm2367506d6.7.2026.08.13.15.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:29:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] PCI: introduce TC9564 misc driver
Date: Thu, 13 Aug 2026 17:29:40 -0500
Message-ID: <20260813222943.1655453-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Toshiba TC9564 is specialized SoC that implements a PCIe switch as
well as an Ethernet AVB/TSN bridge.  It also implements other functions,
including a reset and clock controller, an address translation unit, and
a few other devices.  PCIe BARs provide access to registers that manage
these IP blocks, and the SoC is modeled using a PCI endpoint bus in
devicetree.  This allows the IP blocks to be bound to platform drivers
using MMIO through the PCI BARs.

This series introduces the simple PCI driver necessary to implement the
PCI endpoint bus.  It enables the device, enables master access, and
then scans the devicetree subnodes to discover any devices defined
within the endpoint buses.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260813220717.1394644-1-elder@riscstar.com/

Alex Elder (2):
  dt-bindings: misc: introduce pci1179,0220.yaml
  misc: tc9564: introduce base PCI driver

 .../bindings/misc/pci1179,0220.yaml           | 150 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 drivers/misc/Kconfig                          |  10 ++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc9564-pci.c                     |  89 +++++++++++
 drivers/pci/quirks.c                          |   1 +
 6 files changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 create mode 100644 drivers/misc/tc9564-pci.c


base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
-- 
2.53.0

