Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76CC3FE354;
	Thu,  4 Jun 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574014; cv=none; b=OaUeiHcOo1TIRZNsBjx0XK0Hlj80EuKP+jEhf5xiZgPVVc7gzJBOkL3ACN8R4VAkvJAjj8ZSThekTB2pQZHteuJ3UKzCpVUhAcxIqgg3Fi1OY0DTghGKDEbrn7qGM2NXIfRRSstI6wPbMv8rhsMd2oaMO6c7t9y8cbzVozTTYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574014; c=relaxed/simple;
	bh=eLLiKQ+DHg8qJM7tuSQi4gAiRLDVVDWjctez4raIDnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3/dZJ1O09JQ0WnvaYayCgElAIlBOapgHIzgNMtDXBWCJdptoIw4DP3Peh2uTmVMSlJZ64svH2epO9m86AsZJU46c7HekbhXiUvysDE9jaWCaib74/0Cdlxk3PdNmrbVH1Qm4ZZoiDdXsB6Kw9NRIHEZKJsi6rItbE3ir6wcNvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=OLX4n7Lt; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="OLX4n7Lt"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=TwoEO3Tf+vvUUTkmGVG435GOHfh4xwRHfhvZMdsM34s=;
	b=OLX4n7LtUTcS+QS2wughlOG84IJUNREBi1crLrkr+a+ff3aGWZMO1bP2Lt90fmRm5e+V4dnkPgyS1Hhnle3N8cpc81qVHAhokvH7eAbnuu5tlHXPYRUXtRrR1eFgAVS5l6wir8i+Yyxbm6w387+UYprJE3MudiNjhHpUbbRCUQ4=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Thu, 4 Jun 2026 13:53:08 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
Date: Thu,  4 Jun 2026 13:52:32 +0200
Message-ID: <20260604115241.1358528-2-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604115241.1358528-1-lukas.schmid@netcube.li>
References: <20260604115241.1358528-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OpenNMC is an open replacement for APC SmartSlot management cards
based on the Nagami System-on-Module.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..8e2c9b8fe121 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -600,6 +600,7 @@ properties:
           - enum:
               - netcube,nagami-basic-carrier
               - netcube,nagami-keypad-carrier
+              - netcube,dobermann
           - const: netcube,nagami
           - const: allwinner,sun8i-t113s
 
-- 
2.47.3


