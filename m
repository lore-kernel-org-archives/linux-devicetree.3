Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7CD49D583
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716364; cv=none; b=XxP9jS2y4QhyobttCClMV/w4fE8PiYzkjgJ+FyPvOKlp3qGVGiDm5xHrWqSQhbbGSkPQA8iM8rmtmXYBNi6S/jia+FAvyFE2/ZsTbypsvn1OsPRLr4oyJi56bOuFeKgFwIpkxtwSi6fRaUGXJpsUG7Yg9UJl9G59DjXizji7sIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716364; c=relaxed/simple;
	bh=pCk2J+fgptwUO4ZKmoJEpMZTEt2qL0pw+tfe5x+LU3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpHh7lkSSot8Kkk1YyfXYnwrnjLiVuS4EA5Zt5EpPedQ82khGyr78JkFuHCdlrLZDBvzvYQjkdIiJZ2KbMubIrGPHR8HpbKJEaRg2++3wzXQDMymfpMJQQI22yq7z1ZtRLiw2xAmmYhiLlWm9pInRboVJavbRTb/auYrSUBDHPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1890ecV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1890ecV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so2338595e9.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716344; x=1790321144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r05tTilDhW1mEwckTpWxKtNRtIR6JTrQLuNfaUJ+HZk=;
        b=K1890ecVGbPQleJ/P0SbVIRca3Cq1bmFIZRaGbe7atg5XqcjRaWOkW4FzheXCLh1Ay
         /XUxqsM16QYoyXZODrHjHwwCzWFqjqdzKDTxz8vQ/ZOssRBpOPOkJtEzBlDiH3X3xUxX
         SEkd2dQoA/B991B8OkX0IEPvznvwpMVSVLBWFsKzIiqp2/OnN0STVyT7yTVaVAM/javQ
         bauIE39xvpL5+r6GMl3tMeDze6wrGSxLBh7+AXpT7rA1bKxx42U/JG7zD1VEPB3tAFet
         6I5zP/8v8NsJr+w4nJ9bhCZI7Puqz+EDN+G2/8KAgmGlsJWsF3eJKGp1WJCvT3ZucPnz
         li2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716344; x=1790321144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r05tTilDhW1mEwckTpWxKtNRtIR6JTrQLuNfaUJ+HZk=;
        b=vzQrTzGnbrdhyA30lg4PDA8zwvUsx4N2D2pMgkNuQve/Pbl4/Aptx8uHn6WL3Bv8oX
         bLOh+CL6ZwDWE/Zedb8p1UXiMemckB1CIxsvpcBIwTFMYJUtYhOWVbAPqIG14gf3xDzN
         fTqjTots4AHfYrWwwXI/KGtOvFZFaBsVuj2JEsN3QxLsGDyl6f7JautFS0Y5O7iYUIxG
         c48GxF0k0WVkodY2MFeI4bWhp/3wu+40NYdGes59ac7y2UWIh2w6JzDx+jnOaVcKoYHs
         WPb/iKQs1Hu0Rb69JcMzmNmo0Id4dP2nG1Cnhke709RJ7sWG5N77aoEVuBaEnE7jOwhf
         V58w==
X-Gm-Message-State: AFuF++lDJcWc+z2onW2EYLyy/E/XiihANjOheX69oI7L7LQIvPHgz+f1
	mXwkeLy/pLSOqLOBfbiwzVnlJeL81HAmxRscrbapaC7wC0+8obd6rjgTsVglkQseglA=
X-Gm-Gg: AYBFou3u5gTOLiwY82YaGeLJg+7+LADM6oIMUgoKnrTXJMjGMAtFrwSF5lxAfWAXIWG
	34zMewmPDdK6eNRvw16Yj9LGx2PZFL8HzeyYh3rVyDUYdAql0MbiWrIbLEVFYp5BPrSoIfoWq/Z
	ezRUoFqUmp95S16Mjc0yhbI6PqCaNZ/d9rAzx6wETSvuUt/xBhbhsCWNaG6eFcQN51NFCQPjJYU
	KRvIzfjTb3TE69B1zJ4NSBuU7TzahZ+RqQgIJMl+TVeeoSq/QHmFiOxkQ5b+ihJY7ojYIsPMDeT
	Q/5J49CbyZoSOxFBpyulbYXcRpa/WSqc6OMoiJ0q1Wdd1LG9IHOixVT7pP//uqwRiwNHLiwxLXC
	Ax5Tzd443MRCSaFQBUjVklmr9CN5FDlidsOM8j9AJZRpOn0J+Sk+SHgEapUOycOW59XmQB0r+jJ
	m7LhzbAESCjH0XgzPNRq+8rx4XTg6LmJ7nLbStpRjWBj6ahUALo7JBAG/X5SaxItLob57xaAG8b
	Lqln0p3ug1fEQ==
X-Received: by 2002:a05:600c:5489:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49fc573579amr35922575e9.13.1789716344041;
        Fri, 18 Sep 2026 00:25:44 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm139523555e9.6.2026.09.18.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Sep 2026 09:25:37 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add vendor prefix for
 Nexperia B.V.
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-sm8x50-nex10000ub-v1-1-5afe06bace03@linaro.org>
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
In-Reply-To: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pCk2J+fgptwUO4ZKmoJEpMZTEt2qL0pw+tfe5x+LU3Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOd1Jjz+DH6paCzn1qzvrr+PyJ6xL4NrpJvUIwUN
 Nf2nocCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzndQAKCRB33NvayMhJ0ZeqD/
 9th+1lAA58IGfrcp75YdhYNAWOkJceB4fI2cgJgbGfF456B5mHlAQoRDFa1p1+5b4r1qB/wsVRR5Pa
 IC6iN9qr9oqEg2pt7GfQTMN0Sg9VGt9R6zyFV3XpWhR8aJfRiLU17ju+1uFAbNidFOqiQnTxiKY8xZ
 k6Lb8yk9o5xamipkTgrMzPBGEKQ75iFpoiPa/7XSjvaWvy+uapsI+YVsWnupkHHtGoP5Uy7+4yvkym
 ewhYmnlbzoDmgHV5O7+acnZ6cPANw0R/cWmWYz5K09eAFOHS3ZJs3ZIia2kS2nCn79PKxHsivNDB9u
 zD9qgo4yRWFtlR6xibv7JnFMvbC+shmKmlgxq0b1yBQDecMGMYBYnYfOmjjdJIIuhdmJCglUNKmLA/
 pFLOqfjWqQyYqh4ZHNoiku2bGKes5ycfvrDOdK4gZg/Bigcmto8PNE2xF+fJsZAmrqwoM63O1tIgYe
 MbQUqi1HGR48AAIZnLAOfQIQemiDhqc+G6OcCkShzCj6z0NTpqxc/SU640xaaXAXp30srJCNpiAPFK
 kaABxcI6KvSOHGoSL8suD7ljStIYfNOvxdheb8ugFsT9vWaRbhV8Zm4t6P1qVWLLtLxHyvWKFX0slC
 5imtmqOli7lWNUngPPtQD0jOinwYV5vGbmHFOPQ0igLxvhYH/vUxbKizeRmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the vendor prefix for the semiconductor company Nexperia B.V.

The company website is https://www.nexperia.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..9103ced78b91 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1192,6 +1192,8 @@ patternProperties:
     description: New Vision Display (Shenzhen) Co., Ltd.
   "^nexbox,.*":
     description: Nexbox
+  "^nexperia,.*":
+    description: Nexperia B.V.
   "^nextthing,.*":
     description: Next Thing Co.
   "^ni,.*":

-- 
2.34.1

