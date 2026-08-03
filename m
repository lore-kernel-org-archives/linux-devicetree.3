Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D664266AE
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778350; cv=none; b=HQjSp5sYMxEKJN4HNDA/SkeCyMeCWYBbnE+A2bSqyoNIPiG5FUt3K13Ai6MBNCIXJfOnIxOX365gJ+IvtokbzrfSuwA5t6u1h0I3PA8aQr0m2g+9PSfGO0nV0DXCEHBB+xnwmbDCWzaxn2XKz/w9Kqz5/oXwgpkB9VV4wWBwG9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778350; c=relaxed/simple;
	bh=kEbL+PF96qvU+PFw5p131+6PIGTXF+X5TaoUcCGvk4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DoD1ZkAp3CfCTpjugMPvxDXNdYmsJatD10Lb4PAZVjLK6wdX/WraOixU6GaIiSDaS3Ij5f0DLopDDo9Xl0fn3X7/+Uut11thMIFW/RM7yGHER7yUmU0/Mod7zQI7lHMGkccA7AJU4d4zKCSPNrXYoz8eVpLFtbIkAZ6w1d5+P/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sB5Rdfw5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sB5Rdfw5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13267885e9.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785778347; x=1786383147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OD/ypQ31fdaW5XOFMD2EU4x+H9hiOoxJr9FGKaxkja8=;
        b=sB5Rdfw5KEhB0ROuKOS2XbgSdz3dI7yoPCC+mtzCj22lqZ1M/mex3KS4vWEKxrJceX
         YOsbZ2hU04+GOKt4gk2o/s7CD6RNVvvpDIG7pZE2wEm7CbBidUHZbY3GigMItSTUxKyH
         x5T7fXKw5ocpx6kuFns24IuBKzaJQCa2VDSvY5OD1pKkUSl+8EJfYO6almNG9Wo7K35T
         2zBx1XyIDHQ2+GjZGVHQmGVA1voybzGzjM8b3Yz6lVlRAl7Brf6giXJd1MVJKBoXeHci
         680kCM/LehfO47kRAKxA4JXYaon8yGsnDDGB8gCL472TvBptMyaI8E3eYzWZHf2u7vck
         yRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778347; x=1786383147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OD/ypQ31fdaW5XOFMD2EU4x+H9hiOoxJr9FGKaxkja8=;
        b=Fr36NQfbQRgrkVcE2bbhRyp3LN0apSxmnVbDgZPgru+NiIUe8yq23XcTtpGmZAYHSB
         GD0AcLDcBvE076gIr4EPfsOJTmeoNelH9VR9/llNsmqYX5wyhm6B2/0XGSnvEsTeAq+n
         nTpYdxLDrR9/RV6BI5LGWjdbPhDd1CK7RMoVgwk6vZa/qp0ja68omOHeGm5tNgdMtJl4
         jxDnmF/4H2vI8i6pgDq6fvcTtJ4IPto4pKbRl6iTMYc5toZzgS8WIIPpjep0LbruNUjD
         JP8UC1sT/rT88eJqo5Lf5VzsaGoFdnbE/q+u3TwMhDqmnucVgYaPEQzPtGeqCspacGGs
         lNog==
X-Forwarded-Encrypted: i=1; AHgh+RrQ9fOXzHDBP85rkMGDO7bI8DntOWdRRRB/MAkFuDN6iTZjPaMyAdXIJ4RqF7A4t24g8HhUh/R4MJbN@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJArlOxX6mNqtspwrkVtea7jk8E9tgtfd/0QIw6ER6SsMqHOn
	havVdjefFHRD3ZO+RayYed/My1jOylsGiEGv2ZD/gyX+zwc4RULEgdRa6ZDeL2YwP9w=
