Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831414;
	b=dV1z3rZcDwkW0U1DyWVUQ2P4yOS88LjDH6Gw+KDFs91U7/skpZmqypOeycDqzwkDd8lg
	 FxvI9F5ifWPwE1Ux7PbKAVmU7jV7qPR9VzF0lqECPEHUNvrTrYMAmfALG5zYQ+9Vhvbo/
	 ImKHs8ii3TNvjLRMDZ/DJL1qY50Qz9suLxSO/EHWBz3gNkoDTYvZu8KPI0violo3LttoJ
	 hr8Cp7QYrT2UFVJ/HAsU9NP6gkYZTb7HwhmCEi01ymncoo/y6FBOlI16MavEcXjxJFIXt
	 iu4pJUHMCHb0h+QQozVi4iI/sWMPa0Lo9Y9BA3F/EfjfsTC2sERxbSJyWcqu+4CK4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
	b=SXIUAq3aOZIKrTQ8AervFYvGs+Cpq28o9eTgvorG0/d0pzUnF+fRyaKEIAw4j0rR/a7b
	 GrVLZkbAdPjKPlFPjxmuYf+ov4DHq+m7V3uHCDYki1SLqHC9q0bXLoLoeBJwjVGnOq1zO
	 5BOR9B3W3bBNrApmWcItNQQ0BDzxM3KXjDpsNMCg5OK5TVwD8F+RsiP7cDCcnW3Ri1vra
	 kcK53JaP/3ilggFx17lLFxsWKF/kiqO4VfY+yuxNJuT57nRMpM8eKRZ62iX5sH37GMDzG
	 IXy+jZcicifeEQHr9SnUCMcNBdpAx15GOUOthjWvAhlSNdyRVgk2VNo5OYMDMr1Ni4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncOG1xga;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E2D606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E2D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ncOG1xga
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e8c710847so198156366b.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792831413; x=1793436213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
        b=ncOG1xgaONvXeiaMUE7R79ovJmwawvtZtfagrUqVaV6SCx3XMHlsbs6sSfOF8KdlSv
         AMAp+8v00bmNVHOUvqO2+6QzbcTm2dHjSPn6ykRWAbQI3FAj9QkqeRhtDrBSQObhk9Hl
         olSDf3wCDZSvG+bru+umoFIOSZBg2a9hsh6HLiquxNDSAK6HV0dCNDfdfnU9tJ500gsc
         SPg4ybU6xy22v58T+GJmx3gBX53Y9taqF41tXHGihH+DH8i8P1C9wED1kHKvHtbVDBhF
         pmTD3ADcqNcwMRBxtcrSY7lJvOj5zKaTPXZeJHyWNTV/kfjd0Cg8PHw9y0ZXq62r7GX2
         G/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792831413; x=1793436213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyJpmj5FPVaDV7h+XvGySkhqmILNqo7NWUj7f7DmacA=;
        b=mUNh+RvSAmyk9ssYM3+T6pgYJ88+BepfMaV9GEvLhNSQ9WNTbhkuAxHHSHtHHCNxcE
         NGptP5Mq+qVfmhJYTNMzBrza8K4xRB6jXSZnKtc0gSB4qkJq4BWV3NIZuCPxSrOQ9cOP
         VnisuvCg+u0kkfjmJPI/y+i7hb2WzCmatc2I/2GWbO5H1fgIMQg8YqGT3pwBFmRA9hMy
         gM8eTJ1M5e+7OSvYZ6fLMnVF2FemA9XnNfAckx4NsCuHPFakDD6381CK5+IYOgxdxTiK
         TqOVi+w4KSEyNLghMdklhseZrxXu44jPyYivntzWkqS1yTqAmLKK/jbVHTFC3gwQY2gA
         RDcA==
X-Forwarded-Encrypted: i=1; AKwUvBzGd5lGLvGiqPLCY80IWBKPidze8xvqQF3ZLtaVoy5MZwmhC1HDlxoMeIbrWvwuodttPNXuV73D9Gsh@vger.kernel.org
X-Gm-Message-State: AFq9FYL3JhDH6wEO9rFPvrV6Iat4rdz0CwDV+E/emZ9yroqhYrNFg8AN
	ABCOVF6O4t/i8oVs2S0BTJEdNj8y/sH1RHtfpDVKHZyrJR1ZUb7A43kA
