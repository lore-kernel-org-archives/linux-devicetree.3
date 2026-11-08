Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131806;
	b=RhYi0tzXXxlpyTWgkPML64AVkAbYhPUzEYfFsb742b/fH7K90irRpEv2fnKycz7HAv3a
	 T0k0Hcg6R7oawPCukutm3C+wgwybh1g09pdTEKr7sbtCT+kR5NCpqjOoy0e6gy3BMCOx1
	 butMhT0TnDMKQ9Mki/DwvmVOp3N5/mNgxtBt5Pv1j6doPEM0CwoAylVtBP1QjEaNX3qDS
	 oOhS0a1btrHfWei1bc5LofYyyDKyZOpeg1jBSOq+rwWPGa/pL996MfLx4cD6AfrIgy06r
	 0+2BEhrG4Z6Y/8Qr5nZoMTFBv+vG5sYKDx6cV8RZKDfLOUVUtkCq80LGX1AMQIWjeRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
	b=hxpJzdfyjQZXxTn3No3+01bTj68nYkirQoiHHQDdGBfKyUCP2YEXmf+Uq27MQDgzZday
	 YwIe23Q/2nfRtPuBLtNJ4u1kwQ/ySqNSGYOocwe6llckZHRNWutZDS/1N50Uo7mgvYVDL
	 RusRSixbwWqJcAOkMxHXvZLNKiU1xbrqxofVOX4CtuZzfIktDdXSkJFcbiqjiFaGnhXbt
	 RVeROkdTyKVfrqKTKVsqAcTtlnsvAPo7jdFdwpu2h50XfAOoEnc6paewwiMlpYI8UPfqG
	 7LzMU3JABV6Cv+fwMpPpKiLKx4oHXua9UzAMxByhVBXwMTubYsls9+LSaCUQSNaBJRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUjqusQa;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4A606A321
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUjqusQa
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so2683766b.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131805; x=1794736605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
        b=lUjqusQaj8Wf2o/nv1+PV+497UA5OYJz0uJeVO9W8iBalJ5xK9HWhRAoNlI0QQtB/k
         QK9prBkdbacVPTr6Pfgz1JI+U6arVkz/DAN8ba4s2/SXkd0vDiL48v3TDsN0gOycR7r2
         JO+uXyWzoHeoa4xuEetHbpHmLOy2KsrRldJWXilK0SNfuTktCahmNG0FjiCPm9IfsQOo
         YrB0wiFGYaiaGWW4V3ypnNmR5A9ZF2k/24ghOGMWplFv9V7+wtS+MSpfKxajNWLACVq8
         2JF8TK0vVGpIiWZ1jnPoeKUfFQi9nNguJgY2Gd27VYBRH4S8rCkpEuNUYfNWn1TxxsEL
         tAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131805; x=1794736605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
        b=zmVKvUpZCmg/CBcY0yggYSsCQVpvRRUXn94hmkz2fJTWorh+Fw3wI6r8KgBZ5BBM9c
         avrpRB9TcPQqgeslLPDat1HrjgcjFSzTVv5m3hGd/a80ZcIsKJT9qbQvR6L1hRQnCsyV
         uEMcIT+GAPOxAxO+JYHVPRgrHtY/CJ6uRst5zIo3BvUVWA0a+u8/4guG7WnaEI7EDGo1
         peK6sxB6o0X6mBVSOWrPunWO7/BU/i+b/IndalgeJxsanZ0nNddozTmDvBViB1re8E78
         8eiQnht73JNcFZ0hIYq0tsdA5ksEPulSIq3YdKXz05/SYPn4Lbzc9UtRixzTcRQ1IN+v
         tzjQ==
X-Forwarded-Encrypted: i=1; AKwUvBymu6mrtIxEjHl3tcepLjZxpHgwEuYEKeQDxGvjEBeHxVrUAuT6jPcNU4FSH7CUmyO+Z2Zm0pKfx4Qt@vger.kernel.org
X-Gm-Message-State: APuU4Z+PFZGjzPZKZQj9QPWylvhltyaCWpB0gj0q5Ph3QBj8DaJ1+BHb
	sO2JGcY8TWLxFkK9MyE6GrQFTcyheEQ8Bev5qIM7nk46av/nSVOWx6tf
X-Gm-Gg: AYBFou15tzvarTLtQhYMkvhrdePLbs+FrNsDkz9UF39+VeFKd02g0JdH5VU9HffOchr
	w0rLAbLt/IXag/qPvMMklJKps191jULiCEmVq8hX+UOahOXGV+c5IYKDocV4uqNnKduBNIp7HWy
	OYfz2IpGTMCkNQyXHL0B50FdZ+++IOXFrZBioVodk/gnAYIbz+lO/Z9oW5joUOK4e1ZbOKlhInC
	rIcVEgC/dpwLRd/ILSg+jIOXVtYCSCOwKp78BmdHV+2sK0X20KfTqBy8v/MtnJ2ugBZOY/g8mew
	F+mA5Znn7tmDYCQmmSYbFJrYKMETkNL10ZMkJy7slxONL0Tao3tVbEqNpbYHcbVHmJ6eUVHeIha
	tE9D/IHQ8Wzq1o2Thh5RiPIBdG1+Tccns9i/BMA5COv87/7QMRxJIvvYubuATp1ndzj0eWdpfhO
	5GRne2MOLvXB6HNdDQmodudhjIb/JXkV7zW6eK6C77v4L+UcluFAvhkSuPMKOl82IbSez5ZWz9B
	CSDbZvSPLmW0Ur/26aS/Fb4HLHE1Mj4RT7DdWTLGJ+3SletnTM4ak3i2P49axpfcWAb0vGsDl11
	3Ek8/ZvX0bctDo1m2Y1TSxXQSWjrqxQ/lJMbicWYrV29E8CNMCGl3lh+WFqxgn+MigyGH2Z2fCD
	SS53MXX3C806KAPSqVbUFZmv6DiCxEpE=
X-Received: by 2002:a17:907:94c5:b0:c4c:eb16:b567 with SMTP id a640c23a62f3a-c4d6d4e45b8mr82837666b.19.1794131804580;
        Sun, 08 Nov 2026 01:56:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun,  8 Nov 2026 11:56:30 +0200
Message-ID: <20261108095634.100517-1-clamor95@gmail.com>
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

This patchset has 2 dependencies:

- patch 1 of the series requires this patch
  ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
  https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

- patch 4 of the series requires this patch
  ("leds: Add driver for MAX8907 LED cell")
  https://lore.kernel.org/lkml/20261027115006.86032-1-clamor95@gmail.com/
  Or to be sspecific, part that adds max8907-leds to max8907_cells

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 195 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 +++++++
 include/linux/mfd/max8907.h                   |  53 +++++
 6 files changed, 337 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

