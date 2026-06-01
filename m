Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7C3002DF
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331527; cv=none; b=Cp+NrgkcNegRBjYTCoX3AjHwTvWlSt3S+gBfkyLiWD2mPiY6/ysyeUy+A3EzxKEeyD0KIoRgjXrL/p+9BUN4QsW9+qe65GftpJhsOGI1IPZCEzVcv4/YtR4C8c+4gf8Un7MvG0Tp+Khbw9mfZbBYy5g2bTnMXlo5siLyCAFKOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331527; c=relaxed/simple;
	bh=0NME0sM49RF5DaMChUXyALkrZCsgLNDsxmIMYYiB3/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUfY5gnMAEGe3tB80D4Lf/mljUrZaAxOs5wkTVEH+jHhkU4pnhytUhUW2aluhWBwltcMzKia6WtR4GW40c82p4do6bdSGLVPXGK34p720Y8lQp1MbUsPfZ4/GALFkxcpKYUPqbN3FVeDMbL3IGfl+x1OmHML0wSzAcL7ll4J8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqSFB/e9; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqSFB/e9"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e6cfdc8382so183838a34.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780331525; x=1780936325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FI9ZQ9CgMmpb7a0bvB8JNCWm0010rqvUn1D/bvnZnqE=;
        b=AqSFB/e9ihZgPbawoaeH6cn3mkCq2EDrIdRO9U77Q1NlZtAVpu0F+uCb8VJQ97DEmT
         vCAP+HI9YZWcvc8FRBpNkZUTUfJhvezAw/pT+ijyOhAPqi0oBwA4hCc4XmM99jB6XrDo
         jiljlQkSr9gtMNGevbM9/zG+qC020CxB3Vo97oQF6fAGbGdC2jVGP/kgSTGUTs//T0TE
         gOoL3RR4chG2o+aLDgR9ScM/RHJDaQSdjgKhOnxn0RUZLqTchAKg8+y9idu7GAmh6191
         jjDdpMtjaFx4tPC42D/THrNRorpJpFhdgMdgFCXeaYMzfhcNLv3uPFDvnyi+ctyTZfX0
         yMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780331525; x=1780936325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FI9ZQ9CgMmpb7a0bvB8JNCWm0010rqvUn1D/bvnZnqE=;
        b=XM9nn2xTZLwTcBSXJe0IxONBlBaXiRfps1d5IYsQrib9jva93igyboL6uXrs8qdHZF
         qgzjSIool8jDoSyb2cezNMWdqEk9mh40hAFZa6zsylxYd+nzfLlwMPw6BnfRL7fXdATf
         JEZQvZTSzd+0TwmoEPszW0liIboNIYU1t0f4Ji75TY2WxJUZ32aGrLk2AA9P8m7xYvna
         DKQMpqcIY/j1fskPg/kAL5xHaPMDLj07w1MWSdaMKBfL9SKp5sMbLhaEW3c0uwfQinB8
         Q9CGDHHsGyygFXK68T9dsog6+Y+n5tn8kRL0QH6WSck4l+dBhwDLGXBHbC8giEphtL9/
         rZJg==
X-Gm-Message-State: AOJu0YwzqcGnmGKx5LtpIOddjwdm6KhO/Zl6yGa8jGtDiyTm+oTyRw1H
	vfdBNza4ij3J6Rh5xvDs1LaxLdtgRLN4mj/e61ACmLZuXmiP2mN6U68U
X-Gm-Gg: Acq92OG1cmTYirOSO6+o/6vxpwzc+E/YdMipAkN4lrEcCWG5zeWvTJSxjhCzZ00ZGO4
	QDdY2dKXBDoUobw+069Z0UBy0yNYJgwKwoBnO8htqk4/9u8vIeln9jCIi1U0zs5LtrXrH2giDB9
	sWyX53Q73vHb8kreakacQwBxdUsS6v1fx3OaJXGpUzFQMjgfJ4F7GUL9AmEFZcbb402dfUfTXPQ
	KjzXPqNJbyx0q1VZBBMZyETLIMYpTNbDWEJZsC8RRGVdm+BN/qNeSqJsEdSSLEe94WZsWHndhJa
	lsXsFZINlnlOeaEA/IC3cIq23CyWRDinMZRcaVfcNwR8zGVG0yuHHO2xZFPHvRngd0WBgKr6jSO
	1W94Q6Bzvly3d2i3/I4y9LMMh8/oY3My6JrQF+VMeBE4z6nLSKaOwpBc6XTfylPrn7nH6cqlZev
	8FyD1DqF/jjxk2CI9VkJmnC3yaA//Td6U=
X-Received: by 2002:a05:6830:6611:b0:7e1:e832:c8a2 with SMTP id 46e09a7af769-7e6a1eb2fa5mr7513680a34.19.1780331524980;
        Mon, 01 Jun 2026 09:32:04 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695d69b20sm8024928a34.22.2026.06.01.09.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:32:04 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 3/6] dt-bindings: display: panel: document Anbernic TD4310 panel
Date: Mon,  1 Jun 2026 11:29:48 -0500
Message-ID: <20260601162951.254968-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601162951.254968-1-macroalpha82@gmail.com>
References: <20260601162951.254968-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
on the TD4310 controller IC. It measures approximately 5.5 inches
diagonally and is 1080x1920 in resolution.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/anbernic,td4310.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
new file mode 100644
index 000000000000..6f7f92b9c860
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,td4310.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic TD4310 Based Panels
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+description:
+  Anbernic TD4310 Based Panels, such as the RG-Vita-Pro panel
+  (a 1080x1920 5.5 inch panel).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - anbernic,panel-vita-pro
+      - const: anbernic,td4310
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Panel power supply
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "anbernic,panel-vita-pro", "anbernic,td4310";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+            rotation = <270>;
+            vdd-supply = <&vdd_lcd>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.43.0

