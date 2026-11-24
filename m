Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547632;
	b=fL/wVplImTZvOWnYkRA24g+PxMhpIRcSKz42T0JKqIsoMe9EElQWg4WbiBxdP76by7ZZ
	 FDuKrL+jEWHgnRIeXq3z5ArlCTzbjJsv+lliyQcQyhH0XVbYc4JP5C+2UF1+xyEKJ4zpr
	 qK1jR0ryU0mgHNiLOQ0NsBHloGK5NgQgcKZoLOwjKCIg6P2wQsNOzFg7Rs0s0mMuBR8zH
	 zZ6AYfTR5I3OJB8U8huGVroagUTyTlx8pBbHr5jzxlj0NEHK/FE/Jb5HN43f+hOnkjD1W
	 CcZOVeFwGpdxZrkYdun92jv/90rCawhkI4a0QCmpixUzbdQyzMdPBV9iXuFRSDRXp9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XeNdzIttNMTE0MJO+i5BOMI8/bNW8dsc8julRJQrMKc=;
	b=QSgbXXhBSaWIivEJV/ekpd0FjR+viSwLn8NOvsNw2BNbcF7VTNRC/X3Rza/qa/cmxWH+
	 xPblQSI9P48r+Sh7RRBta7WHIfRddMZKPS8CQLAxpbPxVCbd5nsZ4fe+UTvrD05wanZxN
	 D8SKRoDd4PiIRrB8WcuHAgldMEf1ePpcmB5FcvD7mcNsiYI+foIVoHAE0v6zEmJ2G/wLr
	 KISGnBfg4Qrs9lt5q4iYcfGGaNcO04BUBHEshXv5vwKrxMnfakjMuvy0ai5n9+Hb0aQup
	 ve3nBpshpA+JzO9zu7SeUM0ElWtIGysWPYcM5mCcmLLaSP2wgW0h+C20UfUzdbgr0Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLkts1ip;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8264606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8264606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLkts1ip
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4adf4431ca0so1209675fac.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547630; x=1796152430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XeNdzIttNMTE0MJO+i5BOMI8/bNW8dsc8julRJQrMKc=;
        b=cLkts1iprVLlgY9F+WAkIn7UyO2Lkr9VzsxUclyufbtEI1GTf/GdU9TUzrwfw+Q4jB
         7jVIK4tVXYHUr28akTYoAfrdbRxIT1W8imb3q21ogLZ0/M3sV1pxyY6PQnfrfrdQ84KG
         q8aGxP3bB2LY1Wc02OeJpAuqIazw3RisdacbYmW53Cuq6pjbB0SnJlfbzLeQUIwjWQlf
         qewCLwXQvYcS4DIGZiEhmh7dCwUzVIgjiA7xOAvvPib1s/Js49jQR4TeRrMg/olqLArQ
         fVrR2xwDIKBwYzx6NFBaQqagip/U7eBEUI64MZ6QGWxeZwVaOL0Yy/T5j9QjBqt4p/3+
         cW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547630; x=1796152430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeNdzIttNMTE0MJO+i5BOMI8/bNW8dsc8julRJQrMKc=;
        b=f9Vsn1uOsWS4SaJV3bJp0ZAkwGpS0pa2zjIQ5bDo3pr7lsJSaauIg1U3x0mCjq84XB
         1pZHQCpYOGMO6y9mBaZwykv3sl77alBaQZOuF4zqRv4AT75qoYyHP1vpaDJ5fHBx/DXx
         eRTYrPotSOXFCiixCi1GL8JQdEMGSME7JPqGeMeprffLCu+Hg92PExRnXtmw/IMA60Mj
         kPLalPPX772NZ9Y01CHrjXqlIn+jpTx6zzi7iCkeB8dwuUnX+6nD1ec/WFr67PTQmpTa
         fWEsq+oqczWh7NxH7qSohx0QsGhBAXVaM6OdolmG6wKYYJgW5lLIktcZOUoOqJP17Pw+
         msAQ==
