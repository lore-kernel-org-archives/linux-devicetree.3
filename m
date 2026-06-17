Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71343B9DA8
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 07:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680585; cv=none; b=nCjxwm1E6rtBHr4iCg2zMrz9PJWMCABjWGwj6oGpmGySilDbAShYK6Z3+AX9Ea/7UWz1Qetdnds5YvD0pTzysqAFgv+16RJyhSgg7DVhAfDX7aPm1FGcQxNh2y82ltVwnIH0SCIuIKvNU6vGA3QIbotGbHtx5NTf8FXEjt+GxL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680585; c=relaxed/simple;
	bh=/QPr2VI5Bd7aIe+EEgjF/mIK0TDGhGB8//uxIYXmIVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FnIm9JbL7DJDawJqElwSR7OVfbVhhSSd97zUqLwV470FI4fuOtObRWRTP/85FYx/mpS1MjJf9MxBebo/ikJUCGOgBQPIOEVVsv5CSbzw+NOiLy/FHZG4QQ8uTKltZfAzu6blzAyfa4BZfMLVWLiGQRCHYxfaFemlay63vf1iw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rk8i6VcX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rk8i6VcX"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso3991779a12.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680583; x=1782285383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwxdR1W6Z9v5pdo49avh6aIGBoyqUrm81Om04vpO0w8=;
        b=Rk8i6VcXTwkublKgUsN60jAigY2luSFRQjO17qn5Uk3aemMirEpokWbnvunixpME3+
         OU0h+z2HIliEGgG8Vynb407BfdiwS3Taph+zpnTmOfPqOVJBFZy2gaoglmXOfqdfQbqT
         RYAMjETJikdswTxDNfnqTeTaOLSa5049T/E9n9wMb6UtZ31YGnhNqZaG+HAERbKo9Oh5
         3VVSrUjyOqLXoOab92N3jZlJxZav+sRdK7e7kiGJJXDk2Ys9OXqol8WYJFuukNyZUrMW
         8EdkEPAsXNn0qiYyATLlDtfawKPPXr4jsYx/WdaNPj4SBqEVTjJPblmTpvapn82uyZQu
         Of7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680583; x=1782285383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwxdR1W6Z9v5pdo49avh6aIGBoyqUrm81Om04vpO0w8=;
        b=OVTImvNlID5lkjvEru2l3UvEWiyHCnCRTdESSbghJexXh1y55y9rkevWSSICKt46ci
         fKKsXLwXLtZXjnH5godZtFthf3WCU4eRVuilngUqkmSpuklDGjslQfW/FYTLQvIoqERm
         OoJ0CQtOX3iE3zgCP7CB93b3TF9oRZZamXGnmotOwVoGmihn8XsA0pQGGDTTGmhvQOu2
         L/dhhB8+h+LS0AssjpHCM3KjkwaQk39BLmKGdAfl6HJoHq6e3BTdaUaGDRWjVwAp3z8m
         CMM50yDlUd7aiXRmAES/eu9zHP4lc82jYhdG/Dse1V/I8obyGrgWarwZd5z3Wu/PPnX+
         pKyQ==
X-Forwarded-Encrypted: i=1; AFNElJ87PHqcNJR98Llu19bGWt2iYnBEvzZc2nRufwWWilEvMAhzjME3fU1CvI5mL0MWoD2o6oWDLq2B5rHA@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDv7/J49eBfxTSgVrCalsVAzS7BUpBs5tLsuwSzQ19SCjiYcQ
	hTxgpAaUnUEtto2/JtrZtqQFMeelHgqjL3VtJA5v7b7dRtidvMTZnCu6
X-Gm-Gg: Acq92OF2iU4SAOmfwU7ZPg/mEMFztf/3HtH8BLB48g0XB1dqdq3tYeqIEfHvu4OT3K0
	h0VTgE402uU+jyOE56mzsCIuuwp+zcHVQmtDpWT1m48XXdkNsHsaaiAj4Q71TPKFvtP4Pc/yann
	oT4cnlkQpfvmLv7JW7EpgFEgSkHOcFM4h6fn4g/1AwUf+hdOggUvDA2ItbXaVVqn7o6WW4Cb8dB
	8xDzNoXKxKMQuuNCvGyoJYBOwyBSpKq1iBcEVZJuzTbbmJkiyFNTafvcdgw3ZyY37FCel7gp8YP
	CXZUkVJBJqsuH5w9VqMZuVF9wOczTZ7u9XIm/K6XQR/Q3L6eyJC3R1dCAg6c1R7ODyVCUntnLqA
	05K7en/lKlbwwtxSPbQKNsf7x/JohOzeqWWR2Ho1RsRz0y/KgGyzXYC3iMoZDQMBu5VQML0E44i
	KxEae8aeASJg==
X-Received: by 2002:a05:6300:189:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3b8b572f8bcmr2880117637.1.1781680582948;
        Wed, 17 Jun 2026 00:16:22 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:22 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Wed, 17 Jun 2026 15:15:55 +0800
Message-ID: <20260617071604.635627-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Disable nfc node by default ahead of nand_rb0 pin addition.
- Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
- Disable pcie_phy by default to suppress probe warning.
- Re-enable pcie_phy on S400 board to preserve PCIe functionality.

Changes in v2:
- Add patch to disable nfc node by default.
- Link to v1:
  https://lore.kernel.org/all/20260529140605.1070764-1-jerrysteve1101@gmail.com/

Jun Yan (4):
  arm64: dts: amlogic: meson-axg: Disable nfc node by default
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.54.0

