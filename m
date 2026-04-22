Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9E346E55
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859585; cv=none; b=SPzX1kb1+Hb73v4/JeHX4PhikaOCeeOTERSVPuLR2w3BWLx8q4DE7WLDmm2TfQ2d4zOf3/h/+1X1+TulpR6zTd5reVvot+f+Yj+JPbDgbvTRwx563IcDSDfuCTjIToxpF5xiH/TQQvJKA/kAo7cfNQX5AV6OurmKkY3hvPjp9zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859585; c=relaxed/simple;
	bh=0sGt7tGb/oUppsoQ7+XY3YPpBC8TN2PAJSBkXI7Yb/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H41aljuesqbj8mQCwqG8yACcHIskraFFmXopXIBrdpWPyIOe0UBhPN1GC3MWjzmmKZ9q7w6ZvfFQ8+0xD7N8izFh2gyk6dsgLMziyjxN7iXofQJpsd8iMwr5cVeAxlH6VSwSbVkE0F1G15qt5djuVEiUgQjHzK2sQOqOEXBjdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=C8RwsDW5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="C8RwsDW5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-827270d50d4so4959245b3a.3
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776859580; x=1777464380; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRukHJ5+Ru4qIAkKpP+16WGIqlF7mx9ZTtZzr3fi67c=;
        b=C8RwsDW54b7UzhlOmaV+WB+j28pmzbhFFH/KQwbSTK584ENhXxp1XfIz99lY/7WHhA
         RHa6tqZfqlFJE6ppi2K9uq5Ic/Ui+j+i5QmfaK2vxU3dubpq/9keLPTxsnwLcB5igNuL
         iUf7/OMLCsHDugl+rQfo568d5iaPUzFrxP9VECTt5dVuShGXxUBUV1EyegBknxpX6Pxl
         kABJ1TK3K/KwRdqnW4xkpT0GY03dOiYLG5esHWzOqu1siIcjPpfjL5uXvZQLAvcfEySh
         fyUFyNFISOsps8StIzf/Bz78LaAKBJq2nAuyiroGYgYFMCpE4RNtMML6J4xkvt2qfPu8
         RmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859580; x=1777464380;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRukHJ5+Ru4qIAkKpP+16WGIqlF7mx9ZTtZzr3fi67c=;
        b=UirgT1m+R7Rwo722UkWQlHofj1oO6ejJtkFx1j/NtTQWyUmWkWkqu0BVtjFC8BUoqb
         yZybyktGtsEQqGL5vNyVfWsnHuCRnY0G6glGWq7O7IKxZBFrDDPmPzxuLgHUK7DsBW03
         DYxcXJaTFZpXyA10jIFpzH1gNFBa16s2He9oT7LczZXslH1ll83cNHH+FneojBhq4V7M
         T3dnYLHwQ+c1xK0MrhzJ+Qdiu+ZWUvREOZuBYFlNzyx3zi+2A4nl2WPV94Ch+7auzZ4W
         vGr4Il0TP7tHPJMGMH0Zoj9q//hPyjTECgSlHEKvkVcl3xdlapb9tFdaE8A2juGrwnIs
         L/GA==
X-Forwarded-Encrypted: i=1; AFNElJ9hBBdgo5uYXSm9xKDYyKK9IMpgg0x3ooEhbn4rmuZAl0bXtoAj58zsi42f79JVtTZ0MSFrFuM9bYDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6sZc/N2Ao8OmnYs6CIyQt9AitlrtmAUhlrJG18U1ILJnQbB4
	dK0PeoDXarhIPB/RiZYZ35uky/GhvKz4tS2bBBLW62yafYVGcZhRwcTi6aE+g/CBSfc=
X-Gm-Gg: AeBDietqby8V/0LUl8G+56HA5nNdifYuaFYI9k8mOizooNSwvISsBLn31fdK2pVzx1+
	+9RdYzKD+E6JPLe2dvBMiAJByfNuSSszr9ud1/2kEs0t51YJtKfgh+kJRoTVXGjQ3QmHqyjndA/
	tPVMXxRuThSHz8EY5Aygfo7DrgFy3vSDBxdv8F7jtcW0gENVKHQXYEpsOYMgeIGc963PFVsQ1Te
	d9zm4hxd5HiDEMmVFJcUhbEqmuHuZsck3BWbB6of8kVdorcdY1f1w6WzDXoLrUeLYLkXidzPXS9
	7oBl6reotLLT95pPMPRL55y8s+yDX20ExAZwshN5koyhBUvl6VmmMSBPxZeQ9U3Cwb4gE6eiHxL
	Lb8WgNe/eF9q2pkLeG8CX88uGB9de1ioFZT7u+KjWtDjGXzzCZLsv6FLBKZfDDsK7SlkAhcqHFH
	RKI5vDtQsLoouSeRY9rvEvdAS3SQV74suCqYy0jQG/Yjj3qewzymeR0u2/w1YU3OaiguSPK4s/Y
	XYE
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr23037967b3a.1.1776859580609;
        Wed, 22 Apr 2026 05:06:20 -0700 (PDT)
Received: from [127.0.1.1] (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm17086636b3a.29.2026.04.22.05.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:06:20 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH 0/2] Add support for LX1308
Date: Wed, 22 Apr 2026 12:06:14 +0000
Message-Id: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALa56GkC/x3MQQqAIBBA0avIrBtQK6muEi0spxqIFK0IorsnL
 d/i/wcSRaYEnXgg0sWJ/Z6hCgHTaveFkF02aKmNrFSN1jlMZwg+HrjdqpQNKlPbSktjR9NCDkO
 kme9/2g/v+wEbj6xAZAAAAA==
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776859578; l=1370;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=0sGt7tGb/oUppsoQ7+XY3YPpBC8TN2PAJSBkXI7Yb/w=;
 b=N9fuTYJgRN5ExWOTg4bq6rBoSG4vqQoFOYuBiPaCc92mrGji5hCouycK95XY1YZ8OKgv4Agu6
 15LNYUcB4ysAH6tdCHg3zMLOEO+cTWQm9R2jUxG1WkjXMgEsN0G+T8o
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The LX1308 is a high-efficiency, non-isolated power module. The module
operates from a 40V to 60V DC primary bus and a 12V regulated output
voltage. It can deliver up to 860W continuous and 1300W in transient.
The built-in digital controller can store and restore module
configurations. The fault status, input voltage, output voltage, output
current, and temperature are monitored via the PMBus interface.

Add support for this driver.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
Brian Chiang (2):
      dt-bindings: (pmbus/lx1308) Add LX1308 support
      hwmon: (pmbus/lx1308) Add support for LX1308

 .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      |  49 +++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/lx1308.rst                     |  90 +++++++++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/lx1308.c                       | 204 +++++++++++++++++++++
 8 files changed, 365 insertions(+)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260415-add-support-lx1308-165a4206ab69

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

