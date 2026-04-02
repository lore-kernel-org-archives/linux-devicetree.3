Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE935DA56
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775109403; cv=none; b=VfBNJLGaBQZu9S7fMaiXIXoVtSsgHWnTXHYGt+wAgDQlm4Yhp6LwPGLz+1yE4RDPO5YPlSCqIT/BRsRKLyIN7KDR6SwbgAFSKCZIaYd4W09j9vVPAffZbasU+d1o6aHXnOoHeHtLGK2+xIme5rTZ6iNIQoJphd7xddA+R3VFwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775109403; c=relaxed/simple;
	bh=XkR+zn4k/BCu8qKphCVhxX3i/GSEgiXeHl/XYDStLuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJkHscDSm0xlub0uM7SqXAg4jCmjtZUdF1LODyRejuEaZUVckTbHJJKgzGK6w2XpzDjO3aln82eSXQphtmwoePsTg86bbgw5BfZ5M6xCT/XcLKIgoC+xCc7ZEo+6/BhW3KSCPD+DZHtiIRkLNhcfFY0fuQPD5XGyUForTA6Cft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAYUV7Sp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAYUV7Sp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cd6614a90so221381b3a.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 22:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775109401; x=1775714201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPa2JorjoSVyHfMjtpIZG1uYQS3gSdgtgYbveNq9dMc=;
        b=SAYUV7Spk66xHyqjhCPymWce4P79LZ4jhthD3R1RfcuTouAxYVxMczfaK27SgaPksr
         aHdaNhujyXa4sqX13Qc/Dd0/wNOeS0sjHpBmCNAPz98ixwfYXAgagec8fS4WuV0jwYrL
         CQBw6KkO82lIo+KMnAUG9IqfuAxyxo1f4DMYMYXCD9XodLrj9c5kNZK4H3RbkMfhfVW/
         C7J9jmrEPVtbX6+zmcLuYrOPdJvyYKlg/Gf5YZNlSwfshvFZqyVURwaiN8+yEDjhxKbJ
         Lrx2+xKUV4o/YlYbYFXe5GBO8XNwqOZZeJTXogQXsQuD307dp7937TLQk2JIZYm50VFE
         lroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775109401; x=1775714201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPa2JorjoSVyHfMjtpIZG1uYQS3gSdgtgYbveNq9dMc=;
        b=Ody9M2yE0BEGlbGmHBlsW5P9KVcJHtbS51YhDW3O606VpeTCDn+eO6A4qlRBsek7u2
         5MvLN108GEeBTJwNu3ZtGOeUGqGhTacM/+HTfOREvaznkqTdfuiFbAoLLcFGVlAhYSjq
         /EJ4Fjd4OTcW7jSg8ZP2iQakxUE9NMbm4SJnQMgaEPVIuftB63Lqq9cAi5MICpmfEFAJ
         TSwcXn56tflYGahENAHNjv+oM5I70acwPRnE10PTDvrISEl+kwGcuVQAF/9/bot9QYCy
         elPuya+8/XT/5PRKfNGf7UuYH9PGf3ilIp3TYOtgOZs2kN+257zth7bewv0UzodA8ckX
         qVzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwGaJPf/DipA4OLtyGSYdytPOzGz7TLm66OYVNuSuRhtO3YW4IIzQz650OX8C1KQFlpeYrO0sRES0P@vger.kernel.org
X-Gm-Message-State: AOJu0YyfU0puXUA8TJYj5ELsKHsqg70ULuDzGNdBwPJiasizsE7vs+xx
	IxKr83dZ7VY36oBPqBQrMVziOdkgxEPcMdfz0GpUgX3qADUuo3uQKv+u
