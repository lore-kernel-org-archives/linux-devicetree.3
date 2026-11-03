Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735062;
	b=yhV9apqm4nF5/Iz0BgsSkxxSVtk8MDJIMNgWwU17AJffIiF8rOrlTMDb6rzXAD5Ld7L3
	 lcAYIp8GlkyfM3a36H5UKhQkJeTN4a8rh7t25N/YSKi5j94Hrlyb6HxHzeX5X7GVyRaD2
	 hXt/DDVI9o3P5msQ2PAxbg3EaSb8tf3l6jQ3okG3ZJmBSbWnBsL9D6VB4tkX3Br8FfFTA
	 hluk9lk31ozvqgOIBsSBfhqorDQ3NFkotgRvcgldoSAds05LrITWlFw6SVwKIHtROpv/f
	 538TrzZqXME1dP+GOvGp/hIFPg4JkkHETx3n0dntrw6wguZPIo6RWIjb1+Y31GpzVJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
	b=4weCUkU9Imbxszg9XtkqlTMT2vVpL3gmlJQouUa12XS7mONs3zkvuG6v5kpZTUw74Q4y
	 WLdKeEGb5vsFg9IgOsG/jEbsYlAMbylwHZIZG/2wfHEaPeIWuZtSEUjBZABu1Nb0R2dNL
	 f7pbaytq9TJVm7xvDNkgjnDFty4QiCXw+FdNSvUwkjlM9J/Vg3cD8uuN+q1oFa5FbY1Yz
	 T1Xs1mdGsjWNfevpTzog6J01Qci2ZYfxJHmUrF/K27pgdnd/IGASh279iO6Ac8XECC6Zo
	 Ln9X+VDfsVJHq7qv/dkXA5KVotITCcI9Gy9VREUXclYiCAtY1eb+wJlUNY/d69U/+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4Y5Wz4t;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F42606A31B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4Y5Wz4t
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so31006585e9.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735060; x=1794339860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
        b=S4Y5Wz4ttEvlFn0EnFUq17+YTd9tlEB7totHz0okQXC0T23Xfa4NCIQ7ccGRuofA+C
         A+XO1qt8lMfbbd1Aww/F0872Uz/95eiu+i1Cn1WIStC+OAImprOA0KCgcmrgm9oKLTZe
         wNqYmWHxHobyNrwEyJHl3k1W+1SK9paxnTI9MLzuV1OtD3nBVMl4GAnGHkE0JEIAjpmb
         Qc9xquBn/6mM8mj6+y6YmOeKSSS3XXIfk9LODOL5maps4EhUR4vxj2jNMThHQi/mSQpn
         ZegFP4qBNSiTTuVS0waRaO9qWpSokUG81fYLyISerWBUaFXF7cN0DNnUDUnQP6g9uyCw
         ZvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735060; x=1794339860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8y2ryjp6wjnywAYuPRaVBggY6L5+h6mqO8ONVPtZtiw=;
        b=tO/U22YIWjKUjwXdAl/jfhM0tk/vT/p8g38+jvoDMOL1E3YwCOtHodX+mXN9tiuUPG
         z+WHUYKLKMOwxgF3XHFeo+qOLZuBZJ1YiqvoacrVhYAHovWl91LHbLvNx4SxKK/ZiN3v
         mrsauuBiEatfKOFTMaHdAL5A47Dx2B/L8VV+BakptJqQ4jcYpLwjKjL6yPyB1+gkdcsl
         5Zi810d/GQQBxHjgVrU+5rW4MxusIYNuq5pf5k5IaQcBbPJpUCDHW1P5JC2gF3WZ3KeO
         vnLS5op4PaxpXM7V/VQlU39ZPeDWIZqi9T6AYVa4fIGj5tfRHvCY+Q6set3x0h7Byopr
         x4Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxKR0RP1t1nWys4SLqejIYvNE01hG397iU38bH4PP8WL/L2LFxcJoje4OuQAtWkjvpcr9MsGyNkLLhv@vger.kernel.org
X-Gm-Message-State: APuU4Z80HHfH33RR0Y89c+QKKdLGsPf+V0jSXjGxlB/jqAukeUuhLxRK
	/WV0GAp2yzM6XPuIX975/kYwwHSExLMqMXNtvs3+44B7jxMt+mfyWVx5
X-Gm-Gg: AYBFou1Nz1kYQvZOFdOwNX5jtM5TZBSpacZYX+qt+iVADYRcZFK0oWfSCrrXLDqLuaa
	Nz5FAGrz6axrHfGSmpN2kV3Ggrle+smH6C2h+gJGs9+gsLIcauOSz/YbkQnXxknjyu10DrRDzZs
	dBfoo0qhq6DPayy0e7lQxI5ulgoPsX04kG9PQf39uLj1OijUZM4CnW+q8s+0gxVhqyIlW9TKxn2
	ht9KQNC5+aStuuprbaRkxJBAzwIwqEpEyXjNq5VlA1vEWJzsJjSnNNrDWHk1oT7p0UFvZdqcP4r
	1fLh0/FuwWpSSFokkUvAiSXuTJJcDnl2xqSk+I3Ayca79y5rzdiasAQDqpE4gEZSttSvmtuoPaZ
	bKgZ1r5maRrl9x5aQyCu9lG0foGyEhKxRvt5P/4jb8FhVnpR5YDsOPkS4pNb4djKNAnVK0CDoLB
	erg6Z+uEe5o6QCtF5D/67lqur01VqK1ALASN8DTR3k7jxMNyVeJ8nenqZtCPCbry4whaN/gPr6R
	AlxNJ4ywJE/OYfthGULwOrcGicfS2pH27Two9hFsegacW1sBS4IQWuKNeP3CvC9Xd7ZE2tbPgsF
	TyUXZzqTkflygzaUmVRYbTV/RZtu1WyRcRGpUkS15tNuiff1fN36YAk15+Tddnh8dmPxp3ywU9k
	1ZXiYZUNdr2VyN+tbEGR/K7HU3Yts6hiatZoA+ZtjSn19CM3vQARPg5M=
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr328108365e9.27.1793735059988;
        Tue, 03 Nov 2026 11:44:19 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 0/3] airoha: an7581: USB support
Date: Tue,  3 Nov 2026 20:44:05 +0100
Message-ID: <20261103194410.6632-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v15:
- Rebase on phy/next
- Add review tag

Changes v14:
- Drop blank lines at EOF for DT patch
- Fix SPDX tag for move patch

Changes v13:
- Rebase on top of phy next

Changes v12:
- Rebase on top of linux-next now that clk patch got merged

Changes v11:
- Remove clk patch and move to dedicated series

Changes v10:
- Rebase on top of linux-next
- Add review tag for DT patch

Changes v9:
- Add spinlock init
- Add ack tag
- Add review tag
- Add additional comments for phys on USB 3.0
- Add extra logic to make phys optional for USB 3.0

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot
  Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (3):
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  61 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   0
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 663 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.55.0

