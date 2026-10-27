Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100774;
	b=zzvvnbsHGj1AubHKipauweH/uXpJyzrEuSIwN9uBA+Gs8jHh03sxcIYw7LRpRK7NoFtP
	 LoDlRKRai+jDWZ2dHAhPZQEfKyxGWtTlcVjo/m6nNsRBaK3APUjd7fEIp0sjKSApQffjh
	 r2O8zWF5ey7X06E5R5IxyRDpUfcxMaBb/yfIJVFmifIg9r1J4KYoP07JN4BRVvj5WQnno
	 dzXpCoJgBmvp34lfvfdBMFo9WYoL1D74S8MRxAnZzSCbZfDGlBy/o4XG9N5eTiqkTazdM
	 O1K/Ww++vKIOYYi0iJ1EuHz2R+aHVDTjnJySCmEhYQfeTw/l7F9v8TqL+rseLNsnF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
	b=jDf60J1WV9isr78/9j+1WbEk2t3US3XGIZkbN1rrYfBua7fEKXs9cDWlH2LZeLXClv5f
	 T7kqBqZRn0PVlpgatCKypaST9YN6FLxVSsLEFAVPxnHIF9F8sD3KnH3k54vG42+fVs0Pm
	 F+iFesHQbRL+JXcOdHEuXBwmdP8G4nmmHHpkzJaKeN6gctM4kJATjvoR0lXLwBy+ZL4La
	 Xv6Zzp2Th3VBYXndts9s24LPGKVpaFspXxX0Kj/NunsWiTelRQHF7mhDMS4JaUFh8ziya
	 H9qAV5W82em72Ou+4csCD8XyKDUUuNjz6x7DVteTyAPMviaSTdNY7YVKLlib2/v0ITQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rtjbDRds;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731B606A327
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B731B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rtjbDRds
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so603564966b.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100772; x=1793705572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=rtjbDRdsa+4/69vIpPHLS8kfTWwktRQGDqe1KoMSE8nnsKH7mio/0L6cY2FmWHuGAB
         hznm6SUWdCgpdhf69MYg4Mjh5nO/xikxw/GdJVyYySrCnsAjyUEDlhOtlp72OpuzcZqP
         kKoDPsAVIcKa0jvSEAmGNicp9Llmf0awS8YRZGx5YFWVf1DgNXXcaebpGXMJ0ymIsQWL
         uxHkEKkb8yxbEVusPQtksOoSpgaycjK+vk7iiuqINGZ+HQW1sr4ugIjRWm1WPJf5f1Rh
         7DhZ4XZr3M5DjPCPkmGsXfCg5oR4sDUqFmg3BqGltiRJrNhmX9f78LmYBVySflYJtW3C
         KeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100772; x=1793705572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=c5xUEImtGAs3w95qBTgWG2drBRkIR9AsjNGM6XdSn65uDTkQhSC6jFdtCfWri2Y0Ii
         A62Ejl7E5af+1ffqUpgg0KFLlMZuZfzwupMVdOjvdjDTMmD8uFFfSOXo01gEq3C50C9W
         1EEinEOZF4OOG8ymljLc3rpHinkSIWygRslnQickSY+DDr2eES4ooBMdha4+MvmswIF+
         ZtMHhZRlWw7NgE68egXdLlQejG+f+A7G+CH8p2RlAC0A2Fc+V2Fyv04efxAUSKa0J2Wb
         JRiNlwwW5FWNgTPrObHvqBsv47rB9hdIY5rIRxp3fsFntRHh5DVharhfWA/FRMZYHbIj
         ilAw==
X-Forwarded-Encrypted: i=1; AKwUvBw47l4D9a30W44yGQPub9A6v+UymaQbhTCUuJpGDQn4rXUJs553kRXBsJB7axkJLQvuIpEoJq3t/QTC@vger.kernel.org
X-Gm-Message-State: AFq9FYLihSkypmXdM581bi0Z2Uy5aA/lin6Qi6svmuuto2+6a+fz6xWx
	0SohJrKaUoqFPqGSVqwauyhNBIHZPggyrqEI7CtElUeUS/5ShXIIeKI5
X-Gm-Gg: AYBFou3dw0Wpv9pdz1hpLOrm09HYwmmcd0ay0mXo8gmAzZKznN7TB0Oq0MPrfJCVMgq
	uVyUIv2liihouZ72y55LGncJCbK7GOOSRn1Q4KbQsRTVCJNa+bjhP68P6GvtvInE3+tXwHTYqv+
	DNcB+sK3hu561//VCNWv8PMmvgf4dIdwp8brHtwChijGuErExtmLl4QelmQ3xurdLDPNFV8/DVy
	Oq7VJJGMxpRyhrO3PGzv9H8ZDEAWoDGaU/pc2wrl+yE+1Adz46kzcgLLREywYmiEfXgSJAa50aC
	jG09U2PcYIFFmTT5NXLcRYNcknincgPeKzIMip6w9vv7xdTNTmp8+vPK81UAwbKZe8/jRzBzg6J
	jROmpOqWTfPFWgY7MvUf0ZflVzMnHR1ND6P8R7ZprE9R8pusnfCn2h0X6+F1fb0U3IAkKoBZUHc
	syJiCA6Hiagiv5PQmtwnWe3j5UIRZaFvQ+B23eC3ZrgMj9hsLNUmQk7tanio42wYtkCbh+U/wVb
	8Awk1feRtFGwL8HHsJm9FyiqCD7IyZUvjFjlIQMwCOxgjoKGu9HPFnLP/qBAK5kZapL5IkkuA7s
X-Received: by 2002:a17:907:9307:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c46bde93525mr1103423366b.39.1793100771899;
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/4] mfd: aat2870: Convert to use OF bindings
Date: Tue, 27 Oct 2026 13:32:26 +0200
Message-ID: <20261027113230.47538-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

