Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340375;
	b=BKk6+NNu43CjIY57DhJkl6Ouj/pvGQk7m470NkQ/eFDLFRWLsVxXw9o8EI+UA+dZOxgU
	 Q2FuGw/cdSPi1E8lL9kAdGQV318XAB7hWO8jq5AgEo7rXbud+JjF7gxBhHyEVWkTOg+MP
	 /pghcyZcAY8bdAJZsm4hsK98UsKxVVLAwilfcMgpHDq/Gc1OYdHecd66iA8bYnarIef/p
	 km+kRjKxpx1q5sTJ5uw4qs1KTUccjye+ybC0c+rygoeQhX62f0S/jG/9TlsinS8jdooJn
	 MEwF+Hii4Ft4Q0E6qANQ+o/NKAJE8blbvw+vGeLnHnhg5wYVTRKk/G7gKNDqcRPHbrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=XK0glUGtYh2qenvIp5qWYb1mVMZVDWpeT01ZIqCTHss=;
	b=oFT7EL2x/n6Q2kms38KvJP7W7kjnwwndrd2Xe5Dy2RG6XlFiM68YBUlbOJknxF923L/X
	 ttLIdAp37+VdY+phbz9zHIUJSDIwmLraEjtyeVI2qWvgn42m93qzcHn2y3rBeJFSHqCqA
	 Q9E4m8gA0IP7TtszhwhfHPU9bBrae6b0VJJCNYDgX5mFAV1gtgtiXprGNHM19e3baoD7S
	 VnVovfbF96AxOXSH4ugYS83T9ZH9yWADQD5Q9hdSAzXr8JcxgGBQy+mhq6GXyt8Vzkfwg
	 uEP4m9A+puAI7jKyApRoBZKiSDPwAEv0xeqEj3+CPNAV9fBCYHZjSLlGImUfMifZQlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvKc+S5C;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDBB606A334
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDBB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvKc+S5C
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36ecc11bd26so287081eec.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340374; x=1794945174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XK0glUGtYh2qenvIp5qWYb1mVMZVDWpeT01ZIqCTHss=;
        b=gvKc+S5CLxUYAye0zrhTm1rEdr8R6KJpXFKE9ItC4AUioMkqErMof+XzlAb807xC/C
         yMMaIFlJ1xsWUD0ThK8F3QnkoR6BnB54EraFAvsLniIthjoFsH7MeMjL75sPC8q7upLN
         PAM5JJyKuCUAjzJ9xBwnLkX63Vvd7CSKh/aQQNYJWOtPhaKGrOHFYcpHxFIK/0HqvcOR
         XR0w4qKtvRSdy4ieIolCIlJ5BEl7YRj4qFxjy/9YB0EctPyu9eUttLQRBm9vWRm2C19P
         tbEPN7nmUZH0jDgL9U4zfy8saqUImMUR7YkLB3vbNHqeYZj0dX5OhnKn+prhAskEjynu
         F1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340374; x=1794945174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK0glUGtYh2qenvIp5qWYb1mVMZVDWpeT01ZIqCTHss=;
        b=WIuegKeO4l0sV3OYVVDT5eneyZruiPrXJ/rgCKB3Hkxt5NaUNH9DMeQJbkZM68U/BY
         XY2TFALLaxNPCxFnJKOSieeJJB4soc6tc9QTbF8qid3WWin+v/GqeGJIV4WoDquYjwNB
         LCFG03+elzltiKvbQRKhi+MMPvNwqQC/8bECBL3E1IcdZNnebYxu4qnBe+uc+F9Nt9ta
         zjEnsEJi3/vGslAnTwhC7bnmkzxn0kxD6JzAQs+TVFUrm2qm+1pnhOqBFZW2wfccXYQI
         fyBwsj2JrTvcGclYCSJpyiq16vzwKYYhzhSnHS4z3jLyJChtPqMABtV0u70uMARZJE1e
         Ff6w==
X-Gm-Message-State: APuU4Z/aRCaCuQKSKq0VewSR02oRVVhGJOpp6QWf4MJDnu4uJR8TFQ+P
	3y6h2op34YpMUakenhqF7rqqUsG/VYHKwBQr6hkgJPKx2lfPJ/vxmnMd
