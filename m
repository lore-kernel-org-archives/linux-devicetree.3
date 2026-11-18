Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044619;
	b=tONpLZe2qNHymgp4soWxiiD/nGa9VC/wamqkDKEJN3VE7cnXy4URUO01ex6/7AYY5kgb
	 j20oCJNe10q3xgzwvD2fGaK1szAJN3Mdgd2XsYeJDN5mv+dkSeTtT/9Lf7MH+QoHBt74d
	 yAPTQNZJeRrug4b0bbnDbCBbwkr7bojKNTPvbBmiL/bJ43W+Ijf67Wu2YFOiM2XCY7/XF
	 8cG9XXOXC5G2FefCsbw6MFEmxqo204KRwNVbYTB47KneH90dwA0Zk2qPnF7V/AOG7fc1p
	 8/q78QTjFkls4B+7Z8VPeUPvzTHQOihh1OjoWH8DmiNNZRBdU7Kkkam8/eLFG7KUkig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
	b=fAtF+9yRBR/XpBQ1eZAEqMliG0W4E5h+A0PbKR7G/EImYHDtUsQaehA5cCgQHy30a352
	 JG+lTRvYvDbbw4fiAA6Gctjk07o93X4IZBGsH2UdfVT3c4MBVuG5/M3zi8XSaZMEl8mRY
	 oc1TIcbQylcPJgprxw1mDe2btJUe/EMC5S/BZv2PlTbitiB3uazND8r8K7D2FTtd0b2O1
	 KAqQiOQyXPWMoqKNMN1XaUkLEaLtA7odXrOJJaWPtKEggN++SvgvX4CUodMC+uS4wBZkC
	 CxeUyn/briq3aSwcy8H05mvx4z9ChJFroq1K5sZl7pEZog9myCL5c5BM/p5tNQ0LeOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uhqyq0KB;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA109606A33E
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA109606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uhqyq0KB
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c511cdd5a82so141691166b.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044617; x=1795649417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=uhqyq0KBkoDtob9C8fzfI3Uew91Gj9DbM+1JuzoOTaWpm79PrRq5arv4pQjrrl3LZk
         owMl4WqSCCkKPxdTwlsc/2EJKTJyPA8Sz9ruikraYIzcVLfDuWGMUDLzVm5ye0mTOt+S
         A2ZdsORGqwIFfFuU7BrjAXGtpF8SM90oZNs60pgvantPQM8uUhueKL0uqe1jtbkutU0L
         J0Ld917N87IEOJLy5TOnzLBG6++lFCro82z8q/lCCalsCCAvoIvwM6v8XjbrQewhvUzs
         fxrv2M/J13xYNuCOpCP6M84xJoINHjOKce3e2IKjsLX5QDzVszPLcEvVjuEVVLz8K2oH
         obdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044617; x=1795649417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7C5jMvL4BZCrVCkE7uNmOmEvbc8VSHqIMhSM8aawM+4=;
        b=F5AT/oprS4vZ9FjzCvUOZdy/Evgp6KiaMnYTj0WngmXeFyB18+I5yV5zsezOd31BkO
         iTPA/D4zF/OsY9tyYq2237l/g9kXeqA7Flc2sVavJH/rAFz/WJtCtvRyFLBNB14d20za
         qTjGQfMkaodOJgWckey0C+LDTH1Iu5hQtvHMF2Hmsim1KRuOXbAz9sUm30VnlKIkk4GC
         1RHzXqXBIbjZXvAprr07PGUwHN0f/YWuLu6c/eYplW741OFBwudtvHVmNCp2ZBMLgFIK
         HlIflwJ9ql9tRUo0nXifDGx25Xt3W1uZCinIn+7xXZx4Wv9BmiYCTqAzy/YPeZy0nMTu
         SKiQ==
X-Gm-Message-State: APuU4Z9jxEU6QuSByklyp3ivM8dK8cad6qy5mUmCzYHsTo4bR+OUymem
	kNGmErd8UTjtCb7eENKxVIOjnn9eEr+3jGw0BIqjz77NJCl+fHjqJwo1
X-Gm-Gg: AYBFou3NOXy7/r1XMA4jrU+wM+P0VHjNvD3TvVo1huFdrWVC8fMNo+JYsAD9CW85NKv
	vya4zHfi+Q7ibedAJcsxxh8r/mcT4mPks3ozMmDhjtCRjk0WW+AY9zDkHFm/bZadwI+qjSREXyW
	ArzCTtI4VETbYT8LVy3HBXbkyRWsMYttQkeNgQSwPsv81cAPBEcCDuyK6fdQH0eDD4RId3UNBvv
	R9bmeDAMd1T2oGQEfPTUgPB9iMgMgwAiTrgUTkqgsdblw+zxOF/HxY4rFUMlIatAne7/wEIrOQt
	MwpBSMRaWX/dCZKPUMaTSptSryjOmxajd5mRIcine3Yvyl7WvivmmB1d7hHeRUfiOWhONb1Rb40
	PRQB6q6wgHQwq1jHo3owPqjlbFoAYKJM+hEQJn+npcA2yQdyr1xk9bD5ztnpT9hSavhH2ZvmuNf
	SbWXxdJabaWfecvVgUXO8z9tlqoROmGmHQCfyTIT/qdEBJUiEdz8kCzI4v+upDzxKVwFzrSuEkl
	pyVeUdf5LiUYTT1vigSitVeEq85YXWnCu4au8T7IOF2j+HWMbPrMWVQLPnxEejy3irEkKTmPybY
	rGpPkC9yC/KUzWQWdwMM/XSI+zfhhOvrfns9X4AnQXE=
X-Received: by 2002:a17:907:1611:b0:c41:266:68a7 with SMTP id a640c23a62f3a-c510e22ac27mr381182866b.10.1795044617416;
        Wed, 18 Nov 2026 15:30:17 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:17 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Thu, 19 Nov 2026 04:29:39 +0500
Subject: [PATCH v3 1/4] dt-bindings: arm: rockchip: add Forlinx FET3568-C
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ok3568-c-v3-1-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=1181;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=pPsEz//R/5mbHWtInqzwe95ndZ3s89rfdZjnVNEV7dE=;
 b=JqRsW3Up71ea4lmgiyptHVdI9zefUyJcZhSPDaVQD9V3n0RhfBpSIm3puK58UPdbQDyE6fu+c
 KGx8zjYmXDWCBUePjda/4weNDbAB1rAwqMACrAI4TImu77tHti9PyKo
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FET3568-C is an System on Module made by Forlinx based on Rockchip RK3568.
This SoM used by OK3568-C Board.

FET3568-C features:
- Rockchip RK3568
- DDR4 1/2/4/8 GB
- eMMC 8/16/32/64 GB
- RK809 PMIC

Add devicetree binding for Forlinx FET3568-C SoM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..30a6794861cc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -324,6 +324,13 @@ properties:
           - const: firefly,rk3568-roc-pc
           - const: rockchip,rk3568
 
+      - description: Forlinx FET3568-C SoM
+        items:
+          - enum:
+              - forlinx,ok3568-c
+          - const: forlinx,fet3568-c
+          - const: rockchip,rk3568
+
       - description: Forlinx FET3588-C SoM
         items:
           - enum:

-- 
2.56.0

