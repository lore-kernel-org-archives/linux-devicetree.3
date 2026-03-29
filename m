Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA936B05F
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787704; cv=none; b=DyEThSHo1k25/PlL0sSz8CkQuNzdzJ2t4Ahkqy9BUQTcCxPBF15YhlE6unizMj7y6tv8h/MTZqV3wc8kqHNFehZGGNhllKbTBDqCGLYWFxx4JLxhA8vs6nvup4IDD9yD8OB1zGWEPNLPBFuF74AZIcqsxjpzEbAqtQ9uhM4ObKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787704; c=relaxed/simple;
	bh=oitH4XdOfl+jmDNpdoZa/ejnZrlCgKiTDVXgtFcA4oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYu/p3LohLlpUs9ArAtib8J/ki+MEYr+GdGkpdehKMIyetluPM2yeG9TW5EIWn9mVu4ESDLsG3mbO2rr/Ac4e7O2MzZ9GXWgqprJx7hqx7Y6izukkt0mtg4wxi72AGP8SEPTBK0UK2PKobqcbTgMWNg+BxAAkcXRZEwN7DxzIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKK0nmdm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKK0nmdm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3591cc98871so1534089a91.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787703; x=1775392503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09DmEJZvX6q03iOvlAg7HJKVIb4nx37LesonFOCNgHw=;
        b=nKK0nmdmWDNc72bm+hEEBZMsmJfOi5D2/PqXphxWRLUTromYCXM0pXzsrocrVjS0Yo
         ujsBVpSTS0LcRsNcAfxOEfKkXnmlRnlSiNkOxWMPJ+gv2xUQBcBbybhEfySvPHNnwulE
         o3PpfTTvlDG0hWiOppIs5e8OdAOhj3hvRYIPGs9oNy3EwJSSvza6lT4p3a2rPch/zgRp
         3yta/IH2K0hM3nO6OutEkzepWBK0EkYga+azTmepNuefNjPiXSorsTsxrWOUXwVv8oFp
         VJi9Tn2sStjSmHXaG4WvZlN3ZnQiV9PfDbobV+I/XXNNmkoM2vTB4gZ9ish311YRR6D9
         AiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787703; x=1775392503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09DmEJZvX6q03iOvlAg7HJKVIb4nx37LesonFOCNgHw=;
        b=cKiyhRYhwBDxf6UELELiMfgPcr0bFc4QEdlQidxlaPGLvz275cKCaCBPfYw7/IRUUd
         RVeNE+dA/DyyfnZ5MR6l3+fH4p3ne8m6RjtDIebWJGP6vaHWVPw60DHeokpnCddnxUAe
         8rXCfY1UmgSeQPvHjSj75ZK09rXutOg5fkP78X1TxL3HgzjMCdcYKV71LpKV4p+CPNmg
         pSCX2ag/+xkVlO/lOVqDxCAyjRrTz4mPdDn/kwTrsAT0PNUfat+ce+Kc/57SaIfDwdvQ
         0sElrhTBt4sPOUm2PXttrUlVvUKOm1pMgb87QCazKBuxCb+QAuuIrkawqypn9YTpPJKP
         zGUg==
X-Forwarded-Encrypted: i=1; AJvYcCUjcvdj+I/9B8olmonR8eWBKPPccmaYJBGRmLrEnJu6llW+5hCq0uYnN5KaEF94xn/pA1qoxpO3bgAP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5UgGxlg+g6SdXsr1xGiC9aFkbvA7fiJDCXPO8jERlx51FIBQ/
	NNRGEH/mukq4IAgh5UrttdhxEXZJxfWSJRDguXPtOgPn9tTEtf0Y9pXA
X-Gm-Gg: ATEYQzwjZ4YggEcRq6Pcw3ohWwL/bHm8dRKkAJqGU7cfZWSFGjKKlkqm5HWFLdOqF/C
	eddvG7uKMYB05dfDL24fBGMqZueGk/UO9Oz4Xq2XXN3WpmH7EGUymNXuel8xITW15v8KWZHCDVg
	jGkdC4UGJaXDAXjRyge8iHJiHr/pAdwYa4P6n2gbCk8Ml8jfMYT9zcXwNvxSuvkNV54xNw2InYs
	tr8YqRgORv3yZzPlT9db3UiOitejWvFXKsDcR8lR4eTIaj+LmBHlIOFtysL8mpY2HwAonXUfCZr
	oJ1ZcDQF0HFJp+v6s+NWZTnFrZs7NP3s3/a2K1qkbVL9zCuk5YTy9x39FW85zUKxa1bA/KrkpaC
	O0k9OYyir49568jIRn7IDdvOfIdPngE2Av40ZYuiqmdsT9v6RN9oyAJneVIV+auoV1c3remCd5r
	0+Zcj82F/lyL/KRJAvaypK/FI1zHjrs6ge/eryi2B1SScHe7b4deLJM1kMoEdHBlVIk81CSruFB
	50=
X-Received: by 2002:a17:902:e54f:b0:2b0:6df2:8cd2 with SMTP id d9443c01a7336-2b0cdc239a3mr94457085ad.19.1774787702960;
        Sun, 29 Mar 2026 05:35:02 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:02 -0700 (PDT)
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
Subject: [PATCH v3 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 18:04:42 +0530
Message-ID: <20260329123449.309814-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and removes the thermal_flags property from spear13xx.dtsi.

Changes since v2:
- Reword the commit message and subject to correct explanation in patch 2
- No changes in patch 1
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: remove undocumented thermal_flags property

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  1 -
 3 files changed, 36 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0

