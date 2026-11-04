Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803985;
	b=p4SvD5Aww3K/VdmkT/JGYkZFgoKbGnbQ7kHRCI2G9s0f8R6Zk/qJBt5WByyg/v31PrEm
	 N5g5T68theEJb5CAR0wvfee+ua3PjZkyuU21+nR2pe5Bi/jqK3bW2hKfgu0TNQ68ef3N6
	 hudKtUCIIqPLNtJ6wM0OLaBc1CGV/h0t+MLB9fOzzpsHUDZ6hJ1hONY1Jqmes3Am/MD35
	 HDuzdeYC1KTyRisb7G9OO2XJTzMGIq9/YbnyW5LWn8RR+hveUk+G6KgpvjAATIAhsvmmi
	 SCb9JdGEI5eDfLbmskLoikVzQVajrdXewj8szxl2fZCd+u+8eyEJwBTAist84tQp8HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
	b=RBafF3Yp9nui/aj5fh0Nx2KMIo96xwSISgOo/JjMeHmtDBaZRokDaNKeY0azz3nkXXno
	 /v8q9r4FnsqkNiyYI4FP2Pwm8xaML0mdvDuMpayaWGAg35REuzmNBqWsGNtDtYFgfWaHy
	 pUprQXICt4VHMTerOrbwWqqzOnc+PVcYyjxofzD+I3t2F1tHsGQirhUPXPzkZINRHFOKC
	 UmakaFmN+STuBL0J6mkc/K6hNxmaBkg9CMl2tt2dqDV6MgiQT3ydFYZeOyh4hSVtDk39E
	 u/B/lCS5gmqGRVeNaqDcXjsbdsmx+5DuPDibMgfQuhRIKCpzHY/Y7LqG/a8OhlQhetA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TOISeKFE;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FBD606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24FBD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TOISeKFE
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b309147589so8323777b3.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793803983; x=1794408783; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=TOISeKFEmFP1tatdWcqA8TBRZWlRhRt+52z+SIO/yPZrCiNrJHjQW2+FI1ttMCcS6B
         IqBmkeWvatk5SW/BO2DCVbVmNcC6NbAXREZusg91mCrM5uqjeie+PIGahTQJnj/q7xhm
         Al9CIY4fBaM3yn32KOzRC1qkMW+XMGtZgVhXeYUeagX1luvFS5ksP0KUiCBuwD5ZMbyP
         wEniWWY5/LuacR1nrJSOjT7Oxng3a4ElC6RX4KjgzAvxkHGTMYH0WNCaX+T9hHXEu7nS
         PBPF8gptC8vgmTXSnKlPZ5SwUolrmioXCK/gYmD+QJ9F6bPle8oWamIu65ueap3FStXz
         9LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803983; x=1794408783;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OtVIvE0LCCTII+h8nC0irSrmpYrzDs5fgAChS99QN9w=;
        b=21qAnSu2sb2CO6YHrZpyeb02VuzqiSqOprjbz5NXrQRfIR/VRaEX5CGqyDpcTTSn8T
         ASmWWYIJmpkk2aGW/0KJheZNn6PRda7iRfo34KRw4IUr5Mh0KEx3Bu5XYsR+6gYZDNnU
         LyBZQhDodK9gOgQljTr7QB3uy6j5rk2OBwPJosHJgGnJLlL9F07qChp9b+bCFkSUlSVP
         JSSEIDXcJe4+1z5uUXi8g5C81deFpAnE1ar9Miv6MZeAGN9p50qMqQyOSdPQ9Qrhi4GN
         eLXXKXrocBXNLgZ69CfCPNhQTibhvHb+s8aHkCq3Bc/5LskQeK+ew4BXbMzxGSc9QGNr
         1V3g==
X-Forwarded-Encrypted: i=1; AKwUvBxKARFZjwVY9alM1+ea3vSmkFSgGkZvzy1QAoTy24scIbD7onuDDUjaWUN3Adfeu9tvvDIt1Uhps2n5@vger.kernel.org
X-Gm-Message-State: APuU4Z9V4j19xWd+qObmIb+VtwsEGftSBJW+s0vq1DwAsEOrDSPHsiHH
	2A3sNH8l2fHllcVEeCqu0yDfC/FaEPv47d75hUZgc9W4OoULMV73rDhgaSujc2fttYU=
X-Gm-Gg: AYBFou2BPf7le+r9Lz72G0HFodlFYXViycl2ixk2QilbbhRb6EkkXohRZwDuw4BOm4O
	CbtHNzVgUglHbCIapGFduEMzXjw+BoQY8BnJiwRYSP1uYcH2+F+11n5ZLuSVYKn6lg23Izn3Kjm
	kdL8lMBmCIE4P5bj+dxZBgYF2ffTZzDPvgdPgy4ay1To0aew83fcY6dvOYlVPyTF0bxBxqMPrXD
	aStjhxRAH4KwlndT+Hz2KjI2V5pt+zQ4MLxPmMjM69kryXPWxmR2Pq5NaXUX8gXBDD1Y2YR4qLc
	LT/R3yMywa6+BZ7XHWoPKQzMJzjPjmzdHU0vbgRGeLJnfa5TXSqhDToqiWLqNtLWAwZB6TtvUiu
	tIB21930lO6WpAxAswjDP8GKheCqEzQiC6jCrliCp1XrWRJu7HbuMbk1eMEacB+4aUSAjX7ioQo
	UNbmDCAoplHKwq9wobYkjzzDH4FG3M8BjkbPXRzIIhHhxhVJ7tmfXtpGvmwy8n2YbyjR9BYFCwF
	xIUA+F6gCs8MThk1Y8iUXYyF5VjdYWati7IqNmqP0Q4CZ4Ykwg+lWQ6AoKs0RGiKQtyd5Gb1w4S
	7avaIjJ0F1j+v0uTD1nb4ouqpULKXfjqMpSdGeanDnc0E3QG4We7hG1+cjkXfnD+k77s
