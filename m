Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7433BB11B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608230; cv=none; b=WXIeRU24vkR3IP1jv7gSkE3Wjpj1E4vs9SIuCL/n7DtTRjTzDl5RVA9fJxoocapgxVunaKwJ4KvtYIIZWSzFjy50artcOManWgDn12VKkg/oXrzPJYCr/4qmUQXM7yjevVNlB+gUe1Q7K+8VmjoGFkF3aK4uscdQqL8oDOgQ+Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608230; c=relaxed/simple;
	bh=2X9DkclGFCzH89b0NzBKAYW3gFAP1oT+ksV6Tizv/lA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ic1EKTU2FeZwpYt3yMRfTBSUkTm45PMJf8mFZbtgcP46rkhjfDlfcoxp9CU8uQel7v1yRdbJ56Au1jOFw4/st6XOvxRrW3fVj8hmeFu9a+iKlSnprMoabtxTnPZ16sbE/+3AhDBFXatMSg5eYgaowOguM4wi8AcD72IS7dNZs3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNnv6881; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNnv6881"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-835c98b659eso3879199b3a.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608228; x=1779213028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw7yD9Z23DvEiMo8d6kpF8dSdIAQpco59RabySZ7QjA=;
        b=jNnv6881mzXAS0dzCYhWNjp6+yCqZsaRwDBpPDQ8y64Kh6vtu63nzodIezo+snxdIs
         gtemNv6U+cLsvBTmXy/zmQkm+X6HGlCx6pCX7M3POzlXF5wfVdtc3donsohw6TdnSS51
         CcOTeXYR66S70n+DN/SB21OL3MhpvxVLb6Sgsci/rJIfvh0GM4gpEJG+eo/z9gUsWrDH
         pqc4mFDFGogEpd1Szp38VFbRLpfdz1NVKWKFecnFt0+eykOwMnZ49lXOfLgDNV+wCq2w
         SY8pJN9vWgvIPQPvoUtUs/lqDwms72WfqDGhyD+ApeacfCuR35WMsvqxabvLjiPwdEtr
         +ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608228; x=1779213028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw7yD9Z23DvEiMo8d6kpF8dSdIAQpco59RabySZ7QjA=;
        b=TIahmOqwsy+18hwy8swu8mvyjqx+LIPUEXXAa0cSA4wOu7U7csHOckxSwatBHGrGR/
         hYtD67LNnTuUSEYQ+BvPsv0JE2ttpeMclHN7km2SpR7wu+XF1BQKJPzb4AZEs4tPf7tr
         UysFulTNaf+iJpx/H2v5xOIng8T5aU8plojv29ZX7UVehM1HBTJcJtM5nastBU7hxHSZ
         PwR5kWciB/VP4LH9ou5qbJHudl5u2BKa+wTcA7BXiEd1zBFaEEbg7RdFHBgs6FAXJ1EJ
         BDKXt5Ea6tDVsW2eIacS5YA55FcmeqABBaHw5qNteXxcjDlqSaa6Yokp645AQInXY35S
         mWBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Z/iovuScGPk7QBhLWmdhMhfvvaKa6GgpmhwhJcIFiDnYDoO4+imyYbgxi8iuXbpS1m9wZX2eUn68n@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2RdACtGDcW5P0ciTt19GEL2boEXWIjEQl6br8gdpZsDoBKoAM
	9+SlUdmVdrN235douyKNa+P41zZaMOPvH4PhYVBKv9o76QZ37yt7zyzz
X-Gm-Gg: Acq92OENjqsiDhmuAnjvrZhXhJEPHfUkg/44GBcG6QJUgVT7mFeU41+oFJ1RUje/qvA
	aOOytOqR5wXUDcbwX+gXTBmTiUPjZISuSIbUsbemPkwFhi1S9G8XFkxiUoZYmsG/3wPtvaDQZfJ
	XJPH4a5Rb8HaRQfOG6rZRpjSILMxs0OmQsbcLpJ3KbutGMi+5sGmifwWG5G/yN/el7a1Ib/3NLZ
	s1YUpd4vpzgWoCmg8m192wOyus81AdqtE2tkx+w2SJ02X20lnFw+DJlOUw0yzCUEfG0IXpa882K
	0Q8WKxbiJuQkaZYzfbIO2gju8Z9ybObnEnfu8wTLQlnSsEC6nmzn0IVzalddo4xwAx9YwLKSqCd
	ffQiLZxEwsO7u12hnja2VTczj8R7349cDyKQT1U6OBbHHqZl1w8VcxBhd9On93AQ8JJGYdCZZM5
	qJqCb6lXCkfKQjZVpeuQ8cEg9bUxvzmJNzTC7plb7M
X-Received: by 2002:a05:6a00:410a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83e3b7b53d2mr14261430b3a.40.1778608228291;
        Tue, 12 May 2026 10:50:28 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a20ebsm24838732b3a.53.2026.05.12.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:50:28 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U support
Date: Tue, 12 May 2026 23:20:17 +0530
Message-ID: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial device tree support for the ASRock Rack
B650D4U BMC, which is based on the ASPEED AST2600 SoC.

The B650D4U is a server motherboard for AMD Ryzen processors. Hardware
details were extracted via reverse engineering of vendor firmware.

Hardware features included:
 - UART5 Console
 - MAC0 (RGMII) for dedicated management LAN
 - I2C7 for FRU EEPROM
 - FMC/SPI 64MB Flash layout

Validation:
Logic has been verified against the AST2600 v1.5 datasheet. The DTS 
successfully compiles and was tested using QEMU (ast2600-evb) to verify 
serial console output and board identification. 

QEMU Boot Log Snippet:
---
[    0.000000] OF: fdt: Machine model: ASRock Rack B650D4U BMC
[    1.085143] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq = 31) is a 16550A
[    1.090566] printk: legacy console [ttyS4] enabled
---

Full logs and reverse-engineering data are maintained at:
https://github.com/prasanthp20/asrock-b650d4u-bmc-support/blob/main/qemu-boot.log

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 61 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

