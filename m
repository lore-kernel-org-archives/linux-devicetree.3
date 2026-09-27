Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1E4438493
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535160; cv=none; b=L5iHwYw93I+pgLxfrfhj/cvQF0b75L1rmO0gn2tJrxDkA/2hjoehRb/wXmg5bZVaUBItapiyM0Yr2x3qFw9fb1z08msn8EGm1Bs/FFPzYQ/g2ayRpmsnxT+F7gElJ5V0r1ETzl7IeabNPMC12Chs2HBfstIqMKbVmm2sguApdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535160; c=relaxed/simple;
	bh=HeUIDZzk449KX7gatFI/4s8CJnL+sVcLapPU5ie+Nfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdK9LcWCEgEZJlxOvA7/o2akbbx0TfhQmT9nZXcIEtBVjKYTxloISpRYMhvzRQHDg6kfBq2WAw8DqUDhoZ2LKFziCC7XeZoTibaF1iYNyd7ZsVuLSHpsP0AOwYGniAzYKCzUKh3VQy44UD+dbyjqKBpkOzoAaXLdLynWeA4vob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA+uakRY; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA+uakRY"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-466ccde2ad9so1693375fac.1
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535154; x=1791139954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbHMYUvXV7KivNO4nzT7c/gFlgP0cqBHWzvGETsZmKc=;
        b=BA+uakRYCHuOS7M2UKbr7sR8lLk8wFi/HeIWrLrYQdimOmP3h8ZHFnVuWqeqVs0Hqe
         S1cE5jpqrVPvKKiuwVzD+axQouKhnWIPMGBTU4r6F+LGBVp6Pb4UxlnZUxRQvII9YR0n
         wfGe53HxqoHyFBVOcZC1X7sEd4EH+OWH0DZjNa+M/TtoZ/q70xEKYGGFO1Uqy3s7AqPU
         KZvXxcZE+JAo9ikshyaY/IosjGr+GVUi02wwlOV8LXsu318u16avsYaYaKfstx+ZjrWo
         8jJcEOT3Hu2/pIM2K2s/kSgVdCg56I6lwPd68ZuYBnbfHLc2h7+649i33i5KLmBLiRco
         wceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535154; x=1791139954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbHMYUvXV7KivNO4nzT7c/gFlgP0cqBHWzvGETsZmKc=;
        b=zJCPfxV4xdJ46CTHGaH9hoaV0n/E9Bfc+IdobQweBhmpgefAuOFTZ6mESt628XI+vh
         Mu9Js9VG5DhG3rRmr489x2RhwYkRbR2bII2zZ6Mt6V4hTAm6coVbOih24BRnaYD+8LSW
         bNZB7lUXpx/uox/jBfmKWuvtZfZjYEqrEYhimrv1QsbX6KxhNtwgmChytzDvbv6ZqFYN
         x1mLaZ5aFZmbtukr9CMC8abb+09ubpwYaSHaebqtP/L78wIVoGp/vboyUSsa5AapxMoP
         GSbwurVV8/Jj1wjo0KoQQ+9fZDjn467ZJ3T6/ql7gC2+QZ/Q5dQWnAdRY/TeWe4i022+
         u/7g==
X-Forwarded-Encrypted: i=1; AKwUvBwMSs4BjXzblQ6rWBGmtOOus8X/+GL+iHOU3woMRqJZeh4vbGRotpIu8X7FrCrR5Y4+PIEM9M6szk67@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0VJDp4mM6SDy/m1IwHo4HxKjSdQ2CKW10m0xqN28y+MCi+sb3
	OGJsh/yet3W9ehq02xr2I3tGbr/ww9SFFYRxwHZVHbYfmFC1TDp17pRx
X-Gm-Gg: AYBFou2tJNAV972t03mTWpiw0eS+msEygqGAsPYCBpQpBl67foz3FvuI86ZuBfqkF/k
	3Bp2BNxJaG1r7I9T87zk+mznUwkFEyJhfvBt0OsCNLgsdqnAjNZcfGWe/ZmImPE8uNyTsBp7b5n
	vEB71r4RKBBOyevdRKN3CIy3+IlYu08h/nRDfS0ByWs56+eW+fjtBmZXYp6cRNalbJnBEPELhVU
	VyCX/umLt84TQM05GGyEQJQxToV1ka5JXlmJhCECZ+IeehZGJws5Mmo9K8uQYrOfOq5TbCSfnJC
	QqzfoDp5xZJeT1vfbw04vHK/mN7hKVqdpkZxlniXiRZvB1BgGKT8GgHH1sjxXY5IHlLLVIlufNc
	nWWtRypT/oNPE1vI3NIQ83VTi+jDNmr+6V3Qr6NbRxFMTLF2FY+cZYCSLx4bqii4ldexD9gU8xc
	hM8qKYfy0RaS8sSPNJ+ekxpttqcAcyozUyyDYvHThuUFGWRmCgB+PBStM96jXmiD/t/c4n33wMi
	jmQtadHb5js2TBYKdK3/PIeGOtWQ36LbYBGNVIJOJzCiFWx3LHT3XlTE5bvN9/WJH+yu1llA88E
	lcHVV7Ygc3ES0H5vClF1EdDjF3B+ObYD85e3+NIbCTu1j7YAIy9UyQ+xU9+Bup1ONCo0uWmz1Mo
	8/UmP99gsMxbe3VVewy1q9cervXgq0iw=
X-Received: by 2002:a05:6870:9a14:b0:485:d31b:775d with SMTP id 586e51a60fabf-491e55b11c7mr11348983fac.27.1790535154236;
        Sun, 27 Sep 2026 11:52:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 12:52:20 -0600
Subject: [PATCH net-next v6 2/3] dt-bindings: net: allwinner: add H616
 EMAC1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-h616-emac1-v1-v6-2-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..2cae0133b3cd 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index d3e591157faf..2218a492817f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -573,6 +574,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

