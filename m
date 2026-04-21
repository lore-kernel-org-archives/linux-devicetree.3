Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE44378822
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803040; cv=none; b=GU+om56I6GEo5PMsbHS6ksJszCPiprQd6SlloKLfURrIMgV3McUgjbaXkCml2rz1WCZIrLT/TJMreDU7Fz4Ax5SeQLjEJqvv7MM044Q+pdUJgamnQkET4iXWdjciLM9bRYtmHxPuPrhzlSJlVmDk8Oc5ePcR8jjEnhO9pZanlgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803040; c=relaxed/simple;
	bh=o9gYTJKBqIyVOmX80U3TwTTah7IWirGi76Bxb25Nizs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZcWb7J+W4nd+/q64ENyau35kTcI6haB5NQtH9FNvf5RF2oQkjLY/92pvIaCqAdu4uHKSQQRRedzerjqFZKfUSr/5FaCCsGFhBlqf6op2C5QrC+ptOlghIABncg/5PFBtqfi/YHwfmcDwJlv3nSPfIpd4lscOKnocRZB0m+W1x0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syvfkQMM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syvfkQMM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so11158675e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803038; x=1777407838; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVlIjHK8beTpkqGMwU9MBSNVUOjmph10Qmo15WK1r6o=;
        b=syvfkQMMnQ6pqaBQzIP3kgYdCqBwG/Z7JEvs75r/rWnBMCloVvd418iaUoY3JGz+Q+
         Y2agpGjOCmpGi0LoDTW3QLnZt5naT3EBK8m78qEwYlrmC3XDBTUETBbxHUQV++VeeLkj
         gvOaTzJSe/+F4qw5y8YGS+wT2cAUZyD0mDo6mAdD0Pq51u4PJEO7t9A8HSyTrbrA5VM0
         VuQVxKcwuik69aS1U8u98YhFXPNTHxM3OeMqEw+zXHTDLWhB18EYzW0QxXbPZmu7noXY
         Pb+oMfX2sUO4BllU7PxEhmjBrervIyr3POnNW4911JnqAhQ4vCDISdVyts+VwFHtKilQ
         dIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803038; x=1777407838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVlIjHK8beTpkqGMwU9MBSNVUOjmph10Qmo15WK1r6o=;
        b=hisgDMLkS3Hy6nJSbSToGpCkyOBLt2qVDuoXZWYNQ4p9Fte8BziYY0uieQVldhl/UR
         mXSuILL836FndtLgUAeKVDcbyOVwiN3Ovf3cj+wiowY4VUu4pcm3XbpQW/10zDai5NJ7
         Rsc3bUSYhT7EvW3O6/tsAsxFR2dqna7FbnzIu01Mv6Y4sLTqW+rp8e6OpZyyx0KSW5Ti
         l9tgRwTBRZQ8X4UZxQ5u4xpg6yw94rHm22oRFe/ijlvbQrKWi+ImcMDvkG8c6Q14Eewb
         ZHpVb2J3nWlMiXHqLBI5wL9cQFlfBhVNKSNHIpFuBgvA6T7iJz1kivp1bend3qC6JLPT
         dlqg==
X-Forwarded-Encrypted: i=1; AFNElJ/AInh8mzzEcj6+NmGt9Qxx61tl9S1CSzCdl5rVEwnnQjjKrCE3Pkza4g7a1pgW5BbXIR3jH9BGTtq/@vger.kernel.org
X-Gm-Message-State: AOJu0YwG3/rVgrv61AzVzApZFSF8H9HyvJORSj9+pi5we8lNzkW5q0J7
	LPmiy3HIg/b/uuTE6elaCRIZNW261VggRpuL1WWTb4gEznmW4MubVH14
X-Gm-Gg: AeBDies9vsSZ4Y5mIndYrNLNp0qXloEpAOn7mNLt3Tysa4AaDGkclv3jWSBpT/NHKko
	7Xt1HsP6iUwvP5vtpnrcdBOtrBGLmfc2BbWxkJDgwFAuy8Ml0bvm6/k+PXTIB4gcaPXQ53FF5ec
	Z6cu1lWVOXOzrkNaA8DbhvccwFO/oI2mxeZU3idJ4bTsCirjLf5/ydCND8VPDRItx6ZfUwn0f++
	IMvDZy8jdH4dl19SJYN+sIUUynRvU8x/O+s5qPDj18am3DVU8sKwMbvwO+tbREzBzy+TrJPzWUE
	JNG5i1Qs2K+y++xQutNu5y4Zzdm8BI0GZtBaEjxD8DAVeX4LbIlyMDiGmkHNDg3vDy2Reo+bFQ8
	cMLxr4ncDoi9/EA+EDA+E3/gMLwH4GVTIO6cHbDYZqf8eHV7xNP897ZnqjSxaaZHjQeIpSo7Bui
	c++WN7ju+eOhRg9PVs5WrInP1Ulp06spEFxBEH8pDidu+ZCJisXoFYS5w=
