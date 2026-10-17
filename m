Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C094364EB8
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226185; cv=none; b=gt31KJ2j16y7HyQ62vNbHPBDt3gA2rI7PgmNzDhZ2y3cwmFJTlH4LqgdizQkWZZiDDA7zjtbA9L91CDiHj2eeDmuLuOEa3Zs//Sp8EOYucjAqyylOBmFR4QVRq9ga7Y11IWRD7U1QTgpAsR68X3nFmsCTdo58YTZbos4bAfpzm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226185; c=relaxed/simple;
	bh=H+/PngVUyrVREnpYqPk0KT7pitaBFyX7wNqwwHkQmDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLQKoRYiI/zuqWjrBahkZbAmQmvXgYzcjHWwkgVhQNpK/o3R4sIhTZzu/n+giYv6Bdy8O3WsFrAil1Md3NG2xeHiN5rP4uxPk33HmBiqMKDxU+7M3Sy4DQanQyO9kQrC7on91Y0EEv2qXMvssgRXDPfyI9xIsz/gYyZl+MVbqkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS/61Th7; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS/61Th7"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so139661a12.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226183; x=1792830983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=IS/61Th7EtInhdn7S9Tl/41iUQOIhrfpxD8j8649CVk7WeIHwyv+dFKAqA9oDsRuY3
         dIXKJ5ALZoNxDpGGa4gMvR2bqi+rWH2+kh0bUJu0XxqK7DfR0hMkTa4I1Df+7Gp1lo7d
         fHfUK9dzIPaWU/1UH7mCw6zdaIgphLSMO70Deb2m/pRWfqIPO/5glY3DcrrvDO+dXYZ4
         Lk7rnQG/263F5Bb9vSO8qc26jau6faj+OT4qEkzJhJTo4ScAUeZrFKS7VkG8aEU0AmRS
         ekTXL/COi8vcsgUGafWEP+BitSpb15WysIeXehZPNA3zD2aql27uuQ9Yq33wHQrQinzM
         Sf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226183; x=1792830983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDddWpoHqTtkxFsBbERUVZlldFJw6rS3OQ/sbeQSp+8=;
        b=mPxs11t/Q5TDsn12FfnqC0hWh6MSIwNCTyqpY9pkP5pqaPeQrzSIeL9jm0+F2AO2Ch
         WNcXN7JKK/Vo6SH/CtAvLPfbInc62VkPOgXFvGOvZ3Re/GZHf4jkGv9jAIZRv6V27//J
         7tEiDbcOq0lDbgtCgNqm+XmRDAkiybBZQ93O9vrDDBN2EYI0gUUyiHB1V0nZ/bC/vU8Y
         b2y80n2fodvUajUy7+HOAkNJ7uB1n/EmYZseHGILpccVXCwbjh+PGlJIZKXx+fcYAVTI
         aS+R7gsgG04q9iBeofjWMuEFxrU/qLJNUsn7o+56HgjeOVJiZMkY08r1/W2yC16ikoWK
         unOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSKVCC7EPVrdvBIcsShFLIFtoq5Vevf9rlkQ5vo24R83pPJFqC3rbIoc5hDGJIDIHxB7JeVvAGs+B4@vger.kernel.org
X-Gm-Message-State: AFq9FYIq2kc0U1gE239aBWoKIsHz/tT/H7p+Hz3ueo2YaWF04jBE13M4
	pb7GMf6ykoSEo5ufhc43WNWBVC7BBO9WfcfnWBKOm1hlTrrKC1bguZ4v
X-Gm-Gg: AYBFou2560+o/euv2cjzP/DTUUBOai8mCIlK2EKNHvzGnVKIZJ+Ya6CU2qPAuFy4dzA
	YugcKC0bPhbzUOLvoHtlrgnnbZ2nfWaOQAsG6brQFV+RQdzxsRZDkzSVUii59xT8JjsSxzVuvOA
	7z20X98Y7zdkCjchTChfhVEDkaCEusUL2dmOyAg/rl71mfOJpCdyq89J4TLsCFRfhzXD20kghLu
	EnhwMgc6BrqfsPcNqcHQg9xp+i1fabb3UnNXcmrp1+1rmS7l25XMQEjrU7ygXeWdmQr8CFrySH9
	3n3xfA8OWgufPV/lFnNzGbJGjeLAGLlZSIVTuCAv6D/8iCyYDCOwezYRZ62mNCbkQDBpzpujYwx
	cDWMDVcT26PTMxb3dCcmNY+87JwOOKuFvjI3+VBxxbuIyRSS1PJJGaDmha4NEZ5WvaG103RL4Jd
	8iZZKzVeAeLrkKa65Dhal7zfuqVYB+KQxNd+nfwDqS1kwstGwFm/f2GYI=
X-Received: by 2002:a17:90b:4403:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3acee277aeamr1748958a91.6.1792226183357;
        Sat, 17 Oct 2026 01:36:23 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:3141::4e8:8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9461d71esm12548544a91.7.2026.10.17.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:36:22 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add smartisan
Date: Sat, 17 Oct 2026 16:35:29 +0800
Message-ID: <20261017083531.766557-2-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017083531.766557-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

Add a vendor prefix for Smartisan Technology, used by Smartisan
devices such as the R1 (trident).

Signed-off-by: Lu Chen <tianshi12127@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..6ad8d3499227 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1535,6 +1535,8 @@ patternProperties:
     description: Skyworks Solutions, Inc.
   "^smartfiber,.*":
     description: ShenZhen Smartfiber Technology Co, Ltd.
+  "^smartisan,.*":
+    description: Smartisan Technology Co., Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.56.0

