Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541548;
	b=1mSATmBxzwuN9l9Qd0QpL3JBEy6KXfHPYpN/F2izaoE20ijbFAhudWTSc+7pwXxuDxgL
	 xmfzlSHau/J29ob3kyCMx8puwSi80cQJGKz36Z8ou5SR1AfsDq+sG8XQCF7W8NIc5pDWV
	 Sbj1VH3LJ45dnQHCtOKAQgweoyakCxghj8DFmnc42R4HZqgaOp7DgfcHhN+tdntQKYRL/
	 f620dIOhIRUZ293ZUpHC9uKMRbOHpaXhk+85gcizVewiTazvIPIKEAFyaw3NILEidj9O0
	 Io8bJnTkQIvht7sswbYVusL0lTf9cBS9Gsi6jsXQVxFIs6JhMLWgqTQZlkEB+kmGSiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=V7ZSOMsXYdAcwhycQflcDLMzQhl4tW5MNdpWt5mDy8M=;
	b=rziX/xgucmj4vqIJkH184ygPSNgb9jbW9Tl/XoE6ZxV8fJZKTvuHuVYyyUIPX2uULbow
	 A+Mg43fo+A7hiDyzk7uorKRLOfngGzogarlIRhdcnKjzYraGA1G5d+w59xXxZwXPGe9Py
	 OeQm+3h4DhCzYynJYn1VoGgli3XjRdKox6D2tsI/sydqdvhfhvnusuHV9M5SwO7f7EblW
	 f3ZHPi81Yn6k/HHBqQJ3m70eg+0rvIuYIm2m6CgagQWFYAD0GeF0fmoe0/MUKkaLewY+r
	 VJpYlMOaU4TH0zprdGTy2Y/G3UZb2IRE92QfCWLCXLxMi7HaxbQzQ3yFbls9tLxDcaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BpJ6RwtJ;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D9860A2633
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D9860A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BpJ6RwtJ
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so2864078f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541546; x=1796146346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7ZSOMsXYdAcwhycQflcDLMzQhl4tW5MNdpWt5mDy8M=;
        b=BpJ6RwtJp5VhvEXIOH/3bDVpriA+nkklT+lEBQ+xJ1fLiehAeW0gCo6dFrMpPtSQuK
         ke/zClaDtLDEqFIkfXowzigpbkwH94ACz1Tth1nvOdT5lFDuIe8Q7CR+A8s9PhaGLMSg
         +ZppDh9ezrllnzKM20p8OhYWH3PLYJ1C1zsI5UoKufu6ueD1eIF0sRVNo0X+8UNuf7Kf
         ty/2UpQQxzKiE62WrzBCDJaj+QWIajL7gDpy0NM7yK+2K1wbjYomPN00yEry109OFK3p
         pBFmNaA6VHSx4GH6W2L3pdHibb3qNmEi3iXKai+F/yVvePY0zsYPZDTVx3vwc+ZrUYAA
         2T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541546; x=1796146346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7ZSOMsXYdAcwhycQflcDLMzQhl4tW5MNdpWt5mDy8M=;
        b=LFzddpX6fzEEY3LnpaB6GqTU0DJVCQWQco/Cq17VsWw9G8zzw76FBL4z+BYesedIXs
         wH/+3+piZqCi2/stxBBJyjHF93vaf+1Nn5lj29cKBNCdYqGz6EJT33iCfx6azjlaIegr
         z/El2X1K9m4hfoNAn8GJrBdgCRRAzHq/b9YXbvRzCyW7pc5I8iV33eRMHstZX/fperDq
         2ulBv62xqFoe8qO1QtOvvotBX9k4AuDn60RqRXSgYrteobpI2ZDTwu6rNI2IAT1ATYim
         3XmV3WJxohRgu3vPfUcaS3cqdUH2Gcbi1g5+zEX3Vwc51YDcDgacRHXEcNHC/iucX3K8
         +QRw==
