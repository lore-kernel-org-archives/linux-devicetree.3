Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AFF451068
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049106; cv=none; b=Hisxj0POOxzTOi17TMIAlYyLj4AIxt11+q3+smw2B3MUjAcEjzqINqjsrDdTnt1VLYok7rAdxQeRR4PL27uV53rVJQdzCFe0XqPUpi4/KHDXncE4VfoFwB0xLW3V2hJpsdEGlKeqDmduWisDDWFiNw35Xejjhm90MiBgz9JNXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049106; c=relaxed/simple;
	bh=zdf7YbsGr17j4IBQi976SWW4xGeMan6sdZEmC9JWzII=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RA7FCcsCTQOuXbymNzqUyqe2l1uevefwZNfA0kd/7FotWUXSBgG8uY/ClQGEoYI9MJRpvf/5HFwGxLTch/7ORvtWpvOwT5ohQhorqzWGKMxT++6fjot5jGaKwYcyk7FmeNPoE2/KMuR0MmSl3P0YDLYltxLhQXrI51GHAljQQpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UQqrdzlw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UQqrdzlw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49802c418b5so48112135e9.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049101; x=1787653901; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iRzYJ7RHlmt5faDVd4SQiUF+QBz3mgu2M1pqY/9IwAk=;
        b=UQqrdzlwm+uoEMvLBU8cI6IwLin8x47ZsKL/NDJ8Wd+H2cWQDNoqBWyQ0fFKJuG++0
         gBxKSapAaPGZqKjKlz/6ngyF3+VMve+2TdNYjpicQXa2r6T9i6p85N6WV3QNpu+XqEUd
         GMi/jkOvuHZSwx2TqpcMyuoOKgTWlQ41Ksh7+iOpooZ51AGcUGbEnb9adJXtzOxukiVQ
         Up7/mKPz7JYf5U0Q6SoOvnG1uMU97Pv1UU4rTg+jJBBIfOIoC7Q4Jyx3BcDP1azsLOaC
         ywBOXpQUChhIppy4Wud8wNDdEMAOOtfiXCke1cVW6m2Gps/fGvlSlLrIAQS5PPSI4j27
         i5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049101; x=1787653901;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iRzYJ7RHlmt5faDVd4SQiUF+QBz3mgu2M1pqY/9IwAk=;
        b=j+tveP6iNWHHmf6Xqs8qqUrFiqX4Mhu8yBoREFGc91+lTNJvkSs8sbHI26jj0oZbSW
         8bYxDpDi/YTXryYcYiX0L7FHiXiY6bCC5UVWc5AdEZquLvHx9AXD6+OU6f4hw4pUHZ1M
         i4ML7p9ek7qMwRwu1mxGNUUfdLtYVzqpHGpy4Id9TDVh4PTshO3Op4ad7RyWgFUW3isz
         vsPU1zQbxL9Etp1PORbm12MFPrnUL2rn1tF1NLS/M6cJOqHOQbg65sq0WmqBNd1VH2sk
         JSW158TEXwczHEKDIfBMKQ95y7pDLbsoD2vP5l+PGeUR7eub6mUEzT2xRc6biMF5JC0S
         8hBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1a1FbJ/XB3GBAdMhzndSSNNhubaasYo3b5LirL7TCe14OGtnnk8/kG51Ow3xaUKxCa/rJQTU/HZZ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ywrVGd7h4lR+9jTYcwskD848Opdg36xaUJ3o8hotT2RnubVP
	JhuoAleBADj4RiNP+hoITgZ6N9tTnCjF/qzpSjyHC+4wFPFNv+rRagZZAMdDhwCCv5Y=
X-Gm-Gg: AR+sD11UC7btITtdvJdC37R3WHHouGU8BFfwIYtgRfV1raBTxvkbOzzsvJ6x6Q2Qltw
	7NvqGARZGw5b2sdZ3BnWgWR5vZFMzw9ZYLhubQR9PgFr9KOfpzhE3An1lCyAgh0/0NAg2j+35GI
	5iC0josYsSgEJz39VILb4/0P3xNopwM9d2gbwpNx5lbUXc45c/1tIQ/mn+BtL3JscMyZxcP1EMK
	hDy/NIdx5KY1ipkWBm5Nt8ozOoArzVtCe5bCMX1j7tD/y3ZqZsjz/9ockTqrVvaQhpsCm5pPu64
	+iKMH8yKcdilS8FiwYBMGmkz6WaC6s6yrzA2IC5Z7z5mwHWGxWbAIRF0/dWR9jAiHZJ3+nf7SVp
	+H298g2Rbwpq9201NURdWH1x71o4z8sL+GwlZWL6aE/8dr2CMkbELw1g9glGyoSKFpEn4YNklsl
	l7+JU5jNUpL+Kdnp/cJUPnQ/1XBaKATJl5jD4AtCc+hViw6JXhP4STS/IiiIp2upgggONwE5QRx
	+Wryd5StdaFuOoz+tElykxHOJIonEccZxGaGKKxYFhtsnf5FK0ovexyQWHUm52CdTbn5vo=
