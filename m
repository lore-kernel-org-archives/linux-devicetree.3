Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5928E35F192
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261488; cv=none; b=hy5WF48Oq+z70R6+TjbiXcq8p9Yewn/AxlgSTn3k2A/rS8QhcZlD2uheyLC513mNgUd7cLAn0QOwseo7elKMwiIOqiu3JfjN27jBgvYCXC/+lJ2mBepNqGgBhwc4acy6xnVpdCFav/vTi4W1MrXYSViTKIrkES3D5EZ1y1lRc1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261488; c=relaxed/simple;
	bh=j5aLZ0bQ/Gf1GYmI3hytmPuG91fCyx2+8V1l/Gvl8tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLS3MbMxkgNBU61eIhJUMrQOr/bOUUiUWCJXqbZWEk3DzrKYLFBvst6xxctBW/FCtAKJu7pNfxe5FzdR4+rSCYAhSZnYliQSatn4ToMy+nPpm73Yprz6i/2+ZDXyyULqGlfa1zEuVAAjcn6lF2bLk9UXFmDHa1vbT0cKDw0J+Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTOrdszY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTOrdszY"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso6630265a91.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 20:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777261486; x=1777866286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=ZTOrdszYArogEbP2wp06bvIccMhoFcJZ9z5L5v+W1YdtMxaoSFNhkHefUZEhC5Y+Hj
         J1bGNc8Yv2fML49i4E04dK5z6iJTpQiGqmKeznOIw9n3ApNwg9r1jv9gPbEK5r7FwTm9
         m6q7XOPlnnyIgQmCy+tI04sxo56qLduPp67+Eg4gYizHwMkVuwLMUlaEDVTrYCd2s6iA
         C6Mhj20MeKFUtmEsrQxXW4VORaLWpFp9CiCYa+YySpp0AEbIzIEGUq6sStzXqn2OFLXK
         A/I5fyRQlEUWOVjE91zGf7Ry1/4R//muyw4lEJTylSATH1cQwii/8HfJYB/f4rP1AB7c
         8F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261486; x=1777866286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2qzCgeGAG/9ExzGWv8XT18Hv2KRSoOvDRLW3k4Gl2g=;
        b=VGwArgGDjGdj2b1gr0vIHa3jgsUJyZaYxee8O2ZtuYdLUZpEl3GfM2ft4ZOg+DZk/Y
         3OwJiTwl9NdwqxHhXrGSZ0dlHsQJgKBBO2i7OJe0ofYIf2JLtMNqu6BXIQeJhc8T2aFh
         oguJjLyZJnLbDJK2OMBhu3YMULxxPemZC/+w9fpSr3BoKTVAd9D/FUt/+LXBM3jjwlGE
         UTXi+kI3QImMKd+ZrxF4YUghue42KkBkC9GEmJWZr98UXGz/hjEumkIrwEyDtHxsQGkx
         rKqAs1hBkI/DLgSh/92lWR2D9dYxd5omDifn3pVTRaPlhY2tM5asTxM8bSWKqqB/158e
         u7CQ==
X-Gm-Message-State: AOJu0YyT2+GPOTyRhAJEeobNlEofq/qDL2/xl2jy3vASNepVUoRpLbea
	eOO+9LtIJ0qXdYcKm6Oso8HI5RuFgogk2Q1CLzrW/Hla62a2Zgoi0TNqj1Tcxw==
X-Gm-Gg: AeBDietQgAlef+OkkCGBujGw1y/23SIPvxA8vbYfG2vlvg5eMNGtoWdmYwSJi0MBmk9
	GUGSYBvyOsR2iUNlP/OKWSI8mKTB4aApH8fVgGLKyvDwzp5qoKtuip7+X9SXoICMyE+astJLHNH
	oxu7RPO665mSRSexJ3msQt8Wp2WpG+Z2U3ojKcqNtw+vn2aRPkxlxhzfc/xJvrueAzlvX/eTaLO
	Fq5vncg/9XD9jHDZ7Ib4VfcKGhVANUwzYbvmbk75OEdN6dazU7NOWH6krc6kY+92gavBCEwR1Qu
	5olDBsxVJuHQBsspHmTY7ghq8srI28TGb6mZWZIejWS/IaBhmpmXoUuSltOsxAq/0Fk2rODh/0G
	/aRh68pwwf7w2wfxu4lXvHW5fSEpaDHwG4dxiSOVB8p/QYgZbrIEPBcPyQflCrwYMdVHkVxsENX
	0zZljMKQA2msmVci+60fnySD4W626g8Ze/Hhju31DKn0u5mb4b/nbRInLYVZMOnqc7EuaQ91e10
	h4S8cNtQZTXR84gyIzbTOyWQQ==
X-Received: by 2002:a17:903:1ac8:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b5f9eaeba2mr422778205ad.13.1777261485859;
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm290610585ad.36.2026.04.26.20.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:44:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-wireless@vger.kernel.org (open list:MEDIATEK MT76 WIRELESS LAN DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mips@vger.kernel.org (open list:MIPS)
Subject: [PATCH 0/3] wifi: mt76: remove mediatek,mtd-eeprom
Date: Sun, 26 Apr 2026 20:44:24 -0700
Message-ID: <20260427034427.881389-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mediatek,mtd-eeprom predates nvmem which is used everywhere to grab
eeprom and mac-address data from MTD devices.

Transition the one place to nvmem and remove the binding to discourage
use.

Rosen Penev (3):
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: use nvmem for EEPROM
  dt-bindings: net: wireless: mt76: remove mediatek,mtd-eeprom
  wifi: mt76: remove mt76_get_of_data_from_mtd

 .../bindings/net/wireless/mediatek,mt76.yaml  | 19 +---
 .../ralink/gardena_smart_gateway_mt7688.dts   | 17 +++-
 drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
 5 files changed, 17 insertions(+), 111 deletions(-)

--
2.54.0

