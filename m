Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EB927FB37
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845621; cv=none; b=dY156A2oDNMdQvvoyJMqy6aMVHM5rJ9nRkGuUnG5JAzj7iILs39M6n7DverTGZd/Me0TZTrh1dv26qGI3QS/QFWW7rcJaHLs3hp7xawpX7nSHLypd7owqZqAw+P8K21u8giUHQgKLkiLhxH88RwgzD5sd95jR1BUk40c3t79uPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845621; c=relaxed/simple;
	bh=80jOVn/onXuubNhm+lwLkEGdgFG0fYxEx+qYyDr+7jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qLBQQr4gdlrDLoR/XfHdWyH78VyD7gi7dlJNto9LYPEBAExf9hsdPKuGYCeCO3b9hpa1i3Eht4kEphStjumrsrkuVOsEdqxxSeL/+6JJDPsBREL62XrKFqFvszgxwQOdVfx1mLZhJGKpt2K2bPK4rdPtnSG1DLRjt+F/kbpc2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7KanC7J; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7KanC7J"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b900f350fso3257106a91.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845619; x=1781450419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5kWWkkdo3WKtqhPQ9boJOMkvS3YUTklzOqUSDI8uWAU=;
        b=p7KanC7J+6wPBJM3hVXeNYvBO4rVfBM3TCDnR2bp7RZg8O0MxURpN7Rz1bHgywyN+p
         KBmCNY3dmikKwgl+RqyDGMKdqiPJM3F9j2jn2v67iv/ZQAPDPanOH0hNF3zEHC6QYziY
         RuoaUzJKwwxPccna8Ss/a8ZIRZ124cVcN+HlJB8Ayy8DAzyDN05IyL00Rks9M3pvdE7K
         OprnPxgPS6iFYNx/qawSK7L47S6NcLYDLJsDQLmSwC4wJsW09qtBC2o9ZMKkaEyQlR2C
         q5uc1FC9zFDN93XI27ZJN9kXz9BWaPVDwOM1OlLaTurRGTwZEuJ/iX0yXd3nJQrDrvKF
         XzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845619; x=1781450419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kWWkkdo3WKtqhPQ9boJOMkvS3YUTklzOqUSDI8uWAU=;
        b=Iuy5nn6llqUXVwncy69XWaQ0bnBsXXGOWcOVRiuTfjloQzPCUVFM/F07xXaJR0+O3x
         1DwScKfSkGPuY0WbbpydzX0KF1zxqVdvDxJZZLOpvzs/VCU5HSDGjHKLA8J9i6QaU0nA
         HQkX3eT8fBp8rpBwAoOZ4o4Fv+5NJLP+4uBmCkxe5FP9CVao7ZFJg/f2bah02CkGX6Eo
         5wIdY6pNqTwqNvHd7JlwIkGEAcxP+jXIukY1zbfKiVb/dM904e+xafXnnmbTa/dseeak
         WHkJxRKO/X8hDy9WMZtrdfKFAy7e9lwT5WW2RTYr0vsREtmq3Amk6vZ1It7W3vT+5Thu
         rOrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wPLg1r7KywONBB9PeFcsKScFH6XlujBFcl0yvHwmimBdw7ibd3/v5iZuCbUKz+Q5zWCgxLZAeLAb5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb3ZDdvL0NdiCY5p0J0t+JR/vkG0E2zwPn+V1KIrpAMdqau1m3
	GUGV57pCQ3TMpBrDd6Zj2yoEdT/bKBpMKlYO7XhVKTHTqXU3uuK6kIqG
X-Gm-Gg: Acq92OHUWcBB9Y1uhkWA8Hg9LJCJPXkITt3OaGNtxR+2AGBXUZE9KSchOYh/hMXETNh
	0o9uYZCInZiT1jKSci9nKrCSG+CE4KN7986w62L2MBE09w82VPBghaRr63LHv8fXeW8ZvMoPzXH
	rll+O+TGsKoSlwPHyuKYvP6MH4K2TQc4ia1XNLxcb8dn+aAAdRjGi1rJHsvO5youSDnLy4W2jEv
	dDIH3ezv8KmNv2hS0M+ushWbNN8iVvCwWIrvPQbZElflWz7qRxmRe8y0QIXlI8+/RJG7yqboFTN
	SSzbjEOB4zQxTxT3JJtGzK8SFZ80C3VwmTh9vCvRySkojTbUoC37kOLbzDU7rNCvUgUIa7bfkLm
	F0Acg3821kjO3iDurLzTsNnGc+OKMfEKhme8dx2FVEzD8M6oyJ/ezyWFdEFa7+CFTc4lLkDM5O/
	EkiF0Veg/K8s9QFmzatd9APJDV5iRe70XDs8lt4FummQqkxCz4Ow==
X-Received: by 2002:a17:90a:e185:b0:36b:95f7:564e with SMTP id 98e67ed59e1d1-370ee344778mr12660936a91.2.1780845619092;
        Sun, 07 Jun 2026 08:20:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v8 0/6] leds: Add powerdown gpio for is31fl32xx
Date: Sun,  7 Jun 2026 23:19:56 +0800
Message-ID: <20260607152002.446617-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

Patch 6 resolves regression caused by prior changes,
and fixes the 22kHz PWM output functionality for IS31FL3236A.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v8:
- Fix code and commit message style issues noted by Lee Jones.
- https://lore.kernel.org/all/20260520135659.1430008-1-jerrysteve1101@gmail.com

Changes in v7:
- Fix code style (spaces/tabs) and commit messages per checkpatch.pl outputs
- Link to v6: https://lore.kernel.org/all/20260520133343.1423946-1-jerrysteve1101@gmail.com/

Changes in v6:
- Add fix for 22kHz PWM output regression on IS31FL3236A
- Correct typo in vendor prefix for Integrated Silicon Solution
- Restore hardware shutdown state upon driver removal
- Link to v5: https://lore.kernel.org/all/20260508131139.1523597-1-jerrysteve1101@gmail.com/

Changes in v5:
- Adjust the unit-address in dt-binding to hex addresses, and remove unnecessary if/then constraints.
- Link to v4: https://lore.kernel.org/all/20260505145354.1267095-1-jerrysteve1101@gmail.com/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (6):
  dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
  dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
  leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
  leds: is31fl32xx: Move pwm frequency setting to init_regs()

 .../bindings/leds/issi,is31fl32xx.yaml        | 187 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |  34 ++--
 3 files changed, 210 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.54.0

