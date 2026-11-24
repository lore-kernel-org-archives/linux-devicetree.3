Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513596;
	b=iYeyBVL75OCDUtZrvugqLoAu48ZFgzot/AF1v9Siv1zhm2Gjw5MarBKZZu/zkESjvmEj
	 InncvN7tsVitOUAkGbf7LVvT1L36tQ1oWJDWragRPotTrJp3R/4TCswFx6Xwd/uhxRrOK
	 8SXcaG+pri72jFpc4XOvuVXTGvEkw56Il+TCeaTA1WkOjXXcbDkTRam9pNgxmqnRQXpEg
	 Dh3nfwrYjWLliry1ldwFoEB/VIOePbxwX4RF7Jibu+AUbjKvoWtq2Zozd1SeGjTbmS+Ds
	 Kzg2Dqy2onlX3qlgy+VuflBjpXCqU36dP2+I+k7z8vgGlAn0QYzaL7xXHqpeoU64wAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dw2szGzhNZKbIRuCqz5QNq1//TAtEEWAm+O/VeExQnI=;
	b=GdP3ooEpEo5Ilk4r/6SeHtvM+lAkAqVcsSvdNrFvLPoA0EqEWF3CiKNyW5hI9vYI6f6Q
	 5oz6dBfJ/ayLm0kWz+MD/6WpUOGnt8XtCLc/S2RgFAF7Zy/GwY7o+A7UiKgNpVxqgcN0E
	 xDCOUabILXSHoyaum7fQC5BlSyMzbABPPyQj8/iwLEmnrexQjBEKyxbRrDouDGpy/+YXq
	 YoByL85Yvq5zxx86DrK2JmbcdfsJMp39k/PDVaxYaCqPtjNFZCuoUCqYNsVts2nDv74sG
	 egnt/9O+3LQ0G7Yti6SizePKTveUs68lnNn1w16hJGlTBM+GZ3R+fBiYYExv4qpVvyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XrTkkVIJ;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E0D606CC01
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E0D606CC01
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XrTkkVIJ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so19510115e9.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795513594; x=1796118394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dw2szGzhNZKbIRuCqz5QNq1//TAtEEWAm+O/VeExQnI=;
        b=XrTkkVIJOxi9g1abZS5IU2PN3XbVXZxOdgQbHNuwB3hQFXIzjJe6KLtEEbcyKD4dxD
         XiBMBMPe3jMdueNkFlAO2uTMJQNxVvmQnkxW49siEpTgg3ZdP8eigBhpc452GIPle7Ll
         qhSM1xVYjNGoftUNMqBbx0oyIcl/1rlCZqV5J1gdgdaX+nmZW9vEcvywix0MTFtiXzwl
         qQ/SUyiPazIzGlSYtBrFPsn0XGK6d/f99GFjwxicWHtDNp/TupiR3f8QiPIwMLskRXCP
         oAAcZP9jFFDk2H2KyOcc0tDXnzDTOpRft6ibynSlFrnhrYDO3gcg7FLblBPZNUb3vOAh
         ActA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513594; x=1796118394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dw2szGzhNZKbIRuCqz5QNq1//TAtEEWAm+O/VeExQnI=;
        b=Qw6ZwJrD6NjMH9oi+LPi13UMEIjBCbK8vZ0factRxLqPpOg4js1kjCAzmBAOcLo3Hy
         8k4wHpNzLpLPjYLCQ0KbYTODwDXPxYWMCa8PouuIc3f32c43/mW1sxt7ZD0tAHARAqQI
         k0uhkd5rNAUa66igYqZbSKOhLv9Y4lXvIJKb9dQ8vxEWhjzBURU7hREUwv3Vi4Jf01dg
         sO7nHIvrKKwcms1Acn22xQRh8BDeePKbygRwbXr43Ly/VpcJECMo6aRSTGs0lHsndXKo
         oDDrY5spUK9hcFATcHToM+z4EmXIGoc/qq8vB4EosyjoeZI9auY88U6w1Ph57tyT7bmc
         PnJw==
X-Forwarded-Encrypted: i=1; AL+hErG6WbQOvjileVe5Qy5r/CTxWBlkGOrY+ChVbso1hBIBETTrSrrt5ujzUsnY/YFzH9urwYWeYjK7UBBO@vger.kernel.org
X-Gm-Message-State: APuU4Z80YKK/AhmhYH9GiBMP04c8+ZiVp3jFoOO1+cAc/QCekM6IPXD1
	ClXEOEllbZ/kQk5PfnW0Wc+dVWhcLGYSndP1tI8KEKIpCWGVNmuDWNzQ9BIhZPy68Cg7KTwZALh
	1raE4zKyArw==