X-Received: by 2002:a05:600c:6089:b0:499:86ce:465e with SMTP id 5b1f17b1804b1-49987941e38mr561900575e9.4.1787049101182;
        Tue, 18 Aug 2026 03:31:41 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:40 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v6 0/6] soc: aspeed: Add BMC and host driver for PCIe BMC
 device
Date: Tue, 18 Aug 2026 10:29:13 +0000
Message-Id: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPkzhGoC/yXMyw6CMBBG4Vchs3YSyqUBX8W4KO2PjgskM9qYE
 N6dqstvcc5GBhUYnauNFFlMnkuBP1UU72G5gSUVU1M3vh7cwMFWIHFSyVDOntM0jn0bQ+c6RyV
 bFbN8fsvL9W97Tw/E1/dD+34AwrvMHHQAAAA=
X-Change-ID: 20260818-aspeed-driver-v6-db9953ca4141
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

This is the v6 for upstreaming the VUART over PCIe BMC device drivers.

The initial drivers were taken from the ASPEED kernel SDK
(master-v6.18) [1], and have been adapted greatly.

There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe.

The virtual UART is an 8250-compatible register set. It is called
'virtual' because it is internally a simple FIFO.
On the AST2600, two VUARTs can be exposed over PCI via the PCI BMC device.

The host cannot access the BMC's memory. Only the exposed features are
accessible. These are the KCS4 channel and 2 VUARTs. There is also some
mailbox register functionality for a communication between
the host and the BMC. More information can be found here [2].

Changes since v5 [3]:
- Fix small formatting issue in Patch 4's commit message.
- Use static const for MFD cell and uart_port in the mfd driver.

The host driver will performs multiple functions. The AST2600 also
supports LPC over PCI, with a specific KCS channel (KCS4). This host core
driver should also be used to enable the IPMI automatically via this KCS
channel.

Tested:
As with v5, VUART data flow and MSI interrupts have been verified
as working on the test hardware, in both directions and on both VUARTs.
BMC: Asus IPMI Kommando Card R1.01, AST2600 A3 running OpenBMC
Host: Linux kernel v7.0.0

This series only supports the AST2600; the AST2700 is not supported.

The findings regarding the MSI interrupt numbers are explained in the v4
cover letter [4].

As with v3 and v4, I would like to know whether I should add the
'lpc-io-reg' and 'lpc-interrupt' values to the vuart3 and vuart4 nodes
directly in the 'aspeed-g6.dtsi'. The host driver is not capable of
finding the vuart address on its own, so they are hardcoded to 0x3f8 and
0x2f8. It will not work with other addresses, so perhaps they should be
in the .dtsi to ensure the correct configuration for the two vuart over
PCI.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com/
[3]: https://lore.kernel.org/linux-aspeed/cover.1785932211.git.gregoire.layet@9elements.com/
[4]: https://lore.kernel.org/linux-aspeed/cover.1783524645.git.gregoire.layet@9elements.com/

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
Grégoire Layet (6):
      dt-bindings: serial: 8250: aspeed: add ast2600 and aspeed,vuart-over-pci
      serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
      serial: 8250_aspeed_vuart: add VUART over PCI
      mfd: aspeed-pci-core: add AST2600 PCIe BMC device driver
      ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
      ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

 Documentation/devicetree/bindings/serial/8250.yaml |  42 +++++++-
 MAINTAINERS                                        |   6 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  14 ++-
 drivers/mfd/Kconfig                                |  12 +++
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/aspeed-pci-core.c                      | 115 +++++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |  92 +++++++++++++++++
 7 files changed, 277 insertions(+), 6 deletions(-)
---
base-commit: 6fdec78001b3b94f1b6000bbb2f9ec3498f1c73e
change-id: 20260818-aspeed-driver-v6-db9953ca4141

Best regards,
--  
Grégoire Layet <gregoire.layet@9elements.com>

