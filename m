Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635412;
	b=GGxRZfm9MrQehF0EZbdFt0/X8hoDEHX6+FDrXS9HFeDNI8fMWTn8O0aXFOFzpHCKHF2f
	 OKa9D5oYiHIpSzYbEWmT/YPm/TfvS4ODub67rfeJgu0Axp5U6Gxt98RxZJvsUSb+HnP3L
	 CBQXT4GTwmZsm8WIvpdybQ+5toXhi5FBLU9NhfTDDsYFejoAJcoLzCbw5oVh5+GLvStEH
	 Xq6kHfA8IKskHZNmifbS6BRizPUdaw4zcqXZ4vlzE0tagSlX/os5HZveJujhqHVsOs+J3
	 XKgwoWbdT8uXUU7lgXNVKIrpLu/BgKtGO3KKFUbs/dZHfQLG6CYvZzVjKsBSgJMiRRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
	b=Z28NICsZhNB1Ajn5geOIRNnMbVhoVssZGsDHHfod43C6JQ5NCuxPBTkyNKHWtXT+jbJe
	 Y6QqSWSVzOF8UNP7fo+AY9PzFoVLF8N2rTXP/xtbzRhF5kDpgfeK+O2HP0dHe9VXFzxCp
	 6y0o6vvI2KtZTEv5QkJmbIwQwNvSNoI981fNerprHm4g59cMT6+5lxnUFcBuX9iN9zz7j
	 y/UHYA5/gWcnmz9iZWf20II+F0aDc5NAQA1LAfUeGEcEajO794XvgCfyQIW33FUHa6O3h
	 yr09lQJeV/LsSaFGgEwXKTdGd3Awrb69RT9t5yS8agVkHZI3V4xpVs3WeQkvlJWtqJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=aoR5T6p5;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B4606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=aoR5T6p5
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3563569f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635410; x=1796240210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=aoR5T6p5un41DLJj8bVcpqBNPTQbYrGbWu4Ev/PsYHk7rJpNI5jNAWntAarThZJGVF
         B4k74T1hyoxU+baAFqCkmlPuBIsZtA6tTBndCvufKl2ASm+xAD/pRZN/8MtmOY2UHFzf
         OwKfXj/9uww3JzaYnbAyc988hyiVYIdDzrxoTwUiFm7nRLKdywEvJmPv7cA4cumbjFCE
         9uQ/zusUdpSY5hwjPX/lCvRqoiE+uOknsx1eGnr6hm4OEableV8COUWEpzyhO3uzS6Q6
         tI+oSUjJqvq3Y8Lup03ffkzA46/KApZDKOZU7SwrK7NYbCcJIsvWO3KjYiTVuJ/GahUI
         YBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635410; x=1796240210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUEh2z/Lfj/cyfXTO+Xgga6ml9wG2VHxoXZf23tHAmg=;
        b=1gc5FR9+V9+H+dUQLtMYGKPq4f89yBV41mH7XEBjeLFmqFKxfXkwTgm2aL/fRfFx7j
         yvbK90bRi/n440CgHMhvdM0WTa5i+n4fjuMYn6FaujCnsM3DrsSZPp6HcWb31llj6Q68
         n+EQ7w9IdjZjIf4MfCIiFQtXEYt07+xCxjKRbubDGJS8F/fMGp2xeamy81y7ykY71n6B
         RqzbeEUfCn93ZpE9HK2iiWt7EUgmhG/t5cAYfbirzGSGezT9imjpo46qh++fKhMHf296
         ttMvhD0eeB20jBLl3N9q4OKCHX4cz32pGpKGryS76raYQcg2K5I9HyYKUDXECb2mNY0y
         Wqgg==
X-Forwarded-Encrypted: i=1; AL+hErH/flDjLEIU9wKylXqXgO+p/Ek+vvSmXByg54qsFntm42ECracG34X0YsOHw11q0GLGSMnZjbdQPIuU@vger.kernel.org
X-Gm-Message-State: APuU4Z8U9xNA64uUFLrVqe+Y+u1uaCAP4wS3p5yUygWJAzm0yxr0SeoJ
	Qaw/HPOgZVJH3lUM5iWx1uIrelYTQPhYdNdTJNKbytXPiuC/09xSf3tJy01qZ8kJSy8=
