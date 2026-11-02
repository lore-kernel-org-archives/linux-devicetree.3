Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650484;
	b=C4mXj4GaKqP9qYFcTxL7CnkgNK8bSv5Hx01AIBVe5ZdsOd2Up26qKVqjAgKZPUORxV9i
	 2zJtrcYS/DFYfC7+yflQm96BrkZwMLKoJnEdeIt7ETEPRLBjnnUoLlb7UKiZzfRIPsiM7
	 reB3slVVnDss20nWleEt3uZjErhPwQn4CFvL0PG1EYj9cB4idUIyzqjIY0ycCh0MpaDBO
	 7URhpkCf4RBKLXmIcbkQkoyVvZefv+nNI9fM3i2kiHboDs7W3jPQdPvMFu0wUKx8JPUzO
	 oUPxxfqlsTKOC9G0ZC64E6qjlqy0bKalxwdb+v8k10vtojtOve8iEge+QepMtQYDIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
	b=wyU3BZ4cw//RNeWNDl/gbDd3mDbI2T0u3+loRGzq/JlAuk5hy5c9Nda3qpgBHx9n0lA7
	 HrZIyDES7h8dT7oqU+V0pwlAqtCv3xLABF2q078AQ43Btf7U0nfkfolSz5u3c2mPTV8LY
	 FPNUZa0GASamxqNQmHdUh8I7YuqQf0JoE2Ga8jqE1PGranQAoJq6Do8X4WESB2OR32Tv5
	 stjlEOr0k1+EzZKFbreTG031RGvUhnLoQ1YmYekwIAetY7aPG3nnMTPieAD2gONordqoW
	 Wh6M7bIo4Qa93pIu50PcHvSZOME9rgHUtIMRU08+9JPpTHzxzSwpgITZ2tSKiK6iJ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JdfJlGfz;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FD6606A333
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 20:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FD6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JdfJlGfz
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso22788665e9.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650482; x=1794255282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
        b=JdfJlGfze7wgCvUiIjxkJp5J7LkEQXr9SCfaD7lCrcEwTnSqiV6V/Fgu59HmJ7yPs0
         LmHn1MKW+31ahNi6cQvICo99kKjjHD7tkTlbGtAyiuIRxhYyghB4bco7AjcWD4lg5O7F
         OEos0sTuRA9Xpe0Qu8B31IXVmPg4mV7SsZYGNQyZxGk7zDu7zffAcSkfy45wpJSypm+x
         mi62d4hyhN5nL6F2byc36z2JH6KJuEnBFmSvppDy/Eg9D3X1SwFQHjLfrlaXAQpQ+Uii
         RlF0Lj+LsDJc6WiBAH4tKGn340mb1qs3j8ZYC3QqGO7htcb2oUhdbtjwqUuZmSC/AsXK
         9beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650482; x=1794255282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJpG0KekBa/NY2yha/o6EWqyLiVRn3sfx78mJkKNt7k=;
        b=ubpHJwULElTThMpR2aQ6zWYZzThHsQ5daoFTGKBrl5MyEFMEzfG1ZWYlRaxDKtms1O
         +E400zqQf8XcajcRRx7g5cgrWbk4DSfFo0/uYOvDQz0bsVgPcttwG0LkB75daK/4Tt60
         7uxvCnDh1ts+8je0VMmgkJTrLuMqYKXbjkc+43LHOwTT411OV4FRATvdMdzTt9DhA1V7
         KBb+3/3CNkDpHGE9l/S8dqPUa/X3IIbq1jFRoVTbIs+Iu2nAYDehXSJlD5vktfMt1Biy
         rfGy5YZTfe8k/BRat/ZgtX9cjmyv4bcs9JM69rKZA7rwMmlXo9OtqxB1KXjELCT5zijZ
         WKng==
X-Forwarded-Encrypted: i=1; AKwUvBxGylFj8UEDwOWTQJ0ewXrVPrsS+02iDp02Qm93pz2iu8zDY6ltt2u5mIYGX/aSHmg4LgkVQv8c2kFj@vger.kernel.org
X-Gm-Message-State: AFq9FYLFD3dvBC9wGpxX1CWpG2U86TY83hHnef3zX9DO61YGJFXpXgEi
	VsblVQEJjNMIgmEsSp4+PlRmYdVKIXUvbIUk0ChGtp/3S7qnKl0eK+hKLHhujz5xc80=
X-Gm-Gg: AYBFou10KdJG2YqDS/4kq9bNQ7xZddNPVQ3zrxubLkm7s2nrPwthPh1KfYvLKQb3AXu
	H3SJVTSIIBKfOH9KuW6mpg6/IfUVD9wTeOEaFmLOSCPgo09dQrFOwdJWKXzimjKNz6DiTKGABZ1
	KVbwnR1gK3HqJzOi5HbRkpXL08JZxnSqo98+5x0HRf3Mw4nzIaMlYTP8BQUDRjAPd8oLYcGi0/M
	nHXfmJeN7PSp4mQSEpOlym69E+EDckPF97y5BL7CtavSo2BiYPebqTNEEUJrbvHzTkV8NcU2ndi
	ZFyKqRicqBj8/MAhFddUBAuG4DEyPAAe1WflQvKjsWIEXW3BXGdiEV/xaEFM2WLp7Z8oU38HtJp
	db6sZw9l2d4ghlopyTmEYsbcsxn5bG1jDpJ7QqnHH0R+HDRHXRvWwwBr+SRCk5F0M91Conly5ZK
	uGxjQ2K2vDDE3xvN711tRXPwMD+3rVWUpKcy8GRZfOiTMLgcZGyZf/S4PV2GTuAUX9NzZO4siRZ
	gRqsYRmdSVRclBjcTHCPhoprJXWFhL3DY2Kkscit9edQ17MDPoivk4Jbe8SynJkdysBNnn/Hze+
	B3fNReZsvVA1Rea7VI6f6Z5OV+alUSscxj/qRWLWXW4keGfDpvyoxiE+cLNx
X-Received: by 2002:a05:600c:8b46:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4ac18c73238mr261757445e9.33.1793650481932;
        Mon, 02 Nov 2026 12:14:41 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a8d60bc5sm9559305e9.8.2026.11.02.12.14.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:14:41 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Mon,  2 Nov 2026 21:13:24 +0100
Message-ID: <20261102201325.29507-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201325.29507-1-olivier@mgcrea.io>
References: <20261102201325.29507-1-olivier@mgcrea.io>
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

The X1600 has an eight-channel PWM controller of its own, separate from
the TCU timers that drive the PWMs of earlier Ingenic SoCs
(ingenic,tcu.yaml), so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/ingenic,x1600-pwm.yaml       | 47 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
new file mode 100644
index 000000000000..3ecaa92a5ca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/ingenic,x1600-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 PWM controller
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The eight-channel PWM controller of the Ingenic X1600 SoC, separate from
+  the TCU timers that drive the PWMs of earlier Ingenic SoCs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: ingenic,x1600-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#pwm-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@134c0000 {
+        compatible = "ingenic,x1600-pwm";
+        reg = <0x134c0000 0x200>;
+        clocks = <&cgu 21>;
+        #pwm-cells = <3>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..c905aa13bcbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12878,6 +12878,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 PWM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/ingenic,x1600-pwm.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.54.0

