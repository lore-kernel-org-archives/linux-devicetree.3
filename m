Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF31A3029
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785044322; cv=none; b=PG7xlBvrk1nGoXydJN9leVYeUGKwrAO7xp1nj91cicbGYRdB6RIOhCmJL7E6NFbPVmCL9wTgPqEXmYNQMuYsG1rBewCvjT93NhWX174QldyviqL571MFDO2txBrSzPMdU3KK9Gj1nvz/qHSqRLLOdvLCKFCHKlhJZFKzyOAsdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785044322; c=relaxed/simple;
	bh=j7FUZwB9pjASzphoYEYSQhWkw4XGgszx7T8FJ8ZX9DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AIRPbh6x2WF+d5GvnOrR/Iw9Bczs/wwqkA5DTSvCYBokyY/nje3RwDhcPJaptVQ0q7NvaETVZ3/F/EbQAW4eq0tCqq1zEeYObbHCypoB4AUFAzo/Pa73iNhaSAhX5aYAa31i7wYcJIVBcJ3zP1dBsaFJtmimQqALAX8Tc5l1M84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9ybJm0l; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9ybJm0l"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1770099b3a.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785044320; x=1785649120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=;
        b=O9ybJm0lTEmu0uhTeWzgQ1ubuC61AW5RnX19fVa8/wCqla2JpLk4rmgZ+7lDoJWDVl
         NxwPLEIJVdW2zgUKcebQLCeOIZswg6UoBBXSY5KlA4aTjmba1Vq/EIMYWNpqbRjtufQN
         z7VTkgoKc8qzHqne83pXuSdSZ6olxB/pk0jkM7vSzyDxqswVe3Qs7YX9KKn4LS3ybJPE
         tXppdifDVWjffturkOSTceBg0CZzWfYXxZ30Mct/VUJqTTgA0szzLsMBRgIbm8q8R9iu
         O6ziIUhKAOTq4+iYfi1fQs18YI2KeBIzWUOVo2SxyO+kZCev0khl16RwtW0YlgD2CZU5
         USjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785044320; x=1785649120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev/3L8OQlWgePlw96lEzXKu7EjQVakUCH3mo3g6zOGU=;
        b=hEIW1u3yPuJ/KWteloJvXnor0mWPcs6S0QmiGLeMflF/RtqzyLEIlcCO43VUwrMSwJ
         fLIGApDMksBu5LRgDNJ2WZEFa0Cs/clw6w6yQmA5fHQ/4uv6L2FJu93Lj3Nu3TmRokTR
         Bw1kehlA1k5lu1OgKnV/PurjFDQEcIwzQjgEnBvOPUgtxgou3NBUwaQ88ysf2NfZMjPv
         f/R/OdR9w2Mg4Iqs8NPKG4Ym84fjToBFcZJawrKGx8AMit/mk5n8OXSP7edK8Ysj3wiP
         NQcmGqVSC18FFcmxbpXoxY2hpbcHjpNFG5oiwK70CpqF7Fk9NjOU7ONLeF4dIeYBJ3Ya
         Tggg==
X-Forwarded-Encrypted: i=1; AHgh+RrkSmYld8bJ5PUOxm85dmdi0N35MStWIdst7OWt7Yj0r0zeHxDOvhpu8PisG/5t0dB/WgjQa7ZcMO5t@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2FFNn/d/DwLcWV6VgElzZmfVKgfh3qIJALR8yxKJacfu5Cn3
	CDU0nuQojRa+Mq6mE+t519zIu9mQ05h3hLcubpQtVLh2danByQXbtQ+l
X-Gm-Gg: AR+sD11G6LAwuMrTflPXG5cjPVcMnQ/bNGXAtkOA3cS7cm/m/obQPBloyrrAkO9Wnk3
	THhJ9jIB0Eh3WPgTjzDOpGatNRcKSGWb/R4ct82MPOQY+xdyQ1BHG88AnGOrcBb3FKyK9mOuVrT
	d7UMOXbQ251htpm5EcEo7ItT3qVH37vvUI5FW39ABaG0N2nriPhW5mdODmcCbOt2rpxtx6w+kGj
	sC0dBFJ+/Vg3dDk6CWoAxodGztuHEquIUelptLt/3g43/JqYkrAPULf54+Ui7vwai57YZb4M+Tc
	xEg616J4FjPDFyfeACxh3UDCxMxkYfO5s9e25plovDBb0J3y5aQaq9m0ECtINaIubHMiYr7KlGx
	PvKziaunopQGRpT4NPblw3zapkq2s2lHRv3oK6ZbEaduh9gTwfPykm19TaT71C6YpluV9oLiaK2
	WPNZ+4oWijONYsp5vawD4TyXxB+zLvAE4=
X-Received: by 2002:a05:6a00:190c:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84e593ff0efmr3181609b3a.2.1785044320319;
        Sat, 25 Jul 2026 22:38:40 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5346dc8bsm1600912b3a.61.2026.07.25.22.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:38:39 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless-next] dt-bindings: net: wireless: mediatek,mt76: fix 'spacial' spelling
Date: Sun, 26 Jul 2026 11:08:17 +0530
Message-ID: <20260726053817.17409-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: spacial -> spatial
(spatial reuse). No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../bindings/net/wireless/mediatek,mt76.yaml           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index ae6b97cdc44b..e51acc544f15 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -221,7 +221,7 @@ properties:
                     minItems: 4
                     maxItems: 4
                     description:
-                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      4 half-dBm backoff values (1 - 4 antennas, single spatial
                       stream)
 
                   paths-ofdm:
@@ -229,7 +229,7 @@ properties:
                     minItems: 4
                     maxItems: 4
                     description:
-                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      4 half-dBm backoff values (1 - 4 antennas, single spatial
                       stream)
 
                   paths-ofdm-bf:
@@ -238,13 +238,13 @@ properties:
                     maxItems: 4
                     description:
                       4 half-dBm backoff values for beamforming
-                      (1 - 4 antennas, single spacial stream)
+                      (1 - 4 antennas, single spatial stream)
 
                   paths-ru:
                     $ref: /schemas/types.yaml#/definitions/uint8-matrix
                     description:
                       Sets of half-dBm backoff values for 802.11ax rates for
-                      1T1ss (aka 1 transmitting antenna with 1 spacial stream),
+                      1T1ss (aka 1 transmitting antenna with 1 spatial stream),
                       2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss, 4T3ss
                       and 4T4ss.
                       Each set starts with the number of channel bandwidth or
@@ -262,7 +262,7 @@ properties:
                     $ref: /schemas/types.yaml#/definitions/uint8-matrix
                     description:
                       Sets of half-dBm backoff (beamforming) values for 802.11ax
-                      rates for 1T1ss (aka 1 transmitting antenna with 1 spacial
+                      rates for 1T1ss (aka 1 transmitting antenna with 1 spatial
                       stream), 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss,
                       4T3ss and 4T4ss.
                       Each set starts with the number of channel bandwidth or

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
prerequisite-patch-id: 912014811782d33538ddb17f00b64c15b364425e
-- 
2.43.0