X-Gm-Gg: AZFdTZdarZa1pNJjqzCKasrbwEWS0+7oU35i2/6IBPG03O7QOSiurkWBtU7PWOA4AvE
	dUKd9NVyMp6nakUabG015E6IiZuZV2H3sNzFuw4dx8gQ2KkRZZ3oLCANsVpsYfOiU/sDA9uVWdC
	bmHL3kppk4sZBUuIQsCMOtdgCMwxCInGhc7jUpbUiZ8orcwFZrQIOJglgZLBQhT+qAS8NI8yuuE
	XlRzNTZCAZZPMRMThltN18Y3fD66d+6yhWGigl6x//rGCAo0HcOBQWFxgocqSHlQGfFJkes0zVt
	OrGAR6I3n/tR9KHj0svxwYI9OOCNSzWCa2B/94HGRFLnavI8FYjMV9ZS/k//eUJzOQkt5mFZhaJ
	z2rru9Nq9WaA3E7CzP1dOFssCBoU7yvpeLgugdlzV7pi5goW6cZ1HT1ONWUxGjTwvlJgolsCucT
	M/Va1tpIXuU8oodNe0QuABHyAOXpQqUCar624UnPjBfG9tL9SNand0tq+7uwxKq6dHwe1Did6bt
	srZOR9Z0ErfMtshF+qzvQIyZFjnOYfWvHgF1BnhrUTc5LWm8IMBRUx3z+RUcIarKgoARzAGhR6W
	A+r6TB1SVxK0z+iZelzWgzfWso4OiGtgXMwwc1qcPybF0el/qX3s0Yi5VSv9MrsMcHZUjIGXK6P
	HsxToKf8yjA==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr24341175f8f.38.1795635410326;
        Wed, 25 Nov 2026 11:36:50 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:49 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v5 0/5] net: Derive stable MAC addresses from a unique
 device ID
Date: Wed, 25 Nov 2026 23:36:37 +0400
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNy27DIBQE0F+JWJcI7gU/usp/RF1guDT0YSNwr
 FaR/72QSFWq1upypJkzF5YpBcrscXdhiZaQwzSWoB92zJ7M+Ew8uJIZCGhELyRPr6jbhk9z5Da
 eg+PvxnK0vQCFTnSdYmUaE/nwcWWPT7ecz8ML2blatXEKeZ7S5/V3kbX3z8UiueBkeokaWuEtH
 PxbiJHSfqSZ1ZMF7hnYYKAyamg9gRkk+t8MfjNSAm4wWBglbKsbZz02fzDqnlEbjCqMUwKHzoC
 WEn8y67p+Ab0IaeKhAQAA
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5804; i=alchark@flipper.net;
 h=from:subject:message-id; bh=i85cUXhyWb7m3a6ui+zF4b9HUAnpfV7UPHIO1a7Igto=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5y19/A21y7VXBHY2fcuT1DMuHaewckTewWz88TyO
 W4mG+l2TGRhEONisBRTZJn7bYntVCO+Wbs8PL7CzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX3njMyrF9XWXL25prW7JVf2c0qD+Ql25xfV8fvPMng3/aTB6K3/GRk+PBaRrW
 QQ/Kyc0jP60UlW0IV5zNPfRXnsrzoC6Pc+VIufgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Derive the addresses in of_get_mac_address() instead, as the last resort
after any stored address, from a "unique-id" NVMEM cell referenced by
the Ethernet controller, so that a Linux image can use the same stable
addresses regardless of the boot flow.

