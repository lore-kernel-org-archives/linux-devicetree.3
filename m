Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102458;
	b=gdx548Y5jZqKogfsukCoNtiSsSOVZ4oeagMpnkKB6Gv9XEYy+Eh6B/TE2AX+TfqE/G/j
	 Wqgky6ohbwzZRf56v3NaKRx4VHfSlTXoAnJBkK2bbKeoNUSP6RHSVzvJXFLUfp9eEav8R
	 U2UuOo5yLLwvI8FBqOkK7jXqWmCKDq1VEB/aMusDpoweLJKDCXWSKm7e1a8D/M4ETAgS3
	 BV2dKTUGGUGPotqSbWx//7oxun5E13ur3ozrYJtWMMliwT47QsnNZweufGxHerBEz43td
	 qy/RIKe6JI6MNJNUsP0rFc6ESel/OBPwkREaJYTZ77mNN+DUVITHgKRlwGTENvsMqhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
	b=qJEPNYFvvQu9xqulNY8fX5Kxq4BiBib7XNSMRXUfTjrMQORnL04IAxTeLXtbLaswsnpa
	 heBKagMV6/YUBTpTZCB8jG2nS/p1vtCoeuztjqQ1WGzJZZFGNfMI7WiH7Ok7ksYUD8Vg7
	 qJjjPhT05h/Mba5d6dSmElKitOlMcju6u+uuRRJ68OTdNEHNihbhLmrB2d6WXJhQCVFbg
	 CUZ4eBTQIrdcfQMgFMJJ4u9oDYySUHNgOGjlaWMshe8/DD8SPPdP12au71GAhRfwlSDZW
	 zY2FyqKtfotTONOKXZcoYRek9c4X7HsEw7IjA6txj/xE9nUQPiyvIeqk03XIYVxEwbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E0606A338
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219E0606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0njOPL4
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so5738526a12.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102456; x=1793707256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=J0njOPL47nH+nuOWZgYQd1iIoRASbk4F0ijanhdpEKFSNwiQUSYj1A/63Ui9POlQu0
         BHjUVxBBQGr2/xis3Jjrqd+yaPz1vgde8hZlyQtGuAzKbIZmwlMvvV3sn1uWuYHLZ8iX
         r8qkYOLFyl/3FSZSOncs0badumBga4ckaoy5sce4lIpvacvmDe6lm6noQm0IXPDLOjlR
         YTRxUPlVjVk0UelR+bqruaPbbRT+Y652yOTQrFQ+aSbpoZA14e4lBJZr/O/BEAkV5Daf
         PusOj/huYVTguhx3ejtt36Tfzg25l9r6A+r64SbOEfDLrJZE/bowF1L7pN6ero3rSDvd
         Ajew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102456; x=1793707256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxGm/Yrjd5MEXUcWESeXbd0G9QFvbGF+hfdletG5QcQ=;
        b=gXOJQ0irNUHW+Cm6gt7CpKVlAfQql9XtcbCjJiamJXtMO3UAQaYN8kHLem4NhJJer7
         kSwqXt2Yr0a7ASsqAhAVkbqtAlFBnVgQje6Ir8pclc/Z/fWDDToWg3jNytGbl0ycWDg7
         otk7eeNfEnrLeiaGHWc6YFQu5nLceiRmZsduXt6JCiXwfXeZ3BSQ/035VaMhQkwVIMe1
         e2i1k/Ml84U5GAbhQxmi7PziM/34BAS6VsrSdsB941QUGkbGxxTejuQwr5F0yEh52JEg
         KT8UI6LHCl1iZwJenuC6WU9vPiRQIbSBJzi+XLPgF2wgaOzwOWTFNXscOUFVGw1/eTex
         hpHw==
X-Forwarded-Encrypted: i=1; AKwUvBzed1vWz+7gSoRIqjvu2UzTdoJNMktzjOrrauHeNex10OdgfGVGr9KjKuDfFhankG/v58Vv+s7Cawt4@vger.kernel.org
X-Gm-Message-State: AFq9FYKSMmGjzUeXyJHZjxB9sgui5QCxGZ6nmTSt/d+dDWAuoj152XSO
	GGJug6UxFZaN6/3wAbjY54BRsFU4RjtkGCcLt9i4hLi9jCew/SHq3zHo
X-Gm-Gg: AYBFou2lm/tW6X/sOYFb2gQyVgo4W+cantAYp+7PYJAggKYrH7klF2mVfDSCFnvhije
	XObqjEcrGcrsnyqU66mLuVuKvUmoZasIe7uyJBEW510iAullj8JhTz4Z8CxyY+xyas7zaS/2isv
	FKjiYLvh88QYNv6gE0EAo+VWUHgzQudQY4Xh722u4KenvGyAkRszWzwFXMqJyxL4BGnp85H0Ubv
	90QJPaVzjqg0to/ZRhY1BL6hBLkIS84KJm0OTmbD01WwDU6QVfbKHf1Wz5OkyI5urIueTICsRBS
	YuJArUYtKOUyd98+8g+4oXVgcGTkFZ/ZDcnoIoVKjC7aFswsFu0nYouEpruu9ALvrRa2jThrN3d
	qdj3WKgvGMKISL270w9hS/89cQewGxXcqejQNQsi8R+ucSIzq0SKcIDH9HyI7mpTHGY1Qyf8N4b
	i3Hnezs4FfJsZkV1NKhDoWLzc4IuuB9ogLP3W883QY30onh2kSPaD02mbGj6LoidFuqG25sIlUr
	rZU+c9IHE1+p4dDLsXEQdeJmbbcWZwYOKKto4CRC81agZi+kAZ/tpZ3vcEo78ZiHCev1ozn2m7p
	suEsS5ONm7bPCubHE0iN783N/OsxeSnOed8U0kO93gNZC/DqMg==
X-Received: by 2002:a05:6402:4142:b0:6b4:8d52:ade2 with SMTP id 4fb4d7f45d1cf-6b48d52b5f8mr498029a12.41.1793102456264;
        Tue, 27 Oct 2026 05:00:56 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:15 +0200
Message-ID: <20261027120019.93611-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Realtek RT5631 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44c99..3f5f7638cf84c 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -36,6 +36,9 @@ description: |
       * MICBIAS1
       * MICBIAS2
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -49,11 +52,14 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

