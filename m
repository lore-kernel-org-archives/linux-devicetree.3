Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973BD3E0C66
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938841; cv=none; b=c7CNkZC7oEFxd4I1eJoPLdq0RyAVESPE8Jq2y2FKxwBil8snqsE2XFButKo/XYYv7er6LXGHbwjC/Fi665xWH0L7ybffBG9poUpRwuSsEPepKP3dNYWB8o1o2QlbT4qt6bPeEomBvWIpTkj+2GbiLRynjPk5gGRkPM+TdVFefL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938841; c=relaxed/simple;
	bh=o2jGA+oz8FAHUUGJjII1o9Dpx+I2JLINT0FHkUiHcKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCrMEmxiFKvS8e5fradcCH8xZRQid1X4wmdaL56vIODju+nP3rWBwh2RaEg6WbHEP5bmiqvsipPZvyfLL5pjhvWKwibGWNlVo0Ryucun8lqhBgZEVS/DS754NXQNwJp/eCW9ZW35L95hBH55G52gkbBO+v/nxEkDbjn4whUJLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTFA5MuV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTFA5MuV"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso941461a91.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789938840; x=1790543640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=cTFA5MuVrIwwUpiHun3AF0v7E6G2C4VNXJNI3vjaAVvOSFmFlLXloxJj6PxGGRqIYT
         CZp4KvTeuWSInVT1j+yAvm9853t05hBoamyjW4KEfRz66TrHy97odZygbJ6pqmfghoip
         mdnppQjZ9CHodLVZFF/MELEHV8Mtc55NP1uKYBWHvpw5nVkCEiFd8PbTFP5xgIicLqhp
         TdbiYmSbjqK2YOg4YGrbmf+hjICwn16ozpBdZIfoUp335Wz1h1l+LSQkn5x3RUF41Q+z
         F8WpI713bNTrTsSgvCVSc1a8CNLnTlkDAXrRvjJpAidCF8ZlQk1ckTdNh7ThXpElJDq0
         KsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938840; x=1790543640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GVVx1LqA6B1jJlZmV64iP6HqsdwAzR/vY4RLJ8HlJI=;
        b=LyI0YfcmYESBszCdp5RwwoIH4TD4E/X/GlIrTRxwqNVFPSPQfLtMGRjlogoSAIoeRJ
         5IJ5x7M3bEjFu5a7/oo4u2AMxAXZCy0kYZNkWHUVgNuTYhejkowbQpJA7iribDESO4X5
         xRRCUqrZbSD9iP8Rk/W18POSUQopDgv5AyFfupLtHRtlM45QL4aMq8unvP3AcwjnhvCr
         AkQIKjnK7kzAMrT/953cHmgAeXc3re5rsgffbrj1+RxmeZGMYxl6KIRsCVMMxeLpVYNn
         o6a/0gi++qnQrx+wSWR2odGYn9PaUFnzk5OyaPzVuqccRGUShjlZXC3jBosfBia+lBdG
         wADg==
X-Gm-Message-State: AFuF++nbpc/e7aog6o4z64s+gjO+mZ1x5Df77fXHSsFiefTgk4PLbrAF
	2ie4yJBw7G//S2yprtj58ayJeEOwIjSysjVZ9IzjnZb5IbcpwkxwwlNbwunEDw==
X-Gm-Gg: AYBFou3HYaYZtQ0IiAaMjuoYVbaqpYkJo+eMXdNRQEErgKuN9qVh4RXA2/CuaIPtlKm
	5sN8mj6xftz1/pjHPaS4T+8RTxhOy4Sr32oNYQ4SN+W7l7luWdr5w6V6PvJxn6TcX7J4TsCAMQp
	O9SsrDR6u7sHfQI29/m+cl2XFAOVtSNPzaJRyr1/cnWvzTGe88fkL2sGlmO5eAhlRLjnn8oNKGk
	OBqf5HQZBmPUBTG6i/WHT0rxO93UKjlR1NNshhxxYaaLQL1WpTCDHgbNAJCaDq/um8hN+VHbcNx
	IE/GNh9CPr3cT9E3LTFpKMog1XhM1dm2KGFaOYWPapN219Og4vsaE09AWPoEOyy+qWu22gFyI+A
	hvVMgdsmWa7kfaOticovImHqg47UTh2DDurE0INR4QhJBrd4MwN4LmFCDY4FXT6v3q8HYz/G2ZA
	jA0Tewj9KUXl6vNcFkm3Az+1E8QShTFVIoKIBG9YWn6se+3HNrmeNTyQpALHWTgobiFxfbBAl+/
	xRj31KKWUX8HF9Vr9AczqjZPXIkZSpocGnS7KsYQ66AiWx85hXCwJe4eohRFKMKqdDybTwkjD3q
	hRo7FngfPNwCA5TmEom9PSx7v7ooyFPNDtjkkn8cDHKz+45rWJZAFLMnyXw=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-39e6c68fec5mr4752048a91.38.1789938839949;
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10609743a91.4.2026.09.20.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:13:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 0/2] usb: bcma: control VBUS via a regulator
Date: Sun, 20 Sep 2026 14:13:54 -0700
Message-ID: <20260920211356.186967-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcma-hcd currently drives the USB power line by grabbing the
undocumented "vcc-gpio" property from the controller node and poking
it through gpiolib. Besides relying on a non-standard binding, this
cannot work on boards such as the NETGEAR R7000 and R8000 where one
chipcommon GPIO powers both the USB2 and USB3 cores: the two
controllers each request that GPIO exclusively, so the second one
fails with -EBUSY and its port stays dead.

Instead, switch the driver to the standard regulator interface and
express the power rails as regulator-fixed nodes bound to the
chipcommon GPIOs. The regulator core reference-counts enable/disable
requests, letting both controllers share one GPIO without conflicts.

Rosen Penev (2):
  usb: bcma: control VBUS via a regulator instead of a GPIO
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 14 +++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 25 ++++++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 25 ++++++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 14 +++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 14 +++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 14 +++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 14 +++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 14 +++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 14 +++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 14 +++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 26 ++++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 16 ++++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 16 ++++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 26 ++++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 14 +++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 26 ++++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 26 ++++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 14 +++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 14 +++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 14 +++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 14 +++++-
 drivers/usb/host/bcma-hcd.c                   | 45 +++++++++++++------
 26 files changed, 422 insertions(+), 47 deletions(-)

-- 
2.55.0

