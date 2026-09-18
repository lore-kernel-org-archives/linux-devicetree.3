Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48B51DE1C
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755823; cv=none; b=Q4qn+kKYAZ8i/NGMk6iTBrTsVmFRPBW88xzchY6CnJ2sTj5TRrUGyRoWPIzbsXCMO8B5te/PGviKXO85As0/R61F93aWwKz2R1+CZNihc9soV8AX/8+JExF1VOg2PMQya/vIWIYi/2z5EiQXw4EPLIZmc3zgTQhs2Ov27tgXw44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755823; c=relaxed/simple;
	bh=YBz/fNivPq1vwrIF/3ctWHvnc0eV5z9yDefUNuc4klg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PtMxFk4OsaHclSvG5vAzdIgHz1JX7ttFuv2+UQi++HXH7vW2B4qM+zJTsJiJ5N/cVzerfd+OWRM49fnSlOV9zcV9NBUGnLZB2bJJ5ZRQrd9R5Ta0gtkETbXasZop56B9eS43/7Csxlm6VT9orq+2P9IJJMIh4xXZK10yNGOG3y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=SuWf8CAu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="SuWf8CAu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so6135595e9.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789755819; x=1790360619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wW+8cYbgKggIEm+go2m54nKeIKvweQLJNaK9nTromws=;
        b=SuWf8CAu/pFtigrVASv+aFrEFbiJY+MimDkMhFRboonjGErPQ9aRky5E7+upAkDAwR
         v82yvHhX0VJOUvurh+U6zfAvzvr+KtZ68WYiKF3CEvLVsIJ+2K+F8rilCVguIv1uUZID
         H4dYyoNtJXa9h1o+k+MB9bfT76URjMCcaTpFAKj7Ouwwsdy6fREtk7i0PXEjMFf4BdWZ
         FOTCLlA8dDB7lFpZq779AuJKuntiwfgt0eRKM1C/RXJ/0aDIlu06rOJqwbztuZXbGi3E
         IKfPMSwxAypGg/8hK6TWYFLSjH5QpBORYATmCUO7HDQLlq528SxrkuHnzl/L7Vokkgie
         Z7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755819; x=1790360619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wW+8cYbgKggIEm+go2m54nKeIKvweQLJNaK9nTromws=;
        b=V+PLhhhEyMQQzG/Z57J+HQksWlvtwLAXkTh6iOrykdqXhVVE2WUKb4gumRNvc1AmqS
         u0/tY2rFk9txXVcosh/uBDmXDem0qnzGoPAgSPg5id+5k+Fz6wAuzuvGY1+lbHT93uma
         RhEvs61z1HnUsj87xu7KW3lebOVfFK0gTSu7yA1tb8EUA9m4C0gTE89LQl+T9fWeVtDh
         9dyJzCuXIfLKx3JnOrxt2Du9+aBuMEadNtNPekaIvLi1GT7vEKzMk1HypxEO7qgClK7y
         ng4DKgufT6D9Dzv7PWusX8PJlT0PskO7+FGgjqxxMciq1OjlLWbxnjXofb5E5vPKN+6u
         PcXw==
X-Forwarded-Encrypted: i=1; AKwUvBxFQBJ2MJLqhQXX+AfaCHpkrv0wRFw/pgbDjKOceh6RSfKTqnvvgl1iFrlJl+DcaDDPF4mmeBUflXZc@vger.kernel.org
X-Gm-Message-State: AFuF++kymbVoh/fQbOjPCsB4CujOr0dfwFVt0S3RT9UNYTKZUggCTdny
	90VWRLfQaovsFDTniyOSrOka6O6ThX7/AW6eL2/Ucd2FIMvezPE6LNKQoItpkzTGL0M=
