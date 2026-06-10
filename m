Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115DC3D79FB
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090934; cv=none; b=ivAzGzpFm4KLKUwxjJU07M7svYibH7adMn0SnXXDuTXoYeY75EWKsJh08VDiIQ975S/0hhy8YBe3NE+7TUZY1ef8iMQkkOWThpic0UUXB5g8dXBpQidm9BCmncjsaHMYCESsUOfvB7ggdXfbQlSldULZMVPuEL4P6RFCNCICNfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090934; c=relaxed/simple;
	bh=CQocN7n6EL1m7QmHcuY9oAbnmAD3Rs3OWnENrXQGuEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H95XK3ER7ngTcK7zo0BnuyoqnOYkLCdtFRZwcSIsAPDCs9akqU73wab7Bx7idVLmCDS0K9jwjflNFt5eZXXBr2fcNG31WmoTCPS51W4ZguSihoJfUJjaFFmcmY63FcYshPfKBR9f5+cTS2C5G4+1hrhGnAfyQIlBn84qiAtqVOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cECNW5yM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cECNW5yM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso4246776a91.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090932; x=1781695732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7CoPC71NMmToN6IqHyZ2J7Av/IeasabCIzNKilALHc=;
        b=cECNW5yMf7yavulApIaQCZjJKbLYbSoWGlAGhfFOK7qYKe3Pq1ezpN/2NBiMpaCkiy
         F+GTfxC63JaqyoqmMLqc+7LQV30DRgyIaM6bo2AB4Fx6tYKXymK0k2SiU2p0B6LtI/RS
         QtMhFFW4YdFx158MAa8mCY1xuMF2PkDv0qNg3yyywpfhJCWA/F/rOKsQpeduy7lGe2f2
         FVmInokNalp/O9MmrNsk0wDnS2cGhkZUfKrJZDb47jg+XnjXIebjCtDfS7aWMLYlTSS4
         S02bOfTaou8Vum3a3hLDyqABgpL5O2spHxM/5ytRbrSymQkhpVfC+9rrvA+jcjT0xpER
         5cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090932; x=1781695732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7CoPC71NMmToN6IqHyZ2J7Av/IeasabCIzNKilALHc=;
        b=By/vjyVYmV7Z4T5bQfaCmBHBClTKET5uVQIZmkuOntM4bjQdNuDo6B9PaFX1DOAOlG
         pGxJKrXfcexzKJlgWt6OYme8fqYu+1q7PN3Tz4YO/MwloFFLiwjIzCSq53CwG8VgxBJ2
         WDjzLC5aJnvoLiz5l4A5GNTtDdw+wydmm73k55+mhSrFZYHSV0csNLZAi/HHRbJCzhzW
         AA6Zl4mFMzfuck9rXCMoqVDJXJqFlk4xaWwiFwtEgDiMePmtejbtCTwHWbTqLFRPDONa
         4keByb24T/KtZPpx89ZG0cAaAyH59wHCc4aXvU3XN73/Qhl+eR0fbaRefccRkPz8lQdz
         wOqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9o2WSltdZ07BcErDvC6+2TkemNA+eysFENlPOtn1rEsncjFSBPFKM2dh9s1MTRvytyN72fXya4qWbj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Q96bWKpoiIrjhjUd1c3CwcoTs3O4w545t0u57KCjvdqsN1rY
	1h/xigwFcLGN6IJAlHqzAXo9hB2/a+DlpM4UDwbHB3bLB0FDEvaSvaRZ
X-Gm-Gg: Acq92OFbjDY9KKJuKsaFn6xR8LWndmUD4c0ya9TVkeEQnz2RN5Ure4roEaRhB1R9onM
	4KbsNzvl7MHeZ9mI7y8My2o3m3XZLc2R1n2910Cag+0fbwkjwNINPIZz38JqECVJCI8T/qnV8T1
	Lo1Vxn5ptx87GtH+739utV+LMaODO367JmPuIUz1cw4tFYfAPAFP+E0ndTM5T53wi9jaPZAhj2+
	u0+T6ww0yTWqOl1eBEUp4TIHAwYRt12AeHE4RR5aFxTmw1Ae+2h6uvWTCuV7voIZxOzvvINIFwv
	s2v/qs8MZujpXJ3U7AY0M97zVuH3a+kXhcy2Bqp6Bd4SyK3xbdUgGtNFEuhxg+1MZLV4+lZutrK
	6eMRdKhI8TyLuIXNOWa+Gfoac0iswmZQ0hO0a0QI7+CHg2ZgsLQu9psCwjfpSADRs74gRFatSO9
	HuwEVmgQ2rGygc6WFhoVPWgMMOkgorH9+bSZLbXjfZooEAse2Wh2WbdA==
X-Received: by 2002:a17:90b:2741:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-370f0b55ebbmr27067763a91.22.1781090932289;
        Wed, 10 Jun 2026 04:28:52 -0700 (PDT)
Received: from hc-pb-01.realtek.com ([123.51.179.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376460ee14fsm2027651a91.1.2026.06.10.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:28:51 -0700 (PDT)
From: Jason Li <jason.lee651024@gmail.com>
X-Google-Original-From: Jason Li <jason.li@cortina-access.com>
To: jason.li@cortina-access.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] tty: serial: Add Cortina-Access UART driver and platform support
Date: Wed, 10 Jun 2026 19:28:17 +0800
Message-Id: <20260610112821.3030099-1-jason.li@cortina-access.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 adds the DT binding schema for the UART controller and the
top-level ARM board binding document for the Cortina-Access SoC family,
along with the vendor prefix.

Patch 2 introduces the serial driver (serial_cortina-access.c).  The
UART IP has a simple FIFO-based design with a single interrupt line.
The driver uses uart_port_tx() for TX, handles earlycon initialisation
when the bootloader leaves the UART disabled, and provides a TX FIFO
kick-start in start_tx() to work around edge-triggered interrupt
behaviour.  Clock frequency is obtained exclusively via the clk
framework.

Patch 3 adds the device tree sources for the CA8289 SoC and its
engineering board, covering the minimal hardware description needed to
boot a kernel with an INITRD rootfs.

Tested on CA8289 engineering board; console and earlycon both verified
at 115200 baud.

Any feedback or comments are highly appreciated.

Jason Li (3):
  dt-bindings: serial: Add binding for Cortina-Access UART
  tty: serial: Add UART driver for Cortina-Access platform
  arm64: dts: cortina-access: Add DTS for CA8289 SoC and Venus board

 .../bindings/arm/cortina-access.yaml          |  29 +
 .../serial/cortina-access,serial.yaml         |  46 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  14 +
 arch/arm64/Kconfig.platforms                  |  10 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cortina-access/Makefile   |   2 +
 .../dts/cortina-access/ca8289-engboard.dts    |  31 +
 .../boot/dts/cortina-access/ca8289-soc.dtsi   | 118 +++
 drivers/tty/serial/Kconfig                    |  21 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/serial_cortina-access.c    | 755 ++++++++++++++++++
 12 files changed, 1030 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cortina-access.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
 create mode 100644 arch/arm64/boot/dts/cortina-access/Makefile
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
 create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
 create mode 100644 drivers/tty/serial/serial_cortina-access.c

-- 
2.39.5

