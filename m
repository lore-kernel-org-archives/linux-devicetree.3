Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBA3F106C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701223; cv=none; b=Jf/ZnqDdY8Z68m13Do+97FoS+0Z3edVkWNP2MC4vH952v1qhNFEjkLgHQTW2FXwN/+YEMbPptaqmRelRnAGF20IEaw0OMzrYfIm3jsHEBksS8B2g7CDuzCA7OPe2RFfemNDGBHcIyRl25KLtInS92KjfzFnOQBzapkW/gXrvleg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701223; c=relaxed/simple;
	bh=fhF5eyedH2gXD/2uR68oyWbe5657S6ghrkVsIg3OrOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mSlYdX9eMufRXWyonT2/x5TuuWq3/lhehvAmmKFQdneEHdvTehgAMkfR/f+7F/ZoYwQ3kTDKShONhFvBLuH27HobIxWb4bJOVD+aBd9eKCkmDXgJHJ+php7VqR4ky+0irR1b8eh4V9sMhD56jB1odoQSOFLrLWsh2J+jcC9pDRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=TxUc+/nY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="TxUc+/nY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so602615e9.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701214; x=1790306014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u38MAgQ16EkssZf3acMydlSoJl569lszmJMEzuVuQGs=;
        b=TxUc+/nY41pRjp5WQI0BvBfKtA+fXz/XFkf2p+7k5QG+s91Z2J3KqEVAUTcoW5/r3J
         7C2WlW8ytqnMGFGG2/FFP7PNrka+GyNDyJLnYSImNnRiZLkqhTCkDbG0ktnqg4VOwuRZ
         ssrWvKu0ZRZHtMGORfVYtck/XNpoiDo4nHhKEJjAShjVsdVc1r9YtZqEy9nOquNvUDj8
         bqbKw50sSQDwjogw8VchmzwGsiofFbywAleD90xezL33usnpm9kyiQcY0QxnZZ/nO1Rg
         3Jjq7hBIcwOKyjSd49xhOy/RmW8ippAr8FlA9dq0AvesfT31rLThlMAPCaUr0yVHLDcN
         yePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701214; x=1790306014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u38MAgQ16EkssZf3acMydlSoJl569lszmJMEzuVuQGs=;
        b=sAPdMb43vk4qrZieEwINcxTj+6sxbOi9UgPi5KgHrAscU9SaqNvoew7DUBdY/AsaPn
         E/rdSCQrnRnTrjSqDyXZrj+UE0luF4CoCH2zH1MDLSNyIBiaRsLBsVk+63+xPCNa0DZO
         +7ddWIhuYLl5OufhxCGlPNVUwq98AWIeyRA88H6MoReYvypCIqc7oPx7O12YvjIfnfuq
         w+NxA9S6CBe26ZqVOFNqYCitq2/ECYN2mxpJj5QB5J/UR0qdOIIOfcfooXH+yKGoTnCH
         Vw+qn+1lWeGGO2JVk7vsgQK5393oXdJRsQyrmRNTSpTbsRf6VqA6qydexQAs+weuu99E
         qStQ==
X-Forwarded-Encrypted: i=1; AKwUvByZeSC6nxtl+cQGPz7yHQ2LdOLnHHNIUsenMIv5YoBnClkRfmFBPOOyMRatxmnsyL8IKoobYnTt+l9k@vger.kernel.org
X-Gm-Message-State: AFuF++n0zPQlFBzrrnyDJQsYXJ6oJNFdkLgpxiekcEqzO0GmzhOpI0U5
	QHSlg7rgMebayMzWlf1nZz+NEZcs4q5rFVmc/pVP1MeIMFUz51eeKTSq7jfl7RUhvXM=
X-Gm-Gg: AYBFou2AWOSzCPGH7xUdKLXNMxQc9l4e6vMfGCDdUHA/taHs8dbW0kHVMtvLo15IzGJ
	EtjeqsyGUexuK5PMcsBnIyf7A6W5qC2cfoCirPS0r8zBOFuJKMWPQ9fYJ+9ifQGWT4lQCQvXsw4
	+Lo80EewT9TCO66M6d6EoCtDkaMxW1ARPF0zzLBH5aPXckNe/lNNjGQ83F0WJXDAyb1eeoWYje9
	+VcK0xj5Qc5UMXpen7AI9E2E7D8IQtdmdD17Sfq9PFKpE4kWQKMlg39Sgf7JhLbW1cpBvl5cUKY
	65vZzjusQ1Lmzf7Vt9ySyJ+BQksnwmN8RB6765PvYkSA6cupanW5G65YiqdgQ68wVuELzewf7yw
	dj0V7/kzKXCtfPVnT3HOQ96N44eZYJHRefzQchcpnZaRYX4XPWXBwdTucDVFfmTrG9Vcs/0VhLi
	GgcO0VpZIV308rjIUOse6H7C03JknSGNpfiqdm6hT6ksyHrdfTUpINgxCftoncy3nch261FHEXd
	zqZghMCgG0VgQ==
X-Received: by 2002:a05:600c:4e89:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fc4ff40a9mr14608025e9.9.1789701214531;
        Thu, 17 Sep 2026 20:13:34 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:34 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v3 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Date: Fri, 18 Sep 2026 06:13:24 +0300
Message-Id: <20260918031326.68542-3-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918031326.68542-1-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the ES9039Q2M, a 32-bit two-channel audio DAC with an
asynchronous sample rate converter.

The part selects between two control personalities with its MODE pin:
hardware mode, strapped by HW0/HW1/HW2 with no control bus at all, and
software mode over I2C or SPI. This binding describes software mode over
I2C, which MODE = GND selects.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: rename the binding to esstech,es9039q2m and update its $id and compatible

 .../bindings/sound/esstech,es9039q2m.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml

diff --git a/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
new file mode 100644
index 00000000000..c1d03d3a855
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/esstech,es9039q2m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESS Technology ES9039Q2M audio DAC
+
+maintainers:
+  - Karl Asseily <karl@asseily.com>
+
+description:
+  The ES9039Q2M is a 32-bit two-channel audio DAC supporting PCM to 768 kHz,
+  DSD64 to DSD1024, DoP and S/PDIF. It is controlled over I2C or SPI when the
+  MODE pin selects software mode; this binding covers the I2C interface. The
+  part contains an asynchronous sample rate converter, so the system clock need
+  not be synchronous with the audio bit or frame clocks.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: esstech,es9039q2m
+
+  reg:
+    description:
+      I2C address, selected by the ADDR0 and ADDR1 pins - 0x48, 0x49, 0x4a or
+      0x4b for GND/GND, GND/AVDD, AVDD/GND and AVDD/AVDD respectively.
+    enum: [ 0x48, 0x49, 0x4a, 0x4b ]
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@48 {
+            compatible = "esstech,es9039q2m";
+            reg = <0x48>;
+            #sound-dai-cells = <0>;
+            clocks = <&dac_mclk>;
+            clock-names = "mclk";
+        };
+    };
-- 
2.34.1

