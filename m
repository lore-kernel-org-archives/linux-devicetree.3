Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1631154B1D0
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872881; cv=none; b=DqKBQg3J8M6TV+10jhuQWiMR3qoCnQEKw0+wpk79JvcFnwoHaSzcgIPxHiotfNQQ6TRgCv8Su9mPEdScQz51PSkID8LUuPmLy7XZE7uwzngSwhXgzMQ1NA9Ym8YptyyS8BBEX3oFnNTRnvbq4M2Thby2hmzZJsYqvVaAYGhqb5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872881; c=relaxed/simple;
	bh=cw2N3W41LXIl6pSddh/dl3HNjG7u1Myg/bxOr7qfT6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqOyFW3zqw0kjLNAvtDZ7gN2ySzfCGI8VL2jgzhLgFCri695cvTw4UQpUW9EBEfrmKUcgLGHnnIaKhOYuPIfSku6SfJso2I77ETjElQpH+DxAWOdU9P947o5DzKsGJlQH4IuD1sTtvJhv7q837DWjm4Ui2tYDA6WlX0WbBw08Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWlF5NOj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWlF5NOj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24761705e9.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872878; x=1789477678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cc+P01fTvqlQKKHP8oo+eSTRJiBil/x3iDFvTP+c3Tw=;
        b=BWlF5NOjRo77e25eNBABnQaCIu8Hwcy3l4eaxOIDunZ3G/QOrArB1kRyq0GcoEdTwc
         5Q14rHIIEzAcRe+cz08DS4QV92pGM+iYQfWpEE6PqW0GDDxmEVTAsjVNXuHUXooQPKrN
         tTV48eARuxS6QidGiRwFRLKB9MjQWGfUI1ktaq4pEmtyg5Se/78sKgZyxgYytQb0z1s+
         mZZrAV+LiqoG0BMwekf85kErhIu5jea7XAFhf+IHKhNzxKpUUgiHXd6P4EsR8bet3L4J
         cCJ1n1yBqSENWeCdLy0RTdziVkCFPBwONaQ8BKSAWeVUlXRoa66Ln08QdfyGqH1hWQte
         CcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872878; x=1789477678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cc+P01fTvqlQKKHP8oo+eSTRJiBil/x3iDFvTP+c3Tw=;
        b=JEQq+eWeWjNrdmkwW+u3+ZXK4hA4szG7EWHKqy+yd+N6XhHjeceL2hviBvYgrwgbFk
         RwX7HeMCd95Lm9DxPeAwZGjoPazPAoN2K5fMEz7dhr66L9q02iCVPMhhNbaDMJDKHRGu
         5Db9cd21zuttTgvI/VTMmLqjPFr2grMAcARh/llFNzr64aEWJqyfTdgfn6NnnmQue3cI
         jh0WGlXG+QKlJLbxRNhvflW1AVBNM1qscTF0SQeZvf8d8Vwu8/li6K2OaNWvGcwMAC3I
         qYCT7fjIOnpZ2p/f6ITCuagh3l7lpzyrGCuFM1FeApP/t7OvL9Xp0XJ60CSilDV48Chd
         z1Cg==
X-Forwarded-Encrypted: i=1; AKwUvByqp01zPGFD2P8GnJZdymaJ8HdIaFBxkklBfz/xyqWwgCKSNwYyBn+mhGbvNQctNY3TkmqbFB+0QckC@vger.kernel.org
X-Gm-Message-State: AFuF++nWjz3PR9t2hf6dtdlkLwt2GTAFHnN64GIHeZHiLjhFok6Jsr5m
	4DcH7+nig80B8ICxHUY9G1cdwW2P+p614AEplNZLH7uGy9v5tS6/CMeQ
X-Gm-Gg: AYBFou2wa5tFzN/myPu1zk9c1W9Fv31apo2IEeBKN6kZXnJy+BHETrcbr+WfmnD680Y
	mnju17dzmhCZ4QuIb5586LFR2HLncj9HvVCrFD131fHCO90eK42krd1Pt2ow8q6D4svNlA10OYL
	ouMxmnAxS7OdTH+oTmir2OVw2M3QhUuOhcqKxqa5ZmBLpJ/8vTHnAS4SC+VZPm/WFHsz4y+0k/K
	eA9uMYqrU+GomCPWj0OBHQIS2KSQJ++7UxapXsZSzrS2W3Qif/enzB5zPD+VrDMSojX/XC9oSrV
	Ug43RAxQfP0sez0jfIYAeJ9/Off/0GW1jlQ58hcR6vfxLis/SF5YWfw/D0AgHMboC14Jqr+18cQ
	R0zRXKvCDt0uIteo38aF26ImGNi0MDJG2mmonFk4UWzW66uA9rwQUJKnfqPZnIb7GV3bynRO2mD
	Xu87OIM2mxRZsnVz8TP3O1PSqOPbZot9LwKyuNAE2Zwiyvyny8LGvIGlq3W3A0hpqzGajRslSyf
	aT+5RpVIuaOg2i3i1B32D2PtUxQHp23NfyXEPBLOO/k
X-Received: by 2002:a05:600c:4744:b0:49c:fc6e:a3e0 with SMTP id 5b1f17b1804b1-49cfc6ea75amr279617375e9.31.1788872877979;
        Tue, 08 Sep 2026 06:07:57 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:07:57 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:07:43 +0200
Message-ID: <20260908130745.2545-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera PMIC on the Lenovo Yoga Slim 7x Gen 11 (Qualcomm Snapdragon X2
Elite, glymur) has no interrupt line routed on the board. That is not a
wiring omission - the part has no INT pin brought out in this design, and
the sensor resets are driven from TLMM instead.

The part is a PM8010; this board describes it with the qcom,pm8008
compatible, which is what binds the driver touched here.

qcom-pm8008 currently requires an interrupt: the binding marks it required
and the driver fails probe without one, so the PMIC cannot be described at
all on such a board even though everything it provides - the regulators -
works fine without interrupts.

Patch 1 relaxes the binding, patch 2 makes the driver treat the interrupt
as optional and skip the regmap-irq chip when it is absent. Boards that do
wire the interrupt are unaffected.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11"),
where this PMIC powers an OV08X40 sensor.

The DT change that describes this PMIC is not part of this series; it lands
with the board DTS, which is being upstreamed separately.

Oleg Keri (2):
  dt-bindings: mfd: qcom,pm8008: make the interrupt line optional
  mfd: qcom-pm8008: support PMICs with no interrupt line

 .../devicetree/bindings/mfd/qcom,pm8008.yaml  |  7 +--
 drivers/mfd/qcom-pm8008.c                     | 52 ++++++++++++-------
 2 files changed, 38 insertions(+), 21 deletions(-)

-- 
2.55.0

base-commit: df2908090cda368b01ff43709f51890076c56157
