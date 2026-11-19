Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107268;
	b=m1GmQ5zR/gw0SB39FnlceBM+uO/IKdJtrS0g8pk42+3WaUCI5+3UjRGZYamLXzNpTYef
	 +XSzpAdkcDI+VZzA6WcG2/exJr/REIc3e3SRuN/k+H2h8Hn6k/H10qQdozb+voCMcb+Fa
	 WepfDaP/Wwy7nFizYEHYkxRfEGo+sfoDDsJ3El2xL/3ZcvesS9OljdPomHqY6jW6tO47q
	 Mxv3xKvjt5gwStrWVRd4XF/f2Aiycqu2hGPM2H0NFwU3TbzaST5acx6hyZc5VXn76K6DG
	 yE1ixie5siU+HNg78Kn/T87Paf2h43oeBGpfbfGJ4NqRSZPD4i/3rPzpDGFK5zgiXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=qVLrFAIprMVgCniYorqe5Tk3vdmB2St0YQiApFXbZmFvDaY+tRO+A9w/2prfGFOIyzVU
	 2xpXrSj/7vsPOSwLeMZ9Ia4qOHEBTvmDYEUXdVLQycPD+7IK3qlWe0cGRnuBvDvnDrbdJ
	 fZO19VQ9VhF6pYdns1n8bSZzW3fljG5bJP4gIyMwvIh+bAtdZkqYbTVl7zfSJn62l3KnJ
	 4cbPafNvbwnM0QvHZ1KT8pYn23cPnxxtDLVr4GY+R4/wWwH3F9eoRs0Z0FRLbF+a8nnwR
	 4oaax5iVtu+2+YXkhg7HOAk6j+Mje9DbfYL13EBGiVMm5tNr+KUfbog+wtmH7vCbQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dz+ZDg7C;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7360A2628
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D7360A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dz+ZDg7C
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2143249f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107266; x=1795712066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=dz+ZDg7CRoUAxyICkSfyyt6wC/1KPGEqzo6Ii0+kewGp5nMjcEcYBTNjCXpxudpTjY
         R4Qf56JeUTKBjp3XPtzj6l2GLqtNky/bHv7lF4XyrVUfn2EDEw4PkRz1Wtz+WWAfXIGd
         phBHsiu1U4d31BS9e+pAE7DvsO3BPO99HGwRYogLtlgIXsrtq4bH0obS6t1dfhAshXtA
         Wn63K/4tBHKKWFrLr16DbwIK8iWjU5FTus85uzB71BynMtTtDDjV5H6lnuNIo7erzuNc
         /IaAJGbfIsArR69wiB+2BSjF6AiYqNd/gUBzgfhOR5HATERekqG90JczQSH9Oh/nn60/
         fbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107266; x=1795712066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=LlR+J5kIYJHW6VwPuGwTlNSNgPccfZ79xCLDoZf+LTw7E7jZpDpE+L2Rv7yn+iDm04
         3BvotUdVdtdAeqs+NBigRjtN0GPYYsf+1Jy2KzF8jYQUTNxBOcd/6AEYGQW9HDSZzWG8
         X5s/IfAiJAKcHvtxqEv630ppIDL+dbaTKu8fBN2FRNRywkfaa1J+hk67TvH7W3t7COzo
         L+l7AEzMuIAzOMAhLxiRP/cONQMg5fnvABT1fygfZUVny1HJZ1ni6KvV+hxuBe1CXRI+
         dFYu26CN+bJ9mYP2VcTSE9MxfEF5Ok2HdIAD0jOYeknZSNC6fCR2tgG2HSSTNSEsh5Ap
         kFJQ==
X-Gm-Message-State: APuU4Z+rCkSi21D5jQzDbAu7F913rcr+wwFVpRM2tQOQzcWoxWgah2fx
	5b82uwwdofiRR8CQi0vwC07eQ9n5/mDesyDKetKP97bJBYFAR8yKSgge
X-Gm-Gg: AYBFou3LuSoPM1/71cUH9QZxTTLw8lPHCDEegAzGTokJawKE1lrOm6AcOI2/tUJd01a
	GVuu5WCBsELTHDRvv0ljTKh+IKYhAi7ePdDsweuu35KimkBIFTpjcYUge3zQNzPwCyi8AAq8r4t
	K4VNMxNWPG5akzUG7FNAb9EdXDDcE1LpIFIcY6vm88nDkzcfvwknB6pFy9KB2G3ZI+OO+vgSQUf
	9E7351nvARY82Rbb39ixsy28aFKPg3zgQGvgo8DNCcziX8ADtw2RsvASwj8ATacfITwxfibcBjP
	v++Ea0fdeL8PyhFFcWToTlTvWTBBnRQRGMf1OZFtdtg76Dicf6svs34h1D1znTjG2cwC2a08e8Y
	5sS7KmXfVj3geVN8A0f3BWMRRkIY4sIpFPVAjnGkkqCqIu/6J6xbk+wVCg9nxc+/UjAFL/ECajQ
	A/4ey7hGq9ufmweSV3XZkyZHYZp6YTzExZkib7IlQ3rzZRIHzMMkxirShpnMlvGOmhzlF79VxyL
	qh52t4VD/g1+XmRV90axdstQA+r35K4uwzZpqYeHEhvypdtuenwIKKPPHPOxRMa8/NUUw6HW3BV
	r6TjZPkHqSujj1QGEs/mqSnOPb6pB3nZHz8xkUq+cxewwNFJ1UYf+kPHpl3FDmP1zwo0dj1f+0E
	=
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr1875815e9.34.1795107266548;
        Thu, 19 Nov 2026 08:54:26 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:26 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 03/10] dt-bindings: display: panel: add LG SW43103
Date: Thu, 19 Nov 2026 17:54:13 +0100
Message-Id: <20261119165420.24466-4-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 69 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..7f44ac6672bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - lg,sw43103
+      - boe,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
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
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 80c1bfb66f8cc..594863936fb5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,11 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW43103 PANEL DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

