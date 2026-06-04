Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683C3D5658
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604456; cv=none; b=F8rtxlRyxKuFZjkpR6+NnpalxaUO35Lpse/nO9u80imDvSNy01IdmJT5UVZhdNArTpr1HMqus4Ft22gJy4TR3Ha9MBCm7xjxj53OclocqXnII2+EYq3FOzrcbxnEuH7byQCqD3sw1eFN2ti8AMuQThOYkfjRu+Be5F5EX2P6IbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604456; c=relaxed/simple;
	bh=BYwxpdwIOxf7wHqRQciuY2Af2ntz3zyjFfIha8IvcT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0/6hORYsSiz20f0vbx7coh2FuEaS6VpFJaj06A6sOu6PZfazLeNP1tFXGlclkU8+OT0FmnxC/9Qu/IZsA/ufSmhTma8e/SdiAXRCvjagVHKnSEwcPLmf+u448txqQgpqFl6EgF0xatOIaVGqjWJSg3Uju34FDzYSyiBeAG8eBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NN6uljEW; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN6uljEW"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e6cee520ccso885071a34.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 13:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604454; x=1781209254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcgz1FBr0J4qXoUHyaNL3XQfYa/z8zpzCDQPO3u6gd8=;
        b=NN6uljEWMgptGlZ+2BR7QSGrBsLugJ9s/L/Yp2GAjJvViGsk46qQUuR+2AzW0iT2yO
         sVG4mJidpQ9qdAstMo3fC2FZaBTFq8tlB+wboeZylbBq9o+2neSdxdcLzlF+Gf+NoG7t
         woHrDWzRxyWjqJQeI+Z6j6Qjj1cnTIbPFfJ1oYdBDRpzagNI+Pnn8JgPdD4dogtwJC2u
         SuvgL2LGnnm9oeBnhVaCWSarWUu5Q60WVK7AarBgOjOOsxGE79cS1M/3AA+PKJCnz44r
         SMrnTxwE1ZXH0oEsd01N8rS++a1tp7f2dauqNpexiG1OvnMCcJWXtuasE55be68DHBwF
         XzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604454; x=1781209254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcgz1FBr0J4qXoUHyaNL3XQfYa/z8zpzCDQPO3u6gd8=;
        b=PCa5f2Qwxx40Zal3S703/VfKu8dXKVHMdYeMYzRVudnth6pztnsu5gHRIEFRwfvzZ/
         qEpw6rQqxWWb72SRJ9nkxOXGo9drNl1lfAB/KnQIho3xCyVYQeWSAzoAKRahmGNHTqLI
         bmQ2sLS1Lx4HqVIfJEufnkjmBfgzG2Z80wrCxekhb3xv+v/r6Qq+s2oLRWIq6cqa9YF3
         1TgEFvZYiWzpMSMBsodR7jSN2/JxMP8kaJoZX8NacKIFgn1cEaDi1TPYTNNMwLJu6eE9
         J1NkVt48o+DsG5S/8bPKVTM8UhTDoP25T/IHH7B1cIjZY92OKGK+b7RVf9JbmNB3QzKA
         MJ3w==
X-Forwarded-Encrypted: i=1; AFNElJ8uTY+BbvtDEu1Q5zN4JExLVm9tcD2TrRMGnKox7Wpy6MuALfTJJ7zjSiEpLoxffIIkHhEMSbTFjLhL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CWPrM/5fs6uETz+Z3DBx53HSi5NZmQfVl3sBBMGDIIw/DVXu
	XnxR9lgEuwpcRRG48vV37DzZqZ0jEN6d7ZzdoWkjFyJd/XmmANli/6mL
X-Gm-Gg: Acq92OEsIlowXVVi6ixAhSYU+qOB8AqPCaVVgMXuj2kF4xLTl2clhQTY5vLtwxAvkID
	i3UbeyaDwnyAN/0dg3I6jSKEcoLqJONlL+IiT4Zj9VqXiUV9QtEfos75alJ3ju6sAHwWaJ2OVPH
	sH6T76YA9mnCHOIcT6eaihsJEnMdHNZKcmJZCzum9owTn8sAVbyR7ZFHkDM22QKYzVcTNUsCf56
	xSiRZIXWa6ohF/ZnLRGQfgW1lDrWLt3UfJSNHk0b0e0d+6Eszvg0aFzn/WbN6pqR4HwhwDQrQ6x
	joKRtNM43z+7hJCx1CI9lirjsG42h3fwJnD7iHPVjFhDKHCJr1E8fHXwvRxtGgoAJJ/Y+J7RsgU
	qtLh2ysaVvquVax8rgHJq53TOzXxgFt7A0ctKOxHwdZ24zL9tOLfzKliBKNay1G3h9jETD8pYzS
	i5UKYsws3S7ZvUpGpJuo3ioWBabcx26QA=
X-Received: by 2002:a05:6830:368a:b0:7e6:d7f4:16e with SMTP id 46e09a7af769-7e6f949fccemr2968986a34.12.1780604453769;
        Thu, 04 Jun 2026 13:20:53 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e796c675sm4541800a34.24.2026.06.04.13.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:20:53 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V10 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Thu,  4 Jun 2026 15:18:24 -0500
Message-ID: <20260604201832.60656-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604201832.60656-1-macroalpha82@gmail.com>
References: <20260604201832.60656-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout. The driver does not require an
interrupt for these specific chip revisions.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/iio/imu/invensense,icm42600.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186d..81b6e85decd52 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
@@ -67,10 +69,24 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - invensense,icm42600
+              - invensense,icm42602
+              - invensense,icm42605
+              - invensense,icm42622
+              - invensense,icm42631
+              - invensense,icm42686
+              - invensense,icm42688
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

