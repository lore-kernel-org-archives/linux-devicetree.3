Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C6380FD3
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710208; cv=none; b=S2cVxs3Z1L8P6CsvKiUo3E2zBJcKVFgz1mIDdJ/zje3HjFDS/whHM59R9udf4/ty00g1eXu+2jEkrT0OYBm7wpUbLHepmVDpTnLfN3XG9daZVPK9e7G2AHiM8sG4U1aZo8diB+OziOE2MvrKO9botsAENERPBbT6hodnTUsmzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710208; c=relaxed/simple;
	bh=dcqC/R6KKT/sQfJIFw2LiQyMk+5YWArPLJR/2wCqPRA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a1u63SuGQwkN9eJm6Nw+bLhbQpi6pYuSqzZ709+Zj/FA6+8VvLZ0LnygPSXYkxnLHBEP+PUTRxiW3o1OlfDsUbTTrl3IQJgf4Ev5JSXr6QhOwDck2Dwchk0JGRK0LELP6WwbuVxJG+jmj53hMftDyuC08yccn77XVLHzF4TMy4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fohw24hc; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fohw24hc"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32be7127c64so514486eec.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790710206; x=1791315006; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8NtU6ZgB5rVnB2TieQI+YlMezMRHZXxmu9/97X08t/8=;
        b=Fohw24hc2TW53G7PfmQZ75qoNqEGDCmAACYcpgcT8T/pXTLi8wmFjjSMIF1nFb6T19
         lAmwoxUYxrUzWipoJivsl4LXO4mZ6HAouAb+qYjP0EEY4BIhcP4UD2/b4RYwR5cLlS69
         Bzci079u73stV648rNVEIqfK+0W7ByjQBxurLjascSyL9IIDgLQqDGBT6MAnl3RP34Cw
         nKqNepjjIUD48TITIkEsY5DGq4e//Uq/J399TLkmK56GyoUhz4aTxWXwmOxYCemVUBLP
         Y7cjjyAUS17bmywBor0pxF4ho0Zr5BgC2U4EzvHisRUUmLo/avEi68hwREn+BdK2O0dw
         E/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710206; x=1791315006;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NtU6ZgB5rVnB2TieQI+YlMezMRHZXxmu9/97X08t/8=;
        b=xWDKWkxZR55SrXejAWBFXsJuXByUTbiOr/MFK573xC4VrOJ4KR3y7LpIdpH77BgZ09
         O1qCuvYGulQL1jEvIEEPKkQiTs97cJxsCc7Bnk5tmlQJwmbgd/v3g8dmIoVW482DmIog
         jTJgYa1GjZ/xt6+O8R5JpCbbYSc9YCdWHmHsL7NYNq2oVoB4xvnyx9ka6ms/lv5joUMe
         aNNtKOhrNxZJz79UPdCbHSaXl1QEiMIdQyz/rA6ZAvQxQzfy7qYz3AaozIQLX/1Lhnz3
         u9sotbTUw2Z1XyWp61SkDbegjBz1LZmKRS+JZ0Cf1H4Qlxn0sTAe1EjywOjLMD3hP4TF
         2wjg==
X-Forwarded-Encrypted: i=1; AKwUvBxQP4pqAtSvZUNIX3wiJtQcxvH5v/vYkgMHSPWEKVsEL3j+EmOgrr7qSbMu4bnEOEfwO28vg05hFYjm@vger.kernel.org
X-Gm-Message-State: AFq9FYI2FKxD2To48ilBSyFvmnPTf6eQVvB2/Xo3XaL+kiTEJqY9j8tc
	ki6Ki2MXext7GjHe0ISpLeke5fMcqdbt3Ga6uyeU6E0dSs6KGhDfVLLg
