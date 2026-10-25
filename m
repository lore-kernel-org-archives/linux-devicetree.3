Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936706;
	b=O2gvkblQL0m+zT9JnaiusTj8BsVCy4vy08tTED5OjfQYZ0ZZcQihRTO+ZjLpDcmPLE3M
	 GLDBlEmYqOwfTV6vK0B7sJfLNb7RgU+tUyKlkoQpAuW8JK1pS/qfX1WaBybAubQEPtalA
	 p8jYBLB63VlL9JO5pBhMnzpcSfyGZsSPFk41ZX8RIzt258pNpxMohdksiceVd7n1qj9cx
	 U3vRyEnjFttTH5wyNVwZFjhrgym/5U6nrQqYxU8obWclNWl0u3T865N/K+AIGCtHj9OYl
	 JABG4hDk7EHsBI1LlVzSAFzAvhyR2Ea6nyg+deHZV+10A7XiXtpooRcJUXpXNOCJLHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
	b=FtWIHBkzt9s8Y2eIZd381HGULJdG4LgmvlJ7Cywy5n87ZfS2NTAhbdTsiHQJ2PjUiFxR
	 8JhV5z2dG33NigwPq3M2HKbd1yQfqrRS0o999sC54ePh7eW1qc/0Rw+RVmick9vNDso9h
	 OXfpB4B6zJ5CENYbJ35VaFLauZTDCQ7u7Qo7lGnPGeLYnD1lWbP+tfbXPQ3PzzsPhROJl
	 iJA9iHb0CmhWnHvsDAdL1tfgdkjK4+m2OnuUZteQcNg7fFHc6K5HdCN+6uez5Tazk5onS
	 u5wDDWopnU733r1LLU6AnPARGMsNNB8DwTfY3EAVjR+W0ON0//1kSrulh4LqgocHtnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oqLF6mqt;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F506606A324
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 13:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F506606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oqLF6mqt
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1629413f8f.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936705; x=1793541505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=oqLF6mqtZX/wLfOVtnb3bMuXtECCsqjc7qiCPIAXSOwGIBXO4XzwzWsJvbfPiC0PIb
         Zg4wofMNHNcoS8FvRsG2haIgdsD/b+GaYZR6PcfyCRNRdkvDj0nIDOWwCD1PctuuNs0T
         tmXq4HL+sIjEa8a+KdlW3jVhiYfbQtOlhT3NTFlKEiB0DIR/zpaEFYGigG0mSOpkHIyY
         2Qo9nNSnPO0O+J3GdNi3bJw/R1m5wMLJmZroUkard/bEhK0RumpNKew8/kVXaa2WIMSh
         T3nFkn2BqCElYS4d+N+cTRLjnt9kSqfaFlUQU0TkFNE597VOYf3DZSC4TPZFQF49TgNc
         Arog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936705; x=1793541505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=75/x5gew/kL/KutTpGg3fvui7cvgM1uvPLVY0+jqTgg=;
        b=WwAm/YXRjPPD/4bFlsxStaAk/hqrQr2i5ZISIQvBRSrtlP60RVyMegpGxmqNtIGltp
         iSHB3f3+pJNPw/SgC0kgek+4FBKsIxQAFGwij3s2TgS6ozrFHiXtPVJM97w54aRismhu
         4aNdi5uJa4hckD9KrO/NMPtj/YmVJ3AlXEctcZEAqciBiCnjKDwB1K9ssiMdgSii6UtP
         EvK4rK1dHc7KIxVu6QohKIH+CbAftbprkOE8aprj8BEUrmiAgb3BiLwPkuFtRyjin+YO
         D5vDeDQ2p61KxDnh1HdcwL/pFYja2k5KFjAgegf5JfZnimw5DDtvqNiuYC3REqv0+Kcg
         0csA==
X-Forwarded-Encrypted: i=1; AKwUvBwjDqEdbnn3ArR1/uwP3xgjN+JT8C+g0jJ7bfNQfEyh4Oqvf+F767wL7yNftGHzPUsunmvPk4uJYDtz@vger.kernel.org
X-Gm-Message-State: AFq9FYLLIaNS0oxi1k/BbSp6vdwXrvi3jV7iCuGNF2jEcLaMcvOmfX4I
	ZXDGoHi1cie7qy3AbQnN1bVoNbDOole7rMS2A/0oXs0WHhcdOp8GeekF
X-Gm-Gg: AYBFou3dW+00KjM06XYKR/vOEbIf/qb+agJl9EA5h5awkBQrIW6AMHybZUmvBzhYXDN
	5E513Ncna/PGowkh9+UY30DEqB/fxfQjU52/4MNlWlnVDaVjhjY/2fHk4AGCZmEzKqHuTxq13gR
	blptsDw9Vl8m7J9zq5GXlWjcml6y30WvjjzdZSbh1OFsOrBVeQMroe1edxKkKtdH32D3vXG6BsB
	meEQz78kCkfjfuJCq26vFc6+Byl9EBMiE3r6ufizSQBE3OD9j9nGnu7dtoALIc6F0O9pvuq385t
	Ua4sgajcFK9W0uSYQCRelESZdqi6cqwMz0kBYUSHD5kE8Q6E9tNc/WnlwcUk59/ALldikeG2LV2
	aycK/c0DRSkkYBdvOtqU+WoVyU6HC5Fo5ST3pLUHS+L5OWm4HKEqgW1bnEfeg6ctRhT0OxTEbZK
	YJYZisLArtU9X3ww9kzb9fF1eWCWHA8aK+j2hbzpe8OFuR+EksU3zzC6Kuo/x4W9PXUTOw20W4c
	FLie9NFkux3VZ5YnSI2lHJuoGU7B3WPCAqXcOEGqclnNeqjHAfCZoDlU868c2bTb8zjJmCe42aH
	onlluoQ/1GXEFQ==
X-Received: by 2002:adf:e004:0:10b0:487:27f9:834 with SMTP id ffacd0b85a97d-48e3ebb1168mr4784693f8f.41.1792936704729;
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:24 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Sun, 25 Oct 2026 13:57:44 +0000
Message-ID: <20261025135745.102970-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025135745.102970-1-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.0