X-Gm-Gg: AYBFou2dDiO9Urf4eTwWXYvFroKke9e4SdZMpEwSGBQLcpicHtPZS3EHmPiia7D+F8m
	477e98GzH1v8tbs956D4OVTdiCL0l65peLFZ24P/xzOO7ngY3b161PnuqsJkoO1jtnco4TNt9gF
	auk6QuNV+YFaDAODJw7opiFpMUhqco9BovSyiFL5jnvpGzoAsJdFqVkmVTFDNtQFYVzolvC9EwE
	Rvr+01uEcv3ax70TcYiRiShZvJjdJGJQP4a6ZEQfDlNNGqCG2fwNX5skZn5WvB4CZRaXn0fCyfQ
	+YQNYF/QKhUqcm1jEma2uGAXjmS24MixkMSZr7g0n3mfDJKwP2K8wsSfXBjxzQaKhVmO3c+aFes
	enuuYnbUH9j22IloIOM7nQOhijSvVwAqU8pwG1zrb5TDNoTerU6X9QqPa4Fhvji2M0kEhUs7w1u
	/19KO+gCYyJYMyM7N9lTyPt+qoFUsXPw3PyJd5jg4Oxs0Whv7rhoUiVeqaPuOHvLPUBHsPeuERv
	TUsuUlyhST2zQc7rl3EQ2DMA4/RHQ2R2cjbVNqsK5wNqn00mXMhizQmHY6Wwvn/I3X7Em0RzdsM
X-Received: by 2002:a17:906:c141:b0:c40:c6c8:6bd8 with SMTP id a640c23a62f3a-c46bde0a0e9mr153005466b.20.1792831412672;
        Sat, 24 Oct 2026 01:43:32 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm64608566b.21.2026.10.24.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:43:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 RFC] ASoC: dt-bindings: Define '#sound-dai-cells' only in the dai-common schema
Date: Sat, 24 Oct 2026 11:43:07 +0300
Message-ID: <20261024084307.116715-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Define the '#sound-dai-cells' property only in the dai-common schema with
an enum of commonly used values and a description on how to use them. Drop
all trivial uses of '#sound-dai-cells' across devices with DAI support,
replacing them with a reference to the dai-common schema.

This should resolve any issues with codecs having multiple DAI cells, no
DAI cells at all, or incorrectly configured sound-dai-cells properties.
Simply include the common schema and switch additionalProperties to
unevaluatedProperties.

Non-trivial '#sound-dai-cells' usages can still be overridden in dedicated
device schemas.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
NOTE: This is currently just a concept. The actual patch will be very large,
as it touches nearly every codec binding. Therefore, I am sending this RFC
to ask if this change would be acceptable in principle, and if so, how it
should best be structured and split. Thanks.
---
 Documentation/devicetree/bindings/sound/dai-common.yaml   | 6 +++++-
 Documentation/devicetree/bindings/sound/linux,bt-sco.yaml | 7 -------
 Documentation/devicetree/bindings/sound/linux,spdif.yaml  | 5 +----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/dai-common.yaml b/Documentation/devicetree/bindings/sound/dai-common.yaml
index 1aed2f0f17756..152f319d8f382 100644
--- a/Documentation/devicetree/bindings/sound/dai-common.yaml
+++ b/Documentation/devicetree/bindings/sound/dai-common.yaml
@@ -13,6 +13,10 @@ allOf:
   - $ref: component-common.yaml#
 
 properties:
-  '#sound-dai-cells': true
+  '#sound-dai-cells':
+    description:
+      Use 0 if only a single DAI cell is available, or 1 if there are multiple
+      DAI cells. For special cases, check the device schema.
+    enum: [0, 1]
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
index a67b79cbe006b..f30aea4b545c9 100644
--- a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
@@ -13,13 +13,6 @@ allOf:
   - $ref: dai-common.yaml#
 
 properties:
-  '#sound-dai-cells':
-    enum:
-      - 0
-
-      # For Wideband PCM
-      - 1
-
   compatible:
     enum:
       - delta,dfbmcs320
diff --git a/Documentation/devicetree/bindings/sound/linux,spdif.yaml b/Documentation/devicetree/bindings/sound/linux,spdif.yaml
index aea6230db54c8..62c035b739d38 100644
--- a/Documentation/devicetree/bindings/sound/linux,spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/linux,spdif.yaml
@@ -18,9 +18,6 @@ properties:
       - linux,spdif-dit
       - linux,spdif-dir
 
-  "#sound-dai-cells":
-    const: 0
-
   sound-name-prefix: true
 
   port:
@@ -30,7 +27,7 @@ required:
   - "#sound-dai-cells"
   - compatible
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