X-Forwarded-Encrypted: i=1; AL+hErEYHg9Bj4VvqmDxrwlqZKXqYdS+8sjLXMFMOzkewjRO9zB7BFbJREsNesOxaxurQgT5TX9X5jJYJzu4@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mty4Xqwc7YCg/MPpVYtYr1z/Xix22oh0yI9ztC/k9A+ZX1VY4
	8ekx6V0V/40p5x8q0kdUl9x+AkyHuumMSVGhtitO3hLdGuynUVRJZ/JorWgVKdr7dW4=
X-Gm-Gg: AZFdTZcI9bD9xh6ByKFlOBfNQNazA11GJlXrrVcXrtbKCiwgRPq2JhPW9sYZbg3o8ZZ
	1cA3lDePpctjecekkRy5tuOJJwOmlU5oKtpaWE7Pe4dflr7KBPtLV68CBqViH1NM2eq8Fy5Z2sy
	lkQfLCQkVBsOA5jDAyXdA7IGTii4ZeTskwsLKHRfLflOlLmiAVLbI98G+7erqSHi0VFqYnls6Ep
	V+rLOEvbTqHwarvqI4FUv7Kckl5cigiq6Hze4e/ITZAEtVgJZXGwdFRuOyXpDvRBJaKC+phns68
	F+IXjCh1a3EtL0ml65moHQS4cw2Y/6isG3zf/hSkgU6wfPDe3Nc0FGhvMxdfpLKu1w2CBrHXHRY
	37sGTfQVmrSkz2rrGa9Hym9r8xQ5QPy+I70mfV+wFq+QgCGkhu8OlvK8dOUdhNSZDDT634gJ2DQ
	fj72/Z2aaUaYGoBGYPIdvEraTw5xgBk7GO/ip16tbIZnsQYeiJiy3lZ41Moe52/xLdTkrFS3szh
	b+fRqvAKqxeWNci7s7lZLRiwR/KFhieaXjiDSIe74LWOccZ4CwSLn0xUR9rfG+JUJyWRlYxq10V
	xxerMT+g9QXUvd+ylxTaAGAkzLaqKTgN9E+I9kmVRDwOVikebg==
X-Received: by 2002:a05:6000:1865:b0:4b8:75e5:301d with SMTP id ffacd0b85a97d-4b875e5306amr2896256f8f.0.1795541546329;
        Tue, 24 Nov 2026 09:32:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:13 +0100
Subject: [PATCH v2 06/19] ASoC: dt-bindings: qcom,lpass-cpu: document the
 SM8650 LPASS
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-6-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3635;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U1eEhA1am3Rmu5NcORdiBRTvDJRsaqBll4kDIGaC0o8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoc7YAZGjqvFWy1Hwr4StX2FIbeGMrz3KE/Uc+k
 rozWyO2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHAAKCRB33NvayMhJ0WYwEA
 CBD87Kf9q8Rx1GAQLQseBuF7Vwd8DcmTDESFe00xldXtQ+v2rFmEzYfk07dJhWibQHKpPQz7uJWwhp
 XhliW0ntXGQ5uj/gTgWjroHRkd9RR6Bj42yoRRr4/3yMVLmwlfm0/fw2KZE2AgekRykwwvxQCaORyH
 82/j7DC7fQ+aSZNwC7htfg3/J/syD9xcIsG5Qe0kdshsohyPkdwcE5GcU4sCAOuw3g+SoAtVIfVcDD
 Y3HyIqr0GJFX8N4XFsijbm915VZUk8+gxct55EXK8WIr5AQ+MUtLypCNIqCVctjILnfY/lIyzEFcgK
 cyT395KbWObZ2/0ZQJ2pGdD/OWJ+HBIG2KbsSFKIAi6SXcZMwdJI57rBrFospEfsVRh2aYgtvP2AeN
 qjABxSEBxPlnuo49RuKo1c2Q3fxTYTfCR1LZlXaUhqrMtou8YGReH4l6Rgyf80cR1ZTeH0+y58YXna
 PSRdpKrbCUnySWnobocJ5u9jdp97BcSRxz+WRSPVeusuegKsMXVZtnzHTLt2vnHXG8kSokagrRgHQz
 Cb9OrFFSp+fhOXiuNx/3ccVtRiMugXENWEiwKefGpCgYw3ku2hNYuVA3LLUaJEJYzhIhMS17unJslk
 aBy/ejlGDcsUMehb9QSyuKISnM42Ip7lxfs+I0+LitJadCoK1mVE/T3EQplQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The SM8650 LPASS can be driven by Linux through lpass-cpu, with extra LPAIF
