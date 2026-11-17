Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919490;
	b=5CZzdgqJFI6RAoepU5XOF+ZGnkZrRBj3TjwkWKVL+9Z9zPdtmiXvIJMvlD1R8dLZWMxa
	 RD5pzdj0yznNUOuS7dzfNk8EOCl9sFc/Wdi0Akr6bySksw50/0wijjUN1RYwqKdm3MPo9
	 1nO2KFcSkHjxe0YDuKiZYbaGfSGGEtKjdsEHD4pbCmVylFarTWQERiWgDGGsLthh1SIRx
	 wlRrPq0oCew9xo/KWlayf4qXXbfoxUfRz3GuobZsueUJk7O/XBmxEl4puxPBQRLJP8vkA
	 PMrh/D0y8IxFB1CnDCajNi8Vt6B6LAngFwUtvUd4A/NMWCuNV0AVq2IRDUt/JWiLcRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
	b=kFiSs9pxJNaA6DomC3VvumhJOJIlSNa1v7/WlEiVixG3wmeXohJMCDLZrq66L3jrDZ8+
	 xrCpDjiGHYYMMiAiEO5UiQxFcGltSpL3Iden/7BLT/RJKVE4aL1OFaR3BQVZMkeo6RtmO
	 Vrt2shOFtb+zKlj4XFYArlnD13+Az878eu1XzCI5XV/teSjauk4JDwgMwFfuN4x7xZ/Ss
	 DY1Hk5OF8lvrbGDVKz+Ax1wICKkph1R3dgyol1lHM6M4C4O9RPAg6AThUr5E5/gNItPlv
	 VioJTjNwEwFiq1A+upZAQGU86wP2fk++eLG1P31cyxMndOJ9JKmXet/7JOPi9qCCmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9P3tklZ;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E7606A332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02E7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9P3tklZ
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed08b07213so21683925ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919489; x=1795524289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
        b=L9P3tklZNkzH8WQmEiIFtR6X2/A76g64iLk8HOx0sMAsSIVH7+tCWASqDM7ub5RiFV
         FX7Phj2xZJeomtBsuenxvU8A+MfXZxsvaF57BYv98+StouewMDLrKvYa6d8yhBrrft6M
         buuXXM0bddo5UsaD73t8avekelxnYy2LO0lD+7geTpEGnmve3/7X9pq1K7txuYWn+xHS
         AHHv3EnOOwVzh3M3Dw0gkJFxjWpYI29J3453viVBeHK1Y1Y+LLuCNOlmqB6tcmLBxXQv
         ovV806HhgOzCLl/NgleFL0TYdGPra1N2Ua5wD+mcssBZgS1B5U1H83NstNr/Ll2tZUs/
         RYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919489; x=1795524289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65x/rmOi9eSRyE50YMLG+5ikwTFST6PY1hiF0uL56W0=;
        b=a8TuNTk5mf7Yfb76s+tAdUcX5nV9ErY+JUUxpAkBljWHKb3N5NElKpODf891j6uaIF
         61qq01g+4D8wzcgOrMfsuYlraIr74n+gaFqEesx7A6f8gM+nmhUs9Ot8KKoEm4Amr2dK
         nFzvVPq3C+tQJtXG/8LzEZ+l3ga0gEONAjq2IR4rrXpwvXTgvvAvYM0zvtz2NPMLAdta
         0sww/K2bEN/UIcpoFAXf7u6lUi+NPU4EdfHO+UJZ7VwHe53oYrTIvMD7tEafafGYUpRC
         qoFQvPSsKuIfV3IR6ko85c2DmQ9Nsj8XoD06VsfbAo0S05of2amLPKVbBiX0olBrMqL3
         clbg==
X-Forwarded-Encrypted: i=1; AL+hErGie4NoCv2szEMIIXcSsaytgBCQbyIttdHqOBuYFD0lCe9OACbYyBszP5NhtLuHtcMzZ9mCNVKUVgjD@vger.kernel.org
X-Gm-Message-State: APuU4Z8U1yz7oWmusS2W7ttRZvRfQErkPcy5ekcbraaY/P9ufn3el0JP
	l6MZVbQRTOIKMOkHWP+/xCcIKPZvRsGqNdqAwXroLUmPxys++n5vf0AV
