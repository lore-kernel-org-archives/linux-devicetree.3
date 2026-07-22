Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7350D353A6C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733267; cv=none; b=dqpAE7ghrYdF962s29sgWyYAynQhcSEHxBi4NNojxIOjwxR+WKKxzAIrUMzYJYr5jFjETlSPtWB8MPLT4hCqPpVbQolx1+Rc3VU+/FiTqOYYMSz2ZnuWZN/FbjCfA4PRdSXTZ7qXHosu4Y1m/dPUx0UbhZAAbAxy30lgs1oIwjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733267; c=relaxed/simple;
	bh=fsGUebfowB1sTZKYCDAbgZgTeZ4i+kpvpIryDM9eKks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c4ght4fXYvdQMvm44SdFawUTWUS9xp9ObR2lTNf7FMpGTVMuKNWZ3EvqcwkHGgJa/a+ZaCB4dKJhQZt8TYbjX+SLRlt79YRaQ3edhtp7Zng6caG+U5tG0UWkActKsj72s37IhobLTsYU+jNvsWuvPBwQMWmQ2ruQkErRzX0QoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=VL005d4B; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="VL005d4B"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f633e6058so5131027f8f.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784733263; x=1785338063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIC+L9SRUgouwms6wXkTg2Wb9d2ocgYi1ZK4mto5XS0=;
        b=VL005d4BTEl9YySky2lSegDogaFnT60BlBsJAYMba5GOb2DJNNljobS/ArrQCnG3il
         7i11La+3y3Vk3cKrg6pNJb1VCJd/Z0OlYTZOSh15XpQB0st2eZhuk/bm+5Ey9MgwwPL4
         i7b3FHBvb4YIBPOewL/b3YqfKuOB70HaxOTj82QrdB/SN14c/Kqj3TtBrC5egvJMbuRa
         24+NfED1dYnAEXNclJ1vet81B6iFX9IZRf8Jl4FuBQPVXiw6obuw1cBUprv80CSu+S/P
         hs4YLGnCkLQAjqJ6M+vEbkOOh5wdQewTJ/Br1hDBIEkM71s3VyLrfBBXU9GODPfDwWsp
         JRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733263; x=1785338063;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iIC+L9SRUgouwms6wXkTg2Wb9d2ocgYi1ZK4mto5XS0=;
        b=UFy9GG10rG+HqN3o6hVcDXRUsev8waJXzlpP3f5k2jqw6/IXkKYB2nRbHUk1F8+4LI
         K+x/kF5TqRW+HKVi4qrtKHcxXgc2eKb8E/QIGtEKqbeDgkanycLkH8eteWkrGTXI5HnK
         0qUGWVvSWfeoBm/ODkVJOLhgT/sKWfeNijafmsRFEHsJdmQ0exJa5DCi6pbsFVIceK8L
         Sryi31pxEqL8ZWFK6lXhSu6Sy7wBbsnn7JwGAChcyJi7rNj5b3cZfVLKmJaDFvsS3izh
         Kagl9nJ/lrtiITxxDAZcMShI1ZW2T7tfS8aPSTLtcBZczqYuRkjKBkKBDQLuDKy6S2Po
         R/aw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+HDEAg6VxmUuib9PCZ7wCNWo75uJyK/HXLqdAxC6tReDz1gHfrgemCnGFoMZo7bpOU9zG1OJ0vAcl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9o9C3+T5/BZaBLfR4HPXEpE8qMulgLHAMFtq2slTXeCV+tSZu
	TuRprOnvMkrNa2tJd3zwAIhPWu1TyfYj20DP1nMBlyYuD+kJEZzfYQGhtyRDU7yDTkTZ3LOErQq
	J8TlM
X-Gm-Gg: AR+sD10OrtiWUgh2AoX9eLsw9V+Yt0lUi6qukfQNvupbf6JolomaRa+PVMCrMGZlFHR
	HOPC4AHkK5eN+8PeGKQYHD6ROoNgIXufBKMhigCvp72ok7mjkxVaWOH6ZVXekzKRZGx2f4sn7Nz
	/aJpgesgjYv9CVhpGQSAQhaKdIQomNZj/ZG+SFRj2oZoTBs/YT1bKU3okbROFYZqx47jHxKJih1
	QdoekGK2Qn1aTE3lzhj9o6dLd4XBv20lvb0afN+MpgQYuIONB/rsv/Kn4zmV1gH2y4jCc1+clBi
	YwatNWnqKeO5iQkSSTZT+VfPJKL6Haizl7qocykDI3TwiQfnoDtA692+8THWwgDwQB9VjS/UJSk
	9lPckqbZsFe7oUuTllke4CbkyS/cJHyE3TuK32RWIuUPJFTPGiIalnUhZs/cocbxA9dOwztyqe2
	wklAyGeis0AFVjyMGYJ34Sws+4D+jc7fvyBNCPBIjzYsEWfQ5PsoFa+S5X/0P3Am0H4yU1FXPZP
	H7R91v3cbMTkmTZ+w==
X-Received: by 2002:a05:600c:c84:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4954a3ed426mr259964805e9.10.1784733263489;
        Wed, 22 Jul 2026 08:14:23 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm70595615e9.6.2026.07.22.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:14:23 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 0/2] soc: aspeed: ipmi: add KCS Channel 4 over PCIe
Date: Wed, 22 Jul 2026 15:11:56 +0000
Message-ID: <cover.1784732161.git.gregoire.layet@9elements.com>
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
With the patch [2] adding PCIe BMC device for Virtual UART, the MSI
interrupts are correctly setups. The Host driver is build and side
loaded on the host. The ipmi_si driver on the host is loaded manually
with the KCS address given by hand. 'ipmitool mc info' is run to confirm
it's working.

Tested on : Asus IPMI Expansion Card, AST2600.
```
# insmod aspeed-host-bmc-dev.ko
# lspci -vvv -d 1a03:2402
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

# modprobe ipmi_si type=kcs addrs=0x82040E88 regspacings=4 regsizes=1 regshifts=0

# ipmitool mc info
Device ID                 : 32
Device Revision           : 1
Firmware Revision         : 26.04
IPMI Version              : 2.0
Manufacturer ID           : 2623
Manufacturer Name         : ASUSTek Computer Inc.
...
```

The original patch [1] review set to use the existing LPC bus and
modify the kcs_bmc_aspeed driver.

[1] https://lore.kernel.org/linux-aspeed/de49f2032f5b1f170161dcd6191c0daa48f0b0c2.1784117715.git.gregoire.layet@9elements.com/
[2] https://lore.kernel.org/linux-aspeed/51e455417bdcfe608270c6cb2806b1fd971fb998.1783524645.git.gregoire.layet@9elements.com/

Grégoire Layet (2):
  ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
  ARM: dts: aspeed-g6: add pcie-kcs4

 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi |  7 +++++
 drivers/char/ipmi/kcs_bmc_aspeed.c      | 39 +++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)


base-commit: 03f906d8f5541e8bb741035981304feceed5993d
--
2.54.0
