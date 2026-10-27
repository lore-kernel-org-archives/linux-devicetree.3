Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101182;
	b=YcPKC7XFDd6BtSkr4T5eE/7FY/9xPmek51dioLoJ+7Fm0FyHfaxeKAvUkeLxQ9/mbgiM
	 EqNFJD5MBV1JXuCO7VepgjHZMCAkcEXv75YGMKS1cWDbzO7DhtBiX9f/nz/bvC3J362g6
	 3vOs1L9HJTAS0WiM/tcWrNRA3Wexp2Pj6xKwfQcn8CnE2ALiqCXlAfWS39iwTb8mmwMZO
	 XliR+4W+7Gsq7XRSVhYZbKg6R/8LyfZuj2yQhXFQg/KMZbqgI0aFZ1LZZhATvMhIDMbdX
	 8VhAkA7sjmcWaTysNx0oJnw3CWLBSFa4Ys6iq68+2aS9GPnWnE5eDS9f4KGiTWc0A9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
	b=t/JGuZZoS5xCFjTqu1RwjVNN1Lx1qkIG1BH/6FsELlV6XBumjhjF1Dh3oS36LrOMddBi
	 BcBgZouTDVG7S+U+tLRdeT6fUYn95Yj51EkidYb6uIh1HR6lmPFlIw04KpwoY3bh1d8gA
	 OWP+X6wEiexKF2R+KhzGNjhr4yu82A5UvfsetrlmAZ0EddTTvNNDplx2DrZmCCu8/QC9X
	 ohS6FJ1bg3xjJuLxCxJ3uysu+exwg70r713ARc9zjqBmhccgrpQ2Z73nKMK7qCTL8fcVJ
	 xPrHhFnVvXjf/HNnGcmKN33Nf7yCOUqVTwyNv5ufVqPJo3t2Y9lX68ScHWWyof2VecQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeXDCfsO;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFB6606B5D3
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEFB6606B5D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KeXDCfsO
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c45551fa84eso586821666b.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101180; x=1793705980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
        b=KeXDCfsOQB9V3BjhrzMps0ArP1yx5y2Gwbra/ohxrTzGZVBk9+IOZtOhxJN0QsF+pl
         tv4C5hi3H8oWQR3Qk8mIYsPb8LG9rIAqkAHSEQrAvXOjajJMb56/eAESaZtn50H5Ijso
         9i27AoP5HthaMttzeUSWS114zz94yqQfOxho2CIFCJOwtfIsn6VIa3R9knGr9/F9QqNB
         X7jfOKXTfWZA2ls8667pfS/7hOIpz1U0BV1e2f+qiArju5M2D7kvWtT8dpt+Fn7l7LU2
         CNxG/x1AxLx8ymg86ZYHC3dyC4o4FuknMlYJNw4/h73JwdWXZJGnKcxyx/cYNihtpKC8
         tAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101180; x=1793705980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV46N3CfdHC5MLPkBRfLAChH7RVI3AL9U6J+h7PJVDA=;
        b=Eoh8GJlcK1pb9UZ1DDYUdSbFhbq6gOYLvyR48yg5VCnNn71pHV9i5QqgWTcgpIPh8v
         3i57pKwx0+hC2s7Q50ztX8KspPGIOCzxGbe4DRmOfJLLS2EeQR6IR61TvI2lYJJp1XWB
         3AoHgxiiENlnGad2gUqdeqHpZIXfroLMjv7fhMredHHbia8Bg4Z4/ix7KDRC0WhDJ9cL
         VmG6uLlwG7vQfFvSSSqWPcWZR2zyzxyL22Iwa2Mza/UPGXHQMzaIcRHg6HcyEsI9f8E6
         hyKR1XlL8N/LY53NAILHoga8gKHz8aZXFB/HZJUDqHPwXAgyMdS86aWV07v/91vW5ODD
         jgvw==
X-Forwarded-Encrypted: i=1; AKwUvBwq6lTacOGR3SeQ9fFb1rGWsaxdCt5N0UGF/ZUoTHRCm8kk3DoAnce0iOfKiOOof8zhNzFaAbkXOGKF@vger.kernel.org
X-Gm-Message-State: AFq9FYK8bOoasay0lU4J0sH70YG5HqB76+4c9gm1xTtXP4RKc41HFbec
	KaM0P7BtEDhfLjhZnqi3RSIr5r+0f02+tZWqzbI9rpxComGxoV9ikqUY
X-Gm-Gg: AYBFou3M0QkAeZn08t+vTbwwzaRCk6SPy8ooUDo0fzRDSSyBYfAC5Wfrl7wc3PYm22e
	2v1+1YRgRFgyLSdngdMjsWiKTS0jp+0W+TPMZVk5Mif649PNm4SF5JbaaTsRU0xim/PNaWkARJs
	l3LXRpjYx0PiPHN+aZczCJV314mw9KnGg2328GL43AzNv3vkvQTsK+BnMKtBqzBoLhqCGwjiwYQ
	NKyK5Qdk1tmn84MTDGm1ftbwN/tE8gF2L1FVTN0hy/JkPiXfsuEjqDOR3UYhLnbV45F4rHr2NXr
	/bXRdyS8POWFQgJXUwf8wnkPwTAMgPR2WtgLBSNXyvHw9mfQoOjttgnI7o10dELUaUp508ROw+S
	YGoh45l9Q/Ry5YZTijqJ8i+s38RnAYrUD3ajQLbub3RJHgUcX7iDNK9+2R6eOI4As7xcv/OEeWb
	bXZ5H6pXlx/E2E1pTZfUNNcp4sNruOFlwDkRDJNsjvi5gYyhzGkWIRPQFLnCwX00bXquoUFf0tr
	Vr4tIAcU0DUAym7rxDEUwVywrzGiDWpGEROykBdFKf6Tc9ywITa/KNu4n7fknO1bg7dubMlLW3Y
	w/ZJ7i5fTYpwEW+HD8Pk2f8=
X-Received: by 2002:a17:907:720f:b0:c31:91f9:60b7 with SMTP id a640c23a62f3a-c46bdde4566mr1027757166b.34.1793101180078;
        Tue, 27 Oct 2026 04:39:40 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm430272466b.81.2026.10.27.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:39:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: codecs: Add support for Fortemedia FM34NE DSP
Date: Tue, 27 Oct 2026 13:39:26 +0200
Message-ID: <20261027113929.65102-1-clamor95@gmail.com>
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

The Fortemedia FM34NE is digital sound processing chip used for
active noise suppression mainly on ASUS Transformers.

---
Changes in v2:
- remove ports from schema
- schema moved to dsp
- add return value check in fm34ne_dsp_set_config()
- dropped unused headers

Changes in v3:
- fix port reference
- request reset gpio asserted
- incorporate fm34ne_dsp_reset() into fm34ne_dsp_enable_hw()
- add reset asserting to fm34ne_dsp_disable_hw()
- moved bypass gpio deassertion before return in fm34ne_dsp_set_config()
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: Document FM34NE DSP
  ASoC: codecs: Add support for Fortemedia FM34NE DSP

 .../bindings/dsp/asus,tf201-dsp.yaml          |   74 ++
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/fm34ne-dsp.c                 |  386 ++++++
 sound/soc/codecs/fm34ne-dsp.h                 | 1030 +++++++++++++++++
 5 files changed, 1504 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
 create mode 100644 sound/soc/codecs/fm34ne-dsp.c
 create mode 100644 sound/soc/codecs/fm34ne-dsp.h

-- 
2.53.0

