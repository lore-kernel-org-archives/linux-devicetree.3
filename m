Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D52883F
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478128; cv=none; b=Fi+9jNxnpyps8sh7HemaUaTGnKEEdbACBxD0OJd3m10cOvj44cU2STge+tWF4vLAhDpy1OW6IFV8E6CeGqpehDedb7SYtrLrZwqn4icCa7r4KoomB7FCM5o4zDXuCgHJIcCM6cTaUjPAqjH1rbjkdR7A9+VE2JhcLJ8ERWv5078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478128; c=relaxed/simple;
	bh=Np9G5gcYFMRDuiPyTq0cvGyuqHDcYL3rC/5ZpAUxG2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXv8VcsTwPl90BPi3Vx3941rreNqQyhlc9slddklcbeHpaCXv+6ddGqbMdM9ZD9JHmpfE/TDNJR051cNrtfFg2q/sTqHtpUhrkD99wYpvYyenPu9sBrTiD3IhDHypZk+Rd4FnMR3IbvRVwQeGmrs+z4IpqZAcQqoRGNSQE5DbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgfFvznL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgfFvznL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a29e6110so18544635e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478124; x=1776082924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83XcChL1tExGxBWHgy0Os9L6mT6GQg50d1hbYCCziig=;
        b=jgfFvznLYGoS9VgEk4ZAX8GxpDK/i6Ddqc8jrcel1NhyHROwW+U1Ji1nONfGiRaWUH
         tAY26uRctq2MapmDe//mBVvuaeQVDyKgLC6qiG9POfHZMDUiP3675YLlHa53RwXoOuhI
         Iu7HDYY7nYP+oIecYqLcdaMj/58IOVCQSt1AI+FRv7rwVl6byFQ8EeS2fcaDgTSc3syC
         fehhbsGyzWDUhGiVa8ZyZZAJeSI0xov8SHz9dONCxa/2Cy68sjtC5hqpTCeFwdugYxaP
         lMteGqnUkgTHSnZIWDIzNmJ2vyBlK8PDzAfp8F0/C82y2z5eX313c0LR1B2fefxkM0aA
         XzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478124; x=1776082924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=83XcChL1tExGxBWHgy0Os9L6mT6GQg50d1hbYCCziig=;
        b=aVmg69w5bXE20fA+b7+i5BbhBkzUtJp9e+hevApxvwQP+zhrS6oQvLi041ZGUH4o/Y
         qk1uQcCPEA7U3qe0uIAVW8jMb8KPXc5Uel6vq8K//419pWGdiT4w5uhpwdqQRXiPsAXe
         AoPOdm5H4QMITPTtw9+tVtJ4aaGpq6LjTIi+6qtR1JWqwdW4nOvGvIuqRVB/Xsv+/Yw4
         BkEPfoFIts0QOn2wOg8jvHYAlH+zgDSQH9dmO+ewIb0zxozhs7JrsRk6nLehBxv7o+Jn
         MM3RdC0Ao2B2osouUrMzOJe4NusO+l33VKObVE/OcOJ9Ww6cji8eKDscqvdyllQzpCt9
         Oumg==
X-Gm-Message-State: AOJu0YzDn2X7l3RgpqfsgXgdMpP5HO6r7gHbODNN46buVbSz5t/ZF1WH
	9/czqE6AJS6SD724LZ7roBCfOrNMKM02k7ZT3vLMRJxtT11HFI+7H9H6
X-Gm-Gg: AeBDietHnDar13wIMnToge5Ln1oQtonyKm2wnZlnBr9mC/DorfshtAQxyyg7M9eCu3m
	fMa5uy1SQiR7z8qQrqNNjVLbvN6H/8hi4x5pIURomkpGbEe/bQfRbKoujNcOO819DW1jvP3lKhi
	3eUuVhH0ULj3vH/UQpX+dxZA2pqx+rTtpcd0/i7lbZkwK8EWSte1M+S9QL4m4U9cDZA+cJYhf2i
	V4ODM1QwWdewXbiP/1pQI+BKdTVoR8Efr4EBSRfxMlH8ZoP1zQz6BdMWmghfLXzegPS7oRWXhC+
	BzQ61ethFSWnzH9PZ+rp24oJrIAFEtHcrv5XrPL0BtAAfR1VcTBZv6JL4o+qIF9PPQYWES+JmJA
	M/3jVyOTwiT5xfVoSx5gFI5EqWGA/ylgbt+23ufZZHqULNlmyLiB7g0sQD7mQyeaCYANhT6jnKO
	oatirQQuLacNpbrG+pm6WXH6OXYYZFLCIKgKDoPKokuV2P07nAww==
X-Received: by 2002:a05:600c:8216:b0:488:ba19:da25 with SMTP id 5b1f17b1804b1-488ba19dbc2mr1321785e9.12.1775478123954;
        Mon, 06 Apr 2026 05:22:03 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d1c148sm138541595e9.5.2026.04.06.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:22:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/3] dt-bindings: dsp: fsl,dsp: drop references to SOF programming model
Date: Mon,  6 Apr 2026 05:20:23 -0700
Message-ID: <20260406122025.4515-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406122025.4515-1-laurentiumihalcea111@gmail.com>
References: <20260406122025.4515-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Compatible names ending in "-dsp" are associated with the SOF programming
model, which, at the moment has no devicetree users in the upstream
kernel. Furthermore, the binding either doesn't document all of the
required properties (e.g. "port" children are missing,
"memory-region-names" is undocumented) or the properties that are
documented are wrong (e.g. fsl,imx8ulp-hifi4 needs 2 reserved memory
regions, not 1).

