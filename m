Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8AC3DE435
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776803063; cv=none; b=ZQxydfHT3+the+UCCQOgVJc306966Z3vMZwZi/GE5gI0VwybQYNuUB3CGBZ2urreKv9c7OAETcmrAc4AzAhMp5QGIHYRsWDZBPHHuYCS9p/rbYg4neqOyBt/B9pgjGDZ8aRDt6mHVfWx+dJimQ6vzyzJ+VdToYQXbwjsWn4nsMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776803063; c=relaxed/simple;
	bh=CEUKetRzVzn2Xnwq6XKvSjU6QTqMzQIFYZ7UZd5Gyq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3ABxTx+072Tn7RuS1WJdY9bfpqBLJwJ/lux4uFDipE9SeSySU0DSukzlXOsJ1JwuAxMNSbAKJdTOOCiB8pfmOHGpUlVgfZeb7A+olYRz+ojRPelcwlnJiwE7vEbjinQejfgYP1QwJNmKXZfoJr1jFJJ25STtuVxKthQoGHMhGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDW+8n8p; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDW+8n8p"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4890098abbaso32500015e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803060; x=1777407860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=UDW+8n8pZKTy5M5Mw+TRx1ngXKrAGqxdOSYQn1ZwnieZ2rvZbKWcAdbJPTCQfxB020
         a+4vBlN4fEjR5B2DgDAA1iE2iH/9VnBD1+WXvgBwNGYCk7O194R8a5Iiw2Aoxnw8yMaP
         Ut13+07HlQk0JrDv2C5pB0Iwahq+NSQkpL1kFXrPvC7ceg/0ixpYzbSWPHqVPraZdKuH
         JLLqLVMNjCJZ/Q5re94H134pb8MBLanOLMT873G0lTpebfxjttSI4yljyFEEP/wpDr1J
         I+tunIrVPdl4PoFxCascWS0R+B8PDValGagLQWOyAiijEhJqWgQIYLcCITryAquLfwp3
         Eqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803060; x=1777407860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EBJ+hPnmdJzo3k/g70RHgYIGur+PsmZcEVdmZLkZuHg=;
        b=kCsXQpt5FpB/byB9CoX7XnpyMyFNPRjt3t8+s6JE+ApKfOU/Chk91yLo5rhl6l4d32
         31YDEGUM11ezjg532e4IvFbYJzdWanLi18TUAL4ug8/i0WBVze56iPiVUpf2bAcASBlX
         3i8od8saJI99XZsGLHN8Gv94ub8x0ZsuBkLYJoz4l1WsY4bSGS35AOpYqSiRf0C92ToD
         ULy3Igl8tlFukcYLkkE2m4wBibKtW1hLeMv0/Lnca00FoSyJfCJLgNt2eki+Wl0s3oz1
         CZWnV4QUHCXhoubmBTrc/F9tkRjnDyzfjdBnpeorVAyWGUaSdbcIbFKJn/L2XNx5+G9O
         AlJw==
X-Forwarded-Encrypted: i=1; AFNElJ+6iWTUa2ccTHen9nMxvd4kinxQKYULvxwCbATVbMh5i5QtB2IcwcspuHeAL/YrO+8TIEqRQM2h8Sm9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pBCuthLi0Zw0p1gWUAJrW2t261J5WNb1ON6UME/VRL9GIC9I
	EBuT5+c2gjEjjbsXIieAveBUJ/+J+MJ7Um9GhQTsvu28fhz6ckCXJCIs
X-Gm-Gg: AeBDiev9P3lXm3Tbc4g4cAYHJhr6Ildnmd6xLoAUwaWm4EWAOFTsvzWVFwVT66i1aPL
	bbjn3PLGMtHPitN5hcDfX3Zi9XvsqoTUYXmZr60A371H1wewcDgVD9H+fBhd+F/7DFo1xgDM8/Z
	20RJmEDeO7tV+F+JhXCXlR7bq3a2dyEWTzhK4Cxuzdr57lNKnvbQdqlxz7Kg408aRHiReN3DJLP
	G4iLyZI9qCZtArLc+BCEtytS9yX6LHQC3so+GK2JM7K57ueQOOU1jHZcBW4HsNAQ9jBJNzTZVY2
	8c7e64HLEiQPBdQ6oXltRpWfhtPlpTFaAtcixlZCsgkoF082OTNyDEsPU56ZVpK2KQDLRMXbZfT
	kOPYD3w9zhqPPdT9JhWUPJHzHdXq0hh85fVquxAw04Mep2Wa70xSw+nMrVOOd2fn2wo5pqepXjh
	vNj/xFGabqd9Dv2bpem4++tGLD/EKEehfjrSxvEvBhaUPa
X-Received: by 2002:a05:600c:308a:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-4896c22e217mr83386305e9.0.1776803060488;
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:24:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 21 Apr 2026 23:23:13 +0300
Subject: [PATCH v5 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-send-v5-5-ace038e63515@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-0-ace038e63515@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2135;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=CEUKetRzVzn2Xnwq6XKvSjU6QTqMzQIFYZ7UZd5Gyq8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zXF6GMMLpNkq4WwPjAfftYcRTaZJtkuzLOe
 KXRFnrgIfeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK8xhAAldsqjYe8+3h/X86yla+u17rfI//QK+v
 +A4g3kwBFOtoQ4YkoXtFlmKNU60WhO3ldAyJruXz0oONJCiUGJVhQdevJ6gJgTGtbFxWrFd62OG
 TpeCV0pwDt69klMWhqnis/g8QTr1XydLXrExyn59UcGmkzMiT+namcriwxgM7xXxZKeDxQ9w6S/
 A9+oVVuDBIfCc7ZwisT03KEmHMnhWy/mTY/9Ggzwgu23EHu63ztG+sePZ/nAI5Vqml31qmTpgox
 18zynyLmwOSAvGMPGpnfI3bq2ldQwf+JsbyS1qRvI/lNXPTEG1AgIIlXgX0qF2r4ZRtV5GqByR0
 QZzbBYy7jO4f6n3dEE/T+hrPGJpdv8edlkFOYbEv3Pu3+2tmCIa6dup5VjLjkLMS89ERRnvvW62
 c7eWCocyYyWgow/ptUwWJ5NLIhY4XsYe67F35wFukL0irgRrfDYLaKVYNS90fEPjULHLhpYpgSn
 wwnlChwvKoS9BJLqY8a3cJszrQdI03ujbootk6HZVjuE15Jx7a/P470qo6sviolSF+rmWsA0iuG
 7qWOhsm2ToVSrk5f47Fm0rI56oD9QDQLiJFXq2IIDYNSIol8ez7QWvqlvfiPZKeCHNVVGMQYcCt
 fEy9cxesmM3Pq2mT5aNKIPDB79epR6RVMymRSpe3VxKmldcfrKLU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The stock kernel does not use this timer, but it seems to work fine. The
board has other board-specific timers that would need a driver and I see
no reason to bother with them since the arm standard timer works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 0fff00f910d6..903050c684cb 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -20,6 +20,21 @@ cpu@0 {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -27,6 +42,15 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
 		gic: interrupt-controller@f2000000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;

-- 
2.53.0

