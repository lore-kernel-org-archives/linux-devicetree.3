Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A34406812;
	Thu,  9 Jul 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591586; cv=none; b=fqXqD98ILFzHJclXQkFk7F1dp44DlaGBzFGTyFj9JFuDF7oc5UKe6NNXCCbcoQNkBIH836INKpoQUnaC9tdftH/eZZdF3/RNdMuBhtBwd3vP2F8GrE3jmJyd6e/2twR2P+tMs1roTWV1u/xw0H/TthN4IqVsYzeVwwac1Bb5ork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591586; c=relaxed/simple;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFg+JSRXBzwQLUkX6WvmHOuI7tmFgJeRXERDls3zzZo3ew6JTM9eExShyZqOPHzdm6TkU/hKJ6o1qZH+DGA/4g63/AuVvNcuQPL0I+VgiIeAM+y5sPttWItcKxD0nHCcLqUXbVp+PTk0w4+/ZqD84xQ56g0IHz5yVtsILWLfsfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dmtanCfL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dmtanCfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783591582;
	bh=o0Yw5UvJ7mIldIg8Qe+QDn/C3b8GslyK/JoVs7xCZ6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dmtanCfLju6ifSgcwKO6UemMfKqFnsb7fpAdDEDUJbMmPnnmtR0lL2NpRYKTGeUEq
	 NszejrSKm4qjdytNmCKFxUORVbqaNn2n65quw5nf5aKOEKBtEGWPz0VYpjBroBaWRg
	 az4brN2yUOzMQLe5Kg+Pe17+Aki6mKwiCT05NoU2YICo6Iiw821S8VZxI49qC/MeEu
	 M4MfD9gcwICNolIr3JYoa0UKqITNwoT3p6LNyas5rw0bgVN5bpX9w+JGkoE/8YaiVn
	 tJJC+34e78n4NGKnt6LB/hy8jzbSrxHLlVRo9Ul4QENgxncgmhO7CQvQQYuVda4QWh
	 c7A9YJ4tkimiQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDA0B17E05E8;
	Thu, 09 Jul 2026 12:06:21 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	dmitry.osipenko@collabora.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 01/11] dt-bindings: display: mediatek: dp: Deprecate nvmem efuse data
Date: Thu,  9 Jul 2026 12:06:07 +0200
Message-ID: <20260709100617.42583-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
References: <20260709100617.42583-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deprecate nvmem-cells and nvmem-cell-names and clarify their
purpose, as those are for PHY calibration data, not for the DP
IP itself, and that data shall go in the PHY binding instead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 8f4bd9fb560b..980f76667ada 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -30,10 +30,12 @@ properties:
     maxItems: 1
 
   nvmem-cells:
+    deprecated: true
     maxItems: 1
-    description: efuse data for display port calibration
+    description: efuse data for display port phy calibration
 
   nvmem-cell-names:
+    deprecated: true
     const: dp_calibration_data
 
   power-domains:
-- 
2.54.0

