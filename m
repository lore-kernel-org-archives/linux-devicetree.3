Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473C1E1DE5
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536640; cv=none; b=bKdRLoxDNBx+mesCgygkcHhQrafV9Pj4pd/BM5t5lZLt8L2QQI7Hutp85ZwMhbxMH+STXES6M7D2j9zFwOyEb3VEdNL5PPLRVDrewmgrgd5yjbLSc02HMX5OmPM25an4oLgBVMB9ezjPBW6o9FtqD213YXetfBN6RdkWw4guRpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536640; c=relaxed/simple;
	bh=Y7Z+f4twj102MaqgafUmbmWhaBz0+bcIsL4YX6/rdag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kt1C7pX1/AKSkpPaPXryx2c6Dt3VS9JypUI9R++NBlXpSVAyKJMt9ACTvhWvYY2IjWManGJf9yjEIgApwCpa7KP1vkI5jJQkihDDIAreFOeSdfCZpkBiwOuBW6yzJe6UnIIFQxZN3Q/cIrwOjSKqGonyE+WzwVdNa6UNYUYbjpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7KfP51d; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7KfP51d"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d64313c39so462531f8f.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777536637; x=1778141437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VTLShMWp8Pof70NawJHNcJQ7O87q7RcUOF6Y6NMU6I=;
        b=Z7KfP51dmH0v9j+barHH7eiqByr37ZEp1hNdtF0TEs3EPQCceqBdUqvf7l/gKnc+tz
         /uVve7xARNXVr07PSZ3F7zKHejYPi+5LTgXu3WDUsbx9JayM+2OJ+dLuXTfHGumKqqJY
         ehEaYvEbxN9H1Xai337//LDQ0K3RCH1h5bCOkiF96ekTJ2ddHNpvD+YKLC03P4Z+4AoF
         FyTWB7dDkxWeJI/QEzaixXCOc/7HJ5fubV9sz5uOQdHwNUjStZYjqnh0bWaRoIIdl2U8
         IPZupobdFrWn73sTxvkMBzAhUEYIEZ2q1rmQ+WayCd/S2afijDkRUAhNUIGq2yc8spFX
         oqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777536637; x=1778141437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VTLShMWp8Pof70NawJHNcJQ7O87q7RcUOF6Y6NMU6I=;
        b=Im5HurDrjxgL2VO+72r6QuzxpAC6k0ryPYcKh52Ma1m/d7zmK+akFqsxIDxsE2mLJN
         v5tCvFuKkTB2dRk3FoGdGBIlew445syrfPE7FzRjNLXD/+6tHS55i7V4Mni5iYI7BDxY
         vgzMEm5p1al/UT3qcysuqXPFAl+2N2sV6NOU4YpmeLFsoSyihu8yRZfcqezPMWTnrRTS
         beI/GXRQsDXKqjaYQmx2IteEPna6sqpPsllWh485W5MJiAj2qZhPT6HJoxKldM6ian7K
         Kz9SXA+DzfLNbU/StfOQBMAjVKYfknvBhU2NmECSQOKGfD3FniRzi04O+ZDKalKc9wVi
         nbFQ==
X-Gm-Message-State: AOJu0Yzalb15uoS/WGJ7H58AzjOYH3LzjdRsoYzmKuvR+FxyeiGIUaAr
	9oklQ0+lxaVVSZ/XFAOCSWwhs2d9VYCaYSe8ltaqz9nKvfd97wgmLlsV
X-Gm-Gg: AeBDievAHnQm+Pglpfkx0T+W8P/pO7DhPMAkS4SegyTAh7xAmiXZhGoDYQIrLBx4O07
	W31ZCokc18SacYGKk6z2Ci97WEdIGpEe5QkWfa1bfj56dQKnVPnArSQdxuNlaXm0lcIdIqiX1kx
	OTWAtdD4YowCcGSRwoV72ehmrt4lGVv+mHKu0ja1OHnoKgY32ARK9RCLrnKO8ZKstVgb+Zx6Bqr
	tkHgJly20pqE+MAYTgjYq4rBdt9vZdjFaPDLyUhr88WZp/ZtogfZoyaq6R6Xsfz42XaRTcx7ntf
	43HZK6z3yKxf+EWq9WbiCEDRi1gBx2Dn3XT75ESHkSQO+qcq39KHGmx6ODhcxo/3LjWzhJHWMD9
	9KKFS69hTF9KwCZ9xo0anlBXp/z00oblUa559WGe8U5eixo4kCljC7C3TR+ZywwwCxVYAbuFx90
	YLEQkHNMc2frLyKuS53qs5UNk=
X-Received: by 2002:a05:6000:2c11:b0:43d:6787:992f with SMTP id ffacd0b85a97d-4493d02a39bmr2853909f8f.10.1777536636357;
        Thu, 30 Apr 2026 01:10:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b120bdefsm11809517f8f.0.2026.04.30.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:10:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/2] power: supply: Add support for Surface RT battery and charger
Date: Thu, 30 Apr 2026 11:10:13 +0300
Message-ID: <20260430081017.59345-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for Embedded Controller found in the Microsoft Surface RT and
used to monitor battery cell and charger input status and properties.
Controller works both for UEFI and APX booting.

---
Changes in v2:
- srt_bat_get_string > i2c_smbus_read_i2c_block_data
- added devm_kasprintf return check
---

Jonas Schwöbel (1):
  power: supply: Add support for Surface RT battery and charger

Svyatoslav Ryhel (1):
  dt-bindings: embedded-controller: Document Surface RT EC

 .../microsoft,surface-rt-ec.yaml              |  63 +++
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/surface-rt-ec.c          | 389 ++++++++++++++++++
 4 files changed, 464 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/microsoft,surface-rt-ec.yaml
 create mode 100644 drivers/power/supply/surface-rt-ec.c

-- 
2.51.0

