Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC14FB9A3
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858304; cv=none; b=jmoW30uz4K6+9HD5Z1vkl83jZi+SkqRxQH5qBFMuWc7eFFezvRSiplBpgN66Ny4BzKq8sgPupqsU3qONd4fi7MR/dYsmlvAWvv88ihPo3SLRsIAebgdm5wkv/hFxd4blH5bXivlnRGnPtRQQRc0n7tKu9ubVHSm3NiIFmFK7COo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858304; c=relaxed/simple;
	bh=cOTndiYvXLFAAAM2y9Xe4uyBomgWf+BKu0APrUCfPAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+y1vHmtjDI1300xVdbkc3cq4isV+4ss165FE2vqUZW8TNlRVSgBANzZgC0qWKM2a+HucsgpGQXUeqTMHi04YMSN1SWtCSa0BDBJVr9v2GMcYQDCa2+pPEye0qqH4nJnZk/gCasXJqmwl9H64SzKDuzMrvsvd7IionlcxPxLvys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmeO8JYt; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmeO8JYt"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso4700699a12.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858300; x=1789463100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=gmeO8JYtiOFIvUQvVhLHW5TNfGLV7PEyoufi7jtp1HSOyPoiHYMsEiwvVdjfqzrisk
         KcEtGO/mtcpZpVFLIm+4gLOWkWFN+eCDnMI8eM3nfw7vYfwE35ktMQiYmM2wzcbbKPVs
         IRdQeLuwUinia3l/8m1V8f8imtvp4/FvBsi2idDXVkczA/xn6bMynj41tj1s17LELv6/
         yUVVnFUvT1jWwb/LNNiZoNHnFlhXMWQ9+ZgzUn+fABMhKcVbjFPPB91rmawSaK5CdEVd
         MUfl6RaOB4+6q5KKR3HLRmT+qKUj/T6PaMi82ELZix5VqcAO8PJeDHI18uFEg3/GM9kk
         GLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858300; x=1789463100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=r//Qbhx3FPDM7RG9RyBgcNpjkszgSyBeGCY4Ru9r82Jc0A5W7Jhz5eSeFJEUL9kVnZ
         LSrxNwQmdh/88KV/zVSs2YM67pFdljNAACxHDSaCOMnzXnXl8oasXohUhWnJnqNQZNiR
         yhn7FXaM9L1kYrF2oefMbcD+Ycgmi67LwMK+O1oO9FcDMY88IKlmvWp0g+fvP8tq0uNR
         Y7nNA8RCbbcjooTsQC5G9+PJtNPHklaU6eyy+cEk81ja9wrVKKHSwOg8vrtPRncOmCID
         ToNm2LasiYRRko2UT+FT0HUanYJpLrjpSGgPtc6vR+UUHoYzJF15pEsBOEl5Q7VdFky9
         9vkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxL24kRIuPdl4PUjWvzXiavRFF22/SnojIOnWqZqj9WRGKHchjFWMwWr+aXsI6LvGH1LUXw7JlyPqvg@vger.kernel.org
X-Gm-Message-State: AFuF++kmwS5l7wiMnX6fcE/d5jU2L1YRic4oclcpyr4mixzVYXpiAZel
	m7eStF7ky3yGBjWKYtrqXTgtxEp1vkUHfSbL1PCqqsoDo7dyY1OJTGwH
X-Gm-Gg: AYBFou2Xtml/c1KqU89nd0y0/zOSwRStVNtAPyy3sVrBF+buwoq5xTMbYD7mqu9+LWy
	jkGj+keQmDXdCHPN9vwciKsejdIjwhu52wVT0UBC+9luPQkYF0LlvtUBLoXE8YQ0JlOIUeuyakz
	CERa41X1LjbHUS/0qUnGSot9EYp6DUIgqqDHbKk8YRI8xYuABBS7TCiNxE0oakBsb3Wpeb0wLJL
	vhD7tFgAZI06U5/3kGKKFoG2q8E6n3aSlpalzLHYrcCooJ1hK008SHheZHGm2N3190S6Wck2n2z
	BPOr/nkYUnHm8qsfpKnwmx1rfWOq7uYyEFYTmwbU60b7D+K7jfqI8D8H7onHEPO9C8o/2GL35GC
	0agjeDtYz0R9kDCpcM4lUzbHmhx4qTL+1qR5ShXhGQZwLkUhN/Fau1yWwOhRA5jtq5ZPaN+XAD7
	YXj82OYjYkZGbf6YUOiVj7s71tzAv45E0IVzFH1+cQI1T01cqk9FgcFkNSulZO4tbWAYJWNcxcc
	wqMrXzXU1t8SvYC2zHpaQp5JknefnDkvVnAwg9oiB1XmW1b1XZD
X-Received: by 2002:a05:6402:3554:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6a7e8d4d131mr18523650a12.6.1788858299489;
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/5] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Tue,  8 Sep 2026 11:04:44 +0200
Message-ID: <20260908090448.3332-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0

