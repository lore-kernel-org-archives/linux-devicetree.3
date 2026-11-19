Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092713;
	b=Fqbif2U8Xb0alDRYYA4K7up8bYlhgeI5LwlQwDLd9rZrSYc6lJCL8+H8ffEjzOXetbjz
	 OfvL0aUV23JZB2zQHqeUX+Wjw9AOXhUAh6AcLE7S0+4YgHmFrmW52rc6ZKSjr3dQBKRvM
	 Jb0n47mbvYaPpqvtwVKC89DeZDiOLZOSVrwxvKZY6VSkA/uUCdnUIaMDZ/AlrP8Y4crsS
	 avoD+XxnzWfCHROIVqWs+dZMBUXxg0YsouPiQClvo4z6nxzj4K+xD0QMYQzfNgmZ5I+iM
	 3RJFXfViUxDsnvTBA4wx36PsvI/Z1Zu2okfE3cXM8i2nxnwU4jpVkdfeFTR4HECkdWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ir+OchFzfMqNIfCQ3ME+6TTBvwXiIliHswVgA6zvQjE=;
	b=w+CYO4t2+Wv6bfsud7kaBgqj562+WcoCDi09eVzodyH4Y2Kq9wRyPLJheOsNJQh69iCw
	 662pkKbTrD1aunYX8++D1sZNGl5Ko74qk4uNKNui2m6zcxu4Kolslwh1WgPV+KUxTOGd/
	 tLOUZKDC1yFBDtS8byQ6+CMfeyy+ErfR9IN2CU+24Kjn+qsV2cPCjgQzDs+1NZRHBRLxL
	 EMeRDK4vUH6xhFFdGyF94uZHt2toJcbB21QEvLeaKvoyqIYYAlytlBOgs9/xWR5QUB0Tt
	 wjOcgEskTzsUcu/WXOmPumPGvzH3aoUa9wwVNTfAm7eEwdin6AYk1x6cSzi1MruRYzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4J8mgHo;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485BC606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4J8mgHo
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-3831d564bcfso543485eec.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 04:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092712; x=1795697512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ir+OchFzfMqNIfCQ3ME+6TTBvwXiIliHswVgA6zvQjE=;
        b=W4J8mgHoN+j6jmioVoKW8qWUvqzzp9q3cpZAVKb2w3gTYd/zsdukxlUxsBjWvgmUo4
         ADJdOSKGTNCDEbb/nF+d2FA4TBZ41XNsQZvvEjHnNJj+jKByCpv8My8NIKqMvAN1g71G
         cjbUrTRxhxCCgZzrLsdKTU+7at6nNZH2z+XkIUm9vAVrFnMhILmzlpK02utycRdu/QW1
         uGqCXdWrmgMM5feOUClg1+Dstab8FHY53Izm5DaReea/siAvuXD2BdA8bNsfNg6XvIv6
         voUglqhhjtg5/x/sv1779GhNjmzVzbZ+wsKFtI4R3QhBLNlfRx7ymPaKmFHGJijy3OBX
         O6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092712; x=1795697512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir+OchFzfMqNIfCQ3ME+6TTBvwXiIliHswVgA6zvQjE=;
        b=dhwaXuoYnPcTlZ9Fommn9PwY/dQhbYo4QvV05LUmn0QYY+3Ib9VAXMSUBT+q+6PDtw
         EnkdZDUi0TrW5GrSdD4+pSShYs5Ab+IN+RHT0tnoFMw4+xJCAq9Sqw/qUHQiH++H9ZWK
         WbJN0DzJTpDCioawl9J1WMmHJ4m0qMl22SrlmdE4LMqfbzoO9099Lcf5uTOugo//0imD
         t9ke7qhQpChhuzqI045yTXNt4/9YR4eTgcRR+qMDogoaUPlFNCfentGeZ7pybzPT60XJ
         NlGn7IaMNRo8I9+bAjKJ1eJLswB+LQr98fyGxN6q2r7hFXLzsZ8EeFTkNYTl4bxP8exZ
         +pbw==
X-Forwarded-Encrypted: i=1; AL+hErE+Qbn80QRzqym4oyZSzyo8Bp1HNhFpBLjTDs+UPXo/qAbvtz7zRSuC2qnzahtMUhr2RRZoeU9MeW7J@vger.kernel.org
X-Gm-Message-State: APuU4Z+FaZAlG27DoSHpQWP6JpjbBwPTq2gRGeuJgEjsUVqqLJLZX+Rv
	l5W2pOxO7pIAayJ53rbY7pN7xk0qYCkFQRSc0rhOxX9oQoAzBmxWsYzJ
