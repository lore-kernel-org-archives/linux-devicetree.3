Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D2496911
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328390; cv=none; b=FLTC7RXEr3KGzthNU2d31QyWQc1p1a5QaaL/QtT6GTE1kqr9itHWV/m7/DCrR1Nj7jqZKkqIg/uG41cbmRtKgcGqiBC5sQn7LEcLtgKTRg/mytdAMppWPR/XgA6Lhb28LpCm8Hr6zLjThg9ilywAL/fHY87V0/vL4QUq5PU06E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328390; c=relaxed/simple;
	bh=84TlhVev8rUK1ncgBVcP95zbFIm9zQfwLG6G6MGA3eU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVAE3qgepDgO0yQF1T0IXPmhf6Ak70vspntgvkFLRa2idHclwkAMNuUDSKjJSaCLxvyQ1FqFM2iVRJ6wkaa60bmmlY37ADpnBvJWlNsBM6CD8eHwxCHMfoDBDzmALMmVHCSBWneLww6XRkZm1irbqoV92q56BZpXgCayD+7X2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/decfxW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/decfxW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso26460995e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783328374; x=1783933174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUZdzN1imA/XO4AzlFsnR4xyfXg3pa9yNdaZHzUuTaA=;
        b=f/decfxW0JVIctIUrAu4OEE4ObYC2lYXww2JJSSHK1hSKckJkBW3A++EVDT2/KuoGT
         NCUdbEGpv3nPXEN4UmfDO90PUAOC0brDZ/5eDA45I3zmlBwfDwrCexjkykGRwNBc14ZN
         ActcAR4PvKENYrrwyttpay3afnUXgIG6dUU0D5mU2GBeERQ73Nq7X8TTtao5bf3EUHJi
         ZlIvob5yTiLo3tUJNNhqL4tc58ISLb5ZbNEdq0o4RRiPQpt4KQhxD23E4JuQY8yFA10e
         s9RWxWfO/+HT7HeII65BsTK6TQNqCi7medRtAvVErBQlCIxUdD140tWlnmbBdqIhPcnS
         +7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328374; x=1783933174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUZdzN1imA/XO4AzlFsnR4xyfXg3pa9yNdaZHzUuTaA=;
        b=MKfJXFWeo+NuqibQmIh/swJQeZHoaM78aA1/fwUKAeXo3QjJ0HyvOMw0KH4TgcX90C
         b/DkxytdNkLKD3kNNpxBVstzwIvc748AMrH265yFAasVEQ2aO0T//SGr+E6IUbdHbWId
         RgfY1WYjOh0XFDKMNpbv712YqErQL5NVxZJMuVT597TX9imQNGRYZFUSuKvXj9lMe5db
         0nyDB+gu04ox9u1Vm/hfUwQNfVJ+RXodlb2h/RfihPE6fnhj+xpE6r5t8fBCRHYeJOke
         rSDm/1OiwiAn4FKhiR4kC2JPRy+ursgX9otvhoMDVlkim8DeH/dKnHlxM5hrIkq0uzts
         /fkw==
X-Forwarded-Encrypted: i=1; AHgh+RqIQtCIFapn6DagCg/+9F8QZw5LBB0n5HAaoOUt7XIbJ17RXmawDGQ1Ak64uDE88OlJLmjz+/2ggViM@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1x0jS2Nwh8Q+u+49TQmUN5c6APBGVAgVQgJxCnMVsmXSC04i
	5GrrhhlVHLTe4UfrXVNzt5ndWjMNRMesOQ641DSJCr3+fqbgt3OyFuHj
X-Gm-Gg: AfdE7cm8ypSqlVs82Z+YPHIKiRJiFhINHIB6unsL1gjUdeyJAFAIcL/JwfhlZf3ktUD
	wcSC4Ww4PwhjGP9yERL6Cpr1S/1L4WQBxidPdlYYUDepNhdpdsx/MxAocnt7aMjsRMVHq9EbtFQ
	4qpbkwluVvvWG/SdqGFWz3IemA7c0/j6Ak43cscd+OK4fyuXp1aXDwj6Wp3XXNyNBXw/2qxFRgo
	5S02cEgqQQ8VAV8u1P1eKTEKdqa9JuFHYAknxCEPXl2RApIGOIVq9EuUulKnKUO/jbRUo7NFCyo
	QZwiskrhPCdeHB/wZcvki31LO0j+Obpo2kCa28PsIlyKwvYyFTSjjZgHWjsjMkbw75CHAWigrXm
	kX+E08mf6cL9TLzKFByw7y3ptGfTmNRarOfrImr2BjE1yecH1OUmGuLRDBeNR/1nE4PfkU/enhI
	sa1er03km4lMO2oIGqHFpklzPEG52kmZfYNQ1v2NcX1w+nJkrwkmmCYbA=
X-Received: by 2002:a05:600c:3f16:b0:493:be36:94b3 with SMTP id 5b1f17b1804b1-493d11d9d5emr108665125e9.13.1783328373537;
        Mon, 06 Jul 2026 01:59:33 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm22314373f8f.23.2026.07.06.01.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:59:33 -0700 (PDT)
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
Subject: [PATCH v2 0/5] dt-bindings: soc: ti: Convert OMAP DSP and IVA to DT schema
Date: Mon,  6 Jul 2026 08:59:12 +0000
Message-ID: <20260706085917.835875-1-egbostina@gmail.com>
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

Changes in v2:
- Expanded from a 2 patch to a 5 patch series.
- Moved both the DSP and IVA binding files from bindings/arm/omap/ 
  to bindings/soc/ti/
- Patches 1 and 3: 1:1 conversions of the old txt files.
- Patches 2 and 4: Make 'ti,hwmods' optional to fix dtbs_check warnings. 
  Reasoning described in the commit messages.
- Patch 5: Documents the DSP child node in the IVA schema to fix 
  dtbs_check warnings. Reasoning described in the commit message.

Eduard Bostina (5):
  dt-bindings: soc: ti: Convert DSP to DT schema
  dt-bindings: soc: ti: omap-dsp: Make ti,hwmods optional
  dt-bindings: soc: ti: Convert IVA to DT schema
  dt-bindings: soc: ti: omap-iva: Make ti,hwmods optional
  dt-bindings: soc: ti: omap-iva: Document DSP child node

 .../devicetree/bindings/arm/omap/dsp.txt      | 14 ------
 .../devicetree/bindings/arm/omap/iva.txt      | 19 --------
 .../devicetree/bindings/soc/ti/ti,iva.yaml    | 48 +++++++++++++++++++
 .../bindings/soc/ti/ti,omap3-c64.yaml         | 31 ++++++++++++
 4 files changed, 79 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/dsp.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/iva.txt
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml

-- 
2.43.0

