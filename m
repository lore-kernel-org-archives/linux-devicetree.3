Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4803101C0
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985494; cv=none; b=UgRMDTCFzPis8BAHLZwfiRK9KJpeswLpZfiOzdUeZWmavPKPrTSaMByfnPo8bFOnfbt8qBSC069wi9Jb3LOetdnSST2/FAnwQ5fIbJB88lpFL7zKKpMd+7q6vSpfv77X+lpG/EeImjNMZgiPraB9uYMtMAKj8cVAKA3574rrLq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985494; c=relaxed/simple;
	bh=V7NprEA1ziEcZPTYiWf9422D/TQaqQQsBWcrswswXHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjAPL7z20SIAjI072ErJEVcoNaifSPLyVBWT4hwhPG8CtM2p8Yu89WK7zkBx9THNY8PQVbo1wbAFUTF6X3LQNZeIWGBDFokjOEnR4+iSNbzDEVWuvDupJCs3jNEzrwMh2ZKlxoKlYoIdsggr5bZy5ZHoQBWfixtMB6k+WdYt4yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqFA2xP0; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqFA2xP0"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so1385582a12.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 23:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985493; x=1788590293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tmcfXCWyqYWXrP5NL+KMYMRkQ9XRom7Vi8Cv0Onf708=;
        b=rqFA2xP0dHNHUIBZmPAQIUXJO1vSsJeM2wi7REXrQcEPIgTNIm3p10tGSKSM5kanHW
         63LfPlAtW1o+WhRx0QJwi2qxap7AIAgzo6vAaXuGnQuwoXc/RydwRx8pMro/DDV0i8qn
         6gkQsyeortQ7T46TDt12+VEJRW1oA/c7N6fUumI7j3a3xlpFAnfdWehHQ6tCDJBGhHbj
         JFRS7fL0uLbRw5U8pLGQ9kb7cXAZdQaFJyKdzdno38Pg5WcVsBg54GhUyWXsTZbuVnpU
         aqquYQbKS/owEfLNT0hGmPou29N1+4L0xm6zDb2PJHOgRbh/EI/20E43A9EAFOAm0Sl2
         Gbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985493; x=1788590293;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmcfXCWyqYWXrP5NL+KMYMRkQ9XRom7Vi8Cv0Onf708=;
        b=VKEvyrw/mENKrexpfCgYA5awaTaoR9ufCm3kMDFx5Xgfn6kOot2eyUKeFWAaavWEgn
         YSo65pnu+N7R31sCGtyk6bosrrpBXc7ym4vSGxA6wcy/C9dZwCJRey3mwgYtx+DZRze4
         R3TBfLn6fuuCtNP8Ypef+UvQ5szI+mMooyuni3xs3UOcoHYidNFQ2Lmy/myBZuBHEYmI
         KPwPKWNWE5Yl13rlPAaxGYLv/WAcoPQPsUsmdKNT7tV9rWcNu+jpMSPFH3/PaKMrxHrZ
         ogEAH4hEI3iYMNN2JUBnyOFx5IbXFCr56tPpkhwDxqaE0OqrEehBEEQcZpM+0JEepqYX
         ihdw==
X-Forwarded-Encrypted: i=1; AHgh+Rp52pI9ODlSdkQmYWNPD77sTnKzGz5LmKZi8ojHp21oVU5YcwzJN8pjWWydRKwKgXgumVgwrfkE0ziY@vger.kernel.org
X-Gm-Message-State: AFuF++kFIK1HuALoMoV8M9kPqaPlgJShH34jZXEgkoHddkK4n+ChTLEv
	50so19ftE/2LAWL0NRetY1KwdxKvTswLgxhQP+bwls0Iu4Rp+vKed/U=
X-Gm-Gg: AR+sD13HN4S+4Nk3ZkFoy1iJ6WUGI0V/zjQGnXPlxNI+0cSdIqSoDfBtYXgRp3Beo1g
	5954eg87sJLoqRLNcdAK0axAFrQL/TW30BqJmrQdyGEu8s/OANv1NadaPv0qZdd4uBjXvJ8427w
	WsKaTQgSlJcZ+AHVsyDW1iVnlua3/blU+lgYE0w4eMdylUPNMp6YpNmZuMNTWENzzCNqGI3iF8U
	ZZPCT0Yp68SSYgYP4yAt7N8UwyGej7jhF3A9zdyfBN/g4t+JKU4YVLZA/ECq+jomFb6QXzy2bNX
	sJV6BkuRgOePd9ACdxgliLvR9sipsH2p6QfaUut1N/CqLMKnqWaeATi5flqraJrT5KaK5cdkE5G
	9G1e7jDeYnEGCH7brquqOx1L+ELMLVZzEaPs2VwPtxF/2l3OOxuRAOFrFlUKfUIu0aDjNjNosMj
	TE9klEPbZX1NTkDxV4keZ4P5LeglCgh7iG/vED3nE4A1/5vSOCB+HX0FuZYbD4HIJPSI/LhEX2v
	Sx3iS6X4s2/eep7t3dc16UhNvI6ymIFhRFX0C8=
X-Received: by 2002:a05:6a21:594:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3d2681a3f3cmr23957289637.13.1787985492691;
        Fri, 28 Aug 2026 23:38:12 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:12 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 1/3] dt-bindings: display: add Chipwealth CH1115 OLED Controller
Date: Sat, 29 Aug 2026 03:32:13 -0300
Message-ID: <5e1a01043e1935d59d48630dc6211652e64b108a.1787973729.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787973729.git.nico.antinori.7@gmail.com>
References: <cover.1787973729.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
NOTE: patch series based in kernel v7.2

 .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..6b037c40242e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  chipwealth,inverted:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  chipwealth,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+    default: 0
+    description:
+      Display start line offset. Specifies the vertical alignment and row shift
+      along the Y-coordinate.
+
+  width-mm: true
+  height-mm: true
+  flip-horizontal: true
+  flip-vertical: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3c {
+            compatible = "chipwealth,ch1115";
+            reg = <0x3c>;
+            width-mm = <12>;
+            height-mm = <8>;
+            chipwealth,offset = <8>;
+            panel-timing {
+                clock-frequency = <0>;
+                hactive = <88>;
+                vactive = <48>;
+                hfront-porch = <0>;
+                hback-porch = <0>;
+                hsync-len = <0>;
+                vsync-len = <0>;
+                vfront-porch = <0>;
+                vback-porch = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d2ba67c4c8e0..1d158ac83ce9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -325,6 +325,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chipwealth,.*":
+    description: Chip Wealth Technology, Ltd.
   "^chongzhou,.*":
     description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
--
2.47.3

