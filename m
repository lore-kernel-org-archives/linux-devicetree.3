Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313B355F2E
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630074; cv=none; b=fXtxvyEIA+OjaiXMEhaZvlSekchiwrB7iHsUDY6YunUEpUq2OUUXQ1e8Z7il+bCcejBCzyOeTZSUwKI8zQsQ4D5NlvoHemwDGqB3Spl3wWj+v3Da9u7MWK8f5NRdR6KniRAW0gxuiF8yBz69a0bUlHnkoUicuCyk/j6inScFdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630074; c=relaxed/simple;
	bh=IIEe6p/2b8mHbH/L1QZ72Ut1uvoqOXePwTz8y7eTZ/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AEAynkmlPlpW/Sjch12dePtpWyTa8MYGt5HF5ZWDg9nfxDblgaF9i1XZ6q3qWS1v2c7ld/HJ/RLJUvddIknVIHhZSu+1YoWXYoLwLqY7lDCsUNBIIcqCRoOBm22l8R8r79Hyu1jtoQ4fWG0DsOgrUvofFeX6dbdO98aElsEnk4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqhu4PGD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqhu4PGD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b0ba3bfe16so20106255ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774630073; x=1775234873; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icAwEwH8j7JyHdp/GRQI0AOGmMKcZjmWcMVOP98ILmM=;
        b=eqhu4PGD6OrkyEso1+WRLZ/liwjvU/EQWDh02QCYX+L4v6s1X3Jir0uSfgn9ZufHoa
         r+jkNCTZ+k1PU19sqRFHr07SAF5MaUfPv/DnhGAhZub0zPdACIDWhEvgn1h+D7DQUKdZ
         9G/OkGssBCgjt5aDUqq0Qdv+gfWay8AQ4Qlhw3BZu8ED/7Tmqr3meuhSVd227AYfLwLR
         O+jNiPdc/U7vopvcJpwcR5qZV/1S2DFTOulIbss0LU5XMC8NnBg4rReauCuiMbs1mTmG
         SoDtxYX95/Y8y0fmSvU3mDUkUG3M/XZBcZ1TfFHTQpdDXSwmyen/jTW5EFq2xYwExHj6
         8CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774630073; x=1775234873;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icAwEwH8j7JyHdp/GRQI0AOGmMKcZjmWcMVOP98ILmM=;
        b=U5/dPSRWdGiMnA16m946ovE8FpmOb2PPym5X5ZSJLwK6vmLbfamsg4s7uiH84IB9Zw
         4JbEkpXwJRm8ZGXSb0rJrShTqiH9yTDlGs2VorPav+wb6w97LIWcqQ9/FnK8JYvf3/pm
         ZUp0+5Dy/TiJtxcriBn3rbqfD9cyAeYocEj84Kc7q5l5K7GVWE8FN81U/w7D3MlygNX2
         hxP5wSZn5J+mgriiZ95H61PLqF+7eRTU+zn31tie4jvHbszXJLYeupzo7SiqOepxDlWo
         zq1+z7ULTQx6F9Vhk3rTRr/NsBpo1S56fbjk5Et04PvU/i162OmKVRb7q1wyAscAw2/1
         CGaw==
X-Forwarded-Encrypted: i=1; AJvYcCU6+1ehPwpkts8s0v1sfKgY7owzAZWi98FpYKcrPWI/EtXNg1oMGb2n/F3fB2d9DKt6o+FIf25XKxVC@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3Gxd/SRQoIybhK86/wi/KgUyudu+bslEiwzpRYBHnH1btkuc
	GkRM4VBdlzoFk7gPu7pvPrfXDpv7wdnweO/ZNSxihQFGgh51sa1h46z+
