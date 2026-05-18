Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E6D3783A2
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779117598; cv=none; b=q4tZDE+SjPHq+IFI6+TKZMilQV3WqsfSsmEXu5SRBGHcX49jqMruG9NIyXqRPex9QtLmpQy0s4MdMQv18w//KZNbJFx8KwjjxiYRQ7KalU/Qn4am6pb3otsCPKACX3lTKnEsAXVROLgLzKVz6UVoULawcAHeljzd7AP70u9HTAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779117598; c=relaxed/simple;
	bh=CnS2o1zT8hec3jI9u+cGMmxRIi/jhSnQ8LXjWXp9mxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fjswf56HQ/A2sMMd0seN7ljlw5R7RFOsBy8bG0bYwsCjy/bd9Q6DqR+Y+f9gEjxMFgWzFKGmMDNzxghKkJSpl3yNqM6RyC9lvk6GV0e0LY9g5gS0pGuO+vuLHs0B6Bnx6jZI0z9d4T1do7AADHLydiE38/Cb24ssfFiF2nV7N2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK3d9tuM; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK3d9tuM"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-911488599e3so297793385a.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779117595; x=1779722395; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bG7TbCRDRMYHiwznaFM1XuX97H+EAdoqdi/i2/8voRE=;
        b=bK3d9tuMRCwqy9LaEfV3u3vb+WklUKMIgBeisFXtSaBRupAGDFyDjVbo+olCDc3MWd
         VEWVJ8FWfd96zDRsD5Ej+ua1pozEYQg5lFQMl1bedhy5rOC/wktBpH4jjYP3r7SmG18B
         +wQNyrXkiw5pufCeU+32qMXLXiRL5b8dVB0jrHAt35HcVqejA4qqEBVDlG7ynfXtS6/E
         xD/hZ6sXcrRbiO+PJU79DBKm09OyV+yy6NarSiS8IFSIlBozWzIaAAEKGC3AOPgZzQi0
         QJvyT6Zg7MTEVIjZN5nFXWWIt1WXWUpq0W9WX1Y1JGUea/zAsxNUlRJMkZnA/x61ATqO
         KppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779117595; x=1779722395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bG7TbCRDRMYHiwznaFM1XuX97H+EAdoqdi/i2/8voRE=;
        b=EWlPjjwfh6Pwupzswj0k8JyVHqFco7J3HDJaJpwlGY7P6RZ4ZA5fT3Hwqt0qvXFVCH
         lfrirxMhSZNBlV1MdQtDSZnj0sejRJD4odnblmj/5yIdI4LeQgTrIm/aUWG6Dae0m3F4
         Lnhu1MIoWrCcnMRuw7lOFjlf2iWKygSqxa+/OPQrL7qv+0W7nQeh/RUbwyKUhsrWapP0
         3yflv4rj6qEWOJDn8enZ1LyTMN3+zJufrtYioD0qH3oUvVwMLnf8MK0zqem/nnpO61Hy
         I3qk8HBtD6x0+y/dW8Odr/MCBMWdeQH0gl4773oUInVzxdDabcrQ/+y2iEjuhg2r8GlG
         2BWA==
X-Forwarded-Encrypted: i=1; AFNElJ/s+3NaYxr6X5Gi5tNCRv9XI793a4j8HGI5hN3fCRdQpBCjExIq4r33IJJgtcRCTIxU75WZ2sqqWm1L@vger.kernel.org
X-Gm-Message-State: AOJu0YzK6uEgrtSYtdJv84SKY9+caPos3dHsyytfKyIJAt7ElqVeTnvo
	I4b+dqk/64fM8H1cCunCo05JwZgz+GZkvLMCBVvTc9pfPqvTNClqHqdF
X-Gm-Gg: Acq92OGhDk+CwUUdHV+6DlD8mZriHKYFQ1fesk8NNecG4bq/jo0MLR/8hfBxFDm/HyB
	Fx6w2LVBFhDl8RHtDIlnR0MQWzxFW31hynlIkP8Go3OA418sXPMZ7ldrYKHUul6HVXSlpn6gz2x
	txMzCZwbl7qlgX3H780NBN6oerv21aJgu4/zbfgXoyljdDqsfZ17pUAFKd3IyH+itsIEacMM5ZN
	Yh/M6lgXuhcNe6Qz2POjyoAIe1srQ897d3/PP5jRERZytbfkJhQDWefldcfkPpwSz/V4kUl7n4e
	4JQe07x4XEl66eQ3oV9SEcevAX4VLyx1mdfK/S49/+mawiIvgLTI7cpQZBbzU8hVmwLg/EB7NSG
	Q32zieIqjz7WXMMkeR6JMX6+Lefwe7R7PIfeYXSBJWwkJM/uqObHcELE7Q2ibzqWrw4LUnOeTnt
	sffoDJFe/ywGLtepJ4d/tQUeqsKph++5Is
X-Received: by 2002:a05:622a:588a:b0:50f:783f:31a9 with SMTP id d75a77b69052e-5165a1d9f12mr198110901cf.34.1779117594823;
        Mon, 18 May 2026 08:19:54 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5168c968930sm45070691cf.0.2026.05.18.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:19:54 -0700 (PDT)
Date: Mon, 18 May 2026 12:20:09 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com
Subject: [PATCH v1 0/4] iio: adc: Add support for LTC2378 and similar ADCs
Message-ID: <cover.1779117444.git.marcelo.schmitt1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Marcelo Schmitt <marcelo.schmitt@analog.com>

This patch series adds support for LTC2378 and similar low noise, low power,
high speed, successive approximation register (SAR) ADCs. These ADCs are similar
among each other, varying mainly on the amount of precision bits, maximum sample
rate, and input configuration (either fully differential or pseudo-differential).

The initial support patch enables single-shot sample read with a GPIO connected
to the CNV pin.

The second support patch enables high-speed data captures with SPI offloading.
The setup is similar to AD4030, with a specialized PWM generator being used both
for SPI offload triggering and conversion start signaling. 

The last support patch enables running buffered data captures without SPI offloading.

Some structures and variables are introduced earlier to reduce diff in latter patches.

With best regards,
Marcelo


Marcelo Schmitt (4):
  dt-bindings: iio: adc: Add ltc2378
  iio: adc: Add support for LTC2378-20 and similar ADCs
  iio: adc: ltc2378: Enable high-speed data capture
  iio: adc: ltc2378: Enable triggered buffer data capture

 .../bindings/iio/adc/adi,ltc2378.yaml         | 131 +++++
 MAINTAINERS                                   |   8 +
 drivers/iio/adc/Kconfig                       |  25 +
 drivers/iio/adc/Makefile                      |   2 +
 drivers/iio/adc/ltc2378-offload-buffer.c      | 297 ++++++++++++
 drivers/iio/adc/ltc2378.c                     | 447 ++++++++++++++++++
 drivers/iio/adc/ltc2378.h                     |  82 ++++
 7 files changed, 992 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ltc2378.yaml
 create mode 100644 drivers/iio/adc/ltc2378-offload-buffer.c
 create mode 100644 drivers/iio/adc/ltc2378.c
 create mode 100644 drivers/iio/adc/ltc2378.h


base-commit: 8678fb54958893818ddeccd05fea560a4e1fc759
-- 
2.53.0

