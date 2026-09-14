Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFED343890
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355958; cv=none; b=ZYXC4mz3GYxziLc8TaLKmd09BRI+mDb+XqgZ/MAetTuNqByJ8BG/YOtD1kmvU5e+rrUjcPQ/jVkONrgXeUJT2iSDhotjQjaXZFVeu8Y0gKS6g6UGjjRZeUaUpkl3Z+mp9OgkrFBg9PeHYq859O93mLoCaN2JuDIWPI0ntKNa4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355958; c=relaxed/simple;
	bh=wBx+w1v3FQBzZz0qke9eWRr+XID002d5eHN6k03EyKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KE7U868FQFmxu1IRY5SnQMB2oewtzDj1ABSoVg2pu/DpxgGQhutKDHu3PHicjL0+ACxAmeghqK1Xi3x12ny6yy4xF7nmvSV3n7ntr37i68X3rfRK/YAaNXNKT2CBHzHKNy3WP520BKrtIy3LdlJPvfjrlVpaXbElk43OXtis5AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9Lx465t; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9Lx465t"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dd4b3c752fso25861965ad.3
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355946; x=1789960746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKKKPTctZOY62gpBWjyYhq7FRns8SufRf13oKGN+IiQ=;
        b=n9Lx465t0lW50t+2jFWJjQOnEpduxqyiVAiKEjH40o7qCd4Hrmjq/l6HfR0fDrplj3
         bO/u7uD6agoAm7kbmdqlMf8aYBH3ztVgZxWeDeEV8a83/tI1Nx30w7t8JsSYPqrGuFIH
         J5Sro4SwXqjV9swouDU+Mm0fdle0UT0k/+PyL4wWrC4dDIPb3SRcna6vz/mQJMjBcjII
         fmnmdXgnLspvThm36oWnYPOnShv+fkvkhvW6wL3AoUuINjdtMYrt8Fa5AkVhLqAYY06N
         L47C0Y8iNVKNf2ABo7MDitOMjkdFUV2SzI19aQrq94xJhxjLaJL+OrQHr2derWerp6Ru
         TSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355946; x=1789960746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKKKPTctZOY62gpBWjyYhq7FRns8SufRf13oKGN+IiQ=;
        b=pye1YAaF+p+cK1UGy+cRuG9p1OVOkLDPLrOk7yKeQGnJW4wf7RpPcaxINJHEp6uC8V
         hIwX9NPQOGsgqGOUUc6fCoDAcZejT/W3vvMHmb+SRaudit6zjiTbGNvsfPW6vl9GQixG
         FXkXwa89TusxtSgInVxIdXAMYqirhxc15D9x0Ie8yxsOw9XEX3HkUm1ZWHwy2mGyGHdM
         lGxaLqkM6JHQzrgo2qNaVzYF5X0p/ciNODn6QOSVQuP7HG1NrrF4+O+cpCEittrFlSaA
         zWFUZ1ymJYQU+Pr2fbtbl8gXHAq9ORIi2uwswros1HJEXwLv+aFz0jKsJyvxaSzOQIOr
         fFfA==
X-Forwarded-Encrypted: i=1; AKwUvBzjq/u7REcD9au7x71bbU+jkco0Y6YvrMXVGPJSoK/cV2zqdj7h85cYopqWRUWYorVQHSFKsFLblxHE@vger.kernel.org
X-Gm-Message-State: AFuF++myghiA2ASMVtniD6mYNjqEPG2FmdKuES9BHR828QvPvzV50FSe
	6vT9Ua761h/OQeW0R+UVHtOy6tRGDpXUk/e0idizjm/T+3f5Iqw3E+4S
X-Gm-Gg: AYBFou1Kd/ppY3FdVZK1oJEbwKVZzfQr+D6keu4reaeJBTLrXuK3qT2MM9QlRH3piEo
	z9o+dX39VZ7JEBgqHeog2AqsNRrzugSZSUZ+Ef2RI3F3bMYOZzj32TTLE45w3DiTeGkP1iUCzsL
	GYS4P6y0zIeTft9dTD2jTIcVMQRFg2z03kBrBDB7jibgheP6ooOrwtauOYlZQd9trQqJ+JwRVx9
	lsKPGcV6Ahsr05tf5fWxvRB6hwQneHUp97La8oP5mLnCIT2nDWj7+TpDr7QKpzKW5nEUlfE2kPD
	zQylE6odQnqy0TJvC24nx+MGC5moA8/8GsrPLHcK1xBraAGwPfzB1BHLYQy22SrZnUEoo8bx0mO
	dgQU7NfVp8SxuwdTMeRpXPkmn4Y/j7iXGpVRPX1Zf1MrMLIeCr0EmZbA7SGWMA0HB8S7tSreCGE
	QndfG2+YSd8QET48LlkWb+Eg+mL56Ni9P2jpdFj2V+2SWvmS2ZNItQ5PRyWw7x/xNLbiMiLwwKz
	DRes1YWl7BB5m2+1JW7m2ksPYLdpcjdiUB+WmJ+L7cNASVzxsKz0FGlqfm8nEY=
X-Received: by 2002:a17:903:1aeb:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2dd6c5f7d4bmr16986685ad.6.1789355946130;
        Sun, 13 Sep 2026 20:19:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:05 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
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
Subject: [PATCH v5 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon, 14 Sep 2026 11:18:56 +0800
Message-ID: <20260914031859.385224-1-a0987203069@gmail.com>
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

Changes since v4:

  - dts: move the usb_phy node out of /soc to the top level (placed
    between timer and soc), since usb_phy has no <reg>/<ranges> and
    doesn't belong under /soc's simple-bus, which triggered DT
    validation warnings. No other changes.

Changes since v3:

  - dt-bindings: add nuvoton,rcalcode = <7 7> example to illustrate the
    optional resistor calibration property; revert redundant clock example
    change (back to USBD_GATE as in the original binding).

  - driver: handle -ENODEV from usb_role_switch_register() gracefully so
    that probe succeeds when CONFIG_USB_ROLE_SWITCH is not enabled.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 284 +++++++++++++-----
 5 files changed, 389 insertions(+), 76 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