v5 moves the derivation out of the OTP driver following Andrew's review
of v4. The CPU ID cell keeps returning the raw CPU ID to everyone, and
the Ethernet controller references it as its unique ID rather than as
its MAC address. The derivation is picked by the compatible of the
referenced cell, as the algorithms differ between vendors: Allwinner and
Amlogic bootloaders also derive addresses from chip IDs, each in their
own way. The addresses are indexed by the controller's "ethernetN"
alias, which is how the bootloaders assign them to interfaces. Doing it
in of_net.c lets any controller with a device tree node use it,
including PCIe ones, and needs no changes to NVMEM or to the handling of
"mac-address" cells.

On the Rockchip side, the existing CPU ID cell gets a "rockchip,cpuid"
compatible. Its location comes from the cell's reg property, so no
per-SoC data is needed, and other SoCs only need the compatible on their
CPU ID cell plus the references from their Ethernet controllers.
Controllers without an "ethernetN" alias keep getting random addresses,
as they would with the bootloaders.

Patch 4 moves the RK3576 OTP cells from the deprecated direct-child
syntax into a fixed layout, as the former does not allow a compatible on
a cell.

Only RK3576 is wired up here, that being the SoC I can test on.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived from the CPU ID, and both GMACs get them
when the kernel is booted without U-Boot proper at all (via Falcon
mode). The raw CPU ID cell remains readable alongside (e.g. via sysfs).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v5:
- Moved the derivation from the rockchip-otp driver into
  of_get_mac_address(), with the Ethernet controller referencing the CPU
  ID as a "unique-id" NVMEM cell (Andrew)
- Indexed the addresses by the controller's "ethernetN" alias instead of
  a cell argument, matching how the bootloaders assign them
- Added "unique-id" to the ethernet-controller binding
- Dropped #nvmem-cell-cells from the "rockchip,cpuid" cell
- Dropped the net change accepting longer "mac-address" cells and the
  OTP post-processor
- Did not carry over Ryan's Tested-by from v4, as the implementation
  changed
- Link to v4: https://patch.msgid.link/20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net

Changes in v4:
- Dropped the NVMEM core change letting post-processing shorten the
  output, as cells have a fixed size (Srinivas)
- Added a net change letting the NVMEM MAC address helpers take the
  first six bytes of a longer cell instead
- Made the OTP post-processor write the address into the first six
  bytes of the CPU ID cell, keeping its size
- Link to v3: https://patch.msgid.link/20261123-rk3576-otp-cpuid-mac-v3-0-40c756dcf36f@flipper.net

Changes in v3:
- Dropped the OTP read serialization patch, applied separately
- Replaced the SoC-specific NVMEM layout with a "rockchip,cpuid"
  compatible on the existing CPU ID fixed cell, so that it works
  alongside other fixed cells (Ricardo) and needs no per-SoC table (Ryan)
- Moved the derivation into the rockchip-otp driver's cell fixup hook,
  which also makes the layout module unload issue moot (Sashiko)
- Made #nvmem-cell-cells required for the new compatible (Sashiko)
- Dropped the dead match data and address validity checks (Srinivas)
- Allowed MAC address indices up to 255 rather than just 0 and 1
- Added an NVMEM core change letting post-processing shorten the output
- Moved the RK3576 OTP cells into a fixed layout
- Dropped Miquel's Reviewed-by from the driver patch, as the code moved
- Link to v2: https://patch.msgid.link/20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net

Changes in v2:
- Switched from a scope-based guard to explicit lock/unlock calls in the
  OTP driver to avoid mixing styles in a function using goto error
  handling (Sashiko)
- Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net

---
Alexey Charkov (5):
      dt-bindings: nvmem: fixed-cell: Add Rockchip CPU ID
      dt-bindings: net: ethernet-controller: Allow a unique ID NVMEM cell
      net: of_net: Derive MAC addresses from a unique device ID
      arm64: dts: rockchip: Move RK3576 OTP cells into a fixed layout
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/net/ethernet-controller.yaml          |  11 ++-
 .../bindings/nvmem/layouts/fixed-cell.yaml         |  24 +++++
 .../bindings/nvmem/layouts/fixed-layout.yaml       |   5 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 110 +++++++++++----------
 net/core/of_net.c                                  | 105 +++++++++++++++++++-
 5 files changed, 200 insertions(+), 55 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

