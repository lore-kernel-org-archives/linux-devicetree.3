Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4215B3A0B24
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387599; cv=none; b=cRERNqPjTzQ9gV7y9QmeY/6CP4QcIVKOVAakGqeCFjyKVbHEmdTVyzh8s4U1F6iCR+Bs1JagqINgtYnpsEr9OXg8BaFWE6yFBE5BRydGmOcM2wbkGDrS7KzpC0LYFC7lYUMGlZrEJgD+YoQm7DWqvIaV8NZCXmviyRwLzDjKOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387599; c=relaxed/simple;
	bh=8HcMrNMGlp0nBW8KzY3M/JBbcN7oaMkfNUWc675IqdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRYlbuyS6+M0iWRQEiXmJgkATLAd81K5oYtH3hBLwu/0mIV8UOxS2+viqMs6+N6GGAIiM4FBOd7SzC4CnoJCUO3Mq7CfJwfuIHQR53f5o4CNKIbDJzKDbyH0PKajFxxtgsyP/pys/b4KNbjOUwLakAYM1mOIZ7F/Jwi6afnj+d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgRAgWxv; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgRAgWxv"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso275187a12.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387597; x=1785992397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLomkV/WERA4unRDmZMMnCa6Bk9H4/ypeqQvvFV/QKQ=;
        b=OgRAgWxv4+5DjswcAB5eW6WN0oXqOdSdMy3zpK/hrXqJEpFVx2dUlddTWItddM560w
         XWgndFM5PotRplvqryaANfxK69QfrrNu70afxXMuSTjby8qVNyuVfBYdC+7uAxYiJ7Kb
         K8WvAJEqOqLKBm7v3icJOZeB+LlPCyyU+XCiq4y6f7e/7gnTl2mWGxllMMsHkED6k415
         cPfbIXK3I5KjKseBw3WZgx01xK4CLtBAtkj/U4NOBQV1JXLbMKhJaKaOCsWjIOHBLuJY
         NV5m3/mdEGICw2pUWjT5uOMY4OPRPV2vtj2ytTMAYdJEAjifeO11TkXnAE3391ho1HYv
         h0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387597; x=1785992397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLomkV/WERA4unRDmZMMnCa6Bk9H4/ypeqQvvFV/QKQ=;
        b=nhUalWwMHLV2jRQCqjtOR+HG5LjWCD5ZgNZ+Ajl6mpon9IJ1rffRjtj7Ujguk9AP5P
         nFtQk8j96HxixDVGkNNKIJmff7/AKz7iT30/6jUnheX7y+JG5i13Cp1ylUp3EHltm4ZC
         q5LSApyxRTUVQpY5MOglgcpP7Bbx18YHFnR+75O3DCGEd4DPC+7AEA+f4P7FzASB5/GU
         7UeXX8W24zq5Pks8DCI9dcDbpHHH5Bg7uW165IB9d0FeM8qeDhksUKt0EzvZLJ+vz5e8
         Ntd4G+p3U583n6nQT0hFmiIeicWJjWRfYbvqP8cPj6olGcCtC8TJUt3QzRHsMZTEZ9Zv
         8yog==
X-Gm-Message-State: AOJu0Yw4i55JaIvfcDsYO+t/HDtAh6SYZeVF7FNPrrGYb6umXf6lteqQ
	hBIhWXIftWWdNFOheud2sTmzbg39utfa5hpQPDTjTzXgil4r5cjFShuY
X-Gm-Gg: AR+sD13fGem4ST6ai6yZL6+AmshFUO0z83NgjNHozDXGr83Ts3cmBsNJLAmWcRFdFy9
	zczMIXkwkRp8r9fU2sujXVvuOc+NG7hQQ2U6uk+RPWWOufTKdx+W93aGz2hAc+sZ8GpaocBiLg9
	VjmzQIUZlrdQ6mGwY+jEQPaCt4O5wXhaeJiDUYJikm5U60MS7GxbZNlROMBo+SjqZ+0aZI2drMB
	6Wcsng5Qe8ClYLZIDVwC5kXZjuMOMo3Up6sY2kX0WCGeVs04gqxLvdSVTO8H0p3o1XCbbABJEBQ
	ZweCj1doHVkALr2PYdfUY32ydCfzQeaWQTpo3wAPRxhTve8dTCmFsEJgVC2HiwcwenMcTLmb7hu
	tFXfrCj/bNZTCIKmnLL3a7AOlmZw+EDmzb2kZvrYJgvRgasACsWFc9a3GSJiEo514cKPQ2tzVZs
	0wkDNjPV51aH9FgZ3qvBTI81rdVpsBLyh9y83q7PoaQqlR8V8Cxgv7WWr/rm0vsrzKIFAg
X-Received: by 2002:a05:6a20:d52d:b0:3bf:990d:3fc7 with SMTP id adf61e73a8af0-3c901549430mr881717637.20.1785387597517;
        Wed, 29 Jul 2026 21:59:57 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72556386sm14383898c88.0.2026.07.29.21.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:59:57 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 0/2] Add support for Vicharak Vaaman board
Date: Thu, 30 Jul 2026 10:29:45 +0530
Message-ID: <20260730045947.388660-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Vicharak Vaaman, an RK3399-based
single-board computer manufactured by Vicharak.

Patch 1 documents the "vicharak,vaaman" compatible string in the Rockchip
arm bindings. It carries an Acked-by from Krzysztof Kozlowski.

Patch 2 adds the board devicetree, enabling the RK808 PMIC with
SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet (RGMII,
RTL8211E PHY via a proper mdio subnode), eMMC, microSD, SARADC/TSADC,
PWM-based vdd_log regulator, and UART2 serial console.

The vendor prefix 'vicharak' was previously accepted via:
https://lkml.org/lkml/2026/6/24/929

Changes in v3:
- Replace legacy snps,reset-gpio/snps,reset-active-low/snps,reset-delays-us
  properties on &gmac with a proper mdio subnode (snps,dwmac-mdio) holding
  rtl8211e: ethernet-phy@1 with standard reset-gpios/reset-assert-us/
  reset-deassert-us properties, as requested by the maintainer
- Add phy-handle = <&rtl8211e> to &gmac
- Add gmac pinctrl group with phy_rstb pin for the PHY reset GPIO

Changes in v2:
- Fix fixed-regulator node naming to use 'regulator-[voltage]' prefix
  consistently throughout

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman board
  arm64: dts: rockchip: Add Vicharak Vaaman board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 454 ++++++++++++++++++
 3 files changed, 460 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

-- 
2.47.3

