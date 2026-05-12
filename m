Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF03988FF
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576074; cv=none; b=Y6a9vEgAyCz+1L/u2oz0AGUkHyAVX9k2wUmXmDrHYvU5WicPSt1CIPSx/nmZCKm5xyCFCqGt9sxCThvNPFehgSZA4M31WFm1m3k2uIuJ1D1fMiLoel8DNbeAMXmTQLx4KszoRCzRlEynYpOUNKWpkUTWm3NhyYik0Cl8K/weJ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576074; c=relaxed/simple;
	bh=PpLCefyesooJtRaIwLrrCvoFwtr9I9CnmiNsu1EWKtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmqYyfYkP6tsAfw2ezmYeTGch7TlLzTqhA1W1P02GRCKrLeI81Xk8wlDrEQezsDQMwMoKYPmo6CiJ1mgSR6PSreB8U/essplh/G4QcijbMBLLMOh1MwnKOaAceysZgx7cnKURhmaqMSzqjGpRnM5JFNSGg7kfpXLCer1ISUfOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ILEG21Tj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ILEG21Tj"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8027e876fcso2124738a12.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778576066; x=1779180866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=;
        b=ILEG21TjZRr/t8mtYPX2Hepqnc/2bLXPlfNhLOPRC+cQHP0MZ7haI5GtcamMSfdYbu
         CeHQQFgCJ/M0DPKd7mNQFJ9/sFVpQsIXH2d74YDGjIpF++5G3NDEeqZR2tnlQOCVXz9r
         zQrLhP+p94uMqJtq6NgVpMmXmV+VBpWpvtauE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576066; x=1779180866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75WqDjeR/e8cdr8sYQMKFFH1AdK4iAEiulrhw3a0B6s=;
        b=fLYLdf1vOXc9JfGLBby+0V4Io/YLttg42JhzQgkIXsK01PcgQNtSnNwYyzskfNELls
         OprrICb82ruuEWhPSze+T4/fxb+1qXM0kM4mSqx5uLh1v5+jsKb75rs0FWcfOlaftgdo
         J2m7YXlRaaY/iXtkEt6dAOa/Z2Nf3sksE7oLkWvalK+uqZWWBjaJZ6Fuz6txl5wFIV+x
         tNpSljC7edsb07DYkrkYL9aKdSPfJ3Lob3Q8jcU1uVoFOYvMSv4p1i/QUrSHFSUm6xhg
         pgeQvx4/1xWt/rutk+I99xWp+8Ei+CtI8wPcQput+ZY3SJo65WMiSgmOTJUvuKdFyUGs
         D+kA==
X-Forwarded-Encrypted: i=1; AFNElJ93hUWxB08ZbkSijh3pi1hAZeKzdmiXjgFBe1Yzbp5qy8wEQmstdgyLsfEeRHdhq6x9Mb8etW/gsVHv@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8ZqJX7CNdKxQxjOacwH0RwWetDvSmknw9RvgEV0mUOCp7yYn
	kSInHVA8xyk6603xD/9NBzagD8ZPlMtyWyc5S1ULaIlao0WcWKxdjmTXwuJHvhcCbg==
X-Gm-Gg: Acq92OFL1n78tpglyXqZmKV6jV+R8cF9bLAgIzVPYjYfksNUvB6H9dwHVXo70/J2Iir
	c0/ZAdC63w6oHu60zZnwMSeh3BO0KEtrrtjTGV/V9UQwX/slDbPk6NxshDUopp+Hv6HeuHiaF2w
	GkuiWwHZC7+refqT1MKmeKNVex244u4MEWDQhAprjmEXq1OQql6XJol9SUwBO3NFnisYyJKbkzH
	fOZL3qOGOUEEfpxkHG5vvavWeuFoZv6XelzjG3vqhEVxWo6wcAPtJlGKPLrsl9FdheavLd8dUQY
	KZ1Zqn/1bxQgKWfquFc7XCqwnhaHZkntQHk10YAlthI0XXJFgMG9mXxL091RpEAwJ4naEisAF+h
	Pt2cyJj6MvD3leR0Oz8u2JbN2UGZ3vP+KDAW/2b5knh9OOu+SWN/OSk6WimQTxrz61Gk52mDFr9
	m+VYSajV/JouqqUawGLtxa8MGllEi3zpiDyicn0O6heVyUgfCQWNCYk+KuSiuV/5CtKXW7T8w6Q
	Lw3ssMVUXqHlHWUEDk=
X-Received: by 2002:a05:6a21:9983:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3aa5ab71a24mr29852885637.26.1778576065529;
        Tue, 12 May 2026 01:54:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:6606:2bd2:159a:55e3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm11136856a12.24.2026.05.12.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:54:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/6] regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split regulators
Date: Tue, 12 May 2026 16:53:51 +0800
Message-ID: <20260512085358.1693208-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260512085358.1693208-1-wenst@chromium.org>
References: <20260512085358.1693208-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
two enable bits in the registers so that BT and WiFi drivers can toggle
them separately without any coordination. If either bit is set, then the
regulator output is enabled.

Deprecate the existing regulators, and add proper regulators matching
the outputs: vcn33_1 and vcn33_2.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/regulator/mt6359-regulator.yaml          | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
index ac925334ae83..eb62d6a0355d 100644
--- a/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
@@ -30,7 +30,7 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
-  "^ldo_vcn(18|13|33_1_bt|13_1_wifi|33_2_bt|33_2_wifi)$":
+  "^ldo_vcn(18|13|33_[12])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -55,6 +55,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
 
+  "^ldo_vcn33_[12]_(bt|wifi)":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      vcn33_[12]_(bt|wifi) are incorrect representations.
+      Use vcn33_[12] instead.
+    deprecated: true
+    unevaluatedProperties: false
+
 additionalProperties: false
 
 examples:
-- 
2.54.0.563.g4f69b47b94-goog

