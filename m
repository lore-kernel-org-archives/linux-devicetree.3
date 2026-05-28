Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EF11D130E;
	Thu, 28 May 2026 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972855; cv=none; b=lga9P7Xukn0p9f3WxGjww+A4P+DNEQr4XQz++6U+QrCic9qXZUgNq0GpDTq6RLGy8nhUE9DA5T80avWmW9QairfGRTV4UiR1pTWtJ+jsfo3GbLi+y9rP1qV6XK34RSwCObuQtvRjfT37Le86fc8c5gHssCU15Y+rUjjirrQDmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972855; c=relaxed/simple;
	bh=YGqYq1zCs6c65Z17EJux0XY2xXKRUPj6sgfWNswnMB4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TJN0x338xuvMUCU6q62Q4ZDUEs6TdsFd4AwrH1Mn6ruXkn5P2RQgva4B61CvWyqdNGUKd68bg5y5+a3co6RmArmeVzxj6/q/5W5OZUwbM3CITQ4rVHp+YQaE1Re7AoljxWU6GhQAuWyGxyJOC45fbOdzsjJqdva3NM5DmGeOJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DbnOc5cZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DbnOc5cZ"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBCA6219;
	Thu, 28 May 2026 14:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779972832;
	bh=YGqYq1zCs6c65Z17EJux0XY2xXKRUPj6sgfWNswnMB4=;
	h=From:Subject:Date:To:Cc:From;
	b=DbnOc5cZ/Z3yKpSROKqQfNrD4JQR9q+4GG005OxesxgXlfcz+Eis9m6yEOA+ZPCnx
	 fQ/ocrwkfi8cyzjiLEB4C0xZIY/3LTgP74mVMrgZc8PFZE5H1scSIVD4oQuqHK9hGW
	 OXzOx60RkdnXOSk9od+Vm+FyJ32kKJNCuEr60J8I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/6] arm64: ti: Use syscon for the Control Module
Date: Thu, 28 May 2026 15:53:41 +0300
Message-Id: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANY6GGoC/yXMQQ5AMBBA0avIrE1STYq4ili0NRiJkhaRSO+uW
 L7F/zcE8kwBmuwGTycHXl1CkWdgJ+1GQu6TQQpZCiVr3BkXzQ7t6gbsK6VJK1JWGkjJ5mng69u
 13e9wmJns/j4gxgfT7yzScAAAAA==
X-Change-ID: 20260528-ti-main-conf-d75aea5e5c2b
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, 
 Swamil Jain <s-jain1@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2414;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YGqYq1zCs6c65Z17EJux0XY2xXKRUPj6sgfWNswnMB4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGDrtzgSORPitjGkgu/5SekfDB5+pVvwmodPx0
 pGGk2HxtlmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahg67QAKCRD6PaqMvJYe
 9YG3D/9zAR8fKE3k7TinXOe9fczZ6+1Wru4FurrjQqJZEOnwgON0dnxn2yLl720nBP/rzwIUHIy
 7rmlfaOi1dtYRURDBfIFSndgdgtJY+OIkIabSZ1VEXCjS4jrmEFkhjwdz9CIYXPHVVbYyD/aL76
 obrrq+ECikG3rVQvpuzDotsultdKGff37gtjpQGbTcdQgJgFlclp/IFzjMV3qr8y1kaDeuChZfF
 ByuUAPDkVb5C/0M2N14l1SlSjQi8nknX3LGnlMuKkqDgAN9DDnHNY18zg69PoKjJkiSMCxGB5YP
 eNINTsE/cmvyMq5UFy7BtDpnRq/5qGe2sl7/yL/2Q8zHoZa32wvUEROf/hYwgrYgyzxQZu8lHhq
 ABloqGfoxLp7LvvxDTo2Qw5BiVBM9dQOXOyOAP4jWHtknpPTLpTVTA2tJVnQxAoGw220LPbmUwS
 ktCLDmpBhpXl3lGLxi+Q/0lzhBgveOvwUby/wHEwDAuCaGuyJZIdlDoYdjdS7t61J4WEVT6u6Gd
 3GPnz4mujGx/+gIe5IUlEsV8ErruOzFWUgvezX/RhB6/biBis/FczOj3kOXXq8rP1W4c5TC89Hv
 ZoX8ZzHptdXjsJHzmfpY7uk7DjxVqaQpxM3PEKfur/I+6WVLOUiDks/WUQI/P08Caxtda7fzp6E
 7q+B4DoSih0EHaw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

I have been trying to get BeagleY-AI display support to upstream:

20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com

One difficulty has been the handling of the Control Module region, as
we need access to a single in that region, surrounded by registers for
other subsystems. In my series I made the related node a syscon, thus
allowing versatile access to the registers:

https://lore.kernel.org/all/20260513-beagley-ai-display-v2-14-9e9bcefde6bc@ideasonboard.com/

However, that's not a correct way to handle it. I realized we already
have ti,j721e-system-controller.yaml binding for older SoCs, which has
syscon but it's not used for the newer TI SoCs. This series takes the
same binding into use for the newer SoCs.

I think this is an ABI change, but I also think this is not an ABI
break. I hope people with more expertise in this area can confirm my
thoughts.

I believe we could drop the renaming patches, and just adjust the
ti,j721e-system-controller.yaml a bit more to accommodate the "wrong"
node names. But if there's no downside to the renames, I think it's nice
to have a more consistent naming.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (6):
      arm64: dts: ti: j784s4/j742s2: Rename pcieN-ctrl nodes to pcie-ctrl
      arm64: dts: ti: k3-am62*: Rename 'clock-controller' to 'clock'
      arm64: dts: ti: k3-am62-main: Rename 'oldi-io-controller' to 'dss-oldi-io-ctrl'
      dt-bindings: soc: ti: ti,j721e-system-controller: Relax the bindings
      dt-bindings: soc: ti: ti,j721e-system-controller: Add more compatibles
      arm64: dts: ti: Use syscon and simple-mfd for the main conf region

 .../devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml | 10 ++++++----
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                       |  9 +++++----
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                      |  7 ++++---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi         |  6 +++---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi       |  6 +++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi                     |  4 ++--
 6 files changed, 23 insertions(+), 19 deletions(-)
---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260528-ti-main-conf-d75aea5e5c2b

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

