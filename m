Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1A36604B
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782675841; cv=none; b=rg3FOUENrO7tfywJjSV9isLOVJOVcccvxqggtJQGnMfENL0MPRawmCv3Nq3ZDUMLue/IfpKVsEDjCJCIj2KbNyt+PU2lWeeLWZdBx00mkOXq7AKFqs7unzj1oCAOTqa9g2x13n8Y8zb5ThbKqr71kPdMWTm5K88IgXYbEf/PWgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782675841; c=relaxed/simple;
	bh=/2v/eleMETJ5MMngbaBtVItA94CLZWZGq3DWicz25Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAbrBVDPjOdaXl+mB4cAf9kphm+1QogswvNttUoYI4dgi5c6uYtmKHBnHgW7nzUTGL+uyLtWo2b0DDtqHHUHWI4eeH9SLTPGNxF/tG/NZt7MhxligUG+D1fIUOkiBpgJf0RpWO62yr27phQy0PQ+c8lPVasVEJh8AKTy4bWPJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLRbY+Dl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLRbY+Dl"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so656693e87.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782675838; x=1783280638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kotxqLQJciyAG8N1ibRZ2pd/bNhJkmkzGP8nqTKaV3M=;
        b=GLRbY+DlN7kP+o+cq/DLmNqoasuuO93xKn2cZ0XezndlbApvpREk5rTiRKeBzlz9WS
         NfbfHjKeY1XDKTzZhWhdkERoyTgOqgtFuTnTN1jUHbC9MfMIVjw1LhdWUikRpy1p/kfv
         33OI4zeHCBswUb2c79ur09AzVa6JmI803GN1NAm3ZoZnlf4Iue9XCl1O/UjFJy7E0Ecl
         6KX1PqvoG7Qh6us1TkRJHg23zdgXrQOta/J+1R2of76+DP7Dv7Z3dzqqB1zyUoqvNlPl
         p5Sqh8dEK+P0KArEwEV+jj/j4Cm6scBE9t4sVOJ96YBO2PzCtyLwkLb0JTEy96HYc/Sm
         IQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782675838; x=1783280638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kotxqLQJciyAG8N1ibRZ2pd/bNhJkmkzGP8nqTKaV3M=;
        b=QiX0Ijl9GGpzNluIh8VMA36mdrgl6JQwRki2w03RJgnKn2keyyoKmTtWUpGPnD3TkE
         AvwGJdnfXS2vamBk7cS3/8cfEP51V8IHI/+KD8xC5/yiIpaiBlU4ln21x5WCQtNRwHC1
         Ml1YYljbLm1WYAO0aj/82MVMgJEXypOKachBpDfWE+1fp54atnQ2Gx7SheqZf2XeAVW+
         WDDpb1TDrzr6kV6wyi8CQUV6QkHW0kwhrVOtF6C9azpXWXBA4qLB+xJ/Igh79+06c1iH
         a8M5GRup1BKo4sUpstizO1I+tWItHU1Z2gEFEx0dkNX+V/PBaTy6RMoZbf5Rbh4D2Bur
         eyzw==
X-Forwarded-Encrypted: i=1; AHgh+RrG/gYjx4FbmI2KnWZaJW8bxmIx2GQ6LnU5stLsSuTBqyYZYeW1Kl2k2Tiy4wpOYNiOziUb4ZWtyqM9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv23nuISxDhSl/8rWwi99a/nYdFJDk0/6OIW9fnCbO4gdSdI7H
	7ksrXWsl0UT+MkzjY7RRqzDOyEAgM4Z6gRv5RwJKcdPVftmZ7nlP4xKt