X-Gm-Gg: ATEYQzwtsUQrDZQgKOK4D58wGSbWfGlBEY6lDBg6hQvzLAt6VujTPrxSpbfa6kqaS94
	ZpSNcVmVhewaEo4712+6Ufsw4ot9HnmMYlGr15blE3jZjdg+42QaNch4x06G4tDd1J2/UMrLtOV
	BJ7tbVDAI+kuEpH5dEghfjp0SwIVmVYeXN+O+btOV7JhY8/hXPhpHEyys3KYh2WHBsPINeSljHh
	csOtvs4T23i2990H5WawImdZ0PK9Ur4lmrCILNned471DhTS9YyL3rR2neSdo922BS05xnUcgqQ
	XuGo2vJZ8dHZd6ZpIR99snMbDyp7q56kE7QP1J7GlzKSDURCJXzWqVIySTMlXVmFfTHVJlRvKUV
	4AXYRK2Lwbv+GV+SRjtcbS7gkGaCz9j9P4E/bOh17epz0hPamFL7rpJb3HthMKvLktwF2zxhW6k
	fis5YBjcHl95kITN6+nKUenHF0TEIplAW3vS6Mp80ve/7a
X-Received: by 2002:a17:902:e94c:b0:2b0:5a4c:726f with SMTP id d9443c01a7336-2b0c48e9a76mr63024805ad.15.1774630072724;
        Fri, 27 Mar 2026 09:47:52 -0700 (PDT)
Received: from Black-Pearl.localdomain ([116.72.145.18])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc8b9da6sm86065305ad.58.2026.03.27.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:47:52 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v4 0/5] dt-bindings: usb: atmel: convert Atmel USB
 controller bindings to YAML
Date: Fri, 27 Mar 2026 16:47:41 +0000
Message-Id: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK60xmkC/13M0Q6CIBTG8VdxXEfjAIF21Xu0LhAPyqbZwFzN+
 e6hXcS6/M7O77+QiMFjJOdiIQFnH/14T0MeCmI7c2+R+iZtwhlXDHhFzTRgT5+xpkK7sjIgAWV
 J0v8joPOvvXW9pd35OI3hvadn2K7fCmeQVWagjDZgBFaCMeHg0g7G90c7DmSrzDyTXOaSJ6kaZ
 RScbGWl/pfiJwXTuRRJisbK0qHWvMZcruv6AQYTrBkWAQAA
X-Change-ID: 20260129-atmel-usb-37f89a141e48
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

This patch series converts the legacy text-based Device Tree bindings for
Atmel/Microchip USB controllers to DT schema (YAML) format.

Note:
The patch "dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema"
depends on the patch "arm: dts: at91: remove unused #address-cells/#size-cells
from sam9x60 UDC node". If the DT schema patch is applied before the DTS
cleanup patch, `dtbs_check` will fail due to the presence of the removed
properties in the existing DTS.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v4:
- generic-ohci: Modify the commit message and modify description for the
  properties "atmel,vbus-gpio" and "atmel,oc-gpio".
- atmel,at91rm9200-udc: Remove minItems for clocks and rename
  unevaluatedProperties to additionalProperties.
- atmel,at91sam9rl-udc: Remove minItems for clocks and modify commit
  message.
- all: Remove the corresponding text binding node for each patch from
  the text binding file.
- Link to v3: https://lore.kernel.org/r/20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com

Changes in v3:
- sam9x60: Add a new patch removing the unnecessary #address-cells and
  #size-cells properties from the sam9x60 UDC node.
- atmel,at91sam9rl-udc: Remove #address-cells and #size-cells from the
  atmel,at91sam9rl-udc binding properties.
- generic-ohci: Add an else condition to the generic-ohci schema properties
  for improved validation precision.
- Link to v2: https://lore.kernel.org/r/20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com

Changes in v2:
- Drop the separate YAML patches for OHCI and EHCI.
- Add the compatibles "atmel,at91rm9200-ohci" and "atmel,at91sam9g45-ehci"
  to the existing generic OHCI and EHCI binding files.
- Link to v1: https://lore.kernel.org/r/20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com

---
Charan Pedumuru (5):
      arm: dts: at91: remove unused #address-cells/#size-cells from sam9x60 udc node
      dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI binding support
      dt-bindings: usb: generic-ehci: fix schema structure and add at91sam9g45 constraints
      dt-bindings: usb: atmel,at91rm9200-udc: convert to DT schema
      dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema

 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  76 +++++++++++++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  74 ++++++++++++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +++++---
 .../devicetree/bindings/usb/generic-ohci.yaml      |  41 +++++++
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   2 -
 6 files changed, 224 insertions(+), 140 deletions(-)
---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-atmel-usb-37f89a141e48

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>

