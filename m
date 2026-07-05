Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FB37DEBA
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246284; cv=none; b=XtjEEWdIKTe+4QhWnoRMjxHINYEDmJzCBlsLaCFokYtkrSrw64LFEBekr9IhtjFpym4+PtiL81cja1+aVBPFskTNWHU1FNUDTr8S+Aq6gWnVGaIXtzrE8ZBAMYqZBAfyAu3M1fNX8hxCXGQXV/v7oIpqiwfmhw+NivJOtt5TWxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246284; c=relaxed/simple;
	bh=1+urWhTzQMUH0oiAjedVIldEW714w2feNRJ/RVDNWTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tGUeaYcTxOiHkB3NVG0y+eEG5QBkx8OuvLR/Jbz+j4py0YZ0Thqv2AAs8FpMqEU4op+3j4vWdRJKGjdoDe5IHL7jzseMnDdgPt4YwP0qfqaN+LfTnHHg0DAE3NbNPxXHmW5IeVtmAgsajor442tr5EuStMSeiwaZyXVVdu8WoCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff1qHjLG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff1qHjLG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so791135e9.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 03:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783246281; x=1783851081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KosFoYH7JPzJbGxiLDLiAcfUT9wevKTSADbKnE7NxIU=;
        b=Ff1qHjLGsmFKCgVdZOH+PEgrUAHHONaG+X8cOYDTZWd1IIvjCqj0nMr8FVE2Lh5B5c
         Hn9JAfvq6tkblvQR3gbbonHpaSCsUsK76QVYWj87PXTbx2QfmySMwm7F6E/cxqTkUMxQ
         RLDB0Tk0JRoGU2cteJt0TImzAMpfNd27K4eOI8RDom1oBg9YnkfICxDXBcFH8J3brmZH
         sZBJtd7YtubI7LyeMWmakotpABKpYCCVX8Bx/IrKeT0uqqi7CunO1lAcd2DAfYCZVg3g
         M8ssymFrwr9Hs0GBL9cngdSHnJxEF+FTw3EDcwy37TdX7PKbCSRs5tIEuonKAlnz0NMi
         0EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783246281; x=1783851081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KosFoYH7JPzJbGxiLDLiAcfUT9wevKTSADbKnE7NxIU=;
        b=RO8/NbuK+X/iGwa/U6aRDEw8zmbcgJ+o1jDm3ebRPEem9DbuU4lfEef5/2Ru23Xklq
         CIvHT516nqdIRgQn2WHi8HjRUgvDKYGNExtjgYkiNKHIzrx16akoKxJxOHmJS2d9qEcR
         ubZ3Hfm1jPuf9+2w49fhjHF35z5Cc8IGTcHqEes5uDZEqkVOlguJueJMlBDgViNcdd0A
         WXK0kiEwDqkjgt1H9CHp8Gw0KfAXbk0fxSLXS4fBSCWuIQW7335VkuoARkST5draj9Xm
         OnQns+3RvNIeKlb+8XNnpyepd/r5c/7kXMS1NqliH4qhNm1rjfmRXAUfy7BAm2csCF+T
         3Mbw==
X-Forwarded-Encrypted: i=1; AFNElJ+0S8weyqicU5xoNPdOyZ4WXauHdd3D+0Z3ZQMybvGzJxEqkn28T4zSGHnUsVcb9cQXlIOeJPSw5gVh@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9QrKHhy6zooYYcfqJOix2hZQM7ouqv6JI037x4El+9l/glsn
	cHaVWhK4SqvOXYiOmgzkuKZPmQmPRLWUH4FokHxKWzOKTFlx9Q5djN43P4dIzZeN
X-Gm-Gg: AfdE7cknDufx/IvinriNZCcFuQA0DDbi+R/x0qr2cT8mhS093xiTyAdXiu+giqlBsrc
	0eUeJf75zpTY4nsYkfeOUuA6kENwFzTcw6dKaC5QL7rdGcZGgSSO/lTdVGvdO2yASH81Fls9ZPb
	M8lmbItqdJjp5imOSGwpDyDxhyZ6yMy4sWs/XDeVyUBLhgqrMbaqggd439wLy69tHfmbbh84SBc
	grgnFJiYMWnBlpJLcuqhhsDRiTPSQYM+g+P4fya1q6uU52dVNVcsJikS1oxIvxcKjEeWtFoS1p+
	Q5Jb2k/GxyfdXT24W/j3MDOEcf5kS+WCWrEziur+Uvs2Pygn4aIA8usKO+PfsCmU9ceLkGBCWPl
	lo/jD16TpuW/vr0EcgD8l00wbqf61CgLBmUsfRkejpt8YH2JgHfwc3EhNn4kfXD9GNwQJlRdMcE
	UuOZFJrPEogXO/L+bhDjkBw53KrBTiMl7iCw==
X-Received: by 2002:a05:600c:3493:b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493d22abbd8mr58420125e9.8.1783246281032;
        Sun, 05 Jul 2026 03:11:21 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm261382715e9.6.2026.07.05.03.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:11:20 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v3 0/4] phy: cpcap-usb: improve charger detection and export cable state
Date: Sun,  5 Jul 2026 13:11:01 +0300
Message-Id: <20260705101105.1798069-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Motorola CPCAP USB PHY contains the hardware state machine used for
USB cable detection. Besides distinguishing USB peripheral and host
connections, it can also detect dedicated charging ports (DCP).

This series updates the Device Tree binding and corresponding mapphone
Device Tree to use the charger detection interrupt, adds DCP detection
support to the CPCAP USB PHY and finally exports the detected cable state
through the Extcon framework.

The existing driver already interprets the CPCAP USB detection state
machine to determine the attached cable type. This series extends that
logic to distinguish DCP connections and exposes the detected cable state
through Extcon using a standard kernel interface. It also makes the idle
UART mode optional, allowing the PHY to remain in its default USB
detection configuration unless UART support is explicitly requested.

The series has been tested on Motorola Droid 4 hardware.

Changes in v3:
- Drop "phy: cpcap-usb: Prevent line glitches from triggering sysrq"
- Fix DT schema interrupts order
- Fix boot cable detection

Changes in v2:
- add chrg_det interrupt instead of replacing se1
- Fix remove() race by cancelling detect_work before hardware teardown
- Restore SysRq state on all error paths
- Introduce CPCAP_UNKNOWN initial mode
- Snapshot enable_uart module parameter

Ivaylo Dimitrov (4):
  dt-bindings: phy: motorola,cpcap-usb: add chrg_det interrupt
  ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for
    CPCAP USB PHY
  phy: cpcap-usb: add DCP detection and make UART idle mode optional
  phy: cpcap-usb: add extcon support

 .../bindings/phy/motorola,cpcap-usb-phy.yaml  |   6 +-
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   6 +-
 drivers/phy/motorola/phy-cpcap-usb.c          | 320 +++++++++++++++---
 3 files changed, 279 insertions(+), 53 deletions(-)

-- 
2.39.5

