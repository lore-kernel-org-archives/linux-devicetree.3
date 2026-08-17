Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A6383993
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003224; cv=none; b=IoDsPWbhEUQzsB1S0HQH0vXf0olJO55NLkV6u46TMvxTSKtODz/tVMzDffCgnrzLZNx6o1eMC1ImcinS3JRBFe60o6Rto/usla+vFWOCSma6dnGC07PhFVX/sSdkDM/fE+AmXcREEiWGSE8+KB/li1LHySnZjoKmA5iILkTVfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003224; c=relaxed/simple;
	bh=Xykw9kWsK+/kb/51/R5V3OJ/XpnN89GBPUTt9ZGEA7A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rR/rGVqkweJIXes/mawCQXckjCQ6vdbT9R7NUTZJ2JJzOfqO7ltQ4PhhN2c/tA6fWf+E83cxZJzOZn/bCJkG+UUGvhXimOmb091mRQl3se18H3M91DXm4YYX7ZXvQpwPSyYU/0c/j1WpLP5jZ9vFBmPOlYA4QX3D+IhGUAjdOVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2Q83R+i; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2Q83R+i"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceeee8c46bso9722535ad.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003222; x=1787608022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p5z2OWZb+kR4j38zraZnYUeMrgnpIkqim6Dck0G9t6U=;
        b=c2Q83R+iJjgsAdK5GJY5rnpja/vEbHAcESfkhvBrAFOaXwNLexhu4fWWNShP25CI11
         HJX3IKpP+wKRUBmkMKC3F4ZFSJCcQ9kkBYBPeEFV7lRF/OtJ/rOXCh0sbNKpAEj1GkdF
         jfWcpqF5VxEv+jXvEigAOHj5KVEJPcTjFwPtqhoqUvqy4QA2wlkjjCzaD6uinn1KI+Cs
         FbrDjBLCqbf2gyh0EQlSE/6sLF02M8ZTWyttwaB/cvxuudF+kt/POC21xSZuPfNKZnUN
         N6tc/G8pBMXsXDFTEiT9zYNhL3ZS1VC2YbYL8+IFDqW3uSeZJKefxIdUsmqYpV8/QI+3
         d+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003222; x=1787608022;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p5z2OWZb+kR4j38zraZnYUeMrgnpIkqim6Dck0G9t6U=;
        b=TdJ8MEaL27hYrKrXbz0HhyOC2OjEVVmCaTKo5E6hSDz07gVh7Ihnz05F72dEN4LMbR
         ueOamQJvjEGpJWmBx/WtDhnA4/7icAazMS+nv+DOaAO/q6T8kkKxKLGQidwwboQVwshW
         3ffM03inCzbFg6vN8CNu1cI5NpAq4ZlgplK7dqKnOl/8RjGst3N/rvxcE3nh/3jIdWlB
         HP/zw7UpT7QDTfD9KmcBDsBLujqQ18qc06RPqb7CiiAGPb09IsI2aibDL4nZWQMVlN7R
         mRj9DkqK7BexCAUS8N2SeMlpmZj7XVgtZSr9Eqt656NCTk5k6RY+owyQPEQ14Hj27DPW
         F4xQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZY0Ff7D+ZTgkhIa/V8vL+jM721MRlgO8G5UisQULc7hmdECHLyyEOp8lkYvrfrC+uyn5ErW+YrtB2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7p40TO6DRBN/QK5RJuxxfWHb0hiNQLFgUNXBJayfLxm4OcnEI
	ZUf/b1JzaQBCnMw54sFWHNSfNOcTJgap/OogdvyUCKXm69sqA4FKmWCt
