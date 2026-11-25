Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638154;
	b=zcU+dpOjnuByZgj1ZvFP7vL7KAta/ic+LBdBETkLHwhma6EK3xBOsD0oFUgDEcw8kqDA
	 Ut3V5XaqO2Eo+ftjb3Ge4YUBpPRSaX6cAlxAZNFgrTgaKVAjM9S7IaFSlEob04uRGyMwa
	 aAAfxZ4Xbj3wFpyS2XanxzPh7S2mGl3RATRj1hUM8BB2FpSd7ZaxqLwnCqejn9PzitD8h
	 EvjjXI6O+2/Qc7m8o9pJLQaKvd/YtML4OiMiH+Rvd6vdnjizc9X/rcpuIS0e7ZLL+mZTq
	 W89GhBJKbfSokPwIDV0l6QIP8vfvU/qxA6XpIab61QBdObcop7/90rjiss7sbVeVUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638154;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Lb2D2tWbP9xpFGNwCPYhXighNPd8wZ8FSIPXRSIeOMM=;
	b=oWpu9lf2DANyTu3aY4iLC0WDZFI6KpLDTd2Wugb0nfUzJqL5QIpmsDFcMgT7LcVYJQ+D
	 sjb3pSfX/HIoBZ9dTuHDXTnf5bG/zubAagpJkaXYL879hB8j+FpZHZT3dUBkLFfa3zJRL
	 aaWeD6sCItxzQrSVb7OfS4RmvDNfHvBRKc4gw63T4cDjQvBWvig3O4sHvqR7YIXHz5lAE
	 c6EkWJdTthPu2y4UuMjFhgGIMz8uKah7JIiE3c0zG/vbSaC8ylqwKcZE7edJwz48o8kOH
	 I80dEhZ3OIWtlDAjlpeLlD2h9+FQDxKeoOlLD8/Hlw6nfk/RDFauyhOGavXLHnSDaMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D82606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D82606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0d126f631so55094837b3.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638153; x=1796242953;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lb2D2tWbP9xpFGNwCPYhXighNPd8wZ8FSIPXRSIeOMM=;
        b=N7CVgo34jKC1luPV/mCFXFQvjMc7nZkksDEgHCZQUrjqwFFq62zC48BUx4BwdzxYaT
         /dTCQKVboQ5tw+/Wj/l6Aa6q6bAM+jA3JW4WCNPV06yQIVIQdD/vXXjc80qkfRc8YOUh
         Qgl0kr/QxEAhdUjXSiO1a5lt5v9wne3Mjb4GfELz1uFT1QeuxQMDHDiA/FOXWGc7IGJo
         LZdZKybf5ZH7vEHFZjsDgDNZNPlpu2QIjuAv5ZagyGxwzvrpIiWrP+aOXRS6uCzE/mQh
         NJ/yjCqJZfI4vL1VFMK6FBS03NsnzCluiLDrDNVJ9B/wlWkmFn2jNzVHqmhjhJKPm13g
         qUhQ==
X-Forwarded-Encrypted: i=1; AL+hErGj3nEEzHCXe8dbVL1pb1oZAjHrKmm8DTwbqAyMgY6Ly/RKwlZAaMElkpW/K8sCFeB5jSQcLyEe0NJ5@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kby6ZWJnq5oJX3pJzPVsKYjQVuqTzFw07XRww7lkUCL8z1DNM
	6ZkkawPEpg0ijmSacVPXkRA5tbuLQEBRNa67jFK4JlUImJCnklbhwzbq
