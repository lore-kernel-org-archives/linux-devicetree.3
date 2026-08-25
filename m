Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C048C8B9
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672943; cv=none; b=EBoCmWUDTIsBSrfCCjgLb2SKjtmSsuejRMUrLpytVtNgGmo5F5HaLp3Ota3NdP1efLpRm/uLil7UoYcsbdbHUAmrFJPrXJCcAokIV2FCNKMqPh55iYm6bJt/EVcDH23XrkP8yqVrAA175CohxMYlgkXquAZZGiTtCGPNwZNFCgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672943; c=relaxed/simple;
	bh=Smy6j+jvyzcjX3oQa5z23WouidnyYH+/yVbzp6giW+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9aVt22K/E+sMQ+IjGqzshWFHrjAvD8bf8A3ahYac9eTVJyHIShPVD0iuLZzmxRx+3ucd+zcPLU63NksUkbhsNvEjez04IMAXinyRuzbRyLTle7MNUm9wRxOevedPB2JLkjeoQMlY8i7q0qdTt+Uv0GV2qYhczCLHLbRQ3whcM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBj+GSEV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBj+GSEV"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2074710751so900196766b.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672938; x=1788277738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L41oBJgkTA0hJ2K5fg9Bazx7ynuYkWueRKGvRCk3LHs=;
        b=WBj+GSEVcTcNyakwEAt8Xv5LYvjPfXLf7GZ23d7z1U8c1btd5dOIX3diXN5IeFdK72
         +5htTRyy/7u8dMZA66tzJmJs5wsiVmqWlxfBLSUUeFDAl1RKOafMmdcKMYbXpW9+j0dC
         hPeZVni4/GCXpKSi2WvOfiByTW8ya7aK1nYyntV0U+b/P621ktJnrbVwat7s166JnIam
         WPa8e9Hk8ElktfS88PeiKr2YhwMPjzcf7rxwfQwTjssFznAORH3Rqr40U5HC4/EUQ5IZ
         ec3D72JCQBrPtf1T+oZKmyqWN1ojMQhV7x9lD3u5xGm5RmQbv03tLyfbN+i652iFtkQo
         /LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672938; x=1788277738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L41oBJgkTA0hJ2K5fg9Bazx7ynuYkWueRKGvRCk3LHs=;
        b=Sg9FfQb6ohM+hVUjsEHfiH5ybHCGhKg31mCaf9Qvxf5AqRTuQLOQDzrt9aSBU2xxXJ
         5RRPDxREr1bCQ7Fsc0FUA1MNZLJzrkRbKRmxDW+UXBOiZnw8Et+kIdbOZx6zujExaR4b
         n04Pb7EF2Mix47ycpdhgzh/h3k+9Nugg8Z/zwThHCWg4gBc0+BPmsVzxIafDsG5n1sMi
         xTd+Pep8WousRh08lZVm1dF8OqrfA08PhvavD1lfzApVcu4Yi7Thf4XR8gCitpzSAo5B
         zIggv3vvCk5ChVwKsWFXFRpLqbhQ6DJIjy8O2KpZYSHUlDuS44uV+e5S386f3gL7zTw0
         o7Fw==
X-Forwarded-Encrypted: i=1; AHgh+Rqu47DrvyUFp6KWF12Nwde6KM0AhjYvFjCDXHXzfnuiQN2ByU0TpTrSRyiwSmXahV7NMrJB4S+DhlJn@vger.kernel.org
X-Gm-Message-State: AFuF++lZ9dL3J1kjbbuuRr6aEGOQAcaJQOo/H6dRCIVj3kLOHSEOLjQv
	vQjiiFqGUaaerBJjws//Ed7PEtIDj/9Anbg674mjODQ6mAH1fWs30yeRW3gWiA==
X-Gm-Gg: AR+sD13PpWrOgPj1IITx65Hxd27lEpBnHGyLC/PVgWSH2IlK8ZrGEvds7IaksAZBgD+
	hz0w5KGVDpKjhpgjkcGbD2H3g7Vd2MhZWaV+jUX+7VeEx7LrWUGvMqrdkpmg+5A8L3y6TgikYdr
	/puh7/RU+l0Ea0GVlOokAuaDcuqwilJlFOeVxjL7N/V2Toji6zg49Xdyn2jxIrwS86X73PfIg9W
	z+11jQatWWuWyTXk2T3GNb9syHdyQzgJ1TVQRl0rXy3y018orymD3ipC7G/oij7ED+ie6+7sgEM
	n9lCzV5+/ez+EYSMYqy4TWFNu1N95Y2xW8X2JPca7pfXPeqP7i3++IqDBUFRxlhfpP+YFk4SC8+
	PvL/XxpS9JrSq4//xVpQtMuii+Hwiq7ZjkMJENEGpaFLFSaE6kt9xWqkFPLbcqKDQQfdwr8Z/s5
	/Nx2WYpOW72bWc7KYM1OtdEdrSEMbNLFAMcd3c3rNhvwyf/IzD57tRle5jdD9BPMlZWhhjJOUO/
	qKwYqfSX4X3
X-Received: by 2002:a17:907:c8c7:b0:c24:680a:1c42 with SMTP id a640c23a62f3a-c2491c9a6eamr3228063966b.7.1787672937652;
        Tue, 25 Aug 2026 08:48:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd69asm16682066b.18.2026.08.25.08.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:48:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 8/9] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Tue, 25 Aug 2026 16:48:36 +0100
Message-ID: <20260825154847.197948-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
References: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
v6->v7:
 * No change
v5->v6:
 * No change
v5:
 * No change
v24 from [1]:
[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index 13b807765a30..98bcde755fb9 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <3>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.43.0