X-Gm-Gg: AR+sD12ztySK38JjyBbT8kAHN8rAJ4aSC+junLF/dIzQgAMI7moUKhWhMImQhoaS/Cy
	D17WCXBOpAKBKIB3bMSviBsExMVp+s9xNK3QjiqzdC44np4U7iGAFqwl9EnGuIl87500w+i9CcT
	Zr3UlQWUhlm0iVeLfTILFWHuPe2IRGXO/pJoNJpLKdn3tlAxaZgb/PfqZLU1HZkPKEEgEr0nx71
	A/IK1suURQyHcS6U0XIOYEQoNIpN9vWCgjUL6R+3UZkh28Wsyv0AkBARlos4PXDuDCILVrNlmdD
	w6rLjhgjzD463Hujhz55mz9TlJHki5dq2JOKeyNxnIVnDh735CDKrnafUs0OucSUyAXd9qRc8n2
	QuOkfhWpVxzspLpo+lcF4YBk592Fmvq1dx70ePFmlstFbB8G2VhObu2u/Z2QWonABhc/a7N2ev4
	ixWyhnFPoAAzVvgU7xnD6+nG5xS3HPXZYMUdzh1z6Y2/L+6XJjAva1sPK0NOp47FyOni3w27Itg
	s0Ys0Hv1f9wUTaZlhyus38uZxdx2rCQe9AtVm4KOdUDol0ij8mOdeO2GdAyLHWZgmkYtceUeOtO
	6io+vDHIxB5nyOa9Bb1LgKIUChqiLC1+7pxwV7kZBwDfsdQq533UniqKcFvFMQAtzPhawja9258
	KJku1t37ZgbBdLjH7i49RJlSYEA==
X-Received: by 2002:a05:600c:4e90:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4980eb4d5f9mr202655005e9.1.1785778346922;
        Mon, 03 Aug 2026 10:32:26 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808199a68sm176259975e9.4.2026.08.03.10.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:32:26 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3 0/2] iio: dac: mcp47a1: add support for new device
Date: Mon, 03 Aug 2026 19:32:24 +0200
Message-Id: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auQrq3p9IeqK+9hXEzaAk0EmhYbD
 eHuFuKCBcv3S+aZmSQXvUvkVs0kuuyTH4cS4lQR0+HQOuptacIZr5kGoL0JUiNQtJamdwhjnKj
 ABri8NCBQkXIZomv8Z1Mfz9KdT9MYv9uTDOv69/ixl4EyapFJhVzV2ol726N/nc3Yk9XLfG/oY
 4OvhlRXQG5cfXV7Y1mWH/ynydv6AAAA
X-Change-ID: 20260711-mcp47a1-add-support-3af1248f13a5
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785778346; l=2319;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=kEbL+PF96qvU+PFw5p131+6PIGTXF+X5TaoUcCGvk4E=;
 b=STWGByyIUrA8jSOHoabbM1n9MJeox0XVXQznoFX7AbLi0tYM5UMvBb3MkUO0J02dYrdlPwn5d
 GV9Uq1kz87xBIgWYFBEDVvaRvbtwjlGte1p5AjzwHI9V4bZqx9DmlnZ
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

This patch series adds support for the MCP47A1 DAC.

The Microchip MCP47A1 is a volatile 6-bit Digital-to-Analog converter
which communicates via I2C. It is a low-power, low-cost DAC commonly
used in embedded systems.

Reasons for adding a new driver:
- Existing Microchip DACs use a more complicated set of commands
  whereas the MCP47A1 communicates via SMBus using only one command.
- The closest Microchip DAC already in the tree - the MCP4725 - uses
  an EEPROM while the MCP47A1 is volatile, meaning that altering
  the driver of the former would worsen the code flow.
- The MCP47A1 maps cleanly to a standard regmap.

The driver was tested on a Raspberry Pi 4 using a breakout board with
the MCP47A1.

The datasheet can be viewed here:
https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v3:
- remove iio_chan_spec array and define a separate single channel as
  only one is used
- change scale denominator from 63 to 64 as former would produce scaling
  errors
- Link to v2: https://lore.kernel.org/r/20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com

Changes in v2:
- dt-bindings: add slave address enum to dt-binding
- dt-bindings: remove unnecessary example
- move driver from regmap to i2c_smbus_* functions to reduce overhead
- remove read test on probe as it's too unstable
- add 20us delay on startup
- style changes
- remove excess mailing list entry from MAINTAINERS
- Link to v1: https://lore.kernel.org/r/20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com

---
Joshua Crofts (2):
      dt-bindings: iio: dac: add support for mcp47a1
      iio: dac: mcp47a1: add support for new device

 .../bindings/iio/dac/microchip,mcp47a1.yaml        |  50 +++++++
 MAINTAINERS                                        |   6 +
 drivers/iio/dac/Kconfig                            |  10 ++
 drivers/iio/dac/Makefile                           |   1 +
 drivers/iio/dac/mcp47a1.c                          | 166 +++++++++++++++++++++
 5 files changed, 233 insertions(+)
---
base-commit: e0484d62e8e1cff75b210938be835ea6221bda59
change-id: 20260711-mcp47a1-add-support-3af1248f13a5

Best regards,
-- 
Kind regards,
Joshua Crofts

