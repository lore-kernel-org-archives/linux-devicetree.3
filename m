Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8733120E;
	Wed,  1 Jul 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918864; cv=none; b=MpsYPq7DwH/gebBJpSK0XvCMw1eh60l8PCPL0xn/vYrw6v3PTDfvrlJ82vemSnBa6pj9/sb9xqp/fLlVRo5nUzE/IpLUbVMAwEq1w2v7KBTOplf/z9adfoZVgWsUGNPrBUC62Gl/iJk6h5M5bxcEMUigHLsX1EhLc9LnE+eoBHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918864; c=relaxed/simple;
	bh=RtmejQkvm77nZpvuKQD7/tDw888Rv3+bfUSpMvP01H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dUTyGnWkESiOvXuuo/Z4clXd6cLeeyqaFgCWOquyeBDC4kM+9ATpXtdTuOkVXe5x+kGLO6amPW+WE/hsT0vUJqZoaf2b14UIEofeIjcLNQJ3yoUyO2p83prIfpgcx976PG/WispQOECHpMuJ2dfvTTRA4DbR85rgVTxR/yP3ML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mAYEfh87; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mAYEfh87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782918861;
	bh=RtmejQkvm77nZpvuKQD7/tDw888Rv3+bfUSpMvP01H4=;
	h=From:Date:Subject:To:Cc:From;
	b=mAYEfh87h39cWihtQLd4t5D0dkhlKEiPSZvVZWkm8e9+C6YKdLg9ifNsNNp/7I5GY
	 rIuvr3tIZGjtM7P/pSn695/T8bLMZskI84dri9DUKh7jDIFbGiY2rdhpsUsWlUnvKF
	 UbPhsuGswyrpKaBbnWQeQc/QqYed5VVxZFkVteck5qtQSEYES2yj8xwgFhK+qZIYhr
	 F1kz2ioysxxnleMfu7sAiuzyFnZ3xAfFh3lG+7yzQgNqvlaVDEln/aevogxGw69O6G
	 17Xnc6kSnKiil0KiTEnccsT+njtH+5KhEnM4VAMrAWqTPc7wUbVnbeBvP/Hv615BAs
	 SobxzqKJHx2Vw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0596C17E0432;
	Wed,  1 Jul 2026 17:14:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 17:14:06 +0200
Subject: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for
 MT8189 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mt8189-dt-bindings-scpsys-v1-1-2c04f0fda1b7@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBBFr0Jm7SRtjRW4imFR2hFn0YKdajCEu
 9vA8v3kv7eBUGYS6JsNMn1ZeE4V9KUB/3JpIuRQGYwyVt2Vxlha3XYYCo6cAqdJUPwiP0GlfWe
 1ct7fDNT/kunJ6+F+DCdnen9qopwjjE4I/Rwjl75JtBY8MvaqYNj3PzO62gOcAAAA
X-Change-ID: 20260701-mt8189-dt-bindings-scpsys-01c9610acc52
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782918860; l=1288;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=RtmejQkvm77nZpvuKQD7/tDw888Rv3+bfUSpMvP01H4=;
 b=iaoJytQ5vltimAwnK0uYMl0TOHTHipFnUZtH8mPRD7vkkzeBXWB4ZnjSEd3CEDggAodHHZ96F
 XyR6eIIUbrpCh+xO1SsD2gRuM2GeQMyHEdeIrTcvbsLEiGNwYP72Ye7
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add a compatible string for the scpsys block found in the MediaTek
MT8189 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
The patch is based on linux-next tree (tag: next-20260630) and has
been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
boards with board hardware enablement patch series.
---
 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 4cafa381979b..9f073d0c28ef 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt8183-scpsys
           - mediatek,mt8186-scpsys
           - mediatek,mt8188-scpsys
+          - mediatek,mt8189-scpsys
           - mediatek,mt8192-scpsys
           - mediatek,mt8195-scpsys
           - mediatek,mt8365-scpsys

---
base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
change-id: 20260701-mt8189-dt-bindings-scpsys-01c9610acc52

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