X-Gm-Gg: AYBFou18Ac94BCwYBaLHM7SZq4PTMQvACvY8XuO6uxvD9SLixweoUuOEktx+nHeztVv
	fYLQlvZy0psJMCBY5j3PXy4vVRwlPznnMGig+sctHEp9ZgYXEol6TRhQSxm8vQ0QvsBeIs7VSNh
	qL6eDhRd4YH+pUOyfvWrpKg0x7a0JvJtV0J7c+sLDnmmX6mUzJMH1Ef+ZKB+kVfG5yX/dIU5xEU
	XcS/JxdWFQZAC7FPYBfGkiMzHKo0LwbH1nR1mHX7OFGwonvKMvc/5CIfQc0gQyU+b1cwHuiDKVf
	iEFsXTBCve21a+utwXJ8OcQb9FSjpx6WqOdIUNWXbxROmT4uBiF7GL8LjxkXkXrK58vOMhn2Gkh
	voLcGpjMVNKJDEYifbQS4V4uPDN4NtOXbUtmrHyr5EgTbN47g/AN7z5FllpOgt1RGHexyU8DxUl
	F0QQkZ6DVTLQjPGoddZhm5miea+oa3lQAOkM1AdEUhtc2LUoXkrcx72oJN8gLN31CYcK3WB9Fki
	3N1x161rd0P4YMWYt+aN9odjpO8xRwcj8k8riX/f10ydgkMnDkUS/CeySvsf5/Yy3IK8epWUX7J
	odqJdxYGHsS0EWU/L2WOXBFESVJdZZiGux4ZTDbgK3loujeaERZ8LyjXmyZO
X-Received: by 2002:a05:7300:f547:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-376854b73ddmr592563eec.2.1794340374097;
        Tue, 10 Nov 2026 11:52:54 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:53 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 11 Nov 2026 01:22:32 +0530
Subject: [PATCH 2/7] dt-bindings: arm: omap: document missing AM33xx boards
 and SoMs
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
Message-Id: <20261111-ti-omap-dts-fix-v1-2-19022d1ff4b4@gmail.com>
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
In-Reply-To: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=2257;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ToVc+9KRI9uPv3z9Dm2qjNBtZIyu3nXqpyevUzcgwDM=;
 b=8WjKIkFnAI1eIHACbL0SOi2MHdaM4Wq2VK76kK3l3tauEuAJpu9+2Ey1BzgL4mnC4IBQPb6fG
 DR7VRvyxg2BC8HHrC6Q1bFOazeYDIMIVJbBfOSdKvydA/rBM5qZZyZH
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several AM33xx devicetrees trigger dtbs_check warnings because their
compatibles are missing from omap.yaml.

Document the missing AM33xx compatibles (Bosch Guardian, Gumstix Pepper,
Moxa UC-2101, TCL SL50, BeagleBone Blue, AM335x EVM-SK, and VScom
OnRISC), add entries for the EETS PDU001 and Newflow NanoBone boards,
and for boards based on the MYiR MYC-AM335X and Grinn ChiliSOM modules.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index f694dcbf23486..c97eb4953ed25 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,13 +104,22 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - bosch,am335x-guardian
               - compulab,cm-t335
+              - eets,pdu001
+              - gumstix,am335x-pepper
+              - moxa,uc-2101
               - moxa,uc-8100-me-t
+              - newflow,am335x-nanobone
               - novatech,am335x-lxm
               - seeed,am335x-bone-green-eco
+              - tcl,am335x-sl50
               - ti,am335x-bone
+              - ti,am335x-bone-blue
               - ti,am335x-evm
+              - ti,am335x-evmsk
               - ti,am3359-icev2
+              - vscom,onrisc
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33
@@ -136,6 +145,20 @@ properties:
           - const: tq,tqma3359
           - const: ti,am33xx
 
+      - description: MYiR MYC-AM335X SoM based boards
+        items:
+          - enum:
+              - myir,myd-am335x
+          - const: myir,myc-am335x
+          - const: ti,am33xx
+
+      - description: Grinn ChiliSOM based boards
+        items:
+          - enum:
+              - grinn,am335x-chiliboard
+          - const: grinn,am335x-chilisom
+          - const: ti,am33xx
+
       - description: TI OMAP4430 SoC based platforms
         items:
           - enum:

-- 
2.56.0

