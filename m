Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5A442397
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385710; cv=none; b=IOFnoNJjrv9I5EoI/7wc3B67z9HNxMc5FnvvZcgiy3tIajGQYCFe5a3GDLSigCWfHvZXPSZIoChGjPkYvUf6TjS5dfEZAy5e3fJaJvIsw57QZkv4zWyxbNMwYUPesStioIdr6GTT0WccVgqOSF1q5kWfVkzdAWSeTCx0Tq52y+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385710; c=relaxed/simple;
	bh=DCEztktHgwImiVlEr+3EZnHKk5I/nI7nHcPmbmHQMNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bF7dXf5GI05uyHhGtmyeO69/EuKkuXhushATlB+qTJLxBdG34UBo8l3rAenLe0XGJbFcbgUTxbMFlE5Sf0RcjRdwDiyysl8xnKzHs2PpuoM738qtI5ftdgnda5bC9IWUweCo2urHIVVU2TQdcFhGoPS0hzkb43qainqrqKRaP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1K+r5bW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1K+r5bW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so17278245e9.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385707; x=1789990507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0F2Pzqq5v5cdo6z+ooVLKEAM4UOF9cFccLrXL8bbvc=;
        b=i1K+r5bWgdt5NU6dEnJV1OFXPc/5D5NtP3S5vNUS5ps+EUzVc3XppBfHDQ/fi3bv2M
         lOPzE38hyT0oEVDjQzjKzTUkAV9Hr3dPi8AXaR155cZVNi6sWBXmFMz2up8DcBXDR89A
         zB7yIMZyU2kccfoaPfII2QG9GHb7+/OL1Km/H18/zMSjEnVY/X09BhUSazXYFdsqtn5+
         8GwDw4sCEJy3QycKsT0sIPA/r1E7Pb189tSJ66TuoUVeP6beKn/lTtg+X/vNUTrHv3xH
         YfjfwbxxQLn4Hnp0MVKuIimoOfkL0QV4Akc5fumBGJxITzClsczaP/poduN0IqPmTpuV
         C8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385707; x=1789990507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0F2Pzqq5v5cdo6z+ooVLKEAM4UOF9cFccLrXL8bbvc=;
        b=in4DABH0BOPY4rKbRu3ETGgJAEwFmHcM3ydBETscDj3ZJPdQQ7OItpr001qkxQKvzB
         5HKtWBHV2qXSGGs4Vp/rpnHMWUkBZdepS3lTYn+pLCGP8iwY9kVLjHdDMry95HD7liI8
         UZ5o8gy0n60+dKZDwYrCp3vIt3SkceSHT/WOeWtabyyXF6xrZ8IY0p+kxnMpjoc+sn0g
         rm+WloYr80DJUreXk7BM6C0P91s0tMCwC5OX8oMtPBIiFv63COblqFf4AKHbsq0fmGD+
         zYl6TyRzVCIBKRoxhAH9ZAOYBc+GblofghpLek3y7hal6JpgWNnFDNMQuzwjre16xxXM
         iGug==
X-Forwarded-Encrypted: i=1; AKwUvBxXyDuVKq+O9MWRhmJa6dGnfUO0GTOalFikUw3WLly68PfhUZ5OxRMhTgqxM/PJxwKxR727tkfOsKR4@vger.kernel.org
X-Gm-Message-State: AFuF++nksEcu5HBbygREpwTI/oAdYCFqFBAdFviMuTjYzITQUuvQIWYW
	f94wPDsoWnj180fnQTw581qbBryMn/LpI17NGfOqGVaxiByXAvw3oHyf
X-Gm-Gg: AYBFou0RdoVzQb0/A6trUHtm5PVor5j4bHRm6z4WWbk2e7aHQ7tgeVdHXCFhVYEimEI
	+LkXv08i/CUBYVa6YVvmacZdfgJqWrN6DLPOAO2ysKOpWRwhHHgnGvDu+CgDbMTN90P4tV2PDTi
	TTdZgQg6tgCPavBWMeAUrCPg8iq6be3qFvoZ+Cof5BN7jAa9L5xMuY0MX/nD7XtuJIhA2DhFAg5
	MO7lqLk62046utlkxhDSGJCDjTo0oxAXh3MjY/sdO2eleVRKcdFEM3ptNXbatTSFNqFw94LYhFk
	M5klqmpCz9/bRx0fTdylPhNo5q86cMZ8wpYOrywb/JlT7F1FQWuHE/adPQ9JV6WL+b1ZtcBU+oI
	EFk5TmVVtao9m1diNrRmMpAB1sLxaLgxpvJxZaHp9YUMj6lEVEEF3O5yQzmLzbIy4aLfKEaQuDb
	W6ugIRbBBvGQRWeSDm34gRAO6Hq1wBW0+aXmUTWBfgvHyKJO9PrOfy5Nv4D7v2+ofWvto3zp8Vn
	+khAJM+Hzoewj88jDSTGUq2ZA==
X-Received: by 2002:a05:600c:548f:b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49e7a67f688mr27341065e9.32.1789385706603;
        Mon, 14 Sep 2026 04:35:06 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] Introduce basic support for MR-NAVQ95
Date: Mon, 14 Sep 2026 04:30:08 -0700
Message-ID: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

---

Changes in v5:

* changed "up to 16GB of LPDDR5 memory" to "16GB of LPDDR5 memory". At the moment,
the board comes with 16GB LPDDR5 memory with no other options available.

* set sdtout-path to "serial0:115200n8" as suggested by Ahmad.

* the size of the memory node was left unchanged since there were no preferences
stated in this regard. The bootloader will set the actual size.

* link to v4: https://lore.kernel.org/imx/20260909153943.1048-1-laurentiumihalcea111@gmail.com/

Changes in v4:

* added missing "memory" node.

* link to v3: https://lore.kernel.org/imx/20260901131918.1189-1-laurentiumihalcea111@gmail.com

Changes in v3:

* use "gpios" instead of the deprecated "gpio" for the "regulator-usdhc2"
node.

* fix issues raised by running "dt-check-style --mode strict". Note that
"dt-check-style" still reports the following issues:

[property-order] property 'compatible' out of canonical order [...]
[line-length] line exceeds 80 columns [...]

these'll be fixed by Krzysztof Kozlowski's on-going patches: [3]. Manually
applied his patches and dt-check-style seems happy with the DTS.

* link to v2: https://lore.kernel.org/imx/20260827150657.1657-1-laurentiumihalcea111@gmail.com/

[3]: https://lore.kernel.org/lkml/20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com/

Changes in v2:

* remove the "pinctrl_usdhc2_100mhz", "pinctrl_usdhc2_200mhz", and
"pinctrl_usdhc1_100mhz" DT nodes as they have the same configuration
as "pinctrl_usdhc2" and "pinctrl_usdhc1", respectively.

* add "bootph-pre-ram" property to all nodes that were included in Elena's
u-boot patches. See [2]. Note that "imx95-u-boot.dtsi" is still required
for the binman node and for the rest of the nodes tagged with
"bootph-pre-ram".

* link to v1: https://lore.kernel.org/imx/20260825120812.2152-1-laurentiumihalcea111@gmail.com/

[2]: https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629002.html

---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

