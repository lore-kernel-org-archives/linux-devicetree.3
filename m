Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792918008;
	b=5ifRR9deDNHJthM99uSHwcFYkQJnqJurU3jzAdaj0C/qnXhri/M2FxeLtQ6wCdxvDxD4
	 CnBPQVZnm2jw3N9cbhA7/fbB5AbmTpNa69v8Yf3cmF+RXDBi3tbvlhVqixWoLzSyNjnCN
	 4dpYGQGpIWhES193ZwTUmvYHO5hpjPy8c4Ofc9LDKDVWHOo7EjfqbMEFhsM/jqeogzKkp
	 CtBBQpZ1mxXp0SC7O4rOXHzwOIo9XB32I9HS2YLDTkhhnQKqBt6IDo+tZbAVlQsLtmEM3
	 pMGj/e6Ny/v/SxHceUVeqk9Dq4A/L6FwqKfFst//tji1+JDGnM3U3IdvqfejDetDzdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
	b=RQrjTuxubiLG1I4eXd7acbh6frzhpzbmNHSAFvlwMAPEFUNcFTalzrDWbDTnW8g47hPa
	 4BjiwkZEOhRVNYsqf1E/Mr2cUqxMfyiU8cWP5N+BV50MOuyBHm3W1LDfiVmI7JPIQi3Dh
	 mPSXzOu85Bx/L/7N/slWiX8peZ0/66G0LjuIP5U3FoX+/fyQkDd8TL7Q4xPP2auH0No7Z
	 XwjJWrUZi0pKeyEOxSgr36s14GUDyLSmqGO2NLy//M8fNIGvChK086XvuQS/8PR1VBFEA
	 dzP2R3nOS2Ul0mBP6TIPfoO9AZXGIuADiF4MWgWovGwVyDmJV67eZ02bAVivPGhp8qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GglVcgwI;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B904606A329
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B904606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=GglVcgwI
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e4831c028so424720f8f.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792918006; x=1793522806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
        b=GglVcgwIKfAuJzhKvif1QWUuF1DmaBjTPt73jnHhBWyFQGu9HtWWP6M2Tz+X96NCD5
         T54adqHu+0zbxD/MI23x4hZTgKLQ/89mWBumVhcq3Bq7KBtQo8hsBKF72Tol3A1Fo49s
         MnPnsbVy5gmajXbl8wvpi9uUcTJpvb9Am1YQrIskxtNpz1XmWUMWvWi4sG6+h01t8jKu
         mW5Q9EHUpw4MeWGCe3bWziK4S7W/GF3BvX8PYIeTrctEE8cKFQ+GEIYT3dJ0r8bnSm/a
         YeNhHaZAVgRYEPVANK9zwMcPLZexrkAz5cRXuEgqjYU1fbxPN/hmC3+Noy8aTJktNeF1
         +3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918006; x=1793522806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSPsp8WYgTyYIXd11T+owTDZiioNpZlULQUYbYv9uh8=;
        b=yInX5i8fSUcXbeb7klPduGRiBrzlzTuvUeSrQpn3wvQ03M1BnovM3ynP0JhS+jnMQW
         9bNQzVW8nyaWCuUz06E66nl56JCAaNYKk6oT1+FAcWg0tllsr6w8eWpD6BrXHL912drl
         ycB9ZTt0rg04lcj3495JkmNTe7ip3bqCIW+vIbqxaZjejeb+w6ShjbTk7CgjIYZ7pRuG
         T/lVlHJzTDv5QYcZRSiZJZAoMjJNHnuXTDo84RMY5iPXZ08UQT8IEZqIaHP/ii7rIFlz
         G+Del5mU8lLMJa0wh+UuLDyljHqK40+KvfjtP8tP6sa7sdwpQc82KhWSRnYDYXH/bfa4
         zaFA==
X-Forwarded-Encrypted: i=1; AKwUvBx3UDpD+XFUyxHjMgD9uPpP6FdE5XnUKin+laJ/hraGXuDyE9ka89YCm2d7Quf5PMPfRTYT6LVeHKLh@vger.kernel.org
X-Gm-Message-State: AFq9FYJEAmPvualbQZOeUPmPG3QUkhwyctPebZGSRHnhSGw+FnSm+Wrq
	vA5LgTDrruCRPSspr9V7fLRAOp1zmIi+32ORMPjv5cbunjA0h3kebCeuc7g0KS8LhiY=
X-Gm-Gg: AYBFou32ez13cv/Hyxgqq7hFrvZ/3PGnhmgUpzAbt+L+kPr+85z4T62ZynleSn6q0bd
	NSSrYHUfS6fHwITnoPnhXHADBA0lsdLOJKOyQ9aiT0jK2nbE416k2PAPQLlD9Hz3L34BjO8d4Rs
	yuzSGHW9lsnNh9q8x+hNMh79k+md0Ur1+Ug/uHNHwaQ2zdztFSiyXTBengyZ7Nen0VSjuTbW0uT
	DgYSnsgQprr6jJcx1AoZu+uvAj1UTOrkst0imnN5ZsNf/fBfRZ8pmkNkjn9XyrQs5CCjfjFdujq
	0ll+rcmr0qL68DWhNJE53sWqloudnFsqdcmEhnhC6ZKLEnutOu4jlTHoqqC6+qcSz1+OK6WGvWA
	K/qc2aEPtHkmd1nHyOXzX0k5lzQ6IMXQtFXxufqK3jNC0r35hmIg01P8cYvIXvneaDZA1ZoC1dp
	bVN1lTePkjpC3Q9UAcx4r3aXCofvdUQKoIfmLV0+MvolHI4iXX8m43zajhuaBHG+sS8G289u/CM
	pc14nN+NXiq8muViaVP8bcm74OZEwJdG7t95Scfz+yaNaZuKPP5+AUAWqd1+4vNE3BZ4Dpdvaid
	yJkPeuVFDredMB6/xoqPKMQ8TvzNFkr6v5j+2cXc7TGG/ruRQBJO952VFtxl/fNl3Ld1drUIqg=
	=
X-Received: by 2002:a5d:6f0b:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-48e3eb8e5f6mr6646358f8f.56.1792918005553;
        Sun, 25 Oct 2026 01:46:45 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm8616707f8f.23.2026.10.25.01.46.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 01:46:45 -0700 (PDT)
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
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] dt-bindings: pwm: Add the Ingenic X1600 PWM controller
Date: Sun, 25 Oct 2026 09:46:42 +0100
Message-ID: <20261025084643.93167-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025084643.93167-1-olivier@mgcrea.io>
References: <20261025084643.93167-1-olivier@mgcrea.io>
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

