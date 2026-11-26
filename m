Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716201;
	b=BUF7+goehy5E34SPZY2kM9N8/lb0r4OfDXPNncxdcG1roxVQPG6VY+V5ZWjmj2qX2cyG
	 VKfmAmqdnr/T6peLvr6i9JtbWAS7MSXQ9nWIDbkic9ncGiO/mZTUaOi3O3CmAxEQvWjeW
	 Ry8p5UfiCgq2Xkf6/8mZyYpPjTxkknMQ9EQ0GFqawjQA+qUl3PxKd8idaNiVjio3RofFM
	 nhSxaQzN4l4TOH2BkBfQ1Y7qCOzxLf2SmQ8rf3g+ECtNluMb6g2N+aQlYnNUAjyNsycY0
	 apmjDZO25YLjBwg54OVloPanqSgwl+JSXIZgMtQzqxEMWPW72EVJkrSXGguygtVxAXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
	b=UoOKdIP26v9hWjC7A9i1EdWr2zMEXqG4SfVIIXPRuMI+NwLfcbC/ZZienfXOsUGtL88r
	 HQqDHrhU/7RUzga1lmh0Bo+q7/ShdjJOLqEEV7w6oHmQdK8NEgQP8KZNkOYne69nt3rgI
	 nXi4VoHCMHYWB0JLhf+nzb8NcbVPgZ6absDXPs/Ec8icqgedtW2lf4w+9mqhJNBN807Xp
	 bWAqfk/od0ZbnJF7OUqShIvwEuGXXHwDmEdAyPy3dnJ6N7dhawGTEZVbPpun0Yqn0ehnH
	 lhTOnZGL71hG1Qnx+9LzbqjKe7lgw6TF8ZEiCj7kuptnU48aSl0TL9ZIFlfV+zlY2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7ZDkX2d;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B527606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B527606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7ZDkX2d
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so74831715e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716199; x=1796320999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
        b=G7ZDkX2dgIa6d3/OEv3BL66Iq6KGr09CxO85zG3wKRu0Ei7JjggIyTfuFk8Xej1EQc
         FHmZi/MDKupnvpHwf97HmNlGYX3rmBcGr7l7HeggVa092vuKvJgjbvNr+QM/1MCSRxHM
         08JE1aziOC0VSuoiT1aeUoxt0L2U2HFPAVdD/AGqllkEN8EtgnZRT0OE+1Css4llDRpd
         wdjNCVWbFy8++Q0XNeU2avrKuGWix9gOvn0MV405gki3UIcfEHLarrwjeCuGP3ABSs82
         dMyWnV05vOQ39lUAjpNhJrNnBiJIKKlqwsbRU5naRZHyUhCY0zoA44MR5CTKvLxUYaTm
         m+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716199; x=1796320999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7cRvxwD+0hh0qmm9vXifZdvwaUkz3iKlLP8yUjjZ/0=;
        b=esky6YzXEqMa9SDB9abDc4qhA8pq6uyizLPauxNXLhkWnvvYxXcI0h8wy5CVhajcFp
         GX79emXWNkj4OEgir6fq1MVDf8c5imjhpG/QdkW/F3gU6qOJs+D5iVK/WTVtQls8vDJX
         pu3ZgVJHMS0bqRjBfQvjsITz4p8EtY2Xk9Y6rmNyUKfRWuZEvWzYN1I+N5p46oTY8eEo
         fPV/al7ZIGy53Kjmhywwih648kWgNZZIDIYPwW+Ufan4C+Wr9IYUMCUa2P05znw0cdBX
         5I08SMutfrR4Mg9QmbqnDKKQ0lYNWh5rfc5WPbsa2WOTGDZtR6njlMk9qf/4CIhW++ub
         GL0Q==
X-Forwarded-Encrypted: i=1; AL+hErEOhKg029lLps0I23hhgbfm3rW1KbkN2ybKiRhnMIeKNpJH5vh9kPSvjV8Ii36m9GolWUfvQI8xLl8z@vger.kernel.org
X-Gm-Message-State: APuU4Z/wPDOe8N9tqrgyN9Rq8MkbOO6VGpbiECaPygCpN1GzF1hTtWND
	+dkc79jWqf7n9HNzl/P5MnhAuDi5f217hWoYiLX7mf+PrctdFTu93rQ=
