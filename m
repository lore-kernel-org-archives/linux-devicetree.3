Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD709220687
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784165329; cv=none; b=D/SWpNqvU9l/Z3vGMEeZrrK0WqPshmWarBcgNyUL7DrIgNyjN3ce/5hFvH0q3ViPPqNeSdzY4m9vSauwq1KwxFps9cJdSz7zyvlA0DFqyZY4uV6+O5J3RWCixcWg0/NE35WJET+1cIndYi1juWS7CWclOkoVavs6Ur/gPN21PFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784165329; c=relaxed/simple;
	bh=b18HA00HMCgPFn6mr4IF4N7yr2m0uwOUr3w0QdxoQUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSMy2IJ6rhAenrhxng2v23CU8xtz5MMbOuRnq5HfPHvQ6ZRHC2oCqfcKpjSdpq0yCZThGRes3RUO92GWA12mHsfZTiR/6ZZrzKuPWpVJ6gdEuyiXiDMfV5c8twBW4YyxU39w3/D/jwjTNPSF/03I/c1qjBmnPSN1Erbllw29O9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwUyIfDB; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwUyIfDB"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2cad83a0aaeso26048505ad.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 18:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784165327; x=1784770127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1GzXJ02dC6eKcnmPc9kbjsM1/1xWfof1/6ku+zNwhw=;
        b=iwUyIfDBhT1/R2UdnMmEV6aoJmRIgDIyO96CfQeoTF+Wtups8TTCd14Lnnfd5d4Hkb
         J0IzSU90tVDJVhfHrJvQX3p10NRdqjzEl2oUkQ9x6yXAKQvfmf4d8yIqBKDyD21izWJT
         fQKyuH0CnXX6TV55soe6GX1fSNzjMlvge34t5/U9Kieia72eJq6iEYsjH+8h5bWPFnUX
         ID8mdEBiVUJiNKiyxiA1LJpbUTvFPwJyyHaa+jMK6eL4oCUbWHcmGmE3wIm/UOA180Wi
         WgkVKmMHbiZNkcsDHuR07LtfN/GEVltA6vy3kyyK1EoNw0wtJowIOvFfrVNUqUvyxP1x
         Ob9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784165327; x=1784770127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1GzXJ02dC6eKcnmPc9kbjsM1/1xWfof1/6ku+zNwhw=;
        b=PlHb5RnWv2BX/uNB8jacwooSdnw480Y5Ve9FcU3/WPoVedKBoD4Kvr3Ubw8W5iBlVF
         vudusp7OP0G4+XcTkcQjR1JHYco/JGRoUMBF315BRYZ9EHP3DtPIXlk/h2RXgi7an4d1
         gksuVzKtUErCjpRUkpo/gfndMfsHQbn/X4CRdPIphck8NzHHF2rOOMJFDBQxwRTr8dVC
         LFjC8jrfep84CLgK+2okjoN/3e3NArvGfHKG57FTTLI/cNfxWi+joVfq7OjromROXNBV
         ZThMd2AXa0mxwUi2cfcW+7SP/+uWF2RqnBkcDME/fFKuK9kBPfDsw2MxtY29IRLowft4
         o2HQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJsmjUrkyefhZCJTWakgCYixUnUsqxVs6gz39IeHT9pLaUItiXTgc3YRiCRsmN/Tq/XdPX2yplOMV8@vger.kernel.org
X-Gm-Message-State: AOJu0YyaLg2fSITvyfVYSmC0MxOGzJK8dduVOc+LV2Xx73nDg/hv9Dmv
	6vuGTAFkkj7/wZqqEZJsET8prpPcQ5l+MOi4OxchDXG0vF8Av4FzbYHc
X-Gm-Gg: AfdE7cn71b3puCaCoYgl7HPrxrR3fGRby22JIxnRxrmqdrCb+eGpgH1Jb6SgPr0dLn6
	XZbeC/zjMOq/6u72rGlCBJ53gF5f5Q01tYrEp5zcv01s69LciTjgAo7IiuuYdQ9Y3IWQoUvR6Tu
	vTbgp2uuUBAt922zu10RfT0TXXdSL8KLXBSFmWmTxv7E6Xb4U+4kx4XOJmaxHZ8OOn+9tNk3TxT
	2oYg9JSr8RHOJev4BsYrqW7f6n354FRiiUgMt9mNYw5POokgM9gyuMXkzlePeEgXNporfgpSdDp
	2ijLRURySJl7HvQJXhUTEkSSeM+3HLA/I6IBwHtal80X4DFjUiMjezhXi28roXcqsztyKh1Q/wx
	nVYkHW16KwN4VuaVkU3fNff5rvEBU/9j+uia9FpcOxhjRFJq513zqqHfa07oEiIXez9brDLO8ka
	bNEOKa8emlpmfhGWRoYBomGEp0V5yX7Jd1zJo3ey6+X1M7xHPumJYMlm3fwMdmOmg7ez+64g==
X-Received: by 2002:a05:6a00:181e:b0:848:587f:8ac7 with SMTP id d2e1a72fcca58-84a559b116cmr8011830b3a.52.1784165327355;
        Wed, 15 Jul 2026 18:28:47 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:3ca8:26ce:2345:363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm3901362b3a.23.2026.07.15.18.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:28:46 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 13:28:36 +1200
Message-ID: <20260716012838.2353939-1-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
its CM5-IO carrier board.

Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.

The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
reference clock (clk_mac_refout). Enabling it for RGMII needs a small
dwmac-rk change sent separately to netdev [1]; the clock is optional so
this DTS applies without it.

Tested on a CM5-IO: the YT8531 link comes up at 1Gbps, and RK806,
HYM8563, eMMC, microSD, the USB3 hub and PCIe all probe.

[1] net: stmmac: dwmac-rk: enable the reference clock for output mode

Jiaxing Hu (2):
  dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
  arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 414 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 576 ++++++++++++++++++
 4 files changed, 998 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

-- 
2.43.0

