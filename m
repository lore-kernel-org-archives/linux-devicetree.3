Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794098466;
	b=lrhQ37OJc4pcE+9CoxLH3VZ1nHXn1wQMu71DsQ6g3sFXLkmjCWnViIMcqBD/DVos6RY+
	 /0mTNbmgTYF1eQ4K/0pEngX1wII0LHMRKVcP0Ef3MG8Zea90is47vh0BT2QNFzefL1Fdu
	 Dc+dkHbeImeTIpejZJv3hJlXMuJRCsYP90DqUfp/EJsdZRAKeNizySEvP94rSwezmGZnI
	 3UFwGExmZsFqTGhPb22ZyjE3Il1QpQnhmvSbmCdwxi3ntfFGpjxTNFI+dmcMtEFyAxHqw
	 XX1INpKCaHwl4ZUlBj8BAEs0VLgj294bBy2qv6HOg2sBS3qYS7FcrnaQxL+vgtNkWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794098466;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=tBRLz95eawhJOPMbjG6CzTX7WFIK+5RQXzqUwDpEyqU=;
	b=HQSF6bO3+Go8dVHzGOFeQ2oTkRped5wy9ibD5sNFf6HuWkqxxJ4C9oqkxMPUPBSNmpE1
	 EncJoVZq4I9WTDteY7FC0CB9TGOsE0Yw94b/+y1GgISHv8NutRZjiq5M1D2lY/r6HXWMQ
	 3KWgekEkWvm5LwDJDmJhaBPR40feKttP2a1682AXFLYtKcIVTmeLOCa9dGrUhuOjEJaaJ
	 h629iZ3CXec8RVGvjiA0NoT330ygzsvd4QWyyYgKYSBRWrnpXiPgTvdg2rFASOF2UG1JR
	 tFnhtl6AKpgH14u8SnJlm8YW4lk6vuP18HlatGpeDHRLI0wOVOYXCLgP7J/BqghO0Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wxz9XgKZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03582606A326
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 00:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wxz9XgKZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E601A1F0089F;
	Sun,  8 Nov 2026 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794098465;
	bh=tBRLz95eawhJOPMbjG6CzTX7WFIK+5RQXzqUwDpEyqU=;
	h=From:Date:Subject:To:Cc;
	b=Wxz9XgKZk8LoDhKuvCCQF0VnV4R5OU3gp+LEdKI/YdCrWJUIaoB+iiXBY/qVsAsbg
	 QQRc0FGxWoOEGpyZSKowbAM4yHQ7OBgaOGL3AqMJOdpQLHO+2t1/PYKw07E5u7dSm/
	 iZWWVFBmPsSSSkv3vi91a9Fjn6fPIayg8kBqXEHWFwNbE7sZ4cB60mjBvaJWLfMkqk
	 L4nZmXaWAynKg1IzSrLfsLVpwl2UDzJO79gVwUzSoOtS7/vX1mJb82d+vZ2XTP6qLe
	 +/Anv8TWzIGufMHwUqT5JRy5YVDLbk7IkkKEmLKXIYpsXt95ttt+5ZozoevV6TwjgB
	 SBATxFj3gW4Iw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 01:41:00 +0100
Subject: [PATCH] dt-bindings: display: panel: samsung,s6e63m0: Describe ESD
 interrupt
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
Message-Id: <20261108-b4-samsung-s6e63m0-esd-v1-1-ab5c252c9646@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQqDMAwA0KuEfBtIrS3Sq8g+qs1cPuxGw0QQ7
 y74DvBONGkqhglObLKr6bdiAtcBLp9cVyEtmAB77qNzPNI8kOXN/nUlixL9xiRWiH0ZcyjBzxy
 wA/w1eevxxNPrum7S05BUaAAAAA==
X-Change-ID: 20261108-b4-samsung-s6e63m0-esd-03d8a5d53b05
To: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The Samsung Golden device tree wires the panel electrostatic discharge
(ESD) indication to GPIO82 and names the interrupt "esd". The binding
does not describe these properties, so CHECK_DTBS=1 reports them as
unexpected.

Describe the optional interrupt and its existing name, and expand ESD
in the property description.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Describe the optional electrostatic discharge (ESD) detection interrupt
already used by the Samsung Golden device tree.
---
 .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
index b65f0688bdf0..48305d2eecf1 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
@@ -21,6 +21,14 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    description: Electrostatic discharge (ESD) detection interrupt.
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: esd
+
   default-brightness: true
   max-brightness: true
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-b4-samsung-s6e63m0-esd-03d8a5d53b05

Best regards,
--  
Linus Walleij <linusw@kernel.org>

