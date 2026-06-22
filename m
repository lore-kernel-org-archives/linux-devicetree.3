Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355243438A8
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 22:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166573; cv=none; b=h7ZfxtHv2F3vhPE8kW6tkEv23scU3LdKiJs/NYDFGUe37Gmi3wd5CXs06jp0BrnCbtLXiDK8lRPF0HsFjwpZxhazmxxtaTvXU353akPsttavX8p4g9iAiE6VsqF3CVMzLnUA+MY6etahOTqES5DZ4p3eioxDIOHxZFl3kGeAn8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166573; c=relaxed/simple;
	bh=8ofovIchq8LhZfbkDIA+PMJXPYWidRkJzVPPzStsXGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DPaYA8HwXUxOtDpu15q0tKS9ScI8iHI6CgROmg+oJJzt3glGgYRu1L/C3mEVpmrZG5wVjbbwiMUoyc6surrEgAzY7kW4IIesY/+dg0YwU0EO9fDERx2jIWZpcLZ/hTXq+HT7SSQSzJBKvZw/JvGWD/iJn0AAy7tX3wlWUXxmPho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khmJyh8b; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khmJyh8b"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-462342ac290so5415687f8f.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782166570; x=1782771370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/5Vow282wNBoHiNek7VDSfC4rzQpZ0v0yruM2P1GnM=;
        b=khmJyh8beBVAqNrJU3V0P8fjXcEulkI1kEO+H9X48QF0Fbgq9ClzI9AxxJcPjPcUUq
         Rvc6OTbuRWDNrL4LTGWFjW3nJhBeilHX7Mx7ur6R/g7/WNZYYO52JjLeS0J/2YWLbTuV
         0NndpkwfDWa61WPMBos/md1KdBcyu5fhShkMT7wgtCd3HE8ZmxysMnbZzPl9madP+N3H
         aSGVoVo0QpF6SOVtl4du+BJcqOcLnuFUktWcg4xmL1yO0lsb9WJ/9l2fIku53r3xSIbW
         whVMG5Zvi+YtJx9vgV1sjZTwMQSPEmxP/A9Q3rk4nSOPHqB4bb1PC9NC1Iw2oWF/iZFP
         QNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782166571; x=1782771371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/5Vow282wNBoHiNek7VDSfC4rzQpZ0v0yruM2P1GnM=;
        b=LF4Lr2EsgpPrLeBjwUhPtlkWJ7oS6URCXgS97D4i+o3sZTA5Sm1t+Z53BlHqSnDb+9
         0UKHHnxaJlqoxHWbYhcD+bX68A+u51ys+O4vkQM2G010IO+/fqrQYzUiG3B6LyS/giNc
         yA33NdFFdJR9qaaW1gLnp/KtU0K8c7jzO8rLnzWm6efOdKrkb6mH/FX6K4YBxoSAvVvd
         ACsGFZozXq1j1KMoMsv2DuAjC/bEwXjcNuyHcSraN+VBxTYgY35rjKWr17mdG5xWvDfk
         v+RKha7PGKpS3tdhWGOJKquVJmsT7sBQFtTCFB7mlOHbpag0VosuxRpeU3Q7HUq0kePp
         f+bA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3xzhk7mUTJsWvZt7A46+nOX8SY4H+zebniGDzBd4nph1sfXXGFyS1vEZPD3ep7XEVWtc5isA7ki94@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqVnMRLQ/0D0fH85jLTneag3EyTF6H5AxrJLUZWXhVQWJwHEx
	S+QTESSSDmLHi3swixornbMeJWPUYrUDnP+4jZc5illkv6UP4PWCvYPI
X-Gm-Gg: AfdE7clbLZnmvIy2IKPQeu71Qk3uqLeUbah0VRtiGVeW5h5IeRgQ9FKfXPcxS+yKKj8
	j9pmTypvz6DOheSJAfCHD7PfLFBJtLKf1xmcllg7zZGOWNMBbVZGQhNCevDU4YHzwTH36mLCf9s
	R9ga85cFTCJ8WK+a2bx1x6gzr68HZfs0NG2hQIkqH0j3hDAbbfDdALWuutMznAFzTyKTZkZBkkZ
	JuUd4vWCEUb/JKI0dGfi/nNnc+FN/SFqNAeFOO/AA5iU+LFblNgKPXAq+6O3QkGfqEGhfKctEJL
	Drq9+CSr5wVswsd2Mxh3YO2SyORJGiRMHltAoPXffuqFjG2Cr0ddpbEt2R0ImXaBsK2bImt8KiK
	fCyLfY/zZ9HJ03JzG1iIQi5ulqBAg13u87Qr1AfDrDVLjifxAfMP8hTAW8TxcTfAvM2YpBEKMq/
	mM1TtTUwyFjAy8zR6iIkRFPlCMt7hnyhUKBCEZ1K8=
X-Received: by 2002:a05:6000:2004:b0:45e:dacb:8885 with SMTP id ffacd0b85a97d-46adb0b697emr83476f8f.35.1782166570380;
        Mon, 22 Jun 2026 15:16:10 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl ([2a02:2a40:27ec:2900::3ab6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c53fdsm31319845f8f.10.2026.06.22.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:16:09 -0700 (PDT)
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
Subject: [PATCH v4 0/3] iio: adc: Add support for TI ADS1110 to  ti-ads1100 driver
Date: Tue, 23 Jun 2026 00:15:47 +0200
Message-ID: <20260622221550.374235-1-jakubszczudlo40@gmail.com>
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
 drivers/iio/adc/Kconfig                       |   6 +-
 drivers/iio/adc/ti-ads1100.c                  | 153 +++++++++++++++---
 3 files changed, 140 insertions(+), 29 deletions(-)

-- 
2.47.3

