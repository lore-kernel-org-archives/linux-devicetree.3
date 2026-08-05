Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936763E51F5
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917958; cv=none; b=WQT+8bjM1rTr+DYXh+MbiEB4GlPwIgyNKmWQHBMeSAC+sMDc1tvTXFyHiKbPZa2ygQmnQtWzjbBAunvYMULEYqKzpi6TpzWCu+IdCKrH/1IZ1esjlg33dDAOgYQb25orgwwdkXi5eoAlXXaSNTzkITOEOC5s+8IggBiJbPyMNmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917958; c=relaxed/simple;
	bh=qBravbu/htRs67BnjjLIE0Ahs0nULbLZI/MpDg+DVfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=glj7jWFsRbMBX51caDysTFasLMy0cGH9ZGH2/ULOqX32rmRBHvJ1myfwlmIe0lKd76MwEx+dFLZ9usTis+6pJHxOvtUenNfHSi8mIjUM6NAHP3Vq4r/lnNp9t79rgKf/f/1Eb0G6lT9h0nVbMXwNMX5jB6zFk0RvEuOQRbtevWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=GVxHZ7VM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="GVxHZ7VM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-496b7622a83so5203095e9.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785917953; x=1786522753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=GVxHZ7VMOuK3Ph8lHO5hObF23QrnlXcgFj7Jfc/50Uby9jvRBTGMeQXe7onrJbNJCE
         JF/kXiglxA4/PX0fX+U5Q+LPuRoKpP8AiNPSLmdHqdFTtr4cgIx6PGkf5/JCfcjkWEMs
         bmo+CiWQq6npXWLkLHl9Vp2QEMen6LrpUtAMNoWV168n/ovCpJfPijn0SSF2Vl27iA0w
         0GmGEGp5xX/HhfXXVelDjvC3ijssBSVIU+k4Hou5mbMbwSaDlTS2B6+IfbAD4K+NhH5V
         R/lC/kLXdpgKp54BCCadg0aIGqM5pBbriqubfNUxiZD8bwW4V2AngvYzZ33BpItyEq6/
         qM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917953; x=1786522753;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=iqsl9pm5TI8C0plZBHOwwOZCKNB1AIXArCPvwiSRIdtqO0Jn4pwnBz91ZMfL7u0PN5
         sAT0cBpcW079UIre3Vf7D+uRuUQlx2iRZxnsf5MNsccgyn/Actl4DnkkVjJkQhfQ5oAS
         WxgRsLbFtAtvJxG3/AXkUl1YMv9AMoLwru1gN80bLfJUbXC0/yspdD3V/n3ViCQWTTWL
         PHYmUOu4qX5u4GK0TTTklv/xatribQacKanfsswtVS6TkAweKwjSciHt5eyVzCfb2cJ3
         NKd2wvpZlBrYilfxoiaLiHDqCXr7Dr4DUpBQso/HTTPn2MmNSGzNldUlgEEA1WhpTFRB
         y8+g==
X-Forwarded-Encrypted: i=1; AHgh+RrdsTYMZOlaYc/kOE8Ng3AzM9hsZFJMTB0suGpxxkuwnEM85XPZGdHn0H9HRKsf5cMjf6ONASaZGbvs@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVGzqtHQp8fpDPilDc56oGMVWFKz7Jn96juks7Z0Tri25X1cc
	ohAWWJ97bnsjxfDNAkrxmHBrZO/VOsxc2yWsyQ2naFmdeHNO43R2JpH0dey9a9Caa7k=
X-Gm-Gg: AR+sD12CZTjKfU28Q0rUrLNQ5dCO18t8+kdrysV5/rfi+vHMFCY3PmlQxo6GCRwW+E3
	kUg4QslACU21osm7xT0lqTqJeBzU/VoTVWXvVvum4e3lsldxtsHdlHtttvWSOrNpLjR81AN94OZ
	zWwBhT6fLZTr/fB+dcLIBkKmWP2bTAXj6sM3vU8glQObh2etqbrvkQseo7rKT+hV9IpTR8tmk/d
	3iPUl3XBcTcJ2ge39AzkXHPWJioM2Q8B7VRLlB8vs55BTrFCrbAt7XgAaBsW0PW2GE+4W72K0rR
	YMAbZIbdkRSGGDf+yA1vEgTM1pF1IpBm/GchX+oJ21tx1L588h/RZJHt4BRlVdsyuEX1rJQ7F3x
	tPIaH0F5iIRkYsHSCED7sUWp6xo2qtU69ZwpkWcvi2DleCC9pE8MHkQk86TbBthAe/XxTnLS6uZ
	vn/OJfqW/SDixtOqRqkzA1DGUfqHcXn4Of5gj8YPiaGyL61gDD9jr7UQ1xlblGYyxVMvSXQu15h
	uHjzklTjdRaxfVijBbYAAns/bprN0Wrfs6ryeG5k5b19Vvh94vLgqmtWAKLYwVFRW0OAggvMwXn
