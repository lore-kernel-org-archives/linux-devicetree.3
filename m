Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158A73FB7D3
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384334; cv=none; b=QxsnL+P0kIs8QQjIwG1RuckN6NNLDYoCXYHr/NCLBhxHxdjGwofQVjMaBAXwNKEgcVXqAB0swA044bSaMblfL/ZDrfXmFM64o5phNpTFP7Q9C4PZ/65p4v0vR6Eq3+opwl8fmJQAvhVD9qAd6X3yC7HI+KOOD/ZwGyaprs6QFas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384334; c=relaxed/simple;
	bh=GGKUVilDNqyfEA6sr3nk2kkWtUjn/Od13NcvZQxnWUs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NM0LyQMRnHjZrJeVj6Kkq0k1B+DXY3yzd4wV9gTuaGfDqenvnCCEvLPIX7IB8K3LfnQknj0EmUhTP0xGRvPSq550RpORrU117+yroUkOjARgEWQG2vvMTb8FhpVpojAeIs8qSo52Y/2hrb4USeCQJwLBThsswwAw2zAaMaWIfM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w14SeJ0s; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w14SeJ0s"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48374014a77so148136335e9.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777384331; x=1777989131; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6AP1yR4f+59XbOEAZAAXCqR10LYAvcwKn9ii4AhEdFk=;
        b=w14SeJ0sLkK/n7O2gh31OAq3g+pVewaDAmGaqZKJSLtE2/AmViQOc/gXapMpPKMj3g
         Ew1Ptxyxs6NGld38f2mR6J+uCDT8csiG3/1teZaruuDLUMgbaMwGKwnh8Q0OjPYC+PZJ
         n6tz3SYMTbrO7jpbJxvNw1ngX/GYjoOMk1QowLzCBxB7z6TAk9++PFhR1NlVxmjPIg1s
         XkA98YeEPGn9rsVphdGoz7t7B5nerxX0IxY1ggGnVlAWrYwoY5Dyr/7axH4RcICS+DQe
         LltL+OPy/HvxUgkiqyowAfZ2kQCTaC15ENE0kyDvHlYphMkGz4JvQrJ+iLRi24GrWT6w
         yadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384331; x=1777989131;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AP1yR4f+59XbOEAZAAXCqR10LYAvcwKn9ii4AhEdFk=;
        b=sn3ivxclKUJbcM+aZGQxPoXL+TtaZRY3Pr/Ch7RVRQig1l5r06fcMMTMzqC+Bzuuhi
         br9htlHdVa9tf6kOgLVwfK1AcLEWoLekZ+bVO2Tta8E/NgTXay8Ks0YZ7EdCHNUZxNk3
         i8gXcZNBGK4If3+oPW7uv5HPAzWSShzVdXWN2KwbJey908wAEciwztN2Z1xfVujS5DdH
         9faJ45i8CymjKbNL9aILsP0yWN+Idm8oRytfB28txsKjnGMyopc2yRZAfTWHg/ggiyRn
         9z0Pwa6+C8Jr9+l9FBww2Z5kkNxvE4VpYpEsUojx7TbQ8ndQkGV8CxotChkI1aloYz8E
         ezrQ==
X-Forwarded-Encrypted: i=1; AFNElJ//ZNm7N1lxObN3JDKwYYjrOV+FQrQH7mqbohy8Cvjhy0mrMhVJuU18h8saC+88yoSjggXzWFrBrLre@vger.kernel.org
X-Gm-Message-State: AOJu0YzZNDVNqJrRalpU0fXR/FzFo7azVGkvpIpXphI+VjPnXzArhFW2
	DWJWMcgmnMmIt+XZzVJ6rN6/y9VRoqzrZhZX2vlA6iQhoFWtMQsM6eehOMYx6HjxuIQ=
X-Gm-Gg: AeBDiet0eg0MVyYRQHB6J2bS6jVVF7Pttr5iFKlfpLG8U5yYP40AGypL92PdUGZe+hO
	sFdJ2mqZoCzayuqfox/wTk8aLNQmeYN9hqmaXkqcJ53stdEzjvY/fB5x4vFWSafiEIUhM1CvoPY
	DeA1yaLlcGr7oZ7xaHNgCPT4Up0kVh9/xJf3fL1OyElA8+YzWvflCjhHTM7JytxQPULz47JuSGb
	KOmUG6mkzx23XTu0VhNkp4iiE0jcfLf674YuCjJ9MFGaoeS7pW1iqUdsgThMUl4t9GnEvuivrUk
	FVej8cQuEH9T4nNn3vBcy6IbwxKFeVfcA5QI1o10nZw9bD68eCfMJMYWMEtTjcNFsqDyZMTW/rw
	e+PF0dsX3kRgGT+O24QRvXjvzZKLR+OhX3xpachTNRXmSI4Ie/GrmS13MPNd3VS2aNCtyeaOfXI
	pqRYHRuMGk6faFz5nQyORxjx0lYbB6CtV50ld2bABFCAWtw0JUD3KCNRE=