instances, LPMs and clocks compared to the other SoCs.

Document the SM8650 LPASS CPU registers, clocks and interrupts.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 74 ++++++++++++++++++++--
 1 file changed, 68 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 3a559bd07a79..f431173a0e88 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -23,32 +23,33 @@ properties:
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
       - qcom,sc7280-lpass-cpu
+      - qcom,sm8650-lpass-cpu
 
   reg:
     minItems: 1
-    maxItems: 6
+    maxItems: 8
     description: LPAIF core registers
 
   reg-names:
     minItems: 1
-    maxItems: 6
+    maxItems: 8
 
   clocks:
     minItems: 3
-    maxItems: 10
+    maxItems: 16
 
   clock-names:
     minItems: 1
-    maxItems: 10
+    maxItems: 16
 
   interrupts:
     minItems: 1
-    maxItems: 4
+    maxItems: 6
     description: LPAIF DMA buffer interrupt
 
   interrupt-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 6
 
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -59,6 +60,8 @@ properties:
     maxItems: 3
     description: Phandle to apps_smmu node with sid mask
 
+  dma-coherent: true
+
   power-domains:
     maxItems: 1
 
@@ -241,6 +244,65 @@ allOf:
         - iommus
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpass-cpu
+
+    then:
+      properties:
+        clocks:
+          minItems: 16
+          maxItems: 16
+        clock-names:
+          items:
+            - const: aon_cc_audio_hm_h
+            - const: core_cc_sysnoc_mport_core
+            - const: core_cc_ext_mclk0
+            - const: core_cc_ext_if0_ibit
+            - const: core_cc_ext_if1_ibit
+            - const: aon_cc_ext_if1_ibit
+            - const: audio_cc_ext_if1_ibit
+            - const: audio_cc_ext_if2_ibit
+            - const: audio_cc_ext_if4_ibit
+            - const: audio_cc_ext_if5_ibit
+            - const: audio_cc_codec_mem
+            - const: audio_cc_codec_mem0
+            - const: audio_cc_codec_mem1
+            - const: audio_cc_codec_mem2
+            - const: audio_cc_codec_mem3
+            - const: aon_cc_va_mem0
+        reg:
+          minItems: 8
+          maxItems: 8
+        reg-names:
+          items:
+            - const: lpass-hdmiif
+            - const: lpass-lpaif
+            - const: lpass-rxtx-cdc-dma-lpm
+            - const: lpass-rxtx-lpaif
+            - const: lpass-va-lpaif
+            - const: lpass-va-cdc-dma-lpm
+            - const: lpass-wsa-lpaif
+            - const: lpass-aud-lpaif
+        interrupts:
+          minItems: 6
+          maxItems: 6
+        interrupt-names:
+          items:
+            - const: lpass-irq-lpaif
+            - const: lpass-irq-hdmi
+            - const: lpass-irq-vaif
+            - const: lpass-irq-rxtxif
+            - const: lpass-irq-wsaif
+            - const: lpass-irq-audif
+        power-domain-names: false
+
+      required:
+        - iommus
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/sound/sc7180-lpass.h>

-- 
2.34.1

