Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97A93CB2DB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 23:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800942; cv=none; b=HoidXqys6Rs1WA7ZzCPbIFfh98fDAGwHkJDxnwhuByXWXlQRFS8fBH+0NiN5M5RRiEv2Xnp91J3InYp4f00L2r1dYxPD3AtAeNUEWDnesw9ctVSYVp72p5fH3zSut4AB40xm/2DiVmuGLLHsfAqIZwbzC4P924rqUEDmH5zZBR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800942; c=relaxed/simple;
	bh=Sr8dyV4BUJveQT1PtSWbb9k/q9Iou6el0LuvDx3Kqns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XZ+Rq1HK8yxVDJ4wF+5gXVu5mF333coEqxZYHSyC/bzJyP8mdGGZxiMRJ4XQ8hksH3VqE8K0IPVUPiLOdJkgVoGavCM+/0+xwtChVR9gYx5MXxnSm5xI0RWHhez2T9EWQ4UMloy5zoItD+dwPK6jYQ9hiDprwH2FYt7FVUAXd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tENz1JmI; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tENz1JmI"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ae45c58003so1755968eaf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 16:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785800934; x=1786405734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZmRK+kGZ63x1J3SYoJu/ncVhBhHSRqz2+vlZB+kGeKo=;
        b=tENz1JmIKe/yLxC9sWQfIe6MYfzBfVMEDR6NjRpaOhdlJ144T0Zua8WOgU2qZOW3dW
         59ua1f7ELx0zb4trAS2FovGoWFAk2atfTfinjP+z2XYxkfz3gLC5J2IPN2/Z7g2Z3d89
         S6UsFbARV8qNv1LskMB+OR6ShhwSOgHAGHoLma6L58ectr0Yx7vjG3kNdpZnfEs0exb7
         mgAzdSglH7C3gCJAdCwqmCM3zwVLbE0qEAtwuQ2vaVtuccsiykMjHdEajBdiXVqhSMKD
         rzYFRF1XSe84OzyXxWb35fWi+XajlYLRuXp3uKQXWl7DNGQ9XvMI/my3x5DyCWkV4Lm2
         AU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785800934; x=1786405734;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZmRK+kGZ63x1J3SYoJu/ncVhBhHSRqz2+vlZB+kGeKo=;
        b=iVIUOUor+3f3WsBXeWFwmhzH7gY/qf06Ae2fXxY7mvJMB9pUhO+FqOhZ271n6vr5I6
         U2DeuqKLFGEAaTHZUZip3ruMRy64fxxlKNzBh9Ybc9l7+qIu0tP5uAH/IrIwbLf4TMMg
         FBUr0Js+fEQL6MPu3eiyrruIfilc0bXkXkVP1dRpqp79wLB+FgoQ07VosCfrgsgnc3JB
         CkAisscWUplBDMAT6gt5s0MJ64eB/YuV5GOpLZDAHA/Yv4dEHsYP2joD2F9/5bMG9Ami
         wf3hR/zyzKzUPXa5IBz5xAU6P8UR8EnbByQkgfZlXASGVyxfQWSoHuQib8clmyIJgcsc
         a86Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSYpv8lEzlufIwZUMydscnySTJQ7PHpMJYoOiwcmqcXbfNk9SP9Xo1OZUVq7A13RZ/GoPRuR76Wjtl@vger.kernel.org
X-Gm-Message-State: AOJu0YxqcGu3vwFNeLUkCO4rV9kRraA2Ig9bkBQkWp+Y+zSSCD+SmwOT
	p61B8GMWcU1+Y2QLCB3Yid4GyEm64S9tP+Df5EX//HdtXbQbJAk897nB
