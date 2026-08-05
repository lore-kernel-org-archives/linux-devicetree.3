Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088FC45FFAF
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932431; cv=none; b=WemD0xdwLy3wbayXL/mUz1rh/S5RQZ/0trWd4IdQQ/bGfkR5deruJeJ7tH87obCAXrCjuAdk6KWr4IjBTvdzeoZAnJEnhmfEHKOVmTtmao2ZPwMpwxABYt0Lw5MFLuqIy9UClVSs1KrOGVB5P0Ph8L+8IhZ6fYSO9whzjdVSw4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932431; c=relaxed/simple;
	bh=xl1cOK/dGjUW1mBNDOJNs68D8duvgWXHAALZFiZHDPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rPxGmoj3F9Nt7hDU9kvH32/IvIYyoAlfIMT8jlJC9vEkqDMgGyLQ8Qv+MrIKhKvGxRS3Nlx3t6fInxTLwFMhjJm1cLswrskDJywFOWfJXHc+cD5ivUQ40RWbbp2wszcxZB1kSlFFL6eZHXYc00MplEJURFAvrqLoZoKs6ymd/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=VNf1+RCx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="VNf1+RCx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954aff6088so9503055e9.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 05:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932427; x=1786537227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dp0YqgID/4phtDgYq1gE5Cv1WezComCCtY1tYXFFVXw=;
        b=VNf1+RCxaaRT+n6/oljqRy5WVe0G/0k5bfZoJ3cfJhSUWka6QruCDxMSHn1xcHnFuj
         KKlP0lq7O+Gi9E6K/W/BjVK8kP41+aEwtJ6YkX7juY8eJR+005CrmJE4ai2v8XLEtUrT
         WOiDlzbFgLa0BM6I7D5ojPXiIuE893z7Imq2jmW7MqYPodAoFsD/w5rBNwCPMrdHDqda
         a9BX543vkiIoTtpYpU3MzwSQP3zCqu7lCDvXXl4LwB4isHgAjNnoTJBdpLF3p5KDDTt9
         y/j5gEHE8O/1i2we8WCXjxAWkdHieON2CPZolWmckq2e8lXccQmHp1UDtsYW7PBNK9hr
         31mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932427; x=1786537227;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dp0YqgID/4phtDgYq1gE5Cv1WezComCCtY1tYXFFVXw=;
        b=DigPn2nUaq5THm6ZWmlBvi8zvGV2Nwl5s1pOTNBkSYq01FsXUylPoY0Mi+wN4HYa9Q
         fdH1g6nrdGMVry42fGhpVF3iuObVy/q4n5F1g/2NlqMBm3kEHuYHhr3DYNYVYEePvW51
         fIt0cQqfoaQd0dNnD44YLE+9M6j+Pg/IbMulmyiQmQwv1adMnQRdc0ajKQv6jO8dhoW/
         RVX+Lia8jxrPMV1UUXPjzAIFnqgrUKnzIW/V1+x3erQp/vP4CVbvIByuQee/4Z8iAsK9
         RUn5cCzHTU4q58uHyrDJu6EfbfnWNZUT8oITS5k3xRyv3tUUUhYraTZ3uv3VYfjSOWUS
         xSkw==
X-Forwarded-Encrypted: i=1; AHgh+RpxPsgunptqMQgAi31eWZAtLfajJbCESULp/mq65loB4WE4uG/zrmOskUTThqkvpTpYFCtmzgpVTKwk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/FT15cSw/6/RIVN0rd73EunqODxMdU/NrDTGwCUU/pnk8Gi7N
	+osLKqqSwWE52WhVb/gmSVuXQVG74o2jpxwBGYbJd1mT1UNYwdvh1M8fcXwtUqzioz4=
