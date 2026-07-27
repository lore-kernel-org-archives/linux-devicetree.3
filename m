Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA833EB108
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144010; cv=none; b=UlPGpVH9gyaSVmJSqCs0y+mq1u+rnrrsLYt+dyZ9l2vmCjKk0pZaHpJ+3prAwtLl+DQq8/p//0n73aZ2a2pIwmpdScw/HmET1zlwvhlVi+Qdg3s1691WJxnJkdN49mAktsIDXIgqHCKmG55CTnzgVb8VqCz+THA5iIVUlDNbPzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144010; c=relaxed/simple;
	bh=wfpwvK/QqsszrIXUTMQx1BlD7GDxkr/nIpVx7/VF8MQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lYxCEJpi5QJIC8mrGLdCnR+OUFeemQsR/Yw0Gd5RwQYH3K4OJ2QrDMjpTJad8q1mL4w1dUZZQ7HfEWf4P8UtJWRiYJ1OMy8+uQStevg7r8ebRRPS6jcevVPTaCvXf3ZUqGCzrXX2jmmy0IBLHxvzF1p1LRa1U3x0UtMzf5Iz9Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6kG3mXT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6kG3mXT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84861fc51f5so1779571b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785144008; x=1785748808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6lF8RNa+JcYURNQxf37EbYWdyUKC9TqlnjfVT8UzK0=;
        b=i6kG3mXTVMIWeqYRBFXQb8TGBUlZzFVxIdt+c7zTSp6wKd3XVRo+nrc5rLp2dJxgbX
         xQsTdfDXbFa6wgjWOyN768c3SMOrN0mTyPUHgEMIhtDjuIBd4/6Ynz2IxgNlcBnUTVym
         h6nb3+TjjifiD32aoBYxCTcST+p6njHejC5l3LRr5nmSmuy0OaywsvPxff01XX+hjX+B
         TcNTrPhDWj9SfNOL7TghpSC3Dtd46Y2/h/nftIbdj02aXV3dnpt7S/X3Iarcys2cpH53
         dVFKcs0DPCTZqj5GZzvjpiDzQHIV23qUKyKj6O4SA7kzf9nbQ1sAIWaB5xvryyD2Iuvk
         GBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144008; x=1785748808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6lF8RNa+JcYURNQxf37EbYWdyUKC9TqlnjfVT8UzK0=;
        b=nRZAK7Zrhk4ne++JuGjiKTdze9Yz8GLhyDkNv9xDo0p7PlXWYHrmVlFjvSHXTztFZX
         X/6utMGxmk4XDNRCkvk/XvvDUQoxSszWkzzoEwAnTQ4ylZhJWpCMhfotU6t99SOjqdZQ
         kQw7+Tw8hvPxSFkO4YEgqd98U4kV5eLN3BdytF0pQ92aqMiQWc9xoLmJLK62yAl9eF3X
         4dd+yU0ZF477BZprhtnFTxchd0pQyU+JfE+tMMLmY8jbB4/7RlLrBetqwSyNfQzfLzy/
         LzdzOYUb4c7orqdx6kTDQE3C996IDjFfASGivlivUoCDXLDpC18B0lTEGIClq3XHtudT
         zx3g==
X-Forwarded-Encrypted: i=1; AHgh+RoBfNWMVzlrkaE6Wujhv7pGf3SqZIro9F8vhj4EL+o2la3GttwgEsuZJQgZ0leA4B4dO0Nk1IlA8ndB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtt2Oif9/PKxUVzuNkLIQlF7Q+G6MaFGcVcpZu+UVlepTF2SDh
	0mZuFGCoMQAcyHXH2r3NUL9RWQI1L+4U866q4ub4llP924U2ZL3fWg8H
