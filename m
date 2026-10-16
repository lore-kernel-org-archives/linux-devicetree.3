Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75843BBA0B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 23:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193296; cv=none; b=pIR3kKLUTVMcZREeG9UlrB3CE7QnC21nzUwS9cc6uG9gy3TUS65oqks6ikoraKOobUaO+sPXvduEntwGLCS1VjJYGOLwn03O3EWOblA6mMXeCr7TFYTNVBENTm/ISNUUBbS9wx5O77tmkLIGAuNkSuhE6nEHc7H5CQBv4H8eGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193296; c=relaxed/simple;
	bh=CwWDDjpNnsPleVo1jcGzFZvinjzTeCjJVRg9u/FiAbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Et47+aRkoQWlJIuZF3cVj9A+YEOBjKKB4Gu481Br6TPRknHM+i31Q+/x1/brtMRjD3guByAnsBuYLZg7sX8BOmRj3sU+ewlZp33mYrbnWDrjqK/epibm1lrAN4cpTHYCR3s0Gr3Feg9erYsL2QWXizS3DdYwFuvC8JKZuoaWd38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCHhBeay; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCHhBeay"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c6e6822b11so117160137.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792193294; x=1792798094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+nHfvIYCrgROUwGVGZYqdh67rBw+LFFXBTqFw6Ps2c=;
        b=eCHhBeayH2c+BBa4x/nHClCZ8lniv6DPRcmKmPxMoY+9jb7n3kcb+KyoBQDFF+kdWI
         fsdD04HpWgHZTrfVUhcmPvHlZZJn/KVenJFMDHRh1NKnEekEdXDkyCSNzuKv6dPDfqM7
         wAn7YyyQMJzJRCpiVrIUdicCR6+UxsEquBVg7/2X8Z6JTswcq2W3u4kBsgPm3CxVBj1+
         WxCw3qU7xOlGAgd4EU2ggbuMNmAmKtHwXS2qFXrjUBeuvC2+dzJwtbiIbsCOguu0FCdP
         PBwfNVC8TIx3UnFAq5T2j3Tzdfwq0i1GNY5QZr9nO/h7INeXYzYRy/2poijfn0aVDw0b
         DjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792193294; x=1792798094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+nHfvIYCrgROUwGVGZYqdh67rBw+LFFXBTqFw6Ps2c=;
        b=ckU5YzPLtTuvmzfnzq2rqLIL7QIJrsUtcrjUst+MTGknzazpt/3FG/rdszmIYldCKO
         r8fVMMeLyywXGcjaaXCXwxbUzSvsSyJ5Dclu0apkApxhKugOaB0X+TMDo7f84vLyYu86
         tPqw7zHkW4Jflns0+as9VFwM2l3PGxmKDkLJODShe+iIl22Iw+OTNyumyBEGe/s8XvhT
         DucYhy5Zyacvd3a7Riy4s0Pjzv0Icp3X0tjkO2m1p5D50RDs4Qv7OPbaOyNILtCh6yzx
         adJLuTRxssQO1j2XGnp4tJHMAIO3xOZtieB1weAmFeE4CZKkwvGGDkyLIdVA6ICrib9K
         6SbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH5A2eM9qpefu+MahfTRpgYtv3yRERHHLY7oEAWvMYhRGIhVCulz+wc+BZ2d1Bf3W+jsMISXBFUG9l@vger.kernel.org
X-Gm-Message-State: AFq9FYJXzQFAxmk0eyuz8+dCLabhIT0Bdy+0d6qP2/3ZK2GHfnZiPwNM
	266AdgCUzG1UXnhP5re76zVNJC6V6OjaQyiv5lCMRlbzESTYYbaG4xA8
X-Gm-Gg: AYBFou3uErvc9NLCDIQ3QqOK6H4oQo/4WNR9d68rbmqWSBqB50jHpvDQvNyt+KJoc9B
	Aa6+p0pt2ATcGep7uE1vcJdlFwrlkK6jTneifYo0r9Zmg+igvps6AIiw9J6COTgtJaIhTYl0Mrs
	DIDWBc0V2hvqG6m8BN1h6xQUIQh6mJZN7gYKR2tq/SkoXhYz4wA9/0qV0ZwQmbxkzPSLQMaAuCd
	KodLH3WUQMhxqENyzV+wxyxptl7VsdOHg8QJeAQdp1kd2WwCmDPUbFxnYWZEH0KfYLhKt2bV9US
	Zsh8pf3OYVafTOGaJgz8zed1FUt/U1NWI3DtBsGbhYbLYP+Neyoobteg+kWDutbi4pYefErHj++
	xUceIog6rzuO05Pg4/obEEFfOtqvbSuWIzc5SYy4eTzOukNNV8Z2P+RJKMCuARGRsYkfYmvXDv0
	qMN39DPtFn/oZHjEl599vGszkzKfQMKg+q6FZMKzJlHtlZXC7CyCtTGNKmtJdpkm3bmm6yNz516
	fyNTpyXovdzIkCgiLmxPQsFgnD/4kLll9Q3pkK4UvVD470=
X-Received: by 2002:a05:6102:4247:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7cc3691f50bmr274471137.6.1792193293549;
        Fri, 16 Oct 2026 16:28:13 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4f58bbsm2804299e0c.10.2026.10.16.16.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:28:12 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: nvmem: imx-iim: Allow syscon fallback on i.MX5
Date: Fri, 16 Oct 2026 20:27:59 -0300
Message-ID: <20261016232800.536654-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX51 and i.MX53 SoC device code reads the unique ID through
syscon_regmap_lookup_by_compatible(). Their IIM nodes therefore need the
syscon fallback so the syscon core can instantiate a regmap.

Allow the two-item compatible sequence for these SoCs. This prepares for
restoring the fallback removed while making the IIM nodes conform to the
binding.

Cc: stable@vger.kernel.org
Fixes: d5b55c35e033 ("ARM: dts: imx: Fix the iim compatible string")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/nvmem/imx-iim.yaml    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
index bb37d72c9eaa..ebfd947e6800 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
@@ -20,13 +20,17 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx25-iim
-      - fsl,imx27-iim
-      - fsl,imx31-iim
-      - fsl,imx35-iim
-      - fsl,imx51-iim
-      - fsl,imx53-iim
+    oneOf:
+      - enum:
+          - fsl,imx25-iim
+          - fsl,imx27-iim
+          - fsl,imx31-iim
+          - fsl,imx35-iim
+      - items:
+          - enum:
+              - fsl,imx51-iim
+              - fsl,imx53-iim
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -50,7 +54,7 @@ examples:
     #include <dt-bindings/clock/imx5-clock.h>
 
     iim: efuse@63f98000 {
-        compatible = "fsl,imx53-iim";
+        compatible = "fsl,imx53-iim", "syscon";
         reg = <0x63f98000 0x4000>;
         interrupts = <69>;
         clocks = <&clks IMX5_CLK_IIM_GATE>;
-- 
2.43.0

