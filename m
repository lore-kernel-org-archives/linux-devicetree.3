Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C53947B8
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 19:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781377821; cv=none; b=iTIckD1RwPpFPPlioftrpyrR/VUSMnYvrqVwTte3Rg3wewUKTRwk47cSwsmGr9XHyY8AJ/nXg+JRalfWzVOE3rwBSYTDuMezTNu++eTuOgfBN9QN4whZb+V8b2D99C1fqhyFPLQTne+R9Qyh1hKls/MqrkOpwcZGj/XR0PupWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781377821; c=relaxed/simple;
	bh=IarGWq0h4k7YgRYkX36nCoK+3Jt6gr7vdYY/leCwb9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p08mJbPOCEgUvZHEhxEXVJqfJEKreQx/CjdSt/6JVUWtcig2kTo90SFnowvwRfJa8LTmRspu3ga/J6ilzAfVpvgegqZk5o+A1DLON4Ulyd1Z4a5RMGI8B7omMeONzrQGCIMTxJmMOeBMfy9rb6pe2UPX5dheJ6OTsog20+MLPhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YENmbA6k; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YENmbA6k"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso3569803a12.2
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 12:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781377818; x=1781982618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=463x8kT/wzRlmQHGudSYziOyf/LSV3/qWwdmBIWyYR0=;
        b=YENmbA6kPGE6vQhr4skKsJnq+te3NSsKplGNts63Qs+b5s+NNjLTDe5fx+MtEgdW7T
         iB/VVCuO76MKSvBpoTZwmgwEWZymCOOMjqvDDzCh8Z5Gg8B03dAFIUJ9NzfXoLTW+IK4
         Ww3/+J0W7FUgoBCh6A5cx6wnsYLPYuTQIk7e2CCFx+g8qLHo/2r1a1L5GDRXnQmD6aVt
         bS5JPXNltIJL57AN2xNjuBp8RUFhmb6SbkJuQGLfURAOk0zLsz3NcffFpBid00T/yoes
         wWjZq+xXGMhrq/WM3wujSlViEZk0I/oRxh/QQM3WBmIjSavgeAzS/1jt577mw0lcCPsN
         teXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781377818; x=1781982618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=463x8kT/wzRlmQHGudSYziOyf/LSV3/qWwdmBIWyYR0=;
        b=MmmgWeiD9UDO4lDZ8XP+OGzMrms47z2sVEdgmr5mUnAbpzm0wI5IbgFsm53/Z2nHyV
         k0WDwv0sEENqYwkqpXnDf/vR79YxK3tUORaWMosmpPAKRfXIASav4pPeQo7LdoNxcnbg
         bpqs3RDONVSOCMPsvb4VfGlFYwbdugD6SMYfVYbB9vNVoiCITh9/YAo1uLeGyDBt0Oz9
         bKh0AP1lX4QiC6bV1QLDWdIW2KykbBsLXZw4m41K6r8zVQ2lbhQhHfOS/vPwpYDSq45S
         SW7kH2L6fHVmW/UmSQtq4ZzaoOnQmpK+c2LHIxohRj/ggAEHLMo4srki2YfJXFJxbMN4
         yimg==
X-Forwarded-Encrypted: i=1; AFNElJ+dek23wwJEafvgHmjGWXuN8RZCKg2D2oSLv03wLkaLUad959hwi/Bnk4eeylurDoqAPygwRpGdAE+t@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYOTzmZPCZTh9wSM7Wf1iQktzi0mukooriCar2xwdNJK8FFkU
	bv6pfUMbqQ9GqRwKubS3l1Qy7yHcK58UL2olD/3sxmGffVDrEECYY5wp
X-Gm-Gg: Acq92OGPrJLYEj0MTGTsz52NsmcKCF1L7bohB8zUl/v9x9V2PuLBk43lYwCJeVrlJZY
	4Fb8Kcwaoez2NNU7Fa2T0T3seQm8+kFVeHhhDBrN77chtO/h85KNFso3u2VoGXQppPEL5qB67Yo
	53sz7Ns9ABIGpZ1bp6WHDe4nfPTgfCQ4PIcYgua0mo390YBIj1LzoRxoe6twg/Jq8PW174Awe+U
	G5LbRkd1uWmKx+7g9tMn54lTYrDVcUPmXvlOms0svhpE0ySYCZpqk1h/T3CshZPt1nNP1NuWwEG
	5tHC/PIjIg41nEsR35c29bqsYGeAePJvw9Xfsfpc9l02l3La/ImD9kaWlTV+TK2vGOt2+qjJ+EW
	dO7dX7dTGeBGxBuCqs2+iBSecUzET6e2BjxQa66o1NwR6hhMyC2Fh45ZaufgRbRwYKAJJlJ+Pv2
	PoItT3fOdDfzVkFNEJzKGRNGBbdrxXfXFHjpqPe1s7cZ16adCY1F9sg9CnOQ==
X-Received: by 2002:a17:907:7f86:b0:bec:894d:dd45 with SMTP id a640c23a62f3a-bff4cdd5123mr180433266b.38.1781377818222;
        Sat, 13 Jun 2026 12:10:18 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:9790:7740:8855:4d8c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b2276fsm237193366b.17.2026.06.13.12.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 12:10:16 -0700 (PDT)
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
	krzk+dt@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	marcelo.schmitt@analog.com,
	mazziesaccount@gmail.com,
	mike.looijmans@topic.nl,
	nuno.sa@analog.com,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	wens@kernel.org,
	joshua.crofts1@gmail.com,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH v3 0/3] iio: adc: Add support for TI ADS1110 to  ti-ads1100 driver
Date: Sat, 13 Jun 2026 21:09:54 +0200
Message-ID: <20260613190957.654798-1-jakubszczudlo40@gmail.com>
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
V2 -> V3:
- clean patch from unreleated changes
- divide adding support for ads1110 into separate patch
- add missing changelog
- Link to v2: https://lore.kernel.org/linux-iio/20260607183542.368184-1-jakubszczudlo40@gmail.com/

V1 -> V2:
- go from creating new driver to extending ADS1100 driver to support ADS1110
- Link to v1: https://lore.kernel.org/linux-iio/20260527164312.355729-1-jakubszczudlo40@gmail.com/

Jakub Szczudlo (3):
  dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
  iio: adc: Add ti-ads1110 support to ti-ads1100 driver
  iio: adc: Fix incorrect reading when datarate changed in single mode

 .../bindings/iio/adc/ti,ads1100.yaml          |  10 +-
 drivers/iio/adc/Kconfig                       |   6 +-
 drivers/iio/adc/ti-ads1100.c                  | 136 +++++++++++++++---
 3 files changed, 123 insertions(+), 29 deletions(-)

-- 
2.47.3

