Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733118;
	b=cERbaIpTFa+PtHSQ1KEhq33Z54uvKMAVjcyiuTN0ssexSxBBwpv8iRKnWWww+8qkb9Bh
	 90lTSZIF/WE1NF65rwykZ9vJCn7rQVQs1WDHPassO1qqUzIlufeB4ESYJWUlDsXyrBXS3
	 qISBzEQGUNx6VuG3yPbo4X3LIOj2gAH+lRUNaBZAPg9jwcoz6aJP78rulreLKLVKh1HJl
	 XDwlfRrJa8dhB3OxWiKrfmIxv4/qHlb0vG4cXCkfnpwwv2EyFZYBQ3rRfCTn6RGOKQLa/
	 lmwZa1oviW/Oul1jVVnVtOw0/4ALG173mUXjR1mz15E938J0iTpLaam1lq9K9g7ud3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
	b=wT3deYPEpjPp/+t/ael+6ziZgkTjw2Z5IeJV3aFVEYI+3225RsjP7PZ39vaNBxomTnq1
	 I8/n35p952OZpBR+1tzABoDLbJSinrUEQjkwfZZb0No73lWtmxaguS9cOId2BSeJXt8MJ
	 Na0UAeNsUP+luCCHN9z6eXo1GpgXMMwo0ICuR6v0fbasRy/9/qAstJa8SNs2oBEp7mG75
	 NwEzZRM+ICk1KqZ1CAQH5r8x5uIuz0ES03zHpVHd8kl5Fch1iO4kq5xdNUo72uDllqZRh
	 K2pJsknglunGccnWzFKW3/KlCoiIXKQVRHmOQ2IPfuCiKKctHZCE7CR80D9/fT7OegQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxDgOdPI;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55363606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55363606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxDgOdPI
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50a4a2132cso299244966b.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733117; x=1795337917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=cxDgOdPIXVmH57Fd68NwsdJOuUZP8P8vdJ6d5BdqZUabe+Ute9wkApOR93dPGFzm54
         TyCDW/GZUTprEszT/0jdMNrLPbr7AU4aZgtO+07t7eykMSJSKemC19TNIVqoPM9rEXLC
         gn8ylbQm2QbrJUNsUwtL1lfFPvRliu8uarTjaHtoiuggbfwP01ziLWyIQp/KumpG2wJH
         +OLv6HnZB76Y7uBnDgVT8rMHUvGjPE57UXDrrWnPqK240DsCVAH9LdO48xRJkxxgQ8Iq
         SIgPAr6IdJMeddfYGaOsMGA5oxxy5pnE7+8fLwCqsQcLQyXlrq38AtinDEHaOJ8RMwoG
         qNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733117; x=1795337917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=M1IaKUJILNMbD+Ad8fzjeJ4/2qFhzh/DOcrIenE8BhKBm8zvGjitNAh+quk7W5ZuTh
         tDZyLq8v1wh2hJOnk+zyHW5wQCHj2ZMWz+grsoSrtiWCwobmPaiAHSR7E9hRBcOqVewE
         XUVy6KZEx2RkAVfI419ciaqQ0A7045vUqQ8/qyc33FWZXzltGdGKumVZQ9jaVYCBz48Z
         6chYknVstRmSMtvA+R/nIz47NU5hGmhuImcDeMIp8fzlEc/UcQdwohXCNEAGd+EtvDFx
         MWgDVDxckXcztqyS7qBArqVlHBs6MsSNoHSBGcDL9KZOolMM8hvVTJrXHGMKEJ8E43cd
         CwIA==
X-Forwarded-Encrypted: i=1; AL+hErEzxpuZ38Xl2Gi/hbwscO3kfld8nOlHce3qbLaP4DfCiXQt7wiuehaapKM1rS1DD6mrMOE1jFxXstnR@vger.kernel.org
X-Gm-Message-State: APuU4Z8xXY4rfBdA4nKcqTwiKvzuNSXF+jDPlAlqefRJR/per4kBWNLd
	p++A7Bv7UaYM8Ry7gIZdznxS7dBGxshCBqu6T9/9GdXwhqMRNbDVBtCC
X-Gm-Gg: AYBFou2pYDayVC3kW+hJYkCyWOCY6PEY/3/aa7PsIZsVhqVZhGBfeF5i9uBypSmtMo1
	S9gtzjaR9YANLuvu5Mz9mckzoaJA+TbDwvPFIrpGj21b6pzcTni5qsaQLX4/LMLNRyjSFWC3BKX
	2C6BEoolty+tpFT/PWeIp3gbFUyP2F0R0pLkoDNCdZWOdkWVb9MiPjlivbLpuMXRW1EmODPb6M2
	6lJGWTPqCAWP0Y5yhEbblkX/3kCtvePd+hLN6nIqfIo2Sb1KSdwQV1QzzepLhRqKlpjHdJCDW+i
	r+PVhg8cqDxXFeDGf2oEktZFdmGg4zygpu3+M0MtypKeoroYZFT9mvA/sEP7Fp9gjqLAEY03LrV
	c8twoWuvF2n8KYTU06x4wrGskk/mzYDI4+5jHQRs40143qlgq4rLp7aS6BbdCvsYo+pdFYL9h8B
	72GTXKIVPjYJlQvZGZpJNdWnppu2KdekgM0V2QECLpLT+E9NghXqwYPMQqcEoLmzOVyndM951om
	Xu/XqM/ceekbG9zUvX7A3J49wv13ggBAL+Nv1dp6XUIuXqAbo1E1iF6sa5yboaAtdGVf2hNRnF2
	O4EfdLqAADekvlZBq8LaZptX3fvv8TTxwfBKg6LXM38ObhikH3Hdhn+h2mJCI8dcB7JeJDg6UUl
	jo1mgzBKkCQ==
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr585009166b.22.1794733116617;
        Sun, 15 Nov 2026 00:58:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 0/4] mfd: aat2870: Convert to use OF bindings
Date: Sun, 15 Nov 2026 10:58:21 +0200
Message-ID: <20261115085826.89641-1-clamor95@gmail.com>
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

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion

Changes in v7:
- rebased to be applicable on top of devm_kzalloc_obj conversion
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