X-Gm-Gg: AR+sD11WEQNQYLsPitXdh7grQaW0wIt+kzGmbogTVYZKjzycByKpu8wD4a5iprg7czk
	m3NBg8ar3y9NNa0xBpyjQ8K0NeQ/yAbo9l2JQlKVeg3r3g6TlAP81/xGmERwqfmOXhoSgBRCUg3
	JcBh4P9C16qogvePhKLb/Wes3sU2CFp2cOTL8oOo/Cj9rQACXBStyQnEkBWQxWU0KExNOSESqnb
	CEl9zkgEkkwxz0PV72O4FqrAufqXHpIlHIuYzm3GY0x+FvfU9Lw3LtybwbffyPkdHTWVHz7kYUt
	QUjEqoYf4RcgS0XbEBRvXrq92sUFTEaAOpoLVon0x86LQKQ/FGKtYZZXM+NPWUR25tx8ccfC7Bz
	zd2I6RzRuHZijbtZAuyob2UZACEJ0XMz5LouEd0sIFPhwYOAbPzvYGTXCYAcX/rk39f7ESDMOvJ
	uCslKH8/fLuAjzM4JbLtdl7D8haPFlLf1J/tqqU+j+ibDwsF/GMZ5iE1MSK16z7TGD
X-Received: by 2002:a05:6a00:1783:b0:845:d286:1fb4 with SMTP id d2e1a72fcca58-84e5955a6d1mr5974845b3a.50.1785144008034;
        Mon, 27 Jul 2026 02:20:08 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53253b65sm2802645b3a.8.2026.07.27.02.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:20:06 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v4 0/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller
Date: Mon, 27 Jul 2026 17:18:31 +0800
Message-Id: <20260727091833.750051-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding and SPI controller driver support for the Quad SPI
controller found in Nuvoton MA35D1 SoCs.

The controller provides two native chip selects and supports standard SPI
and spi-mem operations using single, dual and quad bus widths.

This initial implementation uses 8-bit PIO transfers and supports
per-operation clock configuration, clock and reset handling, and direct
execution of SPI memory operations. DMA and active-high chip select support
are intentionally left out of the initial driver.

Changes in v4:

* Added minimum 1 and default 2 constraints for num-cs in the devicetree
  binding.
* Made the driver read num-cs and fall back to two chip selects when the
  property is absent.
* Dropped SPI_CS_HIGH support from the initial driver.
* Kept separate chip-select helpers for the SPI core and direct spi-mem
  paths because their boolean arguments have different semantics.
* Protected SSCTL register read-modify-write operations with a spinlock.
* Limited spi-mem operations and individual SPI transfers to 4 KiB.
* Limited complete SPI messages to 8 KiB.
* Restricted the initial driver to 8-bit words.
* Added defensive transfer-size validation to keep the PIO polling path
  bounded.
* Kept bidirectional data pins in input mode during dual and quad dummy
  transfers in the generic spi-mem fallback path.
* Treated zero tx_nbits and rx_nbits values as single-lane transfers in
  the generic SPI path.

Changes in v3:

* Fixed the DCO mismatch by using a consistent author and Signed-off-by
  address.
* Added spi_controller_mem_caps and enabled per-operation frequency
  handling for spi-mem operations.
* Added a short delay after requesting FIFO reset before polling reset
  completion.
* Documented that the controller generates one RX FIFO entry for each TX
  word in single, dual-output and quad-output modes.
* Added the missing linux/delay.h include.
* Removed unused register bit definitions.

Changes in v2:

* Updated patch subject lines to follow SPI subsystem style.
* Added a commit message to the devicetree binding patch.
* Added ARCH_MA35 || COMPILE_TEST dependency to Kconfig.
* Expanded the Kconfig help text.
* Converted the driver file header to C++-style comments.
* Added reset control handling.
* Added the resets property to the binding.
* Added a num-cs constraint to the binding.
* Removed the flash child node from the binding example.
* Used op->max_freq for spi-mem operations.
* Split low-level chip-select register handling from the SPI core callback.
* Limited spi-mem command opcode length to one byte.
* Forced spi-mem operations to use 8-bit words.
* Avoided driving bidirectional data pins during dummy cycles.
* Drained RX FIFO entries during transmit-only transfers.
* Rejected invalid chip-select numbers.
* Rejected unsupported dual and quad full-duplex generic SPI transfers.
* Fixed checkpatch style issues.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
  spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  63 ++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 658 ++++++++++++++++++
 4 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1