X-Gm-Gg: AR+sD12ZxyjMAYuFeJJ2G50H+V/Rk9r4XggRCtH3rixJqHz8P+vciDt9Kgl/Y3jWf2P
	d36Ij2nyMBoTTEBbczzbi927012JBPZ/ovmU3dVxqgEao2RqTJFz/p8fQ4lgrZiCCFxNVIuycq9
	gBnGGRlvNkjrCaA/oqiYOvS/nzKXTLMFMC5Ni1us3W45TLsQnVVEbqipkhzOcyP8f78xr6x2eAg
	k8YFBxkJ1Yc8m14iEcW1zizjDOEVsrG3NerJsufW4iQE07rKaoKr2bMOgfogmW+nWkeWF1bjAtD
	LrqXWFwdi5c5P3HA+aLgMIWRMZOKPpYo57tK1J5qMxuZZqkkmUUTxfRVu6BwAwUl/iNtQMYMRkt
	iKqOAL9rDjoqXaJfnN5Tu/6FSG5SCe7wpg0dPIJAzN/BW824Gx0J6Nw9W9IlbLfZvyCprC4HGpG
	Wur1f+B8yrd7zrEKRWK5RL9H02iyUWmPzn/CfgJcBG3E18NFbKb/kKV4VXwyNZpFqu74WlsErw3
	WGQyM1dDiFtojIVOgmVZBfGj2jOXikDnLv7KrsiaPnVs2+MUN+miItbu3quHO9O+2EGXEeIofTC
	l3EluHEeEfafv46T8C4eKAFXU4uW7PLhHTP2VYSiwfRn1VkT18laxR4jStdWd3oJ9L2b4CW9S1O
	Rvn/UUVDd430iMAyE
X-Received: by 2002:a05:6820:4df1:b0:6ae:33fb:4546 with SMTP id 006d021491bc7-6ae432828e6mr18327057eaf.9.1785800934333;
        Mon, 03 Aug 2026 16:48:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f60ea539sm10452201fac.8.2026.08.03.16.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:48:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/3] net: mdio: support dynamic OF device
 changes
Date: Mon, 03 Aug 2026 17:48:09 -0600
Message-Id: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWTswRlqMVxEXaTLVETKRJC2V0
 rsbdfnzeN8GhbNwgUu3QeZFiiRtYQ4d+IfTO6OE1mDIDHSmE5Z5jFIxBkmYJgxvdVE8LgYt9QN
 5d+ztaKH9X5knWX/2FZQrKq8Vbv+lMU/29UvDvn8AfQlK64cAAAA=
X-Change-ID: 20260803-submit-mdio-of-dynamic-v2-90560ca159b9
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

MDIO buses enumerate firmware children only when the bus is registered. A
later devicetree overlay or status transition is ignored, unlike on I2C and
SPI buses. Supporting live reconfiguration also means that population and
removal can race address scanning, PHY attachment and bus teardown.

Patch 1 factors fixed-address child registration and legacy PHY scanning
into helpers shared by initial and dynamic population.

Patch 2 serializes MDIO device-map changes, reserves addresses while
registration is in progress, and coordinates scans, attachment, removal
and bus teardown. Dynamically removed devices remain pinned until bus
teardown, preserving the borrowed-pointer convention of
mdiobus_get_phy().

Patch 3 adds the OF reconfiguration notifier. It supports fixed-address
PHYs and generic MDIO devices, scanned PHY addresses, and Ethernet PHY
packages. It also preflights overlay removal and rejects removal of
attached or in-flight PHYs before their firmware nodes can disappear.

Build-tested on net-next with arm64 defconfig and x86_64 allmodconfig and
allyesconfig configurations under W=1. No warning was emitted from a
changed file. Runtime-tested on Allwinner H616 hardware with
notifier-driven addition of an AC300 control endpoint at a fixed MDIO
address, 20 relay-driven cold boots, 20 complete MAC/MDIO teardown and
recreation cycles, and link traffic after each topology was populated.

Changes v1 -> v2:
  - split the generic MDIO work from the ACx00 series
  - rebase onto current net-next
  - move touched declarations to function scope for netdev style
  - Link to v1:
    https://patch.msgid.link/20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      net: mdio: factor out OF child registration helpers
      net: mdio: make device map changes hotplug-safe
      net: mdio: support dynamic OF device changes

 drivers/net/mdio/of_mdio.c          | 508 +++++++++++++++++++++++++++++++++---
 drivers/net/phy/mdio_bus.c          |  14 +-
 drivers/net/phy/mdio_bus_provider.c | 141 +++++++---
 drivers/net/phy/mdio_device.c       | 235 +++++++++++++++--
 drivers/net/phy/phy_device.c        | 102 ++++++--
 drivers/net/phy/phylib-internal.h   |   4 +-
 include/linux/mdio.h                |   6 +
 include/linux/phy.h                 |  18 ++
 8 files changed, 908 insertions(+), 120 deletions(-)
---
base-commit: d661abdc30c254649c32ef6e0aa1e621e04ff0a7
change-id: 20260803-submit-mdio-of-dynamic-v2-90560ca159b9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

