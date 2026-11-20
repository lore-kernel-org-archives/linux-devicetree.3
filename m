Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196763;
	b=uWPvs/BpnOXOA4RHalRBiR4PywmfmWGNwgRjIvlIVx35v1ZGOHSLbTjhDXZdZGfnIGKt
	 wSxmGpd1W/qxDo2PbR+l4tTbIJsoY+Ug0oXQKbo5Sy3RDdQjezpuuj1tYNqGUrCKbFLRE
	 NY7Fjy0T4Q5KNJGrs2x6ne9bTg22VQvAlrMTpdg5IJDtJ8HGsODstNDMnIlwAwyYF6jq9
	 fcSJJBYHLe1mDV3b+bXSc1U7NGCCcdKwl9KFY2r96WanREQLC2squzgqGIwMaTEKde1+x
	 j1MmfzjaswOMkem3sXC5a0eaFGZw7IDTuP+92FCUdoMRXyp3MyOxsfc7JuL2mm59T0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
	b=iC1VF5EHF+8VYlIgtcgzK/PX8CY4LFDakGqTunUgfdY1V5Wkudvskp7KVTpqdpxrVef2
	 JzDibaYx8mMTAlLydM2GuH8oVEyg597nE724IrcOQLjj4HoLPCz/T0Srttl1PZce+faI/
	 vSgtBKEAGOBk1YkPZX/yl2JjC38ok4ehwt+Fjn2LCLaM/0oVHA52hlG0khgFgFYWCHCZ3
	 k83+hqcfh9gUU9pTEYfHtDq2q0Pas7WufyGL9vVemx/GCXF1hxRUHEqh22wUMC5fof8Hc
	 Z048Di6k6WdnDX/7TjAh2g/JKZgek9pX5hQ5e4+WnDHJPXWDspdiaSNHDVzqJ3tRX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcKekxQn;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F1760A2608
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F1760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcKekxQn
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so927627a91.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196757; x=1795801557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
        b=LcKekxQn+ROjfMk6duFoADABHEuBPGIOXrCaipvMdm2ps2wMWiTwRXpchpGTcTT8lV
         mayMYXudsTVG2zi52/NZGaSG0Ko9bx1qmmF15yP+aX+UcFMAZxegiZD82yW7KKIU6trr
         BtS0fWaA4UM1AaP4krajbRHyiugpwoXLZawzmFqng2ZxcUAW/lSobWb+J9AX3kzN93Hz
         lsv2cfMZ6KChN5A8yMG4oToUOSaN0I1sDmK6D1wVJkOldxIb3ObkS9rFo7hQ44KkvOQT
         rZEojMQ8wT0yV7930mHgGWCFjQdjrVLHgkyBW2+Bzal9FFWdhYA9AgFfr+llRMxcMKeS
         X2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196757; x=1795801557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jv3MzpXevrt0l8qTf3owJxVOyRgS/1wt1ixwNzlgoyg=;
        b=2e1h/PZGO3apQxBfXxAJav0+Ji7teze7eoD23U/fS7X1cB9ZZXsWL3m5ZvDZo/4kdz
         wvfkmjfhQjXW0PxkWx9mAP4EY7TGybj0/H6QUGNydWpxuT7D8ONqF52rWSQwWqz6OXa8
         UWNX1QpU5alMh/jCGq1rwuPF2eFtXlALyU5HpGMA9fHva4CpRjB7ndD2s8X93gz+M6z8
         VB+ah9BJydb+Ur964LMOLXwXnhPmHu9EQPeM+Dv0fok5hnmwfxrZxtok3kIaMXGPD7+R
         5ZoLJF+YoXGg10wlnZMqhHmg4wAMdH3YFGwe0tMvsujMVt4Q/67+TPjdPgqu3pWnEy67
         +lAg==
X-Forwarded-Encrypted: i=1; AL+hErE1V3ZDPWYYP7vcXqCHGKsbYHGUIUVeZUfQ3acMg7sk+Ith8RrVLYRuLnPdyQvhW3F/lqU75FNYBx2E@vger.kernel.org
X-Gm-Message-State: APuU4Z/q/eZ6zcufdjyNhR02fARX2H4owzvqq9bkjdGT9559AwQL/Qtv
	I2Zcin4eOIOODwiH5aN37gCFk3NZ3kt/lNUKUOY0WQrU4m0EAHX+QOCr
X-Gm-Gg: AZFdTZe0iliQmDl7IsfeItP1N/9VMXKTM5romUKbTKK0jNN3fONx0eZMHDfOn+OjdXO
	Nc97/yypc5F0nGl4SI8u+PtGmlzOirmWEJ8oBQm8jEQgS2s6S+2D4o+FSqTbPhalV9Rudv8oqKU
	NbWPCfj6F46UYatsYX6w8winX5x3b63dXwuc9F6sHW/sSCRR7emc8cAcBRlr3L0pKe0v82KizTm
	Xn+ySlJP2MAtkpckj9/aHREaeJEDYRZGSEqGytcfi3884/sKphD63dgQULO96yBlsLZ6bg0f4L/
	fZSPMjKDU7VkbSZ+1cMzPlhQhVVUlidiDt0kYxgKInUp18Gie+PBXjIhYTCTnYK1xcygtnWUuN9
	igaI2qaepDHsH5UAXCSJuOFlS8YB6ih2k73dJgIYCkyeEBtQ5phfKOajGWes7oiHAsEDSoA8pr5
	+3CgnsYuvdtUZr7tlLBWjBQfXMCdw661JgZOTQH4tp2+BRRK9shAmHRrTKud1UymTuHF2UIQQtE
	gm24oWgeFL2/V2p1twRCTLFRhdNlhgxZd2t453n6SBSO1fgxNAtufdstmwnvB5ZZquK5aVnKOO6
	LmEoe+OpWu28EmOFVL0ax25IlxoBBHM6BpImA7TxSobuqg==
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr3378438a91.27.1795196756648;
        Fri, 20 Nov 2026 09:45:56 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:45:56 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
Date: Fri, 20 Nov 2026 23:14:39 +0530
Message-ID: <20261120174440.123487-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
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
rejected. Describe the cell offset address space and extend the example
with the read-only property.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>


---
diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed,sbc.yaml
index b8c5cacb0..d8e19c224 100644
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
