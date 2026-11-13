Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569896;
	b=wIQMnJlwonuLTmNhOVFMzkSlJZenBHiqdty7ipmQqNP5NLc/01+eNYstPSxlRvw+WfxT
	 F0saHhhbci1aNSuCQi+KCfh5MiFU7eYME0PSE3+pWdtgRIyAeU93fCnJqpPr2kE4pcX+T
	 fRaYNEqZ3JcSuBnMQaJ6Mc3AEwMsDybdX9ly2U6/xo5GWW52WuyDJhkhXiWEkGgutCvEG
	 r7keOgRYk7rWyHyEfYLfglfUzuYiTbR0+0fVRAXn5jtClbIyR2rAzKH+X+TM/+YbmlAck
	 LyLGNOG2m5QfCmzqaZNTdX6VIh8KVgo8KZO4ZutYScYT1fuD8kumzE2Hz90Y4zXPRmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4DDTI+GX+RwqcL75e7n+wQt/eJDBwcDKt5JSCL+vSP0=;
	b=A265C4DwblR0ZwoDaZ4Dld1jrLZDKhjeHfOa4Ysk2Tf0o2HPTmnpKLEWEfaUUAxpEf0o
	 6ooTJ2Dh1Vwx+jnUF50PNVK3R+BVKFG8FYKet2nwOJ93OOTvZ6mSGXG0EOC/JnBBG2D0O
	 FcPfWCGtvNGFpRBWgzjyB9AuLu1cuGseP6DLgyFizJ2EsvLuZ2JYsg7bMpuiPS6jQIwJr
	 GW92dfbtfAlv5Yq/m/ZmsQMFB4Dp51ZOLO/+OWiIozP8IfK2t5CXPKS/dKfuWVGuES7NT
	 T6RMHvIzmdkUuJ64JauByV8YTxtMO3jqV5FwnGebZI47dmGzZbU5mZc2jSKpuTVJnJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U3Yn7GYe;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B21606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B21606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U3Yn7GYe
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490585eddfcso832603f8f.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794569894; x=1795174694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DDTI+GX+RwqcL75e7n+wQt/eJDBwcDKt5JSCL+vSP0=;
        b=U3Yn7GYeTw7Jk1FGMgwLIzn7Qortes/NBkaLCGHBKxHyDT79DAYlvY4ZopGCJKqb5p
         dSBMglWjMMIvZ8bf2lArhqLgVw75kM6PnqSQPiTWiHbBMxdDYiZC1HXcohBWoBaVkLQD
         dP5Um3dh1XM11x388lZMcUY0sMbnXrgtg8Jbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569894; x=1795174694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DDTI+GX+RwqcL75e7n+wQt/eJDBwcDKt5JSCL+vSP0=;
        b=sisG2QK5MjXaAT5rBE0sLomwjll07iuQvaxwAJMgRRK0KiMEqo+TlSPrW7VPLfu+cV
         UItfaBZLLvnH8R22GhyA3/ddefQ1wKoSOokZavpYmQ5n1E/qMYARSjnOPEpM0IMBvYAX
         V2D0zkdNu3tuRxOtqkIj6csH6wGxeEtq31+seqPhyHQDqiWbtvVLCNfwhVXrzMnvYnab
         IBeGQc1GHkOAHuoKjXrywPF8NWBEGm2ifLOsZkG1O/7invd2CvzQKOlU+RiYh9QWRZ6E
         aX4G9f0pwUVwSYsDMcTdJMJdb1LMHuC0+iifvPFTFZXySr4DvFycEDqef9VhgA0BHTfL
         yMHw==
X-Gm-Message-State: APuU4Z/GgXCJtGOVL8tVBJ3A9Ocn3zkg7NyVGtAWz+MAv8pq67q+Q8kU
	o2Suxh3HZSTqr4RMQSr1iX3bd8O3rYREAJTmM7Nl2laYe2Z84IO0wA5QNUW/JyLeirs0DZzweYY
	+1t3bM9A=
X-Gm-Gg: AYBFou1JkqxZsJHx5ijgaS5RkN6xwEzmSyg7nnk9bB0jVnqoLgKngABNPGGsKLr3Dtm
	Mrpglqc9aFy8BR7keqHlKKKJUUGmf1AyUq5PYTT4YwtNsRgXt8p21EqaP3OP+QxtdQaPdxwNHgB
	yJCnpGQ+BdpQqSCKQMDtyEIFhIXRRj0nWjLu+mlkMufVqCx+xQNB7o8aOUl8Iw6hhpnkXz6IFB6
	P6UgqFKX6Afx+h4U7tiSVEp+34YX7oezxYm0mzAynJCGyDlTM8nHjh7c32L5+rsM/oM1cibZwfa
	9BsF92W7QwGSYX7TzL8ODjcNTzbk+kMdurSWlRRZlRXvk55uw5KQVKZXCxvpdvJ+h1ipl+MXFbD
	51CojEOqm2QCKw5FDH+yaUR05rOA4mAzB+N/bZbaQd8piPuNKzgreGKs29O3Au+TyvsTS7rEOXx
	8pz4yo6AroWJ5G+7BK44F9y4oXs5AvaFLHLoBLsmixAFqOxPp7b24pS+FDWTFpgDa7k6ZCIg58E
	qIOF8aIZadluyqxiLWt6DkqnpcIyLj5oPo37FKX63pCApVCQfMlM+aHBOebZykg2yfKSgTtGPsO
	Pss1g64RwggjU1scjUH33MA1nJiY6tGKdCmwfCwj/QvxDazdAMA0XCZ1PvvWOtkySyLJNcffiOs
	5
X-Received: by 2002:a5d:6f19:0:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-49c71a6547bmr4387223f8f.35.1794569893910;
        Fri, 13 Nov 2026 03:38:13 -0800 (PST)
Received: from thinkpat.amarulasolutions.com ([2a07:7e81:b71d:0:3e39:d071:1d81:5914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm5448492f8f.1.2026.11.13.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:38:13 -0800 (PST)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Axelera AI
Date: Fri, 13 Nov 2026 12:38:06 +0100
Message-ID: <20261113113808.1779860-2-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
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

Axelera AI is an EU-based provider of AIPUs for edge AI inference.

Link: https://axelera.ai/
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..20a3b24319c4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -221,6 +221,8 @@ patternProperties:
     description: Avnet, Inc.
   "^awinic,.*":
     description: Shanghai Awinic Technology Co., Ltd.
+  "^axelera,.*":
+    description: Axelera AI B.V.
   "^axentia,.*":
     description: Axentia Technologies AB
   "^axiado,.*":
-- 
2.53.0

