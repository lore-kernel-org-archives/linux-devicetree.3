Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000863F58C2
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371656; cv=none; b=azXBEtqyw0E7IteDeoQwGQUkAB3fhrz2hWUNLRdcifTt0JeEJjWTwQx0KKLB0yiBPCRFQH2u0xFxZVPgbD+4jpfKFZGK9U6Bi2Nx1kR9sf36VB41OLYYcACH+813Vc16AYR/cjq5vKpqfD5I1g3ts0AQ7kGWb+4EEo6WrtM/baU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371656; c=relaxed/simple;
	bh=srsXNzJOAbaKJRSPzq9UEITvVZMHO1pFgdNgPhoBsC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF5VFib7OLyuz2ijzpbVtW4uUPuxCQ8CkvZox7M97K16VJJ8X3vUvmhtFcTLDyAzPQFLk3HyOXWUde3OsCamQ+QUqC30nMRo82qpxLMFWlklnpEObI2/Ou9df7lkRxXncG7abBVLfoax6PWt6ysOk6h608pCGeWiYDWIXrvW7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtN1Roev; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtN1Roev"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so14114735e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371652; x=1786976452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpPxa3udA+AHKNsx/j88F2vdXh4ZBb+1f0MLnfhs2YU=;
        b=gtN1RoevZNf3ca7Es5ROJH3N1ALhsSy73kB9r2waZ/feMY7/xODt6T031dsZtWimKK
         lqg8sstCbD2RH39e9hh1reCcevTmgrdGizLzKN0+ucnQcLbWYGdfTTF+y3Db8JLFDSmJ
         XVQjMdGLQO5OhQHI7ft6r9xETXCcrw4yccP7iOKznqw6xu9clembPzScd+TXcosoIzdE
         qh62tjWglX5GbEUVBneVOBHjED0O2bfCEjQ7UNfpJnubwwAatmQCX8HIZx+I9ANzIAdx
         OxEVzzC+XIxy7D+h+6zO1QUDhfNryzY8B547zq5OJqQeGkTOwSgNCyiJJTQ8CDxtbWoW
         09sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371652; x=1786976452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpPxa3udA+AHKNsx/j88F2vdXh4ZBb+1f0MLnfhs2YU=;
        b=cjmjXKbrIvMA1TexDpEkOKqRKGfQziiqzTruN4M+KvsQbnPutVzg0yEv05LXwkscNW
         9/La5trPTb5VY1QosZvPpYt+qnOiO9sn3uXD/IhgmdMvlak7K5xql7N0dGnruL3m4m4/
         Sj4EuA+5pxeBljj8OdyUQhcSZiyYwmC2yl6fYtf5hvalK5uoKmibNGkwCkQgQx0oQ46D
         /4y6lMBCuLYp1g17uNKz+PkcXDzKaAOlRonLDIUoM7k34wKk9etNhYcTrTFC+O0rDVnt
         SXU6GAQsJLbr56Im9ic4Z9ysXp7Fs3SkIr0Pn6SgVqjV0zI1t18+wk84pZTfFID2yZNf
         LC0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqdo5W7Lbnnzm4gOM1xVjwLDLh5lkDMcYridMh8Ugw8U/fx4Okzwu7M2xtzv7BNv4qVd7ntLmlB+KOs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7U8c8tAgzhRZd45GEOH03WT40lr6pi3nXNaLeGiCiAt+6gqI8
	YJSPTOFACIiOgiAj89OuhLv72l9sbiA+SHJlFQcnh5LrArDySsCm8wWT
X-Gm-Gg: AR+sD11Zi5GSa1VnDXTo/KXPHrSRKfgYalutkDwcKiEcF3lFlw+txQiPOSYoA2cItHz
	838w0Z3LsAiKo0WjDrw6JLS4FbFBPglUJ+lRq/T8BBD/v+M8mIg0kKKtuZ/Hvlp/yKc83mWKTw5
	nobZW72Xb+ozqng9GxyewpMiXeil1PkbmO7hFUdgg57wopNJFi+xDMJ4V2D44aF58uJp/H7Gxkb
	AD3dUtuFGAeMzy+nVPcHDvy+ACjxs0WGGMx0gnvlZu+oKzpJkaU2G111+suHhU+7pq4K7KBUpKx
	meznnrCGSnvdCuv1ynG8cuRa7Fam1HegY5Su6IDJ6BbB+gYaGpVUjQMT3PzCi+8zG3kyKIBI72n
	UG4gvJyTxY1tjtHeCsbFSytuClEGqojvsX0yeut+EHjvOjXXoCguFxwnBbUTHtKHodgWk2aKf9p
	IqvkvgFc9F8zv4sHcSBTsU1NYzczA+YOcgRD/DPD9EkLJrC8Tywv8y6mfj872Iit7jWjE=
X-Received: by 2002:a05:600c:a44:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-4997279412bmr26841325e9.9.1786371651877;
        Mon, 10 Aug 2026 07:20:51 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:51 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Mon, 10 Aug 2026 16:20:46 +0200
Message-ID: <20260810142047.2811230-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Vybrid Colibri modules are documented on the evaluation board only.
Add the Iris carrier, as the i.MX Colibri modules already have it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 8687631..d58343f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1711,6 +1711,12 @@ properties:
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
+      - description: Toradex Colibri VF50 Module on Iris Carrier Board
+        items:
+          - const: toradex,vf500-colibri_vf50-on-iris
+          - const: toradex,vf500-colibri_vf50
+          - const: fsl,vf500
+
       - description: VF610 based Boards
         items:
           - enum:
@@ -1725,6 +1731,12 @@ properties:
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
+      - description: Toradex Colibri VF61 Module on Iris Carrier Board
+        items:
+          - const: toradex,vf610-colibri_vf61-on-iris
+          - const: toradex,vf610-colibri_vf61
+          - const: fsl,vf610
+
       - description: ZII's VF610 based Boards
         items:
           - enum:
-- 
2.54.0