X-Gm-Message-State: APuU4Z98g3D5yC1zEk4hp1+YbIGLEtdke9Xi35N0G2tutiwdx9lrT+TM
	fXjpZGesHx0sFPE4DrcPe4yfyMtJZphcZI0TSPmngHk9isbXzwLaK5za
X-Gm-Gg: AZFdTZeeUc8m4/xlAY3vPVJcqdzzeGEDrd+OodqOVWmAH2SMuz2xDPlGarrqlg5AgEe
	BgTXvP9Aec6I7HTUNvrnQYlic6Lf1kRrXEzt/hI7mIbZ3xwTIX4ml7ROppFhj4XgbcoYtEnkarO
	eUn4Sf+V92ZQ0ILrnALa8ANkjpdWn19WnkYXVLtycjHpqqZ0xF/RGWFMjrhV6gGqVD1EAFfWC57
	aNydabudSwSWYywWAVwaikKPL3JzJ6uURoLlHBjYGWT3Kv2lAjVGBHzHFMTLi7lPytAs68tf5gm
	LfSOPOjmoRhvqAELSAsVWAZdD/ytAIoeaRZ/szk4GDdO+MTeCq0ITCr9NJi5Zb4mNmBYY4WXOAH
	gxWSq9PxU1eb4OlQgMzuqQuzUIafq4UZj1VesY7RY9lBe+5ONOJr/k1BxShT3VfZisC56GJoB11
	i1NnnqoGEVJpHpr5Nj71vutAFP+ftWHjHspcRfZY7VWB4QoRvFYBp4KM2rhOGwk2tC/VbVZV5sr
	bmM1ZSQ9/G+B+n7lu78rW2DEfSSZKHCABRDsGC5eZ/VVQ5DkZi0AlFNdj8qbvoEVqx86gygkCaV
	jKln2gYP+FTiCWqr0Hub6pBdgtv6Jfw=
X-Received: by 2002:a05:6808:c1d3:b0:572:f1d1:d6b0 with SMTP id 5614622812f47-57a0c9c5064mr14920907b6e.65.1795547630522;
        Tue, 24 Nov 2026 11:13:50 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm12774058b6e.17.2026.11.24.11.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:13:49 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 0/3] Add Cellwise CW2217
Date: Tue, 24 Nov 2026 13:13:43 -0600
Message-ID: <20261124191346.434143-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the Cellwise CW2217 battery gauge driver. This driver is based on
the sources used for Rockchip's Board Support package [1] but has
been updated to use the regmap API and devm helpers.

[1] https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/power/supply/cw221x_battery.c

Changes Since V3:
 - Two more small fixes requested by Sashiko, one trivial fix for the
   to not always write CW2217_CONFIG_RESTART for the cw2217_active
   method and a small fix for the regmap writeable/volatile ranges.

Changes Since V2:
 - Fixed more bugs pointed out by Sashiko.
 - Corrected an integer overflow condition when measuring current.
 - Corrected logic for when we don't have a user specified battery
   profile.
 - Added power supply changed logic in the worker.
 - Updated the Kconfig text to note support for the cw2215 and cw2218.
 - Added a check to ensure polling interval cannot be below 250ms.

Changes Since V1:
 - Added a default value for the shunt resistor in the binding
   documentation, and updated the commit description to note that the
   min and max for the battery profile is now per-compatible string.
 - Fixed bugs pointed out by Sashiko bot, and corrected units for
   temp and shunt resistor values.
 - Corrected include pointed out by kernel test robot.
 - Noted in the commit message the patch is based on original work by
   Xu Shengfei at Rockchip. I did not list him as co-developed or
   signed-off since I did not have his permission (yet) to do so,
   but I have his authorship included in the file itself.

Chris Morgan (3):
  dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
  power: supply: cw2217: Add support for Cellwise cw2217
  arm64: dts: rockchip: Add Battery Gauge to Anbernic  Vita-Pro

 .../bindings/power/supply/cw2015_battery.yaml |  41 +-
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  |  21 +-
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/cw2217_battery.c         | 878 ++++++++++++++++++
 5 files changed, 945 insertions(+), 7 deletions(-)
 create mode 100644 drivers/power/supply/cw2217_battery.c

-- 
2.53.0

