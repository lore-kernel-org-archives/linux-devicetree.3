Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E32E62A9
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779557594; cv=none; b=Zx/+boc7m6S6/TfBPr7ZrhkT3oMUj3T7T6FTPPXArplHzpVv5A5zPcu3mT2unHCdsh7XAzrLChPvglQ752WkKoX6D4V938TcHWpgck+AJVGyxLAeWnPOFbcMQQ9O9VVrLZSxbprNkCtkh7OoKUxALoYjx0SEbcBJe3NMTQq3C8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779557594; c=relaxed/simple;
	bh=Saljt8+lEfAQzopPhIMcOHAZd977tUe/WQSEWbNCEBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3Bv7U0g0NtkV940iI71EFaw3JeBcMPi9ptxKwbL7idxRhnyplI37pT2aJc7ojiQ/l1kE2zNrOUmY526BENF6kHgRHHi1bKTmh0NGXj/grvMuMSh+5sXswIlP/yvLLULYfmO0s3tegxd/CWkqXTz30Pres9NLVhmMbCjuonj8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfmtIxXF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfmtIxXF"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c796163fac5so6857574a12.1
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779557592; x=1780162392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCj8+oLwvPOIbmY+qV1+VohiIFMiRIVX9QeRtC1IOt0=;
        b=KfmtIxXFGbV0QbEgYoygEmc+NlXWDQ0TFzvMxTIGo20VyRs/jGIZv6vmQQB+AY33DM
         1FbeBOO8b9lTN+3PJp5b4fYBveojpf7FiXU+ru0xkHbcPdP7pWxpJFqHiYAVaUTxrPJd
         oHdBntqMW7rp8UdFPok8MZM1jhsV8eU0BeTglKAd+07STEYrIiVF1/w2NR8xtYvyvTPH
         F8AkGRL8sgh46yAc/AdK/iVrdrZxUpjWz7mc7Eo3HHtC6d6jXPNaaKNbIjCFqHK8Z4Zr
         t7TO+Xx5FJgdmApm2SardsLvYpCb6+c9ley0BgyFI2QA3bl0TWp/5zzifa1E5QZ8+l8I
         t9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779557592; x=1780162392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eCj8+oLwvPOIbmY+qV1+VohiIFMiRIVX9QeRtC1IOt0=;
        b=qoQoORNpKWazDMbEu+9qmyCLylQByW6Z5QuEgi57aCezWIRBFMZf6kMgQWjGrPgcgD
         2BsLUHu9zsC2or4x57tK0oL/9JzvxTNkrSye594uisOlZ+skjUf71DEjPhzmY4f1LjrQ
         EpjvccUB6RKEe4ohgpTEfqvgMXhF3nn44RDZY46XhJywQMCqcDkOw0jGWLeQ1sR7Z1pY
         HiBsck1bE8dlGBn/Nvjqhmuhn0sQS0I/nJg9P89bgSXxBtDBmjYhcHxlhEWNBUqGXHv2
         PH20d0NG9d/kYp6q4hFmXh7qxiNO06RLbpfKPSJvT0CvhEzq33z1hAlvZJlsXaLbP/P0
         Hk9w==
X-Forwarded-Encrypted: i=1; AFNElJ8xVEi3h+Ubekb/jUqrN8j0O8Jt86ExIrcfFxYfV9AjXlNGEkI+aSkIzlPCB3L3UwwZfG13pQkzEXH2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9iVOu0wYVTt/CJzXIajeOwbNlpViu6UQDz4J2k5yQNJbxHYAX
	xZ/88NM8U0beuqjGnmjeCO4CZLSudUs5BKKC/Vfvi29LO0KJQiB9LjQm
X-Gm-Gg: Acq92OE9CxiCHWiCSy7s8vM1fWQl3a6+3H9YJ7y6G/11UWPLoxoz6y6KDooBl2hVJDp
	XMMFf+uz+o1dV58RV23cUU92f//9DF0DxP4+vWusbIxmcsy3M37aXNVYvsrBsxotlJF641ZzjA8
	pMfo8MpTH/tUZzLBq+7QYwcXYZIT3UCoAaCg3cGqi48Q/OsLEDhF4kGtnsyFByS1U62z2G+9ehA
	A51X+fd+YG25OzAeBLfUG8PiJeDYneCT7+xx4REgFBGY2TyC17G+U+mBssj4RZkyOnWxO89UJNa
	Z/2gR44ZL2aQg0ZWkASg6KNIPwgZ+RECfhM9Ca9siCxIaXSrj3jK6BTKhsoxCvZse8Z8Vm3R4Uj
	8KzvegDFuiQoBg0l9RjdDLZcdwSdWNt33pXuhExnOIrSuAa2G7bPr2ik5upPsEZNpg9gE8NmK2I
	MMjTIXFloCoEW0UHIUNFKDZPYKYFvwTG8UF8a65b4ccpR3LoXxa6YTP7CVO09IMXremA==
X-Received: by 2002:a05:6a21:594:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3b328f562bemr8292242637.38.1779557592547;
        Sat, 23 May 2026 10:33:12 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:33:11 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org,
	ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linusw@kernel.org
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: mfd: st,stmpe: Add missing properties for PWM subnode
Date: Sat, 23 May 2026 17:32:50 +0000
Message-ID: <20260523173251.72540-2-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523173251.72540-1-manishbaing2789@gmail.com>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The st,stmpe-pwm binding is already covered by the MFD schema in
Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
PWM subnode was missing a 'required' properties block. This allowed
Device Tree nodes to pass validation even if the 'compatible'
string was omitted. This omission could lead to probe failures
at runtime.

Fix the schema by adding the missing 'required' block.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index df43878fbe18..4bb05d544901 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -127,6 +127,10 @@ properties:
       "#pwm-cells":
         const: 2
 
+    required:
+      - compatible
+      - "#pwm-cells"
+
   touchscreen:
     type: object
     $ref: /schemas/input/touchscreen/touchscreen.yaml#
-- 
2.43.0

