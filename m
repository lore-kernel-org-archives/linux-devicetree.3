Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142345;
	b=X5mz1Rxjm/q1HtkN5xFIsRGA26hBfHoQtDWL0cJ3HH0xYXDKilNtWsmhH0X30T5oevg+
	 WC7TmAvnF0HLAE5GgXeJDZHeFhZh932SnqeGCsxm+VwNvv8maq1EBVWIJZLqqD3fP2PFd
	 Rn4/G8srgk7KpDKVSLoNwTSC4w9ghaA2vIILIM9QsbI1Q0des0wEYNI9rFlCwlqww7+vf
	 f2FovBuQR1Kbjwu6A8GdkTOVZCki43YjYw2nQ/w3sUsy+odUHjAyGvxKD5u/HaPX7NyWk
	 Q5utbOsyF6kyoBlqlc05bmmD+PjqHTReGJG46GpJUgEWqBJi5ibWklLZxQE9Ql0oRnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
	b=jlfLJe2MwxYoujjfkzNvE/K6rYKvj0LKqmDlskPKeqLTafErP8E2iv2M6qcMaDj3WB9m
	 Jc/bEYEmxRGyZMWkaWWtcB2F7OyFwwpzksvsdwHbYcpi+BHyjaXW08U2G/ILzRNZCMlRe
	 WzsTr3XmlnDXAYE2vyzg/LqEdMr3qiAgspzhN4taN91O2a7Q/64I9Z6S/mlyL+IY6R1rO
	 AAJr+IDlTf+eICPyurE/mO+BGe//8jc7IQAdWc2wn5+aC0MLQm1qgBhNCSNYI3HQ95VJM
	 9JK864JcKSd0m1HFkLJym8I2ogUfGc9EOM3e6/Fb5EcDpBnpZawDC86a5BUrL1mZV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVUjkkI8;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC43606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC43606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVUjkkI8
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-83bbcfba0ffso282432a34.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142343; x=1793747143; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
        b=fVUjkkI8d46Y/jdU3DK6ZYGqFL6AoqRiovDb8IZIpgtHBgQwVH6J9BVQppupxVv2lh
         bmIt7pWq/DmWflYCqAmkaY12s5n4LmDeJF8G98Plx364dfaVmdUV7WOrXflIPPFE22EM
         b7BZzLcajySyjAxv6yvulaeq1Ka4rjB1nGtZEMCRJ8sB47o2slcv+4PM8c2ycXPlK4Bs
         iMlpI1OrX2sJVV1iJFcO+TIldb1O3oq1J6ceQG7VVYh1whJo3yfALUG4wU5onCnpWMVS
         n6wDRa4O0mRe814BOvca5kP8RTfgOjUkiNXjAYjWuQQqJ3JEsBjCUpHiSd+S2sOfYqss
         UPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142343; x=1793747143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
        b=wld5vHfl3DBGJslU6O5YLf06nxtsjJZIqLQvfDCm4ygxhOFB3+/8JyNLv18j3eb1G/
         JXeaCUZtOcx7//knxA/Dvzy7v98/QQ1lF7azeY4oltbn8+V0PTXE4IWQMdlpCZzyZQnd
         vfuJpZa2ajmdeuuPXPENyjovyvvWToT9G4AFY9L3azdji+2hHQBQKUnlqkqbuYDyUyn1
         5DnMbLG78NW2awMIgpmpy9tn3OeN8DZnbe7MflE0myGtOXcljKZs6MnZkIYLfEj0b4iL
         HiTYY6ZClVgVwDq7RApgTMo4G7qCHqlw5mpKPtGdP7wQAHkG2mw1IIioiWup86GR6ie7
         xGUw==
X-Forwarded-Encrypted: i=1; AKwUvBxIbyW+XeP41EORcVW8GsbNJk9ZGS/2fuE+VzUB9PnQHZ88ags1TB/qluK6K2BLXic0zjWr1B3XIRfq@vger.kernel.org
X-Gm-Message-State: AFq9FYLGYjs86Fa/rYMvJRtF07f7yeaX72UWoCyJFwsk+YgGvVSxWCIb
	YHhSGSCEfiCQNUvm+M0QtJ3lN0vNhxP9k0T6hM6I8skXYYNf7Mliepx/
X-Gm-Gg: AYBFou1XOkd1dHCFmDCL8IGy8XVfHrEzTbO7oaoUzOZmem49PnPZYypuNNpRqLnqfQh
	5RmBIUFZLYbtOYgH5ccr/U/64mIlYikQSvtgwfWOmxTRhtdp26Ok0upCNQEgRoFGXyW8sIUppM0
	pjBBK3U2NL587MURwxEMm/TTGbIBYVpZzCQJUbjtIYSBpSGHoWZyYNQm+IJL31UmP3Q4cuN5dj4
	FfHkumoHbk3fZEFDq3IcFnOM3GTf7Tm/tGpWO7RPxP/G/zEvwazk39tQilML7v0zTA0k5ULyuDE
	ppunpcjUGgzjXALhS/jQIBmulezBUZvBhhTSGyYCn+zec9CjiyDt+3pdX+8YICXfp8SgILv11eA
	CxnixjTOqJpBsmYocgMpA0xIVJgIYRocIkqE6xbQG34vCYU7QRblvCGlh7AAusYu/SApdANSTtU
	8vFNhG4ege03NFdvScghr/yGW6DLRv64MiZ8yVqEW30dq5z9XiolEiD7CpNfd1u0owffsDPuwJr
	u/qO6of6x+q/VZqvMxpyjdAqOch37Yg8H58bCZbmIsKNvUedSHq8aem1EscmQdLkYtOJnLb11Gf
	2h7mVZqJDW5f1jWVrDBmhpX5pWYdfJ4chsTFj5jhcygq2fedknOp9P4K7/7dVU3fPFOJBj85WVn
	YFQbE07jGKWi6CPIkFlVrm5bUOjrAfISfFTF591nQXIixRcGNwKF4u2FHnOFcua59gG6I9IlSg4
	L3sQ==
