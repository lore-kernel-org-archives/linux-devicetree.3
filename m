Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5246F4A6;
	Fri, 14 Aug 2026 18:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731445; cv=none; b=cMEAsedT21qQL2okAomVm27RleEjdo64I52Xo2xI+4qW+xIBha0vuDzdL0suumw/8WCcZuVIP6gqj4OdiP9krSrwDYA1AWe8MpIZnUiAFC/xM1ZX6gNaazTlTllUmMRLw6ykWAUfpUMeLFe8yvueft+xRChMi2fKCL6fRe9X5IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731445; c=relaxed/simple;
	bh=Gv1Ja9rXOy+qt4Q/cn2nHzoCvAUeO/JKq+rbKEBiDXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkScyZeClo7EfU5cEmV9YRSuV8CTEN2PVnqWceIP9UIwcrOB4vazbe7r8UkdVpDKzyoZOlf/TJG5EjO4t5rVJnI6hK4EYRdmcw5uWO6vgFAJY9Q+nsxHQPjXkvgY5TTXad7xxM9IWzhHw8EHQDXZu1evZoLbAxiXA7iu5vUTvAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8wfFn+s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8wfFn+s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84001C2BCF4;
	Fri, 14 Aug 2026 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786731445;
	bh=Gv1Ja9rXOy+qt4Q/cn2nHzoCvAUeO/JKq+rbKEBiDXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I8wfFn+sv02WU0/0WmnNPNBdd1Q5AreHmD5FS9guoaNreL6Mhsw3UdXlRt68xIY2o
	 6ceaWR9rCYzTJIRgxhVdCHuLKzUw8NypcuObNtTw8rumuMJCA4/tL9zPqgvD84PK9u
	 jFNY7Oec4ZzWEH4YywXjpJQm7/Qzrwa5cJ9r3/Mlrbkb8k8AQlQZb4A2u5DqRDiybP
	 yPUI9t2AN+GSOep5bguo4owgc4h11J/vfGZF3/qoEDIHAmWN5sFfybS6gVlRdnlTD1
	 lG0QO7Z2tuS/XWdhIl2nFhuk5AzzFlINxP4iOzQzX1p1i1lskl6S+fzCz5/PPYRosB
	 IGDry10yRPZjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A0BC5CFCF;
	Fri, 14 Aug 2026 18:17:25 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 14 Aug 2026 13:17:15 -0500
Subject: [PATCH 1/4] dt-bindings: display: visionox,vtdr6130: Add Retroid
 Pocket 6 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-rp6-panel-v1-1-111c1aeccf0f@gmail.com>
References: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
In-Reply-To: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786731444; l=1399;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=cQAQT+SLMV+AccWuQQKaYy2+/aNZWvo6kpA1OLjfeeY=;
 b=A+OJcGc0F92v2IjBPJqtFUxJPBwVQP3I5db3lJXiaBz0ehSB6z9WkgxJyWku6MwVq9Xs2tiUp
 Gu2NF5e4thSDn7/DDNVVnVojfvHStxAXVgJgh1TocmUg1RXOynWzqA2
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The vtdr6130 is a display driver integrated circuit, a common chip used
for various panels. One such panel is used in the Retroid Pocket 6.

The RP6 panel only lists the regulators vddio and vci, so drop vdd as a
required property. The panel is rotated 270 degrees to natural, so also
add rotation as an allowed property.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index c99f4146f1bb0..682f30dc9ee43 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: visionox,vtdr6130
+    oneOf:
+      - const: visionox,vtdr6130
+      - items:
+          - const: retroidpocket,rp6-panel
+          - const: visionox,vtdr6130
 
   reg:
     maxItems: 1
@@ -25,13 +29,13 @@ properties:
   vdd-supply: true
   port: true
   reset-gpios: true
+  rotation: true
 
 required:
   - compatible
   - reg
   - vddio-supply
   - vci-supply
-  - vdd-supply
   - reset-gpios
   - port
 

-- 
2.54.0


