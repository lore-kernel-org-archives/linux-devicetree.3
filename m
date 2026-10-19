Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452265;
	b=Sjdkw65BzYUwsRw71fkdbRc61vi2Q3ojbbvQ/gxy4Q36HvcxP+aigsmboONgM6xz9EL1
	 fE/iVFKelNQItdzmQ6xK0B03u1eGKfX27IhbHeJIxBcbnqKe+k6vW+7R1qcAOXADXMeL9
	 0OlhrLkaOzgloFnyGrTiW8iIEw/3P2VBMHPfm+vYRprhqSyQgU904jJZHCKlRKKpwDMTn
	 kUyu1Rykt7ETSxJtvoN3lLySQ6CfjACfuOIp+7RO6LUQhI/CC0+/26m9gOXYAU/2zxZqW
	 axKJjAf39aL1PVNAaq0on3Avi+dkjGS0O3Vdz1puJiKeXz96uEGa8BNtayppEzbTD/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=JvlhCf90Re1kDtgTiZK+tx3ae+wi1SmUUT6aDMnoa1PNPpCyqqswqU0xBCCUwmdzHBym
	 NnpxuJMfyB2IfKMeAAq+wb7gGwYHDF+iYWXl0aw2cqyJF2abdyaNWSJn59WJCLE0YFZQ8
	 ChdhsNIYM+7qpwmg1QFRe+bm2nioM9/qQNooauu9mEd1IF/slveuce3l0AI/onaWSgQ7I
	 Q9ymQJfkXElvuYmXOcIZLKNPvh3BfJAdB3Va+f8X8RSM18994Lo7NHIDo4Sjsfb//wDHm
	 DTXbOyJCbPlHEF2AtQ/bfOyFKfsLzoDbTwXhpAEInt6pX6d7zqfj4sOEavOVg5kC4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlIWEzYZ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A657D606A32A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A657D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qlIWEzYZ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a01933b584so18706915e9.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452263; x=1793057063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=qlIWEzYZWTpLVZ87fQOhoefZgH871KE0r26083GLDjuoH/SAIxZVs7eYsZjYy9sOXe
         AFiP7hq1HhBBm3mU2mA0DWk+XbxilAYbQL/TRSrZG9v9291VXlIvGLr+S4RLbkXgB9Z8
         jZ2jsX+M3IN+ahxLBrzONvjRmfLvP1lHuuokE4mo1xZQC1+BYiKFULyD1TcH/EB+D0kW
         1k9/7zqpRcgWiee4DFOKWpS+A5RIO3Yt7HxMfFK+uvLX6ikTXuLDC1U1cTnknkUytawk
         TdZ9rgtQ0uT1dJgd13knkx+MhFw21J5p1B7T4k0WhsOr4XO4a9cA52OoPaYGxyYKBU7b
         JEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452263; x=1793057063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=jxsccF8rTm4bsoJ02LHvcc5JrVfG1pZFvgAEpszwrI5d8P5HXgioLhy60dzLy9Hg1v
         BdFialGW7O4OrJCzSM+Q0myASzrfnFqKIc86eNxmYJiHLAYtM2n7+wHZHK5oq1qqpcQr
         ml9ldJete6UmKmXN6HdxFuM9lKKYsGqRg+mNusrr32yGKkcnPfCNv55LZN3Wd9IVnNtQ
         6/scheM8/LbibTeqjASMKRHHNnpDuvNP3xwNXoCrx0lP2zaBzvk4tAspST2e8Bilc0L6
         FVCTf/oQSOMQ/4wHuNNYIZPOKIGioSpTVSYDRgU6jQSvyg4gehWYmK1PQaG+4EOGky4I
         /1BA==
X-Forwarded-Encrypted: i=1; AKwUvBwxXhFhvgvXCQJm+rWjVmnsbxoV1V/Kz80Q4enC96uK/avmVtOpZlaHJNLHhgUv134e3NvgErSbe8su@vger.kernel.org
X-Gm-Message-State: AFq9FYJvPbRMg237Jd2r5qeAvodzDUImINqARAMuUyCwyCHb/Cani5Bd
	AH98yNQaI14Tp5FQe9rKew42d/EtKk4PJhmwhimnwb1jKRN5Z1sR2Ysm
X-Gm-Gg: AYBFou3GTopyDzqGKMe9SO+KIhElUH1/3GInNkxXPAcy/x3Iqf4mBVYGy1M7kBWWVN9
	Usg1dIDicW1xe27sxOX6P7/aho0YFwKDRfFNNOtzENUeiL3gPQYItsPM4KqmxRRnUHJYhaIHi5M
	Kc1F7YECmyVHnhO/z2dVadSI+HhE02qXIA/4iVZSmqv+GwBBx4vVAOUe2uV/0mnQ3SiFsZYxS+U
	DqUAPUVxQ8aT0fhkU8Lwh5UdejZoG3ViSV/T8Z5JLPlaamuxsmsHhLv2CyzKWND7kvejNNqUU8T
	55Eu3UEJKLcgRLoCzX34vIbfbDAoPfJ3N/+1GUujGelkLkauYwKUNo9qVapEZSdXm6qoV0OffIT
	R8MMuEtI8O4OXvSNTxZiTDPOarR8sK5MRQ44tCMzQu3BKkR7AuDhBF9HxabqrU0SthOUvlSPUVH
	Aja4xrbyerC8MkJVPEYA297VxdVJZ92/2E358y9YwX852rhKRGD32w6/GIKuzf9R3wEB3IQdhwl
	cQcJDrnLLM4oFe3cxNJtLV2gphoLRwtlP20Schg7MZY6M1Cydc0KbmKaXsKieyFsZIAxV6IT4dl
	s9g=
X-Received: by 2002:a05:600c:4fce:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1d75ac25cmr214576945e9.1.1792452263000;
        Mon, 19 Oct 2026 16:24:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd348asm26244055e9.11.2026.10.19.16.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:24:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Tue, 20 Oct 2026 01:24:10 +0200
Message-ID: <20261019232412.516028-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019232412.516028-1-ansuelsmth@gmail.com>
References: <20261019232412.516028-1-ansuelsmth@gmail.com>
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