X-Received: by 2002:a05:600c:8587:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-488fb7880bdmr194237985e9.28.1776803037405;
        Tue, 21 Apr 2026 13:23:57 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:23:55 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v5 0/8] Add support for ZTE zx297520v3
Date: Tue, 21 Apr 2026 23:23:08 +0300
Message-Id: <20260421-send-v5-0-ace038e63515@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKzc52kC/13MQQrCMBCF4auUWRuZhqQYV95DuqjJ2A7YRDISl
 JK7G7t0+T8e3wZCmUng3G2QqbBwii3soQO/THEmxaE1aNQDmn5QQjEo6/FE6CxZ76Bdn5nu/N6
 Z69h6YXml/NnVYn7rH1CMQkW9C6hvzhjyl3md+HH0aYWx1voF2KRO85gAAAA=
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4666;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=o9gYTJKBqIyVOmX80U3TwTTah7IWirGi76Bxb25Nizs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zX/bLsmFSSyvgUtedC0P3fDHA0k5szw2Ags
 j+PbWDI3vSJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKs0w/+JNWC7OaWAdBhMhILzJxa5nrCYgMP1K1
 snJ5xSPPon5do+hhsRwQAXhiKQ201BcXztab9EPAdr3nhzlpIHgQkxljqXZ4sCMgq9rrrVm9G5b
 rgg+hfMV+8UMm0WvqAzWhj0028YC1Ir/Z+tc+l7vpzh3vDpfHPtMuCxxxsElifzwtV4qKLM/xmQ
 eJ8oOUvqwZvFUWPfwS/cCHxhHVISfToavxDtOeCUbyfUhgZALm7Wz+Y4HUFFOCzmiJVJP+StYLl
 ls/ujX2/jR719obDgBqIZ96APs0lA4sGYNcP26AL+YdfmAzfu53ihoBYIRWU1Do8n1CZCpqSefa
 mtWpLDOb4PA6lKSvBOmpySDmFflc1FN2qbNfCXJy/9k01EgFlCDTHyNfyg5FFJIiD18m5gWrkwb
 CFS3ro3m1C4bguclOqsghxLyJcNytfo6FYVtsQ0Bl4EaRwaSI19fgdvlYwqQB23tKrC7gaZLaEV
 msHoNP0miqQr+++XoKSg/v1/12Ul71kmjxTcIRoLmh3BePq6WJve/9LoKidWTj9JPPBtHYy6E13
 cwLv+D7pDEQEDFDQiI3aI/bEuhGKv8rZJXnewg+bW/aZ4BzVmFbkPYtX6ZiocsdzUHwiK8+zz95
 dn3D88vZU+j0Jld4xpGQ+fpXNjv/0DdsmodvoziwUgQ7zdl0v61I=
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

Patch changelog:

v5:
Spelling fixes
Renamed dlink-dwr-932m.dts to zx297520v3-dlink-dwr932m.dts
DT binding indentation fixes
Use a manufacturer 0x8b for the UART, fix patch prefix
Declare all UARTs, remove uart aliases for now
Consistent license declarations. I made every new file except the DT 
binding GPL-2.0-only but I don't particularly mind GPL-2.0-or-later 
either.

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20260416-send-v4-0-e19d02b944ec@gmail.com

---
Stefan Dösinger (8):
      ARM: zte: Add zx297520v3 platform support
      dt-bindings: arm: Add zx297520v3 board binding
      ARM: dts: Add D-Link DWR-932M support
      ARM: zte: Add support for zx29 low level debug
      ARM: dts: Add an armv7 timer for zx297520v3
      amba/serial: amba-pl011: Bring back zx29 UART support
      ARM: dts: Declare UARTs on zx297520v3 boards
      ARM: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/zte/zx297520v3.rst          | 158 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml     |  25 ++++
 MAINTAINERS                                        |   6 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Kconfig.debug                             |  12 ++
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 ++++++++++++++
 arch/arm/configs/zx29_defconfig                    |  89 ++++++++++++
 arch/arm/include/debug/pl01x.S                     |   7 +
 arch/arm/mach-zte/Kconfig                          |  26 ++++
 arch/arm/mach-zte/Makefile                         |   2 +
 arch/arm/mach-zte/zx297520v3.c                     |  19 +++
 drivers/tty/serial/amba-pl011.c                    |  42 ++++++
 16 files changed, 518 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>

