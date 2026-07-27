Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F73DDAEC
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137403; cv=none; b=AcJhkGA6QWckU7YJkwsz/xN8hpr/jlSiEStOuji7MxmHjxjj1K9oieWF+Yr5zDX8kG1CySjb6CNfAmH7XQVKk0yhdLjjDj5cO8dFqmsbK6KtchJXqvYHZjC8HUiv7jq1bFoKi071dtMpzEpkqlkuBxKW/e1140XOxE+LMaKZZoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137403; c=relaxed/simple;
	bh=qBravbu/htRs67BnjjLIE0Ahs0nULbLZI/MpDg+DVfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IdfGCUrZhYw9BMdfMrMUcbzhro4ibUrfTLpF7YONHKryutrr5CvHmKJeNnTKnhVagifxM+w8VtZDHXhli0ioeoktqCnEZxrm5afV2F/XdhXYnnGNtvFjEDTDXrtKxld9f17OgiVznOXX0pHrhnmcCvNwxmvCf5EhOtrOYYE64V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=J3F6AQXj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="J3F6AQXj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15364045e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785137400; x=1785742200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=J3F6AQXjn0uZuYhFqQGRx4AaRKbDOQOcGup7A23nMxOIKkAzLw3tkO3Sxi5GNmdEyl
         seZhvfuyjOLKTjdVCqUn14Bn0ZeohmQ1Akmds8T8nWysUbEYLIcbgda1E+5E2LgH2jTs
         HUNkoF3qxlSYq7uLvNjilSl5oj1oWJjfWexWTs1Y/rHZTO82knn/Y30/jnz8BqDR4Ixo
         vZT1aDyLDivPvIN8xUdSY16TZE5POhtTLAp1o1psnXFeF3Ge1ucZMHF/OaInIVKaq+rP
         GqFYAG+Zc7eqLC4orIwsPzWTTCFvgd/CNX2/FClADdSwcBWzn2PCV7O39pQD6Y2UrZ1U
         dEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137400; x=1785742200;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAmFeRSZbFo4XUxpmLajRJiEjxvL2omNRIxy6wYxlZk=;
        b=Mi5E10hyDVbvCQPqjVqvod+eppc7oBT26zzvd6zbEVn0IEfRfuhbhIVxnurl3cgzU2
         bN46AVRhRGZOKQ6ORZ1CCFnsG8lgjo49429fJ0NrHM3elk5AVDF5HVcs2hLkMoaoMbmK
         smRnBYSKghQ0D0nJi2n4ketUND0OpnSRNGvQaqG0b8KcGpgi3Jdm3nTq9mI86/zLLgQI
         9nvU720MDNrdFNUl31B+gvOrbz45DA19ZDIJ8llmb+RMd9LXvKDkNtbfRQyKGunkEF7S
         vVNtKESoOMOvew5poZbw4x3bxVmIR835XEkWbUuDpIkk5l87m8Z11s4JyH59RY1UfuZ2
         4DLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3hbW/wiZC51pqfduomfo4i1TQO7R7xwqkVPAw/i7/y0EGem6VUo31ksjEUBzJrQZIX2t+/oW07Iwa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3T1lQRjuZgkwb5OydVUgHos5f2awlvY3zoeV+TrxRi0OR4k8d
	bpmSGjsyHaEuRv4LHVLUkqravrfehyKBOYrrKKVtQYIRZ3NNgfTiNnw4QGzfla9wx0o=
X-Gm-Gg: AR+sD13EC7l6MIdBOjppt3HILzExl3qeMWZyCHi7wFSNbfpR1AEXugaK0zpTpbMwSzM
	SSwlIr9k27YSOIE1c/7L6klg4n+ksS/CPCsF5lfHZghNg1+EOveHfTRjG3we8xqUYhOZWgx7CCR
	fAWiqUQVGI+iLjL5wWEGFIYf5bO7vwMk+6HkxVs2qyf7aWzN89In1/NR1fEIGwnMzZ11pUh6a7o
	PT57YyXyx6AK9mM3hZcOR2fqnY2A+fnC3cUZW2vfnQsWUIE5dF4t8+ERNh99h9PM3KVYchX4oSj
	9P9EBokPOg+mX67Pl4w3rCfJXvaVQWW7vT3EP3+3WZwpfNdv4SgsGskZ470HWvO4SJ9c6F+uH/6
	65dRI3jWGJV2iUF6Dk37fCrX/GtPSqeXSLxTFKV3YbTnTsK1JTu815/D6UGmX+R2imaP4340cw6
	3p1i+c6iZ3s2S4nczUFp6jap746xixnyxe6PQmHObcHZeA3JxMfb8oI+CYCn4kVzXIcn3Wp+Yn9
	STgRwOZLJPyFBwX1YPFXGEFgJX8
X-Received: by 2002:a05:600c:45d5:b0:495:4cb6:71cc with SMTP id 5b1f17b1804b1-496b570fc0cmr84095365e9.5.1785137399785;
        Mon, 27 Jul 2026 00:29:59 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm201823685e9.6.2026.07.27.00.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:29:59 -0700 (PDT)
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
Subject: [PATCH v3 0/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
Date: Mon, 27 Jul 2026 09:27:39 +0200
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
