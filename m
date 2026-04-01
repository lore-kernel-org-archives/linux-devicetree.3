Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831003F54D0
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040493; cv=none; b=oslXfx72TWpmc1Upis8yoY5Xh0UoaJzbmMNmymn+5DSDCf86c3JDMloSVvtVJn5n2SMabw4+9OgeWOIglt6T2p8s/G53duvu1NPVzo84flO4aoAe4FdcRBX8w/+G3l7849AQ3VvwBFbPeluidcnkSt36VJY41ul6LnGBFBQqotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040493; c=relaxed/simple;
	bh=WGxuJXdFlNYALBBSVHxIE/AXgxbS68Cj5o2toGqAAFg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kXUsZyNNV1k8hWdSBnbwsX5jKwooBAm0NKuEHkS/u1cHKiRvhoJciiOm56F+UbS+fikOwGNwUmbAcP6zAulSWtc0J4QUGSFHEs79qoYqY2IBsVBaAhEIaC8kdFe7dWiQI60zZsjaXirfg6djmK4tE21hMcniLOgJUVbydPoZT88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vr/vvoS6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vr/vvoS6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso4712033b3a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775040492; x=1775645292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wboQhrUsNBQxiV1hHptr4Nye21JcWW6sONOZDweDysw=;
        b=Vr/vvoS6ix2Az6K35dOCbM7PmEPYRA/VWhvopV8abQrCz9N5PSmGF2EtrTVMxGaJt+
         peJJvXrFl7E3BdPg3MfqoZlP7666by2RkcNoVtRPtYfklOghWJpL+p5IH/k8mvxZRR9q
         2jDoEyLL8fSBaOoeULOTXiy34zS9+AmMqLkbXm9xKyz60x4MAOeOUwB/84Oa3zHojjkx
         B+CAuy1vKGTRnnp93AmVTDJoqFtRJTmnggudXrCvYt5HTR3u+qngSI0YbXiEMb2kDhx6
         AYTYKVD4e+j4gw+nxj/ah9VUab/Me9KlyxhueDX4VQVy63WVPBtOEWVmjC+RvupIJ6+t
         xKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775040492; x=1775645292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wboQhrUsNBQxiV1hHptr4Nye21JcWW6sONOZDweDysw=;
        b=Jw38GgghskeBg/hFb+Tsq/jJz0NceNqDvlF0BUq4pXJxy5KKsoSkjzIe26JqiKgvDa
         CNQtx/E3OhhUnQVTU613F/NdgTlg57MFtSvZv116oR+hVz4LGOrm5GYOGmdC34A6EcW4
         SNKIH5qD0VZf6MO6R/stIuoolNVrSi91iA5jxgZDHFTbIUgGie8gy84y0BITdsPIdt6R
         wUWzLewSM4anWGeQoRpWlH0cUMEq1R8PzOZ7kuEGMQUKQNUfyNrMx5hSqgNxMeI8YnJk
         dxIBJSlTOU7ARtsTPv0NnIysp+YfIGGRRdAylBrW5+O0qGRUDTPR6RWzq4jaTJ2Plhm8
         Qhgg==
X-Forwarded-Encrypted: i=1; AJvYcCXW5uFztLJldphylQ40CmvrjdMSIm17pKXoeNAnFwqECf70DEDQ22CKAEoJjS+oq6HS48rzwc26JigU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7tXj3pg4bPfz3oFp4Ha6fFF/4YCBp+RkJMQjwaxF4M8csubKb
	TyPpADUpSTHsXdT8EVOw96mn773ef57/QBFD13IcnahSa6d1++YjZn9G
X-Gm-Gg: ATEYQzxeX2Km6QkNayCc/cVrZ1MDa8nhFUWcMaYyJtkH3KlhsACnUPuERv2o+HRMHkG
	dL2aix4T/OH/gOqA9k403X6t1o/WSbUi07yOvqnOEDgN/rx/u/lXJoj/IMAvE08zzunLUqT7BJB
	SZte/dNly2Xyi1CDJ9aaoz6YgUXwJBsBdi4RItHZ/tKoAxzqfIg33wL5Sxxc3uugrj5W2zl8Xea
	hWTpjHZSyoSdDse69eEUXzOP1c+iR01pQ/7YvBo1pOrcUXqNuEnt+aNi5GA2MYPwAcAdsiKjIBi
	eqbtTk8FWEA84SjiJDSPyB+7vFUsKaF9hWX8omUacVbkOT58gv1QMHQZbeTU8Ql8HkhRtBPkSRY
	8D4f3HXnAUyZbpCzS0v9hJkKuEDsKn9PMEEP8mdPGT3SmIuDu8h6YdPO/q5Rjq8AsSHaPdx2rCZ
	9Szr5aa8Zi34kstcPaiwdYxBwBq9xzZB++c0lX9Tt3
X-Received: by 2002:a05:6a00:451b:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82ce88f5ebemr3756034b3a.13.1775040491867;
        Wed, 01 Apr 2026 03:48:11 -0700 (PDT)
Received: from localhost.localdomain ([27.61.46.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b818sm17010259b3a.6.2026.04.01.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:48:11 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v2 0/2] Add support for Infineon Digital eFuse XDP720
Date: Wed,  1 Apr 2026 16:15:48 +0530
Message-Id: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches add support for Infineon Digital eFuse XDP720.
XDP720 provides accurate system telemetry (V, I, P, T) and
reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav
---
Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260330102345.37065-1-Ashish.Yadav@infineon.com/
- Fix make dt_binding_check issue:
https://patchwork.kernel.org/project/devicetree/patch/20260330102345.37065-2-Ashish.Yadav@infineon.com/
- Address reviews comments for infineon,xdp720.yaml, Kconfig, Makefile and xpe720.c:
https://sashiko.dev/#/patchset/20260330102345.37065-1-Ashish.Yadav%40infineon.com
  It includes fixing of extra space, non-ASCII characters and use spaces
  instead of tabs.
  The xpe720.c driver file update with DIV64_U64_ROUND_CLOSEST() and 
  MODULE_DEVICE_TABLE() as suggested in review comments.
  

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP720
  hwmon:(pmbus/xdp720) Add support for efuse xdp720

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  51 ++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp720.c                  | 123 ++++++++++++++++++
 4 files changed, 184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 drivers/hwmon/pmbus/xdp720.c

-- 
2.39.5

