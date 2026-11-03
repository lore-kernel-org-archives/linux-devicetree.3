Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742812;
	b=A7GdsiAhObmXJQYy7Ifh5u9Pm80m1/XmlLralm4Lq9SGuF2QdkuKcPfI7TloIUBw+a7D
	 xEjpwSfEahpLibTldqZK89vx964e+6hWp4gRNWdTNYc6HYsgnvn8qbcLYUOwAHZj5gNzk
	 iz9OrYuiYEG015ckxwfdHSNizRYx90//voR9h9DoNCxaOppkMgClRT4I79ZpicMp2rqtp
	 fXE5otQiMc4N4Vo9NXjwnR4t/7ov1XHksqZOCm0WqdNawy/LB2cmXYwvY8p7A2h8AlkL0
	 qy59Wb+oF7s2MjMlZ1TZYovqUPUmBJ65F6oOOgRS8NVl+zFgXrpTczN0rV9FIeLs86g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=028xdkG7xPI0U67R1NCatjCGNqB+YqqdI0Ec0sbhbX8=;
	b=Aju8idrV/F8NP4l/nmZeB1Bkgqwo3ClasxxLojHDYZ/G7meBizeNdrAEXF1yHEMm25QI
	 AiLL4Ay0aSbRgGtgQ8YmxvUzGW34Dhunes8gKIrO+m/yw6ET7Joj6Owfd0sU7fbnayAQk
	 IRecO4nBadVrBm9ob4laMVNUvTt4MqURescPjm/kqf2nelxGY7meD0SBREIzaoF0+2Her
	 wQLr/n3qDd4durtW6n8hZSZUjMY3SV0xLxwKiPmynyBoazZQqn0AVMsJA9/gtdCEXE080
	 oflRGHuUT1p6NQPsQH/Uet+ucyFE2RbaZHAcNNMln+1WLznbARFLtXqKkI44L1fIWSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23D606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A23D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3EB602C0520;
	Wed,  4 Nov 2026 10:53:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1793742802;
	bh=028xdkG7xPI0U67R1NCatjCGNqB+YqqdI0Ec0sbhbX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ck+J+n7qi3Mu03GyemcDUYL+jhoVpwihQ16VVq+BGWOLvKCuxFY6naels+G1HGoG9
	 JkGG8Tjchaa7iWIpQCkxZAhdbLDn2fmbWmvh9hTvuWT7WuwZNzVUXqu30baBWR1v+h
	 gJ3DMLmRghP2r/eIGhKr2Rb+9dHNaB4OoIrbkw3x+XY8k9v5xTcl2cbqfUYTSnCowG
	 vt/iOVIsRqI7bzr1VQuThBMm3Ym+ZQnHKfobfOMaOoJEEMF7KiEtdehjp/RBaAi0wG
	 N+Jf86a7oW5Q2PawoHnc04b/0SoOem1lobDHoH9O+nViUrbzQV+lu9vOk0qVLGXcpl
	 jQF2+3mnqlStQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6aea57d10001>; Wed, 04 Nov 2026 10:53:21 +1300
Received: from joshuas-dl.ws.atlnz.lc (joshuas-dl.ws.atlnz.lc [10.33.25.18])
	by pat.atlnz.lc (Postfix) with ESMTP id B2CC013EE5E;
	Wed,  4 Nov 2026 10:53:21 +1300 (NZDT)
Received: by joshuas-dl.ws.atlnz.lc (Postfix, from userid 1634)
	id B2CE15AEED4; Wed,  4 Nov 2026 10:53:21 +1300 (NZDT)
From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-kernel@vger.kernel.org,
	Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: gpio: realtek-otto: Add RTL9311B
Date: Wed,  4 Nov 2026 10:53:15 +1300
Message-ID: <20261103215316.1544492-2-joshua.scott@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103215316.1544492-1-joshua.scott@alliedtelesis.co.nz>
References: <20261103215316.1544492-1-joshua.scott@alliedtelesis.co.nz>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=H8t4wPYi c=1 sm=1 tr=0 ts=6aea57d1 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zJRp6_cAMcgA:10 a=LBYFwOYDQ0lbnge7NPYA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The Arm-based RTL9311B switch SoC has the same GPIO controller as the
Otto MIPS SoCs, with one bank of 20 GPIOs. Add a compatible for it.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yam=
l b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
index 33c25df7b815..4d69722711c4 100644
--- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
@@ -15,6 +15,7 @@ description: |
   of two banks of 32 GPIOs. These GPIOs can generate edge-triggered inte=
rrupts.
   Each bank's interrupts are cascased into one interrupt line on the par=
ent
   interrupt controller, if provided.
+  The Arm-based RTL9311B has the same controller, with one bank.
   This binding allows defining a single bank in the devicetree. The inte=
rrupt
   controller is not supported on the fallback compatible name, which onl=
y
   allows for GPIO port use.
@@ -30,6 +31,7 @@ properties:
           - realtek,rtl8390-gpio
           - realtek,rtl9300-gpio
           - realtek,rtl9310-gpio
+          - realtek,rtl9311b-gpio
           - realtek,rtl9607-gpio
       - const: realtek,otto-gpio
=20
--=20
2.53.0