X-Gm-Gg: AfdE7clga19cZ6pZ4j+EosstPD6cZ+1fRTszIJdmF/mTrKEBxSeXhkb4AouDC5N+JQD
	EUmt/ibOmuvjAwvNHthIv1O9SV4RKRcQ8Lu7MnaTudhBSjtCzr1qZugLjdgy8E8YLtQlL4OiQaH
	gndYPN3kSLRLxd1veTUqA3i06FfjV7v54lG6Cba/0ylxk5DA5P/9ZBR5JypJEtR1PEUVYfcmH7H
	Kmqqkup7StF9qMcIJT1eEH4ykgeSIuLFGicycKRnLKkWZQf10APZXNwpvsruHNrETHpOKz6wd+i
	J2OVJXuzGyeqNWLxm7btCs/vvdti/VJPK2l6cU0iZFLlZ8SgjPKVqzPZNjVo4eZK4OEy4mpIEgd
	YdY9yol8kp94+iqcOSOtfDZ/zm/I6wFo68fm1TKrYaLg3eLHaVa3TgCUL9/PU80OblD5BGVsCzU
	3ultMHDHI9kf3/FxqHrND9f9k7hUtF
X-Received: by 2002:a05:6512:3c92:b0:5aa:6fff:c3e3 with SMTP id 2adb3069b0e04-5aea1f4cdf3mr4002256e87.33.1782675837789;
        Sun, 28 Jun 2026 12:43:57 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl ([2a02:2a40:27ec:2900::3ab6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551002sm5221688e87.24.2026.06.28.12.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:43:55 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	antoniu.miclaus@analog.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	duje@dujemihanovic.xyz,
	jic23@kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	jorge.marques@analog.com,
	joshua.crofts1@gmail.com,
	krzk+dt@kernel.org,
	linusw@kernel.org,
	jakubszczudlo40@gmail.com,
	linux-kernel@vger.kernel.org,
	marcelo.schmitt@analog.com,
	mazziesaccount@gmail.com,
	mike.looijmans@topic.nl,
	nuno.sa@analog.com,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	wens@kernel.org
Subject: [PATCH v5 0/3] iio: adc: Add support for TI ADS1110 to  ti-ads1100 driver
Date: Sun, 28 Jun 2026 21:43:38 +0200
Message-ID: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the TI ADS1110 to the existing ADS1100 ADC IIO driver.
The ADS1110 is pin-to-pin compatible with the ADS1100 while providing
higher resolution and an internal voltage reference. This patch series
extends driver support for ADS1110, updates device tree bindings and
Kconfig text, and improves the overall hardware description for the
TI ADS1100 family.

Tested on: Raspberry pi 3b+ with 7.0 stable kernel

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>

---
V4 -> V5:
- Correct pm macros to be more generic
- fix variables ordering in new functions
- delete unnecessary casts
- Link to v4: https://lore.kernel.org/linux-iio/20260622221550.374235-1-jakubszczudlo40@gmail.com/

V3 -> V4:
- make fixes patch the first change in the series
- correct error handling when short read
- use ACQUIRE macros from pm_runtime.h in new functions
- Link to v3: https://lore.kernel.org/linux-iio/20260613190957.654798-1-jakubszczudlo40@gmail.com/

V2 -> V3:
- clean patch from unreleated changes
- divide adding support for ads1110 into separate patch
- add missing changelog
- Link to v2: https://lore.kernel.org/linux-iio/20260607183542.368184-1-jakubszczudlo40@gmail.com/

V1 -> V2:
- go from creating new driver to extending ADS1100 driver to support ADS1110
- Link to v1: https://lore.kernel.org/linux-iio/20260527164312.355729-1-jakubszczudlo40@gmail.com/

Jakub Szczudlo (3):
  iio: adc: Fix incorrect reading when datarate changed in single mode
  dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
  iio: adc: Add ti-ads1110 support to ti-ads1100 driver

 .../bindings/iio/adc/ti,ads1100.yaml          |  10 +-
 drivers/iio/adc/Kconfig                       |   9 +-
 drivers/iio/adc/ti-ads1100.c                  | 145 +++++++++++++++---
 3 files changed, 135 insertions(+), 29 deletions(-)

-- 
2.47.3

