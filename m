Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F132F757
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096035; cv=none; b=fL+L54l/Fij5GOrOXjE+lqnBcHWf3tosHhimGLJu/u5XfAkl9okhXJVQgSLn1e2V5shtLOqcZThrU2ehq957sX31xl/gSP59rXE1QUo6utUkxMsDatiQbh+KFEzkx4Jk6P5U7RBXK5U5y6ZCHnMGPyGxbv3zdR8eb3BwqlT0+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096035; c=relaxed/simple;
	bh=IumsBJY/68uD1DAyl0ojHH88Rxzv5otuXToNllxUdWQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YLP5HCoPW1HRfdCNrtM2qiz78m6igv803F8WB2srO2Dgupi45lCbqPuJHNXkcVRAZ45jv10ZtXG/gBqxyWMyY5GBsT9LSyQzPWoTU47Obq+jGHTLkRRIreju9XycG637IQHaDVu38nl40ipuRlMw6IzZkLUxkqFdyxt1mtE3yRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HavKA7h3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HavKA7h3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso243535e9.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 12:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096031; x=1778700831; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVr4I6OhLAaxawRod3py4pnB+8B+XGHPtuWfZP5G64E=;
        b=HavKA7h302EL7TGLRmKppP9pJ9LuW6pftwDsYV8+wT6ezKb0SU7aNA2TiedDS9+nTr
         k7RtRUUTLyW7uLlWquewRjW/fbPBwFX05NZKWkdZ6dJoIOldd/imYw/AstJj+pU5q4kR
         S3ownqUH9DBCpjka83OPvlpqL0GY2TL94cSGRUermEt9lSUfyv+M+RprXiRAmRMverSa
         SvMlZt13Mgcbyzp03am3cOQuBppXOIOF4Ze87Vnu0B/s5cIeQOo0pIAXiQ9pB6evJbTt
         z/6D7S2Zzkb5BRffrwVCzP7HqheiEXeFdZIafX1VFY8m86345LGfgCOW7T+XVeuwIH7h
         NUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096031; x=1778700831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVr4I6OhLAaxawRod3py4pnB+8B+XGHPtuWfZP5G64E=;
        b=ZRPc95BkJNDaL0WdShUG6VcCddsicfNkno/UUF5N6RyE2Vx23NLGEKTYsXuzuaxFxo
         5nrg59VpgHx79q6mLsG7ixREGTMfpQdLMkmyeuEo0kDbVYy7WaITZsYKodkVYxZZcBpM
         v8/sr+NRPSTgBUldVdl5D1IKzeBYHNfxIikwRshwjPXr+i66JcVnI0+9CqFQHyfb21bA
         c/a9FECpc1kDyE8+sIEj/9Bq/0LpYCdJH18p6wJhOCe3Wg4zCRNcSyIMk1Q4MAJnUySZ
         W2n1P60blqa7tn3gXFObQh2flkFZVK4TV8lQ7oOiyRE9vvDLPFIdhmzfslmpfKI6sHYl
         4p3A==
X-Forwarded-Encrypted: i=1; AFNElJ9csmhr9duq473vwnxSP08Gmvih8LHk3JQeFBgvJLaeSKd96tE8vp0ohQ0DY1RfZUPi0xj363QmWcZP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MEuVEiivp+3e1E383s+yPsNAUEDh9fUGDdPidhObcSvmsR2w
	WpbYxR7jFhpOvYMXR9RPfHqYXy3Wgnty70x69sqdmKRwf99wsT2YIdhA