X-Gm-Gg: ATEYQzxwyjGpd5dtj85qz9UbRRWJZFZPyAJ7vnFj5oB+ecH6HwhqJzF20sHBc/xwzvX
	qRdf27txklYoL/pi60SoUKUyUXtMgnZz1li8wkkhnzTW5MVAL4SH99ZALqyLuqaAbvEUj4W5IZw
	g9A6GNlFAfSRViVqzbIDkdG0oScvXzKZBmWZqgukTJuMoS3xmLFwUKsKuaS3mw0TsxZyc1z+Dks
	RPwmYd0htwWqONyyobyJMmER2MXg0TJj6CpnNpFxRzxk8TNDC60NYCDUtzpv5LSKyclK5EKZmd1
	LeGfVHygEZ5YMX3iTrXb7Aa8TRWR7JrZYpFyvRbLUZVhLRhpJkqAvL7/QacxGl0354LEWAm5ldg
	PvgCQAYhf7BOlszyDC76E/Dj2+KOBIfrcJeptWI58dVU6+ngm2ysv093pFMAqlCymLrKHnwqqch
	obTS22eRH9DVwTjT3VRcp1qL24xVyaCZ+fUu56VQ==
X-Received: by 2002:a05:6a00:883:b0:823:3079:7c7 with SMTP id d2e1a72fcca58-82cfb9011ecmr2049074b3a.29.1775109401437;
        Wed, 01 Apr 2026 22:56:41 -0700 (PDT)
Received: from localhost ([2401:4900:36c2:bd58:77d1:5e5f:850b:d2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm1760623b3a.29.2026.04.01.22.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:56:41 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anushka Badhe <anushkabadhe@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: rockchip: Convert rk3399-gru-sound to YAML
Date: Thu,  2 Apr 2026 11:26:35 +0530
Message-ID: <20260402055635.8798-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the rockchip,rk3399-gru-sound.txt DT binding to YAML Schema.

During conversion, property rockchip,cpu was changed from phandle to
phandle-array to properly validate existing DTS usage.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
This was the error reported by dtbs_check when rockchip,cpu was defined as phandle:

sound (rockchip,rk3399-gru-sound): rockchip,cpu:0: [211, 212] is too
long from schema $id:
http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml

This error was found when verifying against
rockchip/rk3399-gru-kevin.dtb

 .../sound/rockchip,rk3399-gru-sound.txt       | 22 ---------
 .../sound/rockchip,rk3399-gru-sound.yaml      | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
deleted file mode 100644
index 72d3cf4c2606..000000000000
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
-
-Required properties:
-- compatible: "rockchip,rk3399-gru-sound"
-- rockchip,cpu: The phandle of the Rockchip I2S controller that's
-  connected to the codecs
-- rockchip,codec: The phandle of the audio codecs
-
-Optional properties:
-- dmic-wakeup-delay-ms : specify delay time (ms) for DMIC ready.
-  If this option is specified, which means it's required dmic need
-  delay for DMIC to ready so that rt5514 can avoid recording before
-  DMIC send valid data
-
-Example:
-
-sound {
-	compatible = "rockchip,rk3399-gru-sound";
-	rockchip,cpu = <&i2s0>;
-	rockchip,codec = <&max98357a &rt5514 &da7219>;
-	dmic-wakeup-delay-ms = <20>;
-};
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
new file mode 100644
index 000000000000..10001fd2f886
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3399-gru-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROCKCHIP with MAX98357A/RT5514/DA7219 codecs on GRU boards
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    const: rockchip,rk3399-gru-sound
+
+  rockchip,cpu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandle of the Rockchip I2S controller that's connected to the codecs
+
+  rockchip,codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The phandle of the audio codecs
+
+  dmic-wakeup-delay-ms:
+    description:
+      specify delay time (ms) for DMIC ready.
+      If this option is specified, which means it's required dmic need
+      delay for DMIC to ready so that rt5514 can avoid recording before
+      DMIC sends valid data
+
+required:
+  - compatible
+  - rockchip,cpu
+  - rockchip,codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "rockchip,rk3399-gru-sound";
+      rockchip,cpu = <&i2s0>;
+      rockchip,codec = <&max98357a &rt5514 &da7219>;
+      dmic-wakeup-delay-ms = <20>;
+    };
+
-- 
2.43.0