X-Gm-Gg: AR+sD13kIiu9XzDtfEtMT2NdrMLlnVD9hbNBVPoEtc0PO+S7tHhFiQUF0EdtK84JTkG
	b1kzi8zqEl5ZriS+0REUjQH55vH0107ZB776ok1UDzW1fVO2wRFwePaBrKLO8nq6bIkhPBObocH
	zFg1hwogUeSflp6OcQJBC2bxPIuGqF67yuSHtrXAQbh4dS2kNJmEYKW+FoxbRjTqfQcqwZSOwTW
	0s5bbkgmQ9O5vt7hptBq/oPqVk02wWwsIivy5K3gRC6zAYQCqMdN+jcljUWodjWv/j/EP1KoZtX
	GGAEImDZzDrTT6ftFmAItiRHKbP2feSJdy7LEpWEpFluXcQCRSQ9bxMHoNIohy2+GFBvYMbFmsK
	ID2Ise3SexcoytByvC/+JA01kA8NcAyDAGYVicfZ6/oN8X3v3k3nR5ZbTQL+1J/fg0kS4vEhuAZ
	vjVYyKmnb24OFdlqBXVDLYiMCm7R9UkAU96J+OIJmldGIrB0+T05FlOwBtfMb7KfDeYYfQX9geK
	RDYiec8g8fTh9g2/7FxOr5rT6wD7KqNeYOUCAim5YWTyQKJdiTCv0ffBKKCKGcBeoZs99Hs/7Y6
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr76610975e9.11.1785932426940;
        Wed, 05 Aug 2026 05:20:26 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:26 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 0/6] soc: aspeed: Add BMC and host driver for PCIe BMC device
Date: Wed,  5 Aug 2026 14:19:47 +0200
Message-ID: <cover.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the v5 for upstreaming the VUART over PCIe BMC device drivers.
The initial drivers were taken from the ASPEED kernel SDK
(master-v6.18) [1].

There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe.

The virtual UART is an 8250-compatible register set. It is called
'virtual' because it is internally a simple FIFO.
On the AST2600, two VUARTs can be exposed over PCI via the PCI BMC device.

The host cannot access the BMC's memory. Only the exposed features are
accessible. These are the KCS4 channel and 2 VUARTs. There is also some
mailbox register functionality for a communication between
the host and the BMC. More information can be found here [2].

Changes since v4 [3]:
- Squashed '8250' DT binding changes in one patch based on Krzysztof's
  review.
- Removed 'aspeed,sirq-polarity-sense' support on new
  'aspeed,ast2600-vuart' compatible string as it's a deprecated property.
- Renamed 'syscon' to 'aspeed,scu-syscon' in '8250' DT binding.
- Cleanup in BMC driver:
  - Changed bit 14 to RESERVED macro
  - Changed macros ordering
  - use FIELD_PREP macro
- Cleaned up of the host-side driver:
  - Removed unused INTX. Only use MSI interrupt.
  - Proper use of dev_err_probe.
  - Use of 'module_pci_driver'.
  - Used managed functions and simplified exit code.
- Changed the host side driver location:
  - Now in driver/mfd/aspeed-pci-core.c
  - Changed code to use MFD cells.
    VUART are sub driver of the core driver.
    This allows for easy expansion for KCS support.
  - The core driver now only sets up MSI interrupts and
    instantiates the 8250 sub-driver.

The host driver will performs multiple functions. The AST2600 also
supports LPC over PCI, with a specific KCS channel (KCS4). This host core
driver should also be used to enable the IPMI automatically via this KCS
channel.

Tested:
As with v4, VUART data flow and MSI interrupts have been verified
as working on the test hardware.
BMC: Asus IPMI Kommando Card R1.01, AST2600 A3 running OpenBMC
Host: Linux kernel v7.0.0

This series only supports the AST2600; the AST2700 is not supported.

The findings regarding the MSI interrupt numbers are explained in the v4
cover letter [3].

As with v3 and v4, I would like to know whether I should add the
'lpc-io-reg' and 'lpc-interrupt' values to the vuart3 and vuart4 nodes
directly in the 'aspeed-g6.dtsi'. The host driver is not capable of
finding the vuart address on its own, so they are hardcoded to 0x3f8 and
0x2f8. It will not work with other addresses, so perhaps they should be
in the .dtsi to ensure the correct configuration for the two vuart over
PCI.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com/
[3]: https://lore.kernel.org/linux-aspeed/cover.1783524645.git.gregoire.layet@9elements.com/

Grégoire Layet (6):
  dt-bindings: serial: 8250: aspeed: add ast2600 and
    aspeed,vuart-over-pci
  serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
  serial: 8250_aspeed_vuart: add VUART over PCI
  soc: mfd: add ASPEED AST2600 PCIe BMC device driver
  ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
  ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

 .../devicetree/bindings/serial/8250.yaml      |  42 +++++-
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  12 +-
 drivers/mfd/Kconfig                           |  12 ++
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/aspeed-pci-core.c                 | 120 ++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c   |  92 ++++++++++++++
 7 files changed, 280 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mfd/aspeed-pci-core.c


base-commit: 253b1036b9163f23f7b18274a0d4e904ac8821c5
--
2.54.0