X-Received: by 2002:a05:600c:6d8:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48a77ae89ccmr28308735e9.12.1777384331240;
        Tue, 28 Apr 2026 06:52:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm6773044f8f.20.2026.04.28.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:52:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] regulator: add support for SGM3804 Dual Output driver
Date: Tue, 28 Apr 2026 15:52:04 +0200
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-v1-0-1d8dc7620256@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIS78GkC/yXNQQ7CIBBA0as0s3YSRATiVUwXgNOKpkAYNJqmd
 xd1+Tb/r8BUIzGchhUqPSPHnDr2uwHC1aWZMF66QQqphZIWWy4xIC9WHwW6t0uUseRwp4Yskef
 lYIVCa7SavDeSvIHeKpWm+Pp9zuPf/PA3Cu0bh237ABkytdiJAAAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GGKUVilDNqyfEA6sr3nk2kkWtUjn/Od13NcvZQxnWUs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8LuIpuG+dCvVekBrimKeGSAH7y8gLtjg69nxj2u+
 VMYqAq2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC7iAAKCRB33NvayMhJ0S/dD/
 98ckMYix5Ez3H7coFFuv6IzfIlNdP/3+QPJ08OaXvmSQLZIsW8qtDIpjz0xb3hFqz1RpUJ+OTMBQKA
 4ZeU4oJyLFzaL69P07E+chHam1SqYgzTdddLmnnkUGRT6cGGV4nSCogZ7WMaLHjtw14I1zrEAkYFsZ
 M69WgKvHJwaYcFKBrd0342pZagzAUqIOaUf3dQETIHAENVbqaA5wonjKsV7gprLtJoKVg8nRUDvRLG
 q52LJVy54TF0CcAlHGFhLKFVBm/POIAr8KuQBVwEYxyfP6IK++SpaM4GpXTTAu2QTUrpMxTOFg4H61
 ooYcXO/ArcNRQl/2n+AVwZO01lVoGfWXk0AE4UQWLvmj8SklmR47WAuOAro7480gzI1f839mHuP+3p
 qFAB0oWMN0PkCBfuUSzrHk455ennXmvCWQrcLi1LJlxL6mmjpbBGCVQhPj7JnhE2zR5LkdyF6t5zp4
 YDvS3Pl1IJJCyfDhxiYXw5gVskFuMBxgpE8H4O9bYJuiVTUQH5ZIIL9TcxkMZdRMoC2BSo/j2Rljde
 AHrwWO+hCbKpZKZ+n3cc9ivMoVBpkhiDG5QcdL28QpCaB+AL916PsZ/RpBlB0NJdkDY9WOn1r70bV/
 cuYyGLT8cFf7WaM8+0Uvzq8quwDAAfVvfdnes8nShf+XapoIO+ADn9EMLSAg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add support for the SG Micro SGM3804 Single Inductor Dual Output
Buck/Boost Converter used to power LCD panels a provide positive
and negative power rails with configurable voltage and active
discharge function for each output.

The SGM3804 is powered by the enable GPIO pins inputs and only
supports I2C write messages. Thus we can't use the regmap
helpers directly and we need to cache the selector and
rail discharge state then setup the rails once the gpio
is enabled.
In order add flexibility, the regmap cache is enabled.

This regulator is used to provide vsn and vsn power to the
Ayaneo Pocket S2 dual-DSI LCD panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
KancyJoe (1):
      regulator: add SGM3804 Dual Output driver

Neil Armstrong (1):
      dt-bindings: regulator: document the SGM3804 Dual Output regulator

 .../bindings/regulator/sgmicro,sgm3804.yaml        |  77 ++++++
 drivers/regulator/Kconfig                          |   6 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sgm3804-regulator.c              | 280 +++++++++++++++++++++
 4 files changed, 364 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sgm3804-8764fbb72eb7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

