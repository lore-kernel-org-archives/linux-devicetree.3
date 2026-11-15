Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=BHGoQK8eKSXwXkNBY4+iJZoRMmCcT4D7EtHZyDm7LFGpvBvrtpFGF/mloKZe43KjHpzy
	 v6rhW897DsJ58nx6G8fWv9oOdjqygn/A6ncITBeAwNMHslgCHKz8LO0lX4jqHjU0pXS8E
	 8rNgKx32ejcdxOPExs3JHWhJyH+Tx3rogwTD5siGcQNal27PozDSDwXiaai+fKWZ8eBKD
	 MSNnlQWZKnKrHrSrKi/PiqDKeMiBtxdy4XfSCVd9iLks2B+pohBCo0iTSfEfGGdOh2H+f
	 ssXm6NQ9crOZ0CzMzQyE8oB9+6eqaSDQg9xmAXYYqpG596bgMSbSqk8qgOxk/n5B/7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
	b=r1rhTRH1bMNBUoOudJkZelJul6dfdsggChZdd4Bjc8G2ZjZ57gfaO3RnN6yTGEYvESZ9
	 HaECkvh5xOXPJFWPSPRd+38XzpFyFr1/0D0GM876f/nAv15inLlmv7FlcNd0yFi1adKTr
	 xRccZLgCE9ojw7Err32LpmTMq66GRehnbyDWy+Hy+mjJvsgbQl1oY4pKWoVL75DT8XHQo
	 bgWJURNqmUsb4aI4SAKBljNgl9YLFD5zGJxI57WK0JsAj2GoXF2ra563QCEXjTAP5hAAo
	 pPT9huv4xoLXC1d7Dt5ep2stiG2rrtDAWITndcHlYQucPtCu1+4IWI8zwMwW7v+HAcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=USZuPcoD;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161F606A327
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F161F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=USZuPcoD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so30523955e9.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762712; x=1795367512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
        b=USZuPcoD4UmCLPbAp2XJGeTHosy1JzMBcXrqLwLTKLP2PFiFqCIMtw0Dxo67qRHZla
         dQGXfwMm9L3rZGWHDfQPaTUKiUsbIW4XSM+ERCxfC3tJqF4yR0rTMMkATwDE53M68HLo
         9jDrtHt9h6zhr6Vd3TcYaQv9cmTuWoVJDV97NEPxwqQpTOeswOyfMYYsISbvFQpjgpby
         dwamXmY+AxPhwv2Yi/fiqHZ+u3aTUsVZNWzntvddUiMcwYN6GUNbMdJvPkr0bhp1q4Hr
         tOMxGV6Cih9L4DJzCXH/gUVTHUvttsyBbWDj9ybBegV1V+Rw5AD3Iq63mchRaD5s/7e6
         7+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZe5nxMVVSQwhBrOC2mg7Pyqnc/0mg16GtD+fLJnRoY=;
        b=E9Re9eftW8H5+eqM1ZrsLt3fHTXuztXkt5KoE+hTgVHQw4c2r5vr3pUNPT6v4U6IO5
         aFOYljcVdOJOvpE3eszxjFq8c1IeOjsVl6hhv272Ijp0F5+OjQXyolFQqOdAAemyeZp/
         XpNok4fZ5npBwrqIn6gWBRFNCzDd1hogSMOSgyPHqipsFReZPlO90HSMtSSXjaATK0w3
         G5+e4h93ZpQHg37Q9yyKtQhKU/0dAotuEI6coJJ8Ya8HJqMH7pich9gIMHzxR1962vAR
         Bmcno77ke5nhJpwVjpI2kNxGnKzfUqYTiwcHuwkXp88dQfCeD3Xxizvdt3v++wMGFi5h
         V7nQ==
X-Forwarded-Encrypted: i=1; AL+hErHhKO3aDowEBl7QdrIC/A6vUvFF97Z4DAlTVhjRjScFFJLvQDgNdFb4qgbq5bXD97FSLM8U+2mkYtsc@vger.kernel.org
X-Gm-Message-State: APuU4Z8yvuUv6FVLlD5BmV5T5+KpfxTkOejzcZK3IGcsgw3BCTNmbE5V
	DtWkW3L4BIbhHcs8HZiPJj8Vb4Z2+rzQBC1pEiXP/OBOBQCyYikPolsdWzsZtIAbDsw=
X-Gm-Gg: AYBFou0KnXrZJh8wPXwGWUnMo0EAL01aXVUSCIcZGDGc14povYeUvFYtIQISl80rqLX
	q77QrRGaFh8v21Ejbh/ePYITCS3N0wc8hkLyc1caevsJleWlAt2oxgzRxC0HcyhQT9GEnWclp1Q
	AWwb+xv/s6pNjpa5k/yJ3WW2ngt6Zr67CIOGkPFoijNWWMw/kvgz3XKcNHS7ty+smP/QIDj9jU4
	yRiGXquboRKJFh2U62DiK8Q523/fkdNOuX/Zz9llsyho2MZZ4UArd7+nPUjrBe1vG9RE48MS0+n
	7LRx4wFI6F2EBJHaLwglrcqlSc5qzYs+WswMxPjjJORBQ7lOHuanT4DR3ZDonuDR2nVJyQoRwEO
	R90HgX/f3+N+PFsgmYKrOeKhZZ5A7sJhHPdQeneRW5WO5wOuvTAL81+zzAP87YZCU/DMIYqi49n
	dMvJupH5QmWB1554UNYT700J86g5q67keWj3xDNKOzcIMedaBrS+Z+UDMlF9EylfTqsI9maxUo7
	M2A3nL3cIt5Nl0n18FvpuMj/bLklbHc5taZpsZ3drtN6kfJ21Nl5BiS+5i5svIQ+T/hYYm9VZWn
	/63lth503xrJBYIrXIo2HAaTbMn92e1dS7g05fJlOnUmfE6I9tsqSNpI8yd62A==
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr83499815e9.20.1794762712411;
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Date: Sun, 15 Nov 2026 18:11:44 +0100
Message-ID: <20261115171150.64431-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
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

The AXP2101's interrupt line is optional, as for the AXP313A and the
AXP15060: the driver then registers only the regulators. It has no DCDC
frequency setting.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..024de5553d6b 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -69,6 +69,7 @@ allOf:
             contains:
               enum:
                 - x-powers,axp15060
+                - x-powers,axp2101
                 - x-powers,axp305
                 - x-powers,axp313a
                 - x-powers,axp323
@@ -85,6 +86,7 @@ allOf:
               - x-powers,axp313a
               - x-powers,axp323
               - x-powers,axp15060
+              - x-powers,axp2101
               - x-powers,axp717
 
     then:
@@ -108,6 +110,7 @@ properties:
           - x-powers,axp806
           - x-powers,axp809
           - x-powers,axp813
+          - x-powers,axp2101
           - x-powers,axp15060
       - items:
           - const: x-powers,axp228
-- 
2.39.5

