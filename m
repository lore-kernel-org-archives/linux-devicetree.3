Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8DC3F0744;
	Wed,  6 May 2026 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086980; cv=none; b=pypuv1LQoLKw31UKygX55d2ofJewBtTv6igw3Sh0DaUl5EG9vFwmBpGe0a835Pj3Oy2KlsxSF4Qi3RUhqLRi1Mvu6gLMzF7sIVhVCsGZOtXoian4dZeCsfFaXL6Ib9fOZviQLcVsZCBmNM3KCmGMQuQJGdXALy6D5KgFOcdAbJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086980; c=relaxed/simple;
	bh=O2QRKh0D8IA2ov96YXFJJ5KRFRHwxZOl1wauW1lOoWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cokufDCYwK3lC7xIIE4l5ezeHuFl8ajVFBeo8sGebXq3436ey3KbkC2qI49juf6ks+jGmqlwJr1+Vo4U7nJ1hwX1qioNPVCeoOqho2EqphaqizkZ9Ftkzu3FoabHbXtmQmSRR6ng9PI0YoTmJr/0yjk0pVFnuXkRixpWXrTdwKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev; spf=pass smtp.mailfrom=rembrandt.dev; dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b=gh2QAZpB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q5PwvWyS; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rembrandt.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rembrandt.dev header.i=@rembrandt.dev header.b="gh2QAZpB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q5PwvWyS"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 71A247A014A;
	Wed,  6 May 2026 13:02:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 06 May 2026 13:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1778086976; x=1778173376; bh=vlYBHxAVQ7
	yizs4lgoaidrJZSwfsP97zJRnkQ0WRVsQ=; b=gh2QAZpBOhJc3bwCUzbt+dYRzd
	peSOEscHcq1+Cvr0XylpAn8+rHvIrZIiXT9xeiLkQPf3LXbvPx98ey+wxYuD72nE
	qvMbZ2bZp0Q/5Iqn+KWXKi0aSQVvlaAuGp7GqHJik2gLGRjvjHJsFL0HoDH7K/hO
	EHmn0EPka+tZBSAhpYvj0f1pz7LOURxKTA2VGiPh7KSR1/zTCSIDLaxwSmcEH7GZ
	tG3ZYYBNwFTKqKBPrs2r6qDyEDxE4S8PfiaKeeRRkdyEQnYY+7a0vOLxZo6D98ok
	gJWaYHOz9bHW1jvtd1rv4Ho0lylINW+a+fx0aU5MAFSRPz4CTcQ4OrSnpTIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778086976; x=1778173376; bh=vlYBHxAVQ7yizs4lgoaidrJZSwfsP97zJRn
	kQ0WRVsQ=; b=Q5PwvWySL7jilgUek97bW4Anw54Dj7LxCP/TeQn6jYL2NcNst3m
	6SHPer/4JhCjFcGyrqYIQ7korXwWWFZqgE6mza+00eN4R3uhCG7Pr3Q/9zpB8Q7P
	OGfc1fS2Dbs+dZZ6ltF6aJiRssIPNrw4ay4XenODeK3bhHCPT8ZoxUDJlhbYRnEI
	H89KWF8sJtHnBcgU+P1vYtq9Gz0mPVJIlb32T2o8jUm18HJZL1ovOif8OS4qeDBl
	1sPZlmB9bBmx8fRjO5N7HQbWcxZmbFaldl/za6cI7sRWbkOvce4sHRfsloFL91WZ
	6p1eOPpHHjj7bF8fojAhJ3OOw77RrUpto5A==
X-ME-Sender: <xms:QHT7acZHmd4dA1TyFSOhgRQd2Z-r86gLw48XpmegwXbWsBvA1v_HCQ>
    <xme:QHT7aTZx_zzNxqG_3HiZLJzwGQU9HhJm2FeH25Ey9wDKl9Ww44kcDqynsmkzmYZf1
    TjOXSn_9uMZ26CSPk7VNQwqKrvUHdxWCQG7FS4NtQxpjgJNQ_Nz>
X-ME-Received: <xmr:QHT7aZIIBS3JC5XfrM_Rl9InpKJ6byVO9xuZwwrPqPbhXTBWFGoHBk9PkXrniFheCb2n9aEWJvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdehudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgifucft
    vghmsghrrghnughtuceokhgvrhhnvghlsehrvghmsghrrghnughtrdguvghvqeenucggtf
    frrghtthgvrhhnpeffuedtjeejgeeuuedvueeltdejtdeugfffvdejueejkeeltdegteei
    udffgeefvdenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgpdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehkvghrnhgvlhesrhgvmhgsrhgrnhguthdruggvvhdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushifsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhesrhgvmhgs
    rhgrnhguthdruggvvh
