Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232519;
	b=JYs4UoTJlp+cniHT1cy/DW6KqeM374+O7HHABes7770SXG8MMVCbD9UWf6RvAoXALY/v
	 PkGshaOH1OYA+alqFMqBkpdHWI/A+MbJdMCSluKI1C76JPwAMzbQy3Q2Twvcsgit093qs
	 9gKvoTVnfdp3isoOpNGJJEZcxm9M4SnBJt8W1Lb+Lt49+H6gsyHsvdg+xGlKOryALXOtc
	 FlJ6lQcw2TbknG/7xn7jiErjm/hSWWGfF+aoRcW/YiRSgOCIbsJj8zKthV8cE6JW181hv
	 zV+welLUAF8MN5wJ0lQOTywriSCuLIUtEO/Kk27aJbuCWq6zbb8YcYmUc8b/Cu4sCRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
	b=KQLtZ5wgClRrg8XVPjVxB9DMZstKsySjPOxN+2iaeyhCBVS7r2g+jFP4KgEbTSLO8fUv
	 5X7TsdNr43yTAb4qj8apYfmjP0sS/6fqVK6uIQ+r3Q2v5MpaP1y8IyZjpE4F8TGY34s3R
	 fUK58GhINMx7bBW96zQOOai5lQi1/iYjFm1MyF0NFhPlwWVs+I5U+b27P+IpSUnVj8szQ
	 nLt5v/TqTokaGm/TLUId4zGfgQP7gPgeONcdcHh/eRsdNgvL91OAVywAcxaAJUCdRQLB1
	 1LPRFQ926POFIHuvC01zcm8cZ3yPoy7Q+5EW56PSBcyu5CN7EsAni5lgh4kYLP9H5MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grCEIKR4;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B71606A6BB
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 03:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B71606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grCEIKR4
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so3483080c88.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232499; x=1795837299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
        b=grCEIKR4cJMWF+IQ+i5NqGc9xVN2CF0ZHSSlUSV7Mu+7qXfp2Pk439cZfm5xDIPBk3
         vPtzQYQ4lqCwENZ3qfD97Dor1tlQDKOcWav600UXFxRCe4Uit5gsAT+Ae6M20ViCB+++
         C+PFmzVW6LbFWthQwxqzf19b8F/h4iQU1Zcpbb3/OyFNX9LgEgTwUAB4pNNxOeO6var8
         p03cdy8K3T5yFT1ONv/e3yI43ZL626rpWgH3yl4P5q8QYhzDdE/fB3xLL0UkVp2ec17C
         ZshDT97Ca5nx99k89W/kGSyeIAedhRDKXDSC6pepA026x8nLqCVVnMW4uwqkNu/R7Ju/
         4VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232499; x=1795837299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ah3lmmwTO4kTFu9w/FRtwILA0EF2N9TZsivGOFrxvGE=;
        b=ecQ/EOaW5Wkm1+YyqwD8raKP1J4hm1QvL/JW30hyh1yGaklSfQ/W1w/wfQ+BZs1REh
         LL2dd1M4nFEJIOYzdaeMTUpBFSrS7LNU6uTdiccg3uSPwCP2Xx7w1Zys/KOcYZ0e5ljN
         r9fUnbzExohUOYegzXbtLsh6tP/aqo6r8lbmvqdVp+dTBJ5yBeR5mxOdXu9gcP2Cv1VP
         F1pRTj5jEDo7bcsTWxE9H9J3nu5Cy7Ulfx7/wyZJ2uqAqn9NUboX31g+zcK8Bg3XhOQY
         nh6OtnHvwJfpNUVrCUkDY99T4zwf2LBIlxpIBNId+IQqQ3Z56xHUmsp5fy5cWSfYTGba
         GKtQ==
X-Forwarded-Encrypted: i=1; AL+hErEZQWFpCd4cEvcn+NbivU0OBEkp170M370IU3BccRV3xb4FSwdGKw7bE42rQW76HnE+KNxgLbzEDHK5@vger.kernel.org
X-Gm-Message-State: APuU4Z/V3Jexq6xdZ2J4vWQf40Rm80gaMX6mgxXkjldAA22877i4IhMg
	nMCcXFZ25g9OfqqMyKigFdx4kRa7D66D0LUcXdn7B3RIhBDX21zkT8Eu
X-Gm-Gg: AZFdTZe1sLonlGq4X2gCU0bYIX6Zz3u6V4XA5al3/67n9iAVYKkHF9KJEtwfG0428L7
	+fgObI4d0S69YMaCvy840ueX8hJ2uxiEDmqbsf7xEmfIATgDHS2BSV5odpqMViYaza7s3dMgzWh
	lCP+BYudqJ5WR1v5HvzP2qQ2RzUEbX7yYT7wbQ/VsQ/LQplXi4x1JGSPBVjpcF41Rw7e+srVhCb
	2dnnuujm86++wG8/VALdMfPJQbq/anxN38gIzr/PrA1/MowLcfVUB43kBq5LCysxRzPFC/Uwcoz
	yCegp7u1sugGCQcAaQh6m1ZOLtpAYUBSH43uLQc/x/IoFlTttk9/EN2KDbhnNah2MAO5CXIvqkS
	zZgYB+kQ6ryUAB390mkWB7//5eQXpSP0kCBEYVqcTXhqt/XEV23GW1dUrarLBjkwbOUY5n3wAp2
	tGpipYZpHX2DmqsC0Qkkdok9OIZltJjGu6WIHjKn5vyYMYiaiLApuc6rr7qbOqtbuG+TyiGAGHJ
	ve+G4F6sk6i45VyF3k+iaX/q7RaSZ4PFQf6cUR7qjcSceNmXQCkoSXz8/7IvX/BbkmxxRuTzx7i
	oIZ3evpWFRWiOe1qrIGWuggo7yKb/X60pbmUmPtKGvltyQ==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr5305042eec.23.1795232498643;
        Fri, 20 Nov 2026 19:41:38 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm20891464eec.3.2026.11.20.19.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:38 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Sat, 21 Nov 2026 09:10:52 +0530
Message-ID: <20261121034053.39878-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
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

