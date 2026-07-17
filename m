Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129E371885
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306511; cv=none; b=PTUuGNqP4GV8Xf6mRPEQ93mZcwBiuH+AxzzPcANiadBxe/wrW+W/c4t5EaTbdE/Iy2hrgmqRmqn1x0NpSe7IeOQaM1H5fnQdp6A6udfTBc2iA+9FQZ7pfqNArp81zv7dMVzAytcjqbmo7ezEFSPZrXxKABbgwhLp+Vnf2sDlNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306511; c=relaxed/simple;
	bh=YoSkvKhLIDEZRtgz0gCZBHnLnjY7Arw0eRwzeYXJ1Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3giqTh+HFs486ote3ACR8UyBV8WpMjr2au235ts6dazJcCzkRhGMrYINMo3qsyTUKA8E1VIY+MB6bRete+uKLFi96nYiWxerDzg5ej62Ek+aEl5XnD07oxrAWOcIknFlpDmCX8Q+tmdCZVWUz/eXq3lTFIs2QADD4AWfJZJCXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYiv7x1L; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYiv7x1L"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1670dad7a8so637017766b.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306509; x=1784911309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=;
        b=VYiv7x1LMUcbaJFZhDYwVPB6zB9yTKzlxh22OEgo22w570WkeQBBo5QVKTusIFLvMF
         x8GInwN2TxMF9WD0m9Ot5KuigHpH+2rJzu6OGXNClGNWEe1GSk7DOhV6VIZTbNU6WmP7
         9LYcuQtO1FilG4cNJXFNkprxWfuc2ct0X7lLw0fgLU0lNXx191AhErkVnKrG/ok6mEZS
         BkEoGNUzH/3+EqM7/wAZvl2dWtQsdx3axhsqsP+jySFLBHSVbjcPrdq0jySqvv6BAuDj
         M9lpIhjlKdxwjtFIz4S2HCAeXauqLhmf48jbQ7skNaG3gMdDD5o9A9+yPZUDy7iuqA0C
         XZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306509; x=1784911309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=;
        b=WCcIOS1yxkFx4Pvs7R68LrXubE/Fu+HpbWzeVvOmUzDLSSNoAXgTnEFEJNw6LwreAt
         DkSz2yI16ZC8QOpJ4A35tKGyc1SJEcn/FuUSiEHH+ag8kq6Sn/ptesVqU+Tg/Bc+oZyo
         lpp0Wu8ek6i9nCAnzJTfdW8EB5iSfSNBf/Bl8MWleCRrrWaTmeb7hiQwvEM4StU1EIPE
         OG6jTAz2y2JCPRoueVR44MjorgHy0yREGsG4Yobc4e0AdwmHcimxIbBUoB8k7PiLiOtW
         YDnciiufuKe20+/5YbmvQ+WpL0bVMPV+fudt7leVOUK0Zivi3YRz5AO6WNgglkUEuUc0
         scsA==
X-Forwarded-Encrypted: i=1; AHgh+RryXLuUVZGBNZ64y4gAM9RooTViuFfiGaRKk7VGpiQfSxrUz/GtwvPsIoMNi4RsoaL2Jj9ymNEpxB2u@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZZzjzLFAO+10Jkk0BgD3rBoOozkF6nHly7jT63z4/1Uf9ut1
	gQOyrC2z0F+KOjdE/kFEyH8a7rQATsVWj5q1OsCirc5UCnoyy1F0e20x
X-Gm-Gg: AfdE7clsv/qXwS8jj/P3I9LKScHlr7hD/6ElMrv4Y0po4JI8xmtZ6F0A43v9OnfO4Te
	9Jm9N315WOc2RxRP+P1Tr3c9x7jdkUX9ASNdImNYSdKYDN6lbgfLIvALjSL7IQkkCVtOk1zWthL
	s2cunQTMAE8BIHiH1T7hWRR64EUKTvvAIQX6SMB+oklOLQ95A0+Pd4MhsRdAElLE8fYgMe1t8Hc
	WVlrW6Dtq2a40PkisQT7OqUz1gFtfFFM0XN+Yx4VwIRL7pXMntSOrsJzRPWsJuic2aAmOuUsyqy
	F73ZGP0n0Vn2bPklU7ZYBm8Ol6shVQ/n7tGqMea0kAFldQplUDGdtkxvM5/3rG6OOBn/5iqtGDL
	RcBUwA3Lf6jVqZCCujXeTQ8rovPX05+vViq+BZF2TNHOi7oM7fbWnodHR2e+2l8o1dGGJWI0NYQ
	==
X-Received: by 2002:a17:907:7a89:b0:c16:1df9:6eda with SMTP id a640c23a62f3a-c16b48d373emr163696066b.49.1784306508409;
        Fri, 17 Jul 2026 09:41:48 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/7] Properly describe mt8167 watchdog and mmsys resets
Date: Fri, 17 Jul 2026 18:39:11 +0200
Message-ID: <20260717163959.714561-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

In the first two patches we improve the description of the resets for
mt6589 with values obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset header, we add constants for the MMSYS
resets.

In the 6th patch we add a node for the mt8167 watchdog referring to the
new compatible in the SoC dtsi.

In the last patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

Changes in v2:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (7):
  dt-bindings: reset: Add MT6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for MT6589
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  dt-bindings: reset: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  arm64: dts: mt8167: Properly describe the SoC watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  7 +++
 drivers/soc/mediatek/mt8167-mmsys.h           | 41 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  3 ++
 drivers/watchdog/mtk_wdt.c                    | 13 ++++-
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 7 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

-- 
2.43.0

