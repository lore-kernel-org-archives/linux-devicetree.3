Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748359;
	b=X5B0peSNF9XoE2gaDioR8emkYpZcnhnBuVKuud5/VjyAkN8OMwdQS2bBrlsbkiCyyvwr
	 kbRc8sWqFBV9QjdvWwaJ2TbkomwJkBB/8hffIOuXV10Lmx2xYRrv5gwrJ0p9+t+7y9MfZ
	 HA2AoiGSqne4TCgbiufObIhlfr47S7uLb4Xwy+d9736YrZVE/8XKCmg/pYmr0+ShmsgHl
	 AgtwxyxVI014NnVQ3xQRX2ZbgJ4X0lT/f2F49uLSkwslthBbigaKK6jYlGkNrZzEZLS9r
	 vOU0K3FicIpZdqo6Dx+p9sJIFmE2wr64FqCTBqQqDZ9LCt5HrOFca88vAmbyhXfTkqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
	b=HQHASaUwyKc5n0bkE7xOoBuC11KowFtwqCn7zYIP46ik6zdIzyqHyb4975tp1Lfwks5N
	 rCaT9xdPcI5+pP1TV15YNZVWApWVSSQdor793t7iA+UmS28JNohpAKI1JFJzVCmnJ6ToE
	 WBAfp5bbO5doHRcjnypdrLbNfg8h1rm2m7qIXhrfi/P9cdiPIIiAn4FOoSqjW5PhF9Gk3
	 +2RH6aKKRHGlfzz8LufiV9YFz2vQcuULY9oJBBPfnafTaUA2of41Kw0qC1zhBglR5o5sS
	 qLBTOCHGqlMU8LmLf/MapkJgoeKxlPozt/LYmKVctn7zxHL7WtWcO6mAFJdoBpdiSjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7UWmy9z;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F5606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u7UWmy9z
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso16189610eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748359; x=1796353159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
        b=u7UWmy9zeBeSOYShPfASmxB6MB79mAuvRSrMg5ptShul88p7K0FeVWEEuKP+nMH3AT
         8NHIr6C8kkSn7PO1gMIwTzWF3z2mWlYY++50oj75CV0acS7S6ElLvdwQ5UKJHB23ltCi
         oQcgyzs7pxcZcAt7GJ71IP7kcOZ9AZilZSmByfQHRvTp2sbhvAkF6XeZVEOF6dUcNH2p
         XLBA81RWGXM+ixwiKnd7UEI1yV3eKV5/Gmi6/wb90j0bjlSG0viit36af8rtImPxgEug
         eU3rf8RtjSFzZkncQhfvgXNAqHXL4vbrZKO3OemwSzLa1dXDHVYWvlxMaFwmoiSn6Tsu
         5BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748359; x=1796353159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5ExnJt0qck3DRDUPFaDvu8b7KIWwdeeXU4WMSYgy3E=;
        b=N/5DKtzGqH25NzBDepuvZeWUY8YrT+01KWeuYadJEIBiwK2OOVewKUjxHSyRiOJ4/o
         pEOVHHf5u4eMxUjCxZ5RPJJMkAoSiac72uxDC+kfCCYZJI4KhR2E7VAjIjUz2aY8ZCzK
         g+vj6PPIe9BzQLZPoNG9YKJmiLCH4XZPUPrxc/l5IRBK4IvYEjsn0+Qyr4d94f66knAm
         eMvGrCQqZmO7BoWTsx+/TwW4Ri1M26wNsbro25MWY29m5Ce5OSBvUz8ygS+TVA0fAA4y
         vXa5K3w9X1V1dB68M0aXXhqaPEOnakWka8TTWNbkxGKgI9xAR5P5gn1cR/HEDPKpV2bB
         Zcww==
X-Forwarded-Encrypted: i=1; AL+hErHQS7vo2iqULAXxrhB/e0QhAsWd9tXS9ejoFcSDGHFXrHYllG2SGb+/eXLZvjoJZK9A/Yy8mb+/6z7v@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZSt1BE2KUvWO3HcyT4cQRhWchQiHpEOkylG93DBiwM5O8UxNW
	e1ZTCazSVO7sjTNXa1xsyxq4Rq/jWxGdS+exsDx/Ex0IyyPFYsw/ElrL
X-Gm-Gg: AZFdTZfsIhZxA9v+UMm1nqVMqsKEkpCyG6KqV9keD1kA9kR56q/d0aiLvVpDw/wuieY
	r5Ih6O0H+jkoSB0731sdBxmGbbu+CmaJyZGuGmA50ACIH0EDy6T8bTmbjWepjj7gCC/BTg3zpK3
	QpAjNNkTNVEWfbVwpsQ0euAfoH++TQe4dO19T2MPXy8rkY9YyYJZr2We+FHj7azgajGWprT66Z4
	03Mhgr8sMBRlERd2UfbTy+KkzQEUQt/0EDDgMhU1/hpBLYakA7vS5lYwmse8kNPMzaIOU3MWv75
	u8BNlrlQz1bdoDBWRW6IGwqnaAFlZDS/BGDFxDf69dPRWiR9DxlephJflGZFAL+AGofYXrcf62h
	yYoY8jVQDU++YdGWJta+N5Bqvm2TesTrdm1ExhuZEHFhW5jjW1iWsQ7cTQWxRYD13PHHT5QgjV5
	HuX7NBfAVHhERplB5aRQUpBg5Qt7Knn/qWPxvkHV6qNyHZTqR4GXkU89+XyQotzNc5YCHZ+vB76
	GHdkHb80GgAkzbe/f9pjz2McZ4hMW32OSR4PvKGY6k9etUooxYOGHv+5H8M7/yQQz3ZtAlZmjjb
	XCBGa+uAxIV7/+xorfl1kC/EBUYBey7YZPfjCsfjbS/TIvI=
X-Received: by 2002:a05:7300:cf1e:b0:36c:b138:651e with SMTP id 5a478bee46e88-3857093fd1cmr27144602eec.22.1795748358624;
        Thu, 26 Nov 2026 18:59:18 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:18 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Fri, 27 Nov 2026 08:28:16 +0530
Message-ID: <20261127025817.20090-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
References: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
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

The AST2600 secure boot controller also provides access to its OTP data
region. Reference the NVMEM provider schema and use unevaluatedProperties
so common NVMEM properties are accepted while unknown properties remain
rejected. Cell offsets address OTP data rather than controller registers.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Validation: dt-doc-validate and the selected dt_binding_check target passed.
The binding target used dtschema 2026.4 with a local diagnostic lookup fix
for trailing # in schema IDs. No validation rules were disabled. Two
unrelated TI type diagnostics remain; no SBC diagnostics were emitted.
The valid example passed, and an unknown-property negative control failed
as expected.

 .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml     | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
index b8c5cac..d8e19c2 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
@@ -13,7 +13,12 @@ maintainers:
 
 description: |
   The ASPEED SoCs have a register bank for interacting with the secure boot
-  controller.
+  controller. The controller also provides access to the OTP data region
+  through NVMEM. NVMEM cell offsets are byte offsets within the OTP data
+  region, not offsets within the controller register bank.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem.yaml#
 
 properties:
   compatible:
@@ -27,11 +32,12 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sbc: secure-boot-controller@1e6f2000 {
             compatible = "aspeed,ast2600-sbc";
             reg = <0x1e6f2000 0x1000>;
+            read-only;
     };
-- 
2.47.3

