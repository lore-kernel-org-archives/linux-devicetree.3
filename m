Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8893FBED9
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294675; cv=none; b=dFyD9woKnQYb72pP6lTMuKx5/QTN8bY62tlw00yPJnowOpQtR38WqXhkWcyIDooLLpO017wSiy34x6KdYiUx3iXOLU5LMXvcWgu2QfvUvkxILXL//0NMm5JGmZiTDRIkuNzSUxCTsLkmCXtZm9tTHF2wA2wRxHjtupSOVJXI0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294675; c=relaxed/simple;
	bh=Ts5q+kqfTaMNJiEIyTm/ek2bYOkWkZ4DPRtDh4ZAplU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=flx12fSbNsBTyhpxIqPQMuYXjpk/9t+WyCbDeEkET7xfqBc++/sI3zZl8EXfq2UVyBSS4keYDTm2phMr0LSs9WXsc4Fk97qOVuKN4PktYIs0TpCTASuWnRC/xem6UzQK/u2BQRAHVD9WqpCIfiC6hMAJ8hPf9YoFvekPiFV8Qh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA2Gtdfp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA2Gtdfp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so33858185e9.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294672; x=1784899472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ME7NziQ2ShyFM7roINztK3fiLXBSO/S0bE9HR7+Zss=;
        b=hA2GtdfppuW0e8X/ozShJcfM8MfeWXRYW6fh0ZWvt8CI9ikvxy6AbZnejCzxDAREMX
         BjVwelppyw6Qp9XUFZIaIDLJuDkkGjeE/jvTY2dUdzHUmByFeZtu3K40w99QYk/R7uDS
         nJVMZ0qkDMO8bas+CGx/ilty/py9ZaHIC+rk8wESkOIcMsIsZ0LSFU1fbdlwxeJ4wA9B
         ILvWUWBd4corXQ2RE7t128Gd4VSN+uZ1Eb0RbuqM66b5q4ZeRyFr662SdBgU/mMIUS/x
         Vvil+cyMKZ4VP3qF9NG6S95mwJHaIVc5zirQrwiKKqrMVm8hMigJeVLvoSBBG1vhHj84
         VIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294672; x=1784899472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ME7NziQ2ShyFM7roINztK3fiLXBSO/S0bE9HR7+Zss=;
        b=itWGmPAutoXolv9BXKcJO7HZsjQIxPNd0yzzbpYdcmfCtDqcCQY1r6TMWpZvGwzFRr
         KKaQJHmm4OSH9UduJ7zyV421Q2XtpUZJGUoCfIbl3ZV0yEmz1tE85FSQ4kQR28SmOTpw
         Ji0x7EvO5X6si4EialmLNPHQsZdOGOibtYaN13CYyhXZyZi06DWqxe/QiIgIpJK7up7h
         AFWnVmUjE9ki55ajjw4ZexyTsfXf1jGQ2dnG7LZhG3Bb6DZr+NuIlZ1jBw4T+8Z3nasX
         WFwcCflvT8GVgY8ikjlpovKuJFshl4Dgv4G2Jc2mmWsw0EXXDMzMPsyWDkku8Oz9kHge
         vlUw==
X-Forwarded-Encrypted: i=1; AHgh+RqnXucE2EtuUWLVriukuwA7c8nBoRgi2QZBRRKIzk1QN8GdWQZO5opn6QgTw17TexWTDpnjqZvxBbOY@vger.kernel.org
X-Gm-Message-State: AOJu0YycQCcQZ3QBJxb14FqIVn6KtWaEsRyEFUuz/doPC7CD2wqE1Wcc
	fY9OH4FyKnEmZI/y3KQ6rPomBd4hQogXnho/LGG7QQMdXGW60gAysSfh
X-Gm-Gg: AfdE7ckfqY5Vfi5BtNk+W7PMxaF3nhS81IlPEVxt5IQ450BYimuPqobjYD5cjOFHTg3
	vXm8dyafz4sXNAZwva/j4klQG5YV4XXzYyku9NjXIzXe9qeDZKqQvrmV8Qmlh/1sKtlLmumJtNu
	/FlWFh8isikYuZCYIZAZyahiWlSfTrpG4dZPbC2FXlunLSWmOvvcfcwVT5B4ZR4uzmrSEF2xeIX
	LTYF4HjVKPWNR5PoyHbmjzMy0KXQnZzogRsF9camROuGogvvaHLy/GNcXyb1RecwOPK/WqdeClv
	+gQsyGmyG35Dl4a/pNOu7dhOkq44SHtsRbAMCTD/cNOTWtIUksJeaAy5ir+WWHUa5laBrDbpxpN
	nvxyGA+mnjTRbV8SW0nKdmfiTdI9Rbr/ybFsR7UkGmaFyHBZ7bHm+OoWA7kcx1HbTexigO0viNw
	xrCIDiVFSk5RNG01M=
X-Received: by 2002:a7b:ce84:0:b0:495:4487:61af with SMTP id 5b1f17b1804b1-4954a51659emr20959275e9.36.1784294672077;
        Fri, 17 Jul 2026 06:24:32 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4288423f8f.5.2026.07.17.06.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:24:31 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH v3 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Date: Fri, 17 Jul 2026 15:22:16 +0200
Message-ID: <20260717132218.27007-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.

The supported hardware includes regulators, UFS, USB, GPU, remote
processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal sensors
and the hardware buttons.

Link to v2: https://lore.kernel.org/all/20260714125806.310708-1-oleksiionchul@gmail.com/

Changes in v3:
- Keep a blank line before status properties.
- Use interrupts-extended for the touchscreen interrupt.

Changes in v2:
- Drop SD card support because card detection is not reliable yet.
- Constrain the UFS VCC rail to 2.952 V.
- Drop the unused FSA4480 interrupt.
- Add the touchscreen pinctrl state.
- Reference the reserved framebuffer through memory-region.
- Enable ramoops ECC and use decimal notation for mem-type.
- Allow the unused camera PMIC regulators to be disabled.
- Document all GPIO reserved ranges inline.
- Replace underscores in node names with hyphens.
- Drop the unverified USB limitation comment.
- Drop IPA properties now provided by kodiak.dtsi.
- Drop redundant USB role properties.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
  arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      | 1108 +++++++++++++++++
 3 files changed, 1110 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts


base-commit: 1c553b3d0cfca9cac2186daea6e2f81808ce7d8b
-- 
2.55.0
