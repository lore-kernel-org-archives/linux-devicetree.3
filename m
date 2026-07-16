Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05143E070
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222280; cv=none; b=Ha/4xrw9y/G/mdJ/0+lWD2ZQoqiwCsCkKw762At5+S8wTsB6ft2w/jDTwgOL+yj7akDeAcVQHoK0pF1MYMvXWmw6oS4r0MrXLO46TmEV516BthKbB5fn14BTjHETIrrW6TS1PCqR05RjK+CIgyp+rIl7aGnSK5bAFiK+Z6TZVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222280; c=relaxed/simple;
	bh=C3uQ3uiN7BajvYBUPArlf4lAnkFjTThYqlRS3waqqdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaIuKx1XOyvG9vwleL80GwP+cMhh8d6IsyVp5m/QeCBWEVjfPmYBUVky1aSiAJg0Vxs3rtSoT7DqBnnvLwk5ipLeSsWxivajalKf5xFv8FF17s9HPz0FgzdszJW+MzsgYPo0ODWJSODgSPbDe8rfGBu7BHE6igBfudVAJ9v98b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTc+eSqr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTc+eSqr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cac59f8b64so80968475ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222270; x=1784827070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=gTc+eSqr57Hschv/DIMenSbvYQiKc5G7Q7y839vp1njNlLgxfCNV9FwjKJ7PSfsytx
         +AurB8L748MJsZ8FnqkyXzrVJMFdj1DXkd4rXIoPxWDQWvURE+KcxMvhhLI9yw+Mz4R6
         IzvyyoKiYygr2DohbI/mD9HVadJ3K6Z3uUStEvVJ9dsg9gt5ZLMPMnmd/MwVRUmZDMlV
         mw1GspW4xUBtElvTsXsk89SbNpE5Fz0rgwb2SWlfabqojV4YvqLVQEfex988r3dWA4DJ
         C0+BCdogRD6xFk/9FIvhzJXPa1R6QGRcnmcSVJssX26wBWRRsON32yO3YT5TvDMUQloV
         AmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222270; x=1784827070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=XrOrSBrIIbJA23rYJol/DHg/qwygNLYQAlNVMj0RFxHLutrqUoeKG/bXcCRsJbfS9O
         C9HcxJF24e4tiuD/Xeio5tusN7f9Zr1Mura7yEWDRqlEAvEFsO7ODzai67MDYOEkoFcw
         qBqVtYxif5Kh8s5O1I0uJEAXMn3HLFsnimbUuCURqyTx9mlsw4L8oCvArnMYjVa9S82g
         cwyAq4vBTGiLF+tqG+wtkdVPaSi0C8X/ZEQpzjcE3ctxETRFlkoNb5KFi2WZ7VQ7NxT3
         PbuPqxiERYzP5V5nccDAbosB8T2YlIxzsElY9nwHogHV6ixhyTie4G59jWX7LXXNiKTY
         2u3w==
X-Forwarded-Encrypted: i=1; AHgh+RoUhAbbuQBD8Uu0wn58LkPUf832MVOLdLPpJrErH/TPDFtETawzxSkk1sKVB35Be0FwtpkmytyVqw+O@vger.kernel.org
X-Gm-Message-State: AOJu0YxlNtLbqoJ4IpFIN6NiMmYNgVYiDDSaPrEBE6882ZJKgyp1t/ii
	qyuyL29jsaMSF8kRt5Xm76YwTtm/gEVo2yrn105IMey9oeNSd4OiuFEN
X-Gm-Gg: AfdE7ck7lbs36CMdEvYu9csNxJ+fKvTIbL08ABlr65fRVXVtAVrGmR/MZYVI1e9/WMG
	UvSt4mAStVpnk4GbHaAdqnY9zXX3+TZZSCDeclyZNAOCJQqKTrnJBUOQmf2xS5yOxsb3qXI2lNI
	OqtuBw4fksI4kmCiaptf7jmkCaLUChh3oh6cmw5N7iDMx81Sn6H47wv1eLbm1d/LWUVCCfjEoWC
	AC/bwc6eFX9zgrMCsRyBMh+kKdLvJoDLCHKGZ91SNgXAh3wdY89tC+noA0nKuDFXgWu8HkfynGq
	i/5LlGQrwGO25eM0WPz5TBuAIF+s/br66VCrF1/sDDeNnHtrjKtLeyuKjSrhmgUnxwCU//VfIrH
	xvPyyMYCYC8MBP/r6peOVM0lb5zznq6eFHXsWzk4hcCtq/gcOWeY++4XLZUodAIIn0on8S1eCPY
	8UTLs4A87e42hH4r9TKiMk2KdpnvE1ObWSBg==
X-Received: by 2002:a17:903:2ec5:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf03cef19amr85530865ad.21.1784222270259;
        Thu, 16 Jul 2026 10:17:50 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:49 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
Date: Fri, 17 Jul 2026 02:17:30 +0900
Message-ID: <20260716171733.300885-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for MediaTek MT6589 PWRAP and MT6320
PMIC which are used together.
It also adds minimum compatibility string for MT6320.

Tested on Lenovo YOGA Tablet 10 Wi-Fi model.

Akari Tsuyukusa (3):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
  dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
  soc: mediatek: pwrap: add MT6589 PWARP and MT6320 PMIC support

 .../bindings/mfd/mediatek,mt6397.yaml         |   1 +
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   5 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 292 ++++++++++++++----
 3 files changed, 239 insertions(+), 59 deletions(-)

-- 
2.54.0