X-Gm-Gg: AeBDieuYmzynwz6npq0+GaIfFRof+pEzzauvtVsQ9jzKZqrMfNsuIN0pHIvNkw/uI93
	NrTNiYn0cYpxYJj9MbBMrLFeszfTZdmp/3wcyKCItExEYDEYsFmM7jNFMPFp08fhAaXzB0T/46B
	SpbX+EcZXm/3ZLLQxeuaZkmHOzK2/PLiCDJgLbp9QBYQZnjvwF8oST/mYVgpt1aabg7HBS/j4/k
	acYkqeug9PeZ5lELxUFZk8f33cv0neDk//WB/aqCxwCNhGY3pqIuYXQE+4msmMf2059Dccqgpuv
	xcXQSlgHMQTaIjpiY70JFI04w+UOFdSAjC8e3X5X4S+D/+mRLonVBkKBDn3mAh6erbjj6BdiN6U
	Bynk6vHv2HxxBp80Y7ySRn7wBZQ9JphuCelh0kLdrsaOMBVyAsbwxHFOywMnl4oaOeJHJLF0AU7
	aB0DaRkZGGI/fP0GfS0H+pyAhYFNEt5/boAlHU/1k82Lvu53NLd4+fNg==
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4515da967c3mr7862014f8f.37.1778096030578;
        Wed, 06 May 2026 12:33:50 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:33:50 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v8 0/6] Add support for ZTE zx297520v3
Date: Wed, 06 May 2026 22:33:17 +0300
Message-Id: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH6X+2kC/13N3wqDIBTH8VcZXs9xMjXd1d5j7MI/pxJWjRyyE
 b37LBpEl7+Dn68TiTgGjOR6msiIKcQw9Hmo84m41vQN0uDzJgyYBF5IGrH3VDhQCFqgcJrkp68
 R6/BZM/dH3m2I72H8rtXEl+shkDgFioX2wKzmHN2t6Ux4XtzQkSWQxA6xYkMiI+MQSoWyFIU4I
 rlH/59kRp5rrE3FrAV9RNUe6Q1VGVleMgTwzFu1R/M8/wCHsxKANwEAAA==
X-Change-ID: 20260416-send-5c08e095e5c9
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5625;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=IumsBJY/68uD1DAyl0ojHH88Rxzv5otuXToNllxUdWQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eNh+r2QhpsPjvjGcW3ZFofw8SmJJc0RnLO0
 8iTYeCI5UqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXjRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL1FxAAkay5ZSjMustiVPUMIApO6OgwvH1NoWW
 QPvBPHmRP6vzAA6W999MCJCYzQ2URjWzh5h7X9N+Sx9Su8HLaT4KG8fW+nv6tIe2GcxLZU1nD41
 Hqx/OVDlngrjysPGGrvIxm0XVlyhuLDQ2/Ok/tp3lQKiIGw5g7jvkTEvBtW/0U01M7CiVPqoaIq
 SooldcoB9PK8N5qHCXR4IdwBXKNPjrr4cl94v2bvCpU8HVuKvqKdVdQxI4GN/23WvxfiENnRfan
 3LBqmmmsg/KahQ2cg1se3xbzgl+EoXuyWZz7tl3TliN0izyKIswFKWQM8JUPtWLXNollNwpQgCu
 xQUyxZG65npDsJNxptZwI7t/NGj9FzJ7t7Q6aAfMAFwQ7ecwmit2iGcDoy7TWVTwUhMYO1ekbwX
 jE6XRm1l/H+l7U/lvFvLhCY2SpN3PaH4WV6q94wwwicR2QXdW3RK0wa867YgWaU+G1oz451JLYb
 KzQlek6SgX7M8fmLyPw4KwzGLAhQANwcx1nthCjWcaAyKmWFIcMEYfSvkkJZ/IFSSP2VVRQPtx7
 N0dBBAtlg1wfvu6JHnvvqeokstmjapHhr53kdUnT97vejsmqB3lZODQCK71zYWyctJ987USHglV
 UUDbeTXf1uVR2/WTGsiKZB4Y1Pjp2Wq35Oh0GNpYYi/7JkI7aMjE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

Hi,

This is a follow-up on my RFC patches from January [0] for ZTE's 
zx297520v3 chipset. This chipset is popular in cheap LTE-to-wifi routers
sold in developing countries. My goal is to run OpenWRT on them. I made 
more progress in more work on this SoC and it is time to get serious 
about code review and upstreaming.

Since my version in January I managed to get more hardware running: SPI, 
I2C, PMIC with real time clock and voltage regulators, Watchdog. LTE is 
not working yet, but I am able to start the coprocessor that handles it 
and talk to it via mailbox + shared memory. Wifi is working on a few 
more devices. Since WiFi, USB and Ethernet are working, the devices can 
have actual use with OpenWRT even without LTE.

