Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708941;
	b=hSsAAOK/1pqcYBbxjOA0QKxvE78m1/3w6v/mDGjdTBZ40pLfFwXk3cRudwnripaX3RX5
	 miS3bOUlGx1NKOyCGZJlzMUJAeRLq3cqvkJq8DmG6jj266aoR/F4bDoXRyJaDZ0AhxtJu
	 2IY/ZwHadUFOvGOSNcsGg/TrDQMMaGyPNX3F2vAaGZi7VI1e5Hot72LtLcfag/hm0G6CR
	 FpyJjcKQcSF1YxJQWF5sVM9ovE3vNQyutqccvW/3N6ZuGqMjJS1R+SLU7WLvAt7uiLPx4
	 73yqkIUnrZ4atbWZr6nUBZgTdW/HLjIPpPBUVFWFKYpaP5QxyrgmETZeDy+uFG69IFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
	b=amDYTaz8BZy23KjXS6Ire4wil0CSZmTyxqvgYK/1hEUk/yvsCCdzM+7F7VxJuxSuErxj
	 KkchlDHwcdmQ/chIKKwC1aQw4LRxg5e5k++lm4idSnNKRlx+CqQiFQ31OGiA3wNoBeUMn
	 8QRMH67fe3By7pQWKh5EG5I9Oz8kxX8sK9HEsCtcYABZtQd86IJScXZ8DTj+4d0jj+QiJ
	 F3hiEfp+wDPQuslMVRJJSazZmeumPbm0QJESzK5OH2U4l6FsPWoVA1JFc0RXFtRAVwzYk
	 VhUjBRnxMK/c1fhxtSbQOwG+5a/pi5XI+/1oC7HuWjYKtUXBs2vdPpW/iWESgFQnAsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cj1hNSUm;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C32606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C32606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cj1hNSUm
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so3210020eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708941; x=1796313741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
        b=cj1hNSUmQ3U4aMeccg61gW2DRXYn8E4PjoEVbH/MmIxFeJSoOc+r7/Fk02eXTOcto3
         Jb1i3NbC5mtd8tugWor3XTcoYMieiEv2aq324IGwQ4dI8V/xnGAf+ADRj9vO3LP48+Su
         xdwCDg7ZVJy05+hVw+2TJxIdz3AZQ7XKPyNr6P3ApVKqph6ivVNFAMjyhUfyma7+XhXk
         5em1sO3O216bxEYbM/CBE14GjJaL/QK9cYuHx1X3cMMNhm8kCmoi/C0LI8XnDXEDBvTx
         xJqGTJ3qmweJLIJ0L51dmJsOBH1/FREjJG00Y3YLf/uLD1A7a2ThuqCS5ar+SO7UzsmL
         tTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708941; x=1796313741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UX5EMYaljBql84e3y1nR3Qy8isjY8RdoPr5CAQsVxp8=;
        b=YRj7gQbBWu36RJiIa94VMfA2j3xtTL4DRvyKmjVavWUmNIoxa41Emo0pknEHPIjyU6
         ZGf7EqeckByIbiElhQf/NTqj1AaSIBq9lg9NDPTEWsNk/0+s3/aUuXIRSp3AFfD2snPv
         vorJy3Cksch5ycTdYtirHxssk7Q8/hGQ/Xq7jeGyW/uI8Ap4PDfowvYPBZssNPFNQw0d
         V7mzZXKhphRFVy/HDG6gXq/GwbvOQ//Gi9/WJb7YtqHwsTy26DiKKdHRxuSlAouRrY91
         rY6NJpojE57KVuVAecpddygfb/Bps35yowl67xV8PuK03XS5Uv+pB7t4uxmgiV6JqpaO
         q1kg==
X-Forwarded-Encrypted: i=1; AL+hErGyMwHr+fqO0osYUEmENtELtCW1GDHUStmcv/i82TB1Fup89CoaJLFYhjl0ilsQ1GfbrJQ5IgxXE/D4@vger.kernel.org
X-Gm-Message-State: APuU4Z/02AvvRH12Rafno5JSUqjmJwy6Jgd+NXyqxJOcS8SNq0WPgxxQ
	vGFZs4SRT39DyA2XmmlrtsXMWJIiZIAc0ptNHOUPymqtYjt40kfqKw6h
X-Gm-Gg: AZFdTZeJsNuxhhInBkzIV+dJ0pvhf6DV85NigJwpudJyrfMph4BL2oGgvyUJ5mKp7Xx
	8iNdKf0946hKpooSjFzcAqhX4AiM+BM+CzyP2nb4LdE+dP90z2TgEW3KZyqsE0kwH0eVyJYhcs0
	W3kWmXvvCWaJxCDV3nqZyu9xKDSUUSQHD6zITyPzh5piX+kExGOcTW+3+W0lhdGqwZcRx2X89v+
	4CYe1Fb82IKtrnnIhLqS/cWkroQLmzg4jSeT3HMcd5Mu7mE2JQsP39MoOu+Cnzmgqo5qe4C2N1m
	bHDA7kutgQfq647ZfehJBkQ0OlQ+2PIOhD3LpXHgBw2HecyLhNK8Qj4EqH/LqXB8gLY3i6gMin8
	pGgl8y6OK8hoQ/om/HimGgLhsEqvNcq7RmdHJvNguRWXpPyhpHiT8zShRetfIAFQJsQXh8U0nLV
	c9fapzTLwB7jfDplk1aOBHuCNOsPS3IX0Gj4rVoQBeneXcqBWdDiVwf+6ATBTCl8osKsaWfusXC
	wz2Fb4DILRPEHUnWEGrwSnT/JrMpnMKEVkCrEQ2KuU9rs4nedELR5Nx2Lem333mfjIU9/v2qI1e
	02SzpeA8e9vUQVr1rjac5pXnakdp7Lg+A7LQxKkO6prV
X-Received: by 2002:a05:7301:a23:b0:386:9ad5:6641 with SMTP id 5a478bee46e88-3869ad56b0emr18510797eec.32.1795708939894;
        Thu, 26 Nov 2026 08:02:19 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:19 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Thu, 26 Nov 2026 21:31:00 +0530
Message-Id: <20261126160102.52163-2-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126160102.52163-1-dinesh.v@adlinktech.com>
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
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

From: Dinesh kumar v <dineshkumarv85@gmail.com>

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..162a4a9d8c18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -68,6 +68,8 @@ patternProperties:
     description: Analog Devices, Inc.
   "^adieng,.*":
     description: ADI Engineering, Inc.
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^admatec,.*":
     description: admatec GmbH
   "^advantech,.*":
-- 
2.25.1

