Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938270;
	b=q97/vtxfZUDAR07RLkt7ueIvlvRmrlfR1uVE2sl1NxjJAywfUfDnQtgT1HJTlERwDm1f
	 a+BbKjnGnirsteZqBuH39EaAKnsIyXC1ix1RUSmhVB8jXLGtjvQJ9w95BHJOEQrk8xChS
	 3Y1aP0YWZ9BYlcP8QDFjJFmBvmzhmiFuTsVRsCjCQaM/vMHWecSL8ZGf/Z3kzQkMl9b8m
	 7RDvaCxdoKdanA3RqJ+hEWtOEh+h/9fIfI72lbE03HYLYsY/JheVtE+c+GMxsHW2jp7yZ
	 Hnjdv39iF1EKRpujYW3Y5lUo7aBseAGU1HCfybPaxL4a2Nfg0rdwdNsvdtH3TZfNEVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=ZFQnmScLPsN5fZwH8+sRTCf9iZE0BLqY4ExN1/6EJ97beZhy7FLBE1Cdbrcheo0kdAu4
	 LzMFUUo4wh/fnArV56GfM1H3U/95S6GfSzT8+Sm+F1LgDQAVUY1t5A6MyQ8OwI/MCT2Fz
	 iHstwez98QwAW9VDKjug33804OhYn7KS00C923wFBTYZIV7NKPGrK85AzZuV9gRlYkHCT
	 t3U4Dqb2gtI4UMwm66Mu/DXxmIOToaOdKZN4Iv9lkoBL0WTGfpJ7N56++x7psnt50yPto
	 72qC5MICaNo9y82CrrB6L9Tz6ab9/HL1F8dQAUKITjMikAgSbhg77fwTN2AsaiyLrEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qu1lOI8Q;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3697606A31F
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3697606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qu1lOI8Q
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so14911885e9.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938268; x=1793543068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=Qu1lOI8QZekGc0/T3lNosVhVwTnTbJ87BRp5/wQvCSCYPk4ikw+AS5UJDMKlxbVEs+
         aDRKaCRya/og+zMFwYd81rsxgBxFa1/X5ySr3j2S4jRMiGp/QCV6f/AVhatXNWurb6UE
         RvCJqwQU+NzB4bPso1dYAlrdgoTig0bHUN1CUDWPSNG3r8Kg8+zhMR08k6aUfbbcEmMk
         GUxWNS1ACsh8WgAVL68lI5JkQlBw6b1nf1K7+Z5Q61tsoHuDL7uSUZN9NMoJgsmrxMzV
         scu3MBpumqc8oyw5GFlS2jUunLJPrOtNMMF1PN6VMtQCbLHm30ZIv9Mzuw92Pr+GaL2A
         gh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938268; x=1793543068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=AkcvoEvlrBLakhq22CoBna8LqTL2VnhZ5/QFalTCgcdEF2RPvPfKYy4YlA5eXWRFL0
         GXGjuld21e3gD9oBoy4wjdROZtv0QDkHfC/W9UgqFk4/hRx4O0ywlxQbVZwffU7vG+UN
         UxEQjLqU5eQpxpOD5RSYPU6TezUkPabt56bfL/x+c95QLnUWHspvM7gHDFk9cpik9Ayj
         mlRfqRYrsBXeq1lswzt4ZKqD8Ppw7/DeTLxuybH7eYma0vslb6HrPzxuAvN3vPFjjrM4
         +PT2wF2J1+h4XXCntc3JnVJAh8rGK2AigMDdMaXlHk/zeysv/GAe4SLqt2fmDp8tN1cV
         PnTw==
X-Forwarded-Encrypted: i=1; AKwUvBxkbpvkQ4yorF55XoWsw16rB/C8WonvEEYF2p/+WRNxX5YtiKhZED8VFz9AA8OICIgMvA0yDlkKsSnz@vger.kernel.org
X-Gm-Message-State: AFq9FYLKvVnO3WAHyL1Zbd2FF5sG/icdMHw+rSJtV6eW/jhIFDYxGhum
	Oa0sePh+cxSBl/2X7Yl7UuKINITFTDTtsHQncIHGZ63ys+w6SooEkgCC
X-Gm-Gg: AYBFou2NX0apJKUGJnctoKNw9OHpNY8tzP6Ic9xOo3CDeFvUBrCdbjuoXWRvNeyicf0
	QUUOYk+ng2ASzzOoXQAWafC527suHifzI5YfbX474IK97QkgOB5cREhQtQuqINEkx44gHcSsOWk
	Xn/0x6PEba5V/8qm99A+FjB3K3jqbFz2XTBv6uANRnM1QsThYP5YPSsngHUp03M/51uQ3nAyGjI
	AHqlfJylzAOnMzsDxP58ez/8rc/03PKa5XSE6VnRfAO6bZN+JYaWP13eHhFlfZkaAPkJEK7bQdt
	7wLog3NuzArChToZz1kgUIgKuxeQ35isbHO6FfFOxVhUl4Q6cG7RMC6uF5ut4FkJlcq0+7H84nW
	hQB1/E2lI5ujOX5QmNjf9IEgEpux1TNGT1oi1xbSb4WoSngQzEc96hEa9Py+R1rq6wam7/sAZW8
	g2jlwAveTuZc1kxAhCIraga4SM0x0TNq23TeVMdtU1DnfAtFkTfxBCC4+ABnz5CwpGjALWYNfTg
	vaGjl8HXpnsYULAyHxdJ6V2ZChO8NFHVxFHZMpD/uz6gvYfdgjEcsGIT0/XompNmcI3/rAfvj51
	YCQqqOk8MxJiog==
X-Received: by 2002:a05:600c:34d5:b0:4a0:2391:6540 with SMTP id 5b1f17b1804b1-4a35aca2b53mr66206695e9.25.1792938268065;
        Sun, 25 Oct 2026 07:24:28 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:27 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 14:24:11 +0000
Message-ID: <20261025142412.112216-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0