X-Gm-Gg: AYBFou3MBuxfaxNmcxvUsGURtUg+uwc6uTmvqwv+eXKekhKv7sCyt+p9uT3Q0nCNOy8
	NVp83mPyP88hZsaVTwGLNR4FoEwh1DMHewv49B/jroQJbA3rWjKifIYKRSNFNxXfXaq2+KSNIKx
	pBgOfa6n++6gUJAY0xCuxy9hOu/TYXmcrINA5ObZUxrj6zNUb5GLcMcPu30tYj6bfZl5FCWTA4S
	fPeHfH5ZA6raMydyJa7DYN5VBPLpClM0R1rlfrtgHpj9QmXTXKoFoJEpj11ebSBKog58v6Rvbl/
	fmDzf+At40zESjIbRoMVrMDrj04+w9M6/9x1Ptb3pQCT6twluYtcj1dm7atzHpS4NZ2nrk8HrT/
	DG8p9HW+xP4HAvULVGn+5jX3pgnr9fO0YK/Ska+QH9fTzmTS74h6Q000GwYRrF22R74XNUKmyda
	Iuo39uc3DCB04izpOt38krBrzqC85P03BImKUYOY1cyTnCIGKaS8uwNSXpNEnjgFihV22b35h4o
	k1V+82RHWDd6PlOFtEUq1bf
X-Received: by 2002:a05:600c:1f95:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fc5726c1fmr87929795e9.9.1789755818721;
        Fri, 18 Sep 2026 11:23:38 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm12159755e9.6.2026.09.18.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:23:38 -0700 (PDT)
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
	Karl Asseily <karl@asseily.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Date: Fri, 18 Sep 2026 21:23:15 +0300
Message-Id: <20260918182317.143223-3-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918182317.143223-1-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
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

The four supply inputs are described and required. DVDD is not among
them: the part's 1.2V digital rail is generated on chip and the pin
takes only a decoupling capacitor. The datasheet asks for the supplies
in a set order - AVDD, then VCCA about 200us later, then the two
output-stage references, and the reverse on the way down - which the
description records, so a board with separately switchable rails has
it to hand.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Notes:
    v4:
    - describe the four supply inputs - AVDD, VCCA, AVCC_DAC1 and
      AVCC_DAC2 - and require them, as Rob Herring and the sashiko
      reviewer both asked. DVDD gets no property on purpose: the part's
      1.2V digital rail is generated on chip and that pin takes a
      decoupling capacitor, not a regulator
    - NOTE ON THE Reviewed-by BELOW. It was given on v2 and this patch has
      changed since, by exactly the supplies above. It is carried forward
      rather than re-earned, and flagged here so it can be withdrawn if
      you disagree
    v2: rename the binding to esstech,es9039q2m and update its $id and compatible

 .../bindings/sound/esstech,es9039q2m.yaml     | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml

diff --git a/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
new file mode 100644
index 00000000000..15db30af4b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
@@ -0,0 +1,94 @@
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
+  The four supplies are all nominally 3.3V and the datasheet requires a set
+  order - AVDD first, then VCCA about 200us later, then AVCC_DAC1 and
+  AVCC_DAC2, and the reverse on the way down. DVDD, the part's 1.2V rail, is
+  on-chip and needs only its decoupling capacitor - it is not a supply input
+  and has no property here.
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
+  avdd-supply:
+    description:
+      3.3V supply for the part's internal digital regulator, pin AVDD. It is
+      the first rail up and the last down, per the ordering described above.
+
+  vcca-supply:
+    description: 3.3V analogue supply, pin VCCA.
+
+  avcc-dac1-supply:
+    description:
+      3.3V reference supply for the channel 1 analogue output stage, pin
+      AVCC_DAC1. The datasheet allows this rail to move by up to 15% where a
+      calibrating regulator tracks the DAC's output impedance.
+
+  avcc-dac2-supply:
+    description:
+      3.3V reference supply for the channel 2 analogue output stage, pin
+      AVCC_DAC2, with the same 15% allowance as channel 1.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - vcca-supply
+  - avcc-dac1-supply
+  - avcc-dac2-supply
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
+            avdd-supply = <&dac_3v3>;
+            vcca-supply = <&dac_3v3>;
+            avcc-dac1-supply = <&dac_avcc1>;
+            avcc-dac2-supply = <&dac_avcc2>;
+        };
+    };
-- 
2.34.1

