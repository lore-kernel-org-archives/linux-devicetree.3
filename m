Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0803E0C5D;
	Tue, 14 Apr 2026 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167127; cv=none; b=Um1hrUZyW7nnshjmeCvHaN/qNxhHDuze6FOYkstybpz6sUJM6oCglVRVrd0PK6chY123R4ZSKePWd7lgcOgYQzUosTWIVpHUtJmkmPz7J51PEwGX0lA5B0pDt6DYiHW7GSOmhCPpJ6V89CkkRxjnbPFMOniJsA3x5CLkrDs4MXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167127; c=relaxed/simple;
	bh=aI+GsF4qLZxdAdL4+6dfOIL7e+YBWTxqXJ+gFC9fnX0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mPzO+I1yiR0ouHvTtNqruEpZTZhgDW5kkmbg6LPgI/ImAmhpDo2LDfJVyCTvo5jbVCiGn/Gr2wXkPIMVSjH+W9eJ5AwiaRk5FVofVr1KZfyl2nXde1iBT159GQtwqPlLHTOuDoFIZXp6vXY0F8qj6X6b8vl4t1JPwMpshcOadZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a3Ww08EN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a3Ww08EN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776167124;
	bh=aI+GsF4qLZxdAdL4+6dfOIL7e+YBWTxqXJ+gFC9fnX0=;
	h=From:Subject:Date:To:Cc:From;
	b=a3Ww08EN2FtM/L76S/PV5DUWhAUDxQKM1HZ19P2dsn7sC8tqFMLSFDAjwhhP4DSlB
	 BsM80pbeLSCFHNSAzXpXye3/A01brdEaZPAozqjOOVEo6cAZJ7uQrKAyO1OlsYNKcf
	 XoJ+zlkZ7N4wD0n9JHqJA+NzIF7YE2JbTQn7Gp/vR580bDLidO2VvpKKm4LYTBpHHv
	 oNRWcz2kJtAtLRuCms9KXYyqbsFcybUFsAP/16vLrEq5PgIV0t12Fl5a8k8MBWzJ9b
	 2ojnWFsd7yyW11xzqNC54OctYlC/sqLIxSC2bpipDtzVxsgMtt5r1GFFJLYtmzr8nH
	 vi1zezhZ2hnPA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0904D17E12E5;
	Tue, 14 Apr 2026 13:45:22 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] Mediatek Genio 1200-EVK: MT6315/MT6360 PMIC regulator
 supply cleanup
Date: Tue, 14 Apr 2026 13:44:09 +0200
Message-Id: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wrDIBBEf0X2uQtqLpT8SsmD2m26tBqrJgRC/
 r3SdN7OwJzZIVNiyjCIHRKtnHkOFdRFgHuaMBHyvTJoqXvZqgZ9eeGktJQYPTt0bzJhidjXtI2
 9drbTUMcx0YO3n/g2npzos1R/OUuwJhO62Xsugwi0Ffx/SBiP4wsNoZI5mQAAAA==
X-Change-ID: 20260413-mtk-g1200-pmic-cleanup-666643b85b52
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776167122; l=1472;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=aI+GsF4qLZxdAdL4+6dfOIL7e+YBWTxqXJ+gFC9fnX0=;
 b=+Q4SR4LvyWtlRcvDWXR3m1Kwm9b2GQ/qVx5JIaActwhspyeGtCkrRFh9fmrQY+6FY0stzqrzF
 CtyJwFU+4oMAcDTfHBOPmAuR0Q1X+KySbiFCbym0eOxXoUupL5ZZ/np
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

This series goal is to cleanup the power supplies of MT6315 and MT6360
PMIC regulators, that are either missing or incorrect in the Mediatek
Genio 1200-EVK board devicetree.

Patch 1 completes the MT6360 dt-bindings by adding the missing power
supply descriptions for its buck regulators, that already handled by
the mt6360 regulator driver.
Patch 2 adds for the board the MT6315 regulator supply properties, that
were added in the dt-bindings by [1].
Patch 3 adds for the board the MT6360 regulator supply properties and
fixes the existing one.

The series has been tested on Genio 1200-EVK board with a kernel based
on linux-next (tag: next-20260410).

[1]: https://lore.kernel.org/linux-mediatek/20260326081050.1115201-1-wenst@chromium.org/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      regulator: dt-bindings: mt6360: add buck regulator supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6315 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: add MT6360 PMIC supplies

 .../bindings/regulator/mt6360-regulator.yaml       |  4 +++
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     | 32 +++++++++++++++++++++-
 2 files changed, 35 insertions(+), 1 deletion(-)
---
base-commit: f244905cd8cff7a7249cd3dac8a366e02d61ad4f
change-id: 20260413-mtk-g1200-pmic-cleanup-666643b85b52

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

