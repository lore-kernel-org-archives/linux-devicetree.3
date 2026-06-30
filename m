Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C967421EFB
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826166; cv=none; b=dB3wal8G+g888PP4yVy29jKBVioEhZg7v9gcfCofsV2zEImc9Ah2HswBWxS57QAgaSfPpmK/FSeGMn8Ex7FFUUpzY5YGB9md/Q2tDGI0kltLBTqhTLWGG74f3lgv+gT8UpIN/d87sairLVRqXKVmLCC/xRoLEVwRTg41rCrG43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826166; c=relaxed/simple;
	bh=1jYHfBZ5v/zURoZ28SDfcz+g5I/GvgjfuChnVD+R+GY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2xHRj2BrxBY13+f8CEs/VVM/hY1gWDMJpq7PEDur+cSzDEOA+8S/rav3WoJsBtFWNOPQSSpy3PjV580CTkoOH33t0WOtmiVcPYtV9G6+tUOjn6vI13yJHq3UFDyHtn3vOnll5pC7acz8/xbFkDIvg2cSIC3U93UgBAmugPpkRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aveCoyRz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aveCoyRz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4758bd3731bso553358f8f.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826163; x=1783430963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVr02XPdPojhLzYayj+MuNGvSbrZFpz/kS5Ho7Wv8Mo=;
        b=aveCoyRzvZjjaGTe3JidA0yPS8QZV9VnEvzmWTu7yTgJLU6zrP4upITW2QqRmsfn4m
         D8fIyEoD3e+Gh1C8cEJMjg8fU07T8PS9udHBuflc4ZzMJJxPHG2q7KW23H5oglATmif/
         qu3Yko4C1dxS9NSX8352jFx0RxdzELKvz975yZhYbBfiyhEtV3uR8rYmCZI25X3Mjyf6
         fpo5YQ93S9ojSeo2bANxBqyiKngrFomWEwwE2fG0zzb/OsMIcjMPEdYCBxwnkV7/dkEM
         n68Q17oWeRLLbxExDKmoZMOVBuL4gUv+oG8YbicW/m+6252M8of05gxjJ5JwzvPc9N5Q
         w3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826163; x=1783430963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVr02XPdPojhLzYayj+MuNGvSbrZFpz/kS5Ho7Wv8Mo=;
        b=nZtAPXelPnGr7LZ23uXBlcTWUkBafVC4lGAL0cESFXWJtTPidRokN57l3kEkJQtyOK
         eiwk+WzRQkkvLIFmI2gvDL96hjcsfP5E+GQjp7UggjIRseA6+cVigEtIxlKdvKBNKhB7
         p/mwJLuhEA8noPhJ/a2hEon4zt+pzrTkRi9qEVItrJIuRUVPtFmLk/8t4Aeo5itEhHZf
         pfwWDhgi7kJRGn/apVf8fNUp1WfnCINJi0a/GA76zg+/tiG/a0FkoF5+vrEZaBzoX010
         pv4Qopss6EKiNccl3irFX7ZDtK4TM2zD1/AubKvVOmHplnvU1pQYYV6Cl5mR2JqKuoqo
         J1Qw==
X-Forwarded-Encrypted: i=1; AHgh+RrD3CEyvdfUxpzLDzG0JGL0KjtSqpZuoHEM1P/G8RqwfQeJiC4HHuGaoELHlOGcl/afxSc4rLOo40ZC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwp8XHdKYDYuWAc1+YXUE/BKUXBq+e9QddMpGeOXAuNeszeGgG
	qiZQPhPkw8Zm0+DgfhtjKVz4f20Y4+/Er31/TUsjLx/S+XFWnxatgTwm
X-Gm-Gg: AfdE7cmMiY7qdvpbebokU9rWjgXrcERxw+GQpIjwiKuJV0aLlPeGyhp8ugKV1Z+X+Da
	p+7rVt+6OSsAE0kaCgPt5t2/TNfJLY8wMv0SxuWspB9yXmshk4Wb6q017fA0d179GH4dS9VDbdr
	t897GtVvViHGxytQmhdTFaKciD3eecDnUbmo2zXcEkhFJOKM2RCa0My3Yz+lvzO795ltm4j54Wt
	l8iwMTQAv6zwBWcYRiaPdwhnQycdRt2fFDXTmbPY5ILuw6CCDj8z8gf5v0SEEJz9YomzhC+Gc7k
	voyiDhEAJlWbQ0iWDsFZFZdnxVg8y/OA9iYNXZUnim5Sxbf5BWlzSP8hcDp6+IYKN9ZD7wIt8f7
	MqI223FXAwOud/zPtDkaePE7a+72HhbZIGMOgReBp4ffGuPzsZFGp6Xkd3Lq9tYZaytJ7AzdgUK
	AWcQJ5SZKbusUW9g5+up2b0tqCQ7mKZiUJo9Bs9w5X01Z311YPv0syPTne2vEc1zgg
X-Received: by 2002:a05:6000:400d:b0:474:8dbb:ccd0 with SMTP id ffacd0b85a97d-475dfa8909emr2660914f8f.19.1782826163485;
        Tue, 30 Jun 2026 06:29:23 -0700 (PDT)
Received: from localhost.localdomain ([82.77.79.113])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47566743895sm7913706f8f.25.2026.06.30.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:29:23 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH 0/2] dt-bindings: arm: omap: Convert DSP and IVA bindings to DT schema
Date: Tue, 30 Jun 2026 13:28:54 +0000
Message-ID: <20260630132857.3007019-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the Texas Instruments DSP and IVA
Device Tree bindings from text format to DT schema.

These conversions are grouped together because the IVA schema explicitly 
depends on the DSP schema. The DSP is defined as a child node within the
IVA subsystem.

Eduard Bostina (2):
  dt-bindings: arm: omap: Convert DSP to DT schema
  dt-bindings: arm: omap: Convert IVA to DT schema

 .../devicetree/bindings/arm/omap/dsp.txt      | 14 -----
 .../devicetree/bindings/arm/omap/iva.txt      | 19 -------
 .../devicetree/bindings/arm/omap/ti,iva.yaml  | 51 +++++++++++++++++++
 .../bindings/arm/omap/ti,omap3-c64.yaml       | 32 ++++++++++++
 4 files changed, 83 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/dsp.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/iva.txt
 create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,iva.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/omap/ti,omap3-c64.yaml

-- 
2.43.0