X-Gm-Gg: AYBFou0bstLP4bVvRcAHjav0DPvDVK+mZrIsx5rAxKKXGKACvaXaIeqTsPvvTxqm/Tq
	aysqoiX5r0DhPQ6SPecEpZg6oxXHMq/prpJRc8x6a+uq4Jrxr5/02q8AjwANfSe9RkUzLfFq1kP
	77QmhqBNxJXYZFL93Vd4xRb9tM6XgeFdkRPITwhcAERZYH/wg4xBsNiCka4L7fdvGTKK6p2NNA/
	/lspkxCrlX5fg0H9tzRlp1hnafKZcKTlWupvvfhCqnH1k+/gvz/XXWhUtoT4COoyfJaUZIML6xs
	Y/Z4ev8v4jaFQwaYkDaaR3hef9Y6mr7R7rCRYMYD2yQIX4zqU+wLchTEo5PSxUVl5EAfkUQI/5R
	pHpKVDiAVidaqOmAs40y5EsG3QJHoLUC3tzAuXcIJxbeM5khT9RYCeO99JYeORoKhev8BF0kAoo
	LNrUdjc1A92Pof+zdU0R586jZcX/6Z1ZZXybhOlK0cLY5/4YdR1TH0AOfRZESLmIcPcbuW/u+sP
	HVpAUo5Hg==
X-Received: by 2002:a05:7301:4d12:b0:34c:3ae5:ebc with SMTP id 5a478bee46e88-34c6128bdf6mr606357eec.0.1790710206173;
        Tue, 29 Sep 2026 12:30:06 -0700 (PDT)
Received: from [10.211.86.252] ([2409:40c2:5054:69f0:5c6b:5195:5b7b:d414])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm1275349eec.16.2026.09.29.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:30:05 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v5 0/2] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Wed, 30 Sep 2026 00:59:41 +0530
Message-Id: <20260930-ti-tps6586x-v5-0-aac0273b5da3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13NQQ6CMBCF4auYrq1hpsNQXHkP44KWVmtUDEWiM
 dxdqjGCy5fM989TRNcGF8V68RSt60MMzWUc+XIh7KG67J0M9bgFZsiZRpBdkN01cq75Lk1OrgC
 AEgorRnFtnQ/3d227++x4M0dnu5RIF4cQu6Z9vN/1kO6+ZZyVe5AgS2UNsVFosNjsz1U4rWxzF
 qnc48+WwHOLMpMe0PraGyK2/1ZNbTm3arSs6hop88Sa/i1NLNLcUrK2qLQ32jDx1A7D8ALJkTC
 1bAEAAA==
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790710190; l=2057;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=dcqC/R6KKT/sQfJIFw2LiQyMk+5YWArPLJR/2wCqPRA=;
 b=ilhdseio2iTuo0yviwOatf83AM0VBGpCAYeK5Hkt5ozS9PWnQcn/FQ38a6gjWl/sMMFJAv/so
 Qrz5Kae571TCPLKx5GN5PNmAJHRi2pb4fjqXH7eqQom3wILB2QDreKA
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series adds a shared DT schema for Tegra regulator coupling, 
updates relevant PMICs to use it, and converts the TI TPS6586x 
bindings to DT schema.

Summary:
- Patch 1: Fixes existing TPS65910 validation warnings.
- Patch 2: Converts Tegra regulator coupling to DT schema.
- Patch 3: Updates Tegra-related PMICs to reference the new schema.
- Patch 4: Converts TI TPS6586x to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v5:
- Dropped example from nvidia,tegra-regulators-coupling binding.
- Link to v4: https://lore.kernel.org/r/20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com

Changes in v4:
- Dropped applied patches 1 and 4
- Rebased to broonie-regulator/for-7.4 to resolve conflicts
- Link to v3: https://lore.kernel.org/r/20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com

Changes in v3:
- Patch 2: Add '>' to description
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com

Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (2):
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       | 12 +++-
 .../regulator/maxim,max77620-regulator.yaml        |  5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt | 65 ----------------------
 .../nvidia,tegra-regulators-coupling.yaml          | 38 +++++++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
 5 files changed, 52 insertions(+), 69 deletions(-)
---
base-commit: 05a3330f490cfa266831c0fc7f8c6df942866d59
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

