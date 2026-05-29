Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F63BCD19
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056556; cv=none; b=JV1AWUc2VAagJGa+ofvubK6YVoDbDfgCmO7SebXDwb+tJKhCzTENcVenUMNTgnhF1rUMOnAqpfCcFwUStXF/EeHes+mAmBaTHylg+DUxUNy7f1qo5WZrkNcK2tVFHMGXVxqgFK72cmuBdElf99K7+QaXOZoxdXRpiOElhnq56EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056556; c=relaxed/simple;
	bh=Na2DrlXpWMe7/JpAExvC5WjqdbYKDofso5lcQxcrdG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMCmgS/d/esaJxk4HvWLlDCFhBi+yzkG5iDiO7N0c9BZMg+7Eoiwd0aPGYr6d7DKAgc/ujwL31mf/1jnfmLhCPjOeqjBRHM1r3mYbW8RJ33Hdswlml2Ixazi2FzGRv7OE8R/LogDokNF8G6BHLz1x6zRkl03HM13WvWe+cYGtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUPlTfFJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUPlTfFJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so88366775e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056553; x=1780661353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns0b+AP7a0XFNtYiOZwiqXXnknxzUGgu+QW5bEOOYco=;
        b=oUPlTfFJHrmeqavUeVXCFm/07gNL+lknRcrR3T8geidPQnxEe0l0FPcRoNIUIdCgf2
         POI+8YMWGrBsCc0cI+z7pGnmcJnWSPJXp3qcYUmuwqqBc0kUjpoDKS/SrEnP2A8aJZni
         6qJMGVcTX4zOjVksqCuaEIQMw80ZAw/YXYEuq2jzwReJE1gXmdkXWrV77KziRzE0Mk/p
         +vZQDD/LJ+jfHc0ohjFBd4hVzXml9mo+fnDzKujKJzLT97pQGQfXv6v2XLEaPqxvkhLh
         Nk/wIcehtXacHRHFmcx8azUgn0fpcx10lLLJ55YjDMt34OLKekZm6vYWMwMa13RSxibs
         wuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056553; x=1780661353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns0b+AP7a0XFNtYiOZwiqXXnknxzUGgu+QW5bEOOYco=;
        b=Qw8sEOSIPbz05j9L76cSF/0cmh9k45VpEij5eWI9nXs8RxpptHy0L/q7BjndMd+Gvh
         H7QH7bCZtpU1efRXjavE+8rak9IK+DguPN2+zGEBNPzELuw1KZlAnHihwMp83ooGnZVz
         IIYxw5o7qRVusMMGF4An2bbWZFUK76Zclaf3pBrVH23kxAaqfKrDQ0rZ413qZMggg7uP
         f/9MwnNCX1fCLij7DLMiuzDARlsl/JmuPgSTMPmh5ksrN5Y5VdN1/iRx2Hgu4Gzlxm9S
         +2Ij1DNfEKsyLSBjQhxzYvOhruzhZH90i5IMt2ms4BH1cMXRjBvCk6j0oAYB7hPECjj1
         zgxw==
X-Forwarded-Encrypted: i=1; AFNElJ84HviBHA244uIIOsyxymT6/woZnncp/S/5vLJ4Ma9gGF18X0WchzF6xajtAYHumHY2C7lYprHSPX0g@vger.kernel.org
X-Gm-Message-State: AOJu0YxBV2Qeb0C++seYxizDczbg+5Am+4g5bGrmKpMRfr24MS0VG9AU
	pJYmSqfoowoLYYrfjwjFr6YpIfKwTMcSHwVDZYgu8i4zpzteXEOYroNn
X-Gm-Gg: Acq92OGzDUNyc1PZeRv/TKmCMeG6yGCrffOc0Obbhmw+dxW56A6+DLZ6BWDJPjVZA1j
	M30ZDXtKCCNOz8XLqHSKKTkapa+g2rqH5w/0Nsm9pXFJ+Kc2c952P6EmXXRDmY0ed9aRy9UlYz0
	3zdd/tq5E7IYf/P3foorZP5loj+KjHfRdzcfqIedHmYzwL9eD2mDVqJ1UulDqSnE7LQsqKtJTsz
	ezlDNYJcdEATuXQbUgC5CO+Ne5O37bo2P8066paHPv5CCGdJfwsUMRPIFYHq6VTxtpnxD9PHJ87
	N8WLS21FyZuRnU/qHzt6GaFV2axl998XZSWWR18cw1sXnw1DF9VvZwtpKkHJDsgCna5kknHSWdl
	D8YAeTllf1IdvHsEOmI4hfOXCdP9v3EbPAZ8gxa/kBcXbmiCnimGavwDBFFdlol1GBdm0EOyVpf
	YBDsXyu2jWQaPDlNcMGltuinbKfxlVLNMP5hQ=
X-Received: by 2002:a05:600c:8b47:b0:48f:e230:c3fb with SMTP id 5b1f17b1804b1-4909c0fa43cmr45960295e9.33.1780056553133;
        Fri, 29 May 2026 05:09:13 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:12 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] arm64: dts: ti: k3-am69-aquila: Add display and peripheral overlays
Date: Fri, 29 May 2026 13:08:52 +0100
Message-ID: <20260529120853.636015-9-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays for the Toradex Aquila AM69 carrier
boards. The overlays cover display adapters, DSI displays, and OV5640 CSI
camera modules available through the Toradex accessory ecosystem.

Display additions cover three configurations:
- DSI-to-HDMI adapter based on the LT8912B
- DSI-to-LVDS adapter based on the SN65DSI84 with the Toradex Capacitive
  Touch Display 10.1" LVDS
- DSI driving the Toradex Capacitive Touch Display 7" and 10.1" DSI

For the OV5640 camera overlays, both the current Toradex CSI Camera Set
5MP OV5640 with a 27 MHz oscillator and the legacy CSI Module 5MP OV5640
with a 24 MHz oscillator are supported.

This series depends on the Riverdi vendor prefix and panel-lvds binding
patches, which have been submitted as part of a separate series:

https://lore.kernel.org/all/20260522161105.277519-13-ivitro@gmail.com/

Vitor Soares (7):
  arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
  arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1"
    display
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras

 arch/arm64/boot/dts/ti/Makefile               |  43 +++++
 ...la-adapter-panel-cap-touch-10inch-dsi.dtso | 151 ++++++++++++++++++
 ...ila-adapter-panel-cap-touch-7inch-dsi.dtso | 151 ++++++++++++++++++
 .../ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso  |  18 +++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtso    |  19 +++
 .../ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso  |  18 +++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtso    |  19 +++
 .../dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso    | 115 +++++++++++++
 ...la-dsi-to-lvds-panel-cap-touch-10inch.dtso | 142 ++++++++++++++++
 ...m69-aquila-panel-cap-touch-10inch-dsi.dtso | 149 +++++++++++++++++
 ...am69-aquila-panel-cap-touch-7inch-dsi.dtso | 149 +++++++++++++++++
 13 files changed, 1126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso

-- 
2.54.0

