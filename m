Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC73B27FF
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506987; cv=none; b=kdYe+f5zJBXMd+q9XCoyq7Tj5YU8AwwrjfoDEP753OSq29DSWL+g96IlI04I5R4somaG3HFUfEr8nm4dq2CVOQgNsikwSimyz5l0tpO7El3Hx7m9I+lQdNLxf4vjCb/ekrspTheELgrZvZCkXEkvQSATab/GaLe9a0S2B+huHdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506987; c=relaxed/simple;
	bh=CFZQ4T2NuSY6b1uW22iyRht6jFkIPGjm2CRlUiEMznw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4bfkOpEWAFeWVwz5xnTwJtUOP8NCC+SOdtX6odtqudp7WclKsE9SmvsJJkFAn2XHcrTH42iyJ0sHGXElZX3dtW4CR0svVfKdjb+4e93Z7c6nUpIgqY33WpI3kIWpaVmTFs6VKzQeReK5a8RPKKkyjoaG6d28CoZnBZhrUvp+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEoUTDKV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEoUTDKV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc97653887so5866665ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506973; x=1784111773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EcTCzAOxZhd2+yZYHcQy1edub3AeT6RA/ghrUBqO+Sc=;
        b=fEoUTDKVAsNXFPD6BTRpVN3wqRfQCBOPowo/Z4NyjxsRXa4fBS6xQZ5pH4h30pyZsR
         99RC+JmHJQbrkFe28dg5GW1SRL4p25UAxQ52Am155idl7HL4/qQ0KnS6A8QjNIhNrIYW
         9v/CDfLR8hHgI1b9T4bUZmH/sQm/usML09usFScW4HbB+iFoH2pmUjhelhZqt5qd8c3V
         9Nx+ek++Kn49XHdQj0b6M76Tt0Cflz7BAmTmaDNZ2EzwxM28uayMxvGJwgUnLYEtRvi6
         sWIa5d4XGx+R/57M7WJVE3ORWVusWQMQzcSU711jF6kl9w3pu8u3YF4FviWOY6BZFYdS
         UD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506973; x=1784111773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcTCzAOxZhd2+yZYHcQy1edub3AeT6RA/ghrUBqO+Sc=;
        b=LAo4aWNLjzoJHmO1x5+qkWdH7EBVXLo0OsZ9QUdta/g9NZMOqzlr4DvkVZ4CqMezO1
         bpCaj32tukD7Mk8MQeUREva9R6jNbaMIDLJNoc/SeUuqTF6QBkwsfDlkX9FH0SaG2Btw
         Rgeo3sjH8uAW/YpQiep76MyhKTB1FBpVkLawhsy+Ewgttu6i20gPROuqNYyyK8bvSN/u
         RC8t0RQiz+4fXFBPnAM4unaEiWsm5H3sWMXwKIVq5a80Ar2uPrPhmtSWpiPn6OcrSINL
         ZFBkv1SdfjxFp2XIP0pXwLFWvXmS4Vr5Aqxe2ssH6e//P6y37NxIUJviYl9SyRXl04JP
         7xVw==
X-Forwarded-Encrypted: i=1; AHgh+Roa7NFu3pr5njCx5e17T0eDnTYY5EmEf7/1pjj6H71EYzv5eO49HzNvhE7RVsJGWqeR7E4tWrlh4IBT@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCxw6rwVQDAWODE3+6oVKJIMkL6GnotoM/PwfXxS/fXihj/Kn
	kbvoASKtMEjfR6ZjtWYktDgOQ6Io0C01jf3EWRG8jGHwlmzUwePyqmv4
X-Gm-Gg: AfdE7ckUx/YrKbSo1IzvflfmMd7ObTN8q3MdVF/qqsBTpO9u8OMEZtndSaPuKWQ0lkH
	K0NrGA3ZOfTUiaGI2LsNRBj5DqVUMbrmbo76v122OXRqEmWCu3QWWfNspLsJRG4eZz8s3hYv4av
	ezs7fJlD0uvUK/4cY2pJfjhd8I3vUGuBnTM2mPi6NW28kKSCX5wWYy6BJklSt9mI41GV7OaNWBr
	HRDKLu192NUBJQk5z1Lp4cD4Zq8N6q2q4tjm7U3FGx2LwmUkCxfFCPuS0BF+YNhQGNBuhvIX/st
	XGHS/vJeZjKQwvajzfdk5Oh48po6CwvS4sLKAk1MKsU1IAXBdI2R5mprLx0wL8pYmx9MLcHochN
	htuuq1f6m90llXdNvXTCtZX42BPPZEwHPyb5O+VW0x33Vn/XhsIKnnokYVvvQ++tOzZ/JEDZGJr
	QpwqyjjcOsX5RsoVxbZV8HRtfMrwSLp/HHJ3HEEfIwK2FEbZMq/Y25wk+8+875zehiam/yJAyWt
	w==
X-Received: by 2002:a17:902:d487:b0:2cc:d807:369c with SMTP id d9443c01a7336-2ccea3e6988mr22070025ad.45.1783506973202;
        Wed, 08 Jul 2026 03:36:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm25987525ad.13.2026.07.08.03.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:36:12 -0700 (PDT)
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
Subject: [PATCH v3 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Wed,  8 Jul 2026 18:36:03 +0800
Message-ID: <20260708103606.1462960-1-a0987203069@gmail.com>
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

Changes since v2:

  - Dropped patch 1 (nuvoton,ma35d1-reset: add simple-mfd and child node
    support) entirely.  That approach embedded usb-phy@60 as a child of the
    syscon node with a reg property, which broke the established ABI for
    out-of-tree MA35D1 board files.

  - The PHY remains a standalone top-level node as in the mainline binding.
    The existing required properties (clocks, nuvoton,sys, #phy-cells) are
    retained.  No reg property is added.

  - '#phy-cells' is now enum: [0, 1] instead of const: 1.  Boards using
    '#phy-cells = <0>' continue to validate and work unchanged.

  - The DTS usb_phy node is a sibling of sys (not its child), retaining
    clocks and nuvoton,sys, matching the original binding structure.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  45 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 279 +++++++++++++-----
 5 files changed, 384 insertions(+), 77 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0

