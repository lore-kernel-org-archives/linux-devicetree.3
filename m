Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205AF2BDC05
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 06:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764939; cv=none; b=IpS1e24ifSqetO2VRKYICtoi7mw0N+g7aNtUDm8VIJ/axZAf4dsPSOv37cvZKPI0ykw8bWlzNOi8difvdgSKSomsU5AqVnBNMLXikd1h5vnWHlLwwBxwtJU0mAQgMZ2daMECdv7qKdBVFHuA1yF14WWQW/+lcfXLdyhkWrtLS+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764939; c=relaxed/simple;
	bh=tLCX5T/5BD+D5hhrc5IQpY464+LnQSj92xbe4tJBm+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjaHeZ7yENIUTbXg5wNzESZwbzmlsOJIq2EGLeVJlRWIj+7QWIUyyDkAfdQ4H7L2CwlxnWlDaw/15BVoW7gg5XgTBC5vfWJnh4pJ389ZsDDOLx1qUFXNmMOuFqHuewVS9FBkeMHCdDbgKDdO1lz5vjURBruuhNgF+/wsZdI8Eo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a24G1ZOX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a24G1ZOX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1653978b3a.2
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 23:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764937; x=1775369737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpxvjrCfKfWKOT/ha83hU/ESLCv8PWJ47jL6ccG2o9A=;
        b=a24G1ZOXgYDETqrQfPOkz/XkTO9l7DT22yrEtVj6ar8rE9XHLMY5ZuXDiUaAhSeRKW
         g3T9A7a2SOKQDQHsZ9rUL4b78zgqWqNjf5QNUoXfGP0dCj6k8EilnOMMawh+lPQmMxW5
         GINVVHixO0PSTZBmYQ2h9AN+N8whiyN9kvPG0dNWuD9X+Z+JNVLQz1Vhq+17QjHAZOjL
         zM7X96i3WUsNmv4S57a3xCTVfHENFsXjOZwFmNKsl+mbkeUE8BJG66B6tcnqQLmHYcQr
         IveRTsnZjo/DOB29nhVipmurGS7jJWRCnYWZvT+3ZtMDxD7Mq6zNR3UhQ+a4b4zK8WjN
         yZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764937; x=1775369737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpxvjrCfKfWKOT/ha83hU/ESLCv8PWJ47jL6ccG2o9A=;
        b=AeLHcg1t9xWNehZwT8MCBCc1L4eMdJ7E8nCA+UMotrRnFLagDFetUsY6jEBsb4jBM7
         HAB9s6Aw9b4zqKUhV4Q1bxNK08U5tBuFChsZHE40S/EViKsDVaJnM7nJJJ98dw1hesnS
         enEYMKCeaYdkevZmPCY8MIkjFAJEgVjVPlzGTJNDICJ9imqWNSJscMhUjZVL1YBqiKOa
         FTMcccQhnXcZ1pn2OiJ9VJkb0ZYh7aibyKgEGw56aswFcS9ZaJ28pvTeAaHpnF9+v+be
         4W1etPX/Vno5JL3ly7ondO1omsBNtRIf3wiThuAiIWZSB93Wv+kS7R5qk0No6yl6C8Bn
         ReuA==
X-Forwarded-Encrypted: i=1; AJvYcCW2kVkeKhBezjeKRWdGt7UV8tfqFWIfp4IZpMjSpocRMc2JI11Vb/h6X91FFLgeKsJrxRryFMPo/+zF@vger.kernel.org
X-Gm-Message-State: AOJu0YwoK899I4ithtK2Z/Ug1LTvINzQyBEJtmlIJ7bxCIYsrsBALk/B
	rMbPp+sXjkwmVCMBOl+uiRtYGsnbcKsaJmP2zbs+CUMGYoG0rCyqUfGN
X-Gm-Gg: ATEYQzwn5IrQYJcbfQIo1uW2bthQuFrJKhILoGP4GhGqyBxbQzwYfmHoXwOQg9I2Pde
	oJs0CnxzI16OX/5qwidgSp56B5JPlJZ2ofXGQ/J9wARWLPdQ7FN1uXjPHLvOmJ56KDrhYl6lvqL
	nttqgX4agxuChgunOzLXvFnBuXnVLUMvnPrDXsbr++ZrmqoEx7rVAV/6ICcKgbNKOKRkGevBZ2O
	uyhYZ9wT9Y9nfRX/cfLWL1dmAZTEeXT2odKh/sLpCy73MwIprfU1cVhG+wQnjgjaj4Qljd3hSKn
	thhN6tnEhzqjQUnE5BwQFGb33cXCkGu5b0EmgD1cPmKZylB40uGZWYXSJwxX1H+bmpAPXrORVGC
	6+R3IvMZaaY5Xc/QhNQMx+ySs3R/v0BzLNLAa71x03FJ6si1kiElgXhqJlZ1NBuSwUQFZOVNfeE
	a/d+M43bW3IDNZ3wd/YCwMM2PBJNbax/2bm3irRmiUT5WXt9txEYTEfWTtlrFelixF1w+cFGDfk
	lpORngO4BNohw==
X-Received: by 2002:a05:6a00:3e16:b0:823:b1f:892e with SMTP id d2e1a72fcca58-82c9607f5b1mr7817427b3a.43.1774764937194;
        Sat, 28 Mar 2026 23:15:37 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:36 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 11:45:18 +0530
Message-ID: <20260329061523.98346-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and corrects the thermal_flags property in spear13xx.dtsi to
st,thermal-flags.

Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: rename thermal_flags to st,thermal-flags

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
 3 files changed, 37 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0