Since the two programming models (SOF and non-SOF) have some differences,
it would make more sense for the 8 series DSP bindings to follow the same
pattern used for MX95's CM7 (i.e. one or more binding files, including the
common fsl,sof-cpu.yaml).

Given all of this, and since, at the moment, there's no plan to upstream
the devicetrees making use of this programming model anytime soon, drop all
the references to the SOF programming model from the binding docuemnt as an
attempt to clean it up.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 67 ++-----------------
 .../bindings/mailbox/arm,mhuv2.yaml           |  8 +--
 2 files changed, 9 insertions(+), 66 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index e610b7636a08..7970f90781c2 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -17,10 +17,6 @@ description: |
 properties:
   compatible:
     enum:
-      - fsl,imx8qxp-dsp
-      - fsl,imx8qm-dsp
-      - fsl,imx8mp-dsp
-      - fsl,imx8ulp-dsp
       - fsl,imx8qxp-hifi4
       - fsl,imx8qm-hifi4
       - fsl,imx8mp-hifi4
@@ -59,18 +55,18 @@ properties:
       List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
       or - 1 channel for TX, 1 channel for RX, 1 channel for RXDB
       (see mailbox/fsl,mu.txt)
-    minItems: 3
-    maxItems: 4
+    maxItems: 3
 
   mbox-names:
-    minItems: 3
-    maxItems: 4
+    items:
+      - const: tx
+      - const: rx
+      - const: rxdb
 
   memory-region:
     description:
       phandle to a node describing reserved memory (System RAM memory)
       used by DSP (see bindings/reserved-memory/reserved-memory.txt)
-    minItems: 1
     maxItems: 4
 
   firmware-name:
@@ -110,7 +106,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qxp-dsp
               - fsl,imx8qxp-hifi4
     then:
       properties:
@@ -123,7 +118,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qm-dsp
               - fsl,imx8qm-hifi4
     then:
       properties:
@@ -135,9 +129,7 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8mp-dsp
               - fsl,imx8mp-hifi4
-              - fsl,imx8ulp-dsp
               - fsl,imx8ulp-hifi4
     then:
       properties:
@@ -149,39 +141,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qxp-hifi4
-              - fsl,imx8qm-hifi4
-              - fsl,imx8mp-hifi4
-              - fsl,imx8ulp-hifi4
-    then:
-      properties:
-        memory-region:
-          minItems: 4
-        mboxes:
-          maxItems: 3
-        mbox-names:
-          items:
-            - const: tx
-            - const: rx
-            - const: rxdb
-    else:
-      properties:
-        memory-region:
-          maxItems: 1
-        mboxes:
-          minItems: 4
-        mbox-names:
-          items:
-            - const: txdb0
-            - const: txdb1
-            - const: rxdb0
-            - const: rxdb1
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - fsl,imx8mp-dsp
               - fsl,imx8mp-hifi4
     then:
       required:
@@ -191,22 +150,6 @@ allOf:
 additionalProperties: false
 
 examples:
-  - |
-    #include <dt-bindings/firmware/imx/rsrc.h>
-    #include <dt-bindings/clock/imx8-clock.h>
-    dsp@596e8000 {
-        compatible = "fsl,imx8qxp-dsp";
-        reg = <0x596e8000 0x88000>;
-        clocks = <&adma_lpcg IMX_ADMA_LPCG_DSP_IPG_CLK>,
-                 <&adma_lpcg IMX_ADMA_LPCG_OCRAM_IPG_CLK>,
-                 <&adma_lpcg IMX_ADMA_LPCG_DSP_CORE_CLK>;
-        clock-names = "ipg", "ocram", "core";
-        power-domains = <&pd IMX_SC_R_MU_13B>,
-                        <&pd IMX_SC_R_MU_2A>;
-        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
-        mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
-        memory-region = <&dsp_reserved>;
-    };
   - |
     #include <dt-bindings/clock/imx8mp-clock.h>
     #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
index 3828d77f6316..d6ab66f6f3d5 100644
--- a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
+++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
@@ -192,16 +192,16 @@ examples:
         };
 
         mhu_client: dsp@596e8000 {
-            compatible = "fsl,imx8qxp-dsp";
+            compatible = "fsl,imx8qxp-hifi4";
             reg = <0 0x596e8000 0 0x88000>;
             clocks = <&adma_lpcg 0>, <&adma_lpcg 1>, <&adma_lpcg 2>;
             clock-names = "ipg", "ocram", "core";
             power-domains = <&pd 0>, <&pd 1>;
-            mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+            mbox-names = "tx", "rx", "rxdb";
             mboxes = <&mhu_tx 2 0>, //data-transfer protocol with 5 windows, mhu-tx
-                     <&mhu_tx 3 0>, //data-transfer protocol with 7 windows, mhu-tx
                      <&mhu_rx 2 27>, //doorbell protocol channel 2, doorbell 27, mhu-rx
                      <&mhu_rx 0 0>;  //data-transfer protocol with 1 window, mhu-rx
-            memory-region = <&dsp_reserved>;
+            memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+                            <&dsp_vdev0vring1>, <&dsp_reserved>;
         };
     };
-- 
2.43.0