Another hacker created a free software program to talk to the USB loader 
[1] and boot U-Boot and Linux without modifying the on disk files. At 
the moment it needs a proprietary blob, so my documentation is 
emphasising booting with the on-device U-Boot.

This patchset here is mostly unmodified from the version I sent in 
January. It is the bare minimum to get an interactive shell working on 
the UART. Future patches can be found on my git repository [2] for those 
curious to peek ahead. The first 30 patches are in reasonable shape, but 
the further you go the more cleanup is necessary. I expect all of the 
patches go require a few rounds of feedback though.

My plan for upstreaming is largly this:

1) This bare minimum boot patchset
2) Add clock and pinctrl drivers
3) Add standard hardware to the device tree
4) Add zx29 specific drivers one by one: Watchdog, spi, i2c, DMA, PMIC, 
battery
5) SDIO backend for rtl8xxxu
6) rproc, mailbox and rpmsg

I am willing to maintain support for the SoC within reason. My patches 
add myself as maintainer. This is a hobby project for me though, keep 
that in mind if you want to ship a commercial product with these SoCs 
and upstreaming Linux.

Cheers,
Stefan

0: https://lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099306.html
1: https://github.com/zx297520v3-mainline/zx297520v3-loader
2: https://gitlab.com/stefandoesinger/zx297520-kernel/

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v8: A number of Sashiko suggestions:
Add new documentation files to the documentation index
Add new documentation directory to MAINTAINERS
Remove a redundant "if ARCH_ZTE"
Set ARM_PSCI_FW because ARM_GIC_V3 needs it
Use the correct UART01x_FR_BUSY flag in lldebug asm
Remove an accidentally duplicated label from the DTSI file, properly use 
"arm,pl011", "arm,primecell" for all UARTs
Remove BINFMT_FLAT from defconfig. I have no idea how that got enabled.

Point to a sane (but not yet upstream) U-Boot that sets up the GIC 
correctly for this board. Improve the provided example GIC setup code to 
detect this for reusing one binary for both boot chains.

Changes in v7:
Fix line order in mach-zte/Kconfig
Use "zx297520v3 SoC" as the option name for CONFIG_SOC_ZX297520V3

Changes in v6:
Squashed DT commits into one
Removed for-now unused board DT bindings
Add "zte" to DT patch subject
Regenerate the defconfig with make savedefconfig
- Link to v5: https://lore.kernel.org/r/20260421-send-v5-0-ace038e63515@gmail.com

v5:
Spelling fixes
Renamed dlink-dwr-932m.dts to zx297520v3-dlink-dwr932m.dts
DT binding indentation fixes
Use a manufacturer 0x8b for the UART, fix patch prefix
Declare all UARTs, remove uart aliases for now
Consistent license declarations. I made every new file except the DT 
binding GPL-2.0-only but I don't particularly mind GPL-2.0-or-later 
either.
- Link to v4: https://lore.kernel.org/r/20260416-send-v4-0-e19d02b944ec@gmail.com

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

---
Stefan Dösinger (6):
      dt-bindings: arm: zte: Add D-Link DWR932M board based on zx297520v3 SoC
      ARM: zte: Add zx297520v3 platform support
      ARM: zte: Add support for zx29 low level debug
      amba/serial: amba-pl011: Bring back zx29 UART support
      ARM: dts: zte: Add D-Link DWR-932M support
      ARM: zte: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/index.rst                   |   2 +
 Documentation/arch/arm/zte/index.rst               |  10 ++
 Documentation/arch/arm/zte/zx297520v3.rst          | 167 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml     |  26 ++++
 MAINTAINERS                                        |   8 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Kconfig.debug                             |  12 ++
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++
 arch/arm/configs/zx29_defconfig                    |  53 +++++++
 arch/arm/include/debug/pl01x.S                     |   9 ++
 arch/arm/mach-zte/Kconfig                          |  29 ++++
 arch/arm/mach-zte/Makefile                         |   2 +
 arch/arm/mach-zte/zx297520v3.c                     |  16 ++
 drivers/tty/serial/amba-pl011.c                    |  42 ++++++
 18 files changed, 508 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