X-Gm-Gg: AZFdTZeaaOPulbD/aqxTC+daYe6QZR2Jc+DkOiVX0S76UTBXSSq7iwvUm2YAa17yhmG
	J2BTN9Ztzg//usKhwhaeJHdYmTvZrx9DNSYniizbrft/dKStg0+Qv75cwlB6MZQkFGYc3WoFF4G
	eratoBbXxyKK4Va4L546LtWjijzdOH6A0k8e4DvP53eKqhPxI9VeP2fQP274Hd0w2Vr4qWxVvs3
	Lto3H3fXf+isWuHj76Rqz+3c9tcKq3stZEF5IguhvAsJ0eYZ/gU/eTtQznMX4pKB7B7k7ukVZeo
	qAljBNZv7klPZVimbwRG50qQjI7fbIVGcUGzHZV6R3ktP11JUNsgGDs5G7Rcz+AFwbmib+ZT1/5
	7x/UZ5nCEpIN9f/xU8SAgTqSk9g7kg9pIZQ0VzEqwGeFtR1lyAupIq64uK2uEVSXE46LjNd9fVm
	fCbwABYhg93WGy7lzQBYMY/9y5O5OP3AU6fuYn901t5of8+PjzB8QMHCj+fDhlaFMPrDGbx5NXx
	tWdLK7ZpBd39POdk+J4XU7nIPMU3adQp0B1ys1LJl3u08zNjx6IPfRiSASqzqfHEmFQMIyxLuhv
	q94lLGgX/m/Ph3VYJMNT/nqRslAIJvfVu6FC0p+FvKPh8mTWpQaoy+7D4Up7EImzAzvON07Z66Z
	flXnBtKdY/0bACKV2GhICUPDRxMJMvGHQGKnJuoVSiTUfhXen55K7coTraCIkseKByNtv3FBugJ
	P6IElkd1B0cBwVxTOTV7Nr/8ZN
X-Received: by 2002:a05:690c:9a09:b0:8b4:c2c4:bda1 with SMTP id 00721157ae682-8b5205201d7mr81799737b3.67.1795638153094;
        Wed, 25 Nov 2026 12:22:33 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:32 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Subject: [PATCH v2 0/6] iio: potentiometer: mcp4018: Add Analog Devices
 AD5246
Date: Wed, 25 Nov 2026 15:22:27 -0500
Message-Id: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/22Nyw7CIBBFf6WZtRhAhMaV/2G64DG1o6Y1gETT8
 O+2devyJOeeO0PCSJjg1MwQsVCiaVxA7hrwgx2vyCgsDJJLLYTQjGhiNhyl0qwN6mCMkK1RBpb
 BM2JP7y126X6cXu6GPq+F1Rgo5Sl+trciVu9vuAjGGfbaGc91UI6fMz6sve8DFuhqrV+fS/jft
 wAAAA==
X-Change-ID: 20261116-iio-ad5246-8d4377128747
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

The AD5246 is a 128-position I2C rheostat that speaks the MCP4017/18/19
protocol. This series adds it to the mcp4018 driver, so it can be an IIO
channel provider for an in-kernel consumer.

Patch 1 moves the out_resistance*_raw_available ABI to the generic file,
patch 2 reports the wiper range, patch 3 adds the binding, patch 4 turns
on the vdd supply, patch 5 moves the scale divisor into the per-part
config, and patch 6 adds the parts.

---
Changes in v2:
- 1/6: keep the moved entry's Date: line (Andy).
- 2/6: include <linux/array_size.h> and <linux/bits.h> (Andy).
- 3/6: rename the binding to adi,ad5246-005.yaml and say in the commit
  message why there is no fallback (Conor).
- 4/6: include <linux/dev_printk.h> (Andy).
- 5/6: new, split out of v1 5/5: the scale divisor, now unsigned, moves
  into the per-part config (Andy).
- 6/6: name the driver for the MCP4018 and compatible parts, list-style
  Kconfig help, AD5246 sorted first (Andy).
- Link to v1: https://patch.msgid.link/20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev

---
Joseph Telaak (6):
      iio: ABI: Move out_resistance_raw_available to sysfs-bus-iio
      iio: potentiometer: mcp4018: Report the available wiper positions
      dt-bindings: iio: potentiometer: Add Analog Devices AD5246
      iio: potentiometer: mcp4018: Turn on the vdd supply
      iio: potentiometer: mcp4018: Move the scale divisor into the per-part config
      iio: potentiometer: mcp4018: Add Analog Devices AD5246

 Documentation/ABI/testing/sysfs-bus-iio            | 10 ++++
 .../testing/sysfs-bus-iio-potentiometer-mcp4531    |  8 ---
 .../bindings/iio/potentiometer/adi,ad5246-005.yaml | 54 ++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 drivers/iio/potentiometer/Kconfig                  | 10 ++--
 drivers/iio/potentiometer/mcp4018.c                | 65 +++++++++++++++++++---
 6 files changed, 129 insertions(+), 20 deletions(-)
---
base-commit: f2cbef9101b9fc979a324bb1242b8b802a2484b6
change-id: 20261116-iio-ad5246-8d4377128747

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