X-Gm-Gg: AZFdTZevZwf2g5Y/j39vl1tWNrAj6Nzch8LYBCPfRfKs/ZXrjFq87DXqJ0rRPpolPkB
	0tCFTwFF2w053qCful73NW8JTpr9pDpVIIHsLSujZ306nF/GUHq6Ty+EQem87ytEfSnbg62sQLV
	3rlEXNmMwYIy1YXhbV4orsNSgsZjze1QnWQG/yCRHYsIDaeBQL2OhnWijncdjvi0aRl5n3FrwsO
	0+mMCUnWeYJGYaKysF479K4MdXCK3xzoGXjkdh7ApVDXMPN0NBtvd+dFTMHy6TMsq/5lLtFkTjp
	t8QuWhng32gm3rGoA+QC68d64H8kdL9+bjis2ll0bFlJ3mPsPAy+vQSZLLvyG0yqrSKf8Tq8C5l
	4cjiVWpDdKZudxbJX9iRBhu+as732GCAmYGX30V3yE+XgglqR6C5s0F/uOKfjwaKGj3B/9OrVT3
	HKR2NTMyTMfxBMl0K2Q56WX1kNdZqxBRyHWVO22+OeckZu3wNc/B2jsuOxFccDWTL4jvxFQeVPp
	LZuzstVM/vXruPgNMItHLSycIDC5TaLD9b7vfKbjqhbVA6cuDlo9noIwO2Pj6tO96yVoeEMuoIP
	dqCQ5gISBLZOv1DDAD5Y/ZwqZlcvjm94jMw=
X-Received: by 2002:a05:7301:dd8e:b0:379:730d:db52 with SMTP id 5a478bee46e88-382825babbfmr5042232eec.32.1795092712297;
        Thu, 19 Nov 2026 04:51:52 -0800 (PST)
Received: from pjhArchLinux ([199.102.217.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm17979371eec.11.2026.11.19.04.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:51:51 -0800 (PST)
From: pjh456 <pengjunhao409@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: rtc: haoyu,hym8563: document vdd-supply
Date: Thu, 19 Nov 2026 20:51:24 +0800
Message-ID: <20261119125125.75912-1-pengjunhao409@gmail.com>
X-Mailer: git-send-email 2.56.1
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

VDD is the HYM8563's main supply pin.  Describe it so boards can
express the regulator feeding the RTC; the property is optional
because many boards hardwire VDD to an always-on rail.  A side effect
of describing it is that fw_devlink orders the RTC probe after its
supply.  The Purple Pi OH board DTS (posted separately) relies on
that ordering.

AI assistance: the supply description was cross-checked against the
vendor schematic with Gemini 4 Hydrogen (Google AI Studio); the binding
change and this changelog were drafted with assistance from the
Qwen3.8 Flash Next and DeepSeek V4.1 Flash language models, driven
through the OpenCode coding agent, using the HYM8563 datasheet as
input; the submitter reviewed every line, validated the result with
dt_binding_check and on the affected board, and takes full
responsibility for it.

Link: https://lore.kernel.org/all/tencent_B11DE1495C3C54CE186ED508E2CE5CE41106@qq.com/
Link: https://lore.kernel.org/all/tencent_9B1CC4BF39DFA325C2B5384EA8B0319BAA07@qq.com/
Signed-off-by: pjh456 <pengjunhao409@gmail.com>
---
v3: use the generic "vdd-supply: true" form and show the supply in the
    example; reword the rationale around the hardware instead of the
    fw_devlink ordering; replace the non-standard "Assisted-by:"
    trailers with a disclosure paragraph in the commit message.
v2: rename vcc-supply to vdd-supply, matching the datasheet pin name
    (Sashiko review).

 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
index 0b9f39ef0edc..ce9712e2c406 100644
--- a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
+++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
@@ -29,6 +29,8 @@ properties:
   wakeup-source:
     description: Enables wake up of host system on alarm.
 
+  vdd-supply: true
+
 allOf:
   - $ref: rtc.yaml
 
@@ -52,5 +54,6 @@ examples:
             reg = <0x51>;
             interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
             #clock-cells = <0>;
+            vdd-supply = <&rtc_vdd>;
         };
     };

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

