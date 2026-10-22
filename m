Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693884;
	b=O+4hT5tBhK4v40Ct9XRciTbVV60jtK4idiwROPghJwy9b+ie6l3DFIKziwQw8chnq8AG
	 LlIpB9UFA7qFJeuS8o5XifWj4umcV4xd+3NZasv2GBPLILimKR23l3+A1baN2HzNsEyRA
	 JySc2kqUkCL0Y5H2PGGJG2NqKeNIO1v/+q1Y/GTVhsIU/xoffBgNHTcfVV6KqcH1JLp02
	 IfdMiOMUNmeKRccCBQS9+zOYOpu+2Zl76IBl5SNi5NDaho94jkfvQNnWlNoH89c5r5A9v
	 TZFfVlghfP6KDagnDTTVbiRBvMwqExul26CRuiunsWpJVE1GGx2rerPREwFfYxqB7QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
	b=TNlyM2c7IjwJxD7pFGftaQI3Egrr32hOMMobTLvtQkU/C6YmfO3tMLnyXj0atEnrv0X0
	 lAP7TUfjY74jMb2CSwhWkxVwf46OLX4qPBaP5H/0eCoQPOq3x1wpBUhuY9wC2DNcnufva
	 n8vKhTOVQmWTE4qEM4oPtwHa6UgsKtNUkfoVk2ozcOnaKybIlOpjijnyk8QSNkxPvpRWo
	 itJRf73KsUEqfVSz+2D6BknrUkQVXRQRdd4HbfLgodWu3QK2RwraRee2uzTehMlF6dsxV
	 +HTuzbkTOIQ84hOJRG9ddxdLVbtBaYbyWs8AgNfvMh0utcPadxIgB6Piynq0uly+TGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wt5f+TP0;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3078360A3810
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3078360A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wt5f+TP0
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso1010145e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693882; x=1793298682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=Wt5f+TP0seN07sHS0NArVA175mcjKLFfy33ZTLF97QbrlKxzuHd1raHcSTAbYeI7q0
         CJ+qd87vQ+EF/c8hJN3rN6aJ750ODZn0ra8VlqBa/3BOzO+SSv82OM0tB9oG+9Br3kXq
         RWi/qLcX2Pd4IHrLqEV4BFm8XVX+7Za+h4GaDc8+Ufs7dd74J6R0wkm5WW5F/MtWHR9D
         Rb0UBQz/ZPufn7et5xX4mcDHyXSnHStltbUZ8uULahTFZ36Y6XvDNiueFS24UKlGWvTP
         eX/92/hVKsiDYdbkkyjHMPrrBMU65ETpZAghNTP6gBrDX/zaccq1Fj9pN8SdHJkkGLPB
         /PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693882; x=1793298682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKtpVjHIm1REdWtopBuEh9y7AbksNfVL8iL7r2iisCc=;
        b=H6priIrcapvv50tvAr+jkK+vtuQpVVvskl6eLN/tZsu+pQcq0uKzIDTPG3s2akY2po
         SusYQPZscT4BT8W7BEWUrPq8R/fSN8ia/FrcIKU7AXN4+tE1ee7xYttLTq4acl4AM+2h
         z+90V99I3rc/Cc439lULHu7wW50/coiNUZ16iF/mwDSfM7suUIReFxav+L9azbNPY3e2
         RR4kfewW4Q/lAcMJlofs42HvEBbWhY8Ib95xfO0asBDaRHYUBllHmbdq/l6vwaQA/JrR
         A+SZgrSL5sprYrbFvzCaIoxKNdObEqpfj001uliZfOjj938QeCm1O4B7sR6Z12UOFhVt
         V9EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhJFNOW/+sc9gbj7OB4qbA7VioGXtKaOPT8C3dK0q7tLTtC91O+TVlp1OroXKBz16AORhovc5l+BSt@vger.kernel.org
X-Gm-Message-State: AFq9FYJvfUoXyRS2NTVxPgqswe3/pLpWylSEjH8/gexpYkISs2I0Vg8Z
	I1qvgB03skkNgcN/vcIgKfRX9mxc9Vvb/On48FYDeCSfsngVojqt9kGW6euBdazQhJM=
X-Gm-Gg: AYBFou3rcWIJRhV/rpVmqNfsRPJfxiC9PReBhsXbUw7l+9iWVduruG7oCwZCMBnU0II
	U/HnPoWfAzfUCjeo4uP05S1HBKUhKmI+3xYAuG9FXLDYsTSUNwHdmaz8PCcwuS5aH9hf83+WGqH
	4PMeRhNTVCgFa5T2UIMy1qpXt+vgurwYzxvT82ZKvUT12P0A43+ONWqElxWNbI93XaGbLeEXMtD
	Zxh+vcfwLho5fGl0fCw4qDxAS4d0G/YQGKCdP56Y/4rCBM8EnThvkJnEBYUaBKSufFfdtzqnuda
	7GJCOTdxGaxAC8jMBi/DYSABEkZgyqVo0x5sDfNyGmiycZ+MfSXkWf52ap1k+0+EfVX3KNagIX8
	WofKW2n9/cdkdKX54c0tmJPZryDKtrJfXS1cVWDJsNHQZPeGzwnst/A70XoTzj5eY7IwMIcr0Yj
	CRZ2hs88tcK52IiANYch4PaXcL+/DQNfGkwDnJZSx//G2mpn8rWYryr12gy+S5Vpke9OUtY9g5c
	SoiBmF+W4zBcZjCTY/98GOy11YTz+ce0a56BFRQv53Vos2wV9eNML3pwQVLBCsIOJTdEWutWqmJ
	VQxD3QwnVZf3ah+k9I4v/FOvA0hS8w4BUpiU/NqXxQ==
X-Received: by 2002:a05:600c:540f:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a1fd8cde00mr114350305e9.4.1792693881668;
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:21 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:30 +0200
Subject: [PATCH 4/4] arm64: dts: amlogic: s7d: describe the GIC
 virtualization regions
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
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-4-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The S7D device tree describes the distributor and the CPU interface of
the GIC-400, but not its virtual interface control (GICH) and virtual
CPU interface (GICV) regions. Without them the GIC driver does not hand
the GIC over to KVM, which then runs without the in-kernel vGIC.

Describe both regions at their GIC-400 offsets, as S4 does for its
GIC-400 at the same address.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 059a1bf37584..b77ac8898d16 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -85,7 +85,9 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x2000>;
+			      <0x0 0xfff02000 0 0x2000>,
+			      <0x0 0xfff04000 0 0x2000>,
+			      <0x0 0xfff06000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0

