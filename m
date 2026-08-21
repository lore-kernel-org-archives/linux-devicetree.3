Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AF41922F5
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315838; cv=none; b=s4eMHOa17e4QhVgag2qRFqhIWbCnuwkltYgkiN3KMuZ9F1JqZqq61ystNGf2liuXxNJILTOBr5DgmL4znGos2invYaBsXooCKkoQp7QzO64AMT5FSuVORS+Xi45pxSgeH6cjN7NiTJht8JYjiJzh6ShRB95cJKnw0JgLslxwJuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315838; c=relaxed/simple;
	bh=PrDZgKJSfpx6nKGCbhXpOA4dPKRcANDQUxU89FDpCMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gclBArzYnqoen/apn91akFtvwcgkvUbXbjVoGZwrkUqCK1MXgCbL+3xq2lU34qCur0hrq/OQfEoJKP4zM983yjBBJwxfvKCYhioMf+o5rNyzLnGQ3emXtTJXAyCy2PO/n/pUEQrFRanbqCLHN+XDZ5kuDMC0Fz85gdNOocpipr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db8EK8wQ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db8EK8wQ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15d111ca99so111318166b.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315835; x=1787920635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLIbMgirXqtcsU6FvNo6N5DXtJvpeFxGtxPN2x+Chyo=;
        b=db8EK8wQn2CVnbUXZAUXm7mwyCUneQggozOBpIo2iF9G0Dyoln7y440LFKkgod2/Hz
         1L53km5V0uYRcMbNhqrAacBhmEVp3Iqt+ERumCrNduV1rXv9AKyuTVimebF0cqZBsSvf
         8XpZfEin5Og9JDLf9B6Ni61ti5NYWnHI2g/brmvStIRdvfZY+peKoc/JDSqLyhBSBJWT
         FvVIFfGWzvWdwhdcWXLRI/F/A3siVavaZ5u6cnRRQJn2Uw2CMBb0NinytPLr2gVIBVGe
         05QXpPneN51oDxz3wOq4FuptuUtBvMyWuR+Ty8cKeHOpfDe3/d6XgK2DDYwRnmM0w7C0
         J7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315835; x=1787920635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLIbMgirXqtcsU6FvNo6N5DXtJvpeFxGtxPN2x+Chyo=;
        b=scxaw/2eXFB6O31Ct3VnqzWZfG6nfj3T+0TcbSZQrE1lTVkRFz+5Fz8oONZ5dqH51G
         W8N0o5PFe5zUUdMbM+Ug4RlQQg5QPIkSaNoFpXQhuLh/8jmVoULDr9dFkBH4QNNAsc7S
         2Zopp41r/KeNBJWaZsMGBpiO2sph1/1uw4SFTwJBXbL+uQcKmof74TzyXO1kczWi/84v
         UG3CyimAmjV2yJ0W+2L3xc2H5848UbF738mFvYiKZkdyg7JflEeGYxLbctjG6Oo2kI1J
         ZvrbbSZAWHgrELb+Wdp37Q/MkbYKItjzu0vTpdOV5OLudtdoEniVtOivq0+6scpDKCOR
         doWA==
X-Forwarded-Encrypted: i=1; AHgh+RpZpa0sGApp0af2saRf10iT5YroXBhilOV986ewIm7IQp4BsP33nPAwuI3GEI4GYE/MVoGgTuCI0cwt@vger.kernel.org
X-Gm-Message-State: AFuF++lld9yByqvM+3kMV+Zn+vJ600YYzXi4jQ3Rm8L8cT49DXtuyqun
	8f1B+QYiFhTbB4OQNIMD8TIPf7iYSzUMl3ALhVGDsoJCv6gKSFMlsD8Y
X-Gm-Gg: AR+sD12MGRtjF0gd3DDEJZSXjM/DZ7oiQ241IiYIfFNnetoNw2gTeaQbdTcvxrCsMyk
	2R42gK8DCYJ9PGLmLUVyWs32IGuDdtjYoFdtl7TBMVCdmnRpj+w939AcceqN8lny7NqnmTnACfD
	wCmDxYJrhwsplOv9FFFA8uMfWnRYJHwJDT8+kbR1xpUPxe9UFXXPtY0zhzIw8QXf7Z3je/Dqztp
	EwZleoW/suYUqCy5gDTohsOJpd4bual2rsyT7qlBYf/eixXF9PjD+nKf5OuhrP89e3V17B5LiXo
	/gS07ta6J/WSPg8TGaDlYVDkakQ3owH6PRqT04TfLtvZIGsXvViiPg+55j9bgH5OTcrq6B4WYVK
	MczFessXt0bEgxWqHa2WIB6n0PgxhjOlKJvhonAJrFzpYJNB0v4xdFnQYGRzrOTQgkyi30rLFJq
	iBDrR8+Tv/Uro7B/NXVQ+b997GCIKCtbefcJfT6di/ytjQIwU+EoJvurxacRf8XVgWcSKcz6ARJ
	m41EzqACt6HzeVKm0uQjnz55yhR8zXWcg==
X-Received: by 2002:a17:907:3e02:b0:c1f:8145:820c with SMTP id a640c23a62f3a-c246a4aca6amr616460266b.2.1787315834806;
        Fri, 21 Aug 2026 05:37:14 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e0397sm451194666b.53.2026.08.21.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:37:13 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH v3 0/3] Add Xiaomi 12 Lite 5G (taoyao) battery support
Date: Fri, 21 Aug 2026 14:37:08 +0200
Message-ID: <20260821123711.1579539-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (taoyao) has an additional property with ID 12 that
breaks the parsing in qcom_battmgr. Fix that by introducing separate
maps for lookups properties in both directions.

The other approach that I tried is manual shifting properties:

+	if (battmgr->variant == QCOM_BATTMGR_TAOYAO && prop > BATT_CHG_CTRL_LIM_MAX)
+		prop++;
...
+		if (battmgr->variant == QCOM_BATTMGR_TAOYAO && property > BATT_CHG_CTRL_LIM_MAX + 1)
+			property--;

But I found that more obscure.

Will be happy to switch if the maintainers prefer this one.

Changes in v3:
- Fix QCOM_BATTMGR_TAOYAO enum ordering (patch #2)
- Order in qcom_battmgr_of_variants[] is already right (no change)
- Revert the qcom,sm7325-pmic-glink SoC fallback (patch #1 and #3)
- Rephrased commit message (patch #3)
- Design question from v1/v2 still open: lookup tables vs. inline shift

Changes in v2:
- Keep the qcom,sm7325-pmic-glink SoC fallback in the compatible chain
  of the taoyao pmic-glink node (review feedback, patch #1 and #3)

Stanislav Zaikin (3):
  dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
  power: supply: qcom_battmgr: add Xiaomi taoyao support
  arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific
    pmic-glink compatible

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  2 +-
 drivers/power/supply/qcom_battmgr.c           | 86 ++++++++++++++++++-
 3 files changed, 84 insertions(+), 5 deletions(-)

-- 
2.53.0

