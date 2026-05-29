Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09663C5DC3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063576; cv=none; b=St6LHGuYbnUtDiDU6WYftgXApuSs8A5dKhUMkIDmdPOlycFW28c0Eu/Z8UtLQvSWC5Gw/LDXruIhmq0ngU4dlGi/bl70/c/qgqxHZ//X3RsegyShozngzzN4SRSKIqPnYR0vZ849RZUk5Rr13fzP2+MAe+4e+sevckDd5lFxRRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063576; c=relaxed/simple;
	bh=gMkupi13C4dNDXnRCyhuCQI32ic2HsvFcNt98dfOdpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNzX2fmzpGCOkBfjTqDoIMYDDE3tVfXfILdMbu/P4uNMsKnKbS6/oSqdfhbgpXE+P83MhzTpohuxwA+ktHFsk9RSEIJHdH4mJisxQExg1dLQKmNjHNB7RpJzZgiQNUgs4USZ5MALvMcCqAIYE4w0/R0MlMgUiHSKX1pBnHYOyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1+RODVr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1+RODVr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf237e1433so6328475ad.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063574; x=1780668374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeqM+miLLQz/iilbW/aMNZ8W2aMIAVim2TI81LDeOXw=;
        b=U1+RODVrelGFYkPwA3irSbehOzxNUG/okW0w5BlE0a2cU2XFyJSTCxJ3vWGaRB2lFa
         iVUBD97PopDjS+MC7ot4wXrEthEyohTPX6JYZ6rwEZAtWEBrAZm++1VzpL4JkSmx1scu
         WRXeGbott3AyhGhuC54imr5CexRg9U6c5N1qUFphKbmTn2saB0Ap+cFn/7UbmYh21hdw
         jFLA5JPosvEeFtMBk0tzAL+PYWxkFus5gPWjEZ9VI07lzBFGHHqq+3mO88arH3I9dzhF
         bl4rKQxfaPGMcuwIIicaGQGpIOXXfGurtbFWCW9H+DIp6VInVLzrjKHMY9+dnCKQGgtc
         EwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063574; x=1780668374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeqM+miLLQz/iilbW/aMNZ8W2aMIAVim2TI81LDeOXw=;
        b=bpkAOR/GeLRxqhsPbRQZ1IK4G1ZoLyB8gL9BSaCatxwG28aiPaG0mDaYH+ayn3c1t6
         fO44kPuVC613sBnaA/g1bInN5ZTkGGY2qjq9kXlqhrqQmFLjQ+XbG5oOU3l+Z0RiGqz2
         HQm/xwmZwbRUPIDMk4OzPHB03C8lpZzBNJgkIuauGUeDSnYXLNf+CFAMhKuPXKZMNm30
         dJbKvxVOnFq/IhJIw9pMQOs+067Ykw/oGMqygBa6Hru8tOEIdqP0LGX2Pml4l6tD/3Ek
         LlPLKyrsAReV7Vnrl3kce9dA18Jsphvv2S5IwWbFLIaG3rx4kdemPUmHG9/kcBRDnQAl
         2pHw==
X-Forwarded-Encrypted: i=1; AFNElJ8yIbehpyVZtB48Jk23bkb6TZ3yFoZtUiTq4P9NzG4J573Qb2p4t756v2+Q0m8uC4jlowsreNewogag@vger.kernel.org
X-Gm-Message-State: AOJu0YygmUnDCb9kWiomC/qTPIGAfrib9AThdObqiQknWSmN8ap82E7l
	4OA5wc7NXhs+MXbS+XWhw60uRZa6U19T1+VyPz8oQUyr3Xz4NWzBQuKa
X-Gm-Gg: Acq92OG7UJkW2hQPNI6sqJF2t5OuD7qNbDa1z6q6TTRV8s451uIeVynKaIXGJcn4Hk9
	gXVwNr9rtOHqvaylZoZBrY7uUR/e41pMewYewQgCUXpvWtaTzbp6Ilb7qCcExuxMsR2MspDT3mp
	zqCkODvYTN6knO5gcQA4lVhoTvuACVRQDCTJk9J9K/1M6Gc1QVRs4z+ep7DVXrgpjAlbXdQ0LDf
	C+sejFyVlg2k2dx1lDD1qOzESWKXbjOIORF2q4ers+bVFS22LWUmE8SOJnmsTaJ2ajWG6/lgzcS
	sgcHGDFBQsO5bpAaU0gSFXE/FDvk/QxWqyeigO3OwVisMSilA2uX7EukrRYYd7nuJJwbO5gG2bY
	xKoV5UgQoIqVOlJSqduFOCjc1vdJ5DjXBec2HM6j6lAYwLyDQrpbLR1uFZBikSu8jhsY1tNEMgp
	28Z3AYVQktvkyLnGdGEto85gQOGjWW5a/fPAUU1zjOdOxsz2u0eQ==
X-Received: by 2002:a17:903:9cc:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bf204fd8f7mr40348705ad.9.1780063573773;
        Fri, 29 May 2026 07:06:13 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:13 -0700 (PDT)
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
Subject: [PATCH 0/3] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Fri, 29 May 2026 22:05:56 +0800
Message-ID: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Fix NAND pinctrl by adding missing nand_rb0 pin.
- Disable unused pcie_phy to suppress probe warning.
- Re-enable pcie_phy on S400 board to keep PCIe working.

All changes have been tested on real hardware.

Jun Yan (3):
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.54.0

