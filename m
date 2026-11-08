Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130997;
	b=0kqUuFD9TBpeLiTbDNBhkVnilvjbzAoBQmOtzGIlnCuqIBkNEk3NIuun6QJvNdilFnAR
	 Syka+yunb+26SR7Gt+fg7JqcxgWY0dGbNH+AaX4xjhaq2sqfJXjhkrez1yGoDBgASDD7m
	 YpJC+eDOsX5/PzuRMAarul3xUz9XBWM3ZswinKF/stVUREX66je5oaYFpQ9vcmyGk3kGf
	 sNpBte0ueT0qy2NP1bwzUJeBWtlk0aokfPPU6itJLglLE2Xu/DQVcPZFKRY79I5HAKT4D
	 KeDOeuJAB2M6y9cSXQ5eDDGFlFVgZ2B0VcBFe84l9BYxW5QkqDmkSj1whoLu4URH27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GfUzsQqkjBFZnftE07kc579ADex8ACNapCg4XsBJkV0=;
	b=wJU3X/XgUYipCDBOqveU/eUm4v2UNqFiidY5T2LdHWIOXY8K/4K2J7lpI3fjYXbagVJ4
	 Lyxp+DA8luVs0p7/dKJ48qHsI6V4sg60c13DFEoh+N6me39iRJWhf7IvqU9lHYea0JySy
	 sMv8eLfb1fZUGbDzw28mw3GF7QEGXNHfq+KVB0yM69d5Hjl1GcI9tj/z+taK1Onjl5YUp
	 ej6C7ByIBlBvDPfCYOP0rnCPoFwpgRGW8AGUgTb/0JF8l867FtKC9DQoIcBAhPcjhcdyy
	 FOm3aljok4NH9Gt4yIzc88t6tPEsQ/x72gPx4pxAVGdy/om7/j7LBH077oPOQ0TdBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBvCECDt;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA91606A333
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA91606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBvCECDt
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so11329a12.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130996; x=1794735796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfUzsQqkjBFZnftE07kc579ADex8ACNapCg4XsBJkV0=;
        b=CBvCECDtMZ21MHgiuUBGSs384znpHFFtpjSrrAQkXfe85KqphHgLSFvfxAvdzrkMqp
         lPQ6YLRo5/91Nah7agor6YI1kCUC13rbeClY8J5ktIkTBElwTG/IvI1ssJmrKYzwXeUX
         BtPFXQfmZxkB8M4Os8xUBPTbuToUTi9YGVoIvI5RJoUJUJMO3x2zm+NRjeRvi3/Oub64
         Ow3AXEq7yS97bbF7xquCHLnHJijBuaFnb3xDUTY5L0w4IkfIrjmUpdDq1OqHaVA35Z+h
         URnmaCgOKTw9zoeybRl6ij3S1WZkzZ8jnUaa57gvI91NJ4v7a8i1Ja4Ry+1J1ohmkme6
         vekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130996; x=1794735796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfUzsQqkjBFZnftE07kc579ADex8ACNapCg4XsBJkV0=;
        b=kiy9OMwClJWvVF8zGtfFSUVC9RegS/enDaC84iyW1oOhQ3QBfJ8Xt6oTTDJSUdZi04
         ojXtGuyfEiJfDoefE/dgIsHlSJdeLHlW+27vy7ZSmbU27AMB+wrphwGXMa9hlJfwRx2F
         1MIG1KTH2A3GAbinDv8m0lPawGHN+l8lQWte2L7FIEjHjrGjvHr45gy3+4bC71ZXV5fd
         u80f0jrAt0zlPVKjJV6C0pLAE5oTeafNnVRE//iJbZrubw+YC/r6HdzR2LeF4E0X+sYy
         I6ArrQEvK7YkupI7SkeD4OS9/LcYivpa6sgXHS+KOq4LcVVvyYT1HNnjtEcLtYHsoquW
         vpug==
