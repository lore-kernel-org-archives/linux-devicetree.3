Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5518643F4C5
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223378; cv=none; b=ojreimVD7qiaDEtKBjO8zkcv06v+TGdzwHojPAerEXOU35v7l+A9T5pHB8rm6LvQXYkReGkQW5r4IUeChFBvEa4YM6t8p/kzdBFaSeyR/t8wip8R5gbswlCHPbxp8px9mAcqEqk1xv5qNalZgWY7pSzsdKFfKC/J+QBavG+KpJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223378; c=relaxed/simple;
	bh=Bdre9fdJwVMzBFV9LYo7Or82eJ6WPi/GEPDr8PMl6aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gi06YStKLr+YBvZ5fjdxSxEqc+xljwhCpL92OycEnYTktraw6GJf+wb6bhadF+kLc0kGII3ex2nYdQbtOPZdrgK346hBahCc3fp+eIcdI6b+fH8zRpipgVGtA9uRXhoAwwR2Ap6MZFL+eTSx2ebzfrN/G91TYAYsNDFFxIdqgbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S10hIIL/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S10hIIL/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b966dd74so28316555e9.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784223373; x=1784828173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyKLv13yjCnmWhHAYzJFN1nNRxdkFskQEtHHi51g50w=;
        b=S10hIIL/vkDLS7qPZ9sK3C/HDQg5DR4hhA7k3PYV5A19sSgqdFCX5rAnC8TqKoE43G
         ZuPijzVIaPQf1zKU4+Jn6kdc/71KvmLTjTf4DwrVRB13S53wFGuk09AXPrfV8d44rNHC
         OpsqG9PmaWPs2cUJhMtvWPy5tVz34vPunxO4jAHM3fxQTtX6b2hjzRcHvIqboCERCQqx
         PN1ev/NVP9amSGbLJ/z8TPyRxEemRNQHQsUteZN4be4iIw2y0pCNbMhlM/fQilrpknGE
         6wYJEW1oLjsX0iJk6Agmgkx/rEXdnHXDnDEW/D/BdcoD6NV1jACV1b/FhSu0xqD2aCMG
         LE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223373; x=1784828173;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyKLv13yjCnmWhHAYzJFN1nNRxdkFskQEtHHi51g50w=;
        b=oBE7W9+Oe/M9SccJXU4mb1j6425AIxjfDBCPfR0TQhhTRc9lk7au/ywzGjRmjlGihv
         6HXDN32t4hyIgqIBYakVprqMtGRx3t/Zn7R4fTkzzGTO5x1arxtMz8+mbL0OmTHoiYey
         Sh9JD4vybBR8PbfMoahUMrLLcM0FNJBKqjt7qfky8kK6A2f8J9pdfB+1fkmx3pb0Frym
         M0hpNmMhPwQtKAn3gQVTn2nqHe3GD9oJIacNTi95VqdiGeVuCUwU555b6T5Nt/tSPKIR
         hOFjkV9w4O9qYjnLKxnSG7OO6fhikojPWJm33ZlTioXyCEdPe4fiw07lZ+07vNo+axzX
         CV8g==
X-Forwarded-Encrypted: i=1; AHgh+RpMKnn6lJgsDcAOsXo6ScPS018/p7zvkBip3X1YbR7JunHOZBDhWqcpgwyyB9OpRU65uO0nG0HhsFRN@vger.kernel.org
X-Gm-Message-State: AOJu0YxODEz9DtfgvGBhw/CWQhlw2GY6X/jdVOKzlu4bk1oR8dMK1yo7
	D9RCGVo2Xhoa/BNvyQFxQ5FOOgm1b+pVNmmi9+m0ocmuAiTqu/sUBvFs
X-Gm-Gg: AfdE7clPz4DFyIRIJ7HqopouAbh41CaiVhHjf8Jyvnxyn2hVuvzD2peyvOGif1/lAWu
	nvynHRBnGqj6ZUPTRmDPFkQWGLhpayNu8VCZCyd7W7O6tIO8aZzzcq3nA8kzWR71IBfg8qPOm/X
	Pl9WlPEx97PPiiptg9UsXjELM8dSGaJx0LRNW5IPnakNSE3X+Aefz27eA5g8kr6rdR20zbWJFnK
	VjEUB2tELfi53XrdUHkTM8DLuIaw1nBx5t/RpNw5Oh8UqPJDdZbS0mS04+olCEGYxo7W11Tr6uB
	ogdhmWxF9cYluu3OWCkUnxPpFAK08guR8ycpz6dgbIvJs7KTk8sa0Cj3JBdZ/R2xXKMxNefviK+
	sQGoaKXI7RKHpme2+vzOe/6pEp/bN50gQEbh/auB2a8zjqTvZygRezZ02eo17Hdk+6GxYW/8nHP
	LagGNimJv3fcM823fGZH22hq9zuhRpmfBM7LrxF9kptrvj4qEkQnc7uyX4ywnVVnkEcLY=
X-Received: by 2002:a05:600c:4fd3:b0:495:4593:bcb5 with SMTP id 5b1f17b1804b1-4954593bd26mr23894345e9.34.1784223373498;
        Thu, 16 Jul 2026 10:36:13 -0700 (PDT)
Received: from izzolab.play.pl (77-236-3-190.static.play.pl. [77.236.3.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954812f0d0sm7983005e9.12.2026.07.16.10.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:36:13 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Wi=C5=9Bniewski?= <pawel.wis.me@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] iio: proximity: srf04: Add Cytron HC-SR04 support
Date: Thu, 16 Jul 2026 19:35:56 +0200
Message-ID: <3fedc827a2581d61bef9ea639ed77cf90e80047a.1784221074.git.pawel.wis.me@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784221074.git.pawel.wis.me@gmail.com>
References: <cover.1784221074.git.pawel.wis.me@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a Raspberry Pi 3 Model B+ running
6.18.34+rpt-rpi-v8. The sensor was instantiated using only the
cytron,hc-sr04 compatible, with trigger connected to GPIO17 and echo
connected to GPIO27 through a 5 V to 3.3 V resistor divider. The
driver bound to the device, registered an IIO device, and returned
changing distance readings through in_distance_raw.

Assisted-by: ChatGPT:GPT-5.6 Thinking
Signed-off-by: Paweł Wiśniewski <pawel.wis.me@gmail.com>
---
 drivers/iio/proximity/Kconfig | 1 +
 drivers/iio/proximity/srf04.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
index bb77fad2a1b3..89e9d57ceba6 100644
--- a/drivers/iio/proximity/Kconfig
+++ b/drivers/iio/proximity/Kconfig
@@ -139,6 +139,7 @@ config SRF04
 	  ranger sensor. This driver can be used to measure the distance
 	  of objects. It is using two GPIOs.
 	  Actually Supported types are:
+	  - Cytron HC-SR04
 	  - Devantech SRF04
 	  - Maxbotix mb1000
 	  - Maxbotix mb1010
diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.c
index 7be50bdebfcb..f5ee7d6572b5 100644
--- a/drivers/iio/proximity/srf04.c
+++ b/drivers/iio/proximity/srf04.c
@@ -231,6 +231,7 @@ static const struct iio_chan_spec srf04_chan_spec[] = {
 };
 
 static const struct of_device_id of_srf04_match[] = {
+	{ .compatible = "cytron,hc-sr04", .data = &srf04_cfg },
 	{ .compatible = "devantech,srf04", .data = &srf04_cfg },
 	{ .compatible = "maxbotix,mb1000", .data = &mb_lv_cfg },
 	{ .compatible = "maxbotix,mb1010", .data = &mb_lv_cfg },
-- 
2.47.3