X-Gm-Gg: AR+sD10KSsffQlbjmGQUItcIgZaoDCTirGeBa8VzLgSTQowF50ugoDi1545DiipNyFQ
	vQNdc2HXeMRl0x+vjl9Qj9G4cKjBN3eCAezK63KGtFMXz50Cjp/RT/gERSq9Gx6plrWZaS3Tu2F
	E5SEgZ213YsyiDG9SDVaHRnVSVCyhvpAHtaWuZQIYCkudE40fXpWSI+5EMdtYLrZ5fd+hoBMPEc
	+7AHZ5DqP4JwnJqnMy7lsFSwoUUQjpx2NQYPgIDRbUcTYoQn4b8WWMGTkI88bsgAsuzUhE/1Mox
	XFGlNTrJ9DHlOXUryKzbZ8UDBFxpyxQKLtu/TN9c+/pxFezgXNRvE/HW3gS8K6X/uOlMnXkU6O0
	U6y7fb+NYMnV85EUHmPVd6DZ8BUEfCpyXJtCZ6kxnaNJnpP/oetr/s0+Z5KJts8gcsVoYee7rmA
	S0aRd963Noz07ASaviU0NmF/rEZIWTv8iq0zps1E82Y0G/Or2JqNtpZYXF/hywU6aWF+H3uXFKT
	0uaWwkbKF+e
X-Received: by 2002:a17:903:1b2b:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2d3b0739429mr214351025ad.0.1787003221574;
        Mon, 17 Aug 2026 14:47:01 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:47:01 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/7] dt-bindings: usb: ti: Convert AM33xx/DA8xx MUSB
 bindings to DT schema
Date: Tue, 18 Aug 2026 03:16:30 +0530
Message-Id: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqAMAxA0atI1gZqHfEq4sIh1QgONFUE8e5WX
 b7F/xcIWSaBMrjA0sHC6+IRhQF0Y7MMhNx7g1Y6U0WUo2Ns5jjGXVpM0qQwmtJckQFfbJYMn9+
 tqn/L3k7UuXcB9/0Aaq4XU28AAAA=
X-Change-ID: 20260817-ti-am33-usb-4548f2e570ef
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=2463;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Xykw9kWsK+/kb/51/R5V3OJ/XpnN89GBPUTt9ZGEA7A=;
 b=PSDiwjCRSgF8tyLL58sgaor0uFp4NOH2lPKDimPZXXZyXBiNYyX/1dUSdCEXV8ObgPylbuCI+
 pKkQcZo2p37BxtEFJZgFjDL7yQXIyz8lq+tWA0sJ/b3S6y3sMZrDDcE
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This patch series converts the legacy TI AM33xx, DM816, and DA8xx
USB/MUSB text bindings to modern DT schema.

The legacy am33xx-usb.txt and da8xx-usb.txt bindings was historically
structured as a single, monolithic file that documented the entire USB
subsystem (the wrapper, core MUSB controller, PHY, and control module)
all together. This series converts that monolithic text binding into
proper, distinct DT schema files for each hardware component.

Patches in this series:
1. dt-bindings: dma: ti,cppi41: Convert to DT schema
2. dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema
3. ARM: dts: ti: am335x: Fix redundant interrupts property in USB nodes
4. dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
5. dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema
6. dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
7. dt-bindings: usb: ti,da830-musb: Convert to DT schema

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (7):
      dt-bindings: dma: ti,cppi41: Convert to DT schema
      dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema
      ARM: dts: ti: am335x: Fix redundant interrupts property in USB nodes
      dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
      dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema
      dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
      dt-bindings: usb: ti,da830-musb: Convert to DT schema

 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      | 108 +++++++++++
 .../devicetree/bindings/phy/ti,am335x-usb-phy.yaml |  49 +++++
 .../devicetree/bindings/usb/am33xx-usb.txt         | 200 ---------------------
 .../devicetree/bindings/usb/da8xx-usb.txt          |  81 ---------
 .../bindings/usb/ti,am335x-usb-ctrl-module.yaml    |  38 ++++
 .../devicetree/bindings/usb/ti,am33xx-usb.yaml     | 104 +++++++++++
 .../devicetree/bindings/usb/ti,da830-musb.yaml     | 111 ++++++++++++
 .../devicetree/bindings/usb/ti,musb-am33xx.yaml    | 111 ++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  |   1 +
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |   1 +
 arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts |   1 +
 .../arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts |   1 +
 12 files changed, 525 insertions(+), 281 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-ti-am33-usb-4548f2e570ef

Best regards,
-- 
Bhargav