X-Forwarded-Encrypted: i=1; AL+hErH54ftlG8fMMF7AvL+BgZS5MtAju0DY85RAm/YvOJFBAOrBCFh3pZMDFaK8Qad5d9/dYa6AWz906eLa@vger.kernel.org
X-Gm-Message-State: APuU4Z/dn/lBpuretTveAmS37Tlv+hAS0dnHPwJI5n0JyXizz7/2KkZm
	/m0y25JAZF5btndC9o9H1OjdcQmw2a2JvoquU6+ViRd89sBTYHkQBEPL
X-Gm-Gg: AYBFou2wmKfZqLNGXqN1Y8IW0CI3jXFZ5etybWRHSnNePXWC4v2tUSmj9XxcPJ28bkI
	YiePNh6HUfxkHRcYSfR+L8elxkAcxuCsU5LdPTUlp1XcjoG9j61ogSEGaeyO9qKBcYQXLW2KiWM
	abOLK+3egCRJ99jYR+5U9U81EdDhj0pUhHi5Pqd7QGXhIN7z/rWujXvjmb9JUza5HCyFYfD3y6Z
	Tsv78DiF98tmyJ6BeyN2GrHV1imOX1mbLA+U0JjKrHlUyw5iuCdWskRzA0bktaKsW7cPUszQEye
	WtJqSNLocCc/gz/KaYZfIxHrHtYi+hu0Ko3zycxuiCvBASDE66NBWu1mlV8NVbm8NeSElJwae5y
	IH8IfXHBNTqICqSctTns8x6ojDeSHQoImRZpjn3ugSvKoiqJjDK1Ig1XLqew3+pRG8MLxNt8zXu
	gP+Crqgkswo0cHD8hJCu/pnjFXPomZl5URo6gs1N1OI5pzPF1Wfn5OnAePqHAlDc/qcs/XgLTz2
	23DQj+GfMahCD+EvXthlBeRMBjHzrX4d5aDHi2jZSMg2/Klz7FwUVbPRF5WJ6sCyEfTm4L8nmIw
	+22ZT5ss+u36RU0K82MXfQtoA8dMWXJ3pUE4n26n85Kv1/8suOD6bpQbOAvt4iAfN8wowq2jO16
	A9E8VFSVQsA==
X-Received: by 2002:a05:6402:4010:b0:6b6:f7f7:dd88 with SMTP id 4fb4d7f45d1cf-6b72246afc1mr634054a12.17.1794130995645;
        Sun, 08 Nov 2026 01:43:15 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm436321a12.8.2026.11.08.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:43:14 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun,  8 Nov 2026 11:42:49 +0200
Message-ID: <20261108094253.83899-1-clamor95@gmail.com>
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

Add support for the Lite-On LTR-659PS-01 proximity sensor. This device is
nearly identical to the LTR-559ALS-01, but omits all elements related to
ambient light sensing.

---
Changes in v2:
- set IIO_PROXIMITY channel to scan_index 2 since driver will not handle other
  id properly
- add IIO_CHAN_INFO_SAMP_FREQ for IIO_PROXIMITY channel
- isolate missed ALS register calls
- add commit to use read_avail operation
- convert to use modern chip info match

Changes in v3:
- LTR501_INTENSITY_CHANNEL macro adjusted to set predefined info_mask_shared_by_type,
  info_mask_shared_by_type_available and info_mask_shared_by_all_available
- added info_mask_separate_available and info_mask_shared_by_all_available to
  proximity channel
- fixed IIO_CHAN_INFO_SCALE for IIO_INTENSITY since table has -1 entries
- fixed indio_dev->name asignment
- dropped ltr501_has_als_support helper
- fixed channel finding in ltr501_trigger_handler
- isolated more accesses to ALS registers if no_als_support is enabled
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 424 +++++++++---------
 2 files changed, 208 insertions(+), 217 deletions(-)

-- 
2.53.0

