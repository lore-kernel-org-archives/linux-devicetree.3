Received: from mail-sc.amlogic.com (unknown [64.106.246.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB843815DF;
	Fri, 10 Apr 2026 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.106.246.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815730; cv=none; b=R8xIQXQS5+i0ZNnJP3pvk7VXG2Ah3vIKLkOBJQfB8zs/cUuw55hjVhnpinuQQtRFqngBJkCleDVPs3dii1UlpPwsXyN5e4FCC7YSRU4e1XZPUJWkplUvflPbBciXBN6Jpr6F/pl4gFWritWKsvvtOCJHt5L/6GXb2AFaK140mXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815730; c=relaxed/simple;
	bh=lW26ufnPoRIsivoBcpTpi4s2RTL70583oHka9UAM+pE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iG5/RMBbQPa307CP8m0QYbveMf2BanTMMLFQS1nZFlZ2IGbv+shep1kw2/A2jH+gF+TEZisqYkGoqDGwmM/loj3malC0ptAml35Q+CefM9NGg+iOEqiJOI0fiLuRg7/tgOz4i67B9jr4kwXLTpS7z4Avqwcb8ExNuEgFYFbP7+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=64.106.246.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 10 Apr
 2026 03:02:38 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, robh+dt <robh+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/4] soc: amlogic: clk-measure: add A1 and T7 support
Date: Fri, 10 Apr 2026 18:03:25 +0800
Message-ID: <20260410100329.3167482-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)

This series adds Amlogic clock measurement support for A1 and T7 SoCs,
including binding updates, driver additions, and device tree enablement.

Jian Hu (4):
  dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
  soc: amlogic: clk-measure: Add A1 and T7 support
  arm64: dts: meson: a1: Add clk measure support
  arm64: dts: amlogic: t7: Add clk measure support

 .../amlogic/amlogic,meson-gx-clk-measure.yaml |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   5 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   5 +
 drivers/soc/amlogic/meson-clk-measure.c       | 272 ++++++++++++++++++
 4 files changed, 284 insertions(+)

-- 
2.47.1

