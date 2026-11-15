Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731876;
	b=iXMivSLw4wkO2MVbsY1IfhaCOn7ivVZS2dH1Gy0eAI0ocBDhfO+yWnQgb/3LKVHk3yqP
	 1fXKxtv4oCbo6PqYnDSyRL9PmZ79YpFhETCG31XCJsb6tnl6xjPe8M0QTB/AD1oprt5l7
	 +ZLbS5WTUB4CjjelK2Zpv+BDjWgmnk+S5vu2NdPP4QkxTGHiPU/QMtinSSXCvfElCIB8H
	 tSvQFCEGB1wtwl+zenk0iJQ8imOaHky1bOcgr02VBZO7kjbTtXasnxjMlA1y9E+NJ9iuA
	 MypzmT2FjoLWP9/4hEy1HPuTM0ehSm3y6Mwj47S8SS+DOnEJQhDwqEEWy0Uc5thR19g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ux5NGbtqF+gagUInPGtsI7+EDxIceF6FofSlZy2J8g8=;
	b=R+G/myoXpLplxIE04LPeDust3w8rBeZDNyvXMUfdRVL2v3P2+3k7UAwrLc7OWlhMmRNh
	 AfrrOTZcg7nhEyDuIK9ISwHPMrbw6L+TrTEe2q7IRQgseJtOYYpsASCftSPE8K6PMzDoU
	 5kS+Ae0DMLlO30vE2LhgklgD6AbnvpB1GWiZl2oWvV3r/NUcwe5qzN2R4WUC2lPNDwsIE
	 TXQefCmUOdPs/lbBzR0NnHPE2a6YeU5EGOGKFaB54/cB6+XUhpjKCa+kG2JBbD/Q35ZpJ
	 XQcByuhKKPYvf3KHh/wmzYSeao2qUaonT0L7XJiBsiBL9uPneqLtCi0wdNOy0umionw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zB5gkDW1;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDCE606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CDCE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zB5gkDW1
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d21051042so427870066b.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731874; x=1795336674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ux5NGbtqF+gagUInPGtsI7+EDxIceF6FofSlZy2J8g8=;
        b=zB5gkDW1BqXh1JNvLccWrWrGO3i5x3t/XGqujrE9aStiElStX+CTSJLCXROTO01pkX
         leRQ8gKHYsQUQqYjgcBGYqxVVnmO0t2Eq6WtTqBGFpBMcL0344Xr4SqRkrX0BeHr8p6w
         V1IKWXxIc4YKyfdS0U4kmaqQovnl9QZN2WWSEl43ISd5+P9aqjEYKV6+aaRCeCzdkM4z
         4ea/tVNnxTyBzZ8MntZTwqHaY0qdZ7C2L3/7a+VL/zkTIEsS//Q3S2gWY7Yhol/Vwnoc
         r/EoCDlXpFauYAQLNdoLdb8kG7Suk10lneEhlTKgY8qt+cN2wTGrLw+PRkeQS412oB69
         v8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731874; x=1795336674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux5NGbtqF+gagUInPGtsI7+EDxIceF6FofSlZy2J8g8=;
        b=p2prYfQwmlWMs02rJYjH4CnPVcgwbZd9qiL3hZhdbk0Ekbu0W9NPw2dGxeo2LYFwyh
         v0NCK7AdzW2uN9qU+0rUr++zE9EzmBNBJW4XURLOHcNlyIULZBG9o7nbuyoICqY8lBRP
         Q7yidcI9ymbjp1PY+2M35d/P+IMq83nV08GPjo5Eyrt8ISQ2Jo9KRcLNK6WTKLSXCa0F
         PzQnxYr/bS+n83aJQYaLRom7ce81oI1WRVubYtd+kiGRIiTkowidJ5+D3zIP0u8rKxuN
         qWKqrNJxahtdUsXmiHH8cboEjpQxMnPXIC/TY1q6NyNpWcrLH9ijKHBzlolDNwRqIcOE
         +D6g==
X-Forwarded-Encrypted: i=1; AL+hErEHPduJaw5kaT9fOpkosoPjiU8e6/vYP/2XMtkKOp/Y3Y+wAv9J2SQHwzkYUEcmebtqnC9Ayx8DxGVX@vger.kernel.org
X-Gm-Message-State: APuU4Z99UsnO/CkKTh/ILarXyCEdIYURFrcwkyS4/6oxqjJ9qwryFxF3
	9an2MWdZ/+0sY45RCOeTK79TpKNBOGHxvFCLCxxLDIwUBDNRLep5wZPNJXM3wg==
X-Gm-Gg: AYBFou3W6R2G7M5BtutpieRaePyK4x7MC7DmNU8SFLeaWxkdPpxihB78DI8+asuJ8em
	URDRIB2j01PxsOYIT7laFpvKNdK9gZO5vj0spKyoJNp4tkEAAjg6SqVOceHdJcZSBJ/5EKFTwoS
	ZRHY4aiAUNcqg7ResUG6sXmZ8c3H+0crAmeamHBDnkBxTNaw09NjgatttpPvsJJyJjXudDBDHeN
	J7WaCVWqQ8eo8NbC49KrX4NvIrV4JbbH5QspOPH/ZKqnWKibkpHERO4Xe3blf4pRx8b/xwjeYUP
	Sc5LYH3nj0o7Q2D+x6ZU+wLbZ5Q7mBpJvkZfh+30UjVNMGJc9965Q0doo3uVTQE583j4eM5wmg8
	L6b08DNcVW/MFfi+ddzK+L0UIOlc68ec/jwN62Pe1aGwrM0mHPatnoCyCMeu7uTe3AJPNzZKb+Q
	q+zmiajfZIEQVgNc6wp/zp/5BHMg1RXTlu10ep5wS3fbWGp4IOrDzH1B1fnGhJ/EnE/AooCGj9X
	+Eg144syLGO2JUMMPRSbe3DUkBZY3EOjYPYGlMDYfiDovnwrxxKJLZkQqPO8B4ZBXdkAnnezCBX
	Jpopaeu6BBJjy7qBdDo/71tdzKDnLy8BD1bgS/Q8LEehnA1jvg1SvyZTSICwLngXf+AWj/VLjyC
	jCAKOjFirw4Fnj17TnP5vSiYnYhN3+ao=
X-Received: by 2002:a17:906:c14f:b0:c50:5a51:632f with SMTP id a640c23a62f3a-c50963ce147mr624639366b.39.1794731874281;
        Sun, 15 Nov 2026 00:37:54 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm284815666b.2.2026.11.15.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:37:52 -0800 (PST)
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
Subject: [PATCH v4 0/4] iio: light: ltr501: Add LTR-659PS-01 prox sensor support
Date: Sun, 15 Nov 2026 10:37:37 +0200
Message-ID: <20261115083741.62140-1-clamor95@gmail.com>
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

Changes in v4:
- adjusted intensity scale passing
- int_time and samp_freq converted into 2d arrays
- for_each_set_bit() + iio_find_channel_from_si() > iio_for_each_active_channel()
---

Svyatoslav Ryhel (4):
  iio: light: ltr501: Switch to read_avail() op from manual attribute
    registration
  iio: light: ltr501: Switch to modern match mechanism
  dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
  iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

 .../bindings/iio/light/liteon,ltr501.yaml     |   1 +
 drivers/iio/light/ltr501.c                    | 425 +++++++++---------
 2 files changed, 209 insertions(+), 217 deletions(-)

-- 
2.53.0

