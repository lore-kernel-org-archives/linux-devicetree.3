Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840774;
	b=GuVu1xOy4+7bYECS/DYot/zLTE4yLXWkOcEzzAO0g2ogIvg4ndfLUUZzDeVGXrpxp/zl
	 lbVG/eNqWjKjomy4wSacMEQ594xCZg7ynZmb7+W0rPpvjLGRikRRQ3H/tjVe3+qTbiBvc
	 n4VynoNqaGP9iXzjj1G4jCE3xj2BlMXwxEqskV4PsQW4+NxiAekZM1zSPSI8TY6OfQyzu
	 NHwmNfssI0i/mQKAd5dRcYHZ9HwBhuL/Gkm5U0sHgUCGSgTs7m74q6JFhganhFQFn3ojP
	 N2AS95Oy2hrffHTYenuK6+LtEAlID/X1C5x/+hwDSJhge1LvT8j7p8Vq0OugJMq3K0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
	b=SEZfyueQhc+k7gO8hdVZAjhQGFTlFL13FVGVa04GaHJxtz9qrnMbdhJcqdNS2jxOYDPB
	 jU/d9Tor8KHwReA/tDhv8fDFcTY/5VWLMciS/7DSmvgV6Kug2VY8gWGQB1hwDX3GMqfcH
	 7ri6FmNvsKAA19Eqr9d8adV6BS2BEq8fj+6D0LecaIETedosJS5D/SOOSqi4IfZcgPLKj
	 l6pNcGKtNckSfUqkMcaKW5gepPQkd8umAhFkONH6FHiX24Nf9mHhEBBJl3hb0Un/mg8uZ
	 F8aRWNzcv+isFLuF1xIsn5Zddf3Yynr0pRgjSjNCOhzAi+BS11OIvU6AP82TbHz6/sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXHbl2eA;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96784606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96784606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXHbl2eA
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5302821c88.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840774; x=1795445574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=JXHbl2eAJPxkWt+l++ykB67rQRdfT4dR7ea73HpyIH2a0aW0Aexq0JbEJX60h1i4xp
         tolBGgs4g6vV/aF6Nng/KX7bF2zJwaiHsW8v+E4SB4w8ceRJhI8aXufF8LTPNQLFQpBH
         DpRCOeSjvK/wgASIcAs2RB/zYo2drCL0FJ6KmgcaBi1hqwDbe76PqPGWKFa3QqWHgL1Z
         aRr0SfaQRhsmGvqRkLL7TkuNS7xpBTGYsJXOEtIFCNcaQEMDFORP76t+3Sbi99m/EuXp
         HgBOGBJDeA/JPbwIrQsV0B+fQilgpzxTHK6Gi7BubArD0TjRVK6thcG7J+LL1sDZBN//
         Rd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840774; x=1795445574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=iVWdeRWLcXmfOjGnd/mchDbMycaQm4p1adXjteBcsPgaAE2kJ9JNOscRQFxYjXkexK
         /sRITAA5qKJVg1WmYnNuwIL9uoxVoqDimBLClegFYRD4A5dXi1sigy3/lhXL5iH3N/i/
         USENsRGHs8b/0wDBBUcExRLxMPsNucHAUjsB9n+BrqChJEp93fSgdRdlcATi7X6dEeA7
         iYoJ6ZeZZOO/2Sh3NHrZjnm/Ug3Kcv+c73UcY3NW4iZoiBseQqyi0LzftLE5oj5poIFE
         QsyUzJk6Nhny9iMNof1amfPVva/mLe7WkRTFY8eqnjwrueARH6ibZS1xzdzsndYgf0no
         glew==
X-Forwarded-Encrypted: i=1; AL+hErHD+59hYv3j1foS6FOOIzDT5dIGGYnZ9rGMGHtboZXCwI/mj1mSUvP+W9TIysp0v4ZhYIV4V2JH2JA/@vger.kernel.org
X-Gm-Message-State: APuU4Z+kEVRfDeWGGMZO9ZVIENZIbAdjWUHxroVHy9KxE//x5eqXk/BR
	n4u2zdAopjdN2koZLZEzVIN3RJSRglSM5CTAtuOnoACvv2WnnAL9Lskq
X-Gm-Gg: AZFdTZdyImAQmkCsoLCAf2Px3lP3xzBD31Ry/qS46sDZ7xvmKNDQtbDT5YJahUwfq1o
	Btjn+cpC17UbUh5wjMUeIHHuO3ORrB/C84bZMu15Qkgwd2isqbGaTERO0ZeW0L5V9AfWT0p5v1k
	fqE57E4lnkFg4C+fNeIuV6mYVCihAK4XRmB/+T4X87Psaxl7gKhYcuA6lgyfAMwihdgtKKobZtP
	+wPfRw8Fo87Uw8QDfWT3XK+x4+FEe1UxYxslh9CtrO6q1LKr49ROf9cwR4AhS7C9WqiQJ5gJpGt
	Q5cGYfOO9X1mZFtt3a3UGsoqfcnGq483dbfjl94Ij2YuWmw+GTlGpBiaX9wtySB3T8xp1nveNHH
	8fcBYNsHRWNPv/VP1WRr/StVCL/68ZXjz5InpZNJ/jCfwBTmGvZWZx8EmsWZEIQaBzyeyP4F8ii
	kFXIlSwKnXan1TOfYl9fRSpKkcc28w0bZKOAeF2ifEB1ADVD06JVprtqLHTGFRN37DCXC0pG1ts
	i2qnmgpF5sD1cfm0NLOvAdqA430ataTZ+f9E54bBcXHg4FBdfcLhlCUIUnIUj8HrvoJNDcJroCw
	UIhfrtvEEi/XOFlcqCO9BfCH
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9856188eec.0.1794840773662;
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Date: Mon, 16 Nov 2026 21:50:33 +0700
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
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
Message-Id: <20261116-upstream-greatlte-dts-v1-1-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
In-Reply-To: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: nhansp <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0

