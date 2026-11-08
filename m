Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150853;
	b=l9HKXj3ceXcdT+dzJe5kCQMXpREKaTs0ESrIwx4POTii4YA07yW77+zBMFJVSLx4GzuI
	 XmjJLjqdGXi+O21IjrtN9KBlwhp7Ku/lbE7ntw9TgepuVItu3yG8B23tJhoZa7hnkRQXm
	 5bXz4lADDl35xCyqFdRRzN/S6x9QvzvgjsFJFP7RJeGtggJCze/gZ78DHfEKmgAT8RQlz
	 wAU1Dt4mJGqLyBPqjyH90oOc0Tro9fGzIFLl30lRjzw3SnPz8IizkVCb3WGsiOxn8KlF1
	 3VBmNkWjkFWE9LkUaCmjRTgJztlNo2gCA5iAmdShoGL0czmkivKsqf3d59jJJpJ/QkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
	b=poGDzjlvuEP0aHDzIRa6pOWCbn7qgw5hh8gzMjgdFHKZ7NMnGSiWDh87E0VjfFQTWsSF
	 noVHk+VgPjpxS7ULPoG8PXos3JE3GLsTT5CSTQTQoB92x+J6pod/QPrmQkbH61TvTTqF4
	 U30G3qwjf73hr0HOMaS2X+LYKi4DwJphAhcRvS4DT9yFIrEbUTPnJwc3W8UF/LhEtd97Q
	 a3z0qCFpvb9biTTN48hM61GP4ktDSd4eZE9MbHNnfsSkE7QWUmHAq2zbB5f6lf2VqJ00m
	 RtA1WmR90sOP4ME582XvftAIqGSUXLzsG/2rt4NCbuv5bfyq7eGHakm0aB7ptkZu4PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ppgWgr/s";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4C606A323
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppgWgr/s
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40f29667e6so19275666b.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=ppgWgr/s7DYE/0NT8hkbf4w3Avxhq2ynyyFr2FFsRzliUFC7ZzSCPTwzmYqQuQU5IA
         Rr/u2iEhEmoV6+YPhvsNFMWG2JnoVqJOfVIyrXG+1egKypY8gUDsKG9rMFt2psmA6kRA
         locbvJ4rWpF98TqxIZ0HUCdjb39PU7aBKl8bs+a3Qb6Y1+tEyrtf29iI0NM5QSNnhjTd
         k/oCMvK6n1IBgqLDmgUDoLaxVtB+7G7u+7n5Gmh/prURYwgCEUe8e7cAf1uUrSlmcKwk
         VKtDMTQnZXJgnJnuVzS4RtMOXVnzLfqjGjqE8Dxb27TlB2mgxOhN78fhgWYXFM80Te/1
         3cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=RGgnud2VSUgqlSLPbLc1LkStU2dKXwKnVNPiI0V6sO50XpP7O4fU1PrN1Hi5ytMhi6
         KtcGH3LMD1G9lgvwQwmV1/L+DTHTdvuVImoj3NntE/OiNhV0xlkt+JlZBaSA0aoTB0sE
         aNWTH3I8dfTRSFgkvrMeiGRQxaL9KYZuvs15VOX2K4R3+Atv+lFJyge6V0b+lccbXHnz
         DtyYSMUDQzrbNpk99zHDnYh/WlM5nmGkYVkdHDEjM04Ie2fES1tOdtrFsQfR/b8+6l50
         p9fZN16ayit+mi0/iJ9KKgJJe/PCsk3jsrNluPNJvIRiXJ5L48vKK99vNrGkPkDHFVI8
         K1FA==
X-Forwarded-Encrypted: i=1; AL+hErHXaRTxTdb8YA0M3Y8gqGuEnJjuMOkFieefn/FwX9uQN2ojpmb5lUqzuCmUV4Hz9FiGdWFGyDm4n5h4@vger.kernel.org
X-Gm-Message-State: APuU4Z/bZtnC4oxnHX+g6d3V+cO7gMK4DtSKuV4pZ3t1a70yS+n8ptVS
	HwBss4SCrzqUEbskYhXKHb4iYdqZarqGeyq8yzf9qufcSIB+NvFDtz1D
X-Gm-Gg: AYBFou2HNyWRi6lK+funDrYSkvxbQfzKmR9WoVRWyXENaDO4ofHiCCRtYhDrOm57COX
	RfSqCiKfqYAougIypW/3KhZDFM8Zvr98ujJ6MmVHLDwsJpK68LlnnRykHDbFhfZgptzYYSj4dZN
	TDhtBs9pQroCrxMzddLxxb0uPG0d0b3C1ge/updlxxVTuFx5VUqGWLjyK5EHnVn/5bZFrjG1KOx
	FZZM8nXVX3gPIjuCoWhmT6aisB9phMjWaOZ/JWXjZvKrjdBJ4VT97AdZqYgGS7V7cjPxuDH0wgq
	RC6jpSetyyCweW62JBMRY92p5zh+OdMuoJ0PTucdEzJ3lVPuFwr5zpedi+MCNw9K8B2VuGHH4iQ
	cZ0a/GUDa3eNFOaXhdBd9wBTFNPgQL8OP7d2qHgvl8mGZxnOw88irfqNG8O12mVdUY+eTkcBr8N
	E0UjRptj5LQpILvkVphY3HrJUYVce0iq8yjvBUSFOp61A8oWbpQsQlTNGjEsFAcRLPvXab+t4Vj
	3GvopGqI47aiPQpkYZB1aFa3bqeIkfYKeiWBvJ1SF9eq2f9aVHurumExKw+kgcv+1MKclM25Nal
	gcW4s4Ytlnx7orHo1mqyMvKevpmyFDJvb0EUZGouVlOKmBoL0SKi65/9QOvopYqLoBWAuZw/VCj
	2E9BYxJSbtA==
X-Received: by 2002:a17:907:9624:b0:c26:1648:a062 with SMTP id a640c23a62f3a-c4d6d79cd56mr106518466b.29.1794150851962;
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun,  8 Nov 2026 17:13:46 +0200
Message-ID: <20261108151348.204182-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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

The Maxim MAX8907 PMIC supports a single LED; document it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

