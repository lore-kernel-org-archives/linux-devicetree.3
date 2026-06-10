Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F40F3E1223
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090939; cv=none; b=aaUuz4rPc5HBvQKQufzrajAVpdV892zu8Wh/2d1uJuksLcpgwutW4Xpx1qaRfIgYPrlUkYMpXAcak88O+4bFL+qA+Ztd6SUAOry1R63uY9aGeJZb1y15ljOtL+h5KiBg+ykDIHWRqetM31PG6mZ9LWG668jeBa5Vdk3VILEXvjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090939; c=relaxed/simple;
	bh=LgdbPNP0ihMSKvD35dVdCR1EjeRMx3oEv6r7a45UVcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LaOMg6WvcrwoffsQ6NSicbBtP+Fpn0HIFKQxJwUlofQwbGZz3RchM/MqbYdwKd2LfuWk6pcnjNRj7f7qezrjq8J/KfJG5r8+cUnvpB383cjx1CxRET/09k+CqEOflQiGK+W0gpY5DWEhUdrGrLQz4L9Q1UO6KNFxDg9vlduLBl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4Bt1Gsq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4Bt1Gsq"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so3573509a91.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781090937; x=1781695737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwi1GK1b6kFMqMMmZP+3rXcQIfq6dBSGPyXYvtvQ7e8=;
        b=M4Bt1GsqxV5bcKq8mCun5wtJu+s4wf4VWTifu7rkph8KKvfxxpSKC4xdYo1R89CR+9
         aYDxxUUkak/HSrWBthqT7ptYzlXsQRS+K8azlEQrhzigatFb6KCyexHsAiv2bYZs9tOH
         k6XBdoNS220pjbQ9Db4SCELEI6fIJ/g/cQsbHTTixbKl3iRVCpvgd3LFUAb3qXISLTgX
         7STL2mJ62KjRsem0RxyD71BmUFPglpjauLleRpYvpsMvPgh4O3HMV5OP6fO1tDZvBWk0
         gqbzePm1cvFP8HGiI9F8ZPXVpwXKkvR9Hx7gqmktkgbGbgkOdOYUHpR8m/Cipu3oVqTC
         CCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090937; x=1781695737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwi1GK1b6kFMqMMmZP+3rXcQIfq6dBSGPyXYvtvQ7e8=;
        b=YKVPn3xxrviGgmLzVxRU+D8/dl6eyFv9KOwTmWc/1M1MTIvnuaABm8W1iGOGz/OccW
         dVzcW47r/Rbgy2Bjyal/WZqXA9Wa6FY5Olo4KV7UPaYes+nWYnMMykaWT8Q3drNbpFix
         f5M0FLlYew2q/3P1XM+awP8VVTcHW17p8ERHoGULqdGOxwxzI4c1nZ3aKBAEUJYDMqvq
         7KGFYQmfpDjIOvpRlPe2ktNrygCXEODlbzuqyRtf2LjryZnsDgwD72NPmQdxTjI8u0s+
         NfAdCCz6LSw3BFcI6SUic8yFfi5DBgVZINTVKBenWqZl6NRCbLn+pUpw7L2Vye2mOxav
         pJGA==
X-Forwarded-Encrypted: i=1; AFNElJ8yaYq2rdfouMopTqlwtBoiRgAqkn+vUvdnZpJgH31K8yopX7k0JH6NfBMUhQFYC7UmPBPQQYuewR0w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7VHWC41LV9sPJaY5C49rRdoa6YkLGzvdG89xM8Eb4lK74Rj/Z
	jw+zWGgmfsy2ouySTcgVpdvpXt5o+jmHEihvC+UmveTwXEDOSm62DwWI
X-Gm-Gg: Acq92OGVIGBKrGmY4RypiM0PMo1WAVKsXFgu0f0PNgqh3tJ0wEY+JlLIdvadPl1lMsl
	JfN3xqXxZ1p+lHxhxqYSgbgLDuvAZGT+FGpNpCBNX8SFWIrkDPS8MuhP8ZOtSu417i6esJs5dXD
	stwrkuBXXTL5btzDmBPmDy+ap0ttPNgeXFtbXpNn7/RGshrmk4RyiSmSeU+Ce+LfpIenRiND7p5
	Vk5Tcmd0XJPbfnRQyRTmaQzMemwwDdyGf7hRWHE9bxOIuSMIaJOGOtpmyjCIrjti8v2NfAyPzh2
	zrW5RZxlgzsDalpZRg9igea+IaM8jknDYB+rfGjvgC3AUlOgpuPL7lmSa/qdpwEvgdPvJbNvzeR
	OYiS7fj5B1QHpiiMI73TbWHEPZBulM9Pndv25Ajkn3OX9H5TYZsckP3vYcRfsEGmtUoIavqAVXa
	kiU+7/C48d2KIrwDANuhBq3xoekk6KHubvlJZxAYxmpY/F79dB/c7bxA==
X-Received: by 2002:a17:90b:580e:b0:36c:e254:4db with SMTP id 98e67ed59e1d1-370ee544633mr25082162a91.6.1781090937473;
        Wed, 10 Jun 2026 04:28:57 -0700 (PDT)
Received: from hc-pb-01.realtek.com ([123.51.179.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376460ee14fsm2027651a91.1.2026.06.10.04.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:28:57 -0700 (PDT)
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
Date: Wed, 10 Jun 2026 19:28:18 +0800
Message-Id: <20260610112821.3030099-2-jason.li@cortina-access.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260610112821.3030099-1-jason.li@cortina-access.com>
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Linux kernel support for the UART controller integrated
in Cortina-Access SoCs, with CA8289 (Venus) as the first supported device.

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