X-Received: by 2002:a05:690e:80c:10b0:67a:7b76:a5b2 with SMTP id 956f58d0204a3-67ba50235b4mr7893297d50.99.1793803983078;
        Wed, 04 Nov 2026 06:53:03 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::33ca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm1569080d50.10.2026.11.04.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:53:01 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Subject: [PATCH v2 0/2] riscv: dts: sophgo: add cv1800b ethernet support
 overlay
Date: Wed, 04 Nov 2026 11:52:32 -0300
Message-Id: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr2Jm7ZgWiqAr72FYtGWQUaCmhUZCu
 LuAB3D5kvffnyGQZwpwPczgKXJg16+QHA9gG90/CLlaGRKRnKUQEjtuXxGr0SENDbpIvtUT2jr
 P00Kpi1YC1u3bU82fvXsvfxxG8yQ7bLHNaDgMzk/7cZSb9+8jSpSYF8ZKlak6zczN6Kll4+lkX
 QflsixfiH8Pfc8AAAA=
X-Change-ID: 20261001-milkv-duo-eth-overlay-cf7738449a40
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

Hi,

The first version of this patch added a board specific ethernet overlay
for the Milk-V Duo. During the review it was pointed out that the Milk-V
Duo 256M already has an identical overlay, because both boards just need
gmac0 and the mdio multiplexer from cv180x.dtsi to be enabled. Instead of
adding one overlay per board, this series makes that overlay shared.

1/2 renames sg2002-milkv-duo256m-eth.dtso to cv18xx-eth.dtso. Only the
file name and its comment change, and the composed DTB for the Milk-V Duo
256M keeps the sg2002-milkv-duo256m-eth.dtb name.

2/2 composes the same overlay with the Milk-V Duo DTB, adding
cv1800b-milkv-duo-eth.dtb.

Changes in v2:
- Use a single shared cv18xx-eth.dtso instead of a board specific overlay.
- Rebase on v7.4-rc1.
- Link to v1: https://patch.msgid.link/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com

Testing on a Milk-V Duo (CV1800B) with its IO base board, booting the
Milk-V Duo DTB with the ethernet overlay applied by U-Boot:

U-Boot 2026.10-00013-g3c998cf93c4f (Nov 04 2026 - 11:35:44 -0300)milkv_duo

DRAM:  63.3 MiB
Core:  22 devices, 15 uclasses, devicetree: separate
MMC:   mmc@4310000: 0
Loading Environment from FAT... OK
In:    serial@4140000
Out:   serial@4140000
Err:   serial@4140000
Net:   eth0: ethernet@4070000
Hit any key to stop autoboot: 0
** Booting bootflow 'mmc@4310000.bootdev.part_1' with extlinux
1:	Duo-OS (Milk-V Duo Boards Distro)
Retrieving file: /Image.gz
append: root=/dev/mmcblk0p2 ro rootwait console=ttyS0,115200 earlycon=sbi
Retrieving file: /cv1800b-milkv-duo.dtb
Retrieving file: /cv18xx-eth.dtbo
Retrieving file: /cv1800b-milkv-duo-led-blink.dtbo
   Uncompressing Kernel Image to 0

   Booting using the fdt blob at 0x82200000
Working FDT set to 82200000
   Loading Device Tree to 000000008355e000, end 0000000083566fff ... OK
Working FDT set to 8355e000

Starting kernel ...

[...]

root@milkv-duo:~# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    link/ether 0a:6e:82:b5:51:74 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.68/24 brd 192.168.0.255 scope global eth0
       valid_lft forever preferred_lft forever
root@milkv-duo:~# dmesg | grep stmmaceth
[    0.500755] stmmaceth 4070000.ethernet: IRQ eth_wake_irq not found
[    0.500827] stmmaceth 4070000.ethernet: IRQ sfty not found
[    0.501156] stmmaceth 4070000.ethernet: Hash table entries set to unexpected value 0
[    0.524693] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    0.524795] stmmaceth 4070000.ethernet: 	DWMAC1000
[    0.524819] stmmaceth 4070000.ethernet: DMA HW capability register supported
[    0.524838] stmmaceth 4070000.ethernet: Active PHY interface: RMII (4)
[    0.524860] stmmaceth 4070000.ethernet: RX Checksum Offload Engine supported
[    0.524878] stmmaceth 4070000.ethernet: COE Type 2
[    0.524896] stmmaceth 4070000.ethernet: TX Checksum insertion supported
[    0.524916] stmmaceth 4070000.ethernet: Normal descriptors
[    0.524935] stmmaceth 4070000.ethernet: Ring mode enabled
[    0.524952] stmmaceth 4070000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    0.525082] stmmaceth 4070000.ethernet: device MAC address 0a:6e:82:b5:51:74
[   12.726604] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   12.752406] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   12.792299] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   12.826448] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   12.826535] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[   14.892433] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hiago De Franco (2):
      riscv: dts: sophgo: make sg2002-milkv-duo256m-eth overlay generic
      riscv: dts: sophgo: add Milk-V Duo ethernet DTB

 arch/riscv/boot/dts/sophgo/Makefile                                 | 6 ++++--
 .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261001-milkv-duo-eth-overlay-cf7738449a40

Best regards,
--  
Hiago