X-Received: by 2002:a05:6830:449e:b0:80c:d30f:97b with SMTP id 46e09a7af769-85abeab270cmr903574a34.28.1793142343158;
        Tue, 27 Oct 2026 16:05:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Tue, 27 Oct 2026 17:05:28 -0600
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42R3U7DMAyFX6XqNUb5T5kQ4j3QLpzU2YLWFZKuD
 E17d9JuExNiCCk3VuzvHPsc6kwpUq4X1aFONMYc+20p1F1V+zVuVwSxLXUtmDCcCQF557o4wNp
 wAztMA4QYehg5eI3Bt4G0d6wu42+JQtzP6JflqS6zr+SHiTd1rGMe+vQ5a4986rvIyNsy5TEgh
 dIhCXLYPK86jJt733f1JDOK/4JEAWFg+kFqpozUP0HyGqT+AMkCEo0JnrvGS8+vQcfT5oned+W
 2w+kctcNMUP4LcFEZp5xWMiBvrLbiwaK32qAJZMiooJlxtlEKp5N1lDPOoSyqx7M1e7E2RYkba
 IRm0H5AG0ucfZotKuCguOUKrSau8dvi0y2s+g2b9kOKK9jEQEPs6BwIByt5MdlqxmR7zV4ej1/
 X+joJYwIAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Add an H616 compatible for the integration-specific setup. Keep the
existing 16550A port type and describe its fixed FIFO depth in platform
data. Use common Allwinner helpers to configure the transmit load and
receive thresholds from that depth. Configure automatic flow control,
preserve the BUSY-safe integer divisor path and keep the UART gate enabled
during termios changes. The H616 configuration uses PIO.

The series first introduces platform setup callbacks and a shared RX
trigger conversion helper, then adds the binding, H616 setup and SoC DTS
changes. Based on tty-next at 6b4b543fa187 with the posted RX
trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1].
Platform setup runs before installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Introduce common Allwinner setup helpers with the fixed FIFO depth
  supplied by compatible-specific platform data.
- Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix,
  installing the BUSY-safe setter after platform setup.
- Use an early return for FIFO-less DMA setup, following Andy's review.
- Default to generic setup when platform data has no setup callback.
- Select Octeon's optional-register discovery with IS_ENABLED() in its
  setup helper, preserving the existing 32-bit and 64-bit behavior.
- Extract the shared 8250 bytes-to-FCR conversion, including the
  unsupported-table check, into a preparatory patch and use it for
  H616, following Andy's review.
- Set the fixed 256-byte FIFO depth in H616 platform data and omit
  fifo-size from its binding and DTS, following Krzysztof's review.
- Precompute the Allwinner RX thresholds during setup and retain the
  sunxi FIFO-depth helper for filling the table. Use named FCR encodings
  in the helper, following Jiri's review.
- Share threshold-table initialization and callback assignment through
  a sunxi RX trigger setup helper.
- Group and comment the H616 trigger and RS485 setup.
- Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com

Changes in v3:
- Introduce a platform-data setup callback in a preparatory patch,
  replacing skip_autocfg and preserving the existing Octeon setup.
- Describe each H616 UART's FIFO capacity with the standard fifo-size DT
  property and use the value already read by uart_read_port_properties().
- Derive the Allwinner RX trigger thresholds from the FIFO depth.
- Use an unsigned trigger index and conditional runtime PM guard,
  preserving error propagation when the device cannot resume.
- Rebase onto tty-next, replacing the earlier DMA prerequisites with the
  posted RX trigger callback-lifetime fix.
- Separate DMA enablement into follow-up work, retaining PIO operation
  for the H616 FIFO configuration.
- Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com

Changes in v2:
- Keep PORT_16550A and set the FIFO size, transmit load and capabilities
  during setup, following Andy's review.
- Select H616 setup through the matched platform-data pointer and remove
  the type and DMA burst-size platform-data members.
- Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
  with port locking and runtime PM around register updates. Keep the
  standard half-full FCR default, selecting 128 bytes on H616.
- Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
- Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
  fixes and their prerequisites for DMA enablement.
- Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

---
James Hilliard (5):
      serial: 8250_dw: select port setup through platform data
      serial: 8250: share the RX trigger conversion helper
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
 drivers/tty/serial/8250/8250.h                     |  16 +++
 drivers/tty/serial/8250/8250_dw.c                  | 138 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_port.c                |  12 +-
 5 files changed, 151 insertions(+), 28 deletions(-)
---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

