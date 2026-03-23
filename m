Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A03938AC89
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269819; cv=none; b=nSbug8ehz9oYq+qPjogIcwIUk7oKGk6EGGUBwtfGW677SHaecnXWJocckRLwk0Ts6kb8izsTdNBORFuVDdzJmCDHeFOKNKmKp9nJvC9fCpTeFDDk8rAArhIifGu+mM6z+Vy/xJPO8GSKYMDrTGjE1jCJi4M5JfwgPP7lNxc2WBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269819; c=relaxed/simple;
	bh=e+YdCl+fCYreU47gtwqy03Jl+PvxUX7nHi35h7gNzJc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yp5FotUEoemGh9SiPUnhf32fCimZhrrEpZH/+KFlbTbK1ub6hyi+lAxdOUT2iVr0PdzQ7JLdGR9tE0Lb4ifK4vue3r3s1iLK1CCXFlIugAZs9PQCbJOB3u3odaqH0GuTmLT/bySnowpYlPwa5h9GHfcljZ8L7jHZmMsyjt+Rrcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIpQGsTH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIpQGsTH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c742b9b7727so1346394a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774269817; x=1774874617; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59UatZnPQebxpPUbaoejPsCGSwwdZSX5Yt2Ab7MbFgE=;
        b=PIpQGsTH0hyZ/5bm1YknlQ256YB57CivscYjXAlM6Vdco/qtwqJ54T8YhtQ/2Oylno
         sJ0zNJFv6GFwaGltv64eZTUmpKjfnwuwzeZspC6zrjO8Wro9M+neldat2ux0tfLG8U4U
         QleIm2sfLCpmNdth0P+B/YPeE/4CWE5qwQQ6pHfZLFDbT8errywvklDpSt7vxVDJFDaa
         3JfmiNgMlvrqiqECcxBtvYDzqKqWsLTgFEo6pUk2i6vbSh+pUVG5Lt0/9doG93Ixfkp4
         VAzqkgI0Jx+HbK6+iNcspFFy/Y46w25tj5YXJMwLFQ5QWamu5g8JW+7vN04uG9Bvq3SJ
         Srcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269817; x=1774874617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59UatZnPQebxpPUbaoejPsCGSwwdZSX5Yt2Ab7MbFgE=;
        b=pa8TP+1ceKFm5mROeZoohsTr7BO+DvemEcUf9Fm6XNDl7yGBtqTQagOYT++GDjLVBY
         vO4b65YNbcQRAksu26GNM5DezXv8q8sTo253DQ62ipUOfp1AksQiAIcdOdS4V8sOzQKJ
         b+uVozXMcHqqFqgfE0ClxRwSzmdu0dXD8EU/fFegIbLx4jQKrrxufeqX+5TgrFJF0D45
         MXL0Ri6SUfCyMzC1Jyaaz0w8TqOmoXLxoOFatatUkq9lXo/iHmxqed/EGx1IVdPrz17l
         u/rBYPtJjYwxPmHr5UgKN3F1jQ7vChmi4Z5Bq5uRtVFlqlDVW8BJ5ODNgUFoVcMTy5Jv
         RjrQ==
X-Gm-Message-State: AOJu0Yxt/pQw5ggWLznZo983QEeao88ZAHBbb/gg2/ncM+0BE6b+fWob
	zvVa3WROL2yoUtXQCV2VwAkphqq+TeNkZr+0XbFEk+Xo4qF5OKF5lPa+
X-Gm-Gg: ATEYQzzfc0tkT5Shw2/QmTXpvM4UwpAMBt+wKMhurVcgzDvE5T7bfyrh7Xq0FmV+2+Z
	f1akPrAO8ZpHulmAm8BYbHZFaaae9ZC2DcJZ38s5nb8lYaHBTODo4r27c4KwshYLB/BeA9KVtJT
	3t5wjzBRasxJYbVOxBLPuvS6vOlh4I+nbdIxlirQnudHXK3nHR3ZVEZF0ieoZSJdv+gj/bNXdhx
	Hw7yEBwc3DGTDLGlToxl5/HKN3B1FIdsp8j7tsXNyTYDU3J8m89BHNrdbgFqQt8WkNaCrxdOgTJ
	Szihz4UkDRJjSuGu2WOrXQKCYXUCXBEoaddlK4agfXXRjdHeD5shuRwdoFczuqFgp2lUkzd/e9W
	Ck6vbHSFF8uOcnefSZAu55GgxM0yTgNmktFrvuz/zZ4oDIIDa+3n8WvWNMSoP6eEfQ/4CLVv7Bd
	pAd3jfpSdcyfj8FHDkL/+yavWpPp3vd+713Z4t4LrkND8OjskfJH9/Y57nnVEDEd/dq2ih/naZk
	9o=
