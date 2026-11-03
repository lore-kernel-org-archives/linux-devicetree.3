Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679978;
	b=Wq3vRNfpMWLAwqDsQ4C8KNN7zjxW2kV6GcjuuGBQ+2j6vjhHDAJE6Sbb1oiNyYcNEFL+
	 dWjtMDxXLh71JnUxCJdu0CsE51GubOyiAMZZG3/bbqgNr1ms0Pr1DqrC9xbA/3LtPiUHY
	 +q9PSP1hK1+LdmM3z4f8fi7A6LKy9iGVQdZihv41KakDOL0hJx1yN2q+E3LLEs6e6BtVJ
	 ySWO9TwloaDlC3heQ0lN4SXSKDwTnnV2ZXu1NBaBIlH9shm9LnwxDqk4W3yN9lOaJO1Pc
	 ltYzJ8C8lCk5PakbiCUFQpkoDD3yY0YxGo4LBre19TslDSICZKGjVJ6zR3uiqnXfXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
	b=VyBx+5BYl1Q4ZHouM9+QPDDzJcEmx2BAi44z7L65UVZOgeYm+Z8pBZP5u1d1wdr0Fg7D
	 YnDHIGLjHfYidM4yz2H/5OdIhkgxgxNo/Dl4v8QsQQmF6pQWZxurSPuma3LwFivIE7OZ9
	 7Qlv0aU8c5jLo7dOtVJHUIXlsZC3yKgDYF5vnqpLlZaHd14UJoxcPslIZIpEaacJoUD6q
	 Cg8PeHAhoRFNcNiyRP9L8OiYbR467RfGTUuB8Wm0G1esIu0Q+/dYdmB9MT4Jo2FxvbstB
	 K0HbG5TCW9uXPyiIjhL5itamCOxJWYVWNXV3Fl86nyIqGBftXxTqYWWZX+Nr277dCDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=niZ+xJDf;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4CA606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4CA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=niZ+xJDf
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a064f294cbso2389611b3a.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679977; x=1794284777; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
        b=niZ+xJDfRp3mSjFqmMSKkINQtxKHzmusZY7NaAg/M+0A/E9LBxjal8f2MCKxCHaIA+
         QqrJPfF4dwpg8RndPJ+Z6M61OsVnMl8alHVozhxttHjGbMx2edtbQvP6bjC3XyF6aUI5
         esT8Z0VrJGmKSDvxFLSpk0cT4HqfiOJoXiN3cKtAjzlSnAcVkrMYkhmRCiN01ggOahAZ
         VxXzQIjn/lJ5GEyyjaMXkjhr7lDeS/dv6Z2xQCEFe74kSRSDgt6NH1NAuLC8BcqgSQ3j
         QZKWNecn5NP9KEIamsZTS3l+6TpgYT9lXTgS9779K3T5aSYfxrbW0cMO1U/S2hezXxF9
         j3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679977; x=1794284777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cQFQl2Kr996XSKX3WpePSzhZ8Xk95BwnJZrJcsq3DI=;
        b=Uu8wFtdpOzUk0I9E0yhARcxQU4O86t6BGC9x+gvAfzw7eib8h+10oScIjJdXNjJtco
         R6J08UTATw5DOaBd+u2rnYsRA+s2QGwMjj23tLhQKZTrDz1O5oFPgFA6XcLiRuqpo5L+
         gxD7qdmzcdVMgRsB/lx1yTAXC3YY3JEcUxxWtAA8bMM2K66Xfh6eDjm1xpWSPv9JTNqd
         AJghWdCO7ALj/yYmMmE6WBSRYmc9P1TpdMpita5fmdMDQUGx7EhjaclS2wMx5+V4gF0h
         6Eg+rNFrWMkN1Ksgg/yHKrcygClASZzZO8oCqsJYYTkTSplNlHOMmtwwEsCgQruxFv0w
         lp+A==
X-Forwarded-Encrypted: i=1; AKwUvBwzLVJd8qzWpSjCzX4sxBjKdLhp3IJJzxIc6iRpL0x/k5H+VltPpPMIh4+XfgCtguDVDIk+U3sa29ej@vger.kernel.org
X-Gm-Message-State: APuU4Z8uVJcEFayvibL4EMGq3ZapGRgw+NUwX1dJ6GU7rXwV8x4VDNPG
	pK9p7mxo7nAhFPvOvqXbhSDtvu5rYC87OCK5ogNlbRkTK899/M5TcnHlzk3UvnlfmqqOEwInzev
	rmOUEWUS2HEztNKSQBuFiVxOOtblk/NHM9w==
X-Received: from pfei14-n2.prod.google.com ([2002:a05:6a00:c04e:20b0:891:b886:dd4b])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:349a:b0:89f:7ed5:865c with SMTP id d2e1a72fcca58-8a9be396728mr10313189b3a.9.1793679976311;
 Mon, 02 Nov 2026 20:26:16 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:05 +0530
In-Reply-To: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103042608.387626-1-vamshigajjela@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-2-vamshigajjela@google.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
Limited.

Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..f15d81da1e3d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1569,6 +1569,8 @@ patternProperties:
     description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartdv,.*":
+    description: SmartDV IP Solutions Private Limited
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
   "^smartlabs,.*":
-- 
2.56.0.317.g454f8302e1-goog