X-Gm-Gg: AZFdTZeEMLtAspGciuXfw0n2xd1wRBmoT3MblEpxOKy/1zmzoDZcdxpl9XWM2M8bH02
	MTSjOhSzZFej0Pw+H4RpvNsKgz6tbhfzL8w2rlrGQOdyRWp7JYNr3vC8y7P9+B6y5ZHo4LyQ1Yx
	+x+EbNu5lP+crUffOrzKLyolQJYoJ3lz6sleDWiSzqBY99SdFTkUPLTeAPlsIJDCuegFRFDkvDd
	mBhzCIJzNv+E/yUmVTUlAoYWqZqrUqxZHzvB3hsCgVJinl9g0Z3AhV9ZokgfPFTL+JNWjSP65zc
	VTarmS0qU9EZP9UPuOwMtt0UqDh2V1cOY53W+Sv4A1yXehCkcvluOjxrkM7/GSIvh2QJlI19gGn
	9Oy8xdDhCYqnCOTza6QbfhTI74wLf+OLLx3ZGzQUyYJH8yFNhMjL9IbxmUa8h8p6sULVxHMr0rc
	fUQ47/eFO+V1Z4aAfbzTGCPPfLgrL17SofsQwvWPLU56bfxltBz85lFp1rY2nooaCBT6tawTLbn
	MkzqQLqhHgdl9oEtlG+1aVYfoxK91ewjIOK3kqq3OejGtYqsh9pean4rEf+a4hXaPCL+S4gO8/V
	5zmDoycavLsjLi0KQw2Rz1PAuuRJyeFNbL8StqQT5Px1yxfoHlzsgZK8A0lHzdHXiMJ3xYaHNde
	BFAGh04vvzc5jm2RkqXCRUk3bWZvmbSIyAzt+1NyVgLXHe3UE/Rpueiks9eQ=
X-Received: by 2002:a05:600c:1115:b0:4bb:a602:6c8b with SMTP id 5b1f17b1804b1-4bba60271damr88655835e9.14.1795716199310;
        Thu, 26 Nov 2026 10:03:19 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:18 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/5] gpio: fxl6408: Fix regmap ranges/bursts and add PI4IOE5V6408, reset, bias, and IRQ support
Date: Thu, 26 Nov 2026 19:03:10 +0100
Message-Id: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This series fixes a regmap range / burst-transfer issue in gpio-fxl6408
and extends the binding and driver to cover its pin- and
register-compatible second source (Diodes Incorporated PI4IOE5V6408) as
well as the hardware features omitted from the initial minimal driver:

- Patch 1 fixes rd_range/wr_range exposing reserved even register 0x04
  (and omitting readable 0x07), and disables unsupported I2C burst
  transfers via use_single_read/use_single_write.
- Patch 2 splits fcs,fxl6408 out of trivial-gpio.yaml into a dedicated
  schema documenting reset-gpios, vcc/vddio supplies, and interrupt
  controller properties, and adds the diodes,pi4ioe5v6408 compatible
  with fallback to fcs,fxl6408.
- Patch 3 adds optional vcc/vddio regulator enablement and reset-gpios
  handling during probe.
- Patch 4 implements pull-up, pull-down, and bias-disable pin
  configuration via gpio-regmap's .set_config hook.
- Patch 5 adds rising/falling edge interrupt controller support using
  regmap-irq and gpio-regmap.

Hardware-tested on a Diodes Incorporated PI4IOE5V6408 (I2C register
access, reset-gpios, pull-up/pull-down/bias-disable configuration,
push-pull output, input status, and rising/falling edge interrupts).

Gianfranco Mariotti (5):
  gpio: fxl6408: Fix reserved register access and disable burst
    transfers
  dt-bindings: gpio: Split fcs,fxl6408 from trivial-gpio and add
    diodes,pi4ioe5v6408
  gpio: fxl6408: Support optional power supplies and reset GPIO
  gpio: fxl6408: Add pull-up and pull-down bias configuration
  gpio: fxl6408: Add interrupt controller support

 .../devicetree/bindings/gpio/fcs,fxl6408.yaml |  97 ++++++++++
 .../bindings/gpio/trivial-gpio.yaml           |   1 -
 drivers/gpio/Kconfig                          |   2 +
 drivers/gpio/gpio-fxl6408.c                   | 181 +++++++++++++++++-
 4 files changed, 278 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml


base-commit: c6d8ebd7324cefda867a701b4341605b681aa3f5
-- 
2.25.1

