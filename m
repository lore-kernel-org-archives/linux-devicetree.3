Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794031385;
	b=jwUj6WkeXkm84IrcQLqWJ2s3HbcjVMBqrhhu2+n1a6nTbUMbxOhllJRmd/oxpERTuOi9
	 FYjyFMtBKZ6VZYtwWGtaF15qi6crT9GaHK5PdQ9RTti9k67zra/CGVVggCrr5UvaJafNB
	 YRMxXcndFRiiS66Df+gxdbCZiaf4IqNaS8j9nzPlKyaS7pYmevZIdoHh3B4SScm6ZUa/D
	 GaJo9DOlBSgX2P3RU5VBAR7UlHcd+X9AYBMdKmvMWXmJD+7gMwV1VFEgt0EfinH3lza0D
	 K4o0RaQWtgE0Gz15xhpcQl4GKjsu/XvCsoM/tFjoaTuZXQLLeqTWIyeJIKHOir7lPGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794031385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
	b=5frWt9rXHS/nfWbLVkD2jQ7YZW0LWDaO6eukO5hftD1KtVsBk03rFjatbDrP+h+KRCF8
	 989NuYU334Xa3Kl1h42rEiHC+SS7+nXnofhyeM290thT756OgUMTNLUAfwdLxG5Y5VaSf
	 ZshPVHOMCw+gm0W7+QFTUJ8bNumykO2DkfcG2RfIBXox4OrPwfLI7fTT90cOHmF03BUlM
	 Dr1A823iWfA0POJ0DRemMfz4chWDhEHJI5RJ2k3fQXspehpQBfFP8HtlV8Z/Abkx8ybIY
	 GCJGuwDT38BC7s3XkqzYPGMLuazI2Cj7bss6NRXqPF51SVE7suZ3vy5Aiy6Wix3qTUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N75+LnAI;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A55606A32C
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 06:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A55606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N75+LnAI
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e940d5d2beso4569735ad.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 22:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794031384; x=1794636184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
        b=N75+LnAIaiqc5Q70qXqCKzbNRZs11+Jdk38lpTgfMBG1UISrhU2nxjKxXd7Ki2Z2Ml
         A36iX7JXQDB0oduzRNcD2eM5aqWKBKBXeSiYv/eT+DAXVPrRZhKfgHimEq3Tw9S8MMy9
         V6Td7WwQR1zGPzRNDGaAkuGZRy1hs32jhzG+4Z29qKmU7rUL5JiRhUtJklifidkBN1Gm
         siKVzVAP5ajQkAbxDRVR1DkurE1LhJOYFWZH8RstlYTkckaziInI/sfRJv8uSlVLq9Mu
         vH7JPYAlMMprPd/coi4iCvZfNO4Sw8bdEuf87ZBbBY0DKznHWdrbbJSH2+RtqEJ/dCtt
         Ohuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794031384; x=1794636184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKa+5Wpszs7j7cPw/Xoo3jlJeQpFmBrGSTTM1AaN5Jk=;
        b=cjX044hzNzJ9pnd6MWYbxkeu/0kqOFf7Ir/9WyihuPcswGWv/9pD3jRRrSw/+dB7hR
         JV1HquIusH5jTdgOu/fArW4nEhZMGS5zWl1yma/JErQMDCNJc5Jv8Wm3VFjNy4MOvx7d
         LkK426An2N0wVTltXKlRAKq0veHDXz81xdvQvvr9Kri11mJkakiukVkBK8sc+sE59fXO
         12H4zDgkd20To1xYp4hftbCeEACRTgOpQmC4aaf2SG6O89C1rTcfWcrsmR0w9V5Sf333
         FaOpKEYbnZjCudffm+BY1QpLvMe6UAj9+/G7IwYI9bCjWatj7F7xV5tp1MhPzo+HLH3y
         bKyw==
X-Forwarded-Encrypted: i=1; AL+hErH/jeomytuGYuLVjtHoUDstG60xCn2hNQFRfKHgbMKuhp/cb9aize/jcNpFVy7YOe2WH2x12B7Sd8Ns@vger.kernel.org
X-Gm-Message-State: APuU4Z8DxRKhIS1eG2vjNY498O8E+Y7gJ7rxOUny5Kemc63IKRBbd3Zv
	YZxigok4GCjpvsVQQw8y15QckdzZHW6YPAxHQGznh3aiaiAULY2tVd4R
X-Gm-Gg: AYBFou3suWfU4yka1u+XQstpQBUm7tLL1Xz/y2YvrGKIdJPiiOj8ca1uKU8YQEA8xZ2
	PUaJJ/bnflpLMSVKU8foFlnBMYWQFa21rPilyKNeMuGJrNJfcMqVfPEt21Q3HwxSkvZ+pq9Frsk
	O89OQcdQwqHiGNq3pvRh5Lyu/wji4Vv4V+SY3n+zhtGnd8y9agph/eN8qNXM/r95aAbK8lAix8k
	k8LK+0YcAOUhQQATAGYqTZgRsnTsuNaRr/R3PwkpqHYSAhGAHwyNqbb+sbGOso0TcWjhGYytAIm
	VcWQlqwRC05Vr0AMmFBDuSA/rbMkVH6CmfvTJNAy5n0ir9YkSo8SJdvXBkqx+06TsPpZCA+KAbX
	IAVI/dtWka9erSAz6jDWyoCcsMyN5x3NsOyH3Wc9r6/AJ1tDoG87GGCWJ7cypj/9V+4Z9C3pAMY
	h+swRVm0hmrJ4yTbEtn8dEhpeKVZyuEj+bC2EQQ5tqk79kG6jaZuyss5OCcwzdjjX0uBJ8kQN/f
	MEwjMg2ntfQcKPlaRvhHg3gI+SPhqlDPJQFS/8D+gHkX8DoNTVJ2TEEZvm4KSwVYudx6XNZl3cS
	+iCevI0ZLw5sh6JJvaOmND3KyYR7z6/YCHF38YvM1divvvF2fI1JUeEDXZIhZIRZ
X-Received: by 2002:a17:903:22c2:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2ed409890b5mr53794365ad.21.1794031383945;
        Fri, 06 Nov 2026 22:03:03 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm10488765ad.56.2026.11.06.22.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:03:03 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Sat,  7 Nov 2026 00:03:00 -0600
Message-ID: <20261107060300.597337-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
index 120784066..bca7f98df 100644
--- a/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/marvell,kirkwood.yaml
@@ -55,7 +55,6 @@ properties:
       - items:
           - const: synology,ds212
           - const: synology,ds212pv10
-          - const: synology,ds212pv10
           - const: synology,ds212pv20
           - const: synology,ds213airv10
           - const: synology,ds213v10
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d..8b5af5122 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -14,7 +14,7 @@
 / {
 	model = "Synology DS212, DS212p v10, v20, DS213air v10, DS213 v10";
 	compatible = "synology,ds212", "synology,ds212pv10",
-		     "synology,ds212pv10", "synology,ds212pv20",
+		     "synology,ds212pv20",
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-- 
2.56.0