X-Received: by 2002:a05:600c:474a:b0:495:7888:281c with SMTP id 5b1f17b1804b1-4994e6d4a13mr49305745e9.0.1785917952680;
        Wed, 05 Aug 2026 01:19:12 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e0356d4sm74745695e9.10.2026.08.05.01.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:19:12 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: jammy_huang@aspeedtech.com,
	yc_hsieh@aspeedtech.com,
	openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 0/2 RESEND] soc: aspeed: ipmi: add KCS Channel 4 over PCIe
Date: Wed,  5 Aug 2026 10:18:59 +0200
Message-ID: <cover.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID: <20260805081859.BMonsZNvpVpzv-lER5z3KXf-oQNpGJ8o5a-wTWoT4JQ@z>

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

Add pcie_kcs4 to existing LPC bus in aspeed-g6.dtsi.
Modify kcs_bmc_aspeed driver to detect the PCIe over LPC channel.

In the driver, this PCIe over LPC channel will be detected as Channel 5.
In the datasheet this is defined as Channel 4 over PCIe.

The Channel 4 name is still referenced in the offsets macros.

The host need a driver to activate the MSI interrupts with the PCIe BMC
Device.

Tests:
With the patch [1] adding PCIe BMC device for Virtual UART, the MSI
interrupts are correctly setups. The Host driver is build and side
loaded on the host. The ipmi_si driver on the host is loaded manually
with the KCS address given by hand. 'ipmitool mc info' is run to confirm
it's working.

Tested on : Asus IPMI Expansion Card, AST2600.
```
$ insmod aspeed-host-bmc-dev.ko
$ lspci -vvv -d 1a03:2402
02:01.0 Unassigned class [ff00]: ASPEED Technology, Inc. Device 2402
	Subsystem: ASPEED Technology, Inc. Device 2402
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 154
	IOMMU group: 12
	Region 0: Memory at 82080000 (32-bit, non-prefetchable) [size=4K]
	Region 1: Memory at 82040000 (32-bit, non-prefetchable) [size=256K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable+ Count=32/32 Maskable- 64bit+
		Address: 00000000fee00818  Data: 0000
	Kernel driver in use: aspeed-host-bmc-dev

$ modprobe ipmi_si type=kcs addrs=0x82040E88 regspacings=4 regsizes=1 regshifts=0

$ ipmitool mc info
Device ID                 : 32
Device Revision           : 1
Firmware Revision         : 26.04
IPMI Version              : 2.0
Manufacturer ID           : 2623
Manufacturer Name         : ASUSTek Computer Inc.
...
```

Changes since v2 [2]:
 - Put pcie_kcs4 node in ascending address order.
 - Add missing "case PCIE_LPC_ODR4" in aspeed_kcs_outb.

An RFC [3] is in discussion for implementing multiple LPC controller support
in kcs_bmc_aspeed. This would change the implementation of the pcie_lpc.
This series adds the pcie_kcs4 to have devices like the Asus IPMI Expansion Card
use it, before waiting to have full PCIe LPC support.

[1] https://lore.kernel.org/linux-aspeed/51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com/
[2] https://lore.kernel.org/linux-aspeed/cover.1784732161.git.gregoire.layet@9elements.com/
[3] https://lkml.org/lkml/2026/7/23/429

Grégoire Layet (2):
  ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
  ARM: dts: aspeed-g6: add pcie-kcs4

 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |  8 +++++
 drivers/char/ipmi/kcs_bmc_aspeed.c      | 41 +++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 2 deletions(-)


base-commit: 03f906d8f5541e8bb741035981304feceed5993d
--
2.54.0
