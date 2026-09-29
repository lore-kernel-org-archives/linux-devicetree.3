Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7618C5372FF
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700753; cv=none; b=hhjBfcexdRq3yXg0NO1OUsfQpSDGkyzeecwtmlF0cmMEj6j7KEwfQPa3tbrLATyNGmtgRUBcVxHnvkuBzvcvhdKKI+q+SVbiCHXTy5DAO9r+HI73mLmP3tgJMsBHzMDbucAOjioqnQigaiUCveKQ0Tmkjbgk0HrxrnM5YJysQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700753; c=relaxed/simple;
	bh=Cnfv+3Oyg0thjSFdj6bj6qA4t9kGvvD9MItwbmBEmjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1P4M7iFPoW7j6oexvFss2WVySUiK+GEzgr7H74Cs8ueafR105T99r9QiS5D7rQCq6BcFGTGjspOkxRYh1X7k7LWNACQH6nOV1wfAosaLslYgISz/AtRkMFQz+G6YkV4okHJdu/igGKeDJ+MwAQdYmLA+rCsev+7CnMS5qXg6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pp4Gx75Z; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pp4Gx75Z"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76cedd9baso5640571fa.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700749; x=1791305549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjghGFxddp+hgpedfnq3QLkecvvYVf/Hl+33N5EPzS0=;
        b=pp4Gx75Z5t5rjXLgUzjcwFerW/CGlffQsbllhqqpG+24ILjwyPSYu+LjVcs0L2Ad2z
         NWIFy3kVjn8nJKIvJgS5rASHWCfeNs0Nerpw4sKDCpgonrwpbvR2UtIPensFsubeurUf
         WY5aWsKf3V5dpzydtoRGWRBtqEIN4YPos4aXV9muD3cEAReS2tew8V98TjidPBQ/3kTg
         9kgb8BD5Bn0lnW9mLgWO5ow6uL84AfDYw3/qrHOFv2p0ZkzpvERrq7oGLJJ/OZYG37yu
         jhEJOXMGJdym/G3QNTM97rTxNeAYCpUBq4fzh2Fsy5MP20v8oFiePchOAPsuEH+F/6eZ
         HbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700749; x=1791305549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjghGFxddp+hgpedfnq3QLkecvvYVf/Hl+33N5EPzS0=;
        b=StI11yDuGiaJzqpZDmcH4dx+A9Y8/k0nriUWvGQZFtezLijJyINjoA7kiSQnLkj3Da
         6L6WGlIf1ettuV6b1dB6ZkHvoSUc0lV3zDvOILPC21csxO8M468RnIvjTInVgaA4ON+2
         ieVfmAiW8ydXyQAAE+POI7vOGvpineAhKw30sSWkrOdlh2M68ApaRBHp51v+BOVcOp6o
         rzWtTfTd+iZzA2W7L4uYAKQ5Wqu84vRXgkvLguwN9qacJa37AYJBjhdmYto9lxT6vDHP
         UxnjOa0MjDpz3jU9eUrSV1CphAA4/ZceD6J1zlveShk0y8c9ZXMvS5oKtYg8ZXZs1gpy
         pzJA==
X-Forwarded-Encrypted: i=1; AKwUvBxIs4bO9+De69gGDo4lLWtPN6ONdOS/TAMU41A5cMQO/Ew9toauo5kpmm8kQDy11y38idQip2GDB/on@vger.kernel.org
X-Gm-Message-State: AFq9FYI05IOFna8TySlnzY8y5WeoAL6n1tUMh48GpNwW0qa3PmbfTKhp
	YKSnDewEg3Q9XhyYF1xPKP/Mkfu+w4i2j4lUuxXOwKcqd1u5NhjCk+s=
X-Gm-Gg: AYBFou2LmBwraJuRMXf7fHbad891OSZkXYM4dh01hHaYWdVvbImdnurmUxYSX0wBglP
	jDk3fYfvwtpoGewiRPZN3BY6mCAwTYL2yvicUyUhbplkRqzjDkTkZ0FPdCDRfuv2KcE17i5jvhW
	vKTE3sconuTG7VUorulNHZTwgGlClIPhBHcupI1AZbpL5fA1pTEd0QfUbVDE3T2MM1maoZqGD+g
	SEo5vhhpce+7ED1jELCIR0v/iLQS1kkgm7UTBSyh10jS4QBmzXEgXm7xlMTdlTTOOPDq8QZb6hp
	Oih6Ld2es0xP5664M4RbFwTHw42LnGGTePEAZRRjQ222bCpWem9ezlUGWhwQfMoNMimFm31Xrr8
	CkFnNRPxOKoB9yqNVJ8Xh5+cd0TqztYNFwHFHfvUOb8aUrMzEyjK+pig29+m2QMZDMzmzmCpFrc
	asyhTu/IxiOHtO7RiZ4GYraOPFYShe44ywrkrWcLH0np9YRMQxC10E1bYDBwsY
X-Received: by 2002:a05:6512:6891:10b0:5ba:3b9c:ff70 with SMTP id 2adb3069b0e04-5ba3bee0c5emr25354e87.30.1790700749263;
        Tue, 29 Sep 2026 09:52:29 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771947b14sm137751fa.32.2026.09.29.09.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:52:28 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v3 0/4] thermal/drivers/airoha: Fix AN7583 mux mapping and expose all sensors
Date: Tue, 29 Sep 2026 19:52:05 +0300
Message-ID: <20260929165209.69669-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AN7583 support merged for 7.3-rc1 reads the wrong mux positions: the
mux field names are swapped, and v5 of the series swapped the call
arguments to match them. Patch 1 fixes the field definitions.

Patch 2 serialises mux selection and ADC sampling.

Patches 3 and 4 add one thermal sensor cell for AN7583 and a zone per
sensor.

Tested on a Nokia XG-040G-MF (AN7583) with this driver on a 6.18 kernel
in OpenWrt. Without the series the board powers off 2.6 s into boot.
With it the three zones match direct ADC reads, and concurrent readers
during CPU frequency changes gave no failed read and no shutdown. EN7581
was tested with equivalent changes on a Nokia XG-040G-MD. Build-tested
on arm64 with W=1; the binding passes dt_binding_check.

Changes in v3:
- Patch 2: say in the commit message that the race needs the zones
  added by patch 4
- Patch 3: add Reviewed-by
- Patch 4: shorten a comment
- Rebased on thermal/linux-next

v2: https://lore.kernel.org/all/20260915191131.25214-1-sochnev.v.74@gmail.com/
v1: https://lore.kernel.org/all/20260913145226.34643-1-sochnev.v.74@gmail.com/

Vitaliy Sochnev (4):
  thermal/drivers/airoha: Fix AN7583 ADC mux field mapping
  thermal/drivers/airoha: Serialise access to the shared ADC
  dt-bindings: arm: airoha: Use one thermal sensor cell for AN7583
  thermal/drivers/airoha: Register a thermal zone per AN7583 sensor

 .../bindings/arm/airoha,en7581-chip-scu.yaml  |   3 +-
 drivers/thermal/airoha_thermal.c              | 159 ++++++++++++++----
 2 files changed, 126 insertions(+), 36 deletions(-)


base-commit: e856ca3013b3074fd07cb81c90b1de332f69153c
-- 
2.55.0