X-Gm-Gg: AZFdTZdPRvykfxlOK4e9CorMTiOcu2qPYwgpFXKpmz7v344OLQLtKT6I0psTsAPegAF
	e2o0irWQ3dkbaJn4887JSqZ59H4QPIViD4BYRNbdjJprOdN8fg1x77s2mS5e5tIf29IqutYmv0y
	U9W6U9FDFsFGPI+UNjw2N0m2HiYbUt9Ry5p3e5kGO4IEv6nMCEKqLT/kwU36yuY/1DZgJMXAC95
	CXdtaQXzHTsJbFnSMEGtfO6VqyfC++MIWdBI920atTMGY4ovs3mydQlQ4Cdap4/ifr0LiX9TzEE
	k5Ar8CZ6WiIg4LiyURSSQT48GBSOhEXvrd42Xs8i85lqqZ497kGhBb7ROctPV5tsBQaSo5VvhRy
	UfNeAg1c4nYyX7D5wib2uuMrxhrAcweb97uFsSuXmegtDdSUAtvORppM16cpiquJLzLC6YeEsmn
	UssTFvUR0tmoxe/fUaAwOTgiiRciartvqyY3RvzEXAnbB6wEcS35SFRuYDuXHpVLLN/Wjy8VYdL
	7/L2ztuP3ZecgMbCRsrBwON0ovCsoTKwZ2/ixzMnQwUTBZeREyXT13+ESyPUaDus5LloLCxXc5v
	Rh5luRZjLpwyoqNaPgaON0p4ASGscH7irGSUxiMpTrtrmlrz0Z0kQpmxs0ejr9jiBGc3LOtj4DL
	LLgtkxDmreAc=
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr296620815e9.4.1795513594081;
        Tue, 24 Nov 2026 01:46:34 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm431782555e9.15.2026.11.24.01.46.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 01:46:33 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] iio: magnetometer: mmc5633: Binding, supply and mount matrix
Date: Tue, 24 Nov 2026 10:46:28 +0100
Message-ID: <20261124094632.8879-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The MMC5603 and MMC5633 are listed in trivial-devices.yaml, but boards
need to describe their supply and orientation. Patch 1 gives them a
binding of their own. These bindings are also used by PebbleOS, which
is where the need came from.

Patches 2 to 4 add the matching support to the driver. I have no board
running Linux with these sensors, so they are only compile tested (W=1);
feel free to take only patch 1 if you prefer.

Changes in v5:
- List the datasheets under the section in the tSR comment, and give
  tOp the same full reference instead of pointing at tSR's (Andy)
- Add Andy's Reviewed-by to patches 2 and 4

Changes in v4:
- Describe tSR and tOp where they are defined, citing both datasheets
  by revision, page and section, and drop the older tSR comment at its
  use (Andy)

Changes in v3:
- Reference the datasheet timings tOp and tSR in comments, with the
  tSR one in a new patch 2 (Jonathan)

Changes in v2:
- Cover the MMC5633 too, including its I3C connection (Jonathan)
- Add supply and mount matrix support to the driver (Jonathan)
- Drop the mention of the missing I/O supply (Jonathan)

v4: https://lore.kernel.org/all/20261123202616.17334-1-gerard@teslabs.com/
v3: https://lore.kernel.org/all/20261123194943.57601-1-gerard@teslabs.com/
v2: https://lore.kernel.org/all/20261122190836.66111-1-gerard@teslabs.com/
v1: https://lore.kernel.org/all/20261122093412.71604-1-gerard@teslabs.com/

Gerard Marull-Paretas (4):
  dt-bindings: iio: magnetometer: Add MEMSIC MMC5603 and MMC5633
  iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET
    wait
  iio: magnetometer: mmc5633: Enable the VDD supply
  iio: magnetometer: mmc5633: Add mount matrix support

 .../iio/magnetometer/memsic,mmc5633.yaml      | 61 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 --
 drivers/iio/magnetometer/mmc5633.c            | 44 +++++++++++--
 3 files changed, 101 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5633.yaml


base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

