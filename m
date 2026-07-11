Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80022C21FF
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783796227; cv=none; b=LvRs8OSExosX4VGbAacf7+oB29qmS1dArgRCLeE/j7PXqwjKAXEoDr3+vc3Y/8vYr15Ocu9aCKLmB6cfFlghs7TxPcuLhjmzPg4elWYx9HxUJ4ZpOc57XamoGBTvrMMU4yvAA77hOcdmsHDmDaqhs9I7dWSKR9IfjOtdRw0uK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783796227; c=relaxed/simple;
	bh=QjEEwtsO6GtUb5wxi3/uSRmeBBqn1mmEfY0J7eQAVsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BowhAiYTCrXdR0F28xJWrJ0QWS3hU5y6WDD2aKe4uw5NZlDZA9VpV9IiuliitRgKccnQOw4Pha+kbl7N3xKc8BB4dmfZOywevDyIxfkXbfsp0W/G+26vvYsW+bblLfWqZn2ytI/HpZFt+kpfGROOQR3hrSjc7YJ1FEudxnesSPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjBjh0vN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjBjh0vN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1240618f8f.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 11:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783796224; x=1784401024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wKAi8gITG7GEkjFdEuXvc1WgB/hnQthAXmnHmDeYZs=;
        b=LjBjh0vN2tlu49T/6w/h1i2yDrvIK/PvJuSdv0sO9qo5MDzyPH/cr/vB2RkMNx5ayt
         DHGICuQ7qSjz5IxM/GMqD+GlwhyTPE/+paP4G4cXxrNXyIqa9f8h/hI+XtNkauqOllS/
         wLWLlGSRQbx32EzH89oS5fKf2poLBaLxNKG2a8aPq1OzbA3M4n6+gmfqdrAQtGtvUWUv
         Bx3RseGLtfX/MQ9J7amfdhCHNvOFzhFYks1UuW5UubIrS+FPu98NLPDkc3cKDqZWNQ1m
         eCF5NG8VFDli3oENh0grhLuCpQUS+YurwpG+fJOOBZ8cOeBpvrmVG6IHqDjICVmLMS37
         36Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783796224; x=1784401024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wKAi8gITG7GEkjFdEuXvc1WgB/hnQthAXmnHmDeYZs=;
        b=TvS4ts7zECnDCeuf8aGhdHVeMx7mbmEmfsSh3oydi9XTjwjmWrAI/X31xUkKWWm6I0
         VhyyLByqxMzZtBU9Nd1LSfNeY1VEiNTr+xJ7I/BsC5B7YUjnstEVf8D6wfYxmN/1HXg3
         wrXL9CJMPLIDY7tAqi1s6Th7a5ejAei2NNaeIGyzaY4TDBuKEz/pTnRkDMnQqk/mjgLF
         tBrwqDk1QLFxYy/wNLiiWe1+AcPw0PrU5jm7Rc+8iumU2TpfgxTkGVnjBnZgD82Unxln
         SipsBW7+YIKcXcrfBwUBqhNJxVTjWpXv319cwIAWnJ69CKjr5wsWAEsDXK2bpdujGjXb
         W+Jw==
X-Forwarded-Encrypted: i=1; AHgh+RoOBVaUhnvpjowvoUomcRlR02S/uj922dl2zo+mtJ6B6QE2EdwM1RMAvHl/0L6EEbw0tup61xBfsj0k@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hrhy4HJ6owL4LPVAI2QNzji5TULL/d1ZMH/oM6MirsQHRP/8
	F9Vp8Djov8NFZkZu1HknnIJvKn/Cif+XAJls1Kf+PRd6O9xELWcffJ7Y
X-Gm-Gg: AfdE7clV8kVn82niZyoBSz8I5JJb094WTHP1NslYoTPzjZ/fCu92Dm3AjYA4qjfY+x1
	qNgIMWpQr0DAfNmrYPhHkA4mWwGY4a9XnbzAuUyeQRVFrZ2JK12TeQ+/Y/r7btE+zCj49Q9jKZv
	5AaJWLTpBTt/tTsO5zWmccyjAGUgXGSBX4OUsE2EPxpUJoZLtk4HnivE1tWSlAs0cu/6uQcHg+h
	IKEF1aMwdqxaqDPIPKV5oT7ZZ2V+2xIC/w4Xy7/GvnTeCxPBlwJ+1WJZhn2LaDCqfugRcSBr9Sj
	eaYibYEGiZr1r9MsKhbz79mUDLV/XpOlB6T/l65pM8gsHstCIqlHNp0Lzu7DwkPLylI9sgctk7h
	4we5KOCeS3cumEyD3R6btp2F4Hri+Hd5XDpkd6MiElGMrTur3zCsdcQybCIAOmu3cmHvqmyQ/aG
	YS0wsWRPwbpPpgG/Dpn1h5bKbxORkWcHsQoJ+4iMli
X-Received: by 2002:a05:6000:1867:b0:475:f0f0:9ef0 with SMTP id ffacd0b85a97d-47f2dd0c40amr3701536f8f.53.1783796224006;
        Sat, 11 Jul 2026 11:57:04 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm66905647f8f.19.2026.07.11.11.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:57:03 -0700 (PDT)
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
Subject: [PATCH 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Date: Sat, 11 Jul 2026 20:49:32 +0200
Message-ID: <20260711184934.55701-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Xiaomi 11 Lite 5G NE,
codenamed lisa, which is based on the Qualcomm SM7325 SoC.

The first patch documents the board compatible and the second adds the
board DTS with support for regulators, storage, USB, GPU, remote
processors, wireless connectivity, touchscreen, flash LED, thermal
sensors and hardware buttons.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
  arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      | 1138 +++++++++++++++++
 3 files changed, 1140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts

-- 
2.55.0
