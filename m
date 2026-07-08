Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D145438499
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509564; cv=none; b=S+6M2bxHufQrBGTALT9vFmE+44dGNLkO7lb5Un5oUy5b5hmPy8iw4PTG97wi98HX87uErXzgzhEsFsxhxr0OJ6LjefmkurMDsuRlJgM/XK6WnZW3HqU+TvBeOIEjkrU276MdPy1IJC9yCgiSl9soFrHPGD2aR3ie9Bbh4cMzV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509564; c=relaxed/simple;
	bh=bVs8vvXAk06NESwJAGj2nDbLFhCI9UKvp1g8bziL5d8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5hmTlUumV+lFore45ie1Jc2Q9lLM7Zi8Z7ZjQEcAuXaC1QpcK8zhNYM31F4GiN4BycpCWkF1HfDkJoJev7yY4/6jXA0ScroMFMC8thRG++T5wYy9OEqWx2ac0kzHfHdmnzreNB1LYf3xF/QuHIF42w4B06ulbfMjG6LezPDiRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/OOl5u5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/OOl5u5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b7612475so4404035e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783509562; x=1784114362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5sUDEdVIujH2k7fD/j+kryWcMPsCcrFZC9kfowgBjk=;
        b=T/OOl5u5Eua9u619CQZAPb41gSbVSzVA5nslHq6CArnqg+k3SwUf7Pq5Kbs9xnmKO9
         hDX/cmVBZvunez4BIZVADKDdo2YG9PsHAHjT0QTIZsUHhrS+IXt7R/mf2UYHIuS7vCcH
         R5yINjHiiqtrGWewkBZdVO9HWQf7gozvSB9PaH5nqNzbxmT/IAtDU6fi8gr6WQNPuEpj
         0O57EnhM95Ap5C10HXpxA76SlwWBt+twOkF1rvv642ntmFuAc5V9IRVl9ITD14sn511w
         LqiCyBziGvFbiLOq/cuNTND5Y8A7DAG/UMBwO+/itXAlMirKSncCb0cDbfjCIQk/x4dc
         D8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509562; x=1784114362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5sUDEdVIujH2k7fD/j+kryWcMPsCcrFZC9kfowgBjk=;
        b=MpKZKE4ACvJxhZdP9vUqGR95f/BRosvxS9wedHLoYyIP+5HvPLdx1hqWrKl5rY/maA
         bRuyj73NpkawQExUTfXKs4FdAXUdVKPpPFVrs7xesIQQhqX45CkSxvk3uwAxu71IGBvy
         u/pTmxtI3fn0s39CiWqM5AqFRvqTQ6JocY7E+uLrQB77jwsgJnb8lf7Sj3GoVJPUeh9G
         bP0DG8BJhUFCJPHh9rqFRPSAjQ/KiGiHX8pFRpfi2mJblR9Ut9dedB/EZXZIA7cmVwB1
         Ohwvlw7uC95lxVkMrEJvg33RfviQf+VKFy7DZJiuwCFD0OQxql4Bs5DaVQqEGIrS9f0T
         rxKA==
X-Forwarded-Encrypted: i=1; AHgh+RooJ4bjGwjHkWLTtzCLW8VsfjXVGoCdjaT68nSCZbPGOxtQlrDjTvftVG8vf9zcQus/uLcfCEAg1Csv@vger.kernel.org
X-Gm-Message-State: AOJu0YxttCn38vbuW3uejOHkMx5GnzGiixUncurZzh81EmE/oni93y+b
	lpovdVsh54Ge5NMAyAlGGpt8F/e9k6fJewx7uux2n/cgzLUW+E47dyLy
X-Gm-Gg: AfdE7cn4jnl2NcB0RJ7RMgQTg5IN/8BrIwVCR0Gu/s25yf8yG0T9Iu78iwJoDvtWndX
	BotwrgTCtZtkLwt+SlsBnjvI6gCWHHhbmbAQZQyCOJJzqtsHgAM1PNS01glN7PF9Dal84oZUO/u
	L8WUy+onRr1jB3bIOlbkDxSEcNZ47VNIQQdm1DHMoRNg+sfNk9y1afnF3H6B65ZXgwlor+edCAI
	6FjqZnTvGJveyvswGOCsq8MdbbRS2OowynJQzYF1wjfB63ULjerFFAOPhklPHB6nAXq1MHY3V/f
	ep9UWVn+rp+QXCbz++zZzIoAYKL5eXAkDDVhMFVbVTIbNCNupaDW27zP8rsissLUUw5hw9va3Ct
	UBZUUpocrz2Wc8ju4mmLP0fDveDIrNozjl1Rzh7xCDji2CNMxOrorMrN4bMd0GdRK3r+zSuhOYS
	b5FacpHVYb9PIn7ZEN1GIaHQLv70E3AdeZ+FT9ecvwLDHujIsloEiTQwQ=
X-Received: by 2002:a05:600c:c4a1:b0:493:cbdc:7cd6 with SMTP id 5b1f17b1804b1-493e683c48emr21608295e9.7.1783509561495;
        Wed, 08 Jul 2026 04:19:21 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6e4csm39216602f8f.10.2026.07.08.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:19:21 -0700 (PDT)
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
Subject: [PATCH v3 0/2] dt-bindings: soc: ti: Convert OMAP DSP and IVA to DT schema
Date: Wed,  8 Jul 2026 11:19:12 +0000
Message-ID: <20260708111914.1706800-1-egbostina@gmail.com>
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

Changes in v3:
- Squashed the 5-patch series back down to 2 patches
- IVA schema: Added an 'allOf' block to make 'ti,hwmods' conditionally 
  required. It is required for older platforms (ti,iva1, ti,iva2.1,
  ti,iva2.2), but left optional for the ti-sysc architecture (ti,ivahd).

Changes in v2:
- Expanded from a 2 patch to a 5 patch series.
- Moved both the DSP and IVA binding files from bindings/arm/omap/ 
  to bindings/soc/ti/
- Patches 1 and 3: 1:1 conversions of the old txt files.
- Patches 2 and 4: Make 'ti,hwmods' optional to fix dtbs_check warnings. 
- Patch 5: Documents the DSP child node in the IVA schema to fix 
  dtbs_check warnings.

Eduard Bostina (2):
  dt-bindings: soc: ti: Convert DSP to DT schema
  dt-bindings: soc: ti: Convert IVA to DT schema

 .../devicetree/bindings/arm/omap/dsp.txt      | 14 -----
 .../devicetree/bindings/arm/omap/iva.txt      | 19 ------
 .../devicetree/bindings/soc/ti/ti,iva.yaml    | 61 +++++++++++++++++++
 .../bindings/soc/ti/ti,omap3-c64.yaml         | 31 ++++++++++
 4 files changed, 92 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/dsp.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/iva.txt
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,iva.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml

-- 
2.43.0