X-Gm-Gg: AZFdTZdBI/sPMljn2Cy1RHTjTdSkhQV8PoawEMaPti6JVC6WW2QhiktYfw0M1Eht34p
	o6V6MiZE14zLruDBxULATxpqrkFW9hLz1yRoRzYs/H5uKZmCWgzdiszgrogFC/v/cnqsMXMLzTl
	fZAay/g6iMcR1uDOvnpS37AChHCrbkaAu6xDeAP4tlFzMSBYVaaQjmukFPv9b2KEfHm+EB091tp
	hf9cQdL11oXUu+4++GM09XiI309rrrNKvLNZW0BWFTRkrSsL0Ca7MmmeYyXfpTQ0tnyaG9agVfe
	0Nasfj0GVrVjkCi6jWpx2JmgbgVBTgCidBUHp1f0iuQOUo8ArGX29ORj1QVMuuD1A7vEs6uLX0m
	fcsRC4XwJGo4tV/ZFC0wM2Ot5ZE9mWJEVVTG3FM2QsQk80GqAEG7ae5Azi35xw6jwUm/Xo+qCr6
	HZjZhMUWx1EEaFQQPdGD6NShdAR+D+RT7nI3UOUpAHuCFDqrTjIL3fg1pWfSusht1z9Ix53FLDM
	ZYpwXCeuAx9eQwVF53QKWtsonoeWUdcHsaEp7riWcA9i/D7x8dyBDCPagBN90tNVCjwLeGryQhd
	ppMXLFuuSamrzYyvpDSrewX6gdGk/amPyA==
X-Received: by 2002:a17:903:19c8:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ee0dcd06d5mr119181965ad.30.1794919488900;
        Tue, 17 Nov 2026 04:44:48 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:47 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/2] Add Toradex DSI to LVDS adapter with the 10.1" V2
 display
Date: Tue, 17 Nov 2026 09:44:12 -0300
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxM/GoC/x3MQQqEMAxA0atI1gbaLmLxKuKiTqIGbGdooQji3
 ae6fHz4FxTJKgXG7oIsVYt+U4PrO/jsIW2Cys3gjCNrLWF1qPH0MWKVzJowMONRuTwlkCe/UBA
 zGGiLX5ZVz3c/zff9B0l3gv5uAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=1590;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Fj2m0UsmYRbogE2wB5gnwQa+eW5qWmp45T7j+6XBwIM=;
 b=l2PR4FEDB+ESaSkJf52gV0k6GKWc9FUD8b8QzlURaMMAOj6dohZg5elkpgnWtzvKi+8fj40LO
 n7rxq6nv+elD/Y1f1gYBh68+aCmZ0Hq64vyvicESYUrrZ+YW5RC4fxy
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This patch series adds the device tree overlay for the Toradex
Capacitive Touch Display 10.1" LVDS V2 through the DSI to LVDS bridge on
the Verdin iMX8M Mini.

It also renames the existing DSI to LVDS adapter with the 10.1" V1 display
overlay, to keep a consistent naming scheme with the V2 and with the other
Toradex Displays being introduced.

Changes from v1:
- Rename the V1 display overlay to include the 'tdx-' prefix and the
  '-v1' suffix, to make it clear that this is a Toradex product, and to
  make the major version explicit.
- Use the new naming convention for the LVDS V2 display overlay.
- Add comment explaining the usage of rising edge for TOUCH_INT# in the
  DSI to LVDS bridge with the 10.1" LVDS V2 display overlay.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (2):
      arm64: dts: freescale: imx8mm-verdin: Rename Toradex display overlays
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display

 arch/arm64/boot/dts/freescale/Makefile             |  34 +++---
 ...dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso} |   0
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 134 +++++++++++++++++++++
 ...8mm-verdin-tdx-panel-cap-touch-10inch-dsi.dtso} |   0
 ...x8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtso} |   0
 5 files changed, 153 insertions(+), 15 deletions(-)
---
base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
change-id: 20261116-v2-imx8mm-verdin-add-lvds-v2-a6868b6ae070

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

