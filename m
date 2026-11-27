Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797399;
	b=rbqC7AuIblyzXmGf2BhFZ0itjDHOAxz3MvAsdz1APQgM0ZyMItXDmd5F5HBO7JqFpvqk
	 no1u49yr9q18FPVk7QpsLHiHvyZudiV70T6EGPHJ6hXk+DYs8zFagqjpxxhhqoVUl7cSX
	 XlRjbQljFJcbuWK6EeWyzgHhF30I8OpkxId2i0S2b0RhsHis1osBkgFO5Y+/VInIP2qOe
	 5hGekkxuDOlaE1gApngxsy6iLWh6gogMzqMrMEo+Zf1mSzO8K8DbjvWnzc1Vz20TIqwx+
	 LErhSFTAqc07sMttY8o/bUVT95RhiIfOj3I80Pw/KgsG+EK2TS4IkFg66dOyzvse8eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
	b=vnJl7WfxZlBbcRr3l584fiqXBAjsYZqgGHsiqGyk05q9Fsvq5Y2gdvTqYbBWbIginzBV
	 ZPFMO1x68dTKw6KlPCWCwzfm3Bjw7bvqnAnX+QZIugtjrfkHAhSOqpXl2D6yvrFwYqJL8
	 e/vM2LlGKf7E8vAh0JOl+xa6fQC8s9Mu3w+hrzjV0W5u4EjuLmlv5O95rTIRX0Uw3n49C
	 0eHjl8qxGp2JdZuq22xtkxYJH0IfQx+Z0WBTbZOw6HPH7POaBxl99W8DPPVwOV0tR6wJh
	 tIhnBkfv1bl5x2mWKCSc2B3tk5W/57O5ZqA3z7aIapGXnbHa5B8RWsUwEzRYQ4WBRMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOTWacyc;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37CB606A331
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37CB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOTWacyc
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c511c0e2826so951018866b.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797397; x=1796402197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=cOTWacycUrZnuCs2B2RKWuHRmIncyI0AtBdF8CI4VyB9txUVXVgwDPMZQ9Izod3ddL
         5ixk59VwKGe/ksQqZ3VkH4jCiTeygGfZK2K3dxJv2VknC/MwH9VlyxZbpNjPwJEC3yu6
         bdUgW3qc/6tEH2DPNdR5Km8bWtncLjYmHz3f3LxGGNBEIXCABiRqKjeC9oCjC0QErzpZ
         icwZ7ymNoyf/YO9aVlZdV2uQt1vVULXdsgf5cM5UdhMt5QIB/i11rGjImGXIsrvy57qs
         yc9HUPdigt6+xPJkOhquP02tOgkdrIfqpJpaCQg86noB7zNMDXa2BtwtSlCd2APfyLTn
         3m5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797397; x=1796402197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=WBp4rjA6Ho5bvZsfHtwMGK6pIOPBFa/kxWJMHFwj34dtvbGnpkIWaVXCE1pP5ymZQH
         S0j7l3Gi2obeytWnPginKQxDfbTcOXveS2b2cmijlPMRRxs0YtTjknU81QJEmDDy721H
         YvApggT9h4IIY2XnySi5ye+QNnVtHKL/iqZIgfoK9XmZXps1wjRAutGiQLWAgCYYQ8qt
         42A1H15yPZhCGDzK4Q29p4gijhWJhfVv3+FWj/RMc0vLBO6Y/fOV6a4i/0XwcE40Uze5
         pW08D4WjDGaZy4wn8Uf6i1N+3dalwlDqhX5nxbDElAg2bshfXxfcjQwhjEcYtL9mlvmA
         18NA==
X-Forwarded-Encrypted: i=1; AL+hErFFlOYhnzhsvfrirfSyuKDysQcgisYKr/6AWGDbyDmPskUho+LnW42BzspGGsCq41Ob7GwRHxVJr0P3@vger.kernel.org
X-Gm-Message-State: APuU4Z8JP3R1PP+JZ3fJT2QHfc1hhApvH+xhQpioaCUAhSGvCOIkgqPI
	SQxSE8CsSwm2HV1BhmTAigr8amic3s1X2s1YqqJc516xG3kqY+t671F1
X-Gm-Gg: AZFdTZehO6aTniCKviktcuCH1oajzoU4L3pTVIB4e1FI/JbfbAqXm7A7CcIeP5ySDOJ
	B8l00vfABZDsQ+MqU/9NA9RtkKRyNgy8bOnHXLfzSCV6InOp6sR3isKJVoXqaxgAMw6dT+8pmjg
	Sq3OiBYyyUdJtF7o3o4e0sFj5ousw1XKjRhhNbMBCh6Z35GrBjBNvXkhPwM8POcxaQm+Kxd94NY
	rq8OwjpygtDjXN1j7s7UHmx37kvzNFAzzM5Wu6veZZrUkG+Sg9DogeY1VGq91V7EcR4gGxNwOJg
	Bj4MSgHxYLL2bG1VwQWr5STdVXX861L3WHQdte4ajnE/zAIrLt/jNUo6r8Gff5cxYAaPzjhcd+f
	nDXElQ+JvCUXQ1txVetX0zAHZ7/OSLvenay3ptCKz8qfCNkOs/u0nJQtnSZdAmsCBgU2PnTwhK0
	cdH7/kfYRvFNYVAQ5wQUL8ue2O5Yl927Sx0ncdOC3633qkftfoQBvPlleTwxAWs7V2gwC85DKlV
	MHY3oqj2jsSwCrdXay/8BZAEfdxoLz4Rue1NjF8Cd2t09pG6N6fcf2ZKF20iKClSnn8AxcY8bMl
	11N85bJ98PNAJKMPmzsPZXFGKHDyltD3fpDI7aoxpEhcFkk9c7WGrw3HHlraBohsV8WL57dt5ZC
	hBBEYNyESM2M=
X-Received: by 2002:a17:907:6ea8:b0:c51:3bde:bfd0 with SMTP id a640c23a62f3a-c513bdec070mr2097785866b.47.1795797397430;
        Fri, 27 Nov 2026 08:36:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm893079566b.41.2026.11.27.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:36:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Fri, 27 Nov 2026 18:36:11 +0200
Message-ID: <20261127163612.280186-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127163612.280186-1-clamor95@gmail.com>
References: <20261127163612.280186-1-clamor95@gmail.com>
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

The Maxim MAX8907 PMIC supports a single LED; document it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

