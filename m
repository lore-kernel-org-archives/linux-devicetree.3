Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=2HniOSb3EIjBlnw9cmjYTKkSmiUaUlzKQUQ1BRCMW6ym19Vv6XSfwOpgtLYnvQKQ04F5
	 1H8Gg2xU4NHZCGH7+jjWilvApQy6oK/HsGOvdR4XAbeJ1NcUPb6WfgvZtYLFj/37ZnhUT
	 L9wgZ7wvsJO6rzy03LnPml2LIGCEZ3NiTfYr1+46zNKTkxj+6CcQMb6EnatFNSaTgtgvw
	 GNvNTu6Mbq2IVCUuRu7WUydIrjGRQjCwSXSZNQAu2YyAtue+Ge7Q8hfrbszDXIQJo7tY5
	 gBJEivSL6553PVcvaBmRM6lJGHLu65i6/jc9c86vtmkH43/bvIQ/9MnwMm4LuUsyorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
	b=S2CMlg9zJs8/YUkJ/T/6wjKgMCLK0fKU32AFFMNW1rfHsbqv2Q7g/wB/PpJxIZm2Ttfb
	 8p3HuK/0CrF9ZtPkVzoNrnOqRUQ0ukUZkXWBKmNfKw/KgGLzHlWOs8wIE+PjkECRNXNcS
	 xdFZ6oAwlbjutmrTq0nkyek7fwFCOfGIR3BklkySF5irgpZoQCw9q5jiphm+HSritQfwp
	 SOG4zZ2NUznwoGm5G4PEq0gZuTkVipAZjotCOlYEtuCm4Bx/c+Wu4D66OrX/Sy0hCIaym
	 toYmKJ6X1cWUO51O0Z6GjG4iRLape65k9idGiui/aTdT9ikVE+zSG84+VqLuKIVpgbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=abCqUT2q;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF5E606A320
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF5E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=abCqUT2q
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1104984f8f.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940036; x=1793544836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
        b=abCqUT2qPhh0VNCVDM4lRtN/Avcf8m2uOEUxnQbNwh46fgt8mndJ8E9RVdpNvxBHGE
         PKzyAeub3ezAtRI6CBQ+jE7mqJwu5G5xFPbQqs7ZiCHgYtmU7JifZdVjkgbt8vHoVrgK
         mCO2txsgZqB3YNpWFdS/t58f9+6DRNa5ddy0zHkQP12q/jvEg/dETYCZPSY+6WNJjUKj
         PRtYLuAVgAWlhkLndT2owcdropdC9Hwqa/VMBW+QNay99FIkILlBphNTd9UP80sYkWM/
         k5wLMVp/8AnO3SBcJvRJWaezPIeZp2aB6CHpzHVX+JIAdJvzXry2CzM8NPVagZ0UktCo
         8s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940036; x=1793544836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
        b=S4iMwdcxPo8c8FJTy0opF/hDQaXr6F8H0GYxel+MrmtImj0M6AqoQQYqoezYfmhcB4
         cZJwGO5KVWAURn9olk0F+9PSxrsQmA6J/K8U/Bft6BoDmhhTJZFKEmFbTXXSb2bxuz6i
         BavTu6Nl9fTpm1E38blIthOj4l2GePM6+IGyqncR1X2fYFuya9HOtUCITs5AvyK4YI+U
         YqLo53PKyOmR9YLKum0Ph1h5bYJ55g4h3Gx4muZ7J2ntCEZ3SjyV9qvlGv3oa2t+CbRO
         GvQZeC7rZazglOffKmqFSeF8p4jztBt0AYDcWz0YgW/nr0zf4ZUKMpIstn3z0DmmADNG
         imFA==
X-Forwarded-Encrypted: i=1; AKwUvByTecT1skQBowAAzQBQ51aXgyebqSe9kXAfJzu0d7KW3lLckSxbF2gywmDWo9ZCA0nj9HPYj8eFAmVn@vger.kernel.org
X-Gm-Message-State: AFq9FYKLnUZSUOE+d/iELnCzgJ0kW+h307KJ0x+FhBHNJWQsH0U6vWzA
	PIpqFb8FbS5u/ICF4qBm5Ycp4WhsiPl6wBBi9Z5quhZhMqKJC/mo1iTc
X-Gm-Gg: AYBFou0UdVzuuSz6pKkWD9MAUo+RRRQEXv4TiZkMd4JaVwGibH9LISSG8Cczv1fewt3
	JLnnal8SA1PN6P0NkQGDtODu+Z7m5jSAPld2S66no8/52M+kgvcTG3pfXYwbcbBjxNidgRQ+y3e
	KwYDtrjuFNFCpJszxsTSDYgzloPxlUkUhzcZCffF9nDMkHkRzqdH04AY+tsuyXLNmg/69EYnvxp
	UAlC5x+b/E1muK1PAKPRaETGW8GSqtWBJhlmPmenx5zxjue9XwOvmaBAh49YaABis9EZH8Ln5V7
	L7gno8LiDZvBTsSutyOyADKNpudTLhDlfAoL7ErwK99bzRdLFef9NoRLqGV8l5/xdEh/tuax11R
	dj95rHj/kPfgfq6IOLraDyPO7a3YVMt2IqsCe7NhpbfWcHN2WL5PzQjkTAbOR8qZWsDMxJd0R5t
	twXjSZRIJOSV1NTQD9YwilmgUKa8Gtj72OvtCLnOPKa5vfnk+siEj9QMFritsKjrkAkc6JE5MSX
	sCjJKgTyDSk/GBYZPHdMnrDE8c5zfKJVrmj4efTY8gPJuwnc1fko40yZOp6YrzXuIBphEikknzb
	tt3Y1sXzsl8Afznqlr1UXVuFBUYIeksdPy4p4QP0xFarDwZCXZ1Iii9FFQdbbceZIqdxQlA=
X-Received: by 2002:a05:6000:607:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e3eb9930fmr9037851f8f.41.1792940035985;
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
Date: Sun, 25 Oct 2026 15:53:53 +0100
Message-ID: <20261025145354.3476371-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145354.3476371-1-romain.tisserand@gmail.com>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
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

The RT5631 runs from a master clock on its MCLK pin. On boards where that
clock comes from a SoC clock output, the codec node needs to name it so
the driver can keep it running while the codec is in use.

Document an optional "mclk" clock, as the realtek,rt5616 binding does.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44..03ee25e1eb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -45,6 +45,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.43.0

