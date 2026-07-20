Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA053D5235
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541836; cv=none; b=l5DXedr9hQIPy28Igsg5j/HNcAj+tBsYm62wketFm7v3+yQikGLpBB8tLQ7wynG5r+kVV8gpAPwd3GPRdkH2BrkG/eHjfYvur3nVntMz7oqr1zENBFr3Ij/kUrdwcyG2AIUuPVDUeALlf2/AB7ZW94+JJixo0tBNjRVCImFb0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541836; c=relaxed/simple;
	bh=DcGTdIxxHhbTs6sQAkxh/DkstHnpmsjXNhCqviZV2+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBifS6qklqu8iXX/D3ReuwveZ6cEiKBCkCW8Gm9/Acv+Epl8m8UIJYfDmYFy0KmuinHEA7QoX4bo/dnGvuITZqSRpvWED09rAF3fMBESm/VUrQh0eGpZq/Sk2m7Gn5aftvegXknHa6A6N3n5hjir5fimMVxTodprb+l3Thp3cXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=DA96k81v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="DA96k81v"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955adb04e8so7371865e9.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784541832; x=1785146632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTEJaULwV6HR2VMaFDo690yCo3t+jlIFb3p4SA3HlcM=;
        b=DA96k81vImZPSbfQQ3EUyM6QeMDIkiiY7ND7y4QFNE/PJcauww4lYF2k7vI7WLUJk9
         C7JvsvYtaZuhuwI0cTIFm9pzwiHn1SP5KDN0rjDv6nVJYXznhGJ5SMrBIrnzl6wIae1x
         bcg46htW9btTIxWzJHZmnayL/B0TBU9yQCmM7R8x+0Ew+2FPjq5BPH3KllXCxjp3LN3c
         X8yxZD73q88/u7X192G2O1fCwGXPxglPtBGmsz4luKmfl4hWhAJMya1XLTo5r9umEXYX
         H6NSE1De+y3sFQlLeqf94PyIHPd4mS3X+Hl70GLyNOQZa8Beyeggbp+Buv+NkI/s5fWz
         Nj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541832; x=1785146632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTEJaULwV6HR2VMaFDo690yCo3t+jlIFb3p4SA3HlcM=;
        b=pmfhJWTgjfnydsCfOUk8NY6najaXRmUcFeMQcEWaMxQnK3LDFYXVRY1hDwgTuZLVDR
         PSWaz+PCsZaicWcVlkU2PrpnLKntxiYB/q9drvUU/jod/TafrOnuXfL3nrLqqEdxMdIa
         uecOozX6Fi1ZC0wRbJdaxh9wDZe008xwpe+Nv8voFiCGVs2Xw6Yluw391t8Gqttj8OjD
         Ro055LJC3GHl4//A0MJz1n9btN7lv1EBcQ04an2V7l2x33Kc6T4bOo2MGcb27MY60xJS
         HibMKuMXJnRIECZZ43agfF1V16JKKv8aTR685zvxKyP5QiJpu+Ph36zY8YVrKjGTNnui
         /3Gw==
X-Forwarded-Encrypted: i=1; AHgh+RrSpry7+bRA2u1YYB01YyW/8wRr3xu+O9GNx0rHlwziivQUmNipj/2MZ3BoQc1k5qvSZOcAu/v6hdbU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Jt+qBC4QqvbJHK95lNM+XJrRTKH1a0B9pnI3Y2rrNDoftytn
	VT0XBuHtOLT0yeM2wp2X/kjn1oA12NYtVJtwh+YGNt89SKXfHHJPQCY/rutyPcuS9fU=
X-Gm-Gg: AfdE7cn1uQoONmLbRfq/9di2m4hQU+WIq8En1OYKON6FTQbJ2vZ3tssi0zWVyna6GM2
	fJ+hvvX4QZArfrmkO0dnrxBY2s777MINK+QEACJiv/HMPItBLSLY1YbkHDUdgae1bVAmotf7hZ0
	kP8Tper98qOfCIFZ0izX+0vsEevg7uLgUbj0z6IDShGTKOfOq7rf0t+N++QxEOWWeqDIFwfY8Yw
	7Cb0x2V/i23gwUCuttARwxzA4ny7fdPOFvzVbOLHPMgP6MF9fjfZv4Y0HngALXBzoP3aK9z2niW
	/LDib/ihvdR4Oi7Jsyi+JaKv3CQV1EbFE1I/xec5QYqx/7sVd8paVK9QA639xz6hYJhaPps0m9H
	eUBYs1/KZmm/70+gOQ5iQvdRMypM30F5QILxHcptZ5cp1ZWPOlYUla+3EyhuuqMib3z3nk+RSOJ
	U/6nqRvOQAMCmrMwkR69tRzxkJ0KsV/J0fEFH3uGsZVjFOOktEzho=
X-Received: by 2002:a05:600c:4fc9:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4954a3f3b28mr152405875e9.16.1784541831801;
        Mon, 20 Jul 2026 03:03:51 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net. [77.197.142.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495516c68fasm191854485e9.1.2026.07.20.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:03:51 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v2 0/4] Configure SYR82X regulator modes via device tree
Date: Mon, 20 Jul 2026 12:03:32 +0200
Message-ID: <20260720100336.62004-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SYR82X is a regulator that supports two modes of operation:
- Auto-PFM: Allow automatic PFM during light load (default mode)
- Forced PWM

Some boards require to configure forced PWM mode from device tree to keep
the supply ripple within acceptable limits under light load conditions.

SYR82X is a clone of FAN53555 regulator and its configuration is handled by
the fcs,fan53555 driver. All clones of FAN53555 regulator share the same two
mode of operation (Auto-PFM / Forced PWM).

However the implementation in the driver is currently restricted to SYR82X
as it is the only tested hardware.
---
V1 -> V2:
  - Add missing dt binding property description
  - Naming changes since all clones handled by the fan53555 driver share
    the same two modes
      - dt binding header name changed from silergy,syr82x.h to 
        fcs,fan53555-regulator.h
      - dt binding header constants changed from SYR82X_* to FAN53555_* 
      - fan53555_silergy_map_mode() changed to fan53555_map_mode()
  - More detailed commit descriptions

Victor Krawiec (4):
  regulator: dt-bindings: Add fan53555 allowed modes
  arm64: dts: rk3399-rock-4c-plus: Use device tree bindings constants
    for SYR828 regulator initial mode
  arm64: dts: rockchip: rk3399-hugsun-x99: Update SYR828 regulator
    initial mode to use device tree bindings constants
  regulator: fan53555: Add support for mode operations on Silergy
    devices

 .../bindings/regulator/fcs,fan53555.yaml      |  8 +++++
 .../boot/dts/rockchip/rk3399-hugsun-x99.dts   |  3 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts |  3 +-
 drivers/regulator/fan53555.c                  | 29 ++++++++++++++++++-
 .../regulator/fcs,fan53555-regulator.h        | 20 +++++++++++++
 5 files changed, 60 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/regulator/fcs,fan53555-regulator.h


base-commit: 62b9452f5fc4d007f1ea31cfdbb53a96d91e3c66
-- 
2.43.0

