Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006F03546CF
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236348; cv=none; b=bMY238PN6xDmsdqi8u/tMg7MB8URDOK9+aAdD9U0YGKSYPgw+jCaLmNEy021w1jedM1HXVeh397/Eq1USzEtEKmOjGgZXanR7gZU0FwNvxA36F6PHavjmVRQorGlxOAkfeOBDyNNKzR3oXkgU3w3j/E5ZQ5Z4PH/xQfBVXl5oDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236348; c=relaxed/simple;
	bh=oIAsE/e03p+TOGVzlvCWR9X1duR52+pknj+r+YshhDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2+ltVCS227o6hmvxca1blcC2Y35B81FP22DJPzmETKPKtLGV9jibuQNfvq3VM4rRanmQJZDHNoOiQeoG/E4okh/aLVpDQkiGB6g4fUnv5G1vQcdMdQGMDZYgQ8hnyaJBM3M14awrl1dl+tVQ1igk9PmU54Nlbij0jzXkW93UuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ip0itOWo; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ip0itOWo"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf9506704fso1069527e0c.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787236346; x=1787841146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gm+SgYfIRbiDZdeJlutFSVssEPZa9jM7xptJ+k84VM=;
        b=Ip0itOWod8TCkDrqG38gr6Tgg0TpQLNhkdKubId/Q5wbGUtbJ4ujrAerpC52sHXwb0
         tR+565KV45tSQjbpgvTxwdUXcmdY9KxWalH7cA3I/OpCla85lcJGhNbrb4bMzzAKmY09
         YASSKTGjGtq9BLfRWcqOx3vsaULH0QcP5i671CHT2L8FUh4qiirNuekvLDq/pcnK1/ZL
         sH1wFDS6RwszBDeX7fWcgNBpxtRN0aWwhYEyctlcLJOI+4znbnqe89hDcky3cRqhUt/r
         7F6RuLlwGyL4nHo75G3h5mwKmfQ2LOFVFGEsLzV210eZIeOXIvoi1bo/IfiipWrZi3Yj
         k32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236346; x=1787841146;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gm+SgYfIRbiDZdeJlutFSVssEPZa9jM7xptJ+k84VM=;
        b=MdzXVkhR9VrnyAxWHpHKUFKxOWOMaH5tqszuIbybcFZvqpF95x/TALljGLxTmTnXGp
         4w8d/QfC/wLQ9l7e/dZEqS/27ChtNDwiDLR+dp/uKM7u0ApBVXNt+WZq5NJ6nFkDQpb2
         qReTeVQ8DzgnGq5cN7U/NKoNlhjCXIIPjYwS3ySPzerhHB8iALL69jFwns/pOGpphFQA
         w7fch42sXcCxc3rxotW+vIDa5mwvKpl/4/iQf7duITpX+pwMOqovv6sgF6zlpe9Mk5td
         1greR86I30fkmzPQJBH9uDC+TvDuZPpgRdZCWoZ5g+9lcrJ75Ooe1JNhO3PkZCYe0Dxe
         Ze9A==
X-Forwarded-Encrypted: i=1; AHgh+Ron4IWmAAEIQTvnqJHjCiLznFGAqWqt/gljHC4oo5TioaPC9MrXUEF++LoWvcU4JluumDEcQAysdQ1y@vger.kernel.org
X-Gm-Message-State: AOJu0YxXpMdRAAxuwljvK3QLc1hOT3a5fwQfsRiVuuEiGey5SVMOYz7F
	5q0d1XYAOnP2NhipPKcJ6/nt+uQhPvkMKqlT7e1ZuGvmgABHNBBDdIs=
X-Gm-Gg: AR+sD10O4UU6mY2hZKdO6L30AtRFIF5J9Ix2V80Ucpzq5LMgHlB0MMwbjTq9OUprR0V
	Mm4VphrzbYvjSx+dI/eus8CNsa7rCHm8tvq/P/BSStsZmcQWHrXOIoGsbI5ovP7WYIQ1r6EbK4V
	g3ksxGzTVSC+rKYfPGniL+gAFNZWUB5UKFraYVwqpMij2F8Q1s2NV1/E5iIYDZVyG3baEABZsVg
	fbPolQke/UQ+WMANK8cuSCnbXKwbsVaNomTgStgeN2LRUOD5YTt6ctg65p8/2xajkThi/VpyBDp
	G12AKRI9HYNaH6mlva2nnIKxPqytjKcdIMhPcGjJmmBQW7YE15at8VABB/vC2wWoGcFaKfGHJDq
	7FCiuhLkZF+CKgNbH8DPN37n8WSr8i/HfPwF/8qq/zMec9uKZcsO/RKc+dM1JNTS47HpgYjrQ/v
	B7Zo4lnMRIk4AH/ud9Q8HLK1evkyxkxQ6HykUMPtwW/gD20Eqza7ceVbes5UMF7jdoX9yH17UDG
	RI56siNJ/O8IYjkwDiABhN0UtdObFpjvHoH5Eed
X-Received: by 2002:a05:6122:3129:b0:5c5:ac11:9731 with SMTP id 71dfb90a1353d-5c5e3e4c415mr4869914e0c.8.1787236345866;
        Thu, 20 Aug 2026 07:32:25 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3459sm6393922e0c.4.2026.08.20.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:32:25 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4 0/2] add support for Aosong AM2320
Date: Thu, 20 Aug 2026 11:31:08 -0300
Message-ID: <cover.1786973355.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
communication protocol and measurement conversions.

This patch series adds am2320 to the i2c_device_id table, creates
of_device_id table and adds both am2315 and am2320 to
trivial-devices.yml dt bindings.

v4:
- Addressed minor styling issues in driver's C code pointed by Andy Shevchenko
  (carried "Reviewed-by: Andy Shevchenko <...> from v3)
- Adapted commit message pointed by Marcelo Schmitt (carried
  "Reviewed-by: Marcelo Schmitt <...>" from v3)
- Carried Acked-by: "Krzysztof Kozlowski <...>: from v3 dt-bindings patch
  since bindings patch did not change.

Note: I carried tags from v3 because reviewers declared the tag after
pointing things that were resolved in v4 (and the dt-bindings one
because the patch did not change from v3 to v4). If this is a mistake
please let me know.

v3: [3]
- Added "aosong,am2315" and "aosong,am2320" to trivial-devices.yml.
- Added of_device_id table.
- Replaced using a constant for driver's name with chip_info struct.
- Separated code changes and dt-bindings changes in two commits.

v2: [2]
 - Generalized KConfig description text.

v1: [1]

[1] https://lore.kernel.org/all/20260805183733.1000550-1-nico.antinori.7@gmail.com/T/#u
[2] https://lore.kernel.org/all/20260810183337.451812-1-nico.antinori.7@gmail.com/T/#u
[3] https://lore.kernel.org/all/cover.1786725567.git.nico.antinori.7@gmail.com/

Nicolás Antinori (2):
  dt-bindings: trivial-devices: add Aosong AM2315 and AM2320 chips
  iio: humidity: am2315: add support for am2320

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 drivers/iio/humidity/Kconfig                  |  8 +++--
 drivers/iio/humidity/am2315.c                 | 34 ++++++++++++++++---
 3 files changed, 36 insertions(+), 8 deletions(-)

--
2.47.3