X-ME-Proxy: <xmx:QHT7aXuyI2Z0KdfhLTnA8E2YDBTCjCEEXBN0wmuK7xvUNMpTFOq0og>
    <xmx:QHT7aVVVD0r_AlYNZgNsnOzYsBMzf21qKd1kgpphfnNTOU7dtEiyeg>
    <xmx:QHT7aahoGr1EdhR8u729_4PHYbx6Bn70_oiywiwu8ZC2RcZ1Ona3zw>
    <xmx:QHT7aVqvpepcKsJH12TvOMaFrVP5U0DYO3smONV3pzZCK3haFCdTwA>
    <xmx:QHT7ab6vyIS7tS0zJisC7j1Pu6Cd6YIFrkrHH86XWv2cd6iWvdDGH3XX>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 May 2026 13:02:54 -0400 (EDT)
From: Andrew Rembrandt <kernel@rembrandt.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Rembrandt <kernel@rembrandt.dev>
Subject: [PATCH] dt-bindings: arm: st,nomadik: Convert to DT schema
Date: Wed,  6 May 2026 19:02:36 +0200
Message-ID: <20260506170236.2610955-1-kernel@rembrandt.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ST Nomadik boards binding from free-form text to DT schema.

The binding documents the Nomadik NHK15/USB-S8815 platform compatibles
and keeps the existing example.

Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
---
 .../devicetree/bindings/arm/st,nomadik.yaml   | 36 ++++++++++++++++++
 .../devicetree/bindings/arm/ste-nomadik.txt   | 38 -------------------
 MAINTAINERS                                   |  2 +-
 3 files changed, 37 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/st,nomadik.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/ste-nomadik.txt

diff --git a/Documentation/devicetree/bindings/arm/st,nomadik.yaml b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
new file mode 100644
index 000000000000..9a6d1458cad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/st,nomadik.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/st,nomadik.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Nomadik SoC based Boards
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  Boards using the Nomadik SoC platform
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - const: st,nomadik-nhk-15
+      - const: calaosystems,usb-s8815
+
+additionalProperties: true
+
+examples:
+  - |
+    usb-s8815 {
+        ethernet-gpio {
+            gpios = <&gpio3 19 0x1>;
+            interrupts = <19 0x1>;
+            interrupt-parent = <&gpio3>;
+        };
+        mmcsd-gpio {
+            gpios = <&gpio3 16 0x1>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/arm/ste-nomadik.txt b/Documentation/devicetree/bindings/arm/ste-nomadik.txt
deleted file mode 100644
index 2fdff5a806cf..000000000000
--- a/Documentation/devicetree/bindings/arm/ste-nomadik.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-ST-Ericsson Nomadik Device Tree Bindings
-
-For various board the "board" node may contain specific properties
-that pertain to this particular board, such as board-specific GPIOs.
-
-Required root node property: src
-- Nomadik System and reset controller used for basic chip control, clock
-  and reset line control.
-- compatible: must be "stericsson,nomadik,src"
-
-Boards with the Nomadik SoC include:
-
-Nomadik NHK-15 board manufactured by ST Microelectronics:
-
-Required root node property:
-
-compatible="st,nomadik-nhk-15";
-
-S8815 "MiniKit" manufactured by Calao Systems:
-
-Required root node property:
-
-compatible="calaosystems,usb-s8815";
-
-Required node: usb-s8815
-
-Example:
-
-usb-s8815 {
-		ethernet-gpio {
-			gpios = <&gpio3 19 0x1>;
-			interrupts = <19 0x1>;
-			interrupt-parent = <&gpio3>;
-		};
-		mmcsd-gpio {
-			gpios = <&gpio3 16 0x1>;
-		};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..86e7c1dd51ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3155,7 +3155,7 @@ M:	Linus Walleij <linusw@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
-F:	Documentation/devicetree/bindings/arm/ste-*
+F:	Documentation/devicetree/bindings/arm/st,nomadik.yaml
 F:	Documentation/devicetree/bindings/arm/ux500.yaml
 F:	Documentation/devicetree/bindings/arm/ux500/
 F:	Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
-- 
2.54.0

