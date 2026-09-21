Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A518B39734A
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026898; cv=none; b=GYhR/sfX3J6OBQgYhUfnB1VW/9pHoLWDGN7mIm0V//0165KCB5cH+gV5KiiP2kAupcLwgTDalQrshsv6Z5nIX5b8U/xG1ULljI75Zh1b8OuJ+xBZZaQGW5zGDqxJRUrxyN/oWOudpJrCeCE8u0NGatsYwkiiittHyQJexVT6KlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026898; c=relaxed/simple;
	bh=/RJPQUzo8Go/WWZI8LnS462v+isCtH4+yN5e8p2n4sI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PaX2irziAcIabQrjIX121eEr01vjWj/0QX7OrgWW/GYcTdH3KireiC8UQLv5GgLny+/NUp/9US9zTvKwDZeWrFkQXQRJ8r4iqEiRosrCQYXpseIijpEMYsL8bOOkYMHJkjUR1ZMjWaQ/tJX6LVx/IvBRmR9N0yUjuzZu3sTpGgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbdOfm6B; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbdOfm6B"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so1861496a12.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026897; x=1790631697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=LbdOfm6BhozfuWm+UtGi2XXXTHalXtTTRHOscznmNY9hIgTJ4miOGf/I5JRYlXoalm
         LL+sEbA6+fONxp8NThITKhqk1q8tyjJ8z23BWKzS57xiJDSgsUgwQmJc6LtpUUsJUwc9
         VlbOYqpibrzVIRG4PDUl29t6uHswV5AGf/79WSgpKgByHVBGpUe1iHNrrK7MzT06WnTY
         iIYXuwPUcdtqhATIQfpkOLVotz4hig/L61rBnrlUb1rEkc4Zh1b1L3bEyOthCJyag779
         R4g7r3iSbnDxWLysuVpLtlYTUC4h/u8VW1DSBcneTWqa7mdZKqv8J61e3XKDxgcCUGtu
         aRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026897; x=1790631697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP/SC8OSq0bvDhZsjPTYCX9oiuM7x6ktXwHIZsb6Nqw=;
        b=FdTb2iVEDldC0yJQ+S4eITdp81RP7IHk4fxIwfTxP4TbpYrj0ioYIgTkexpRDin2Eq
         NIzxZDf52Uasa7x/91MStoWLIPD2jMlMGCjIlG1zjBDLXA1ApGxMjcmaCVaRHvqcB1MX
         QBHsripuUsvEUTjpxz1pPTuf9un8H4KjqWq3vc8tpkRWnXyyhgWTvQYKuzG0GnSmXVQM
         uDN6ELQYX1NG0N/IYAR2PNBFjqxmkPr+dhIaWNnudl1g4a99GJwIrj5Fn0PjZOK+tzQJ
         ZETjDF8C5e03YOYQqYYMSz0j7pDZibHkkte6/A2qHjU4AyNbQbh2nhqbc4BfOgSuWlbY
         52FA==
X-Gm-Message-State: AFuF++lSKuC6YpJbh5781DBdeagjDuXgVpFEJ/Im/wN3IFdfaKTwQUkd
	wifO8VQvDy/xdmDzrWkBuNnMYahRc6v0AjwX6zwF5PAp+o6dQALY2l/24ebsYA==
X-Gm-Gg: AYBFou3lt6WtnIqEW0rhm+4xDq/AZ6t8r6bSfkpt+U067EaY6d0ymdmQoJ4UtePOQ0l
	TnqTLlum3U7aFMPZGOK4k1qw/uG+pMblB5BhGDS8t3kxdUIMf4OgTVYO2NTYJExA7VFW4k+HzKS
	kReorwAiKZ3mQUQo3znNncV9EKUdWCamzljpkEOUBTCPTBLKtodQwZ4C/nRn9A6mGvuf0oMv5X4
	fzkokI7zyRMxV6/5NN4dza0BSXfJUvkIB+m78PJblVy0HL+Ruw4nmIbziBZo2GAwzcpah5VWL7V
	63sGggxQ52fe0Xq/OxYSSLYq15y0N+jBHyD2PWnJCKFahMiFxGpdaCJrtKRgeuQj5HuXQw8GWj7
	+ErYtrJZzGdke9JwzNUw9AyhPVXX83AzWXwKWaUBi3iADgK1Av96T/xxee55Nzi4pjnnEpFbsi7
	DSkrswtHojxycH+poLj3LUiH4xKOt0lxL5pD/QP8/yJbwlxm2AeCopd6dunxYZxuwhfxc97UJbS
	nMsa6jgcWYXod5XmQofMdzghcd7Ibvd/iE2Jf/ebe6mI9jt7hYLpP04AACKCbQt9DHlmOB7JWDj
	pTT1qLU3+d9m/+EHOQ7jB+LEuP7hZYBHQh7TM5qPY2yW3+fxWw==
X-Received: by 2002:a17:90b:56c5:b0:39e:4c81:6c66 with SMTP id 98e67ed59e1d1-39e54dc1a3emr17982461a91.33.1790026896931;
        Mon, 21 Sep 2026 14:41:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0b05esm608892a91.15.2026.09.21.14.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:41:35 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCHv2 0/2] usb: bcma: control VBUS via a regulator
Date: Mon, 21 Sep 2026 14:41:31 -0700
Message-ID: <20260921214133.16519-1-rosenp@gmail.com>
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

v2: fixup dts and keep GPIO working.

Rosen Penev (2):
  usb: bcma: add regulator support
  ARM: dts: broadcom: model USB VBUS power with regulator-fixed

 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 12 ++++-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   | 23 +++++++-
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 23 +++++++-
 .../broadcom/bcm4708-linksys-ea6300-v1.dts    | 12 ++++-
 .../broadcom/bcm4708-linksys-ea6500-v2.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6250.dts    | 12 ++++-
 .../dts/broadcom/bcm4708-netgear-r6300-v2.dts | 12 ++++-
 .../dts/broadcom/bcm47081-luxul-xwr-1200.dts  | 12 ++++-
 .../broadcom/bcm47081-tplink-archer-c5-v2.dts | 12 ++++-
 .../dts/broadcom/bcm4709-asus-rt-ac3200.dts   | 12 ++++-
 .../broadcom/bcm4709-buffalo-wxr-1900dhp.dts  | 13 ++++-
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 24 ++++++++-
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 14 ++++-
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 14 ++++-
 .../broadcom/bcm4709-tplink-archer-c9-v1.dts  | 24 ++++++++-
 .../dts/broadcom/bcm47094-asus-rt-ac3100.dtsi | 12 ++++-
 .../dts/broadcom/bcm47094-asus-rt-ac5300.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-885l.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-dlink-dir-890l.dts  | 24 ++++++++-
 .../broadcom/bcm47094-linksys-panamera.dts    | 24 ++++++++-
 .../dts/broadcom/bcm47094-luxul-abr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xbr-4500.dts  | 12 ++++-
 .../dts/broadcom/bcm47094-luxul-xwr-3100.dts  | 12 ++++-
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 12 ++++-
 .../arm/boot/dts/broadcom/bcm947189acdbmr.dts | 12 ++++-
 drivers/usb/host/bcma-hcd.c                   | 54 +++++++++++++++----
 26 files changed, 384 insertions(+), 45 deletions(-)

-- 
2.55.0