X-Received: by 2002:a17:902:d2c9:b0:2b0:52dc:f1c1 with SMTP id d9443c01a7336-2b0827bd48fmr106900625ad.16.1774269817485;
        Mon, 23 Mar 2026 05:43:37 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm103668865ad.13.2026.03.23.05.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:43:37 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v4 0/2] Add Meta (Facebook) SanMiguel BMC (AST2620)
Date: Mon, 23 Mar 2026 20:41:04 +0800
Message-Id: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOA0wWkC/33NSwqDMBCA4atI1k1JMj5iV71HKZJXdaDGYqy0i
 HdvdFMp0s3APzDfTCS4Hl0gp2QivRsxYOdjpIeEmEb52lG0sYlgImdx0KB8i/XT3Sv0OFR2CLQ
 ojdUAJmM2I/Hw0bsbvlb0co3dYBi6/r3+GPmy/cuNnDJqGBOgXMplWZ7rVuH9aLqWLNwotgTsE
 iISucpyKQwIDfKXgC8BnO8SEAmhU8uVLpRUfEvM8/wB/+8a1joBAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774269813; l=2647;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=e+YdCl+fCYreU47gtwqy03Jl+PvxUX7nHi35h7gNzJc=;
 b=uHObNyONEAf4p/vGAYVGeay41iAESMvQI/0AI6Npa6OHdAZhzJWkQMMQke82nm6dZZJNgBsuq
 B9JfrHwOxFEDLzeDMzB3p1Tl/B4l8QHXe36n7cCPbi2Y4P6l2KtkU8c
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

Add Linux device tree entries for Meta (Facebook) SanMiguel specific
devices connected to the AST2620 BMC SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v4:
- Include openbmc-flash-layout-128-alt.dtsi in flash1.
- Rearrange the DTS nodes and properties alphabetically.
- Disable the internal pull-down resistors for below GPIO pins
  - GPIOM4, GPIOM5, GPIOV4, GPIOV7
- Adjust GPIO liname
  - Move `PCB_TEMP_ALERT-I` (GPIOV5 --> GPIOV4)
  - Add `HSC4_S5_OR_S0_N-O` (pdb_ioexp_20, p12)
- Link to v3: https://lore.kernel.org/r/20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com

Changes in v3:
- Update the model name to "Facebook SanMiguel BMC".
- Remove CP2112 and downstream IOEXP nodes as the upstream driver
  is not yet available.
- Remove the following EEPROM nodes until the bus numbers and
  addresses are confirmed:
  - 3-0051: HMC FRU EEPROM
  - 3-0052: HPM0 FRU EEPROM
  - 3-0053: HPM1 FRU EEPROM
- Change the compatible property of the following EEPROM nodes
  from 24c02 to 24c128:
  - 5-0050: SMM FRU EEPROM
  - 9-0050: PDB FRU EEPROM
  - 13-0055: SMM EXT FRU EEPROM
- Fix the smm_temp node address typo (0x4e -> 0x48).
- Remove nodes that no longer exist in the latest board design:
  - 19-006f: RTC (nct3018y)
  - 9-0075: IO expander (pca9555)
- Update linenames to match the reference design:
  - B0_M0_AIC_USB_EN-O -> B0_M0_CPU_L0_RST_IND_L-O
  - B0_M0_BRD_ID_2-I -> B0_M0_BMC_TO_GPU_MCU_I2C_EN-O
  - B1_M0_AIC_USB_EN-O -> B1_M0_CPU_L0_RST_IND_L-O
  - B1_M0_BRD_ID_2-I -> B1_M0_BMC_TO_GPU_MCU_I2C_EN-O
  - IOX_GPIO_P16_TP -> USB2_BMC_HUB2_RST_L-O
  - I2C_PDB_ALERT_L-I -> X86_TPM_RST_SEL_L-O
- Remove unexpected or unsupported properties from SSIF and IOEXP
  nodes.
- Change all status values from "ok" to "okay" for consistency.
- Link to v2: https://lore.kernel.org/r/20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com

Changes in v2:
- change mac0 phy-mode to rgmii-id
- remove max-speed attribute from mac0
- Link to v1: https://lore.kernel.org/r/20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com

---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: Add Meta SanMiguel BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 668 +++++++++++++++++++++
 3 files changed, 670 insertions(+)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260202-sanmiguel_init_dts-79cdb33c50d5

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

