Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432748;
	b=lMAh51TsJvAcGbQoF0oJiDilRjbi1YR5nVxEvr3OZU4ofc9BxS+SQg0Auzaqnp3/VU1P
	 45YdTZIWAj1+e+yEHXEnhHc5B30q3h2TNWDm5VphylU73K8kzpukBG3GyTkPoVDEq1Hah
	 zb+Wzw9hwM/YUhWGHEf1hu2Sz42h0oXbEznsHV1PMub9vPCrYoTGuYAgw+PGJQ0HqL1XG
	 Sf63IsbJEmvX0EqcGWLmYhJBfIAPgVdyLmzYDYuNtVU1c0e1IQG++xzA9Pm0HFRl8eZSR
	 uuJ6Bhmy3ZteXOIb3W8Gb1Y9cUC2GdXQWXfmCgjr7UZSTGuTcyOtpIQMAM/g7+2dIMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
	b=LFJ8bEmTo6zah/mHn2vXjMsoarDhKWfLEHoi0V7Z9NPJcvyRcbN8T7YI8iz6/HVU6ES6
	 hO1DW78YYtjWSYvvZv5ZyywAtEG/szggYGGLmKiqKptAcKIkIdjctSrdDjXi3eyImnrBx
	 iO50IvzbR0Vii+Y5UfdI2UQL+lI/DoLsxgkmUPs4y9QmXEAsHp1bcRcXcmZwpbOCpWVzi
	 L9VgHLgB1R4oTMRM4FJTJb65AKUx7WeldD/hJA1Be9PITmEk0IBLpf7HTjluQ2c7E9KtO
	 yRBxp370d25UPUREQBv8I55F1JAuY3i7SSkSptF+dI33MZBXKoCMPMoYRgPsvNJL4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTqjUcY9;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE860A2615
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EBE860A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTqjUcY9
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cdc606b47so530217066b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432747; x=1796037547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=HTqjUcY9hLartbQ+wDqUUWh+DYA5uBQlIQNY8L8c0PwQFxlYvRUmqcKq9vBHjiWlIQ
         ZEUY4IVw5jmJePNOlSkdFejLPzyC/gnES/8A9mJHHXOsB8T5NCrWqcjznvksBUyFj8fX
         Gdoirno0KXw/7rEQXjyZtluV4Rd+3+z/PNlUakMZEHUQWIAO721PWX1/mvJ6P8xawItb
         ysROTquAqd3jS2dFl+6sDSphM2xYXtslTN97/hpIFiJOGhGv7AuWUlk/hK1ubkcgPaD+
         nmyLdRZ7rePh/oqb+a8G6vq0onwln8KbWQTA7ew4HWiVbD2Xc6bis5BHikU2+BPy7iLp
         b87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432747; x=1796037547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhdQyf6FbFbh0WyyBUC7EygAiye6PpyKpdmvafidO2U=;
        b=oRBHwXFzTHI7s1vWt7mZY8GhPRgY1rAtDkDPVnCa6O/e2ErwJxZtw46N2InMXO3Fqj
         19c1OM5W2SdZjO77pOIuBVL3oVzA9nxmWixjsd5r5oXLlN2QeSJXqn7MlYcOY3ZAI7kZ
         hy3d2uxADA0AR41RpR7MVXSuD2iK046Onp2cfMJ1wbZHx5QG6h5kgrmc3Yt/UX/Ke6IJ
         c6INQ6xpDCTY3WfAPsrHKl6PjraHbjUyAIbN/Tl6Cj3aQkhuHWtv6QDZ3KwiEvLyZloR
         MTkq3ldhJBXQfxDJ2SFzig+FWYn9sQnEiaHrmCVco50a0+Cq7yltsoi9bLuikakXTWUa
         XezA==
X-Gm-Message-State: APuU4Z9/09o7F5EcfSOl6krM0TVyDE05DGwmdOmXl7pChLi+kQ/JScYe
	ek/hxmgixL0LJjD+ZX9CzZGcIPg4L1ok2Bka9CycNbl1mbbD1pJX0Heb
X-Gm-Gg: AZFdTZekWC9s1F80ipFKWSvWAlqFPrxkr95WJIswCiyZCxeAzL1HJqzpJI4iZIOvn3o
	0nvvl95IlUSSNJq0uyeHJjvzgiz/FEtIdJBXRD3QouFqgVmzdikDJ7ca6uoAjutGhxpwqYz/0FW
	EXYprD71oN9fKAHnzKKQEbrtNhf5HVE9PLlP5C8iRZp8vqcVfsRu1cVslI6bdsU05TZeFHLEyGM
	zy5A9BAQSoiKE0ZGOr/Kqy+KjXGmFI8PR1UhZdheyyyepiIKE7VNk1V1mhRp2amQA223yf7xEKb
	g3EDxVGVEt+jHTv/DLSBk5BujlK3GFf/YLhElIm+EjomoCd+cxkyR3ZDh9iV9BDqabmmz6BSkic
	bXWkLEH7RuSqCcJYoCMjAK1Pvkskxjg4nmym0tSkRwctjAlAvo4C7TIKMCKvPzsxaKmJwpsdlC1
	BeDwhvIKLAJuP93Ylyo3vq5zJvavr2gPBm9c9+OrzVmmZfeOV9SWuSd2OXRtZGv1CHt2vsdiLlS
	bb4pDHQtKTaU8ORnQ6LxSus3tqIdoojBQ+M0tWXNuEhsj5MS8RVHbYWNMQgyh/YDd9411Qmvzub
	n9DPlb5HpFl0zIRqPCLtvnp7LxRTYHeIF5BRtox+Ll3nZacnf+4OSesj0OQ/AZOviA==
X-Received: by 2002:a17:907:1b1a:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c513a5ea1b5mr863152766b.11.1795432746902;
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:06 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:36 +0300
Subject: [PATCH v3 3/7] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
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
Message-Id: <20261123-initial-mt6895-v3-3-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

Add a compatible string for the system timer (SYST) of the MediaTek
MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
through the mediatek,mt6765-timer fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..ee4af54c29b5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6895-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.0

