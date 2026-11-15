Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733533;
	b=UeUfsf4s0UfVLrtcwO+QxzblocFGiCJR+NWgB+dqoNem36n5xwbsKQbDz1xvenx1xvq3
	 epB03Xjk3M6qmvSi9/yVvAKE0ZhcaAjRUZI63zOnu9JCeG2l9mq8FLiYpqJyfExPKy3Y5
	 Xw0eOK4+mqe2/KCwDF5hGVfQnyiTuruDd2wtpv0wkigOX7r0d/Z1XmgQmOXCVd1RNrjCJ
	 9TgiBD8XJqeJjXw7O0wqnXw9pR08yjxG/od9iR+2Ui4au2xIOoNWDzUlwILy3rxCP6N7y
	 tRxC4PH4M3VlA0wNoGqA/a2ruzFy+AdO4kSX3Rc+Y+RpcRq36EGc8Vdi+a42yDUQqfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
	b=yMrPJnvTsw+EcETV0ePBxlVi2zLj2XiLnzwDTmcGAk4B6mHtgM+J6ImLglLZcO3vsRGQ
	 Don/i3Hce54L8rcbuTiDr02NjdyqQBDbFZprr1J80mUISpqHhurdgjhxCxANKCr8wzRU7
	 Gww0EgqdP8Cn6HKsJVaqrrpRvwfLgOBtmC9Eow05AiyCj6zqEkdcGvVXxyiiM3Hsn43Sx
	 PJuBhLjorZfocAbMoBIXBgKP6QyBIUaojitLiteoHlvWY30egsPE+1R+uFfAGlTEH2rU3
	 ynW3vEwqkGCuThftTVLdThmA+/E7L+9UnCpzXCcki3t9ueGizLVfbwvuFhpabTh9lag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEzl23J;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9F606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA9F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEzl23J
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso5653138a12.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733531; x=1795338331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=WZEzl23JKiuZ8TYYH80BBF0tEbF1rQKXBSe9ergk6FRLlwVUxhjaAu8Sd7fv1rI5Bu
         g1Jk/4uI2sfBGIHJ8bC345/3JtGxR0nxfSEjQBTV1eWTL21v7nZ7ELikOz9iuuKPONz3
         U8RBLhoizcLWzPrRTlXam38C7HdCSP41810emOm7SKRqwJMpWgG4Q466Wa3ASyLsX4Qk
         e8sHi+I2hF8xKBSacQBGS1HFrmERP/1eGDso2s2+Zfihb3XERt4PW6y8mlJzLj94udY7
         v56S+e2QyXgXPiPcfaj+QNqcTTVawANp7PC9RBNLTQtoZfZ4EIZhoSUnXjt64OYKfCAq
         xHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733531; x=1795338331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=KAeLjiVHeHT1WmpnHiidM543H0uHjK90x34XfK8FxA7lTHoBv45W5rAFMa/IcJj0mk
         ntJxnWWwMftqqdRrHJmPNPr9eLtaZf8MVTW5VDmY5aFxfYYspioKH5BoePsfPiHB7sbv
         Wm2HyBzY2lcOqI7FLkREY0LId3t2ycjvgFl+cLWfycSnKGn1lBeiZ9qhHJ4sfnVpdz9l
         ne5dFEonmO+skvwM7WiivDg7HYxQ81M4YlgpOnzBRB4foV2u1EbwL789IiPcFQSEb3Vz
         yc0iI68TxMlAJ87y2UZO8cHvvj7ZF8jhcZwUT9MFM81xzXbxVErIF/4CmY6yflDn/V3H
         W4ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEZ0dpri+qYbKxLrPHx/b/KkkOe2pSbmnQnTX6DPOixZhZE7BxrmkuoOm1WTycb3IRZvTFtMFCcik2d@vger.kernel.org
X-Gm-Message-State: APuU4Z8US5fFzlLjOlgRJjQ5+52ID0fsn4E2qzV9rMe4TgHVNQvWN3On
	LX7G55hzDYfSyBjSXw1nZiGKBxiPCI7CutuX78+TIedFPvOEYqvaqWzK
X-Gm-Gg: AYBFou1LgM7tELAW2I7pW6HYX68vGJah1vvTA1UnxF2eUg89qu8T4TDwn6GVvR7Yb7c
	PUwSI+jGfZN9V7Fa8CS73n+3pYhC/xr1SHOdY4YwpVNgkMzwGpz2DW7fQDfNPLGN6iGvVYoOxl3
	OUJTpPGtOYKTvIZRXS4BcVzLo9A6sJKQZZep3IM7fuEDO3Y0R0ghPlDM+JpC31Hfe52bgE3QdjD
	xCPevOGRNwGps8Q99G4c9hx8Y1QS9pTvi1+0QXkwlrT35Y6UmjZ1FEw5XYgsWWHj1QXAcP1EsQQ
	Bxn+d3BCL4Ap3C/y79ap/bUeMZ7ky0lSAA0nU4LkHVFYMiD8i4xzbMnKaMGgh9BFo2/jhuZly/O
	KmKCMYbew9x1fdDedHReVZoP2S6+e31ysopaA8hP66QbzeENLwE6UsRt7UPKf8EU5hnN7NE6Mi8
	S0SSDFtCePnYT0z1SN23FmYrF4Uu6rQoN9OlmSdXH1CbXrME7wxOEzF3Wh32oRzFymcpsoT5qiY
	h88VePcmO3r4F9ibpCSwZ7KgoyHPakGZcwZjLfGte6kmzXicnaIqeZ6DhoeX/X2D4NyIy8bT5cg
	XrqEoXf3Bzu/FmdKPSWVgMzQIROsYXqKomI2uTU8i22lYqT8e7qdSV6Kf45LifJraXj8bQlMX7M
	Ojfy4i+p5PA==
X-Received: by 2002:a17:906:9fce:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c5096342a7dmr672105166b.25.1794733531152;
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun, 15 Nov 2026 11:05:17 +0200
Message-ID: <20261115090520.102216-1-clamor95@gmail.com>
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Patch 1 of the series requires this patch:
("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS

Changes in v5:
- add and document a dedicated node for LED
- split adding led cell to mfd into separate commit
- expand Kconfig description
- populate devicename and default_label of init_data
- unfold platform_driver->driver

Changes in v6:
- converted to devm_kzalloc_obj
---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Document LED support
  leds: Add driver for MAX8907 LED cell
  mfd: max8907: Add LED cell

 .../bindings/regulator/maxim,max8907.yaml     |  4 +
 drivers/leds/Kconfig                          | 10 ++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-max8907.c                   | 99 +++++++++++++++++++
 drivers/mfd/max8907.c                         |  1 +
 include/linux/mfd/max8907.h                   |  2 +-
 6 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

