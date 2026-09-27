Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343E3B27E2
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524690; cv=none; b=nxWo1J2gL5/1/0cMDvHncgWbeMfDI7rO1GWIpXEnp0piJvRk8/CRppxnVtVEe4eGUPTgHWz05eL3gScx8GXPzJXB/68+5VtSTwzoAGaTpUEAL5St73LKyiD2UhIH1nzuKX+4IPkIW7QNLkT7CzXtvfB4vD4f1NnLIwsyeCYYOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524690; c=relaxed/simple;
	bh=tiF4dNCYfSiePx22DoLQmh8H7VMxIsra+1NAFUac6/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYXsynm55U/RjelVNL4NuQsr53VRpv61DSgJcsNt2yRzcn1oWTUltOvcZeIq7cXsPI4n31f/3ce+O5/QBiTD7Gq3iBI7LZiEBQ42Q7oTOE2w6nxJDc8hgPFOjcBqfo6jZ4GnKvQV3DzdI2QFcTIO3UcLWWmohjuNKizqN32otNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKLZiWOc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKLZiWOc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso16156015e9.2
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524687; x=1791129487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hVPxB3LDp7THumASK8lONkRvyk4UvlnbOgMgC/3vpg=;
        b=CKLZiWOcIGTYFxrjiFrpaTsSHy2u2Pej1OYTjB7GYk6Ome7Gm4u5//Z9KRe4JlJvTF
         xxBTUcUUwSEVS9ZG9H+NmWmPEL9YNuYtvJVdg3isu54LimWs7tR0rFhxjVnAndW/gpZF
         g7mbrM4Ho1GYDBsEjaBYj5b8NPQEMRp34TWTKCARgbi+regBJFeBw9PCXxzB8Eit+jGt
         CTBPYdg82bxDwA+FpVNFArng5OwQ/TWBhxEZdEtr9tpSNf3PrkZhe/wUtQv9+uI5IEoH
         Fo4wS6WvUXNC/XsbsbzbNdYrCW+jm3Vsd8cLFnT9lpisOGbzTSwkjv40ip5eCUWyeGTk
         ctsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524687; x=1791129487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hVPxB3LDp7THumASK8lONkRvyk4UvlnbOgMgC/3vpg=;
        b=AskyCZeu9QrNSR4nSmHwYHs1nq6WCRCETG9d/xW4nypUngWxkn5j5J/Ie5aj/nxKwb
         fX3J8fsH9uWGy+qu5PMToHwfgqPis48wWmV0pEZ1Ay3HY0MZmpZc7F6BgDHwWMiqlVTc
         p36NjpO0S5WBNvaTohrBsPJcbS2tMpghBVRXmSHaWDuWD6U562/oxnENEA9G/Iq7jeIe
         yS6x1DgpRHJ6Em1WLJJp/XxeIAENYNfIRoPwAWUxL+yg2FD7f+pke7CYpJ4FtMXfNWq0
         vB87x8H7vESuUPaDgRQ7fRHViqEnXsDYb9zTkjIN9dTii9E+2UvRRiaingq6zR4VKtDG
         EGBQ==
X-Forwarded-Encrypted: i=1; AKwUvBytciOtLfujHSfbWYpBtPan/k76OHnoLOQaSrhRWkv2kitCYDnq5JoEi+alo5kD262Bho++U7GrQadp@vger.kernel.org
X-Gm-Message-State: AFuF++nWCvf7Pk04qKcgqZcQD55U5OAHYpb3nMBsV40EHcm5BN4hH2Dz
	x6oblY/v4AEHr0RdfEKwuIofElTo0Bg4jecieQTTWsndxY42motV19Nh
X-Gm-Gg: AYBFou3jXwE2qdKgpioVHmP/C8r4HohWxUt8afYT0HM1Mp5TD3tCaiOsL8T+Pksnw1u
	KrrJZoqTe32xTx6weAkJObDvRi68gzI0/UrxKAKXpRDcDnmOCQUKpURbS+wxt8BKYFkDDMZ4sv+
	cboDiMc2jzUzH6cGaIBsmJj15TlP1YKcBDsiIb+kXTHUdXrhqgm1osFugs6Z63oikfE9dUodJ0g
	iK1hecpfG1Jpnbhmlq+G/pU0hB4vY+X/HYQl2+t2iwNcrQ9E9TWQH+HiKjlP2Ue7CQuWAfEBQhP
	Kx9k2pD4was57X7F/y4w6HrEIR1iQkSkLwJ+xhRB9klU2IQlIdayf3Shz+O7SG2V5xyG7KNY3iv
	zztBjGHP3Brdde2U3LckN6TXixXB8fzmstLLu+NK+5pd66SlNsZREfEeqC9dhiB4Fjx/CdZiAJM
	Ipfi0I/NliFKgHcAjhrK7k3RVTP6K7Iasnf7X9hnRutWi5EkqO8/XGMEZwuujclk8/Yq4+sEJTm
	mRtfbBvdKD6UWgKIzbX+cfSXRYDyQ==
X-Received: by 2002:a05:600c:a06:b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-49ffd4ccdd5mr65841555e9.28.1790524687190;
        Sun, 27 Sep 2026 08:58:07 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/3] mfd: max8907: Schema, pdata and poweroff
Date: Sun, 27 Sep 2026 18:57:41 +0300
Message-ID: <20260927155745.187758-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  33 +-
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 304 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

