Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB947278D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627837; cv=none; b=TYfLYkjmK9NScq5ez9MwIQ23ShmJg/FSOACyvXoY00dR9UiN7pWbE0uzhko9f0gZDgM6k+EufRMoRSebRoi399bFQfh3aXI4lhD4bGR8RqFVJTyMel2Nfx2bhPeOrc7mMFC90AkBnBKQa2+fBfUQ1fgtOj3U5cqw5wuUN6Qw+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627837; c=relaxed/simple;
	bh=FvfwoSqBdrnoxs5BiXAqEZAAhFsqtQJDrQcSxsbO9xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=la8xFA9OkDBzRoSJsCu2TtEFf4IK8BVzyUQqxVZeAlh9FamkwUr1t5nJuMm2zabvhZgaNas5Js/UTQ2CT2lL2JHXr0npuU5Fk+UsUwGnXIcf37dlEF54mwf/ObuoCWLyjroL74yIPpSBUlit+TLjC4OlgM+CPa8hViu4KJE1ARs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rq54GAxx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rq54GAxx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954dff6536so24474705e9.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627834; x=1785232634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=at/d3WF+Zw9xKecGccpZLlU2r+Ygji0UehRFE3mgt/s=;
        b=rq54GAxxOIYegLPiDVffqle1elMP8uNrncbuduOpUKbc3leMN3nSjJqFhDuBGPYrF+
         dV8EnNl4dJ4zL1g82TldPVNNy427CoXgnfXNGKWgSu2mwP8DcZ2CcB6jsOptze+EIdwO
         vGWnjZkp9EeVg4zfltdlITF0pU9cHE0x+WriVmeQ8/jSMAQoLUQXZ99mmh87jaCPnTWl
         GMzc5pLfp3zm2a3EFb+O+DgBPvAhsJn5qedClqmpyGp5jixn/riuS3BmeMc/f2FZuPvv
         dBy2EIwVAw4SiaZskUxyUbjAS9/wOICSlo6jKL3NFYJA8QcWk7suwmUh5o1ze1WZNsLM
         AE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627834; x=1785232634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=at/d3WF+Zw9xKecGccpZLlU2r+Ygji0UehRFE3mgt/s=;
        b=dsbHeTsBLsrHjeeuEw4Qp82+0/vBWnLx9IwBGWI+FcSKW3Xt5z+2C03XcZ5AdCXrUx
         hSvpphDlgdZHNihStNOaOzuPWPACI4z8HxROHXMopdea0p4xgt+vDD0MV8Zyazay7bRh
         5fqlyMSRbhHWyPnYZOBUpNaR9txWbjnyvVrl4VP8rEgkCeqma2YVKOiHg1tEoa+/4fWe
         Z4PX785g1RGo430zl3HcMqfuGl1zNVYJ+QrFCh0xbbOIzTO7kPWqcMb4QphnNUyZThh8
         hZKZaSkjfL0/8sU361mGOOIScWW5VrJk9vG8ouGxpisCs02oNwDiuBEq+646cKlk66+k
         H+wg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2Secu+Ce0guDNFPnL7co9izFavxi72WGQc6nrBnDfUUMeXbDVL634fGI6Yi7d9UgJvkqLVK7bUNA3@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYTztvxweZ3enuJ8+yejcEoNLGADoNTxmMPjVCOiozlxfjiWp
	eolKOjWiyqLfs9KCFTXRwNupvamnBk5mwa2xKZ6n8GTnwkIz95tqSb39
X-Gm-Gg: AfdE7cl+6cKLzzq4Ja95B87lBYleMa10RGTYtPK3cTiG+8U7CZ2uVYkRtNqI6R6IyeM
	Syj/2yKzi8UfWvsxnCCZe5nyuJ3D+lyR1Y06e84S+zSpL3T17Bm46HxbS8u1BhJOKDnfuibQfMe
	XDqPMiA66tu9Bt4cWuCTi85zNTK+cY8kzd4doRbDwxqqfCKsahiIjQocjcNyZtQXRcm021Dd1u2
	D0II8+p7eqCOB9AOY3Af4jKrsJbuXGx/uRff9nzdN7IC2tjy6BdhYSFE1370UaDHIsTwCsrshkF
	7t8HcLczWT8gzjWaYJG4E1a7Wo4VvbpWSTHIJ37gadOjjYqr8IWDtA6O9mA9f+DCOBa5ZZE+lDg
	S0nqUJfdQde01qgCL5iDfP1XMK6r+TPITU7VfYTUS6hfTTNnwxrtbL9Zm0s0wVwKf4CW7M0cFCg
	afPg/Zw4kOYnAFn/DgdM1ANx8=
X-Received: by 2002:a05:600c:474e:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-4954a403112mr221507855e9.22.1784627834246;
        Tue, 21 Jul 2026 02:57:14 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v7 4/6] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Tue, 21 Jul 2026 12:56:51 +0300
Message-ID: <20260721095654.429346-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095654.429346-1-clamor95@gmail.com>
References: <20260721095654.429346-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 76705ea56805a..da7abe2ec9126 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: motorola,cpcap
-      - const: st,6556002
+    oneOf:
+      - enum:
+          - motorola,mapphone-cpcap
+          - motorola,mot-cpcap
+
+      - items:
+          - const: motorola,cpcap
+          - const: st,6556002
 
   reg:
     maxItems: 1
-- 
2.53.0

